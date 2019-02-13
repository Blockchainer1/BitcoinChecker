package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.CurrencyPairInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;

public class TrocaNinja
  extends Market
{
  public static final String NAME = "TrocaNinja";
  public static final String TTS_NAME = "Troca Ninja";
  private static final String URL = "https://troca.ninja/api/ticker/%1$s";
  private static final String URL_CURRENCY_PAIRS = "https://troca.ninja/api/markets";
  
  public TrocaNinja()
  {
    super("TrocaNinja", "Troca Ninja", null);
  }
  
  public String getCurrencyPairsUrl(int paramInt)
  {
    return "https://troca.ninja/api/markets";
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return String.format("https://troca.ninja/api/ticker/%1$s", new Object[] { paramCheckerInfo.getCurrencyPairId() });
  }
  
  protected void parseCurrencyPairsFromJsonObject(int paramInt, JSONObject paramJSONObject, List<CurrencyPairInfo> paramList)
    throws Exception
  {
    JSONArray localJSONArray = paramJSONObject.getJSONArray("result");
    for (paramInt = 0; paramInt < localJSONArray.length(); paramInt++)
    {
      Object localObject = localJSONArray.getJSONObject(paramInt);
      paramJSONObject = ((JSONObject)localObject).getString("BaseCurrency");
      localObject = ((JSONObject)localObject).getString("MarketCurrency");
      paramList.add(new CurrencyPairInfo(paramJSONObject, (String)localObject, paramJSONObject + "_" + (String)localObject));
    }
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramJSONObject = paramJSONObject.getJSONArray("result").getJSONObject(0);
    paramTicker.last = paramJSONObject.getDouble("Last");
    paramTicker.vol = paramJSONObject.getDouble("BaseVolume");
    paramTicker.ask = paramJSONObject.getDouble("Ask");
    paramTicker.bid = paramJSONObject.getDouble("Bid");
    paramTicker.high = paramJSONObject.getDouble("High");
    paramTicker.low = paramJSONObject.getDouble("Low");
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/TrocaNinja.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */