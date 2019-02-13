package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import com.mobnetic.coinguardiandatamodule.R.string;
import java.util.HashMap;
import java.util.LinkedHashMap;
import org.json.JSONObject;

public class Coinse
  extends Market
{
  private static final HashMap<String, CharSequence[]> CURRENCY_PAIRS = new LinkedHashMap();
  private static final String NAME = "Coins-E";
  private static final String TTS_NAME = "Coins-E";
  private static final String URL = "https://www.coins-e.com/api/v2/markets/data/";
  
  static
  {
    CURRENCY_PAIRS.put("ALP", new String[] { "BTC", "LTC" });
    CURRENCY_PAIRS.put("AMC", new String[] { "BTC", "LTC" });
    CURRENCY_PAIRS.put("ANC", new String[] { "BTC", "LTC" });
    CURRENCY_PAIRS.put("ARG", new String[] { "BTC", "LTC" });
    CURRENCY_PAIRS.put("BET", new String[] { "BTC", "LTC" });
    CURRENCY_PAIRS.put("BQC", new String[] { "BTC" });
    CURRENCY_PAIRS.put("BTG", new String[] { "BTC" });
    CURRENCY_PAIRS.put("CGB", new String[] { "BTC" });
    CURRENCY_PAIRS.put("CIN", new String[] { "BTC" });
    CURRENCY_PAIRS.put("CMC", new String[] { "BTC" });
    CURRENCY_PAIRS.put("COL", new String[] { "LTC" });
    CURRENCY_PAIRS.put("CRC", new String[] { "BTC" });
    CURRENCY_PAIRS.put("CSC", new String[] { "BTC" });
    CURRENCY_PAIRS.put("DEM", new String[] { "BTC", "LTC" });
    CURRENCY_PAIRS.put("DGC", new String[] { "BTC" });
    CURRENCY_PAIRS.put("DMD", new String[] { "BTC" });
    CURRENCY_PAIRS.put("DOGE", new String[] { "BTC" });
    CURRENCY_PAIRS.put("DTC", new String[] { "BTC" });
    CURRENCY_PAIRS.put("ELC", new String[] { "BTC" });
    CURRENCY_PAIRS.put("ELP", new String[] { "BTC" });
    CURRENCY_PAIRS.put("EMD", new String[] { "BTC" });
    CURRENCY_PAIRS.put("EZC", new String[] { "BTC" });
    CURRENCY_PAIRS.put("FLO", new String[] { "BTC" });
    CURRENCY_PAIRS.put("FRK", new String[] { "BTC", "LTC" });
    CURRENCY_PAIRS.put("FTC", new String[] { "BTC" });
    CURRENCY_PAIRS.put("GDC", new String[] { "BTC" });
    CURRENCY_PAIRS.put("GLC", new String[] { "BTC", "LTC" });
    CURRENCY_PAIRS.put("GLX", new String[] { "BTC" });
    CURRENCY_PAIRS.put("HYC", new String[] { "BTC" });
    CURRENCY_PAIRS.put("IFC", new String[] { "BTC", "LTC", "XPM" });
    CURRENCY_PAIRS.put("KGC", new String[] { "BTC", "LTC" });
    CURRENCY_PAIRS.put("LBW", new String[] { "BTC" });
    CURRENCY_PAIRS.put("LTC", new String[] { "BTC" });
    CURRENCY_PAIRS.put("MEC", new String[] { "BTC" });
    CURRENCY_PAIRS.put("NAN", new String[] { "BTC" });
    CURRENCY_PAIRS.put("NET", new String[] { "BTC" });
    CURRENCY_PAIRS.put("NIB", new String[] { "BTC" });
    CURRENCY_PAIRS.put("NRB", new String[] { "BTC" });
    CURRENCY_PAIRS.put("NUC", new String[] { "BTC" });
    CURRENCY_PAIRS.put("NVC", new String[] { "BTC" });
    CURRENCY_PAIRS.put("ORB", new String[] { "BTC", "LTC" });
    CURRENCY_PAIRS.put("PPC", new String[] { "BTC", "XPM" });
    CURRENCY_PAIRS.put("PTS", new String[] { "BTC" });
    CURRENCY_PAIRS.put("PWC", new String[] { "BTC" });
    CURRENCY_PAIRS.put("PXC", new String[] { "BTC", "LTC" });
    CURRENCY_PAIRS.put("QRK", new String[] { "BTC", "LTC", "XPM" });
    CURRENCY_PAIRS.put("RCH", new String[] { "BTC", "LTC" });
    CURRENCY_PAIRS.put("REC", new String[] { "BTC", "LTC" });
    CURRENCY_PAIRS.put("RED", new String[] { "BTC", "LTC" });
    CURRENCY_PAIRS.put("SBC", new String[] { "BTC", "LTC" });
    CURRENCY_PAIRS.put("SPT", new String[] { "BTC" });
    CURRENCY_PAIRS.put("TAG", new String[] { "BTC" });
    CURRENCY_PAIRS.put("TRC", new String[] { "BTC" });
    CURRENCY_PAIRS.put("UNO", new String[] { "BTC" });
    CURRENCY_PAIRS.put("VLC", new String[] { "BTC", "LTC" });
    CURRENCY_PAIRS.put("WDC", new String[] { "BTC" });
    CURRENCY_PAIRS.put("XNC", new String[] { "BTC", "LTC" });
    CURRENCY_PAIRS.put("XPM", new String[] { "BTC", "LTC" });
    CURRENCY_PAIRS.put("ZET", new String[] { "BTC" });
  }
  
  public Coinse()
  {
    super("Coins-E", "Coins-E", CURRENCY_PAIRS);
  }
  
  public int getCautionResId()
  {
    return R.string.market_caution_much_data;
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return "https://www.coins-e.com/api/v2/markets/data/";
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramJSONObject = paramJSONObject.getJSONObject("markets").getJSONObject(paramCheckerInfo.getCurrencyBase() + "_" + paramCheckerInfo.getCurrencyCounter()).getJSONObject("marketstat");
    paramCheckerInfo = paramJSONObject.getJSONObject("24h");
    paramTicker.bid = paramJSONObject.getDouble("bid");
    paramTicker.ask = paramJSONObject.getDouble("ask");
    paramTicker.vol = paramCheckerInfo.getDouble("volume");
    paramTicker.high = paramCheckerInfo.getDouble("h");
    paramTicker.low = paramCheckerInfo.getDouble("l");
    paramTicker.last = paramJSONObject.getDouble("ltp");
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/Coinse.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */