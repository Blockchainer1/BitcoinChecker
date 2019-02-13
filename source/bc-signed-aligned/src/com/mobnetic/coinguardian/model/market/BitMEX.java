package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.CurrencyPairInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.TimeZone;
import org.json.JSONArray;
import org.json.JSONObject;

public class BitMEX
  extends Market
{
  private static final SimpleDateFormat ISO_DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'", Locale.ENGLISH);
  private static final String NAME = "BitMEX";
  private static final String TTS_NAME = "BitMEX";
  private static final String URL = "https://www.bitmex.com/api/v1/instrument?symbol=%1$s&columns=bidPrice,askPrice,turnover24h,highPrice,lowPrice,lastPrice";
  private static final String URL_CURRENCY_PAIRS = "https://www.bitmex.com/api/v1/instrument?columns=rootSymbol,typ&filter={\"state\":\"Open\"}";
  
  static
  {
    ISO_DATE_FORMAT.setTimeZone(TimeZone.getTimeZone("GMT"));
  }
  
  public BitMEX()
  {
    super("BitMEX", "BitMEX", null);
  }
  
  public String getCurrencyPairsUrl(int paramInt)
  {
    return "https://www.bitmex.com/api/v1/instrument?columns=rootSymbol,typ&filter={\"state\":\"Open\"}";
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return String.format("https://www.bitmex.com/api/v1/instrument?symbol=%1$s&columns=bidPrice,askPrice,turnover24h,highPrice,lowPrice,lastPrice", new Object[] { paramCheckerInfo.getCurrencyPairId() });
  }
  
  protected void parseCurrencyPairs(int paramInt, String paramString, List<CurrencyPairInfo> paramList)
    throws Exception
  {
    paramString = new JSONArray(paramString);
    for (int i = 0; i < paramString.length(); i++) {
      parseCurrencyPairsFromJsonObject(paramInt, paramString.getJSONObject(i), paramList);
    }
  }
  
  protected void parseCurrencyPairsFromJsonObject(int paramInt, JSONObject paramJSONObject, List<CurrencyPairInfo> paramList)
    throws Exception
  {
    String str1 = paramJSONObject.getString("rootSymbol");
    String str2 = paramJSONObject.getString("symbol");
    String str3 = str2.substring(str2.indexOf(str1) + str1.length());
    String str4 = str1;
    if (paramJSONObject.getString("typ").equals("FFICSX"))
    {
      str3 = str1;
      str4 = "BINARY";
    }
    paramList.add(new CurrencyPairInfo(str4, str3, str2));
  }
  
  protected void parseTicker(int paramInt, String paramString, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    parseTickerFromJsonObject(paramInt, new JSONArray(paramString).getJSONObject(0), paramTicker, paramCheckerInfo);
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramTicker.bid = paramJSONObject.getDouble("bidPrice");
    paramTicker.ask = paramJSONObject.getDouble("askPrice");
    paramTicker.vol = (paramJSONObject.getDouble("turnover24h") / 1.0E8D);
    if (!paramJSONObject.isNull("highPrice")) {
      paramTicker.high = paramJSONObject.getDouble("highPrice");
    }
    if (!paramJSONObject.isNull("lowPrice")) {
      paramTicker.low = paramJSONObject.getDouble("lowPrice");
    }
    paramTicker.last = paramJSONObject.getDouble("lastPrice");
    paramTicker.timestamp = ISO_DATE_FORMAT.parse(paramJSONObject.getString("timestamp")).getTime();
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/BitMEX.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */