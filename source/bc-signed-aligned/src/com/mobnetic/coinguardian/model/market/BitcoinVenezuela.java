package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.CurrencyPairInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;

public class BitcoinVenezuela
  extends Market
{
  private static final String NAME = "BitcoinVenezuela";
  private static final String TTS_NAME = "Bitcoin Venezuela";
  private static final String URL = "http://api.bitcoinvenezuela.com/?html=no&currency=%1$s&amount=1&to=%2$s";
  private static final String URL_CURRENCY_PAIRS = "http://api.bitcoinvenezuela.com/";
  
  public BitcoinVenezuela()
  {
    super("BitcoinVenezuela", "Bitcoin Venezuela", null);
  }
  
  private void parseCurrencyPairsFromCurrencyBase(String paramString, JSONObject paramJSONObject, List<CurrencyPairInfo> paramList)
    throws Exception
  {
    if (!paramJSONObject.has(paramString)) {}
    for (;;)
    {
      return;
      paramJSONObject = paramJSONObject.getJSONObject(paramString).names();
      for (int i = 0; i < paramJSONObject.length(); i++) {
        paramList.add(new CurrencyPairInfo(paramString, paramJSONObject.getString(i), null));
      }
    }
  }
  
  public String getCurrencyPairsUrl(int paramInt)
  {
    return "http://api.bitcoinvenezuela.com/";
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return String.format("http://api.bitcoinvenezuela.com/?html=no&currency=%1$s&amount=1&to=%2$s", new Object[] { paramCheckerInfo.getCurrencyBase(), paramCheckerInfo.getCurrencyCounter() });
  }
  
  protected void parseCurrencyPairsFromJsonObject(int paramInt, JSONObject paramJSONObject, List<CurrencyPairInfo> paramList)
    throws Exception
  {
    parseCurrencyPairsFromCurrencyBase("BTC", paramJSONObject, paramList);
    parseCurrencyPairsFromCurrencyBase("LTC", paramJSONObject, paramList);
    parseCurrencyPairsFromCurrencyBase("MSC", paramJSONObject, paramList);
  }
  
  protected void parseTicker(int paramInt, String paramString, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramTicker.last = Double.parseDouble(paramString.trim());
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/BitcoinVenezuela.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */