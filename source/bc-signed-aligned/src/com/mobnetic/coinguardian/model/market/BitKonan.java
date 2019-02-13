package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.HashMap;
import java.util.LinkedHashMap;
import org.json.JSONObject;

public class BitKonan
  extends Market
{
  private static final HashMap<String, CharSequence[]> CURRENCY_PAIRS = new LinkedHashMap();
  private static final String NAME = "BitKonan";
  private static final String TTS_NAME = "Bit Konan";
  private static final String URL_BTC = "https://bitkonan.com/api/ticker";
  private static final String URL_LTC = "https://bitkonan.com/api/ltc_ticker";
  
  static
  {
    CURRENCY_PAIRS.put("BTC", new String[] { "USD" });
    CURRENCY_PAIRS.put("LTC", new String[] { "USD" });
  }
  
  public BitKonan()
  {
    super("BitKonan", "Bit Konan", CURRENCY_PAIRS);
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    if ("BTC".equals(paramCheckerInfo.getCurrencyBase())) {}
    for (paramCheckerInfo = "https://bitkonan.com/api/ticker";; paramCheckerInfo = "https://bitkonan.com/api/ltc_ticker") {
      return paramCheckerInfo;
    }
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramTicker.bid = paramJSONObject.getDouble("bid");
    paramTicker.ask = paramJSONObject.getDouble("ask");
    paramTicker.vol = paramJSONObject.getDouble("volume");
    paramTicker.high = paramJSONObject.getDouble("high");
    paramTicker.low = paramJSONObject.getDouble("low");
    paramTicker.last = paramJSONObject.getDouble("last");
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/BitKonan.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */