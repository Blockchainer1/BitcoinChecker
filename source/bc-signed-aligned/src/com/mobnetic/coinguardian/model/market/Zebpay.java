package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.HashMap;
import java.util.LinkedHashMap;
import org.json.JSONObject;

public class Zebpay
  extends Market
{
  private static final HashMap<String, CharSequence[]> CURRENCY_PAIRS = new LinkedHashMap();
  private static final String NAME = "Zebpay";
  private static final String TTS_NAME = "Zeb Pay";
  private static final String URL = "https://www.zebapi.com/api/v1/market/ticker/%1$s/%2$s";
  
  static
  {
    CURRENCY_PAIRS.put("BTC", new String[] { "INR" });
  }
  
  public Zebpay()
  {
    super("Zebpay", "Zeb Pay", CURRENCY_PAIRS);
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return String.format("https://www.zebapi.com/api/v1/market/ticker/%1$s/%2$s", new Object[] { paramCheckerInfo.getCurrencyBaseLowerCase(), paramCheckerInfo.getCurrencyCounterLowerCase() });
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramTicker.bid = paramJSONObject.getDouble("sell");
    paramTicker.ask = paramJSONObject.getDouble("buy");
    paramTicker.vol = paramJSONObject.getDouble("volume");
    paramTicker.last = paramJSONObject.getDouble("market");
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/Zebpay.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */