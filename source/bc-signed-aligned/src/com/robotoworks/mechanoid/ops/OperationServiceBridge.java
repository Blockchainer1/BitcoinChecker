package com.robotoworks.mechanoid.ops;

import android.app.Service;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.content.pm.ServiceInfo;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.os.Messenger;
import android.util.SparseArray;
import com.robotoworks.mechanoid.Mechanoid;
import com.robotoworks.mechanoid.ReflectUtil;
import com.robotoworks.mechanoid.internal.util.Collections;
import java.lang.reflect.Field;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.Set;
import java.util.WeakHashMap;

public class OperationServiceBridge
{
  public static final int MSG_OPERATION_ABORTED = 4;
  public static final int MSG_OPERATION_COMPLETE = 2;
  public static final int MSG_OPERATION_PROGRESS = 3;
  public static final int MSG_OPERATION_STARTING = 1;
  private Hashtable<String, OperationServiceConfiguration> mConfigurations = new Hashtable();
  private Set<OperationServiceListener> mListeners = Collections.newSetFromMap(new WeakHashMap());
  private OperationLog mLog = new OperationLog(60);
  private boolean mPaused;
  private SparseArray<Intent> mPausedRequests = new SparseArray();
  private SparseArray<Intent> mPendingRequests = new SparseArray();
  private int mRequestIdCounter = 1;
  private Messenger messenger = new Messenger(new Handler()
  {
    public void handleMessage(Message paramAnonymousMessage)
    {
      switch (paramAnonymousMessage.what)
      {
      }
      for (;;)
      {
        return;
        int i = paramAnonymousMessage.arg1;
        paramAnonymousMessage = paramAnonymousMessage.getData();
        OperationServiceBridge.this.onOperationStarting(i, paramAnonymousMessage);
        continue;
        i = paramAnonymousMessage.arg1;
        paramAnonymousMessage = paramAnonymousMessage.getData();
        OperationServiceBridge.this.onOperationComplete(i, paramAnonymousMessage);
        continue;
        i = paramAnonymousMessage.arg1;
        int j = paramAnonymousMessage.arg2;
        paramAnonymousMessage = paramAnonymousMessage.getData();
        OperationServiceBridge.this.onOperationProgress(i, j, paramAnonymousMessage);
        continue;
        j = paramAnonymousMessage.arg1;
        i = paramAnonymousMessage.arg2;
        paramAnonymousMessage = paramAnonymousMessage.getData();
        OperationServiceBridge.this.onOperationAborted(j, i, paramAnonymousMessage);
      }
    }
  });
  
  public OperationServiceBridge()
  {
    initConfigurations();
  }
  
  private int createRequestId()
  {
    int i = this.mRequestIdCounter;
    this.mRequestIdCounter = (i + 1);
    return i;
  }
  
  public static int getOperationRequestId(Intent paramIntent)
  {
    return paramIntent.getIntExtra("com.robotoworks.mechanoid.op.extras.REQUEST_ID", -1);
  }
  
  private void notifyOperationAborted(int paramInt1, Intent paramIntent, int paramInt2, Bundle paramBundle)
  {
    Iterator localIterator = this.mListeners.iterator();
    while (localIterator.hasNext())
    {
      OperationServiceListener localOperationServiceListener = (OperationServiceListener)localIterator.next();
      if (localOperationServiceListener != null) {
        localOperationServiceListener.onOperationAborted(paramInt1, paramIntent, paramInt2, paramBundle);
      }
    }
  }
  
  private void notifyOperationComplete(int paramInt, OperationResult paramOperationResult)
  {
    Iterator localIterator = this.mListeners.iterator();
    while (localIterator.hasNext())
    {
      OperationServiceListener localOperationServiceListener = (OperationServiceListener)localIterator.next();
      if (localOperationServiceListener != null) {
        localOperationServiceListener.onOperationComplete(paramInt, paramOperationResult);
      }
    }
  }
  
  private void notifyOperationProgress(int paramInt1, Intent paramIntent, int paramInt2, Bundle paramBundle)
  {
    Iterator localIterator = this.mListeners.iterator();
    while (localIterator.hasNext())
    {
      OperationServiceListener localOperationServiceListener = (OperationServiceListener)localIterator.next();
      if (localOperationServiceListener != null) {
        localOperationServiceListener.onOperationProgress(paramInt1, paramIntent, paramInt2, paramBundle);
      }
    }
  }
  
  private void notifyOperationStarting(int paramInt, Intent paramIntent, Bundle paramBundle)
  {
    Iterator localIterator = this.mListeners.iterator();
    while (localIterator.hasNext())
    {
      OperationServiceListener localOperationServiceListener = (OperationServiceListener)localIterator.next();
      if (localOperationServiceListener != null) {
        localOperationServiceListener.onOperationStarting(paramInt, paramIntent, paramBundle);
      }
    }
  }
  
  private Intent removePendingRequestById(int paramInt)
  {
    Intent localIntent1 = (Intent)this.mPendingRequests.get(paramInt);
    Object localObject;
    if (localIntent1 != null)
    {
      this.mPendingRequests.delete(paramInt);
      localObject = localIntent1;
    }
    for (;;)
    {
      return (Intent)localObject;
      localObject = localIntent1;
      if (this.mPaused)
      {
        Intent localIntent2 = (Intent)this.mPausedRequests.get(paramInt);
        localObject = localIntent1;
        if (localIntent2 != null)
        {
          this.mPausedRequests.delete(paramInt);
          localObject = localIntent2;
        }
      }
    }
  }
  
  public void abort(int paramInt1, int paramInt2)
  {
    Intent localIntent1 = (Intent)this.mPendingRequests.get(paramInt1);
    if (localIntent1 != null)
    {
      Context localContext = Mechanoid.getApplicationContext();
      Intent localIntent2 = new Intent("com.robotoworks.mechanoid.op.actions.ABORT");
      localIntent2.setClassName(localContext, localIntent1.getComponent().getClassName());
      localIntent2.putExtra("com.robotoworks.mechanoid.op.extras.BRIDGE_MESSENGER", this.messenger);
      localIntent2.putExtra("com.robotoworks.mechanoid.op.extras.REQUEST_ID", paramInt1);
      localIntent2.putExtra("com.robotoworks.mechanoid.op.extras.ABORT_REASON", paramInt2);
      localContext.startService(localIntent2);
    }
    if ((this.mPaused) && ((Intent)this.mPausedRequests.get(paramInt1) != null)) {
      onOperationAborted(paramInt1, paramInt2, new Bundle());
    }
  }
  
  public void bindListener(OperationServiceListener paramOperationServiceListener)
  {
    this.mListeners.add(paramOperationServiceListener);
  }
  
  public int execute(Intent paramIntent)
  {
    Intent localIntent = ((OperationServiceConfiguration)this.mConfigurations.get(paramIntent.getComponent().getClassName())).getOperationConfigurationRegistry().getOperationConfiguration(paramIntent.getAction()).findMatchOnConstraint(this, paramIntent);
    int i;
    if (localIntent != null) {
      i = getOperationRequestId(localIntent);
    }
    for (;;)
    {
      return i;
      paramIntent = (Intent)paramIntent.clone();
      i = createRequestId();
      paramIntent.putExtra("com.robotoworks.mechanoid.op.extras.BRIDGE_MESSENGER", this.messenger);
      paramIntent.putExtra("com.robotoworks.mechanoid.op.extras.REQUEST_ID", i);
      if (this.mPaused)
      {
        this.mPausedRequests.put(i, paramIntent);
      }
      else
      {
        this.mPendingRequests.put(i, paramIntent);
        Mechanoid.startService(paramIntent);
      }
    }
  }
  
  public Intent findPendingRequestByAction(String paramString)
  {
    int i = 0;
    Object localObject;
    if (i < this.mPendingRequests.size())
    {
      localObject = (Intent)this.mPendingRequests.valueAt(i);
      if (!((Intent)localObject).getAction().equals(paramString)) {}
    }
    for (;;)
    {
      return (Intent)localObject;
      i++;
      break;
      if (this.mPaused) {
        for (i = 0;; i++)
        {
          if (i >= this.mPausedRequests.size()) {
            break label98;
          }
          Intent localIntent = (Intent)this.mPausedRequests.valueAt(i);
          localObject = localIntent;
          if (localIntent.getAction().equals(paramString)) {
            break;
          }
        }
      }
      label98:
      localObject = null;
    }
  }
  
  public Intent findPendingRequestByActionWithExtras(String paramString, Bundle paramBundle)
  {
    int i = 0;
    Object localObject;
    if (i < this.mPendingRequests.size())
    {
      localObject = (Intent)this.mPendingRequests.valueAt(i);
      if ((!((Intent)localObject).getAction().equals(paramString)) || (!intentContainsExtras((Intent)localObject, paramBundle))) {}
    }
    for (;;)
    {
      return (Intent)localObject;
      i++;
      break;
      if (this.mPaused) {
        for (i = 0;; i++)
        {
          if (i >= this.mPausedRequests.size()) {
            break label122;
          }
          Intent localIntent = (Intent)this.mPausedRequests.valueAt(i);
          if (localIntent.getAction().equals(paramString))
          {
            localObject = localIntent;
            if (intentContainsExtras(localIntent, paramBundle)) {
              break;
            }
          }
        }
      }
      label122:
      localObject = null;
    }
  }
  
  public OperationLog getLog()
  {
    return this.mLog;
  }
  
  protected void initConfigurations()
  {
    Object localObject1 = Mechanoid.getApplicationContext().getPackageName();
    Object localObject2 = Mechanoid.getApplicationContext().getPackageManager();
    for (;;)
    {
      try
      {
        localObject1 = ((PackageManager)localObject2).getPackageInfo((String)localObject1, 4).services;
        if (localObject1 == null) {
          return;
        }
      }
      catch (PackageManager.NameNotFoundException localNameNotFoundException)
      {
        int i;
        int j;
        Object localObject3;
        continue;
      }
      i = localObject1.length;
      j = 0;
      if (j < i)
      {
        localObject2 = localObject1[j].name;
        localObject2 = ReflectUtil.loadClassSilently(Ops.class.getClassLoader(), (String)localObject2);
        if ((localObject2 != null) && (Service.class.isAssignableFrom((Class)localObject2)))
        {
          localObject3 = ReflectUtil.getFieldSilently((Class)localObject2, "CONFIG");
          if (localObject3 != null)
          {
            localObject3 = (OperationServiceConfiguration)ReflectUtil.getFieldValueSilently((Field)localObject3);
            this.mConfigurations.put(((Class)localObject2).getName(), localObject3);
          }
        }
        j++;
      }
    }
  }
  
  public boolean intentContainsExtras(Intent paramIntent, Bundle paramBundle)
  {
    boolean bool = false;
    Bundle localBundle = paramIntent.getExtras();
    paramIntent = paramBundle.keySet().iterator();
    Object localObject1;
    Object localObject2;
    if (paramIntent.hasNext())
    {
      localObject1 = (String)paramIntent.next();
      localObject2 = paramBundle.get((String)localObject1);
      localObject1 = localBundle.get((String)localObject1);
      if (localObject1 != null) {}
    }
    for (;;)
    {
      return bool;
      if (localObject1.equals(localObject2)) {
        break;
      }
      continue;
      bool = true;
    }
  }
  
  public boolean isOperationPending(int paramInt)
  {
    boolean bool1 = true;
    boolean bool2;
    if (paramInt <= 0) {
      bool2 = false;
    }
    for (;;)
    {
      return bool2;
      if (this.mPaused)
      {
        bool2 = bool1;
        if (this.mPendingRequests.get(paramInt) != null) {}
      }
      else
      {
        bool2 = bool1;
        if (this.mPendingRequests.get(paramInt) == null) {
          bool2 = false;
        }
      }
    }
  }
  
  protected void onOperationAborted(int paramInt1, int paramInt2, Bundle paramBundle)
  {
    Intent localIntent = removePendingRequestById(paramInt1);
    if (localIntent != null) {
      notifyOperationAborted(paramInt1, localIntent, paramInt2, paramBundle);
    }
  }
  
  protected void onOperationComplete(int paramInt, Bundle paramBundle)
  {
    Intent localIntent = removePendingRequestById(paramInt);
    paramBundle = OperationResult.fromBundle(paramBundle);
    if (localIntent != null)
    {
      paramBundle.setRequest(localIntent);
      this.mLog.put(Integer.valueOf(paramInt), paramBundle);
      notifyOperationComplete(paramInt, paramBundle);
    }
  }
  
  protected void onOperationProgress(int paramInt1, int paramInt2, Bundle paramBundle)
  {
    Intent localIntent = (Intent)this.mPendingRequests.get(paramInt1);
    if (localIntent != null) {
      notifyOperationProgress(paramInt1, localIntent, paramInt2, paramBundle);
    }
  }
  
  protected void onOperationStarting(int paramInt, Bundle paramBundle)
  {
    Intent localIntent = (Intent)this.mPendingRequests.get(paramInt);
    if (localIntent != null)
    {
      Bundle localBundle = paramBundle;
      if (paramBundle == null) {
        localBundle = new Bundle();
      }
      notifyOperationStarting(paramInt, localIntent, localBundle);
    }
  }
  
  public void pause(boolean paramBoolean)
  {
    if ((this.mPaused) && (!paramBoolean))
    {
      this.mPaused = false;
      for (int i = 0; i < this.mPausedRequests.size(); i++)
      {
        Intent localIntent = (Intent)this.mPausedRequests.valueAt(i);
        this.mPendingRequests.put(this.mPausedRequests.keyAt(i), localIntent);
        Mechanoid.startService(localIntent);
      }
      this.mPausedRequests.clear();
    }
    this.mPaused = paramBoolean;
  }
  
  public void unbindListener(OperationServiceListener paramOperationServiceListener)
  {
    this.mListeners.remove(paramOperationServiceListener);
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/robotoworks/mechanoid/ops/OperationServiceBridge.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */