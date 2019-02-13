package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.HashMap;
import java.util.LinkedHashMap;

public class Vaultoro
  extends Market
{
  private static final HashMap<String, CharSequence[]> CURRENCY_PAIRS = new LinkedHashMap();
  private static final String NAME = "Vaultoro";
  private static final String TTS_NAME = "Vaultoro";
  private static final String URL = "https://api.vaultoro.com/latest/";
  
  static
  {
    CURRENCY_PAIRS.put("GOLD", new String[] { "BTC" });
  }
  
  public Vaultoro()
  {
    super("Vaultoro", "Vaultoro", CURRENCY_PAIRS);
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return "https://api.vaultoro.com/latest/";
  }
  
  protected void parseTicker(int paramInt, String paramString, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramTicker.last = Double.parseDouble(paramString);
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/Vaultoro.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */