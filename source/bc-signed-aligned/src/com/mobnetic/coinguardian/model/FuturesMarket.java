package com.mobnetic.coinguardian.model;

import java.util.HashMap;

public abstract class FuturesMarket
  extends Market
{
  public final int[] contractTypes;
  
  public FuturesMarket(String paramString1, String paramString2, HashMap<String, CharSequence[]> paramHashMap, int[] paramArrayOfInt)
  {
    super(paramString1, paramString2, paramHashMap);
    this.contractTypes = paramArrayOfInt;
  }
  
  public final String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return getUrl(paramInt, paramCheckerInfo, paramCheckerInfo.getContractType());
  }
  
  protected abstract String getUrl(int paramInt1, CheckerInfo paramCheckerInfo, int paramInt2);
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/FuturesMarket.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */