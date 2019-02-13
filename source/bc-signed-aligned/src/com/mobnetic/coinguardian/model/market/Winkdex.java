package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.HashMap;
import java.util.LinkedHashMap;
import org.json.JSONObject;

public class Winkdex
  extends Market
{
  private static final HashMap<String, CharSequence[]> CURRENCY_PAIRS = new LinkedHashMap();
  private static final String NAME = "Winkdex";
  private static final String TTS_NAME = "Winkdex";
  private static final String URL = "http://winkdex.com/static/js/stats.js";
  
  static
  {
    CURRENCY_PAIRS.put("BTC", new String[] { "USD" });
  }
  
  public Winkdex()
  {
    super("Winkdex", "Winkdex", CURRENCY_PAIRS);
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return "http://winkdex.com/static/js/stats.js";
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramTicker.vol = paramJSONObject.getDouble("volume_btc_24h");
    paramTicker.high = paramJSONObject.getDouble("winkdex_high_24h");
    paramTicker.low = paramJSONObject.getDouble("winkdex_low_24h");
    paramTicker.last = paramJSONObject.getDouble("winkdex_usd");
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/Winkdex.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */