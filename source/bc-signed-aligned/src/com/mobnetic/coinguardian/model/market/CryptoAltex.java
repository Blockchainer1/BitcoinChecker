package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.CurrencyPairInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;

public class CryptoAltex
  extends Market
{
  private static final String NAME = "CryptoAltex";
  private static final String TTS_NAME = "Crypto Altex";
  private static final String URL = "https://www.cryptoaltex.com/api/public_v2.php";
  
  public CryptoAltex()
  {
    super("CryptoAltex", "Crypto Altex", null);
  }
  
  public String getCurrencyPairsUrl(int paramInt)
  {
    return "https://www.cryptoaltex.com/api/public_v2.php";
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return "https://www.cryptoaltex.com/api/public_v2.php";
  }
  
  protected void parseCurrencyPairsFromJsonObject(int paramInt, JSONObject paramJSONObject, List<CurrencyPairInfo> paramList)
    throws Exception
  {
    paramJSONObject = paramJSONObject.names();
    for (paramInt = 0; paramInt < paramJSONObject.length(); paramInt++)
    {
      String str = paramJSONObject.getString(paramInt);
      String[] arrayOfString = str.split("/");
      if ((arrayOfString != null) && (arrayOfString.length >= 2)) {
        paramList.add(new CurrencyPairInfo(arrayOfString[0], arrayOfString[1], str));
      }
    }
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramJSONObject = paramJSONObject.getJSONObject(paramCheckerInfo.getCurrencyPairId());
    paramTicker.vol = paramJSONObject.getDouble("24_hours_volume");
    paramTicker.high = paramJSONObject.getDouble("24_hours_price_high");
    paramTicker.low = paramJSONObject.getDouble("24_hours_price_low");
    paramTicker.last = paramJSONObject.getDouble("last_trade");
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/CryptoAltex.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */