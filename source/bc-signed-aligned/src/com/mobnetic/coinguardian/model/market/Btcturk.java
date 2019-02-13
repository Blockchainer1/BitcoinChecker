package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.HashMap;
import java.util.LinkedHashMap;
import org.json.JSONArray;
import org.json.JSONObject;

public class Btcturk
  extends Market
{
  private static final HashMap<String, CharSequence[]> CURRENCY_PAIRS = new LinkedHashMap();
  private static final String NAME = "BtcTurk";
  private static final String TTS_NAME = "Btc Turk";
  private static final String URL = "https://www.btcturk.com/api/ticker";
  
  static
  {
    CURRENCY_PAIRS.put("BTC", new String[] { "TRY" });
    CURRENCY_PAIRS.put("ETH", new String[] { "BTC", "TRY" });
  }
  
  public Btcturk()
  {
    super("BtcTurk", "Btc Turk", CURRENCY_PAIRS);
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return "https://www.btcturk.com/api/ticker";
  }
  
  protected void parseTicker(int paramInt, String paramString, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramString = new JSONArray(paramString);
    paramCheckerInfo = paramCheckerInfo.getCurrencyBase() + paramCheckerInfo.getCurrencyCounter();
    for (paramInt = 0;; paramInt++) {
      if (paramInt < paramString.length())
      {
        JSONObject localJSONObject = paramString.getJSONObject(paramInt);
        if (paramCheckerInfo.equals(localJSONObject.getString("pair")))
        {
          paramTicker.bid = localJSONObject.getDouble("bid");
          paramTicker.ask = localJSONObject.getDouble("ask");
          paramTicker.vol = localJSONObject.getDouble("volume");
          paramTicker.high = localJSONObject.getDouble("high");
          paramTicker.low = localJSONObject.getDouble("low");
          paramTicker.last = localJSONObject.getDouble("last");
          paramTicker.timestamp = ((localJSONObject.getDouble("timestamp") * 1000.0D));
        }
      }
      else
      {
        return;
      }
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/Btcturk.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */