package com.robotoworks.mechanoid.ops;

public class OperationInstantiationException
  extends RuntimeException
{
  private static final long serialVersionUID = 5994943040895507032L;
  
  public OperationInstantiationException(Throwable paramThrowable)
  {
    initCause(paramThrowable);
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/robotoworks/mechanoid/ops/OperationInstantiationException.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */