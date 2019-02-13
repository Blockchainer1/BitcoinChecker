package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import com.mobnetic.coinguardian.util.ParseUtils;
import java.util.HashMap;
import java.util.LinkedHashMap;
import org.json.JSONObject;

public class BtcXIndia
  extends Market
{
  private static final HashMap<String, CharSequence[]> CURRENCY_PAIRS = new LinkedHashMap();
  private static final String NAME = "BTCXIndia";
  private static final String TTS_NAME = "BTC X India";
  private static final String URL = "https://api.btcxindia.com/ticker";
  
  static
  {
    CURRENCY_PAIRS.put("XRP", new String[] { "INR" });
  }
  
  public BtcXIndia()
  {
    super("BTCXIndia", "BTC X India", CURRENCY_PAIRS);
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return "https://api.btcxindia.com/ticker";
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramTicker.bid = paramJSONObject.getDouble("bid");
    paramTicker.ask = paramJSONObject.getDouble("ask");
    paramTicker.vol = paramJSONObject.getDouble("total_volume_24h");
    paramTicker.high = ParseUtils.getDoubleFromString(paramJSONObject, "high");
    paramTicker.low = ParseUtils.getDoubleFromString(paramJSONObject, "low");
    paramTicker.last = paramJSONObject.getDouble("last_traded_price");
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/BtcXIndia.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */