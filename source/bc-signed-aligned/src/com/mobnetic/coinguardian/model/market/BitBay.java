package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.HashMap;
import java.util.LinkedHashMap;
import org.json.JSONObject;

public class BitBay
  extends Market
{
  private static final HashMap<String, CharSequence[]> CURRENCY_PAIRS = new LinkedHashMap();
  private static final String NAME = "BitBay.net";
  private static final String TTS_NAME = "Bit Bay";
  private static final String URL = "https://bitbay.net/API/Public/%1$s%2$s/ticker.json";
  
  static
  {
    CURRENCY_PAIRS.put("BCC", new String[] { "BTC", "PLN", "USD", "EUR" });
    CURRENCY_PAIRS.put("BTC", new String[] { "PLN", "USD", "EUR" });
    CURRENCY_PAIRS.put("DASH", new String[] { "BTC", "PLN", "USD", "EUR" });
    CURRENCY_PAIRS.put("GAME", new String[] { "BTC", "PLN", "USD", "EUR" });
    CURRENCY_PAIRS.put("LTC", new String[] { "BTC", "PLN", "USD", "EUR" });
    CURRENCY_PAIRS.put("ETH", new String[] { "BTC", "PLN", "USD", "EUR" });
    CURRENCY_PAIRS.put("LSK", new String[] { "BTC", "PLN", "USD", "EUR" });
  }
  
  public BitBay()
  {
    super("BitBay.net", "Bit Bay", CURRENCY_PAIRS);
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return String.format("https://bitbay.net/API/Public/%1$s%2$s/ticker.json", new Object[] { paramCheckerInfo.getCurrencyBase(), paramCheckerInfo.getCurrencyCounter() });
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramTicker.bid = paramJSONObject.getDouble("bid");
    paramTicker.ask = paramJSONObject.getDouble("ask");
    paramTicker.vol = paramJSONObject.getDouble("volume");
    paramTicker.high = paramJSONObject.getDouble("max");
    paramTicker.low = paramJSONObject.getDouble("min");
    paramTicker.last = paramJSONObject.getDouble("last");
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/BitBay.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */