package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.HashMap;
import java.util.LinkedHashMap;
import org.json.JSONArray;
import org.json.JSONObject;

public class Paymium
  extends Market
{
  private static final HashMap<String, CharSequence[]> CURRENCY_PAIRS = new LinkedHashMap();
  private static final String NAME = "Paymium";
  private static final String TTS_NAME = "Paymium";
  private static final String URL = "https://paymium.com/api/v1/data/eur/ticker";
  
  static
  {
    CURRENCY_PAIRS.put("BTC", new String[] { "EUR" });
  }
  
  public Paymium()
  {
    super("Paymium", "Paymium", CURRENCY_PAIRS);
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return "https://paymium.com/api/v1/data/eur/ticker";
  }
  
  protected String parseErrorFromJsonObject(int paramInt, JSONObject paramJSONObject, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramCheckerInfo = new StringBuilder();
    paramJSONObject = paramJSONObject.getJSONArray("errors");
    for (paramInt = 0; paramInt < paramJSONObject.length(); paramInt++)
    {
      if (paramCheckerInfo.length() != 0) {
        paramCheckerInfo.append("\n");
      }
      paramCheckerInfo.append(paramJSONObject.getString(paramInt));
    }
    return paramCheckerInfo.toString();
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramTicker.bid = paramJSONObject.getDouble("bid");
    paramTicker.ask = paramJSONObject.getDouble("ask");
    paramTicker.vol = paramJSONObject.getDouble("volume");
    paramTicker.high = paramJSONObject.getDouble("high");
    paramTicker.low = paramJSONObject.getDouble("low");
    paramTicker.last = paramJSONObject.getDouble("price");
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/Paymium.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */