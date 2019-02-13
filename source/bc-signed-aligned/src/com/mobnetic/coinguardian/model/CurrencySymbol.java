package com.mobnetic.coinguardian.model;

public class CurrencySymbol
{
  public final String symbol;
  public final boolean symbolFirst;
  
  public CurrencySymbol(String paramString)
  {
    this(paramString, false);
  }
  
  public CurrencySymbol(String paramString, boolean paramBoolean)
  {
    this.symbol = paramString;
    this.symbolFirst = paramBoolean;
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/CurrencySymbol.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */