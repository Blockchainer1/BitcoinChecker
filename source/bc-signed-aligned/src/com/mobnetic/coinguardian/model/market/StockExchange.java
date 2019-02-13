package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.CurrencyPairInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;

public class StockExchange
  extends Market
{
  private static final String NAME = "StockExchange";
  private static final String TTS_NAME = "StockExchange";
  private static final String URL = "https://app.stex.com/api2/ticker";
  private static final String URL_CURRENCY_PAIRS = "https://app.stex.com/api2/markets";
  
  public StockExchange()
  {
    super("StockExchange", "StockExchange", null);
  }
  
  public String getCurrencyPairsUrl(int paramInt)
  {
    return "https://app.stex.com/api2/markets";
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return "https://app.stex.com/api2/ticker";
  }
  
  protected void parseCurrencyPairs(int paramInt, String paramString, List<CurrencyPairInfo> paramList)
    throws Exception
  {
    JSONArray localJSONArray = new JSONArray(paramString);
    for (paramInt = 0; paramInt < localJSONArray.length(); paramInt++)
    {
      JSONObject localJSONObject = localJSONArray.getJSONObject(paramInt);
      paramString = localJSONObject.getString("market_name");
      paramList.add(new CurrencyPairInfo(localJSONObject.getString("currency"), localJSONObject.getString("partner"), paramString));
    }
  }
  
  protected void parseTicker(int paramInt, String paramString, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramString = new JSONArray(paramString);
    for (int i = 0; i < paramString.length(); i++)
    {
      JSONObject localJSONObject = paramString.getJSONObject(i);
      if (localJSONObject.getString("market_name").equals(paramCheckerInfo.getCurrencyPairId())) {
        parseTickerFromJsonObject(paramInt, localJSONObject, paramTicker, paramCheckerInfo);
      }
    }
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramTicker.vol = paramJSONObject.getDouble("vol");
    paramTicker.last = paramJSONObject.getDouble("last");
    paramTicker.bid = paramJSONObject.getDouble("bid");
    paramTicker.ask = paramJSONObject.getDouble("ask");
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/StockExchange.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */