package com.robotoworks.mechanoid.ops;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;

public class OperationContext
{
  protected static final int MSG_ABORT = 1;
  Handler handler = new Handler()
  {
    public void handleMessage(Message paramAnonymousMessage)
    {
      if (paramAnonymousMessage.what == 1)
      {
        int i = paramAnonymousMessage.arg1;
        OperationContext.this.abort(i);
      }
    }
  };
  private int mAbortReason;
  private Context mApplicationContext;
  private Intent mIntent;
  private boolean mIsAborted;
  private OperationProcessor mProcessor;
  
  public void abort(int paramInt)
  {
    this.mIsAborted = true;
    this.mAbortReason = paramInt;
  }
  
  public int getAbortReason()
  {
    return this.mAbortReason;
  }
  
  public Context getApplicationContext()
  {
    return this.mApplicationContext;
  }
  
  public Intent getIntent()
  {
    return this.mIntent;
  }
  
  public boolean isAborted()
  {
    return this.mIsAborted;
  }
  
  public void postProgress(int paramInt)
  {
    postProgress(paramInt, null);
  }
  
  public void postProgress(int paramInt, Bundle paramBundle)
  {
    Bundle localBundle = paramBundle;
    if (paramBundle == null) {
      localBundle = new Bundle();
    }
    if (this.mProcessor != null) {
      this.mProcessor.notifyProgress(paramInt, localBundle);
    }
  }
  
  public void reset()
  {
    this.mApplicationContext = null;
    this.mProcessor = null;
    this.mIntent = null;
    this.mIsAborted = false;
    this.mAbortReason = 0;
  }
  
  void setApplicationContext(Context paramContext)
  {
    this.mApplicationContext = paramContext.getApplicationContext();
  }
  
  void setIntent(Intent paramIntent)
  {
    this.mIntent = paramIntent;
  }
  
  void setOperationProcessor(OperationProcessor paramOperationProcessor)
  {
    this.mProcessor = paramOperationProcessor;
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/robotoworks/mechanoid/ops/OperationContext.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */