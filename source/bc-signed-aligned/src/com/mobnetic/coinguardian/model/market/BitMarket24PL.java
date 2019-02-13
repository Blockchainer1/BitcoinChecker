package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.HashMap;
import java.util.LinkedHashMap;
import org.json.JSONObject;

public class BitMarket24PL
  extends Market
{
  private static final HashMap<String, CharSequence[]> CURRENCY_PAIRS = new LinkedHashMap();
  private static final String NAME = "BitMarket24.pl";
  private static final String TTS_NAME = "Bit Market 24";
  private static final String URL = "https://bitmarket24.pl/api/%1$s_%2$s/status.json";
  
  static
  {
    CURRENCY_PAIRS.put("BCC", new String[] { "PLN" });
    CURRENCY_PAIRS.put("BTC", new String[] { "PLN" });
    CURRENCY_PAIRS.put("BTG", new String[] { "PLN" });
    CURRENCY_PAIRS.put("LTC", new String[] { "BTC", "PLN" });
  }
  
  public BitMarket24PL()
  {
    super("BitMarket24.pl", "Bit Market 24", CURRENCY_PAIRS);
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return String.format("https://bitmarket24.pl/api/%1$s_%2$s/status.json", new Object[] { paramCheckerInfo.getCurrencyBase(), paramCheckerInfo.getCurrencyCounter() });
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    if (!paramJSONObject.isNull("bid")) {
      paramTicker.bid = paramJSONObject.getDouble("bid");
    }
    if (!paramJSONObject.isNull("ask")) {
      paramTicker.ask = paramJSONObject.getDouble("ask");
    }
    if (!paramJSONObject.isNull("volume")) {
      paramTicker.vol = paramJSONObject.getDouble("volume");
    }
    if (!paramJSONObject.isNull("high")) {
      paramTicker.high = paramJSONObject.getDouble("high");
    }
    if (!paramJSONObject.isNull("low")) {
      paramTicker.low = paramJSONObject.getDouble("low");
    }
    paramTicker.last = paramJSONObject.getDouble("last");
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/BitMarket24PL.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */