package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.HashMap;
import java.util.LinkedHashMap;
import org.json.JSONObject;

public class Bit2c
  extends Market
{
  private static final HashMap<String, CharSequence[]> CURRENCY_PAIRS = new LinkedHashMap();
  private static final String NAME = "Bit2c";
  private static final String TTS_NAME = "Bit 2c";
  private static final String URL = "https://www.bit2c.co.il/Exchanges/%1$s%2$s/Ticker.json";
  
  static
  {
    CURRENCY_PAIRS.put("BTC", new String[] { "NIS" });
    CURRENCY_PAIRS.put("LTC", new String[] { "NIS" });
    CURRENCY_PAIRS.put("BCH", new String[] { "NIS" });
    CURRENCY_PAIRS.put("BTG", new String[] { "NIS" });
  }
  
  public Bit2c()
  {
    super("Bit2c", "Bit 2c", CURRENCY_PAIRS);
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return String.format("https://www.bit2c.co.il/Exchanges/%1$s%2$s/Ticker.json", new Object[] { paramCheckerInfo.getCurrencyBase(), paramCheckerInfo.getCurrencyCounter() });
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramTicker.bid = paramJSONObject.getDouble("h");
    paramTicker.ask = paramJSONObject.getDouble("l");
    paramTicker.vol = paramJSONObject.getDouble("a");
    paramTicker.last = paramJSONObject.getDouble("ll");
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/Bit2c.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */