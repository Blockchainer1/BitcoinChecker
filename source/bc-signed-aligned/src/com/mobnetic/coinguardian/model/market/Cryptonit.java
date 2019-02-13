package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.CurrencyPairInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import com.mobnetic.coinguardian.util.ParseUtils;
import java.util.List;
import java.util.Locale;
import org.json.JSONArray;
import org.json.JSONObject;

public class Cryptonit
  extends Market
{
  private static final String NAME = "Cryptonit";
  private static final String TTS_NAME = "Cryptonit";
  private static final String URL = "https://cryptonit.net/apiv2/rest/public/ccorder.json?bid_currency=%1$s&ask_currency=%2$s&ticker";
  private static final String URL_CURRENCY_PAIRS = "https://cryptonit.net/apiv2/rest/public/pairs.json";
  
  public Cryptonit()
  {
    super("Cryptonit", "Cryptonit", null);
  }
  
  public String getCurrencyPairsUrl(int paramInt)
  {
    return "https://cryptonit.net/apiv2/rest/public/pairs.json";
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return String.format("https://cryptonit.net/apiv2/rest/public/ccorder.json?bid_currency=%1$s&ask_currency=%2$s&ticker", new Object[] { paramCheckerInfo.getCurrencyCounterLowerCase(), paramCheckerInfo.getCurrencyBaseLowerCase() });
  }
  
  protected void parseCurrencyPairs(int paramInt, String paramString, List<CurrencyPairInfo> paramList)
    throws Exception
  {
    JSONArray localJSONArray = new JSONArray(paramString);
    paramInt = 0;
    if (paramInt < localJSONArray.length())
    {
      Object localObject = localJSONArray.getJSONArray(paramInt);
      if (((JSONArray)localObject).length() != 2) {}
      for (;;)
      {
        paramInt++;
        break;
        paramString = ((JSONArray)localObject).getString(1);
        localObject = ((JSONArray)localObject).getString(0);
        if ((paramString != null) && (localObject != null)) {
          paramList.add(new CurrencyPairInfo(paramString.toUpperCase(Locale.US), ((String)localObject).toUpperCase(Locale.US), null));
        }
      }
    }
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    JSONObject localJSONObject = paramJSONObject.getJSONObject("rate");
    paramJSONObject = paramJSONObject.getJSONObject("volume");
    paramTicker.bid = ParseUtils.getDoubleFromString(localJSONObject, "bid");
    paramTicker.ask = ParseUtils.getDoubleFromString(localJSONObject, "ask");
    if (paramJSONObject.has(paramCheckerInfo.getCurrencyBase())) {
      paramTicker.vol = ParseUtils.getDoubleFromString(paramJSONObject, paramCheckerInfo.getCurrencyBase());
    }
    paramTicker.high = ParseUtils.getDoubleFromString(localJSONObject, "high");
    paramTicker.low = ParseUtils.getDoubleFromString(localJSONObject, "low");
    paramTicker.last = ParseUtils.getDoubleFromString(localJSONObject, "last");
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/Cryptonit.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */