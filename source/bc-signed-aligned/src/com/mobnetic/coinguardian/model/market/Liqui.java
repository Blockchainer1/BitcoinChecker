package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.CurrencyPairInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.List;
import java.util.Locale;
import org.json.JSONArray;
import org.json.JSONObject;

public class Liqui
  extends Market
{
  private static final String NAME = "Liqui.io";
  private static final String TTS_NAME = "Liqui";
  private static final String URL = " https://api.liqui.io/api/3/ticker/%1$s";
  private static final String URL_CURRENCY_PAIRS = "https://api.liqui.io/api/3/info";
  
  public Liqui()
  {
    super("Liqui.io", "Liqui", null);
  }
  
  public String getCurrencyPairsUrl(int paramInt)
  {
    return "https://api.liqui.io/api/3/info";
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    String str = paramCheckerInfo.getCurrencyPairId();
    if (paramCheckerInfo.getCurrencyPairId() == null) {
      str = String.format("%1$s_%2$s", new Object[] { paramCheckerInfo.getCurrencyBaseLowerCase(), paramCheckerInfo.getCurrencyCounterLowerCase() });
    }
    return String.format(" https://api.liqui.io/api/3/ticker/%1$s", new Object[] { str });
  }
  
  protected void parseCurrencyPairsFromJsonObject(int paramInt, JSONObject paramJSONObject, List<CurrencyPairInfo> paramList)
    throws Exception
  {
    JSONArray localJSONArray = paramJSONObject.getJSONObject("pairs").names();
    paramInt = 0;
    if (paramInt < localJSONArray.length())
    {
      String str = localJSONArray.getString(paramInt);
      if (str == null) {}
      for (;;)
      {
        paramInt++;
        break;
        paramJSONObject = str.split("_");
        if (paramJSONObject.length == 2) {
          paramList.add(new CurrencyPairInfo(paramJSONObject[0].toUpperCase(Locale.ENGLISH), paramJSONObject[1].toUpperCase(Locale.ENGLISH), str));
        }
      }
    }
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramJSONObject = paramJSONObject.getJSONObject(paramJSONObject.names().getString(0));
    paramTicker.bid = paramJSONObject.getDouble("sell");
    paramTicker.ask = paramJSONObject.getDouble("buy");
    paramTicker.vol = paramJSONObject.getDouble("vol");
    paramTicker.high = paramJSONObject.getDouble("high");
    paramTicker.low = paramJSONObject.getDouble("low");
    paramTicker.last = paramJSONObject.getDouble("last");
    paramTicker.timestamp = paramJSONObject.getLong("updated");
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/Liqui.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */