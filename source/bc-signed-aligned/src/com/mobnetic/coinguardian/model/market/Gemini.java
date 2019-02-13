package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.HashMap;
import java.util.LinkedHashMap;
import org.json.JSONArray;
import org.json.JSONObject;

public class Gemini
  extends Market
{
  private static final HashMap<String, CharSequence[]> CURRENCY_PAIRS = new LinkedHashMap();
  private static final String NAME = "Gemini";
  private static final String TTS_NAME = "Gemini";
  private static final String URL = "https://api.gemini.com/v1/book/%1$s%2$s?limit_asks=1&limit_bids=1";
  
  static
  {
    CURRENCY_PAIRS.put("BTC", new String[] { "USD" });
    CURRENCY_PAIRS.put("ETH", new String[] { "BTC", "USD" });
  }
  
  public Gemini()
  {
    super("Gemini", "Gemini", CURRENCY_PAIRS);
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return String.format("https://api.gemini.com/v1/book/%1$s%2$s?limit_asks=1&limit_bids=1", new Object[] { paramCheckerInfo.getCurrencyBase(), paramCheckerInfo.getCurrencyCounter() });
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramCheckerInfo = paramJSONObject.getJSONArray("bids");
    if ((paramCheckerInfo != null) && (paramCheckerInfo.length() > 0)) {
      paramTicker.bid = paramCheckerInfo.getJSONObject(0).getDouble("price");
    }
    paramJSONObject = paramJSONObject.getJSONArray("asks");
    if ((paramJSONObject != null) && (paramJSONObject.length() > 0)) {
      paramTicker.ask = paramJSONObject.getJSONObject(0).getDouble("price");
    }
    if ((paramTicker.bid != -1.0D) && (paramTicker.ask != -1.0D)) {
      paramTicker.last = ((paramTicker.bid + paramTicker.ask) / 2.0D);
    }
    for (;;)
    {
      return;
      if (paramTicker.bid != -1.0D) {
        paramTicker.last = paramTicker.bid;
      } else if (paramTicker.ask != -1.0D) {
        paramTicker.last = paramTicker.ask;
      } else {
        paramTicker.last = 0.0D;
      }
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/Gemini.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */