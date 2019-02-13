package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.HashMap;
import java.util.LinkedHashMap;
import org.json.JSONObject;

public class Btcchina
  extends Market
{
  private static final HashMap<String, CharSequence[]> CURRENCY_PAIRS = new LinkedHashMap();
  private static final String NAME = "BtcChina";
  private static final String TTS_NAME = "BTC China";
  private static final String URL = "https://data.btcchina.com/data/ticker?market=%1$s%2$s";
  
  static
  {
    CURRENCY_PAIRS.put("BTC", new String[] { "LTC", "CNY" });
    CURRENCY_PAIRS.put("LTC", new String[] { "CNY" });
  }
  
  public Btcchina()
  {
    super("BtcChina", "BTC China", CURRENCY_PAIRS);
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return String.format("https://data.btcchina.com/data/ticker?market=%1$s%2$s", new Object[] { paramCheckerInfo.getCurrencyCounterLowerCase(), paramCheckerInfo.getCurrencyBaseLowerCase() });
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramJSONObject = paramJSONObject.getJSONObject("ticker");
    paramTicker.bid = paramJSONObject.getDouble("buy");
    paramTicker.ask = paramJSONObject.getDouble("sell");
    paramTicker.vol = paramJSONObject.getDouble("vol");
    paramTicker.high = paramJSONObject.getDouble("high");
    paramTicker.low = paramJSONObject.getDouble("low");
    paramTicker.last = paramJSONObject.getDouble("last");
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/Btcchina.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */