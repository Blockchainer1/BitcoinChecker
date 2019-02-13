package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.HashMap;
import java.util.LinkedHashMap;
import org.json.JSONObject;

public class Urdubit
  extends Market
{
  private static final HashMap<String, CharSequence[]> CURRENCY_PAIRS = new LinkedHashMap();
  private static final String NAME = "Urdubit";
  private static final String TTS_NAME = "Urdubit";
  private static final String URL = "https://api.blinktrade.com/api/v1/%2$s/ticker?crypto_currency=%1$s";
  
  static
  {
    CURRENCY_PAIRS.put("BTC", new String[] { "PKR" });
  }
  
  public Urdubit()
  {
    super("Urdubit", "Urdubit", CURRENCY_PAIRS);
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return String.format("https://api.blinktrade.com/api/v1/%2$s/ticker?crypto_currency=%1$s", new Object[] { paramCheckerInfo.getCurrencyBase(), paramCheckerInfo.getCurrencyCounter() });
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramTicker.bid = paramJSONObject.getDouble("buy");
    paramTicker.ask = paramJSONObject.getDouble("sell");
    paramTicker.vol = paramJSONObject.getDouble("vol");
    paramTicker.high = paramJSONObject.getDouble("high");
    paramTicker.low = paramJSONObject.getDouble("low");
    paramTicker.last = paramJSONObject.getDouble("last");
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/Urdubit.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */