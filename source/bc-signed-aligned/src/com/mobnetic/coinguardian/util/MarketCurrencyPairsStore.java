package com.mobnetic.coinguardian.util;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import com.google.gson.Gson;
import com.mobnetic.coinguardian.model.CurrencyPairsListWithDate;
import com.robotoworks.mechanoid.Mechanoid;

public class MarketCurrencyPairsStore
{
  public static final CurrencyPairsListWithDate getPairsForMarket(Context paramContext, String paramString)
  {
    try
    {
      Gson localGson = new com/google/gson/Gson;
      localGson.<init>();
      paramContext = (CurrencyPairsListWithDate)localGson.fromJson(getPairsStringForMarket(paramContext, paramString), CurrencyPairsListWithDate.class);
      return paramContext;
    }
    catch (Exception paramContext)
    {
      for (;;)
      {
        paramContext.printStackTrace();
        paramContext = null;
      }
    }
  }
  
  private static final String getPairsStringForMarket(Context paramContext, String paramString)
  {
    return getSharedPreferences(paramContext).getString(paramString, null);
  }
  
  private static SharedPreferences getSharedPreferences(Context paramContext)
  {
    if (paramContext == null) {
      paramContext = Mechanoid.getApplicationContext();
    }
    for (;;)
    {
      return paramContext.getSharedPreferences("MARKET_CURRENCIY_PAIRS", 0);
      paramContext.getApplicationContext();
    }
  }
  
  public static final void savePairsForMarket(Context paramContext, String paramString, CurrencyPairsListWithDate paramCurrencyPairsListWithDate)
  {
    try
    {
      Gson localGson = new com/google/gson/Gson;
      localGson.<init>();
      savePairsStringForMarket(paramContext, paramString, localGson.toJson(paramCurrencyPairsListWithDate));
      return;
    }
    catch (Exception paramContext)
    {
      for (;;)
      {
        paramContext.printStackTrace();
      }
    }
  }
  
  private static final void savePairsStringForMarket(Context paramContext, String paramString1, String paramString2)
  {
    getSharedPreferences(paramContext).edit().putString(paramString1, paramString2).commit();
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/util/MarketCurrencyPairsStore.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */