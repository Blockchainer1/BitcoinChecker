package com.mobnetic.coinguardian.model;

import java.util.Locale;

public class CheckerInfo
  extends CurrencyPairInfo
{
  protected final int contractType;
  
  public CheckerInfo(String paramString1, String paramString2, String paramString3, int paramInt)
  {
    super(paramString1, paramString2, paramString3);
    this.contractType = paramInt;
  }
  
  public int getContractType()
  {
    return this.contractType;
  }
  
  public String getCurrencyBaseLowerCase()
  {
    return getCurrencyBase().toLowerCase(Locale.US);
  }
  
  public String getCurrencyCounterLowerCase()
  {
    return getCurrencyCounter().toLowerCase(Locale.US);
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/CheckerInfo.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */