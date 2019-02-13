package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.HashMap;
import java.util.LinkedHashMap;
import org.json.JSONObject;

public class Campbx
  extends Market
{
  private static final HashMap<String, CharSequence[]> CURRENCY_PAIRS = new LinkedHashMap();
  private static final String NAME = "CampBX";
  private static final String TTS_NAME = "Camp BX";
  private static final String URL = "http://campbx.com/api/xticker.php";
  
  static
  {
    CURRENCY_PAIRS.put("BTC", new String[] { "USD" });
  }
  
  public Campbx()
  {
    super("CampBX", "Camp BX", CURRENCY_PAIRS);
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return "http://campbx.com/api/xticker.php";
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramTicker.bid = paramJSONObject.getDouble("Best Bid");
    paramTicker.ask = paramJSONObject.getDouble("Best Ask");
    paramTicker.last = paramJSONObject.getDouble("Last Trade");
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/Campbx.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */