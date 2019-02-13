package com.mobnetic.coinguardian.model;

public class CurrencyPairInfo
  implements Comparable<CurrencyPairInfo>
{
  protected final String currencyBase;
  protected final String currencyCounter;
  protected final String currencyPairId;
  
  public CurrencyPairInfo(String paramString1, String paramString2, String paramString3)
  {
    this.currencyBase = paramString1;
    this.currencyCounter = paramString2;
    this.currencyPairId = paramString3;
  }
  
  public int compareTo(CurrencyPairInfo paramCurrencyPairInfo)
    throws NullPointerException
  {
    if ((this.currencyBase == null) || (paramCurrencyPairInfo.currencyBase == null) || (this.currencyCounter == null) || (paramCurrencyPairInfo.currencyCounter == null)) {
      throw new NullPointerException();
    }
    int i = this.currencyBase.compareToIgnoreCase(paramCurrencyPairInfo.currencyBase);
    if (i != 0) {}
    for (;;)
    {
      return i;
      i = this.currencyCounter.compareToIgnoreCase(paramCurrencyPairInfo.currencyCounter);
    }
  }
  
  public String getCurrencyBase()
  {
    return this.currencyBase;
  }
  
  public String getCurrencyCounter()
  {
    return this.currencyCounter;
  }
  
  public String getCurrencyPairId()
  {
    return this.currencyPairId;
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/CurrencyPairInfo.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */