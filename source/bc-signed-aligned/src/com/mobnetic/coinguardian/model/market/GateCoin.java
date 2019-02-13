package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.CurrencyPairInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;

public class GateCoin
  extends Market
{
  private static final String NAME = "GateCoin";
  private static final String TTS_NAME = "Gate Coin";
  private static final String URL = "https://api.gatecoin.com/Public/LiveTickers";
  
  public GateCoin()
  {
    super("GateCoin", "Gate Coin", null);
  }
  
  public String getCurrencyPairsUrl(int paramInt)
  {
    return "https://api.gatecoin.com/Public/LiveTickers";
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return "https://api.gatecoin.com/Public/LiveTickers";
  }
  
  protected void parseCurrencyPairsFromJsonObject(int paramInt, JSONObject paramJSONObject, List<CurrencyPairInfo> paramList)
    throws Exception
  {
    JSONArray localJSONArray = paramJSONObject.getJSONArray("tickers");
    paramInt = 0;
    if (paramInt < localJSONArray.length())
    {
      paramJSONObject = localJSONArray.getJSONObject(paramInt).getString("currencyPair");
      if (paramJSONObject == null) {}
      for (;;)
      {
        paramInt++;
        break;
        String[] arrayOfString = new String[2];
        arrayOfString[0] = paramJSONObject.substring(0, 3);
        arrayOfString[1] = paramJSONObject.substring(3, 6);
        if (arrayOfString.length == 2) {
          paramList.add(new CurrencyPairInfo(arrayOfString[0], arrayOfString[1], paramJSONObject));
        }
      }
    }
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramJSONObject = paramJSONObject.getJSONArray("tickers");
    paramCheckerInfo = paramCheckerInfo.getCurrencyBase().concat(paramCheckerInfo.getCurrencyCounter());
    for (paramInt = 0;; paramInt++) {
      if (paramInt < paramJSONObject.length())
      {
        JSONObject localJSONObject = paramJSONObject.getJSONObject(paramInt);
        if (localJSONObject.getString("currencyPair").equals(paramCheckerInfo))
        {
          paramTicker.bid = localJSONObject.getDouble("bid");
          paramTicker.ask = localJSONObject.getDouble("ask");
          paramTicker.vol = localJSONObject.getDouble("volume");
          paramTicker.high = localJSONObject.getDouble("high");
          paramTicker.low = localJSONObject.getDouble("low");
          paramTicker.last = localJSONObject.getDouble("last");
          paramTicker.timestamp = localJSONObject.getLong("createDateTime");
        }
      }
      else
      {
        return;
      }
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/GateCoin.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */