package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.HashMap;
import java.util.LinkedHashMap;
import org.json.JSONObject;

public class Virtex
  extends Market
{
  private static final HashMap<String, CharSequence[]> CURRENCY_PAIRS = new LinkedHashMap();
  private static final String NAME = "CaVirtEx";
  private static final String TTS_NAME = "CaVirtEx";
  private static final String URL = "https://cavirtex.com/api2/ticker.json";
  
  static
  {
    CURRENCY_PAIRS.put("BTC", new String[] { "CAD", "LTC" });
    CURRENCY_PAIRS.put("LTC", new String[] { "CAD" });
  }
  
  public Virtex()
  {
    super("CaVirtEx", "CaVirtEx", CURRENCY_PAIRS);
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return "https://cavirtex.com/api2/ticker.json";
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramJSONObject = paramJSONObject.getJSONObject("ticker").getJSONObject(paramCheckerInfo.getCurrencyBase() + paramCheckerInfo.getCurrencyCounter());
    if (!paramJSONObject.isNull("buy")) {
      paramTicker.bid = paramJSONObject.getDouble("buy");
    }
    if (!paramJSONObject.isNull("sell")) {
      paramTicker.ask = paramJSONObject.getDouble("sell");
    }
    if (!paramJSONObject.isNull("volume")) {
      paramTicker.vol = paramJSONObject.getDouble("volume");
    }
    if (!paramJSONObject.isNull("high")) {
      paramTicker.high = paramJSONObject.getDouble("high");
    }
    if (!paramJSONObject.isNull("low")) {
      paramTicker.low = paramJSONObject.getDouble("low");
    }
    paramTicker.last = paramJSONObject.getDouble("last");
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/Virtex.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */