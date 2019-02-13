package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.CurrencyPairInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import com.mobnetic.coinguardian.util.ParseUtils;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;

public class Uphold
  extends Market
{
  private static final String NAME = "Uphold";
  private static final String TTS_NAME = "Uphold";
  private static final String URL = "https://api.uphold.com/v0/ticker/%1$s";
  private static final String URL_CURRENCY_PAIRS = "https://api.uphold.com/v0/ticker";
  
  public Uphold()
  {
    super("Uphold", "Uphold", null);
  }
  
  public String getCurrencyPairsUrl(int paramInt)
  {
    return "https://api.uphold.com/v0/ticker";
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return String.format("https://api.uphold.com/v0/ticker/%1$s", new Object[] { paramCheckerInfo.getCurrencyPairId() });
  }
  
  protected void parseCurrencyPairs(int paramInt, String paramString, List<CurrencyPairInfo> paramList)
    throws Exception
  {
    JSONArray localJSONArray = new JSONArray(paramString);
    for (paramInt = 0; paramInt < localJSONArray.length(); paramInt++)
    {
      Object localObject = localJSONArray.getJSONObject(paramInt);
      paramString = ((JSONObject)localObject).getString("pair");
      String str = ((JSONObject)localObject).getString("currency");
      if ((str != null) && (paramString != null) && (paramString.endsWith(str)))
      {
        localObject = paramString.substring(0, paramString.length() - str.length());
        if (!str.equals(localObject))
        {
          paramList.add(new CurrencyPairInfo((String)localObject, str, paramString));
          paramList.add(new CurrencyPairInfo(str, (String)localObject, str + (String)localObject));
        }
      }
    }
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramTicker.bid = ParseUtils.getDoubleFromString(paramJSONObject, "bid");
    paramTicker.ask = ParseUtils.getDoubleFromString(paramJSONObject, "ask");
    paramTicker.last = ((paramTicker.bid + paramTicker.ask) / 2.0D);
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/Uphold.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */