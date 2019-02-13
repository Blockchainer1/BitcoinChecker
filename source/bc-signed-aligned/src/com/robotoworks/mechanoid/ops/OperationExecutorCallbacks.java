package com.robotoworks.mechanoid.ops;

public abstract interface OperationExecutorCallbacks
{
  public abstract boolean onOperationComplete(String paramString, OperationResult paramOperationResult);
  
  public abstract void onOperationPending(String paramString);
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/robotoworks/mechanoid/ops/OperationExecutorCallbacks.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */