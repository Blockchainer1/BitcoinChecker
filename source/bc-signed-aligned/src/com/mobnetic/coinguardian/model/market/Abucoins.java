package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.CurrencyPairInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;

public class Abucoins
  extends Market
{
  private static final String NAME = "Abucoins";
  private static final String TTS_NAME = "Abucoins";
  private static final String URL = "https://api.abucoins.com/products/%1$s/stats";
  private static final String URL_CURRENCY_PAIRS = "https://api.abucoins.com/products";
  
  public Abucoins()
  {
    super("Abucoins", "Abucoins", null);
  }
  
  public String getCurrencyPairsUrl(int paramInt)
  {
    return "https://api.abucoins.com/products";
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return String.format("https://api.abucoins.com/products/%1$s/stats", new Object[] { paramCheckerInfo.getCurrencyPairId() });
  }
  
  protected void parseCurrencyPairs(int paramInt, String paramString, List<CurrencyPairInfo> paramList)
    throws Exception
  {
    JSONArray localJSONArray = new JSONArray(paramString);
    for (paramInt = 0; paramInt < localJSONArray.length(); paramInt++)
    {
      paramString = localJSONArray.getJSONObject(paramInt);
      paramList.add(new CurrencyPairInfo(paramString.getString("base_currency"), paramString.getString("quote_currency"), paramString.getString("id")));
    }
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramTicker.vol = paramJSONObject.getDouble("volume");
    paramTicker.high = paramJSONObject.getDouble("high");
    paramTicker.low = paramJSONObject.getDouble("low");
    paramTicker.last = paramJSONObject.getDouble("last");
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/Abucoins.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */