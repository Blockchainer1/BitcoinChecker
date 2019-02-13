package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.CurrencyPairInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import com.mobnetic.coinguardiandatamodule.R.string;
import java.util.List;
import java.util.Locale;
import org.json.JSONArray;
import org.json.JSONObject;

public class YoBit
  extends Market
{
  private static final String NAME = "YoBit";
  private static final String TTS_NAME = "YoBit";
  private static final String URL = "https://yobit.net/api/3/ticker/%1$s";
  private static final String URL_CURRENCY_PAIRS = "https://yobit.net/api/3/info";
  
  public YoBit()
  {
    super("YoBit", "YoBit", null);
  }
  
  public int getCautionResId()
  {
    return R.string.market_caution_yobit;
  }
  
  public String getCurrencyPairsUrl(int paramInt)
  {
    return "https://yobit.net/api/3/info";
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return String.format("https://yobit.net/api/3/ticker/%1$s", new Object[] { paramCheckerInfo.getCurrencyPairId() });
  }
  
  protected void parseCurrencyPairsFromJsonObject(int paramInt, JSONObject paramJSONObject, List<CurrencyPairInfo> paramList)
    throws Exception
  {
    JSONArray localJSONArray = paramJSONObject.getJSONObject("pairs").names();
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
          paramList.add(new CurrencyPairInfo(arrayOfString[0].toUpperCase(Locale.ENGLISH), arrayOfString[1].toUpperCase(Locale.ENGLISH), paramJSONObject));
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


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/YoBit.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */