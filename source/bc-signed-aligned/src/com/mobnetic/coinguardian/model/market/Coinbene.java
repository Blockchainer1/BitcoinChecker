package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.CurrencyPairInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;

public class Coinbene
  extends Market
{
  private static final String NAME = "Coinbene";
  private static final String TTS_NAME = "Coinbene";
  private static final String URL = "http://api.coinbene.com/v1/market/ticker?symbol=%1$s";
  private static final String URL_CURRENCY_PAIRS = "http://api.coinbene.com/v1/market/symbol";
  
  public Coinbene()
  {
    super("Coinbene", "Coinbene", null);
  }
  
  public String getCurrencyPairsUrl(int paramInt)
  {
    return "http://api.coinbene.com/v1/market/symbol";
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return String.format("http://api.coinbene.com/v1/market/ticker?symbol=%1$s", new Object[] { paramCheckerInfo.getCurrencyPairId() });
  }
  
  protected void parseCurrencyPairsFromJsonObject(int paramInt, JSONObject paramJSONObject, List<CurrencyPairInfo> paramList)
    throws Exception
  {
    JSONArray localJSONArray = paramJSONObject.getJSONArray("symbol");
    for (paramInt = 0; paramInt < localJSONArray.length(); paramInt++)
    {
      paramJSONObject = localJSONArray.getJSONObject(paramInt);
      String str = paramJSONObject.getString("ticker");
      paramList.add(new CurrencyPairInfo(paramJSONObject.getString("baseAsset"), paramJSONObject.getString("quoteAsset"), str));
    }
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramJSONObject = paramJSONObject.getJSONArray("ticker").getJSONObject(0);
    paramTicker.last = paramJSONObject.getDouble("last");
    paramTicker.bid = paramJSONObject.getDouble("bid");
    paramTicker.vol = paramJSONObject.getDouble("24hrVol");
    paramTicker.ask = paramJSONObject.getDouble("ask");
    paramTicker.high = paramJSONObject.getDouble("24hrHigh");
    paramTicker.low = paramJSONObject.getDouble("24hrLow");
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/Coinbene.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */