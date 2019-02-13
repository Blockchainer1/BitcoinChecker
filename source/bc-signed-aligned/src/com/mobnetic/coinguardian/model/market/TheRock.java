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

public class TheRock
  extends Market
{
  private static final HashMap<String, CharSequence[]> CURRENCY_PAIRS = new LinkedHashMap();
  private static final String NAME = "TheRock";
  private static final String TTS_NAME = "The Rock";
  private static final String URL = "https://api.therocktrading.com/v1/funds/%1$s/ticker";
  private static final String URL_CURRENCY_PAIRS = "https://api.therocktrading.com/v1/funds";
  
  static
  {
    CURRENCY_PAIRS.put("BTC", new String[] { "EUR", "USD", "XRP" });
    CURRENCY_PAIRS.put("EUR", new String[] { "DOGE", "XRP" });
    CURRENCY_PAIRS.put("LTC", new String[] { "BTC", "EUR", "USD" });
    CURRENCY_PAIRS.put("NMC", new String[] { "BTC" });
    CURRENCY_PAIRS.put("PPC", new String[] { "EUR" });
    CURRENCY_PAIRS.put("USD", new String[] { "XRP" });
  }
  
  public TheRock()
  {
    super("TheRock", "The Rock", CURRENCY_PAIRS);
  }
  
  private String fixCurrency(String paramString)
  {
    String str = paramString;
    if ("DOGE".equals(paramString)) {
      str = "DOG";
    }
    return str;
  }
  
  public String getCurrencyPairsUrl(int paramInt)
  {
    return "https://api.therocktrading.com/v1/funds";
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    String str1 = paramCheckerInfo.getCurrencyPairId();
    String str2 = str1;
    if (str1 == null) {
      str2 = fixCurrency(paramCheckerInfo.getCurrencyBase()) + fixCurrency(paramCheckerInfo.getCurrencyCounter());
    }
    return String.format("https://api.therocktrading.com/v1/funds/%1$s/ticker", new Object[] { str2 });
  }
  
  protected void parseCurrencyPairsFromJsonObject(int paramInt, JSONObject paramJSONObject, List<CurrencyPairInfo> paramList)
    throws Exception
  {
    paramJSONObject = paramJSONObject.getJSONArray("funds");
    for (paramInt = 0; paramInt < paramJSONObject.length(); paramInt++)
    {
      JSONObject localJSONObject = paramJSONObject.getJSONObject(paramInt);
      paramList.add(new CurrencyPairInfo(localJSONObject.getString("trade_currency"), localJSONObject.getString("base_currency"), localJSONObject.getString("id")));
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


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/TheRock.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */