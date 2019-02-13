package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.HashMap;
import java.util.LinkedHashMap;
import org.json.JSONObject;

public class Fxbtc
  extends Market
{
  private static final HashMap<String, CharSequence[]> CURRENCY_PAIRS = new LinkedHashMap();
  private static final String NAME = "FxBtc";
  private static final String TTS_NAME = "FxBtc";
  private static final String URL = "https://www.fxbtc.com/jport?op=query&type=ticker&symbol=%1$s_%2$s";
  
  static
  {
    CURRENCY_PAIRS.put("BTC", new String[] { "CNY" });
    CURRENCY_PAIRS.put("LTC", new String[] { "CNY", "BTC" });
  }
  
  public Fxbtc()
  {
    super("FxBtc", "FxBtc", CURRENCY_PAIRS);
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return String.format("https://www.fxbtc.com/jport?op=query&type=ticker&symbol=%1$s_%2$s", new Object[] { paramCheckerInfo.getCurrencyBaseLowerCase(), paramCheckerInfo.getCurrencyCounterLowerCase() });
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramJSONObject = paramJSONObject.getJSONObject("ticker");
    paramTicker.bid = paramJSONObject.getDouble("bid");
    paramTicker.ask = paramJSONObject.getDouble("ask");
    paramTicker.vol = paramJSONObject.getDouble("vol");
    paramTicker.high = paramJSONObject.getDouble("high");
    paramTicker.low = paramJSONObject.getDouble("low");
    paramTicker.last = paramJSONObject.getDouble("last_rate");
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/Fxbtc.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */