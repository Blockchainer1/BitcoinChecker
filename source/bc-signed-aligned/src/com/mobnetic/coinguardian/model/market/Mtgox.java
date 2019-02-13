package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.HashMap;
import java.util.LinkedHashMap;
import org.json.JSONObject;

public class Mtgox
  extends Market
{
  private static final HashMap<String, CharSequence[]> CURRENCY_PAIRS = new LinkedHashMap();
  private static final String NAME = "Mtgox";
  private static final String TTS_NAME = "MT gox";
  private static final String URL = "https://data.mtgox.com/api/2/%1$s%2$s/money/ticker";
  
  static
  {
    CURRENCY_PAIRS.put("BTC", new String[] { "USD", "EUR", "CAD", "GBP", "CHF", "RUB", "AUD", "SEK", "DKK", "HKD", "PLN", "CNY", "SGD", "THB", "NZD", "JPY" });
  }
  
  public Mtgox()
  {
    super("Mtgox", "MT gox", CURRENCY_PAIRS);
  }
  
  private double getPriceValueFromObject(JSONObject paramJSONObject, String paramString)
    throws Exception
  {
    return paramJSONObject.getJSONObject(paramString).getDouble("value");
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return String.format("https://data.mtgox.com/api/2/%1$s%2$s/money/ticker", new Object[] { paramCheckerInfo.getCurrencyBase(), paramCheckerInfo.getCurrencyCounter() });
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramJSONObject = paramJSONObject.getJSONObject("data");
    paramTicker.bid = getPriceValueFromObject(paramJSONObject, "buy");
    paramTicker.ask = getPriceValueFromObject(paramJSONObject, "sell");
    paramTicker.vol = getPriceValueFromObject(paramJSONObject, "vol");
    paramTicker.high = getPriceValueFromObject(paramJSONObject, "high");
    paramTicker.low = getPriceValueFromObject(paramJSONObject, "low");
    paramTicker.last = getPriceValueFromObject(paramJSONObject, "last_local");
    paramTicker.timestamp = (paramJSONObject.getLong("now") / 1000L);
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/Mtgox.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */