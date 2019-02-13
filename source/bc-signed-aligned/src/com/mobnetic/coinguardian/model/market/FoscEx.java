package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import com.mobnetic.coinguardian.util.ParseUtils;
import java.util.HashMap;
import java.util.LinkedHashMap;
import org.json.JSONObject;

public class FoscEx
  extends Market
{
  private static final HashMap<String, CharSequence[]> CURRENCY_PAIRS = new LinkedHashMap();
  private static final String NAME = "Fosc-Ex";
  private static final String TTS_NAME = "Fosc Ex";
  private static final String URL = "http://www.fosc-ex.com/api-public-ticker";
  
  static
  {
    CURRENCY_PAIRS.put("KNC", new String[] { "KRW" });
  }
  
  public FoscEx()
  {
    super("Fosc-Ex", "Fosc Ex", CURRENCY_PAIRS);
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return "http://www.fosc-ex.com/api-public-ticker";
  }
  
  protected String parseErrorFromJsonObject(int paramInt, JSONObject paramJSONObject, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    return paramJSONObject.getString("error");
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramTicker.vol = ParseUtils.getDoubleFromString(paramJSONObject, "volume");
    paramTicker.last = ParseUtils.getDoubleFromString(paramJSONObject, "last");
    paramTicker.timestamp = (paramJSONObject.getLong("timestamp") * 1000L);
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/FoscEx.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */