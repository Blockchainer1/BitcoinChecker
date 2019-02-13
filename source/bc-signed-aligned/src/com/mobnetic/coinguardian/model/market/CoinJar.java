package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.CurrencyPairInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;

public class CoinJar
  extends Market
{
  private static final String NAME = "CoinJar";
  private static final String TTS_NAME = "Coin Jar";
  private static final String URL = "https://api.coinjar.com/v3/exchange_rates";
  private static final String URL_CURRENCY_PAIRS = "https://api.coinjar.com/v3/exchange_rates";
  
  public CoinJar()
  {
    super("CoinJar", "Coin Jar", null);
  }
  
  public String getCurrencyPairsUrl(int paramInt)
  {
    return "https://api.coinjar.com/v3/exchange_rates";
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return "https://api.coinjar.com/v3/exchange_rates";
  }
  
  protected void parseCurrencyPairsFromJsonObject(int paramInt, JSONObject paramJSONObject, List<CurrencyPairInfo> paramList)
    throws Exception
  {
    JSONObject localJSONObject1 = paramJSONObject.getJSONObject("exchange_rates");
    paramJSONObject = localJSONObject1.names();
    for (paramInt = 0; paramInt < paramJSONObject.length(); paramInt++)
    {
      String str = paramJSONObject.getString(paramInt);
      JSONObject localJSONObject2 = localJSONObject1.getJSONObject(str);
      paramList.add(new CurrencyPairInfo(localJSONObject2.getString("base_currency"), localJSONObject2.getString("counter_currency"), str));
    }
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramJSONObject = paramJSONObject.getJSONObject("exchange_rates").getJSONObject(paramCheckerInfo.getCurrencyPairId());
    paramTicker.bid = paramJSONObject.getDouble("bid");
    paramTicker.ask = paramJSONObject.getDouble("ask");
    paramTicker.last = paramJSONObject.getDouble("midpoint");
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/CoinJar.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */