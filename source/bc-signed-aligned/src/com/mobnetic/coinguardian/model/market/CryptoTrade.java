package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.HashMap;
import java.util.LinkedHashMap;
import org.json.JSONObject;

public class CryptoTrade
  extends Market
{
  private static final HashMap<String, CharSequence[]> CURRENCY_PAIRS = new LinkedHashMap();
  private static final String NAME = "Crypto-Trade";
  private static final String TTS_NAME = "Crypto Trade";
  private static final String URL = "https://crypto-trade.com/api/1/ticker/%1$s_%2$s";
  
  static
  {
    CURRENCY_PAIRS.put("BTC", new String[] { "USD", "EUR" });
    CURRENCY_PAIRS.put("LTC", new String[] { "USD", "EUR", "BTC" });
    CURRENCY_PAIRS.put("NMC", new String[] { "USD", "BTC" });
    CURRENCY_PAIRS.put("XPM", new String[] { "USD", "BTC", "PPC" });
    CURRENCY_PAIRS.put("PPC", new String[] { "USD", "BTC" });
    CURRENCY_PAIRS.put("TRC", new String[] { "BTC" });
    CURRENCY_PAIRS.put("FTC", new String[] { "USD", "BTC" });
    CURRENCY_PAIRS.put("DVC", new String[] { "BTC" });
    CURRENCY_PAIRS.put("WDC", new String[] { "USD", "BTC" });
    CURRENCY_PAIRS.put("DGC", new String[] { "BTC" });
    CURRENCY_PAIRS.put("UTC", new String[] { "USD", "EUR", "BTC" });
  }
  
  public CryptoTrade()
  {
    super("Crypto-Trade", "Crypto Trade", CURRENCY_PAIRS);
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return String.format("https://crypto-trade.com/api/1/ticker/%1$s_%2$s", new Object[] { paramCheckerInfo.getCurrencyBaseLowerCase(), paramCheckerInfo.getCurrencyCounterLowerCase() });
  }
  
  protected String parseErrorFromJsonObject(int paramInt, JSONObject paramJSONObject, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    return paramJSONObject.getString("error");
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramJSONObject = paramJSONObject.getJSONObject("data");
    paramTicker.bid = paramJSONObject.getDouble("max_bid");
    paramTicker.ask = paramJSONObject.getDouble("min_ask");
    paramTicker.vol = paramJSONObject.getDouble("vol_" + paramCheckerInfo.getCurrencyBaseLowerCase());
    paramTicker.high = paramJSONObject.getDouble("high");
    paramTicker.low = paramJSONObject.getDouble("low");
    paramTicker.last = paramJSONObject.getDouble("last");
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/CryptoTrade.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */