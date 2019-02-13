package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.HashMap;
import java.util.LinkedHashMap;
import org.json.JSONObject;

public class SatoshiTango
  extends Market
{
  private static final HashMap<String, CharSequence[]> CURRENCY_PAIRS = new LinkedHashMap();
  private static final String NAME = "SatoshiTango";
  private static final String TTS_NAME = "Satoshi Tango";
  private static final String URL = "https://api.satoshitango.com/v2/ticker";
  
  static
  {
    CURRENCY_PAIRS.put("BTC", new String[] { "USD", "ARS", "EUR" });
  }
  
  public SatoshiTango()
  {
    super("SatoshiTango", "Satoshi Tango", CURRENCY_PAIRS);
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return "https://api.satoshitango.com/v2/ticker";
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramCheckerInfo = paramCheckerInfo.getCurrencyCounterLowerCase() + paramCheckerInfo.getCurrencyBaseLowerCase();
    JSONObject localJSONObject = paramJSONObject.getJSONObject("data");
    paramJSONObject = localJSONObject.getJSONObject("compra");
    localJSONObject = localJSONObject.getJSONObject("venta");
    paramTicker.ask = paramJSONObject.getDouble(paramCheckerInfo);
    paramTicker.bid = localJSONObject.getDouble(paramCheckerInfo);
    paramTicker.last = paramTicker.ask;
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/SatoshiTango.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */