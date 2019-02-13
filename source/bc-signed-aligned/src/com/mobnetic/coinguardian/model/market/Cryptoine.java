package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.CurrencyPairInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.List;
import java.util.Locale;
import org.json.JSONArray;
import org.json.JSONObject;

public class Cryptoine
  extends Market
{
  private static final String NAME = "Cryptoine";
  private static final String TTS_NAME = "Cryptoine";
  private static final String URL = "https://cryptoine.com/api/1/ticker/%1$s";
  private static final String URL_CURRENCY_PAIRS = "https://cryptoine.com/api/1/markets";
  
  public Cryptoine()
  {
    super("Cryptoine", "Cryptoine", null);
  }
  
  private double getDoubleOrZero(JSONObject paramJSONObject, String paramString)
    throws Exception
  {
    if (paramJSONObject.isNull(paramString)) {}
    for (double d = 0.0D;; d = paramJSONObject.getDouble(paramString)) {
      return d;
    }
  }
  
  public String getCurrencyPairsUrl(int paramInt)
  {
    return "https://cryptoine.com/api/1/markets";
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return String.format("https://cryptoine.com/api/1/ticker/%1$s", new Object[] { paramCheckerInfo.getCurrencyPairId() });
  }
  
  protected void parseCurrencyPairsFromJsonObject(int paramInt, JSONObject paramJSONObject, List<CurrencyPairInfo> paramList)
    throws Exception
  {
    JSONArray localJSONArray = paramJSONObject.getJSONObject("data").names();
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
    paramTicker.bid = getDoubleOrZero(paramJSONObject, "buy");
    paramTicker.ask = getDoubleOrZero(paramJSONObject, "sell");
    paramTicker.vol = getDoubleOrZero(paramJSONObject, "vol_exchange");
    paramTicker.high = getDoubleOrZero(paramJSONObject, "high");
    paramTicker.low = getDoubleOrZero(paramJSONObject, "low");
    paramTicker.last = getDoubleOrZero(paramJSONObject, "last");
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/Cryptoine.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */