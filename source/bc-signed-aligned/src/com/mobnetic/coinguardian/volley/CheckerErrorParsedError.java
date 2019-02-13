package com.mobnetic.coinguardian.volley;

import com.android.volley.ParseError;

public class CheckerErrorParsedError
  extends ParseError
{
  private static final long serialVersionUID = -8541129282633613311L;
  private final String errorMsg;
  
  public CheckerErrorParsedError(String paramString)
  {
    this.errorMsg = paramString;
  }
  
  public String getErrorMsg()
  {
    return this.errorMsg;
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/volley/CheckerErrorParsedError.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */