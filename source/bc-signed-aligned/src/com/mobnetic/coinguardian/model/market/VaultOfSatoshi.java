package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.CurrencyPairInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;

public class VaultOfSatoshi
  extends Market
{
  private static final String NAME = "VaultOfSatoshi";
  private static final String TTS_NAME = "Vault Of Satoshi";
  private static final String URL = "https://api.vaultofsatoshi.com/public/ticker?order_currency=%1$s&payment_currency=%2$s";
  private static final String URL_CURRENCY_PAIRS = "https://api.vaultofsatoshi.com/public/currency";
  
  public VaultOfSatoshi()
  {
    super("VaultOfSatoshi", "Vault Of Satoshi", null);
  }
  
  private double getDoubleFromMtgoxFormatObject(JSONObject paramJSONObject, String paramString)
    throws Exception
  {
    return paramJSONObject.getJSONObject(paramString).getDouble("value");
  }
  
  public String getCurrencyPairsUrl(int paramInt)
  {
    return "https://api.vaultofsatoshi.com/public/currency";
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return String.format("https://api.vaultofsatoshi.com/public/ticker?order_currency=%1$s&payment_currency=%2$s", new Object[] { paramCheckerInfo.getCurrencyBaseLowerCase(), paramCheckerInfo.getCurrencyCounterLowerCase() });
  }
  
  protected void parseCurrencyPairsFromJsonObject(int paramInt, JSONObject paramJSONObject, List<CurrencyPairInfo> paramList)
    throws Exception
  {
    JSONArray localJSONArray = paramJSONObject.getJSONArray("data");
    paramJSONObject = new ArrayList();
    ArrayList localArrayList = new ArrayList();
    paramInt = 0;
    if (paramInt < localJSONArray.length())
    {
      JSONObject localJSONObject = localJSONArray.getJSONObject(paramInt);
      if (localJSONObject.getInt("virtual") != 0) {
        paramJSONObject.add(localJSONObject.getString("code"));
      }
      for (;;)
      {
        paramInt++;
        break;
        localArrayList.add(localJSONObject.getString("code"));
      }
    }
    int i = paramJSONObject.size();
    int j = localArrayList.size();
    for (paramInt = 0; paramInt < i; paramInt++)
    {
      for (int k = 0; k < j; k++) {
        paramList.add(new CurrencyPairInfo((String)paramJSONObject.get(paramInt), (String)localArrayList.get(k), null));
      }
      for (k = 0; k < i; k++) {
        if (paramInt != k) {
          paramList.add(new CurrencyPairInfo((String)paramJSONObject.get(paramInt), (String)paramJSONObject.get(k), null));
        }
      }
    }
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramJSONObject = paramJSONObject.getJSONObject("data");
    paramTicker.vol = getDoubleFromMtgoxFormatObject(paramJSONObject, "volume_1day");
    paramTicker.high = getDoubleFromMtgoxFormatObject(paramJSONObject, "max_price");
    paramTicker.low = getDoubleFromMtgoxFormatObject(paramJSONObject, "min_price");
    paramTicker.last = getDoubleFromMtgoxFormatObject(paramJSONObject, "closing_price");
    paramTicker.timestamp = paramJSONObject.getLong("date");
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/VaultOfSatoshi.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */