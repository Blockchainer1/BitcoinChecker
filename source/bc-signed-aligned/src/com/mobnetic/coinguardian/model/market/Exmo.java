package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.CurrencyPairInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;

public class Exmo
  extends Market
{
  private static final String NAME = "Exmo";
  private static final String TTS_NAME = "Exmo";
  private static final String URL = "https://api.exmo.com/v1/ticker/";
  private static final String URL_CURRENCY_PAIRS = "https://api.exmo.com/v1/pair_settings/";
  
  public Exmo()
  {
    super("Exmo", "Exmo", null);
  }
  
  public String getCurrencyPairsUrl(int paramInt)
  {
    return "https://api.exmo.com/v1/pair_settings/";
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return "https://api.exmo.com/v1/ticker/";
  }
  
  protected void parseCurrencyPairsFromJsonObject(int paramInt, JSONObject paramJSONObject, List<CurrencyPairInfo> paramList)
    throws Exception
  {
    JSONArray localJSONArray = paramJSONObject.names();
    paramInt = 0;
    if (paramInt < localJSONArray.length())
    {
      paramJSONObject = localJSONArray.getString(paramInt);
      if (paramJSONObject == null) {}
      for (;;)
      {
        paramInt++;
        break;
        String[] arrayOfString = paramJSONObject.split("_");
        if (arrayOfString.length == 2) {
          paramList.add(new CurrencyPairInfo(arrayOfString[0], arrayOfString[1], paramJSONObject));
        }
      }
    }
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramJSONObject = paramJSONObject.getJSONObject(paramCheckerInfo.getCurrencyBase() + "_" + paramCheckerInfo.getCurrencyCounter());
    paramTicker.bid = paramJSONObject.getDouble("buy_price");
    paramTicker.ask = paramJSONObject.getDouble("sell_price");
    paramTicker.vol = paramJSONObject.getDouble("vol");
    paramTicker.high = paramJSONObject.getDouble("high");
    paramTicker.low = paramJSONObject.getDouble("low");
    paramTicker.last = paramJSONObject.getDouble("last_trade");
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/Exmo.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */