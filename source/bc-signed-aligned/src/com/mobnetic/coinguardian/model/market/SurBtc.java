package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.CurrencyPairInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;

public class SurBtc
  extends Market
{
  private static final String NAME = "SurBtc";
  private static final String TTS_NAME = "Sur BTC";
  private static final String URL = "https://www.surbtc.com/api/v2/markets/%1$s/ticker.json";
  private static final String URL_CURRENCY_PAIRS = "https://www.surbtc.com/api/v2/markets.json";
  
  public SurBtc()
  {
    super("SurBtc", "Sur BTC", null);
  }
  
  public String getCurrencyPairsUrl(int paramInt)
  {
    return "https://www.surbtc.com/api/v2/markets.json";
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return String.format("https://www.surbtc.com/api/v2/markets/%1$s/ticker.json", new Object[] { paramCheckerInfo.getCurrencyPairId() });
  }
  
  protected void parseCurrencyPairsFromJsonObject(int paramInt, JSONObject paramJSONObject, List<CurrencyPairInfo> paramList)
    throws Exception
  {
    paramJSONObject = paramJSONObject.getJSONArray("markets");
    for (paramInt = 0; paramInt < paramJSONObject.length(); paramInt++)
    {
      JSONObject localJSONObject = paramJSONObject.getJSONObject(paramInt);
      paramList.add(new CurrencyPairInfo(localJSONObject.getString("base_currency"), localJSONObject.getString("quote_currency"), localJSONObject.getString("id")));
    }
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramJSONObject = paramJSONObject.getJSONObject("ticker");
    paramTicker.bid = paramJSONObject.getJSONArray("max_bid").getDouble(0);
    paramTicker.ask = paramJSONObject.getJSONArray("min_ask").getDouble(0);
    paramTicker.vol = paramJSONObject.getJSONArray("volume").getDouble(0);
    paramTicker.last = paramJSONObject.getJSONArray("last_price").getDouble(0);
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/SurBtc.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */