package com.mobnetic.coinguardian.model.currency;

import com.mobnetic.coinguardian.model.CurrencySubunit;
import com.mobnetic.coinguardian.model.CurrencySubunitsMap;
import java.util.HashMap;

public class CurrenciesSubunits
{
  public static final HashMap<String, CurrencySubunitsMap> CURRENCIES_SUBUNITS = new HashMap();
  
  static
  {
    CURRENCIES_SUBUNITS.put("BTC", new CurrencySubunitsMap(new CurrencySubunit[] { new CurrencySubunit("BTC", 1L), new CurrencySubunit("mBTC", 1000L), new CurrencySubunit("µBTC", 1000000L), new CurrencySubunit("Satoshi", 100000000L, false) }));
    CURRENCIES_SUBUNITS.put("LTC", new CurrencySubunitsMap(new CurrencySubunit[] { new CurrencySubunit("LTC", 1L), new CurrencySubunit("mLTC", 1000L) }));
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/currency/CurrenciesSubunits.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */