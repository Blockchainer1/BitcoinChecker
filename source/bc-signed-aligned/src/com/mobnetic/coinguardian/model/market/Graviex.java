package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.CurrencyPairInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;

public class Graviex
  extends Market
{
  private static final String NAME = "Graviex";
  private static final String TTS_NAME = "Graviex";
  private static final String URL = "https://graviex.net//api/v2/tickers/%1$s.json";
  private static final String URL_CURRENCY_PAIRS = "https://graviex.net//api/v2/markets.json";
  
  public Graviex()
  {
    super("Graviex", "Graviex", null);
  }
  
  public String getCurrencyPairsUrl(int paramInt)
  {
    return "https://graviex.net//api/v2/markets.json";
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return String.format("https://graviex.net//api/v2/tickers/%1$s.json", new Object[] { paramCheckerInfo.getCurrencyPairId() });
  }
  
  protected void parseCurrencyPairs(int paramInt, String paramString, List<CurrencyPairInfo> paramList)
    throws Exception
  {
    JSONArray localJSONArray = new JSONArray(paramString);
    paramInt = 0;
    if (paramInt < localJSONArray.length())
    {
      Object localObject = localJSONArray.getJSONObject(paramInt);
      paramString = ((JSONObject)localObject).getString("id");
      localObject = ((JSONObject)localObject).getString("name").split("/");
      if (localObject.length != 2) {}
      for (;;)
      {
        paramInt++;
        break;
        paramList.add(new CurrencyPairInfo(localObject[0], localObject[1], paramString));
      }
    }
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramJSONObject = paramJSONObject.getJSONObject("ticker");
    paramTicker.vol = paramJSONObject.getDouble("vol");
    paramTicker.high = paramJSONObject.getDouble("high");
    paramTicker.low = paramJSONObject.getDouble("low");
    paramTicker.last = paramJSONObject.getDouble("last");
    paramTicker.bid = paramJSONObject.getDouble("buy");
    paramTicker.ask = paramJSONObject.getDouble("sell");
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/Graviex.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */