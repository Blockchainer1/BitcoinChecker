package com.mobnetic.coinguardian.util;

import android.text.TextUtils;
import com.google.gson.Gson;
import com.mobnetic.coinguardian.model.Ticker;

public class TickerUtils
{
  public static Ticker fromJson(String paramString)
  {
    if (!TextUtils.isEmpty(paramString)) {}
    for (;;)
    {
      try
      {
        Gson localGson = new com/google/gson/Gson;
        localGson.<init>();
        paramString = (Ticker)localGson.fromJson(paramString, Ticker.class);
        return paramString;
      }
      catch (Exception paramString)
      {
        paramString.printStackTrace();
      }
      paramString = null;
    }
  }
  
  public static String toJson(Ticker paramTicker)
  {
    try
    {
      Gson localGson = new com/google/gson/Gson;
      localGson.<init>();
      paramTicker = localGson.toJson(paramTicker);
      return paramTicker;
    }
    catch (Exception paramTicker)
    {
      for (;;)
      {
        paramTicker.printStackTrace();
        paramTicker = null;
      }
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/util/TickerUtils.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */