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

public class BitcoinAverage
  extends Market
{
  private static final HashMap<String, CharSequence[]> CURRENCY_PAIRS = new LinkedHashMap();
  private static final String NAME = "BitcoinAverage";
  private static final String TTS_NAME = "Bitcoin Average";
  private static final String URL = "https://apiv2.bitcoinaverage.com/indices/global/ticker/%1$s";
  private static final String URL_CURRENCY_PAIRS = "https://apiv2.bitcoinaverage.com/constants/symbols";
  
  static
  {
    CURRENCY_PAIRS.put("BTC", new String[] { "AUD", "BRL", "CAD", "CHF", "CNY", "CZK", "EUR", "GBP", "ILS", "JPY", "NOK", "NZD", "PLN", "RUB", "SEK", "SGD", "USD", "ZAR" });
  }
  
  public BitcoinAverage()
  {
    super("BitcoinAverage", "Bitcoin Average", CURRENCY_PAIRS);
  }
  
  public String getCurrencyPairsUrl(int paramInt)
  {
    return "https://apiv2.bitcoinaverage.com/constants/symbols";
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    if (paramCheckerInfo.getCurrencyPairId() == null) {}
    for (paramCheckerInfo = paramCheckerInfo.getCurrencyBase() + paramCheckerInfo.getCurrencyCounter();; paramCheckerInfo = paramCheckerInfo.getCurrencyPairId()) {
      return String.format("https://apiv2.bitcoinaverage.com/indices/global/ticker/%1$s", new Object[] { paramCheckerInfo });
    }
  }
  
  protected void parseCurrencyPairsFromJsonObject(int paramInt, JSONObject paramJSONObject, List<CurrencyPairInfo> paramList)
    throws Exception
  {
    paramJSONObject = paramJSONObject.getJSONObject("global").getJSONArray("symbols");
    for (paramInt = 0; paramInt < paramJSONObject.length(); paramInt++)
    {
      String str = paramJSONObject.getString(paramInt);
      paramList.add(new CurrencyPairInfo(str.substring(0, 3), str.substring(3), str));
    }
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramTicker.bid = paramJSONObject.getDouble("bid");
    paramTicker.ask = paramJSONObject.getDouble("ask");
    paramTicker.vol = paramJSONObject.getDouble("volume");
    paramTicker.high = paramJSONObject.getDouble("high");
    paramTicker.low = paramJSONObject.getDouble("low");
    paramTicker.last = paramJSONObject.getDouble("last");
    paramTicker.timestamp = (paramJSONObject.getLong("timestamp") * 1000L);
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/BitcoinAverage.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */