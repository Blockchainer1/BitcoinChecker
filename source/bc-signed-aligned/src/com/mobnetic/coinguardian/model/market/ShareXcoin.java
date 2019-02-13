package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.CurrencyPairInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;

public class ShareXcoin
  extends Market
{
  private static final String NAME = "ShareXcoin";
  private static final String TTS_NAME = "Share X coin";
  private static final String URL = "https://sharexcoin.com/public_api/v1/market/%1$s_%2$s/summary";
  private static final String URL_CURRENCY_PAIRS = "https://sharexcoin.com/public_api/v1/market/summary";
  
  public ShareXcoin()
  {
    super("ShareXcoin", "Share X coin", null);
  }
  
  public String getCurrencyPairsUrl(int paramInt)
  {
    return "https://sharexcoin.com/public_api/v1/market/summary";
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return String.format("https://sharexcoin.com/public_api/v1/market/%1$s_%2$s/summary", new Object[] { paramCheckerInfo.getCurrencyBase(), paramCheckerInfo.getCurrencyCounter() });
  }
  
  protected void parseCurrencyPairsFromJsonObject(int paramInt, JSONObject paramJSONObject, List<CurrencyPairInfo> paramList)
    throws Exception
  {
    JSONArray localJSONArray = paramJSONObject.getJSONArray("markets");
    for (paramInt = 0; paramInt < localJSONArray.length(); paramInt++)
    {
      paramJSONObject = localJSONArray.getJSONObject(paramInt);
      paramList.add(new CurrencyPairInfo(paramJSONObject.getString("coin1"), paramJSONObject.getString("coin2"), paramJSONObject.getString("market_id")));
    }
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramTicker.bid = paramJSONObject.getDouble("bid");
    paramTicker.ask = paramJSONObject.getDouble("ask");
    paramTicker.vol = paramJSONObject.getDouble("volume");
    paramTicker.high = paramJSONObject.getDouble("high");
    paramTicker.low = paramJSONObject.getDouble("low");
    paramTicker.last = paramJSONObject.getDouble("last");
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/ShareXcoin.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */