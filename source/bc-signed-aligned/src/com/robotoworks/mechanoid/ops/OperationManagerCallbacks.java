package com.robotoworks.mechanoid.ops;

@Deprecated
public abstract interface OperationManagerCallbacks
{
  public abstract void onOperationComplete(int paramInt, OperationResult paramOperationResult, boolean paramBoolean);
  
  public abstract void onOperationPending(int paramInt);
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/robotoworks/mechanoid/ops/OperationManagerCallbacks.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */