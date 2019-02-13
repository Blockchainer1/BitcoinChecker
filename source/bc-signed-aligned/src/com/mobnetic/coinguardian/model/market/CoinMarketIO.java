package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.HashMap;
import java.util.LinkedHashMap;
import org.json.JSONObject;

public class CoinMarketIO
  extends Market
{
  private static final HashMap<String, CharSequence[]> CURRENCY_PAIRS = new LinkedHashMap();
  private static final String NAME = "CoinMarket.io";
  private static final String TTS_NAME = "Coin Market IO";
  private static final String URL = "https://coinmarket.io/ticker/%1$s%2$s";
  
  static
  {
    CURRENCY_PAIRS.put("LEAF", new String[] { "BTC" });
    CURRENCY_PAIRS.put("USDE", new String[] { "BTC" });
    CURRENCY_PAIRS.put("DGB", new String[] { "BTC" });
    CURRENCY_PAIRS.put("KDC", new String[] { "BTC" });
    CURRENCY_PAIRS.put("CON", new String[] { "BTC" });
    CURRENCY_PAIRS.put("NOBL", new String[] { "BTC" });
    CURRENCY_PAIRS.put("SMC", new String[] { "BTC" });
    CURRENCY_PAIRS.put("VTC", new String[] { "BTC" });
    CURRENCY_PAIRS.put("UTC", new String[] { "BTC" });
    CURRENCY_PAIRS.put("KARM", new String[] { "BTC" });
    CURRENCY_PAIRS.put("RDD", new String[] { "BTC" });
    CURRENCY_PAIRS.put("RPD", new String[] { "BTC" });
    CURRENCY_PAIRS.put("ICN", new String[] { "BTC" });
    CURRENCY_PAIRS.put("PENG", new String[] { "BTC" });
    CURRENCY_PAIRS.put("MINT", new String[] { "BTC" });
  }
  
  public CoinMarketIO()
  {
    super("CoinMarket.io", "Coin Market IO", CURRENCY_PAIRS);
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return String.format("https://coinmarket.io/ticker/%1$s%2$s", new Object[] { paramCheckerInfo.getCurrencyBase(), paramCheckerInfo.getCurrencyCounter() });
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramTicker.vol = paramJSONObject.getDouble("volume24");
    paramTicker.last = paramJSONObject.getDouble("last");
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/CoinMarketIO.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */