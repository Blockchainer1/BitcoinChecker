package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.CurrencyPairInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;

public class BitZ
  extends Market
{
  private static final String NAME = "BitZ";
  private static final String TTS_NAME = "BitZ";
  private static final String URL = "https://apiv2.bitz.com/Market/ticker?symbol=%1$s";
  private static final String URL_CURRENCY_PAIRS = "https://apiv2.bitz.com/Market/tickerall";
  
  public BitZ()
  {
    super("BitZ", "BitZ", null);
  }
  
  public String getCurrencyPairsUrl(int paramInt)
  {
    return "https://apiv2.bitz.com/Market/tickerall";
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return String.format("https://apiv2.bitz.com/Market/ticker?symbol=%1$s", new Object[] { paramCheckerInfo.getCurrencyPairId() });
  }
  
  protected void parseCurrencyPairsFromJsonObject(int paramInt, JSONObject paramJSONObject, List<CurrencyPairInfo> paramList)
    throws Exception
  {
    JSONArray localJSONArray = paramJSONObject.getJSONObject("data").names();
    paramInt = 0;
    if (paramInt < localJSONArray.length())
    {
      String str = localJSONArray.get(paramInt).toString();
      paramJSONObject = str.split("_");
      if (paramJSONObject.length != 2) {}
      for (;;)
      {
        paramInt++;
        break;
        paramList.add(new CurrencyPairInfo(paramJSONObject[0].toUpperCase(), paramJSONObject[1].toUpperCase(), str));
      }
    }
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramJSONObject = paramJSONObject.getJSONObject("data");
    paramTicker.bid = paramJSONObject.getDouble("bidPrice");
    paramTicker.ask = paramJSONObject.getDouble("askPrice");
    paramTicker.high = paramJSONObject.getDouble("high");
    paramTicker.low = paramJSONObject.getDouble("low");
    paramTicker.vol = paramJSONObject.getDouble("volume");
    paramTicker.last = paramJSONObject.getDouble("now");
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/BitZ.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */