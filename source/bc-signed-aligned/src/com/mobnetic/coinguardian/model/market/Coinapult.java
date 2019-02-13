package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.HashMap;
import java.util.LinkedHashMap;
import org.json.JSONObject;

public class Coinapult
  extends Market
{
  private static final HashMap<String, CharSequence[]> CURRENCY_PAIRS = new LinkedHashMap();
  private static final String NAME = "Coinapult";
  private static final String TTS_NAME = "Coinapult";
  private static final String URL = "https://api.coinapult.com/api/ticker?market=%2$s_%1$s";
  
  static
  {
    CURRENCY_PAIRS.put("BTC", new String[] { "USD", "EUR", "GBP", "XAG", "XAU" });
  }
  
  public Coinapult()
  {
    super("Coinapult", "Coinapult", CURRENCY_PAIRS);
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return String.format("https://api.coinapult.com/api/ticker?market=%2$s_%1$s", new Object[] { paramCheckerInfo.getCurrencyBase(), paramCheckerInfo.getCurrencyCounter() });
  }
  
  protected String parseErrorFromJsonObject(int paramInt, JSONObject paramJSONObject, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    return paramJSONObject.getString("error");
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramTicker.last = paramJSONObject.getDouble("index");
    paramTicker.timestamp = (paramJSONObject.getLong("updatetime") * 1000L);
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/Coinapult.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */