package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.CurrencyPairInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.List;
import java.util.Locale;
import org.json.JSONArray;
import org.json.JSONObject;

public class Btc38
  extends Market
{
  private static final String NAME = "Btc38";
  private static final String TTS_NAME = "BTC 38";
  private static final String URL = "http://api.btc38.com/v1/ticker.php?c=%1$s&mk_type=%2$s";
  private static final String URL_CURRENCY_PAIRS = "http://api.btc38.com/v1/ticker.php?c=all&mk_type=%1$s";
  
  public Btc38()
  {
    super("Btc38", "BTC 38", null);
  }
  
  public String getCurrencyCounter(int paramInt)
  {
    if (paramInt == 0) {}
    for (String str = "CNY";; str = "BTC") {
      return str;
    }
  }
  
  public int getCurrencyPairsNumOfRequests()
  {
    return 2;
  }
  
  public String getCurrencyPairsUrl(int paramInt)
  {
    return String.format("http://api.btc38.com/v1/ticker.php?c=all&mk_type=%1$s", new Object[] { getCurrencyCounter(paramInt).toLowerCase(Locale.ENGLISH) });
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return String.format("http://api.btc38.com/v1/ticker.php?c=%1$s&mk_type=%2$s", new Object[] { paramCheckerInfo.getCurrencyBaseLowerCase(), paramCheckerInfo.getCurrencyCounterLowerCase() });
  }
  
  protected void parseCurrencyPairsFromJsonObject(int paramInt, JSONObject paramJSONObject, List<CurrencyPairInfo> paramList)
    throws Exception
  {
    String str = getCurrencyCounter(paramInt);
    paramJSONObject = paramJSONObject.names();
    for (paramInt = 0; paramInt < paramJSONObject.length(); paramInt++) {
      paramList.add(new CurrencyPairInfo(paramJSONObject.getString(paramInt).toUpperCase(Locale.ENGLISH), str, null));
    }
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramJSONObject = paramJSONObject.getJSONObject("ticker");
    paramTicker.bid = paramJSONObject.getDouble("buy");
    paramTicker.ask = paramJSONObject.getDouble("sell");
    paramTicker.vol = paramJSONObject.getDouble("vol");
    paramTicker.high = paramJSONObject.getDouble("high");
    paramTicker.low = paramJSONObject.getDouble("low");
    paramTicker.last = paramJSONObject.getDouble("last");
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/Btc38.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */