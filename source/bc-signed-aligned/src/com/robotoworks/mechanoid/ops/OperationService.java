package com.robotoworks.mechanoid.ops;

import android.app.Service;
import android.content.Intent;
import android.os.Binder;
import android.os.Bundle;
import android.os.Handler;
import android.os.IBinder;
import android.os.Message;
import android.os.Messenger;
import android.os.RemoteException;
import android.util.Log;

public abstract class OperationService
  extends Service
{
  protected static final String ACTION_ABORT = "com.robotoworks.mechanoid.op.actions.ABORT";
  public static final String EXTRA_ABORT_REASON = "com.robotoworks.mechanoid.op.extras.ABORT_REASON";
  public static final String EXTRA_BRIDGE_MESSENGER = "com.robotoworks.mechanoid.op.extras.BRIDGE_MESSENGER";
  public static final String EXTRA_IS_ABORTED = "com.robotoworks.mechanoid.op.extras.IS_ABORTED";
  public static final String EXTRA_REQUEST_ID = "com.robotoworks.mechanoid.op.extras.REQUEST_ID";
  public static final String EXTRA_START_ID = "com.robotoworks.mechanoid.op.extras.START_ID";
  private static final int MSG_STOP = 1;
  private IBinder mBinder = new LocalBinder();
  protected final boolean mEnableLogging;
  private Handler mHandler = new Handler()
  {
    public void handleMessage(Message paramAnonymousMessage)
    {
      if (paramAnonymousMessage.what == 1) {
        OperationService.this.stop(paramAnonymousMessage.arg1);
      }
    }
  };
  protected final String mLogTag = getClass().getSimpleName();
  private OperationProcessor mProcessor = createProcessor();
  private boolean mStopped;
  
  public OperationService(boolean paramBoolean)
  {
    this.mEnableLogging = paramBoolean;
  }
  
  private void handleIntent(Intent paramIntent)
  {
    this.mProcessor.execute(paramIntent);
  }
  
  private void sendStopMessage(Intent paramIntent)
  {
    this.mHandler.removeMessages(1);
    int i = paramIntent.getIntExtra("com.robotoworks.mechanoid.op.extras.START_ID", 0);
    this.mHandler.sendMessageDelayed(this.mHandler.obtainMessage(1, i, 0), getIdleStopTime());
  }
  
  private void stop(int paramInt)
  {
    if ((shouldStopOnAllOperationsComplete()) && (stopSelfResult(paramInt)))
    {
      if (this.mEnableLogging) {
        Log.d(this.mLogTag, String.format("[Stopping] startId:%s", new Object[] { Integer.valueOf(paramInt) }));
      }
      this.mStopped = true;
    }
  }
  
  protected abstract OperationProcessor createProcessor();
  
  protected long getIdleStopTime()
  {
    return 10000L;
  }
  
  public boolean isStopped()
  {
    return this.mStopped;
  }
  
  public IBinder onBind(Intent paramIntent)
  {
    return this.mBinder;
  }
  
  public void onDestroy()
  {
    super.onDestroy();
    if (this.mEnableLogging) {
      Log.d(this.mLogTag, "[Destroying]");
    }
    this.mProcessor.quit();
  }
  
  public void onOperationAborted(Intent paramIntent, int paramInt, Bundle paramBundle)
  {
    if (this.mEnableLogging) {
      Log.d(this.mLogTag, String.format("[Operation Aborted] request:%s, reason%s, data:%s", new Object[] { paramIntent, Integer.valueOf(paramInt), paramBundle }));
    }
    Messenger localMessenger = (Messenger)paramIntent.getParcelableExtra("com.robotoworks.mechanoid.op.extras.BRIDGE_MESSENGER");
    Message localMessage = new Message();
    localMessage.what = 4;
    localMessage.arg1 = OperationServiceBridge.getOperationRequestId(paramIntent);
    localMessage.arg2 = paramInt;
    localMessage.setData(paramBundle);
    try
    {
      localMessenger.send(localMessage);
      sendStopMessage(paramIntent);
      return;
    }
    catch (RemoteException paramBundle)
    {
      for (;;)
      {
        if (this.mEnableLogging) {
          Log.e(this.mLogTag, String.format("[Operation Exception] %s", new Object[] { Log.getStackTraceString(paramBundle) }));
        }
      }
    }
  }
  
  public void onOperationComplete(Intent paramIntent, Bundle paramBundle)
  {
    if (this.mEnableLogging) {
      Log.d(this.mLogTag, String.format("[Operation Complete] request:%s, data:%s", new Object[] { paramIntent, paramBundle }));
    }
    Messenger localMessenger = (Messenger)paramIntent.getParcelableExtra("com.robotoworks.mechanoid.op.extras.BRIDGE_MESSENGER");
    Message localMessage = new Message();
    localMessage.what = 2;
    localMessage.arg1 = OperationServiceBridge.getOperationRequestId(paramIntent);
    localMessage.setData(paramBundle);
    try
    {
      localMessenger.send(localMessage);
      sendStopMessage(paramIntent);
      return;
    }
    catch (RemoteException paramBundle)
    {
      for (;;)
      {
        if (this.mEnableLogging) {
          Log.e(this.mLogTag, String.format("[Operation Exception] %s", new Object[] { Log.getStackTraceString(paramBundle) }));
        }
      }
    }
  }
  
  public void onOperationProgress(Intent paramIntent, int paramInt, Bundle paramBundle)
  {
    if (this.mEnableLogging) {
      Log.d(this.mLogTag, String.format("[Operation Progress] request:%s, progress:%s, data:%s", new Object[] { paramIntent, Integer.valueOf(paramInt), paramBundle }));
    }
    Messenger localMessenger = (Messenger)paramIntent.getParcelableExtra("com.robotoworks.mechanoid.op.extras.BRIDGE_MESSENGER");
    Message localMessage = new Message();
    localMessage.what = 3;
    localMessage.arg1 = OperationServiceBridge.getOperationRequestId(paramIntent);
    localMessage.arg2 = paramInt;
    localMessage.setData(paramBundle);
    try
    {
      localMessenger.send(localMessage);
      return;
    }
    catch (RemoteException paramIntent)
    {
      for (;;)
      {
        if (this.mEnableLogging) {
          Log.e(this.mLogTag, String.format("[Operation Exception] %s", new Object[] { Log.getStackTraceString(paramIntent) }));
        }
      }
    }
  }
  
  public void onOperationStarting(Intent paramIntent, Bundle paramBundle)
  {
    if (this.mEnableLogging) {
      Log.d(this.mLogTag, String.format("[Operation Starting] request:%s, data:%s", new Object[] { paramIntent, paramBundle }));
    }
    Messenger localMessenger = (Messenger)paramIntent.getParcelableExtra("com.robotoworks.mechanoid.op.extras.BRIDGE_MESSENGER");
    Message localMessage = new Message();
    localMessage.what = 1;
    localMessage.arg1 = OperationServiceBridge.getOperationRequestId(paramIntent);
    localMessage.setData(paramBundle);
    try
    {
      localMessenger.send(localMessage);
      return;
    }
    catch (RemoteException paramIntent)
    {
      for (;;)
      {
        if (this.mEnableLogging) {
          Log.e(this.mLogTag, String.format("[Operation Exception] %s", new Object[] { Log.getStackTraceString(paramIntent) }));
        }
      }
    }
  }
  
  public int onStartCommand(Intent paramIntent, int paramInt1, int paramInt2)
  {
    if (this.mEnableLogging) {
      Log.d(this.mLogTag, String.format("[Start Command] startId:%s, intent:%s", new Object[] { Integer.valueOf(paramInt2), paramIntent }));
    }
    if (paramIntent != null)
    {
      paramIntent.putExtra("com.robotoworks.mechanoid.op.extras.START_ID", paramInt2);
      handleIntent(paramIntent);
    }
    return 1;
  }
  
  protected boolean shouldStopOnAllOperationsComplete()
  {
    return true;
  }
  
  class LocalBinder
    extends Binder
  {
    LocalBinder() {}
    
    OperationService getService()
    {
      return OperationService.this;
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/robotoworks/mechanoid/ops/OperationService.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */