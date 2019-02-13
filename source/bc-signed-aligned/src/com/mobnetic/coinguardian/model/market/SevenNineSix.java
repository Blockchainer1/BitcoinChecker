package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import com.mobnetic.coinguardian.util.ParseUtils;
import java.util.HashMap;
import java.util.LinkedHashMap;
import org.json.JSONObject;

public class SevenNineSix
  extends Market
{
  private static final HashMap<String, CharSequence[]> CURRENCY_PAIRS = new LinkedHashMap();
  private static final String NAME = "796";
  private static final String TTS_NAME = "796";
  private static final String URL_BTC = "http://api.796.com/v3/futures/ticker.html?type=weekly";
  private static final String URL_LTC = "http://api.796.com/v3/futures/ticker.html?type=ltc";
  
  static
  {
    CURRENCY_PAIRS.put("BTC", new String[] { "USD" });
    CURRENCY_PAIRS.put("LTC", new String[] { "USD" });
  }
  
  public SevenNineSix()
  {
    super("796", "796", CURRENCY_PAIRS);
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    if ("LTC".equals(paramCheckerInfo.getCurrencyBase())) {}
    for (paramCheckerInfo = "http://api.796.com/v3/futures/ticker.html?type=ltc";; paramCheckerInfo = "http://api.796.com/v3/futures/ticker.html?type=weekly") {
      return paramCheckerInfo;
    }
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramJSONObject = paramJSONObject.getJSONObject("ticker");
    paramTicker.bid = ParseUtils.getDoubleFromString(paramJSONObject, "buy");
    paramTicker.ask = ParseUtils.getDoubleFromString(paramJSONObject, "sell");
    paramTicker.vol = ParseUtils.getDoubleFromString(paramJSONObject, "vol");
    paramTicker.high = ParseUtils.getDoubleFromString(paramJSONObject, "high");
    paramTicker.low = ParseUtils.getDoubleFromString(paramJSONObject, "low");
    paramTicker.last = ParseUtils.getDoubleFromString(paramJSONObject, "last");
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/SevenNineSix.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */