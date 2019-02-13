package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.HashMap;
import java.util.LinkedHashMap;
import org.json.JSONObject;

public class Coinnest
  extends Market
{
  private static final HashMap<String, CharSequence[]> CURRENCY_PAIRS = new LinkedHashMap();
  private static final String NAME = "Coinnest";
  private static final String TTS_NAME = "Coinnest";
  private static final String URL = "https://api.coinnest.co.kr/api/pub/ticker?coin=%1$s";
  
  static
  {
    CURRENCY_PAIRS.put("BTC", new String[] { "KRW" });
    CURRENCY_PAIRS.put("BCC", new String[] { "KRW" });
    CURRENCY_PAIRS.put("ETH", new String[] { "KRW" });
    CURRENCY_PAIRS.put("ETC", new String[] { "KRW" });
    CURRENCY_PAIRS.put("QTUM", new String[] { "KRW" });
    CURRENCY_PAIRS.put("NEO", new String[] { "KRW" });
    CURRENCY_PAIRS.put("KNC", new String[] { "KRW" });
    CURRENCY_PAIRS.put("TSL", new String[] { "KRW" });
    CURRENCY_PAIRS.put("OMG", new String[] { "KRW" });
  }
  
  public Coinnest()
  {
    super("Coinnest", "Coinnest", CURRENCY_PAIRS);
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return String.format("https://api.coinnest.co.kr/api/pub/ticker?coin=%1$s", new Object[] { paramCheckerInfo.getCurrencyBaseLowerCase() });
  }
  
  protected String parseErrorFromJsonObject(int paramInt, JSONObject paramJSONObject, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    return paramJSONObject.getString("msg");
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramTicker.high = paramJSONObject.getDouble("high");
    paramTicker.low = paramJSONObject.getDouble("low");
    paramTicker.bid = paramJSONObject.getDouble("buy");
    paramTicker.ask = paramJSONObject.getDouble("sell");
    paramTicker.last = paramJSONObject.getDouble("last");
    paramTicker.vol = paramJSONObject.getDouble("vol");
    paramTicker.timestamp = (paramJSONObject.getLong("time") * 1000L);
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/Coinnest.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */