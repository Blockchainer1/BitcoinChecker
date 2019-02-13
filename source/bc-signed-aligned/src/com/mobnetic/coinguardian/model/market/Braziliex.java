package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.CurrencyPairInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.List;
import java.util.Locale;
import org.json.JSONArray;
import org.json.JSONObject;

public class Braziliex
  extends Market
{
  private static final String NAME = "Braziliex";
  private static final String TTS_NAME = "Braziliex";
  private static final String URL = "https://braziliex.com/api/v1/public/ticker/%1$s";
  private static final String URL_CURRENCY_PAIRS = "https://braziliex.com/api/v1/public/ticker";
  
  public Braziliex()
  {
    super("Braziliex", "Braziliex", null);
  }
  
  public String getCurrencyPairsUrl(int paramInt)
  {
    return "https://braziliex.com/api/v1/public/ticker";
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return String.format("https://braziliex.com/api/v1/public/ticker/%1$s", new Object[] { paramCheckerInfo.getCurrencyPairId() });
  }
  
  protected void parseCurrencyPairsFromJsonObject(int paramInt, JSONObject paramJSONObject, List<CurrencyPairInfo> paramList)
    throws Exception
  {
    JSONArray localJSONArray = paramJSONObject.names();
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
    paramTicker.bid = paramJSONObject.getDouble("highestBid");
    paramTicker.ask = paramJSONObject.getDouble("lowestAsk");
    paramTicker.vol = paramJSONObject.getDouble("baseVolume24");
    paramTicker.high = paramJSONObject.getDouble("highestBid24");
    paramTicker.low = paramJSONObject.getDouble("lowestAsk24");
    paramTicker.last = paramJSONObject.getDouble("last");
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/Braziliex.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */