package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.CurrencyPairInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;

public class Idax
  extends Market
{
  public static final String NAME = "Idax";
  public static final String TTS_NAME = "Idax";
  private static final String URL = "https://openapi.idax.pro/api/v2/ticker?pair=%1$s";
  private static final String URL_CURRENCY_PAIRS = "https://openapi.idax.pro/api/v2/pairs";
  
  public Idax()
  {
    super("Idax", "Idax", null);
  }
  
  public String getCurrencyPairsUrl(int paramInt)
  {
    return "https://openapi.idax.pro/api/v2/pairs";
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return String.format("https://openapi.idax.pro/api/v2/ticker?pair=%1$s", new Object[] { paramCheckerInfo.getCurrencyPairId() });
  }
  
  protected void parseCurrencyPairsFromJsonObject(int paramInt, JSONObject paramJSONObject, List<CurrencyPairInfo> paramList)
    throws Exception
  {
    JSONArray localJSONArray = paramJSONObject.getJSONArray("pairs");
    paramInt = 0;
    if (paramInt < localJSONArray.length())
    {
      paramJSONObject = localJSONArray.getString(paramInt);
      String[] arrayOfString = paramJSONObject.split("_");
      if (arrayOfString.length != 2) {}
      for (;;)
      {
        paramInt++;
        break;
        paramList.add(new CurrencyPairInfo(arrayOfString[0].toUpperCase(), arrayOfString[1].toUpperCase(), paramJSONObject));
      }
    }
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramJSONObject = paramJSONObject.getJSONArray("ticker").getJSONObject(0);
    paramTicker.low = paramJSONObject.getDouble("low");
    paramTicker.high = paramJSONObject.getDouble("high");
    paramTicker.vol = paramJSONObject.getDouble("vol");
    paramTicker.ask = paramJSONObject.getDouble("open");
    paramTicker.bid = paramJSONObject.getDouble("last");
    paramTicker.last = paramJSONObject.getDouble("last");
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/Idax.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */