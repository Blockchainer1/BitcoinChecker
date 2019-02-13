package com.robotoworks.mechanoid.ops;

import com.robotoworks.mechanoid.internal.util.LruCache;

public class OperationLog
  extends LruCache<Integer, OperationResult>
{
  public OperationLog(int paramInt)
  {
    super(paramInt);
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/robotoworks/mechanoid/ops/OperationLog.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */