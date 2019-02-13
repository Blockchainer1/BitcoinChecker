package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.HashMap;
import java.util.LinkedHashMap;
import org.json.JSONObject;

public class BitMaszyna
  extends Market
{
  private static final HashMap<String, CharSequence[]> CURRENCY_PAIRS = new LinkedHashMap();
  private static final String NAME = "BitMaszyna.pl";
  private static final String TTS_NAME = "Bit Maszyna";
  private static final String URL = "https://bitmaszyna.pl/api/%1$s%2$s/ticker.json";
  
  static
  {
    CURRENCY_PAIRS.put("BTC", new String[] { "PLN" });
    CURRENCY_PAIRS.put("LTC", new String[] { "PLN" });
  }
  
  public BitMaszyna()
  {
    super("BitMaszyna.pl", "Bit Maszyna", CURRENCY_PAIRS);
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return String.format("https://bitmaszyna.pl/api/%1$s%2$s/ticker.json", new Object[] { paramCheckerInfo.getCurrencyBase(), paramCheckerInfo.getCurrencyCounter() });
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramTicker.bid = paramJSONObject.getDouble("bid");
    paramTicker.ask = paramJSONObject.getDouble("ask");
    paramTicker.vol = paramJSONObject.getDouble("volume1");
    paramTicker.high = paramJSONObject.getDouble("high");
    paramTicker.low = paramJSONObject.getDouble("low");
    paramTicker.last = paramJSONObject.getDouble("last");
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/BitMaszyna.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */