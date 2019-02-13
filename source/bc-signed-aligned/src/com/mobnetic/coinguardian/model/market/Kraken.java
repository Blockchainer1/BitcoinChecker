package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.CurrencyPairInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;

public class Kraken
  extends Market
{
  private static final String NAME = "Kraken";
  private static final String TTS_NAME = "Kraken";
  private static final String URL = "https://api.kraken.com/0/public/Ticker?pair=%1$s";
  private static final String URL_CURRENCY_PAIRS = "https://api.kraken.com/0/public/AssetPairs";
  
  public Kraken()
  {
    super("Kraken", "Kraken", null);
  }
  
  private String fixCurrency(String paramString)
  {
    String str;
    if ("BTC".equals(paramString)) {
      str = "XBT";
    }
    for (;;)
    {
      return str;
      if ("VEN".equals(paramString))
      {
        str = "XVN";
      }
      else
      {
        str = paramString;
        if ("DOGE".equals(paramString)) {
          str = "XDG";
        }
      }
    }
  }
  
  private double getDoubleFromJsonArrayObject(JSONObject paramJSONObject, String paramString)
    throws Exception
  {
    paramJSONObject = paramJSONObject.getJSONArray(paramString);
    if ((paramJSONObject != null) && (paramJSONObject.length() > 0)) {}
    for (double d = paramJSONObject.getDouble(0);; d = 0.0D) {
      return d;
    }
  }
  
  private String parseCurrency(String paramString)
  {
    String str = paramString;
    if (paramString != null)
    {
      str = paramString;
      if (paramString.length() >= 2)
      {
        int i = paramString.charAt(0);
        if (i != 90)
        {
          str = paramString;
          if (i != 88) {}
        }
        else
        {
          str = paramString.substring(1);
        }
      }
    }
    if ("XBT".equals(str)) {
      paramString = "BTC";
    }
    for (;;)
    {
      return paramString;
      if ("XVN".equals(str))
      {
        paramString = "VEN";
      }
      else
      {
        paramString = str;
        if ("XDG".equals(str)) {
          paramString = "DOGE";
        }
      }
    }
  }
  
  public String getCurrencyPairsUrl(int paramInt)
  {
    return "https://api.kraken.com/0/public/AssetPairs";
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    if (paramCheckerInfo.getCurrencyPairId() != null) {}
    String str;
    for (paramCheckerInfo = String.format("https://api.kraken.com/0/public/Ticker?pair=%1$s", new Object[] { paramCheckerInfo.getCurrencyPairId() });; paramCheckerInfo = String.format("https://api.kraken.com/0/public/Ticker?pair=%1$s", new Object[] { str + paramCheckerInfo }))
    {
      return paramCheckerInfo;
      str = fixCurrency(paramCheckerInfo.getCurrencyBase());
      paramCheckerInfo = fixCurrency(paramCheckerInfo.getCurrencyCounter());
    }
  }
  
  protected void parseCurrencyPairsFromJsonObject(int paramInt, JSONObject paramJSONObject, List<CurrencyPairInfo> paramList)
    throws Exception
  {
    paramJSONObject = paramJSONObject.getJSONObject("result");
    JSONArray localJSONArray = paramJSONObject.names();
    for (paramInt = 0; paramInt < localJSONArray.length(); paramInt++)
    {
      String str = localJSONArray.getString(paramInt);
      if ((str != null) && (str.indexOf('.') == -1))
      {
        JSONObject localJSONObject = paramJSONObject.getJSONObject(str);
        paramList.add(new CurrencyPairInfo(parseCurrency(localJSONObject.getString("base")), parseCurrency(localJSONObject.getString("quote")), str));
      }
    }
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramJSONObject = paramJSONObject.getJSONObject("result");
    paramJSONObject = paramJSONObject.getJSONObject(paramJSONObject.names().getString(0));
    paramTicker.bid = getDoubleFromJsonArrayObject(paramJSONObject, "b");
    paramTicker.ask = getDoubleFromJsonArrayObject(paramJSONObject, "a");
    paramTicker.vol = getDoubleFromJsonArrayObject(paramJSONObject, "v");
    paramTicker.high = getDoubleFromJsonArrayObject(paramJSONObject, "h");
    paramTicker.low = getDoubleFromJsonArrayObject(paramJSONObject, "l");
    paramTicker.last = getDoubleFromJsonArrayObject(paramJSONObject, "c");
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/Kraken.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */