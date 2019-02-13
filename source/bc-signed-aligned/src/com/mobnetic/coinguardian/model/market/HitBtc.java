package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.CurrencyPairInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import com.mobnetic.coinguardian.util.ParseUtils;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;

public class HitBtc
  extends Market
{
  private static final String NAME = "HitBTC";
  private static final String TTS_NAME = "Hit BTC";
  private static final String URL = "https://api.hitbtc.com/api/1/public/%1$s/ticker";
  private static final String URL_CURRENCY_PAIRS = "https://api.hitbtc.com/api/1/public/symbols";
  
  public HitBtc()
  {
    super("HitBTC", "Hit BTC", null);
  }
  
  public String getCurrencyPairsUrl(int paramInt)
  {
    return "https://api.hitbtc.com/api/1/public/symbols";
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return String.format("https://api.hitbtc.com/api/1/public/%1$s/ticker", new Object[] { paramCheckerInfo.getCurrencyPairId() });
  }
  
  protected void parseCurrencyPairsFromJsonObject(int paramInt, JSONObject paramJSONObject, List<CurrencyPairInfo> paramList)
    throws Exception
  {
    paramJSONObject = paramJSONObject.getJSONArray("symbols");
    paramInt = 0;
    if (paramInt < paramJSONObject.length())
    {
      Object localObject = paramJSONObject.getJSONObject(paramInt);
      String str1 = ((JSONObject)localObject).getString("commodity");
      String str2 = ((JSONObject)localObject).getString("currency");
      localObject = ((JSONObject)localObject).getString("symbol");
      if ((str1 == null) || (str2 == null) || (localObject == null)) {}
      for (;;)
      {
        paramInt++;
        break;
        paramList.add(new CurrencyPairInfo(str1, str2, (String)localObject));
      }
    }
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramTicker.bid = ParseUtils.getDoubleFromString(paramJSONObject, "bid");
    paramTicker.ask = ParseUtils.getDoubleFromString(paramJSONObject, "ask");
    paramTicker.vol = ParseUtils.getDoubleFromString(paramJSONObject, "volume");
    paramTicker.high = ParseUtils.getDoubleFromString(paramJSONObject, "high");
    paramTicker.low = ParseUtils.getDoubleFromString(paramJSONObject, "low");
    paramTicker.last = ParseUtils.getDoubleFromString(paramJSONObject, "last");
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/HitBtc.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */