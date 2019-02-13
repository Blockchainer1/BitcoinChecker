package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.CurrencyPairInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;

public class BtcAlpha
  extends Market
{
  public static final String NAME = "BtcAlpha";
  public static final String TTS_NAME = "BTC-Alpha";
  private static final String URL = "https://btc-alpha.com/api/charts/%1$s/1/chart/";
  private static final String URL_CURRENCY_PAIRS = "https://btc-alpha.com/api/v1/pairs/";
  
  public BtcAlpha()
  {
    super("BtcAlpha", "BTC-Alpha", null);
  }
  
  public String getCurrencyPairsUrl(int paramInt)
  {
    return "https://btc-alpha.com/api/v1/pairs/";
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return String.format("https://btc-alpha.com/api/charts/%1$s/1/chart/", new Object[] { paramCheckerInfo.getCurrencyPairId() });
  }
  
  protected void parseCurrencyPairs(int paramInt, String paramString, List<CurrencyPairInfo> paramList)
    throws Exception
  {
    JSONArray localJSONArray = new JSONArray(paramString);
    for (paramInt = 0; paramInt < localJSONArray.length(); paramInt++)
    {
      JSONObject localJSONObject = localJSONArray.getJSONObject(paramInt);
      paramString = localJSONObject.getString("name");
      paramList.add(new CurrencyPairInfo(localJSONObject.getString("currency1"), localJSONObject.getString("currency2"), paramString));
    }
  }
  
  protected void parseTicker(int paramInt, String paramString, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    parseTickerFromJsonObject(paramInt, new JSONArray(paramString).getJSONObject(0), paramTicker, paramCheckerInfo);
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    paramTicker.last = paramJSONObject.getDouble("close");
    paramTicker.vol = paramJSONObject.getDouble("volume");
    paramTicker.high = paramJSONObject.getDouble("high");
    paramTicker.low = paramJSONObject.getDouble("low");
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/BtcAlpha.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */