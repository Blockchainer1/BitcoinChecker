package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.CurrencyPairInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;

public class Comkort
  extends Market
{
  private static final String NAME = "Comkort";
  private static final String TTS_NAME = "Comkort";
  private static final String URL = "https://api.comkort.com/v1/public/market/summary?market_alias=%1$s";
  private static final String URL_CURRENCY_PAIRS = "https://api.comkort.com/v1/public/market/list";
  
  public Comkort()
  {
    super("Comkort", "Comkort", null);
  }
  
  private double getFirstOrderFrom(JSONObject paramJSONObject, String paramString)
    throws Exception
  {
    paramJSONObject = paramJSONObject.getJSONArray(paramString);
    if (paramJSONObject.length() > 0) {}
    for (double d = paramJSONObject.getJSONObject(0).getDouble("price");; d = -1.0D) {
      return d;
    }
  }
  
  public String getCurrencyPairsUrl(int paramInt)
  {
    return "https://api.comkort.com/v1/public/market/list";
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return String.format("https://api.comkort.com/v1/public/market/summary?market_alias=%1$s", new Object[] { paramCheckerInfo.getCurrencyPairId() });
  }
  
  protected void parseCurrencyPairsFromJsonObject(int paramInt, JSONObject paramJSONObject, List<CurrencyPairInfo> paramList)
    throws Exception
  {
    JSONArray localJSONArray = paramJSONObject.getJSONArray("markets");
    for (paramInt = 0; paramInt < localJSONArray.length(); paramInt++)
    {
      paramJSONObject = localJSONArray.getJSONObject(paramInt);
      paramList.add(new CurrencyPairInfo(paramJSONObject.getString("item"), paramJSONObject.getString("price_currency"), paramJSONObject.getString("alias")));
    }
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramJSONObject = paramJSONObject.getJSONObject("markets");
    paramJSONObject = paramJSONObject.getJSONObject(paramJSONObject.names().getString(0));
    paramTicker.bid = getFirstOrderFrom(paramJSONObject, "buy_orders");
    paramTicker.ask = getFirstOrderFrom(paramJSONObject, "sell_orders");
    paramTicker.vol = paramJSONObject.getDouble("volume");
    paramTicker.high = paramJSONObject.getDouble("high");
    paramTicker.low = paramJSONObject.getDouble("low");
    paramTicker.last = paramJSONObject.getDouble("last_price");
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/Comkort.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */