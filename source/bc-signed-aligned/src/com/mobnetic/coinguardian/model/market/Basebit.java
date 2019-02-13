package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.CurrencyPairInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;

public class Basebit
  extends Market
{
  private static final String NAME = "Basebit";
  private static final String TTS_NAME = "Base Bit";
  private static final String URL = "http://www.basebit.com.br/quote-%1$s";
  private static final String URL_CURRENCY_PAIRS = "http://www.basebit.com.br/listpairs";
  
  public Basebit()
  {
    super("Basebit", "Base Bit", null);
  }
  
  public String getCurrencyPairsUrl(int paramInt)
  {
    return "http://www.basebit.com.br/listpairs";
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return String.format("http://www.basebit.com.br/quote-%1$s", new Object[] { paramCheckerInfo.getCurrencyPairId() });
  }
  
  protected void parseCurrencyPairs(int paramInt, String paramString, List<CurrencyPairInfo> paramList)
    throws Exception
  {
    JSONArray localJSONArray = new JSONArray(paramString);
    for (paramInt = 0; paramInt < localJSONArray.length(); paramInt++)
    {
      paramString = localJSONArray.getString(paramInt);
      String[] arrayOfString = paramString.split("_");
      if ((arrayOfString != null) && (arrayOfString.length >= 2)) {
        paramList.add(new CurrencyPairInfo(arrayOfString[0], arrayOfString[1], paramString));
      }
    }
  }
  
  protected String parseErrorFromJsonObject(int paramInt, JSONObject paramJSONObject, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    return paramJSONObject.getString("errorMessage");
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramJSONObject = paramJSONObject.getJSONObject("result");
    paramTicker.vol = paramJSONObject.getDouble("volume24h");
    paramTicker.high = paramJSONObject.getDouble("high");
    paramTicker.low = paramJSONObject.getDouble("low");
    paramTicker.last = paramJSONObject.getDouble("last");
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/Basebit.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */