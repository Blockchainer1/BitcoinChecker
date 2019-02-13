package com.mobnetic.coinguardian.model.market;

import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.CurrencyPairInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;

public class MintPal
  extends Market
{
  private static final String NAME = "MintPal";
  private static final String TTS_NAME = "Mint Pal";
  private static final String URL = "https://api.mintpal.com/market/stats/%1$s/%2$s/";
  private static final String URL_CURRENCY_PAIRS = "https://api.mintpal.com/market/summary/";
  
  public MintPal()
  {
    super("MintPal", "Mint Pal", null);
  }
  
  public String getCurrencyPairsUrl(int paramInt)
  {
    return "https://api.mintpal.com/market/summary/";
  }
  
  public String getUrl(int paramInt, CheckerInfo paramCheckerInfo)
  {
    return String.format("https://api.mintpal.com/market/stats/%1$s/%2$s/", new Object[] { paramCheckerInfo.getCurrencyBase(), paramCheckerInfo.getCurrencyCounter() });
  }
  
  protected void parseCurrencyPairs(int paramInt, String paramString, List<CurrencyPairInfo> paramList)
    throws Exception
  {
    JSONArray localJSONArray = new JSONArray(paramString);
    for (paramInt = 0; paramInt < localJSONArray.length(); paramInt++)
    {
      paramString = localJSONArray.getJSONObject(paramInt);
      paramList.add(new CurrencyPairInfo(paramString.getString("code"), paramString.getString("exchange"), null));
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
    paramTicker.vol = paramJSONObject.getDouble("24hvol");
    paramTicker.high = paramJSONObject.getDouble("24hhigh");
    paramTicker.low = paramJSONObject.getDouble("24hlow");
    paramTicker.last = paramJSONObject.getDouble("last_price");
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/market/MintPal.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */