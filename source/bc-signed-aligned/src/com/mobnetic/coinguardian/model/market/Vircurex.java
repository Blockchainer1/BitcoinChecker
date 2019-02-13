package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.HashMap;
import java.util.LinkedHashMap;
import org.json.JSONObject;

public class Vircurex
  extends Market
{
  private static final HashMap<String, CharSequence[]> CURRENCY_PAIRS = new LinkedHashMap();
  private static final String NAME = "Vircurex";
  private static final String TTS_NAME = "Vircurex";
  private static final String URL = "https://api.vircurex.com/api/get_info_for_1_currency.json?base=%1$s&alt=%2$s";
  
  static
  {
    CURRENCY_PAIRS.put("BTC", new String[] { "USD", "EUR", "ANC", "DGC", "DOGE", "DVC", "FRC", "FTC", "I0C", "IXC", "LTC", "NMC", "NVC", "NXT", "PPC", "QRK", "TRC", "VTC", "WDC", "XPM" });
    CURRENCY_PAIRS.put("ANC", new String[] { "USD", "EUR", "BTC", "DGC", "DOGE", "DVC", "FRC", "FTC", "I0C", "IXC", "LTC", "NMC", "NVC", "NXT", "PPC", "QRK", "TRC", "VTC", "WDC", "XPM" });
    CURRENCY_PAIRS.put("DGC", new String[] { "USD", "EUR", "BTC", "ANC", "DOGE", "DVC", "FRC", "FTC", "I0C", "IXC", "LTC", "NMC", "NVC", "NXT", "PPC", "QRK", "TRC", "VTC", "WDC", "XPM" });
    CURRENCY_PAIRS.put("DOGE", new String[] { "USD", "EUR", "BTC", "ANC", "DGC", "DVC", "FRC", "FTC", "I0C", "IXC", "LTC", "NMC", "NVC", "NXT", "PPC", "QRK", "TRC", "VTC", "WDC", "XPM" });
    CURRENCY_PAIRS.put("DVC", new String[] { "USD", "EUR", "BTC", "ANC", "DGC", "DOGE", "FRC", "FTC", "I0C", "IXC", "LTC", "NMC", "NVC", "NXT", "PPC", "QRK", "TRC", "VTC", "WDC", "XPM" });
    CURRENCY_PAIRS.put("FRC", new String[] { "USD", "EUR", "BTC", "ANC", "DGC", "DOGE", "DVC", "FTC", "I0C", "IXC", "LTC", "NMC", "NVC", "NXT", "PPC", "QRK", "TRC", "VTC", "WDC", "XPM" });
    CURRENCY_PAIRS.put("FTC", new String[] { "USD", "EUR", "BTC", "ANC", "DGC", "DOGE", "DVC", "FRC", "I0C", "IXC", "LTC", "NMC", "NVC", "NXT", "PPC", "QRK", "TRC", "VTC", "WDC", "XPM" });
    CURRENCY_PAIRS.put("I0C", new String[] { "USD", "EUR", "BTC", "ANC", "DGC", "DOGE", "DVC", "FRC", "FTC", "IXC", "LTC", "NMC", "NVC", "NXT", "PPC", "QRK", "TRC", "VTC", "WDC", "XPM" });
    CURRENCY_PAIRS.put("IXC", new String[] { "USD", "EUR", "BTC", "ANC", "DGC", "DOGE", "DVC", "FRC", "FTC", "I0C", "LTC", "NMC", "NVC", "NXT", "PPC", "QRK", "TRC", "VTC", "WDC", "XPM" });
    CURRENCY_PAIRS.put("LTC", new String[] { "USD", "EUR", "BTC", "ANC", "DGC", "DOGE", "DVC", "FRC", "FTC", "I0C", "IXC", "NMC", "NVC", "NXT", "PPC", "QRK", "TRC", "VTC", "WDC", "XPM" });
    CURRENCY_PAIRS.put("NMC", new String[] { "USD", "EUR", "BTC", "ANC", "DGC", "DOGE", "DVC", "FRC", "FTC", "I0C", "IXC", "LTC", "NVC", "NXT", "PPC", "QRK", "TRC", "VTC", "WDC", "XPM" });
    CURRENCY_PAIRS.put("NVC", new String[] { "USD", "EUR", "BTC", "ANC", "DGC", "DOGE", "DVC", "FRC", "FTC", "I0C", "IXC", "LTC", "NMC", "NXT", "PPC", "QRK", "TRC", "VTC", "WDC", "XPM" });
    CURRENCY_PAIRS.put("NXT", new String[] { "USD", "EUR", "BTC", "ANC", "DGC", "DOGE", "DVC", "FRC", "FTC", "I0C", "IXC", "LTC", "NMC", "NVC", "PPC", "QRK", "TRC", "VTC", "WDC", "XPM" });
    CURRENCY_PAIRS.put("PPC", new String[] { "USD", "EUR", "BTC", "ANC", "DGC", "DOGE", "DVC", "FRC", "FTC", "I0C", "IXC", "LTC", "NMC", "NVC", "NXT", "QRK", "TRC", "VTC", "WDC", "XPM" });
    CURRENCY_PAIRS.put("QRK", new String[] { "USD", "EUR", "BTC", "ANC", "DGC", "DOGE", "DVC", "FRC", "FTC", "I0C", "IXC", "LTC", "NMC", "NVC", "NXT", "PPC", "TRC", "VTC", "WDC", "XPM" });
    CURRENCY_PAIRS.put("TRC", new String[] { "USD", "EUR", "BTC", "ANC", "DGC", "DOGE", "DVC", "FRC", "FTC", "I0C", "IXC", "LTC", "NMC", "NVC", "NXT", "PPC", "QRK", "VTC", "WDC", "XPM" });
    CURRENCY_PAIRS.put("VTC", new String[] { "USD", "EUR", "BTC", "ANC", "DGC", "DOGE", "DVC", "FRC", "FTC", "I0C", "IXC", "LTC", "NMC", "NVC", "NXT", "PPC", "QRK", "TRC", "WDC", "XPM" });
    CURRENCY_PAIRS.put("WDC", new String[] { "USD", "EUR", "BTC", "ANC", "DGC", "DOGE", "DVC", "FRC", "FTC", "I0C", "IXC", "LTC", "NMC", "NVC", "NXT", "PPC", "QRK", "TRC", "VTC", "XPM" });
    CURRENCY_PAIRS.put("XPM", new String[] { "USD", "EUR", "BTC", "ANC", "DGC", "DOGE", "DVC", "FRC", "FTC", "I0C", "IXC", "LTC", "NMC", "NVC", "NXT", "PPC", "QRK", "TRC", "VTC", "WDC" });
  }
  
  public Vircurex()
  {
    super("Vircurex", "Vircurex", CURRENCY_PAIRS);
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return String.format("https://api.vircurex.com/api/get_info_for_1_currency.json?base=%1$s&alt=%2$s", new Object[] { paramCheckerInfo.getCurrencyBase(), paramCheckerInfo.getCurrencyCounter() });
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramTicker.bid = paramJSONObject.getDouble("highest_bid");
    paramTicker.ask = paramJSONObject.getDouble("lowest_ask");
    paramTicker.vol = paramJSONObject.getDouble("volume");
    paramTicker.last = paramJSONObject.getDouble("last_trade");
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/Vircurex.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */