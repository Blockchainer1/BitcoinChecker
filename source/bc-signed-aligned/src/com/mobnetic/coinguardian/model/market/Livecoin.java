package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.CurrencyPairInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;

public class Livecoin
  extends Market
{
  private static final String NAME = "Livecoin";
  private static final String TTS_NAME = "Live coin";
  private static final String URL = "https://api.livecoin.net/exchange/ticker?currencyPair=%1$s";
  private static final String URL_CURRENCY_PAIRS = "https://api.livecoin.net/exchange/ticker";
  
  public Livecoin()
  {
    super("Livecoin", "Live coin", null);
  }
  
  public String getCurrencyPairsUrl(int paramInt)
  {
    return "https://api.livecoin.net/exchange/ticker";
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return String.format("https://api.livecoin.net/exchange/ticker?currencyPair=%1$s", new Object[] { paramCheckerInfo.getCurrencyPairId() });
  }
  
  protected void parseCurrencyPairs(int paramInt, String paramString, List<CurrencyPairInfo> paramList)
    throws Exception
  {
    JSONArray localJSONArray = new JSONArray(paramString);
    for (paramInt = 0; paramInt < localJSONArray.length(); paramInt++)
    {
      String str = localJSONArray.getJSONObject(paramInt).getString("symbol");
      paramString = str.split("/");
      if ((paramString != null) && (paramString.length >= 2)) {
        paramList.add(new CurrencyPairInfo(paramString[0], paramString[1], str));
      }
    }
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    if (!paramJSONObject.isNull("best_bid")) {
      paramTicker.bid = paramJSONObject.getDouble("best_bid");
    }
    if (!paramJSONObject.isNull("best_ask")) {
      paramTicker.ask = paramJSONObject.getDouble("best_ask");
    }
    if (!paramJSONObject.isNull("volume")) {
      paramTicker.vol = paramJSONObject.getDouble("volume");
    }
    if (!paramJSONObject.isNull("high")) {
      paramTicker.high = paramJSONObject.getDouble("high");
    }
    if (!paramJSONObject.isNull("low")) {
      paramTicker.low = paramJSONObject.getDouble("low");
    }
    paramTicker.last = paramJSONObject.getDouble("last");
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/Livecoin.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */