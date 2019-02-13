package com.mobnetic.coinguardian.model;

import java.util.LinkedHashMap;

public class CurrencySubunitsMap
  extends LinkedHashMap<Long, CurrencySubunit>
{
  private static final long serialVersionUID = -7219011491064245859L;
  
  public CurrencySubunitsMap(CurrencySubunit... paramVarArgs)
  {
    int i = paramVarArgs.length;
    for (int j = 0; j < i; j++)
    {
      CurrencySubunit localCurrencySubunit = paramVarArgs[j];
      put(Long.valueOf(localCurrencySubunit.subunitToUnit), localCurrencySubunit);
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/CurrencySubunitsMap.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */