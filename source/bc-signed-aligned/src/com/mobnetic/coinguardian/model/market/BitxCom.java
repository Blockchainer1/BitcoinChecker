package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.HashMap;
import java.util.LinkedHashMap;
import org.json.JSONObject;

public class BitxCom
  extends Market
{
  private static final HashMap<String, CharSequence[]> CURRENCY_PAIRS = new LinkedHashMap();
  private static final String NAME = "CoinsBank";
  private static final String TTS_NAME = "CoinsBank";
  private static final String URL = "https://coinsbank.com/api/public/ticker?pair=%1$s%2$s";
  
  static
  {
    CURRENCY_PAIRS.put("BTC", new String[] { "EUR", "GBP", "USD" });
    CURRENCY_PAIRS.put("LTC", new String[] { "BTC", "EUR", "GBP", "USD" });
    CURRENCY_PAIRS.put("GHS", new String[] { "BTC", "EUR", "GBP", "LTC", "USD" });
    CURRENCY_PAIRS.put("EUR", new String[] { "GBP", "USD" });
    CURRENCY_PAIRS.put("GBP", new String[] { "USD" });
  }
  
  public BitxCom()
  {
    super("CoinsBank", "CoinsBank", CURRENCY_PAIRS);
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return String.format("https://coinsbank.com/api/public/ticker?pair=%1$s%2$s", new Object[] { paramCheckerInfo.getCurrencyBase(), paramCheckerInfo.getCurrencyCounter() });
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramJSONObject = paramJSONObject.getJSONObject("data");
    paramTicker.bid = paramJSONObject.getDouble("buy");
    paramTicker.ask = paramJSONObject.getDouble("sell");
    paramTicker.vol = paramJSONObject.getDouble("volume");
    paramTicker.high = paramJSONObject.getDouble("high");
    paramTicker.low = paramJSONObject.getDouble("low");
    paramTicker.last = paramJSONObject.getDouble("last");
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/BitxCom.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */