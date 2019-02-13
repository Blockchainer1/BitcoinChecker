package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.CurrencyPairInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;

public class Lykke
  extends Market
{
  private static final String NAME = "Lykke";
  private static final String TTS_NAME = "Lykke";
  private static final String URL = "https://public-api.lykke.com/api/Market/%1$s";
  private static final String URL_CURRENCY_PAIRS = "https://public-api.lykke.com/api/AssetPairs/dictionary";
  
  public Lykke()
  {
    super("Lykke", "Lykke", null);
  }
  
  public String getCurrencyPairsUrl(int paramInt)
  {
    return "https://public-api.lykke.com/api/AssetPairs/dictionary";
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return String.format("https://public-api.lykke.com/api/Market/%1$s", new Object[] { paramCheckerInfo.getCurrencyPairId() });
  }
  
  protected void parseCurrencyPairs(int paramInt, String paramString, List<CurrencyPairInfo> paramList)
    throws Exception
  {
    JSONArray localJSONArray = new JSONArray(paramString);
    for (paramInt = 0; paramInt < localJSONArray.length(); paramInt++)
    {
      paramString = localJSONArray.getJSONObject(paramInt);
      paramList.add(new CurrencyPairInfo(paramString.getString("baseAssetId"), paramString.getString("quotingAssetId"), paramString.getString("id")));
    }
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramTicker.bid = paramJSONObject.getDouble("bid");
    paramTicker.ask = paramJSONObject.getDouble("ask");
    paramTicker.vol = paramJSONObject.getDouble("volume24H");
    paramTicker.last = paramJSONObject.getDouble("lastPrice");
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/Lykke.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */