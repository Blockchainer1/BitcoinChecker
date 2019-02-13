package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.HashMap;
import java.util.LinkedHashMap;
import org.json.JSONArray;

public class BitoEX
  extends Market
{
  private static final HashMap<String, CharSequence[]> CURRENCY_PAIRS = new LinkedHashMap();
  private static final String NAME = "BitoEX";
  private static final String TTS_NAME = "BitoEX";
  private static final String URL = "https://www.bitoex.com/sync/dashboard/%1$s";
  
  static
  {
    CURRENCY_PAIRS.put("BTC", new String[] { "TWD" });
  }
  
  public BitoEX()
  {
    super("BitoEX", "BitoEX", CURRENCY_PAIRS);
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return String.format("https://www.bitoex.com/sync/dashboard/%1$s", new Object[] { Long.valueOf(System.currentTimeMillis()) });
  }
  
  protected void parseTicker(int paramInt, String paramString, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramString = new JSONArray(paramString);
    paramTicker.ask = Double.parseDouble(paramString.getString(0).replaceAll(",", ""));
    paramTicker.bid = Double.parseDouble(paramString.getString(1).replaceAll(",", ""));
    paramTicker.last = paramTicker.ask;
    paramTicker.timestamp = Long.valueOf(paramString.getString(2)).longValue();
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/BitoEX.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */