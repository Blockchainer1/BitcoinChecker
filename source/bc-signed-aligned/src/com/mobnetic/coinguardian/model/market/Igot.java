package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.CurrencyPairInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.List;
import java.util.Locale;
import org.json.JSONArray;
import org.json.JSONObject;

public class Igot
  extends Market
{
  private static final String NAME = "igot";
  private static final String TTS_NAME = "igot";
  private static final String URL = "https://www.igot.com/api/v1/stats/buy";
  private static final String URL_CURRENCY_PAIRS = "https://www.igot.com/api/v1/stats/buy";
  
  public Igot()
  {
    super("igot", "igot", null);
  }
  
  public String getCurrencyPairsUrl(int paramInt)
  {
    return "https://www.igot.com/api/v1/stats/buy";
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return "https://www.igot.com/api/v1/stats/buy";
  }
  
  protected void parseCurrencyPairsFromJsonObject(int paramInt, JSONObject paramJSONObject, List<CurrencyPairInfo> paramList)
    throws Exception
  {
    paramJSONObject = paramJSONObject.names();
    for (paramInt = 0; paramInt < paramJSONObject.length(); paramInt++)
    {
      String str = paramJSONObject.getString(paramInt);
      if (str != null) {
        paramList.add(new CurrencyPairInfo("BTC", str.toUpperCase(Locale.ENGLISH), str));
      }
    }
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramJSONObject = paramJSONObject.getJSONObject(paramCheckerInfo.getCurrencyPairId());
    paramTicker.high = paramJSONObject.getDouble("highest_today");
    paramTicker.low = paramJSONObject.getDouble("lowest_today");
    paramTicker.last = paramJSONObject.getDouble("current_rate");
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/Igot.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */