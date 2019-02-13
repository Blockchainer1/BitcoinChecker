package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.CurrencyPairInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;

public class Poloniex
  extends Market
{
  private static final String NAME = "Poloniex";
  private static final String TTS_NAME = "Poloniex";
  private static final String URL = "https://poloniex.com/public?command=returnTicker";
  
  public Poloniex()
  {
    super("Poloniex", "Poloniex", null);
  }
  
  public String getCurrencyPairsUrl(int paramInt)
  {
    return "https://poloniex.com/public?command=returnTicker";
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return "https://poloniex.com/public?command=returnTicker";
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
          paramList.add(new CurrencyPairInfo(paramJSONObject[1], paramJSONObject[0], str));
        }
      }
    }
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramJSONObject = paramJSONObject.getJSONObject(paramCheckerInfo.getCurrencyCounter() + "_" + paramCheckerInfo.getCurrencyBase());
    paramTicker.bid = paramJSONObject.getDouble("highestBid");
    paramTicker.ask = paramJSONObject.getDouble("lowestAsk");
    paramTicker.vol = paramJSONObject.getDouble("baseVolume");
    paramTicker.last = paramJSONObject.getDouble("last");
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/Poloniex.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */