package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import com.mobnetic.coinguardian.util.ParseUtils;
import java.util.HashMap;
import java.util.LinkedHashMap;
import org.json.JSONObject;

public class Paribu
  extends Market
{
  public static final HashMap<String, CharSequence[]> CURRENCY_PAIRS = new LinkedHashMap();
  public static final String NAME = "Paribu";
  public static final String TTS_NAME = "Paribu";
  public static final String URL = "https://www.paribu.com/ticker";
  
  static
  {
    CURRENCY_PAIRS.put("BTC", new String[] { "TRY" });
  }
  
  public Paribu()
  {
    super("Paribu", "Paribu", CURRENCY_PAIRS);
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return "https://www.paribu.com/ticker";
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramJSONObject = paramJSONObject.getJSONObject("BTC_TL");
    paramTicker.bid = ParseUtils.getDoubleFromString(paramJSONObject, "highestBid");
    paramTicker.ask = ParseUtils.getDoubleFromString(paramJSONObject, "lowestAsk");
    paramTicker.vol = ParseUtils.getDoubleFromString(paramJSONObject, "volume");
    paramTicker.high = ParseUtils.getDoubleFromString(paramJSONObject, "high24hr");
    paramTicker.low = ParseUtils.getDoubleFromString(paramJSONObject, "low24hr");
    paramTicker.last = ParseUtils.getDoubleFromString(paramJSONObject, "last");
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/Paribu.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */