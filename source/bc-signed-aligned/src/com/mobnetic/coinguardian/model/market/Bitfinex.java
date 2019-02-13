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

public class Bitfinex
  extends Market
{
  private static final HashMap<String, CharSequence[]> CURRENCY_PAIRS = new LinkedHashMap();
  private static final String NAME = "Bitfinex";
  private static final String TTS_NAME = "Bitfinex";
  private static final String URL = "https://api.bitfinex.com/v1/pubticker/%1$s";
  private static final String URL_CURRENCY_PAIRS = "https://api.bitfinex.com/v1/symbols";
  
  static
  {
    CURRENCY_PAIRS.put("BCC", new String[] { "BTC", "USD" });
    CURRENCY_PAIRS.put("BCH", new String[] { "BTC", "ETH", "USD" });
    CURRENCY_PAIRS.put("BCU", new String[] { "BTC", "USD" });
    CURRENCY_PAIRS.put("BTC", new String[] { "USD" });
    CURRENCY_PAIRS.put("DSH", new String[] { "BTC", "USD" });
    CURRENCY_PAIRS.put("EOS", new String[] { "BTC", "ETH", "USD" });
    CURRENCY_PAIRS.put("ETC", new String[] { "BTC", "USD" });
    CURRENCY_PAIRS.put("ETH", new String[] { "BTC", "USD" });
    CURRENCY_PAIRS.put("IOT", new String[] { "BTC", "ETH", "USD" });
    CURRENCY_PAIRS.put("LTC", new String[] { "BTC", "USD" });
    CURRENCY_PAIRS.put("OMG", new String[] { "BTC", "ETH", "USD" });
    CURRENCY_PAIRS.put("RRT", new String[] { "BTC", "USD" });
    CURRENCY_PAIRS.put("SAN", new String[] { "BTC", "ETH", "USD" });
    CURRENCY_PAIRS.put("XMR", new String[] { "BTC", "USD" });
    CURRENCY_PAIRS.put("XRP", new String[] { "BTC", "USD" });
    CURRENCY_PAIRS.put("ZEC", new String[] { "BTC", "USD" });
  }
  
  public Bitfinex()
  {
    super("Bitfinex", "Bitfinex", CURRENCY_PAIRS);
  }
  
  public String getCurrencyPairsUrl(int paramInt)
  {
    return "https://api.bitfinex.com/v1/symbols";
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    String str1 = paramCheckerInfo.getCurrencyPairId();
    String str2 = str1;
    if (str1 == null) {
      str2 = String.format("%1$s%2$s", new Object[] { paramCheckerInfo.getCurrencyBaseLowerCase(), paramCheckerInfo.getCurrencyCounterLowerCase() });
    }
    return String.format("https://api.bitfinex.com/v1/pubticker/%1$s", new Object[] { str2 });
  }
  
  protected void parseCurrencyPairs(int paramInt, String paramString, List<CurrencyPairInfo> paramList)
    throws Exception
  {
    JSONArray localJSONArray = new JSONArray(paramString);
    for (paramInt = 0; paramInt < localJSONArray.length(); paramInt++)
    {
      paramString = localJSONArray.getString(paramInt);
      if ((paramString != null) && (paramString.length() == 6)) {
        paramList.add(new CurrencyPairInfo(paramString.substring(0, 3).toUpperCase(Locale.US), paramString.substring(3).toUpperCase(Locale.US), paramString));
      }
    }
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramTicker.bid = ParseUtils.getDoubleFromString(paramJSONObject, "bid");
    paramTicker.ask = ParseUtils.getDoubleFromString(paramJSONObject, "ask");
    paramTicker.vol = ParseUtils.getDoubleFromString(paramJSONObject, "volume");
    paramTicker.high = ParseUtils.getDoubleFromString(paramJSONObject, "high");
    paramTicker.low = ParseUtils.getDoubleFromString(paramJSONObject, "low");
    paramTicker.last = ParseUtils.getDoubleFromString(paramJSONObject, "last_price");
    paramTicker.timestamp = ((paramJSONObject.getDouble("timestamp") * 1000.0D));
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/Bitfinex.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */