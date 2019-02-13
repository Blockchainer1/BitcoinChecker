package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.CurrencyPairInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.List;
import java.util.Locale;
import org.json.JSONArray;
import org.json.JSONObject;

public class LakeBTC
  extends Market
{
  private static final String NAME = "LakeBTC";
  private static final String TTS_NAME = "Lake BTC";
  private static final String URL = "https://api.lakebtc.com/api_v2/ticker";
  private static final String URL_CURRENCY_PAIRS = "https://api.lakebtc.com/api_v2/ticker";
  
  public LakeBTC()
  {
    super("LakeBTC", "Lake BTC", null);
  }
  
  public String getCurrencyPairsUrl(int paramInt)
  {
    return "https://api.lakebtc.com/api_v2/ticker";
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return "https://api.lakebtc.com/api_v2/ticker";
  }
  
  protected void parseCurrencyPairsFromJsonObject(int paramInt, JSONObject paramJSONObject, List<CurrencyPairInfo> paramList)
    throws Exception
  {
    paramJSONObject = paramJSONObject.names();
    for (paramInt = 0; paramInt < paramJSONObject.length(); paramInt++)
    {
      String str = paramJSONObject.getString(paramInt);
      paramList.add(new CurrencyPairInfo(str.substring(0, 3).toUpperCase(Locale.ENGLISH), str.substring(3).toUpperCase(Locale.ENGLISH), str));
    }
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    if (paramCheckerInfo.getCurrencyPairId() == null) {}
    for (paramCheckerInfo = paramCheckerInfo.getCurrencyBaseLowerCase() + paramCheckerInfo.getCurrencyCounterLowerCase();; paramCheckerInfo = paramCheckerInfo.getCurrencyPairId())
    {
      paramJSONObject = paramJSONObject.getJSONObject(paramCheckerInfo);
      paramTicker.bid = paramJSONObject.getDouble("bid");
      paramTicker.ask = paramJSONObject.getDouble("ask");
      paramTicker.vol = paramJSONObject.getDouble("volume");
      paramTicker.high = paramJSONObject.getDouble("high");
      paramTicker.low = paramJSONObject.getDouble("low");
      paramTicker.last = paramJSONObject.getDouble("last");
      return;
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/LakeBTC.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */