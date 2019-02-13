package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.HashMap;
import java.util.LinkedHashMap;
import org.json.JSONObject;

public class Bitstamp
  extends Market
{
  private static final HashMap<String, CharSequence[]> CURRENCY_PAIRS = new LinkedHashMap();
  private static final String NAME = "Bitstamp";
  private static final String TTS_NAME = "Bitstamp";
  private static final String URL = "https://www.bitstamp.net/api/v2/ticker/%1$s%2$s";
  
  static
  {
    CURRENCY_PAIRS.put("BTC", new String[] { "EUR", "USD" });
    CURRENCY_PAIRS.put("BCH", new String[] { "BTC", "EUR", "USD" });
    CURRENCY_PAIRS.put("EUR", new String[] { "USD" });
    CURRENCY_PAIRS.put("ETH", new String[] { "BTC", "EUR", "USD" });
    CURRENCY_PAIRS.put("LTC", new String[] { "BTC", "EUR", "USD" });
    CURRENCY_PAIRS.put("XRP", new String[] { "BTC", "EUR", "USD" });
  }
  
  public Bitstamp()
  {
    super("Bitstamp", "Bitstamp", CURRENCY_PAIRS);
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return String.format("https://www.bitstamp.net/api/v2/ticker/%1$s%2$s", new Object[] { paramCheckerInfo.getCurrencyBaseLowerCase(), paramCheckerInfo.getCurrencyCounterLowerCase() });
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramTicker.bid = paramJSONObject.getDouble("bid");
    paramTicker.ask = paramJSONObject.getDouble("ask");
    paramTicker.vol = paramJSONObject.getDouble("volume");
    paramTicker.high = paramJSONObject.getDouble("high");
    paramTicker.low = paramJSONObject.getDouble("low");
    paramTicker.last = paramJSONObject.getDouble("last");
    paramTicker.timestamp = paramJSONObject.getLong("timestamp");
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/Bitstamp.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */