package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.CurrencyPairInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;

public class Bleutrade
  extends Market
{
  private static final String NAME = "Bleutrade";
  private static final String TTS_NAME = "Bleutrade";
  private static final String URL = "https://bleutrade.com/api/v2/public/getticker?market=%1$s";
  private static final String URL_CURRENCY_PAIRS = "https://bleutrade.com/api/v2/public/getmarkets";
  
  public Bleutrade()
  {
    super("Bleutrade", "Bleutrade", null);
  }
  
  public String getCurrencyPairsUrl(int paramInt)
  {
    return "https://bleutrade.com/api/v2/public/getmarkets";
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return String.format("https://bleutrade.com/api/v2/public/getticker?market=%1$s", new Object[] { paramCheckerInfo.getCurrencyPairId() });
  }
  
  protected void parseCurrencyPairsFromJsonObject(int paramInt, JSONObject paramJSONObject, List<CurrencyPairInfo> paramList)
    throws Exception
  {
    paramJSONObject = paramJSONObject.getJSONArray("result");
    for (paramInt = 0; paramInt < paramJSONObject.length(); paramInt++)
    {
      Object localObject = paramJSONObject.getJSONObject(paramInt);
      String str1 = ((JSONObject)localObject).getString("MarketName");
      String str2 = ((JSONObject)localObject).getString("MarketCurrency");
      localObject = ((JSONObject)localObject).getString("BaseCurrency");
      if ((str1 != null) && (str2 != null) && (localObject != null)) {
        paramList.add(new CurrencyPairInfo(str2, (String)localObject, str1));
      }
    }
  }
  
  protected String parseErrorFromJsonObject(int paramInt, JSONObject paramJSONObject, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    return paramJSONObject.getString("message");
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramJSONObject = paramJSONObject.get("result");
    if ((paramJSONObject instanceof JSONArray)) {}
    for (paramJSONObject = ((JSONArray)paramJSONObject).getJSONObject(0);; paramJSONObject = (JSONObject)paramJSONObject)
    {
      paramTicker.bid = paramJSONObject.getDouble("Bid");
      paramTicker.ask = paramJSONObject.getDouble("Ask");
      paramTicker.last = paramJSONObject.getDouble("Last");
      return;
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/Bleutrade.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */