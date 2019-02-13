package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.HashMap;
import java.util.LinkedHashMap;
import org.json.JSONObject;

public class BtcMarkets
  extends Market
{
  private static final HashMap<String, CharSequence[]> CURRENCY_PAIRS = new LinkedHashMap();
  private static final String NAME = "BtcMarkets.net";
  private static final String TTS_NAME = "BTC Markets net";
  private static final String URL = "https://api.btcmarkets.net/market/%1$s/%2$s/tick";
  
  static
  {
    CURRENCY_PAIRS.put("BTC", new String[] { "AUD" });
    CURRENCY_PAIRS.put("LTC", new String[] { "BTC", "AUD" });
    CURRENCY_PAIRS.put("ETC", new String[] { "BTC", "AUD" });
    CURRENCY_PAIRS.put("ETH", new String[] { "BTC", "AUD" });
    CURRENCY_PAIRS.put("XRP", new String[] { "BTC", "AUD" });
    CURRENCY_PAIRS.put("BCH", new String[] { "BTC", "AUD" });
  }
  
  public BtcMarkets()
  {
    super("BtcMarkets.net", "BTC Markets net", CURRENCY_PAIRS);
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return String.format("https://api.btcmarkets.net/market/%1$s/%2$s/tick", new Object[] { paramCheckerInfo.getCurrencyBase(), paramCheckerInfo.getCurrencyCounter() });
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramTicker.bid = paramJSONObject.getDouble("bestBid");
    paramTicker.ask = paramJSONObject.getDouble("bestAsk");
    paramTicker.last = paramJSONObject.getDouble("lastPrice");
    paramTicker.timestamp = paramJSONObject.getLong("timestamp");
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/BtcMarkets.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */