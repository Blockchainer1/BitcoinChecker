package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.HashMap;
import java.util.LinkedHashMap;
import org.json.JSONObject;

public class Koinim
  extends Market
{
  public static final HashMap<String, CharSequence[]> CURRENCY_PAIRS = new LinkedHashMap();
  public static final String NAME = "Koinim";
  public static final String TTS_NAME = "Koinim";
  public static final String URL_BTC = "https://koinim.com/ticker/";
  public static final String URL_LTC = "https://koinim.com/ticker/ltc/";
  
  static
  {
    CURRENCY_PAIRS.put("BTC", new String[] { "TRY" });
    CURRENCY_PAIRS.put("LTC", new String[] { "TRY" });
  }
  
  public Koinim()
  {
    super("Koinim", "Koinim", CURRENCY_PAIRS);
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    if ("LTC".equals(paramCheckerInfo.getCurrencyBase())) {}
    for (paramCheckerInfo = "https://koinim.com/ticker/ltc/";; paramCheckerInfo = "https://koinim.com/ticker/") {
      return paramCheckerInfo;
    }
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramTicker.bid = paramJSONObject.getDouble("buy");
    paramTicker.ask = paramJSONObject.getDouble("sell");
    paramTicker.vol = paramJSONObject.getDouble("volume");
    paramTicker.high = paramJSONObject.getDouble("high");
    paramTicker.low = paramJSONObject.getDouble("low");
    paramTicker.last = paramJSONObject.getDouble("last_order");
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/Koinim.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */