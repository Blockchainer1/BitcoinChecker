package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.CurrencyPairInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.List;
import java.util.Locale;
import org.json.JSONArray;
import org.json.JSONObject;

public class Huobi
  extends Market
{
  private static final String NAME = "Huobi";
  private static final String TTS_NAME = "Huobi";
  private static final String URL = "https://api.huobi.pro/market/detail/merged?symbol=%s%s";
  private static final String URL_CURRENCY_PAIRS = "https://api.huobi.pro/v1/common/symbols";
  
  public Huobi()
  {
    super("Huobi", "Huobi", null);
  }
  
  public String getCurrencyPairsUrl(int paramInt)
  {
    return "https://api.huobi.pro/v1/common/symbols";
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return String.format("https://api.huobi.pro/market/detail/merged?symbol=%s%s", new Object[] { paramCheckerInfo.getCurrencyBaseLowerCase(), paramCheckerInfo.getCurrencyCounterLowerCase() });
  }
  
  protected void parseCurrencyPairsFromJsonObject(int paramInt, JSONObject paramJSONObject, List<CurrencyPairInfo> paramList)
    throws Exception
  {
    if ("ok".equalsIgnoreCase(paramJSONObject.getString("status")))
    {
      paramJSONObject = paramJSONObject.getJSONArray("data");
      for (paramInt = 0; paramInt < paramJSONObject.length(); paramInt++) {
        paramList.add(new CurrencyPairInfo(paramJSONObject.getJSONObject(paramInt).getString("base-currency").toUpperCase(Locale.US), paramJSONObject.getJSONObject(paramInt).getString("quote-currency").toUpperCase(Locale.US), null));
      }
    }
    throw new Exception("Parse currency pairs error.");
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramJSONObject = paramJSONObject.getJSONObject("tick");
    paramTicker.bid = paramJSONObject.getJSONArray("bid").getDouble(0);
    paramTicker.ask = paramJSONObject.getJSONArray("ask").getDouble(0);
    paramTicker.vol = paramJSONObject.getDouble("vol");
    paramTicker.high = paramJSONObject.getDouble("high");
    paramTicker.low = paramJSONObject.getDouble("low");
    paramTicker.last = paramJSONObject.getDouble("close");
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/Huobi.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */