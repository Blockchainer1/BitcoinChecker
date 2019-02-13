package com.mobnetic.coinguardian.model;

import android.text.TextUtils;
import com.mobnetic.coinguardian.util.TimeUtils;
import java.util.HashMap;
import java.util.List;
import org.json.JSONObject;

public abstract class Market
{
  public HashMap<String, CharSequence[]> currencyPairs;
  public final String key = getClass().getSimpleName();
  public final String name;
  public final String ttsName;
  
  public Market(String paramString1, String paramString2, HashMap<String, CharSequence[]> paramHashMap)
  {
    this.name = paramString1;
    this.ttsName = paramString2;
    this.currencyPairs = paramHashMap;
  }
  
  public int getCautionResId()
  {
    return 0;
  }
  
  public int getCurrencyPairsNumOfRequests()
  {
    return 1;
  }
  
  public String getCurrencyPairsUrl(int paramInt)
  {
    return null;
  }
  
  public int getNumOfRequests(CheckerInfo paramCheckerInfo)
  {
    return 1;
  }
  
  public abstract String getUrl(int paramInt, CheckerInfo paramCheckerInfo);
  
  protected void parseCurrencyPairs(int paramInt, String paramString, List<CurrencyPairInfo> paramList)
    throws Exception
  {
    parseCurrencyPairsFromJsonObject(paramInt, new JSONObject(paramString), paramList);
  }
  
  protected void parseCurrencyPairsFromJsonObject(int paramInt, JSONObject paramJSONObject, List<CurrencyPairInfo> paramList)
    throws Exception
  {}
  
  public final void parseCurrencyPairsMain(int paramInt, String paramString, List<CurrencyPairInfo> paramList)
    throws Exception
  {
    parseCurrencyPairs(paramInt, paramString, paramList);
    for (paramInt = paramList.size() - 1; paramInt >= 0; paramInt--)
    {
      paramString = (CurrencyPairInfo)paramList.get(paramInt);
      if ((paramString == null) || (TextUtils.isEmpty(paramString.getCurrencyBase())) || (TextUtils.isEmpty(paramString.getCurrencyCounter()))) {
        paramList.remove(paramInt);
      }
    }
  }
  
  protected String parseError(int paramInt, String paramString, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    return parseErrorFromJsonObject(paramInt, new JSONObject(paramString), paramCheckerInfo);
  }
  
  protected String parseErrorFromJsonObject(int paramInt, JSONObject paramJSONObject, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    throw new Exception();
  }
  
  public final String parseErrorMain(int paramInt, String paramString, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    return parseError(paramInt, paramString, paramCheckerInfo);
  }
  
  protected void parseTicker(int paramInt, String paramString, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    parseTickerFromJsonObject(paramInt, new JSONObject(paramString), paramTicker, paramCheckerInfo);
  }
  
  protected void parseTickerFromJsonObject(int paramInt, JSONObject paramJSONObject, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {}
  
  public final Ticker parseTickerMain(int paramInt, String paramString, Ticker paramTicker, CheckerInfo paramCheckerInfo)
    throws Exception
  {
    parseTicker(paramInt, paramString, paramTicker, paramCheckerInfo);
    if (paramTicker.timestamp <= 0L) {}
    for (paramTicker.timestamp = System.currentTimeMillis();; paramTicker.timestamp = TimeUtils.parseTimeToMillis(paramTicker.timestamp)) {
      return paramTicker;
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/Market.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */