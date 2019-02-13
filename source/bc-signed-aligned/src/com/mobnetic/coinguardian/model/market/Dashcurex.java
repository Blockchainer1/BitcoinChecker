package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.HashMap;
import java.util.LinkedHashMap;
import org.json.JSONObject;

public class Dashcurex
  extends Market
{
  private static final HashMap<String, CharSequence[]> CURRENCY_PAIRS = new LinkedHashMap();
  private static final String NAME = "Dashcurex";
  private static final String TTS_NAME = "Dashcurex";
  private static final String URL = "https://dashcurex.com/api/%1$s/ticker.json";
  
  static
  {
    CURRENCY_PAIRS.put("DASH", new String[] { "PLN", "USD" });
  }
  
  public Dashcurex()
  {
    super("Dashcurex", "Dashcurex", CURRENCY_PAIRS);
  }
  
  private double parseBTC(double paramDouble)
  {
    return paramDouble / 1.0E8D;
  }
  
  private double parsePrice(double paramDouble)
  {
    return paramDouble / 10000.0D;
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return String.format("https://dashcurex.com/api/%1$s/ticker.json", new Object[] { paramCheckerInfo.getCurrencyCounterLowerCase() });
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramTicker.bid = parsePrice(paramJSONObject.getDouble("best_ask"));
    paramTicker.ask = parsePrice(paramJSONObject.getDouble("best_bid"));
    paramTicker.vol = parseBTC(paramJSONObject.getDouble("total_volume"));
    paramTicker.high = parsePrice(paramJSONObject.getDouble("highest_tx_price"));
    paramTicker.low = parsePrice(paramJSONObject.getDouble("lowest_tx_price"));
    paramTicker.last = parsePrice(paramJSONObject.getDouble("last_tx_price"));
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/Dashcurex.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */