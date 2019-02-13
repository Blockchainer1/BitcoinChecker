package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.CurrencyPairInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.List;
import java.util.Locale;
import org.json.JSONArray;
import org.json.JSONObject;

public class Bter
  extends Market
{
  private static final String NAME = "Gate.io";
  private static final String TTS_NAME = "Gate io";
  private static final String URL = "http://data.gate.io/api2/1/ticker/%1$s_%2$s";
  private static final String URL_CURRENCY_PAIRS = "http://data.gate.io/api2/1/pairs";
  
  public Bter()
  {
    super("Gate.io", "Gate io", null);
  }
  
  public String getCurrencyPairsUrl(int paramInt)
  {
    return "http://data.gate.io/api2/1/pairs";
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return String.format("http://data.gate.io/api2/1/ticker/%1$s_%2$s", new Object[] { paramCheckerInfo.getCurrencyBaseLowerCase(), paramCheckerInfo.getCurrencyCounterLowerCase() });
  }
  
  protected void parseCurrencyPairs(int paramInt, String paramString, List<CurrencyPairInfo> paramList)
    throws Exception
  {
    JSONArray localJSONArray = new JSONArray(paramString);
    paramInt = 0;
    if (paramInt < localJSONArray.length())
    {
      String str = localJSONArray.getString(paramInt);
      if (str == null) {}
      for (;;)
      {
        paramInt++;
        break;
        paramString = str.split("_");
        if (paramString.length == 2) {
          paramList.add(new CurrencyPairInfo(paramString[0].toUpperCase(Locale.ENGLISH), paramString[1].toUpperCase(Locale.ENGLISH), str));
        }
      }
    }
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramTicker.bid = paramJSONObject.getDouble("highestBid");
    paramTicker.ask = paramJSONObject.getDouble("lowestAsk");
    paramTicker.vol = paramJSONObject.getDouble("quoteVolume");
    paramTicker.high = paramJSONObject.getDouble("high24hr");
    paramTicker.low = paramJSONObject.getDouble("low24hr");
    paramTicker.last = paramJSONObject.getDouble("last");
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/Bter.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */