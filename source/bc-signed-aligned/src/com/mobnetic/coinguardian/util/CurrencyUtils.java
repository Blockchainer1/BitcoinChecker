package com.mobnetic.coinguardian.util;

import com.mobnetic.coinguardian.model.CurrencySubunit;
import com.mobnetic.coinguardian.model.CurrencySubunitsMap;
import com.mobnetic.coinguardian.model.currency.CurrenciesSubunits;
import com.mobnetic.coinguardian.model.currency.CurrencySymbols;
import java.util.HashMap;

public class CurrencyUtils
{
  public static CurrencySubunit getCurrencySubunit(String paramString, long paramLong)
  {
    CurrencySubunitsMap localCurrencySubunitsMap;
    if (CurrenciesSubunits.CURRENCIES_SUBUNITS.containsKey(paramString))
    {
      localCurrencySubunitsMap = (CurrencySubunitsMap)CurrenciesSubunits.CURRENCIES_SUBUNITS.get(paramString);
      if (!localCurrencySubunitsMap.containsKey(Long.valueOf(paramLong))) {}
    }
    for (paramString = (CurrencySubunit)localCurrencySubunitsMap.get(Long.valueOf(paramLong));; paramString = new CurrencySubunit(paramString, 1L)) {
      return paramString;
    }
  }
  
  public static String getCurrencySymbol(String paramString)
  {
    if (CurrencySymbols.CURRENCY_SYMBOLS.containsKey(paramString)) {
      paramString = (String)CurrencySymbols.CURRENCY_SYMBOLS.get(paramString);
    }
    for (;;)
    {
      return paramString;
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/util/CurrencyUtils.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */