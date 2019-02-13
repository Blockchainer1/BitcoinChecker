package com.robotoworks.mechanoid.net;

import android.util.Log;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class NetLogHelper
{
  public static void logProperties(String paramString, Map<String, List<String>> paramMap)
  {
    Iterator localIterator = paramMap.keySet().iterator();
    while (localIterator.hasNext())
    {
      String str = (String)localIterator.next();
      Log.d(paramString, str + " " + ((List)paramMap.get(str)).toString());
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/robotoworks/mechanoid/net/NetLogHelper.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */