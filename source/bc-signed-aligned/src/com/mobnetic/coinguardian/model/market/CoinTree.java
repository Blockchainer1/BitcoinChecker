package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.HashMap;
import java.util.LinkedHashMap;
import org.json.JSONObject;

public class CoinTree
  extends Market
{
  private static final HashMap<String, CharSequence[]> CURRENCY_PAIRS = new LinkedHashMap();
  private static final String NAME = "CoinTree";
  private static final String TTS_NAME = "Coin Tree";
  private static final String URL = "https://www.cointree.com.au/api/price/btc/aud";
  
  static
  {
    CURRENCY_PAIRS.put("BTC", new String[] { "AUD" });
  }
  
  public CoinTree()
  {
    super("CoinTree", "Coin Tree", CURRENCY_PAIRS);
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return "https://www.cointree.com.au/api/price/btc/aud";
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramTicker.bid = paramJSONObject.getDouble("Bid");
    paramTicker.ask = paramJSONObject.getDouble("Ask");
    paramTicker.last = paramJSONObject.getDouble("Spot");
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/CoinTree.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */