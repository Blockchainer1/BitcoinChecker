package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.HashMap;
import java.util.LinkedHashMap;
import org.json.JSONObject;

public class CoinFloor
  extends Market
{
  private static final HashMap<String, CharSequence[]> CURRENCY_PAIRS = new LinkedHashMap();
  private static final String NAME = "Coinfloor";
  private static final String TTS_NAME = "Coin Floor";
  private static final String URL = "https://webapi.coinfloor.co.uk:8090/bist/%1$s/%2$s/ticker/";
  
  static
  {
    CURRENCY_PAIRS.put("XBT", new String[] { "GBP", "EUR", "USD" });
    CURRENCY_PAIRS.put("BCH", new String[] { "GBP" });
  }
  
  public CoinFloor()
  {
    super("Coinfloor", "Coin Floor", CURRENCY_PAIRS);
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return String.format("https://webapi.coinfloor.co.uk:8090/bist/%1$s/%2$s/ticker/", new Object[] { paramCheckerInfo.getCurrencyBase(), paramCheckerInfo.getCurrencyCounter() });
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


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/CoinFloor.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */