package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.CurrencyPairInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;

public class Coinsph
  extends Market
{
  private static final String NAME = "Coins.ph";
  private static final String TTS_NAME = "Coins.ph";
  private static final String URL = "https://quote.coins.ph/v1/markets/%1$s";
  private static final String URL_CURRENCY_PAIRS = "https://quote.coins.ph/v1/markets";
  
  public Coinsph()
  {
    super("Coins.ph", "Coins.ph", null);
  }
  
  public String getCurrencyPairsUrl(int paramInt)
  {
    return "https://quote.coins.ph/v1/markets";
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return String.format("https://quote.coins.ph/v1/markets/%1$s", new Object[] { paramCheckerInfo.getCurrencyPairId() });
  }
  
  protected void parseCurrencyPairsFromJsonObject(int paramInt, JSONObject paramJSONObject, List<CurrencyPairInfo> paramList)
    throws Exception
  {
    paramJSONObject = paramJSONObject.getJSONArray("markets");
    for (paramInt = 0; paramInt < paramJSONObject.length(); paramInt++)
    {
      JSONObject localJSONObject = paramJSONObject.getJSONObject(paramInt);
      if (localJSONObject != null) {
        paramList.add(new CurrencyPairInfo(localJSONObject.getString("product"), localJSONObject.getString("currency"), localJSONObject.getString("symbol")));
      }
    }
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramJSONObject = paramJSONObject.getJSONObject("market");
    paramTicker.bid = paramJSONObject.getDouble("bid");
    paramTicker.ask = paramJSONObject.getDouble("ask");
    paramTicker.last = paramTicker.ask;
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/Coinsph.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */