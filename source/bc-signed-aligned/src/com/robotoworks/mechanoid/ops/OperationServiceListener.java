package com.robotoworks.mechanoid.ops;

import android.content.Intent;
import android.os.Bundle;

public abstract class OperationServiceListener
{
  public void onOperationAborted(int paramInt1, Intent paramIntent, int paramInt2, Bundle paramBundle) {}
  
  public abstract void onOperationComplete(int paramInt, OperationResult paramOperationResult);
  
  public void onOperationProgress(int paramInt1, Intent paramIntent, int paramInt2, Bundle paramBundle) {}
  
  public void onOperationStarting(int paramInt, Intent paramIntent, Bundle paramBundle) {}
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/robotoworks/mechanoid/ops/OperationServiceListener.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */