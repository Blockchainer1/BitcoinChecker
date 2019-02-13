package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.CurrencyPairInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import com.mobnetic.coinguardian.util.ParseUtils;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import org.json.JSONArray;
import org.json.JSONObject;

public class Bitso
  extends Market
{
  private static final HashMap<String, CharSequence[]> CURRENCY_PAIRS = new LinkedHashMap();
  private static final String NAME = "Bitso";
  private static final String TTS_NAME = "Bitso";
  private static final String URL = "https://api.bitso.com/public/info";
  
  static
  {
    CURRENCY_PAIRS.put("BTC", new String[] { "MXN" });
    CURRENCY_PAIRS.put("ETH", new String[] { "BTC", "MXN" });
    CURRENCY_PAIRS.put("XRP", new String[] { "BTC", "MXN" });
    CURRENCY_PAIRS.put("BCH", new String[] { "BTC" });
    CURRENCY_PAIRS.put("LTC", new String[] { "BTC", "MXN" });
  }
  
  public Bitso()
  {
    super("Bitso", "Bitso", CURRENCY_PAIRS);
  }
  
  public String getCurrencyPairsUrl(int paramInt)
  {
    return "https://api.bitso.com/public/info";
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return "https://api.bitso.com/public/info";
  }
  
  protected void parseCurrencyPairsFromJsonObject(int paramInt, JSONObject paramJSONObject, List<CurrencyPairInfo> paramList)
    throws Exception
  {
    JSONArray localJSONArray = paramJSONObject.names();
    paramInt = 0;
    if (paramInt < localJSONArray.length())
    {
      paramJSONObject = localJSONArray.getString(paramInt);
      if (paramJSONObject == null) {}
      for (;;)
      {
        paramInt++;
        break;
        String[] arrayOfString = paramJSONObject.split("_");
        if (arrayOfString.length == 2) {
          paramList.add(new CurrencyPairInfo(arrayOfString[0].toUpperCase(Locale.US), arrayOfString[1].toUpperCase(Locale.US), paramJSONObject));
        }
      }
    }
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    String str1 = paramCheckerInfo.getCurrencyPairId();
    String str2 = str1;
    if (str1 == null) {
      str2 = paramCheckerInfo.getCurrencyBaseLowerCase() + "_" + paramCheckerInfo.getCurrencyCounterLowerCase();
    }
    paramJSONObject = paramJSONObject.getJSONObject(str2);
    paramTicker.bid = ParseUtils.getDoubleFromString(paramJSONObject, "buy");
    paramTicker.ask = ParseUtils.getDoubleFromString(paramJSONObject, "sell");
    paramTicker.vol = ParseUtils.getDoubleFromString(paramJSONObject, "volume");
    paramTicker.last = ParseUtils.getDoubleFromString(paramJSONObject, "rate");
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/Bitso.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */