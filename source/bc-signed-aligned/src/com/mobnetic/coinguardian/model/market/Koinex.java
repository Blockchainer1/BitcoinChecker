package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.CurrencyPairInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;

public class Koinex
  extends Market
{
  private static final String NAME = "Koinex";
  private static final String TTS_NAME = "Koin ex";
  private static final String URL = "https://koinex.in/api/ticker";
  private static final String URL_CURRENCY_PAIRS = "https://koinex.in/api/ticker";
  
  public Koinex()
  {
    super("Koinex", "Koin ex", null);
  }
  
  public String getCurrencyPairsUrl(int paramInt)
  {
    return "https://koinex.in/api/ticker";
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return "https://koinex.in/api/ticker";
  }
  
  protected void parseCurrencyPairsFromJsonObject(int paramInt, JSONObject paramJSONObject, List<CurrencyPairInfo> paramList)
    throws Exception
  {
    paramJSONObject = paramJSONObject.getJSONObject("stats").names();
    for (paramInt = 0; paramInt < paramJSONObject.length(); paramInt++) {
      paramList.add(new CurrencyPairInfo(paramJSONObject.getString(paramInt), "INR", null));
    }
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramJSONObject = paramJSONObject.getJSONObject("stats").getJSONObject(paramCheckerInfo.getCurrencyBase());
    paramTicker.bid = paramJSONObject.getDouble("highest_bid");
    paramTicker.ask = paramJSONObject.getDouble("lowest_ask");
    paramTicker.vol = paramJSONObject.getDouble("vol_24hrs");
    paramTicker.high = paramJSONObject.getDouble("max_24hrs");
    paramTicker.low = paramJSONObject.getDouble("min_24hrs");
    paramTicker.last = paramJSONObject.getDouble("last_traded_price");
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/Koinex.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */