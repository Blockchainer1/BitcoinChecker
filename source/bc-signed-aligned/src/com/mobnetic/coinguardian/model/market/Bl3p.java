package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.HashMap;
import java.util.LinkedHashMap;
import org.json.JSONObject;

public class Bl3p
  extends Market
{
  private static final HashMap<String, CharSequence[]> CURRENCY_PAIRS = new LinkedHashMap();
  private static final String NAME = "BL3P";
  private static final String TTS_NAME = "BL3P";
  private static final String URL = "https://api.bl3p.eu/1/%1$s%2$s/ticker";
  
  static
  {
    CURRENCY_PAIRS.put("BTC", new String[] { "EUR" });
    CURRENCY_PAIRS.put("LTC", new String[] { "EUR" });
  }
  
  public Bl3p()
  {
    super("BL3P", "BL3P", CURRENCY_PAIRS);
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return String.format("https://api.bl3p.eu/1/%1$s%2$s/ticker", new Object[] { paramCheckerInfo.getCurrencyBase(), paramCheckerInfo.getCurrencyCounter() });
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramTicker.bid = paramJSONObject.getDouble("bid");
    paramTicker.ask = paramJSONObject.getDouble("ask");
    paramTicker.vol = paramJSONObject.getJSONObject("volume").getDouble("24h");
    paramTicker.high = paramJSONObject.getDouble("high");
    paramTicker.low = paramJSONObject.getDouble("low");
    paramTicker.last = paramJSONObject.getDouble("last");
    paramTicker.timestamp = paramJSONObject.getLong("timestamp");
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/Bl3p.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */