package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.CurrencyPairInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;

public class CoinExchange
  extends Market
{
  private static final String NAME = "CoinExchange";
  private static final String TTS_NAME = "CoinExchange";
  private static final String URL = "https://www.coinexchange.io/api/v1/getmarketsummary?market_id=%1$s";
  private static final String URL_CURRENCY_PAIRS = "https://www.coinexchange.io/api/v1/getmarkets";
  
  public CoinExchange()
  {
    super("CoinExchange", "CoinExchange", null);
  }
  
  public String getCurrencyPairsUrl(int paramInt)
  {
    return "https://www.coinexchange.io/api/v1/getmarkets";
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return String.format("https://www.coinexchange.io/api/v1/getmarketsummary?market_id=%1$s", new Object[] { paramCheckerInfo.getCurrencyPairId() });
  }
  
  protected void parseCurrencyPairsFromJsonObject(int paramInt, JSONObject paramJSONObject, List<CurrencyPairInfo> paramList)
    throws Exception
  {
    JSONArray localJSONArray = paramJSONObject.getJSONArray("result");
    for (paramInt = 0; paramInt < localJSONArray.length(); paramInt++)
    {
      paramJSONObject = localJSONArray.getJSONObject(paramInt);
      String str = paramJSONObject.getString("MarketID");
      paramList.add(new CurrencyPairInfo(paramJSONObject.getString("BaseCurrencyCode"), paramJSONObject.getString("MarketAssetCode"), str));
    }
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramJSONObject = paramJSONObject.getJSONObject("result");
    paramTicker.last = paramJSONObject.getDouble("LastPrice");
    paramTicker.bid = paramJSONObject.getDouble("BidPrice");
    paramTicker.vol = paramJSONObject.getDouble("Volume");
    paramTicker.ask = paramJSONObject.getDouble("AskPrice");
    paramTicker.high = paramJSONObject.getDouble("HighPrice");
    paramTicker.low = paramJSONObject.getDouble("LowPrice");
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/CoinExchange.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */