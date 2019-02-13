package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.HashMap;
import java.util.LinkedHashMap;
import org.json.JSONObject;

public class BitCore
  extends Market
{
  private static final HashMap<String, CharSequence[]> CURRENCY_PAIRS = new LinkedHashMap();
  private static final String NAME = "BitCore";
  private static final String TTS_NAME = "Bit Core";
  private static final String URL = "http://api.bitcore.co.kr/ticker";
  
  static
  {
    CURRENCY_PAIRS.put("BTC", new String[] { "KRW" });
  }
  
  public BitCore()
  {
    super("BitCore", "Bit Core", CURRENCY_PAIRS);
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return "http://api.bitcore.co.kr/ticker";
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramTicker.vol = paramJSONObject.getDouble("volume");
    paramTicker.last = paramJSONObject.getDouble("last");
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/BitCore.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */