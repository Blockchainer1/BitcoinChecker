package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.HashMap;
import java.util.LinkedHashMap;
import org.json.JSONObject;

public class Okcoin
  extends Market
{
  private static final HashMap<String, CharSequence[]> CURRENCY_PAIRS = new LinkedHashMap();
  private static final String NAME = "OKCoin";
  private static final String TTS_NAME = "OK Coin";
  private static final String URL_CNY = "https://www.okcoin.cn/api/v1/ticker.do?symbol=%1$s_%2$s";
  private static final String URL_USD = "https://www.okcoin.com/api/v1/ticker.do?symbol=%1$s_%2$s";
  
  static
  {
    CURRENCY_PAIRS.put("BTC", new String[] { "CNY", "USD" });
    CURRENCY_PAIRS.put("LTC", new String[] { "CNY", "USD" });
  }
  
  public Okcoin()
  {
    super("OKCoin", "OK Coin", CURRENCY_PAIRS);
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    if ("USD".equals(paramCheckerInfo.getCurrencyCounter())) {}
    for (paramCheckerInfo = String.format("https://www.okcoin.com/api/v1/ticker.do?symbol=%1$s_%2$s", new Object[] { paramCheckerInfo.getCurrencyBaseLowerCase(), paramCheckerInfo.getCurrencyCounterLowerCase() });; paramCheckerInfo = String.format("https://www.okcoin.cn/api/v1/ticker.do?symbol=%1$s_%2$s", new Object[] { paramCheckerInfo.getCurrencyBaseLowerCase(), paramCheckerInfo.getCurrencyCounterLowerCase() })) {
      return paramCheckerInfo;
    }
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


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/Okcoin.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */