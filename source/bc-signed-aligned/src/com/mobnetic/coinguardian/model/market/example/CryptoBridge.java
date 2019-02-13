package com.mobnetic.coinguardian.model.market.example;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.CurrencyPairInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;

public class CryptoBridge
  extends Market
{
  public static final String NAME = "CryptoBridge";
  public static final String TTS_NAME = "Crypto Bridge";
  private static final String URL = "https://api.crypto-bridge.org/api/v1/ticker/%1$s/";
  private static final String URL_CURRENCY_PAIRS = "https://api.crypto-bridge.org/api/v1/ticker";
  
  public CryptoBridge()
  {
    super("CryptoBridge", "Crypto Bridge", null);
  }
  
  public String getCurrencyPairsUrl(int paramInt)
  {
    return "https://api.crypto-bridge.org/api/v1/ticker";
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return String.format("https://api.crypto-bridge.org/api/v1/ticker/%1$s/", new Object[] { paramCheckerInfo.getCurrencyPairId() });
  }
  
  protected void parseCurrencyPairs(int paramInt, String paramString, List<CurrencyPairInfo> paramList)
    throws Exception
  {
    paramString = new JSONArray(paramString);
    paramInt = 0;
    if (paramInt < paramString.length())
    {
      String str = paramString.getJSONObject(paramInt).getString("id");
      String[] arrayOfString = str.split("_");
      if (arrayOfString.length != 2) {}
      for (;;)
      {
        paramInt++;
        break;
        paramList.add(new CurrencyPairInfo(arrayOfString[0], arrayOfString[1], str));
      }
    }
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramTicker.last = paramJSONObject.getDouble("last");
    paramTicker.vol = paramJSONObject.getDouble("volume");
    paramTicker.ask = paramJSONObject.getDouble("ask");
    paramTicker.bid = paramJSONObject.getDouble("bid");
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/example/CryptoBridge.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */