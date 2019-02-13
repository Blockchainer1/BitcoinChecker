package com.robotoworks.mechanoid.net;

public class ServiceException
  extends Exception
{
  private static final long serialVersionUID = 1L;
  
  public ServiceException(Throwable paramThrowable)
  {
    initCause(paramThrowable);
  }
  
  public String getMessage()
  {
    return getCause().getMessage();
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/robotoworks/mechanoid/net/ServiceException.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */