package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.CurrencyPairInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;

public class Binance
  extends Market
{
  private static final String[] COUNTER_CURRENCIES = { "BNB", "BTC", "ETH", "USDT" };
  private static final String NAME = "Binance";
  private static final String TTS_NAME = "Binance";
  private static final String URL = "https://api.binance.com/api/v1/ticker/24hr?symbol=%1$s";
  private static final String URL_CURRENCY_PAIRS = "https://api.binance.com/api/v1/ticker/allPrices";
  
  public Binance()
  {
    super("Binance", "Binance", null);
  }
  
  public String getCurrencyPairsUrl(int paramInt)
  {
    return "https://api.binance.com/api/v1/ticker/allPrices";
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return String.format("https://api.binance.com/api/v1/ticker/24hr?symbol=%1$s", new Object[] { paramCheckerInfo.getCurrencyPairId() });
  }
  
  protected void parseCurrencyPairs(int paramInt, String paramString, List<CurrencyPairInfo> paramList)
    throws Exception
  {
    JSONArray localJSONArray = new JSONArray(paramString);
    for (paramInt = 0; paramInt < localJSONArray.length(); paramInt++)
    {
      paramString = localJSONArray.getJSONObject(paramInt).getString("symbol");
      for (String str : COUNTER_CURRENCIES) {
        if (paramString.endsWith(str)) {
          paramList.add(new CurrencyPairInfo(paramString.substring(0, paramString.lastIndexOf(str)), str, paramString));
        }
      }
    }
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramTicker.bid = paramJSONObject.getDouble("bidPrice");
    paramTicker.ask = paramJSONObject.getDouble("askPrice");
    paramTicker.vol = paramJSONObject.getDouble("volume");
    paramTicker.high = paramJSONObject.getDouble("highPrice");
    paramTicker.low = paramJSONObject.getDouble("lowPrice");
    paramTicker.last = paramJSONObject.getDouble("lastPrice");
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/Binance.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */