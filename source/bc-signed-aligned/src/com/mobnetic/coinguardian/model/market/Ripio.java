package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.HashMap;
import java.util.LinkedHashMap;
import org.json.JSONObject;

public class Ripio
  extends Market
{
  private static final HashMap<String, CharSequence[]> CURRENCY_PAIRS = new LinkedHashMap();
  private static final String NAME = "Ripio";
  private static final String TTS_NAME = "Ripio";
  private static final String URL = "https://www.ripio.com/api/v1/rates/";
  
  static
  {
    CURRENCY_PAIRS.put("BTC", new String[] { "ARS" });
  }
  
  public Ripio()
  {
    super("Ripio", "Ripio", CURRENCY_PAIRS);
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return "https://www.ripio.com/api/v1/rates/";
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramJSONObject = paramJSONObject.getJSONObject("rates");
    paramTicker.bid = paramJSONObject.getDouble("ARS_SELL");
    paramTicker.ask = paramJSONObject.getDouble("ARS_BUY");
    paramTicker.last = paramTicker.ask;
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/Ripio.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */