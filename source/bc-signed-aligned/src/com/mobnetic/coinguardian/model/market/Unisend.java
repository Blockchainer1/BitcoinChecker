package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.HashMap;
import java.util.LinkedHashMap;
import org.json.JSONObject;

public class Unisend
  extends Market
{
  private static final HashMap<String, CharSequence[]> CURRENCY_PAIRS = new LinkedHashMap();
  private static final String NAME = "Unisend";
  private static final String TTS_NAME = "Uni send";
  private static final String URL = "https://www.unisend.com/api/price/ar/ars_btc";
  
  static
  {
    CURRENCY_PAIRS.put("BTC", new String[] { "ARS" });
  }
  
  public Unisend()
  {
    super("Unisend", "Uni send", CURRENCY_PAIRS);
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return String.format("https://www.unisend.com/api/price/ar/ars_btc", new Object[] { paramCheckerInfo.getCurrencyBase(), paramCheckerInfo.getCurrencyCounter() });
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramJSONObject = paramJSONObject.getJSONObject("prices");
    paramTicker.bid = paramJSONObject.getDouble("sell");
    paramTicker.ask = paramJSONObject.getDouble("buy");
    paramTicker.last = paramTicker.ask;
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/Unisend.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */