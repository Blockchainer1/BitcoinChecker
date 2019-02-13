package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.HashMap;
import java.util.LinkedHashMap;
import org.json.JSONArray;
import org.json.JSONObject;

public class Coinone
  extends Market
{
  private static final HashMap<String, CharSequence[]> CURRENCY_PAIRS = new LinkedHashMap();
  private static final String NAME = "Coinone";
  private static final String TTS_NAME = "Coinone";
  private static final String URL_ORDERS = "https://api.coinone.co.kr/orderbook?currency=%1$s";
  private static final String URL_TICKER = "https://api.coinone.co.kr/ticker?currency=%1$s";
  
  static
  {
    CURRENCY_PAIRS.put("BTC", new String[] { "KRW" });
    CURRENCY_PAIRS.put("ETH", new String[] { "KRW" });
    CURRENCY_PAIRS.put("ETC", new String[] { "KRW" });
    CURRENCY_PAIRS.put("XRP", new String[] { "KRW" });
    CURRENCY_PAIRS.put("BCH", new String[] { "KRW" });
    CURRENCY_PAIRS.put("QTUM", new String[] { "KRW" });
  }
  
  public Coinone()
  {
    super("Coinone", "Coinone", CURRENCY_PAIRS);
  }
  
  private double getFirstPriceFromOrder(JSONObject paramJSONObject, String paramString)
    throws Exception
  {
    paramJSONObject = paramJSONObject.getJSONArray(paramString);
    if (paramJSONObject.length() == 0) {}
    for (double d = -1.0D;; d = paramJSONObject.getJSONObject(0).getDouble("price")) {
      return d;
    }
  }
  
  public int getNumOfRequests(CheckerInfo paramCheckerInfo)
  {
    return 2;
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    if (paramInt == 0) {}
    for (paramCheckerInfo = String.format("https://api.coinone.co.kr/ticker?currency=%1$s", new Object[] { paramCheckerInfo.getCurrencyBaseLowerCase() });; paramCheckerInfo = String.format("https://api.coinone.co.kr/orderbook?currency=%1$s", new Object[] { paramCheckerInfo.getCurrencyBaseLowerCase() })) {
      return paramCheckerInfo;
    }
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    if (paramInt == 0)
    {
      paramTicker.vol = paramJSONObject.getDouble("volume");
      paramTicker.high = paramJSONObject.getDouble("high");
      paramTicker.low = paramJSONObject.getDouble("low");
      paramTicker.last = paramJSONObject.getDouble("last");
      paramTicker.timestamp = paramJSONObject.getLong("timestamp");
    }
    for (;;)
    {
      return;
      paramTicker.bid = getFirstPriceFromOrder(paramJSONObject, "bid");
      paramTicker.ask = getFirstPriceFromOrder(paramJSONObject, "ask");
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/Coinone.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */