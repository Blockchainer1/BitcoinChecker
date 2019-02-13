package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.CurrencyPairInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.List;
import java.util.Locale;
import org.json.JSONArray;
import org.json.JSONObject;

public class CCex
  extends Market
{
  public static final String NAME = "C-CEX";
  public static final String TTS_NAME = "C-Cex";
  public static final String URL = "https://c-cex.com/t/%1$s-%2$s.json";
  public static final String URL_CURRENCY_PAIRS = "https://c-cex.com/t/pairs.json";
  
  public CCex()
  {
    super("C-CEX", "C-Cex", null);
  }
  
  public String getCurrencyPairsUrl(int paramInt)
  {
    return "https://c-cex.com/t/pairs.json";
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return String.format("https://c-cex.com/t/%1$s-%2$s.json", new Object[] { paramCheckerInfo.getCurrencyBaseLowerCase(), paramCheckerInfo.getCurrencyCounterLowerCase() });
  }
  
  protected void parseCurrencyPairsFromJsonObject(int paramInt, JSONObject paramJSONObject, List<CurrencyPairInfo> paramList)
    throws Exception
  {
    JSONArray localJSONArray = paramJSONObject.getJSONArray("pairs");
    paramInt = 0;
    if (paramInt < localJSONArray.length())
    {
      paramJSONObject = localJSONArray.getString(paramInt);
      if (paramJSONObject == null) {}
      for (;;)
      {
        paramInt++;
        break;
        String[] arrayOfString = paramJSONObject.split("-", 2);
        if ((arrayOfString.length == 2) && (arrayOfString[0] != null) && (arrayOfString[1] != null)) {
          paramList.add(new CurrencyPairInfo(arrayOfString[0].toUpperCase(Locale.US), arrayOfString[1].toUpperCase(Locale.US), paramJSONObject));
        }
      }
    }
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramJSONObject = paramJSONObject.getJSONObject("ticker");
    paramTicker.bid = paramJSONObject.getDouble("buy");
    paramTicker.ask = paramJSONObject.getDouble("sell");
    paramTicker.high = paramJSONObject.getDouble("high");
    paramTicker.low = paramJSONObject.getDouble("low");
    paramTicker.last = paramJSONObject.getDouble("lastprice");
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/CCex.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */