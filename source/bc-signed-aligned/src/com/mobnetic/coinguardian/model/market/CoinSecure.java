package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.HashMap;
import java.util.LinkedHashMap;
import org.json.JSONObject;

public class CoinSecure
  extends Market
{
  private static final HashMap<String, CharSequence[]> CURRENCY_PAIRS = new LinkedHashMap();
  private static final String NAME = "CoinSecure";
  private static final String TTS_NAME = "Coin Secure";
  private static final String URL = "https://api.coinsecure.in/v1/exchange/ticker";
  
  static
  {
    CURRENCY_PAIRS.put("BTC", new String[] { "INR" });
  }
  
  public CoinSecure()
  {
    super("CoinSecure", "Coin Secure", CURRENCY_PAIRS);
  }
  
  private double parsePrice(double paramDouble)
  {
    return paramDouble / 100.0D;
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return "https://api.coinsecure.in/v1/exchange/ticker";
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramJSONObject = paramJSONObject.getJSONObject("message");
    paramTicker.bid = parsePrice(paramJSONObject.getDouble("bid"));
    paramTicker.ask = parsePrice(paramJSONObject.getDouble("ask"));
    paramTicker.vol = (paramJSONObject.getDouble("coinvolume") / 1.0E8D);
    paramTicker.high = parsePrice(paramJSONObject.getDouble("high"));
    paramTicker.low = parsePrice(paramJSONObject.getDouble("low"));
    paramTicker.last = parsePrice(paramJSONObject.getDouble("lastPrice"));
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/CoinSecure.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */