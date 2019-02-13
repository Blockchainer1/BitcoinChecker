package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.HashMap;
import java.util.LinkedHashMap;
import org.json.JSONArray;
import org.json.JSONObject;

public class Bithumb
  extends Market
{
  private static final HashMap<String, CharSequence[]> CURRENCY_PAIRS = new LinkedHashMap();
  private static final String NAME = "Bithumb";
  private static final String TTS_NAME = "Bithumb";
  private static final String URL_ORDERS = "https://api.bithumb.com/public/orderbook/%1$s?count=1";
  private static final String URL_TICKER = "https://api.bithumb.com/public/ticker/%1$s";
  
  static
  {
    CURRENCY_PAIRS.put("BTC", new String[] { "KRW" });
    CURRENCY_PAIRS.put("ETH", new String[] { "KRW" });
    CURRENCY_PAIRS.put("ETC", new String[] { "KRW" });
    CURRENCY_PAIRS.put("DASH", new String[] { "KRW" });
    CURRENCY_PAIRS.put("LTC", new String[] { "KRW" });
    CURRENCY_PAIRS.put("XRP", new String[] { "KRW" });
    CURRENCY_PAIRS.put("BCH", new String[] { "KRW" });
    CURRENCY_PAIRS.put("XMR", new String[] { "KRW" });
    CURRENCY_PAIRS.put("ZEC", new String[] { "KRW" });
    CURRENCY_PAIRS.put("QTUM", new String[] { "KRW" });
  }
  
  public Bithumb()
  {
    super("Bithumb", "Bithumb", CURRENCY_PAIRS);
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
    for (paramCheckerInfo = String.format("https://api.bithumb.com/public/ticker/%1$s", new Object[] { paramCheckerInfo.getCurrencyBaseLowerCase() });; paramCheckerInfo = String.format("https://api.bithumb.com/public/orderbook/%1$s?count=1", new Object[] { paramCheckerInfo.getCurrencyBaseLowerCase() })) {
      return paramCheckerInfo;
    }
  }
  
  protected String parseErrorFromJsonObject(int paramInt, JSONObject paramJSONObject, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    return paramJSONObject.getString("message");
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramJSONObject = paramJSONObject.getJSONObject("data");
    if (paramInt == 0)
    {
      paramTicker.vol = paramJSONObject.getDouble("volume_1day");
      paramTicker.high = paramJSONObject.getDouble("max_price");
      paramTicker.low = paramJSONObject.getDouble("min_price");
      paramTicker.last = paramJSONObject.getDouble("closing_price");
      paramTicker.timestamp = paramJSONObject.getLong("date");
    }
    for (;;)
    {
      return;
      paramTicker.bid = getFirstPriceFromOrder(paramJSONObject, "bids");
      paramTicker.ask = getFirstPriceFromOrder(paramJSONObject, "asks");
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/Bithumb.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */