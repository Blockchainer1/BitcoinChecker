package com.robotoworks.mechanoid.ops;

import android.content.Intent;

public class Ops
{
  private static OperationServiceBridge mBridge;
  
  public static void abort(int paramInt1, int paramInt2)
  {
    mBridge.abort(paramInt1, paramInt2);
  }
  
  public static void bindListener(OperationServiceListener paramOperationServiceListener)
  {
    mBridge.bindListener(paramOperationServiceListener);
  }
  
  public static int execute(Intent paramIntent)
  {
    return mBridge.execute(paramIntent);
  }
  
  public static OperationLog getLog()
  {
    return mBridge.getLog();
  }
  
  static void init()
  {
    if (mBridge != null) {}
    for (;;)
    {
      return;
      mBridge = new OperationServiceBridge();
    }
  }
  
  public static boolean isOperationPending(int paramInt)
  {
    return mBridge.isOperationPending(paramInt);
  }
  
  public static void pause(boolean paramBoolean)
  {
    mBridge.pause(paramBoolean);
  }
  
  public static void unbindListener(OperationServiceListener paramOperationServiceListener)
  {
    mBridge.unbindListener(paramOperationServiceListener);
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/robotoworks/mechanoid/ops/Ops.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */