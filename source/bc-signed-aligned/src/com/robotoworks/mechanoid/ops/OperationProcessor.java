package com.robotoworks.mechanoid.ops;

import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Message;
import android.util.Log;
import java.util.LinkedList;

public abstract class OperationProcessor
{
  protected static final int MSG_OPERATION_ABORTED = 4;
  protected static final int MSG_OPERATION_COMPLETE = 2;
  protected static final int MSG_OPERATION_PROGRESS = 3;
  protected static final int MSG_OPERATION_STARTING = 1;
  protected static final int MSG_WORKER_READY = 5;
  private Handler handler = new Handler()
  {
    public void handleMessage(Message paramAnonymousMessage)
    {
      switch (paramAnonymousMessage.what)
      {
      }
      for (;;)
      {
        return;
        OperationProcessor.access$002(OperationProcessor.this, true);
        OperationProcessor.this.executePendingOperations();
        continue;
        if (OperationProcessor.this.mEnableLogging) {
          Log.d(OperationProcessor.this.mLogTag, String.format("[Handle Operation Starting] intent:%s", new Object[] { OperationProcessor.this.mCurrentRequest }));
        }
        OperationProcessor.this.mService.onOperationStarting(OperationProcessor.this.mCurrentRequest, paramAnonymousMessage.getData());
        continue;
        if (OperationProcessor.this.mEnableLogging) {
          Log.d(OperationProcessor.this.mLogTag, String.format("[Handle Operation Complete] intent:%s", new Object[] { OperationProcessor.this.mCurrentRequest }));
        }
        OperationProcessor.access$402(OperationProcessor.this, null);
        OperationProcessor.this.mService.onOperationComplete(OperationProcessor.this.mCurrentRequest, paramAnonymousMessage.getData());
        OperationProcessor.this.executePendingOperations();
        continue;
        if (OperationProcessor.this.mEnableLogging) {
          Log.d(OperationProcessor.this.mLogTag, String.format("[Handle Operation Aborted] intent:%s", new Object[] { OperationProcessor.this.mCurrentRequest }));
        }
        OperationProcessor.access$402(OperationProcessor.this, null);
        OperationProcessor.this.mService.onOperationAborted(OperationProcessor.this.mCurrentRequest, paramAnonymousMessage.arg1, paramAnonymousMessage.getData());
        OperationProcessor.this.executePendingOperations();
        continue;
        if (OperationProcessor.this.mEnableLogging) {
          Log.d(OperationProcessor.this.mLogTag, String.format("[Handle Operation Progress] intent:%s", new Object[] { OperationProcessor.this.mCurrentRequest }));
        }
        OperationProcessor.this.mService.onOperationProgress(OperationProcessor.this.mCurrentRequest, paramAnonymousMessage.arg1, paramAnonymousMessage.getData());
      }
    }
  };
  private OperationContext mContext;
  private Operation mCurrentOperation;
  private Intent mCurrentRequest;
  protected final boolean mEnableLogging;
  protected final String mLogTag;
  private final OperationService mService;
  private Worker mWorker;
  private boolean mWorkerReady;
  private LinkedList<Intent> requestQueue = new LinkedList();
  
  public OperationProcessor(OperationService paramOperationService, boolean paramBoolean)
  {
    this.mService = paramOperationService;
    this.mLogTag = getClass().getSimpleName();
    this.mEnableLogging = paramBoolean;
    this.mContext = new OperationContext();
    this.mWorker = new Worker(this.handler);
    this.mWorker.start();
  }
  
  private void abortOperation(int paramInt1, int paramInt2)
  {
    if (this.mEnableLogging) {
      Log.d(this.mLogTag, String.format("[Aborting] id:%s, reason:%s", new Object[] { Integer.valueOf(paramInt1), Integer.valueOf(paramInt2) }));
    }
    if ((this.mCurrentOperation != null) && (OperationServiceBridge.getOperationRequestId(this.mCurrentRequest) == paramInt1))
    {
      Message localMessage = this.mContext.handler.obtainMessage(1, paramInt2, 0);
      this.mContext.handler.sendMessage(localMessage);
    }
    for (;;)
    {
      return;
      tryFlagQueuedOperationAsAborted(paramInt1, paramInt2);
    }
  }
  
  private void executeOperation(Intent paramIntent)
  {
    if (this.mEnableLogging) {
      Log.d(this.mLogTag, String.format("[Execute Operation] intent:%s", new Object[] { paramIntent }));
    }
    if (paramIntent.getBooleanExtra("com.robotoworks.mechanoid.op.extras.IS_ABORTED", false))
    {
      int i = paramIntent.getIntExtra("com.robotoworks.mechanoid.op.extras.ABORT_REASON", 0);
      this.mService.onOperationAborted(paramIntent, i, new Bundle());
      executePendingOperations();
    }
    for (;;)
    {
      return;
      this.mCurrentRequest = paramIntent;
      this.mCurrentOperation = createOperation(paramIntent.getAction());
      if (this.mCurrentOperation == null) {
        throw new RuntimeException(paramIntent.getAction() + " Not Implemented");
      }
      this.mContext.reset();
      this.mContext.setApplicationContext(this.mService.getApplicationContext());
      this.mContext.setIntent(paramIntent);
      this.mContext.setOperationProcessor(this);
      this.mWorker.post(new OperationRunnable(this.handler, this.mContext, this.mCurrentOperation, this.mEnableLogging, this.mLogTag));
    }
  }
  
  private void executePendingOperations()
  {
    if (!this.mWorkerReady) {
      Log.d(this.mLogTag, "[Waiting on Worker]");
    }
    for (;;)
    {
      return;
      if (this.mCurrentOperation == null)
      {
        if (this.mEnableLogging) {
          Log.d(this.mLogTag, "[Executing Pending]");
        }
        Intent localIntent = (Intent)this.requestQueue.poll();
        if (localIntent != null) {
          executeOperation(localIntent);
        }
      }
    }
  }
  
  private void tryFlagQueuedOperationAsAborted(int paramInt1, int paramInt2)
  {
    for (int i = 0;; i++) {
      if (i < this.requestQueue.size())
      {
        Intent localIntent = (Intent)this.requestQueue.get(i);
        if (OperationServiceBridge.getOperationRequestId(localIntent) == paramInt1)
        {
          localIntent.putExtra("com.robotoworks.mechanoid.op.extras.IS_ABORTED", true);
          localIntent.putExtra("com.robotoworks.mechanoid.op.extras.ABORT_REASON", paramInt2);
        }
      }
      else
      {
        return;
      }
    }
  }
  
  protected abstract Operation createOperation(String paramString);
  
  public void execute(Intent paramIntent)
  {
    if (this.mEnableLogging) {
      Log.d(this.mLogTag, String.format("[Execute (Queue)] intent:%s", new Object[] { paramIntent }));
    }
    if (paramIntent.getAction().equals("com.robotoworks.mechanoid.op.actions.ABORT")) {
      abortOperation(paramIntent.getIntExtra("com.robotoworks.mechanoid.op.extras.REQUEST_ID", 0), paramIntent.getIntExtra("com.robotoworks.mechanoid.op.extras.ABORT_REASON", 0));
    }
    for (;;)
    {
      return;
      this.requestQueue.offer(paramIntent);
      executePendingOperations();
    }
  }
  
  public boolean hasPendingOperations()
  {
    if (this.requestQueue.size() > 0) {}
    for (boolean bool = true;; bool = false) {
      return bool;
    }
  }
  
  protected void notifyProgress(int paramInt, Bundle paramBundle)
  {
    Message localMessage = this.handler.obtainMessage(3);
    localMessage.arg1 = paramInt;
    localMessage.setData(paramBundle);
    this.handler.sendMessage(localMessage);
  }
  
  public void quit()
  {
    if (this.mEnableLogging) {
      Log.d(this.mLogTag, "[Quit]");
    }
    for (;;)
    {
      Intent localIntent = (Intent)this.requestQueue.poll();
      if (localIntent == null) {
        break;
      }
      OperationResult localOperationResult = OperationResult.error(new OperationServiceStoppedException());
      this.mService.onOperationComplete(localIntent, localOperationResult.toBundle());
    }
    this.mWorker.quit();
  }
  
  static class OperationRunnable
    implements Runnable
  {
    private Handler mCallbackHandler;
    private boolean mEnableLogging;
    private String mLogTag;
    private Operation mOperation;
    private OperationContext mOperationContext;
    
    public OperationRunnable(Handler paramHandler, OperationContext paramOperationContext, Operation paramOperation, boolean paramBoolean, String paramString)
    {
      this.mCallbackHandler = paramHandler;
      this.mOperation = paramOperation;
      this.mEnableLogging = paramBoolean;
      this.mOperationContext = paramOperationContext;
      this.mLogTag = paramString;
    }
    
    public void run()
    {
      Object localObject1 = this.mCallbackHandler.obtainMessage(1);
      this.mCallbackHandler.sendMessage((Message)localObject1);
      Object localObject2;
      try
      {
        localObject1 = this.mOperation.execute(this.mOperationContext);
        if (localObject1 != null) {
          break label135;
        }
        localObject1 = new java/lang/NullPointerException;
        ((NullPointerException)localObject1).<init>("OperationResult should not be null");
        throw ((Throwable)localObject1);
      }
      catch (Exception localException)
      {
        localObject2 = OperationResult.error(localException).toBundle();
        localObject1 = localObject2;
        if (this.mEnableLogging)
        {
          Log.e(this.mLogTag, String.format("[Operation Error] %s", new Object[] { Log.getStackTraceString(localException) }));
          localObject1 = localObject2;
        }
      }
      if (this.mOperationContext.isAborted())
      {
        localObject2 = this.mCallbackHandler.obtainMessage(4);
        ((Message)localObject2).arg1 = this.mOperationContext.getAbortReason();
      }
      for (;;)
      {
        ((Message)localObject2).setData((Bundle)localObject1);
        this.mCallbackHandler.sendMessage((Message)localObject2);
        return;
        label135:
        localObject1 = ((OperationResult)localObject1).toBundle();
        break;
        localObject2 = this.mCallbackHandler.obtainMessage(2);
      }
    }
  }
  
  static class Worker
    extends HandlerThread
  {
    private Handler mProcessorHandler;
    private Handler mWorkerHandler;
    
    public Worker(Handler paramHandler)
    {
      super(10);
      this.mProcessorHandler = paramHandler;
    }
    
    protected void onLooperPrepared()
    {
      super.onLooperPrepared();
      this.mWorkerHandler = new Handler();
      this.mProcessorHandler.sendEmptyMessage(5);
    }
    
    public void post(Runnable paramRunnable)
    {
      this.mWorkerHandler.post(paramRunnable);
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/robotoworks/mechanoid/ops/OperationProcessor.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */