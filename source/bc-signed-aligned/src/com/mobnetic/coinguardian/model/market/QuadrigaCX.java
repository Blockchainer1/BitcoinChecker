package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.HashMap;
import java.util.LinkedHashMap;
import org.json.JSONObject;

public class QuadrigaCX
  extends Market
{
  private static final HashMap<String, CharSequence[]> CURRENCY_PAIRS = new LinkedHashMap();
  private static final String NAME = "QuadrigaCX";
  private static final String TTS_NAME = "Quadriga CX";
  private static final String URL = "https://api.quadrigacx.com/v2/ticker?book=%1$s_%2$s";
  
  static
  {
    CURRENCY_PAIRS.put("BCH", new String[] { "CAD" });
    CURRENCY_PAIRS.put("BTC", new String[] { "CAD", "USD" });
    CURRENCY_PAIRS.put("BTG", new String[] { "CAD" });
    CURRENCY_PAIRS.put("ETH", new String[] { "BTC", "CAD" });
    CURRENCY_PAIRS.put("LTC", new String[] { "CAD" });
  }
  
  public QuadrigaCX()
  {
    super("QuadrigaCX", "Quadriga CX", CURRENCY_PAIRS);
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return String.format("https://api.quadrigacx.com/v2/ticker?book=%1$s_%2$s", new Object[] { paramCheckerInfo.getCurrencyBaseLowerCase(), paramCheckerInfo.getCurrencyCounterLowerCase() });
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


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/QuadrigaCX.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */