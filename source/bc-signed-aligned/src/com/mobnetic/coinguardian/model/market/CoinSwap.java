package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.CurrencyPairInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;

public class CoinSwap
  extends Market
{
  private static final String NAME = "Coin-Swap";
  private static final String TTS_NAME = "Coin Swap";
  private static final String URL = "https://api.coin-swap.net/market/stats/%1$s/%2$s";
  private static final String URL_CURRENCY_PAIRS = "http://api.coin-swap.net/market/summary";
  
  public CoinSwap()
  {
    super("Coin-Swap", "Coin Swap", null);
  }
  
  public String getCurrencyPairsUrl(int paramInt)
  {
    return "http://api.coin-swap.net/market/summary";
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return String.format("https://api.coin-swap.net/market/stats/%1$s/%2$s", new Object[] { paramCheckerInfo.getCurrencyBase(), paramCheckerInfo.getCurrencyCounter() });
  }
  
  protected void parseCurrencyPairs(int paramInt, String paramString, List<CurrencyPairInfo> paramList)
    throws Exception
  {
    JSONArray localJSONArray = new JSONArray(paramString);
    for (paramInt = 0; paramInt < localJSONArray.length(); paramInt++)
    {
      paramString = localJSONArray.getJSONObject(paramInt);
      paramList.add(new CurrencyPairInfo(paramString.getString("symbol"), paramString.getString("exchange"), null));
    }
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramTicker.bid = paramJSONObject.getDouble("bid");
    paramTicker.ask = paramJSONObject.getDouble("ask");
    paramTicker.vol = paramJSONObject.getDouble("dayvolume");
    paramTicker.high = paramJSONObject.getDouble("dayhigh");
    paramTicker.low = paramJSONObject.getDouble("daylow");
    paramTicker.last = paramJSONObject.getDouble("lastprice");
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/CoinSwap.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */