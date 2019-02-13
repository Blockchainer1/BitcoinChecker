package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.CurrencyPairInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;

public class Okex
  extends Market
{
  public static final String NAME = "Okex";
  public static final String TTS_NAME = "Okex";
  private static final String URL = "https://www.okex.com/api/v1/ticker.do?symbol=%1$s";
  private static final String URL_CURRENCY_PAIRS = "https://www.okex.com/v2/spot/markets/products";
  
  public Okex()
  {
    super("Okex", "Okex", null);
  }
  
  public String getCurrencyPairsUrl(int paramInt)
  {
    return "https://www.okex.com/v2/spot/markets/products";
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return String.format("https://www.okex.com/api/v1/ticker.do?symbol=%1$s", new Object[] { paramCheckerInfo.getCurrencyPairId() });
  }
  
  protected void parseCurrencyPairsFromJsonObject(int paramInt, JSONObject paramJSONObject, List<CurrencyPairInfo> paramList)
    throws Exception
  {
    JSONArray localJSONArray = paramJSONObject.getJSONArray("data");
    paramInt = 0;
    if (paramInt < localJSONArray.length())
    {
      String str = localJSONArray.getJSONObject(paramInt).getString("symbol");
      paramJSONObject = str.split("_");
      if (paramJSONObject.length != 2) {}
      for (;;)
      {
        paramInt++;
        break;
        paramList.add(new CurrencyPairInfo(paramJSONObject[0].toUpperCase(), paramJSONObject[1].toUpperCase(), str));
      }
    }
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramJSONObject = paramJSONObject.getJSONObject("ticker");
    paramTicker.low = paramJSONObject.getDouble("low");
    paramTicker.high = paramJSONObject.getDouble("high");
    paramTicker.vol = paramJSONObject.getDouble("vol");
    paramTicker.last = paramJSONObject.getDouble("last");
    paramTicker.bid = paramJSONObject.getDouble("sell");
    paramTicker.ask = paramJSONObject.getDouble("buy");
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/Okex.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */