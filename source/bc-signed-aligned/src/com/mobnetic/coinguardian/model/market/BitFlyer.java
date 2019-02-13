package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.HashMap;
import java.util.LinkedHashMap;
import org.json.JSONObject;

public class BitFlyer
  extends Market
{
  private static final HashMap<String, CharSequence[]> CURRENCY_PAIRS = new LinkedHashMap();
  private static final String NAME = "bitFlyer";
  private static final String TTS_NAME = "bit flyer";
  private static final String URL = "https://api.bitflyer.jp/v1/ticker?product_code=%1$s_%2$s";
  
  static
  {
    CURRENCY_PAIRS.put("BTC", new String[] { "JPY" });
    CURRENCY_PAIRS.put("ETH", new String[] { "BTC" });
  }
  
  public BitFlyer()
  {
    super("bitFlyer", "bit flyer", CURRENCY_PAIRS);
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return String.format("https://api.bitflyer.jp/v1/ticker?product_code=%1$s_%2$s", new Object[] { paramCheckerInfo.getCurrencyBase(), paramCheckerInfo.getCurrencyCounter() });
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramTicker.bid = paramJSONObject.getDouble("best_bid");
    paramTicker.ask = paramJSONObject.getDouble("best_ask");
    paramTicker.vol = paramJSONObject.getDouble("volume_by_product");
    paramTicker.last = paramJSONObject.getDouble("ltp");
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/BitFlyer.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */