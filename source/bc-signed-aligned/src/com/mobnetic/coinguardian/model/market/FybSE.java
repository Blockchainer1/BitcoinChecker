package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.HashMap;
import java.util.LinkedHashMap;
import org.json.JSONObject;

public class FybSE
  extends Market
{
  private static final HashMap<String, CharSequence[]> CURRENCY_PAIRS = new LinkedHashMap();
  private static final String NAME = "FYB-SE";
  private static final String TTS_NAME = "Fyb SE";
  private static final String URL = "https://www.fybse.se/api/%1$s/ticker.json";
  
  static
  {
    CURRENCY_PAIRS.put("BTC", new String[] { "SEK" });
  }
  
  public FybSE()
  {
    super("FYB-SE", "Fyb SE", CURRENCY_PAIRS);
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return String.format("https://www.fybse.se/api/%1$s/ticker.json", new Object[] { paramCheckerInfo.getCurrencyCounter() });
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramTicker.bid = paramJSONObject.getDouble("bid");
    paramTicker.ask = paramJSONObject.getDouble("ask");
    paramTicker.last = paramTicker.ask;
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/FybSE.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */