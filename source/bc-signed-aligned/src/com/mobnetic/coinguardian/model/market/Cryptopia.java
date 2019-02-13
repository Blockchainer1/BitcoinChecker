package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.CurrencyPairInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;

public class Cryptopia
  extends Market
{
  private static final String NAME = "Cryptopia";
  private static final String TTS_NAME = "Cryptopia";
  private static final String URL = "https://www.cryptopia.co.nz/api/GetMarket/%1$s";
  private static final String URL_CURRENCY_PAIRS = "https://www.cryptopia.co.nz/api/GetTradePairs";
  
  public Cryptopia()
  {
    super("Cryptopia", "Cryptopia", null);
  }
  
  public String getCurrencyPairsUrl(int paramInt)
  {
    return "https://www.cryptopia.co.nz/api/GetTradePairs";
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return String.format("https://www.cryptopia.co.nz/api/GetMarket/%1$s", new Object[] { paramCheckerInfo.getCurrencyPairId() });
  }
  
  protected void parseCurrencyPairsFromJsonObject(int paramInt, JSONObject paramJSONObject, List<CurrencyPairInfo> paramList)
    throws Exception
  {
    JSONArray localJSONArray = paramJSONObject.getJSONArray("Data");
    for (paramInt = 0; paramInt < localJSONArray.length(); paramInt++)
    {
      Object localObject = localJSONArray.getJSONObject(paramInt);
      String str = ((JSONObject)localObject).getString("Symbol");
      paramJSONObject = ((JSONObject)localObject).getString("BaseSymbol");
      localObject = ((JSONObject)localObject).getString("Id");
      if ((paramJSONObject != null) && (paramJSONObject != null) && (localObject != null)) {
        paramList.add(new CurrencyPairInfo(str, paramJSONObject, (String)localObject));
      }
    }
  }
  
  protected String parseErrorFromJsonObject(int paramInt, JSONObject paramJSONObject, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    return paramJSONObject.getString("Message");
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramJSONObject = paramJSONObject.getJSONObject("Data");
    paramTicker.bid = paramJSONObject.getDouble("BidPrice");
    paramTicker.ask = paramJSONObject.getDouble("AskPrice");
    paramTicker.vol = paramJSONObject.getDouble("Volume");
    paramTicker.high = paramJSONObject.getDouble("High");
    paramTicker.low = paramJSONObject.getDouble("Low");
    paramTicker.last = paramJSONObject.getDouble("LastPrice");
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/Cryptopia.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */