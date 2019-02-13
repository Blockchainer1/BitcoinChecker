package com.mobnetic.coinguardian.model;

public class CurrencySubunit
{
  public final boolean allowDecimal;
  public final String name;
  public final long subunitToUnit;
  
  public CurrencySubunit(String paramString, long paramLong)
  {
    this(paramString, paramLong, true);
  }
  
  public CurrencySubunit(String paramString, long paramLong, boolean paramBoolean)
  {
    this.name = paramString;
    this.subunitToUnit = paramLong;
    this.allowDecimal = paramBoolean;
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/CurrencySubunit.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */