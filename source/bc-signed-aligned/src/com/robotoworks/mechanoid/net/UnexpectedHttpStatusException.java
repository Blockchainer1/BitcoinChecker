package com.robotoworks.mechanoid.net;

public class UnexpectedHttpStatusException
  extends RuntimeException
{
  private static final long serialVersionUID = 1L;
  private int mActualStatus;
  private int mExpectedStatus;
  
  public UnexpectedHttpStatusException(int paramInt1, int paramInt2)
  {
    super(String.format("Expected Status %d,  Actual Status %d", new Object[] { Integer.valueOf(paramInt2), Integer.valueOf(paramInt1) }));
    this.mActualStatus = paramInt1;
    this.mExpectedStatus = paramInt2;
  }
  
  public int getActualStatus()
  {
    return this.mActualStatus;
  }
  
  public int getExpectedStatus()
  {
    return this.mExpectedStatus;
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/robotoworks/mechanoid/net/UnexpectedHttpStatusException.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */