package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.HashMap;
import java.util.LinkedHashMap;
import org.json.JSONObject;

public class DolarBlueNet
  extends Market
{
  private static final HashMap<String, CharSequence[]> CURRENCY_PAIRS = new LinkedHashMap();
  private static final String NAME = "DolarBlue.net";
  private static final String TTS_NAME = "Dolar Blue";
  private static final String URL = "http://dolar.bitplanet.info/api.php";
  
  static
  {
    CURRENCY_PAIRS.put("USD", new String[] { "ARS" });
  }
  
  public DolarBlueNet()
  {
    super("DolarBlue.net", "Dolar Blue", CURRENCY_PAIRS);
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return "http://dolar.bitplanet.info/api.php";
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramTicker.ask = paramJSONObject.getDouble("venta");
    paramTicker.bid = paramJSONObject.getDouble("compra");
    paramTicker.last = paramTicker.ask;
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/DolarBlueNet.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */