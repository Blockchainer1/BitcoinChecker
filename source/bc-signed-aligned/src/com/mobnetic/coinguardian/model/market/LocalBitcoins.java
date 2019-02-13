package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.CurrencyPairInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;

public class LocalBitcoins
  extends Market
{
  private static final String NAME = "LocalBitcoins";
  private static final String TTS_NAME = "Local Bitcoins";
  private static final String URL = "https://localbitcoins.com/bitcoinaverage/ticker-all-currencies/";
  private static final String URL_CURRENCY_PAIRS = "https://localbitcoins.com/bitcoinaverage/ticker-all-currencies/";
  
  public LocalBitcoins()
  {
    super("LocalBitcoins", "Local Bitcoins", null);
  }
  
  public String getCurrencyPairsUrl(int paramInt)
  {
    return "https://localbitcoins.com/bitcoinaverage/ticker-all-currencies/";
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return "https://localbitcoins.com/bitcoinaverage/ticker-all-currencies/";
  }
  
  protected void parseCurrencyPairsFromJsonObject(int paramInt, JSONObject paramJSONObject, List<CurrencyPairInfo> paramList)
    throws Exception
  {
    paramJSONObject = paramJSONObject.names();
    for (paramInt = 0; paramInt < paramJSONObject.length(); paramInt++)
    {
      String str = paramJSONObject.getString(paramInt);
      if (str != null) {
        paramList.add(new CurrencyPairInfo("BTC", str, str));
      }
    }
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramJSONObject = paramJSONObject.getJSONObject(paramCheckerInfo.getCurrencyPairId());
    paramTicker.vol = paramJSONObject.getDouble("volume_btc");
    paramTicker.last = paramJSONObject.getJSONObject("rates").getDouble("last");
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/LocalBitcoins.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */