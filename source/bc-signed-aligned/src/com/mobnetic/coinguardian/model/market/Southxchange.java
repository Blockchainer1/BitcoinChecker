package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.CurrencyPairInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;

public class Southxchange
  extends Market
{
  private static final String NAME = "Southxchange";
  private static final String TTS_NAME = "Southxchange";
  private static final String URL = "https://www.southxchange.com/api/price/%1$s";
  private static final String URL_CURRENCY_PAIRS = "https://www.southxchange.com/api/markets";
  
  public Southxchange()
  {
    super("Southxchange", "Southxchange", null);
  }
  
  public String getCurrencyPairsUrl(int paramInt)
  {
    return "https://www.southxchange.com/api/markets";
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return String.format("https://www.southxchange.com/api/price/%1$s", new Object[] { paramCheckerInfo.getCurrencyPairId() });
  }
  
  protected void parseCurrencyPairs(int paramInt, String paramString, List<CurrencyPairInfo> paramList)
    throws Exception
  {
    JSONArray localJSONArray = new JSONArray(paramString);
    for (paramInt = 0; paramInt < localJSONArray.length(); paramInt++)
    {
      Object localObject = localJSONArray.getJSONArray(paramInt);
      paramString = ((JSONArray)localObject).get(0).toString();
      localObject = ((JSONArray)localObject).get(1).toString();
      paramList.add(new CurrencyPairInfo(paramString, (String)localObject, paramString + "/" + (String)localObject));
    }
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramTicker.last = paramJSONObject.getDouble("Last");
    paramTicker.vol = paramJSONObject.getDouble("Volume24Hr");
    paramTicker.ask = paramJSONObject.getDouble("Ask");
    paramTicker.bid = paramJSONObject.getDouble("Bid");
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/Southxchange.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */