package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.HashMap;
import java.util.LinkedHashMap;
import org.json.JSONObject;

public class BitcoinToYou
  extends Market
{
  private static final HashMap<String, CharSequence[]> CURRENCY_PAIRS = new LinkedHashMap();
  private static final String NAME = "BitcoinToYou";
  private static final String TTS_NAME = "Bitcoin To You";
  private static final String URL = "https://www.bitcointoyou.com/api/ticker.aspx";
  
  static
  {
    CURRENCY_PAIRS.put("BTC", new String[] { "BRL" });
  }
  
  public BitcoinToYou()
  {
    super("BitcoinToYou", "Bitcoin To You", CURRENCY_PAIRS);
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return "https://www.bitcointoyou.com/api/ticker.aspx";
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramJSONObject = paramJSONObject.getJSONObject("ticker");
    paramTicker.bid = paramJSONObject.getDouble("buy");
    paramTicker.ask = paramJSONObject.getDouble("sell");
    paramTicker.vol = paramJSONObject.getDouble("vol");
    paramTicker.high = paramJSONObject.getDouble("high");
    paramTicker.low = paramJSONObject.getDouble("low");
    paramTicker.last = paramJSONObject.getDouble("last");
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/BitcoinToYou.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */