package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.CurrencyPairInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;

public class CexIO
  extends Market
{
  private static final HashMap<String, CharSequence[]> CURRENCY_PAIRS = new LinkedHashMap();
  private static final String NAME = "CEX.IO";
  private static final String TTS_NAME = "CEX IO";
  private static final String URL = "https://cex.io/api/ticker/%1$s/%2$s";
  private static final String URL_CURRENCY_PAIRS = "https://cex.io/api/currency_limits";
  
  static
  {
    CURRENCY_PAIRS.put("BTC", new String[] { "USD", "EUR", "GBP", "RUB" });
    CURRENCY_PAIRS.put("ETH", new String[] { "USD", "EUR", "BTC" });
    CURRENCY_PAIRS.put("GHS", new String[] { "BTC" });
  }
  
  public CexIO()
  {
    super("CEX.IO", "CEX IO", CURRENCY_PAIRS);
  }
  
  public String getCurrencyPairsUrl(int paramInt)
  {
    return "https://cex.io/api/currency_limits";
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return String.format("https://cex.io/api/ticker/%1$s/%2$s", new Object[] { paramCheckerInfo.getCurrencyBase(), paramCheckerInfo.getCurrencyCounter() });
  }
  
  protected void parseCurrencyPairsFromJsonObject(int paramInt, JSONObject paramJSONObject, List<CurrencyPairInfo> paramList)
    throws Exception
  {
    paramJSONObject = paramJSONObject.getJSONObject("data").getJSONArray("pairs");
    for (paramInt = 0; paramInt < paramJSONObject.length(); paramInt++)
    {
      Object localObject = paramJSONObject.getJSONObject(paramInt);
      String str = ((JSONObject)localObject).getString("symbol1");
      localObject = ((JSONObject)localObject).getString("symbol2");
      if ((str != null) && (localObject != null)) {
        paramList.add(new CurrencyPairInfo(str, (String)localObject, null));
      }
    }
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    if (paramJSONObject.has("bid")) {
      paramTicker.bid = paramJSONObject.getDouble("bid");
    }
    if (paramJSONObject.has("ask")) {
      paramTicker.ask = paramJSONObject.getDouble("ask");
    }
    paramTicker.vol = paramJSONObject.getDouble("volume");
    paramTicker.high = paramJSONObject.getDouble("high");
    paramTicker.low = paramJSONObject.getDouble("low");
    paramTicker.last = paramJSONObject.getDouble("last");
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/CexIO.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */