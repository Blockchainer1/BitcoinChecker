package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.CurrencyPairInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;

public class Quoine
  extends Market
{
  private static final String NAME = "Quoine";
  private static final String TTS_NAME = "Quoine";
  private static final String URL = "https://api.quoine.com/products/code/CASH/%1$s";
  private static final String URL_CURRENCY_PAIRS = "https://api.quoine.com/products/";
  
  public Quoine()
  {
    super("Quoine", "Quoine", null);
  }
  
  public String getCurrencyPairsUrl(int paramInt)
  {
    return "https://api.quoine.com/products/";
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return String.format("https://api.quoine.com/products/code/CASH/%1$s", new Object[] { paramCheckerInfo.getCurrencyPairId() });
  }
  
  protected void parseCurrencyPairs(int paramInt, String paramString, List<CurrencyPairInfo> paramList)
    throws Exception
  {
    JSONArray localJSONArray = new JSONArray(paramString);
    paramInt = 0;
    if (paramInt < localJSONArray.length())
    {
      Object localObject = localJSONArray.getJSONObject(paramInt);
      if (!"CASH".equals(((JSONObject)localObject).getString("code"))) {}
      for (;;)
      {
        paramInt++;
        break;
        paramString = ((JSONObject)localObject).getString("currency");
        localObject = ((JSONObject)localObject).getString("currency_pair_code");
        if ((localObject != null) && (paramString != null) && (((String)localObject).endsWith(paramString))) {
          paramList.add(new CurrencyPairInfo(((String)localObject).substring(0, ((String)localObject).length() - paramString.length()), paramString, (String)localObject));
        }
      }
    }
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramTicker.bid = paramJSONObject.getDouble("market_bid");
    paramTicker.ask = paramJSONObject.getDouble("market_ask");
    paramTicker.vol = paramJSONObject.getDouble("volume_24h");
    paramTicker.high = paramJSONObject.getDouble("high_market_ask");
    paramTicker.low = paramJSONObject.getDouble("low_market_bid");
    paramTicker.last = paramJSONObject.getDouble("last_traded_price");
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/Quoine.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */