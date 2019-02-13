package com.robotoworks.mechanoid.ops;

import android.content.Intent;

public abstract class OperationConfiguration
{
  public abstract Operation createOperation();
  
  public abstract Intent findMatchOnConstraint(OperationServiceBridge paramOperationServiceBridge, Intent paramIntent);
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/robotoworks/mechanoid/ops/OperationConfiguration.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */