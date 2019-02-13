package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.CurrencyPairInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;

public class BitX
  extends Market
{
  private static final HashMap<String, CharSequence[]> CURRENCY_PAIRS = new LinkedHashMap();
  private static final String NAME = "Luno";
  private static final String TTS_NAME = "Luno";
  private static final String URL = "https://api.mybitx.com/api/1/ticker?pair=%1$s";
  private static final String URL_CURRENCY_PAIRS = "https://api.mybitx.com/api/1/tickers";
  
  static
  {
    CURRENCY_PAIRS.put("BTC", new String[] { "IDR", "SGD", "MYR", "NGN", "ZAR" });
  }
  
  public BitX()
  {
    super("Luno", "Luno", CURRENCY_PAIRS);
  }
  
  private String fixCurrency(String paramString)
  {
    String str;
    if ("BTC".equals(paramString)) {
      str = "XBT";
    }
    for (;;)
    {
      return str;
      str = paramString;
      if ("XBT".equals(paramString)) {
        str = "BTC";
      }
    }
  }
  
  public String getCurrencyPairsUrl(int paramInt)
  {
    return "https://api.mybitx.com/api/1/tickers";
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    if (paramCheckerInfo.getCurrencyPairId() == null) {}
    for (paramCheckerInfo = String.format("%1$s%2$s", new Object[] { fixCurrency(paramCheckerInfo.getCurrencyBase()), fixCurrency(paramCheckerInfo.getCurrencyCounter()) });; paramCheckerInfo = paramCheckerInfo.getCurrencyPairId()) {
      return String.format("https://api.mybitx.com/api/1/ticker?pair=%1$s", new Object[] { paramCheckerInfo });
    }
  }
  
  protected void parseCurrencyPairsFromJsonObject(int paramInt, JSONObject paramJSONObject, List<CurrencyPairInfo> paramList)
    throws Exception
  {
    paramJSONObject = paramJSONObject.getJSONArray("tickers");
    paramInt = 0;
    if (paramInt < paramJSONObject.length())
    {
      String str1 = paramJSONObject.getJSONObject(paramInt).getString("pair");
      if (str1 == null) {}
      for (;;)
      {
        paramInt++;
        break;
        try
        {
          String str2 = fixCurrency(str1.substring(0, 3));
          String str3 = fixCurrency(str1.substring(3));
          paramList.add(new CurrencyPairInfo(str2, str3, str1));
        }
        catch (Exception localException) {}
      }
    }
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramTicker.bid = paramJSONObject.getDouble("bid");
    paramTicker.ask = paramJSONObject.getDouble("ask");
    paramTicker.vol = paramJSONObject.getDouble("rolling_24_hour_volume");
    paramTicker.last = paramJSONObject.getDouble("last_trade");
    paramTicker.timestamp = paramJSONObject.getLong("timestamp");
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/BitX.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */