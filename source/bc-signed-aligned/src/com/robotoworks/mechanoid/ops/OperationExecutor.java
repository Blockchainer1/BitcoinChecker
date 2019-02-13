package com.robotoworks.mechanoid.ops;

import android.content.Intent;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.util.Log;
import java.lang.ref.WeakReference;

public class OperationExecutor
{
  public static final int MODE_ALWAYS = 1;
  public static final int MODE_ONCE = 0;
  public static final int MODE_ON_ERROR = 2;
  private static final String STATE_KEY = "com.robotoworks.mechanoid.ops.OperationExecutor.State";
  private static final String TAG = OperationExecutor.class.getSimpleName();
  private WeakReference<OperationExecutorCallbacks> mCallbacksRef;
  private boolean mEnableLogging;
  private OpInfo mOpInfo;
  private OperationServiceListener mServiceListener = new OperationServiceListener()
  {
    public void onOperationComplete(int paramAnonymousInt, OperationResult paramAnonymousOperationResult)
    {
      if ((OperationExecutor.this.mOpInfo == null) || (OperationExecutor.this.mOpInfo.mId != paramAnonymousInt)) {}
      for (;;)
      {
        return;
        OperationExecutor.this.mOpInfo.mResult = paramAnonymousOperationResult;
        if (OperationExecutor.this.invokeOnOperationComplete(paramAnonymousOperationResult))
        {
          OperationExecutor.this.mOpInfo.mCallbackInvoked = true;
          if (OperationExecutor.this.mEnableLogging) {
            Log.d(OperationExecutor.TAG, String.format("[Operation Complete] key: %s", new Object[] { OperationExecutor.this.mUserStateKey }));
          }
        }
      }
    }
  };
  private String mUserStateKey;
  
  public OperationExecutor(String paramString, Bundle paramBundle, OperationExecutorCallbacks paramOperationExecutorCallbacks)
  {
    this(paramString, paramBundle, paramOperationExecutorCallbacks, false);
  }
  
  public OperationExecutor(String paramString, Bundle paramBundle, OperationExecutorCallbacks paramOperationExecutorCallbacks, boolean paramBoolean)
  {
    this.mUserStateKey = paramString;
    this.mCallbacksRef = new WeakReference(paramOperationExecutorCallbacks);
    this.mEnableLogging = paramBoolean;
    restoreState(paramBundle);
    Ops.bindListener(this.mServiceListener);
    ensureCallbacks();
  }
  
  private void completeOperation()
  {
    if ((this.mOpInfo.mResult != null) && (!this.mOpInfo.mCallbackInvoked) && (invokeOnOperationComplete(this.mOpInfo.mResult)))
    {
      if (this.mEnableLogging) {
        Log.d(TAG, String.format("[Operation Complete] request id: %s, key: %s", new Object[] { Integer.valueOf(this.mOpInfo.mId), this.mUserStateKey }));
      }
      this.mOpInfo.mCallbackInvoked = true;
    }
  }
  
  private void ensureCallbacks()
  {
    if (this.mOpInfo == null) {}
    for (;;)
    {
      return;
      if (this.mOpInfo.mResult != null)
      {
        completeOperation();
      }
      else if (Ops.isOperationPending(this.mOpInfo.mId))
      {
        if (this.mEnableLogging) {
          Log.d(TAG, String.format("[Operation Pending] request id: %s, key: %s", new Object[] { Integer.valueOf(this.mOpInfo.mId), this.mUserStateKey }));
        }
        invokeOnOperationPending();
      }
      else
      {
        OperationResult localOperationResult = (OperationResult)Ops.getLog().get(Integer.valueOf(this.mOpInfo.mId));
        if (localOperationResult == null)
        {
          Log.d(TAG, String.format("[Operation Retry] the log did not contain request id: %s, key: %s, retrying...", new Object[] { Integer.valueOf(this.mOpInfo.mId), this.mUserStateKey }));
          executeOperation(this.mOpInfo.mIntent);
        }
        else
        {
          this.mOpInfo.mResult = localOperationResult;
          completeOperation();
        }
      }
    }
  }
  
  private void restoreState(Bundle paramBundle)
  {
    if (paramBundle != null)
    {
      paramBundle = paramBundle.getBundle("com.robotoworks.mechanoid.ops.OperationExecutor.State");
      if (paramBundle != null)
      {
        paramBundle.setClassLoader(OpInfo.class.getClassLoader());
        this.mOpInfo = ((OpInfo)paramBundle.getParcelable(this.mUserStateKey));
        if (this.mEnableLogging) {
          Log.d(TAG, String.format("[Restoring State] key:%s", new Object[] { this.mUserStateKey }));
        }
      }
    }
  }
  
  public void execute(Intent paramIntent, int paramInt)
  {
    if (paramIntent == null)
    {
      Log.d(TAG, String.format("[Operation Null] operationintent argument was null, key: %s", new Object[] { this.mUserStateKey }));
      return;
    }
    if (paramInt == 1)
    {
      this.mOpInfo = null;
      executeOperation(paramIntent);
    }
    for (;;)
    {
      completeOperation();
      break;
      if (paramInt == 0)
      {
        if (this.mOpInfo == null) {
          executeOperation(paramIntent);
        }
      }
      else if ((paramInt == 2) && ((this.mOpInfo == null) || (isError()))) {
        executeOperation(paramIntent);
      }
    }
  }
  
  protected void executeOperation(Intent paramIntent)
  {
    if (this.mEnableLogging) {
      Log.d(TAG, String.format("[Execute Operation] key: %s", new Object[] { this.mUserStateKey }));
    }
    this.mOpInfo = new OpInfo();
    this.mOpInfo.mIntent = paramIntent;
    invokeOnOperationPending();
    this.mOpInfo.mId = Ops.execute(paramIntent);
  }
  
  public Intent getIntent()
  {
    if (this.mOpInfo == null) {}
    for (Intent localIntent = null;; localIntent = this.mOpInfo.mIntent) {
      return localIntent;
    }
  }
  
  public String getKey()
  {
    return this.mUserStateKey;
  }
  
  public OperationResult getResult()
  {
    if (this.mOpInfo == null) {}
    for (OperationResult localOperationResult = null;; localOperationResult = this.mOpInfo.mResult) {
      return localOperationResult;
    }
  }
  
  protected boolean invokeOnOperationComplete(OperationResult paramOperationResult)
  {
    boolean bool = false;
    if (this.mCallbacksRef == null) {}
    for (;;)
    {
      return bool;
      OperationExecutorCallbacks localOperationExecutorCallbacks = (OperationExecutorCallbacks)this.mCallbacksRef.get();
      if (localOperationExecutorCallbacks != null) {
        bool = localOperationExecutorCallbacks.onOperationComplete(this.mUserStateKey, paramOperationResult);
      }
    }
  }
  
  protected boolean invokeOnOperationPending()
  {
    boolean bool = false;
    if (this.mCallbacksRef == null) {}
    for (;;)
    {
      return bool;
      OperationExecutorCallbacks localOperationExecutorCallbacks = (OperationExecutorCallbacks)this.mCallbacksRef.get();
      if (localOperationExecutorCallbacks != null)
      {
        localOperationExecutorCallbacks.onOperationPending(this.mUserStateKey);
        bool = true;
      }
    }
  }
  
  public boolean isComplete()
  {
    if ((this.mOpInfo != null) && (this.mOpInfo.mCallbackInvoked)) {}
    for (boolean bool = true;; bool = false) {
      return bool;
    }
  }
  
  public boolean isError()
  {
    if ((isComplete()) && (!getResult().isOk())) {}
    for (boolean bool = true;; bool = false) {
      return bool;
    }
  }
  
  public boolean isOk()
  {
    if ((isComplete()) && (getResult().isOk())) {}
    for (boolean bool = true;; bool = false) {
      return bool;
    }
  }
  
  public boolean isPending()
  {
    if ((this.mOpInfo != null) && (this.mOpInfo.mResult == null)) {}
    for (boolean bool = true;; bool = false) {
      return bool;
    }
  }
  
  public void removeCallback()
  {
    this.mCallbacksRef = null;
  }
  
  public void saveState(Bundle paramBundle)
  {
    if (this.mEnableLogging) {
      Log.d(TAG, String.format("[Saving State] key: %s", new Object[] { this.mUserStateKey }));
    }
    Bundle localBundle = new Bundle();
    localBundle.putParcelable(this.mUserStateKey, this.mOpInfo);
    paramBundle.putBundle("com.robotoworks.mechanoid.ops.OperationExecutor.State", localBundle);
  }
  
  public void setCallback(OperationExecutorCallbacks paramOperationExecutorCallbacks)
  {
    this.mCallbacksRef = new WeakReference(paramOperationExecutorCallbacks);
  }
  
  static class OpInfo
    implements Parcelable
  {
    public static final Parcelable.Creator<OpInfo> CREATOR = new Parcelable.Creator()
    {
      public OperationExecutor.OpInfo createFromParcel(Parcel paramAnonymousParcel)
      {
        return new OperationExecutor.OpInfo(paramAnonymousParcel);
      }
      
      public OperationExecutor.OpInfo[] newArray(int paramAnonymousInt)
      {
        return new OperationExecutor.OpInfo[paramAnonymousInt];
      }
    };
    boolean mCallbackInvoked = false;
    int mId = 0;
    public Intent mIntent;
    OperationResult mResult = null;
    
    OpInfo() {}
    
    OpInfo(Parcel paramParcel)
    {
      this.mId = paramParcel.readInt();
      if (paramParcel.readInt() > 0) {
        bool = true;
      }
      this.mCallbackInvoked = bool;
      this.mResult = ((OperationResult)paramParcel.readParcelable(OperationResult.class.getClassLoader()));
      this.mIntent = ((Intent)paramParcel.readParcelable(Intent.class.getClassLoader()));
    }
    
    public int describeContents()
    {
      return 0;
    }
    
    public void writeToParcel(Parcel paramParcel, int paramInt)
    {
      paramParcel.writeInt(this.mId);
      if (this.mCallbackInvoked) {}
      for (paramInt = 1;; paramInt = 0)
      {
        paramParcel.writeInt(paramInt);
        paramParcel.writeParcelable(this.mResult, 0);
        paramParcel.writeParcelable(this.mIntent, 0);
        return;
      }
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/robotoworks/mechanoid/ops/OperationExecutor.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */