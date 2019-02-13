package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.HashMap;
import java.util.LinkedHashMap;
import org.json.JSONObject;

public class ItBit
  extends Market
{
  private static final HashMap<String, CharSequence[]> CURRENCY_PAIRS = new LinkedHashMap();
  private static final String NAME = "itBit";
  private static final String TTS_NAME = "It Bit";
  private static final String URL = "https://api.itbit.com/v1/markets/%1$s%2$s/ticker";
  
  static
  {
    CURRENCY_PAIRS.put("BTC", new String[] { "USD", "SGD", "EUR" });
  }
  
  public ItBit()
  {
    super("itBit", "It Bit", CURRENCY_PAIRS);
  }
  
  private String fixCurrency(String paramString)
  {
    String str = paramString;
    if ("BTC".equals(paramString)) {
      str = "XBT";
    }
    return str;
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return String.format("https://api.itbit.com/v1/markets/%1$s%2$s/ticker", new Object[] { fixCurrency(paramCheckerInfo.getCurrencyBase()), paramCheckerInfo.getCurrencyCounter() });
  }
  
  protected String parseErrorFromJsonObject(int paramInt, JSONObject paramJSONObject, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    return paramJSONObject.getString("message");
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramTicker.bid = paramJSONObject.getDouble("bid");
    paramTicker.ask = paramJSONObject.getDouble("ask");
    paramTicker.vol = paramJSONObject.getDouble("volume24h");
    paramTicker.high = paramJSONObject.getDouble("high24h");
    paramTicker.low = paramJSONObject.getDouble("low24h");
    paramTicker.last = paramJSONObject.getDouble("lastPrice");
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/ItBit.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */