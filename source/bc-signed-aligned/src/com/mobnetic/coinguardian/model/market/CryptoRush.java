package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.CurrencyPairInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import com.mobnetic.coinguardiandatamodule.R.string;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;

public class CryptoRush
  extends Market
{
  public static final String NAME = "CryptoRush";
  public static final String TTS_NAME = "Crypto Rush";
  public static final String URL = "https://cryptorush.in/marketdata/all.json";
  private static final String URL_CURRENCY_PAIRS = "https://cryptorush.in/marketdata/all.json";
  
  public CryptoRush()
  {
    super("CryptoRush", "Crypto Rush", null);
  }
  
  public int getCautionResId()
  {
    return R.string.market_caution_much_data;
  }
  
  public String getCurrencyPairsUrl(int paramInt)
  {
    return "https://cryptorush.in/marketdata/all.json";
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return String.format("https://cryptorush.in/marketdata/all.json", new Object[] { paramCheckerInfo.getCurrencyBaseLowerCase(), paramCheckerInfo.getCurrencyCounterLowerCase() });
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
        String[] arrayOfString = paramJSONObject.split("/");
        if (arrayOfString.length == 2) {
          paramList.add(new CurrencyPairInfo(arrayOfString[0], arrayOfString[1], paramJSONObject));
        }
      }
    }
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramJSONObject = paramJSONObject.getJSONObject(paramCheckerInfo.getCurrencyBase() + "/" + paramCheckerInfo.getCurrencyCounter());
    paramTicker.bid = paramJSONObject.getDouble("current_bid");
    paramTicker.ask = paramJSONObject.getDouble("current_ask");
    paramTicker.vol = paramJSONObject.getDouble("volume_base_24h");
    paramTicker.high = paramJSONObject.getDouble("highest_24h");
    paramTicker.low = paramJSONObject.getDouble("lowest_24h");
    paramTicker.last = paramJSONObject.getDouble("last_trade");
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/CryptoRush.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */