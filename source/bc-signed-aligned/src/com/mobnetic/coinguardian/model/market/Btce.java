package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.CurrencyPairInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import org.json.JSONArray;
import org.json.JSONObject;

public class Btce
  extends Market
{
  private static final HashMap<String, CharSequence[]> CURRENCY_PAIRS = new LinkedHashMap();
  private static final String NAME = "WEX";
  private static final String TTS_NAME = "WEX";
  private static final String URL = "https://wex.link/api/3/ticker/%1$s";
  private static final String URL_CURRENCY_PAIRS = "https://wex.link/api/3/info";
  
  static
  {
    CURRENCY_PAIRS.put("BTC", new String[] { "USD", "RUR", "EUR" });
    CURRENCY_PAIRS.put("LTC", new String[] { "BTC", "USD", "RUR", "EUR" });
    CURRENCY_PAIRS.put("NMC", new String[] { "BTC", "USD" });
    CURRENCY_PAIRS.put("NVC", new String[] { "BTC", "USD" });
    CURRENCY_PAIRS.put("USD", new String[] { "RUR" });
    CURRENCY_PAIRS.put("EUR", new String[] { "USD", "RUR" });
    CURRENCY_PAIRS.put("PPC", new String[] { "BTC", "USD" });
  }
  
  public Btce()
  {
    super("WEX", "WEX", CURRENCY_PAIRS);
  }
  
  public String getCurrencyPairsUrl(int paramInt)
  {
    return "https://wex.link/api/3/info";
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    String str = paramCheckerInfo.getCurrencyPairId();
    if (paramCheckerInfo.getCurrencyPairId() == null) {
      str = String.format("%1$s_%2$s", new Object[] { paramCheckerInfo.getCurrencyBaseLowerCase(), paramCheckerInfo.getCurrencyCounterLowerCase() });
    }
    return String.format("https://wex.link/api/3/ticker/%1$s", new Object[] { str });
  }
  
  protected void parseCurrencyPairsFromJsonObject(int paramInt, JSONObject paramJSONObject, List<CurrencyPairInfo> paramList)
    throws Exception
  {
    JSONArray localJSONArray = paramJSONObject.getJSONObject("pairs").names();
    paramInt = 0;
    if (paramInt < localJSONArray.length())
    {
      String str = localJSONArray.getString(paramInt);
      if (str == null) {}
      for (;;)
      {
        paramInt++;
        break;
        paramJSONObject = str.split("_");
        if (paramJSONObject.length == 2) {
          paramList.add(new CurrencyPairInfo(paramJSONObject[0].toUpperCase(Locale.ENGLISH), paramJSONObject[1].toUpperCase(Locale.ENGLISH), str));
        }
      }
    }
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramJSONObject = paramJSONObject.getJSONObject(paramJSONObject.names().getString(0));
    paramTicker.bid = paramJSONObject.getDouble("sell");
    paramTicker.ask = paramJSONObject.getDouble("buy");
    paramTicker.vol = paramJSONObject.getDouble("vol");
    paramTicker.high = paramJSONObject.getDouble("high");
    paramTicker.low = paramJSONObject.getDouble("low");
    paramTicker.last = paramJSONObject.getDouble("last");
    paramTicker.timestamp = paramJSONObject.getLong("updated");
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/Btce.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */