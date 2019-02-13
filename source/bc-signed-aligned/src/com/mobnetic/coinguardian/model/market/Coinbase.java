package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.CurrencyPairInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;

public class Coinbase
  extends Market
{
  private static final HashMap<String, CharSequence[]> CURRENCY_PAIRS = new LinkedHashMap();
  private static final String NAME = "Coinbase";
  private static final String TTS_NAME = "Coinbase";
  private static final String URL = "https://api.gdax.com/products/%1$s-%2$s/ticker";
  private static final String URL_CURRENCY_PAIRS = "https://api.gdax.com/products/";
  
  static
  {
    CURRENCY_PAIRS.put("BTC", new String[] { "USD", "EUR", "GBP" });
    CURRENCY_PAIRS.put("LTC", new String[] { "USD", "EUR", "BTC" });
    CURRENCY_PAIRS.put("ETH", new String[] { "USD", "EUR", "BTC" });
  }
  
  public Coinbase()
  {
    super("Coinbase", "Coinbase", CURRENCY_PAIRS);
  }
  
  public String getCurrencyPairsUrl(int paramInt)
  {
    return "https://api.gdax.com/products/";
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return String.format("https://api.gdax.com/products/%1$s-%2$s/ticker", new Object[] { paramCheckerInfo.getCurrencyBase(), paramCheckerInfo.getCurrencyCounter() });
  }
  
  protected void parseCurrencyPairs(int paramInt, String paramString, List<CurrencyPairInfo> paramList)
    throws Exception
  {
    paramString = new JSONArray(paramString);
    for (paramInt = 0; paramInt < paramString.length(); paramInt++)
    {
      JSONObject localJSONObject = paramString.getJSONObject(paramInt);
      paramList.add(new CurrencyPairInfo(localJSONObject.getString("base_currency"), localJSONObject.getString("quote_currency"), localJSONObject.getString("id")));
    }
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramTicker.bid = paramJSONObject.getDouble("bid");
    paramTicker.ask = paramJSONObject.getDouble("ask");
    paramTicker.vol = paramJSONObject.getDouble("volume");
    paramTicker.last = paramJSONObject.getDouble("price");
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/Coinbase.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */