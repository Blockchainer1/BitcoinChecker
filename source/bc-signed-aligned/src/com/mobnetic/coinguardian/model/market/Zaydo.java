package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import com.mobnetic.coinguardian.util.ParseUtils;
import java.util.HashMap;
import java.util.LinkedHashMap;
import org.json.JSONObject;

public class Zaydo
  extends Market
{
  private static final HashMap<String, CharSequence[]> CURRENCY_PAIRS = new LinkedHashMap();
  private static final String NAME = "Zaydo";
  private static final String TTS_NAME = "Zaydo";
  private static final String URL = "http://chart.zyado.com/ticker.json";
  
  static
  {
    CURRENCY_PAIRS.put("BTC", new String[] { "EUR" });
  }
  
  public Zaydo()
  {
    super("Zaydo", "Zaydo", CURRENCY_PAIRS);
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return "http://chart.zyado.com/ticker.json";
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramTicker.bid = ParseUtils.getDoubleFromString(paramJSONObject, "bid");
    paramTicker.ask = ParseUtils.getDoubleFromString(paramJSONObject, "ask");
    paramTicker.vol = ParseUtils.getDoubleFromString(paramJSONObject, "volume");
    paramTicker.high = ParseUtils.getDoubleFromString(paramJSONObject, "high");
    paramTicker.low = ParseUtils.getDoubleFromString(paramJSONObject, "low");
    paramTicker.last = ParseUtils.getDoubleFromString(paramJSONObject, "last");
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/Zaydo.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */