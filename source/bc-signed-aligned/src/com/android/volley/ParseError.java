package com.android.volley;

public class ParseError
  extends VolleyError
{
  public ParseError() {}
  
  public ParseError(NetworkResponse paramNetworkResponse)
  {
    super(paramNetworkResponse);
  }
  
  public ParseError(Throwable paramThrowable)
  {
    super(paramThrowable);
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/android/volley/ParseError.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */