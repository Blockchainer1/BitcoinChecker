package com.android.volley.toolbox;

import com.android.volley.Cache.Entry;
import com.android.volley.NetworkResponse;
import java.util.Date;
import java.util.Map;
import org.apache.http.impl.cookie.DateParseException;
import org.apache.http.impl.cookie.DateUtils;

public class HttpHeaderParser
{
  public static Cache.Entry parseCacheHeaders(NetworkResponse paramNetworkResponse)
  {
    long l1 = System.currentTimeMillis();
    Map localMap = paramNetworkResponse.headers;
    long l2 = 0L;
    long l3 = 0L;
    long l4 = 0L;
    long l5 = 0L;
    int i = 0;
    Object localObject = (String)localMap.get("Date");
    if (localObject != null) {
      l2 = parseDateAsEpoch((String)localObject);
    }
    localObject = (String)localMap.get("Cache-Control");
    long l6 = l5;
    String str;
    if (localObject != null)
    {
      int j = 1;
      localObject = ((String)localObject).split(",");
      i = 0;
      l6 = l5;
      if (i >= localObject.length) {
        i = j;
      }
    }
    else
    {
      localObject = (String)localMap.get("Expires");
      l5 = l3;
      if (localObject != null) {
        l5 = parseDateAsEpoch((String)localObject);
      }
      str = (String)localMap.get("ETag");
      if (i == 0) {
        break label312;
      }
      l6 = l1 + 1000L * l6;
    }
    for (;;)
    {
      localObject = new Cache.Entry();
      ((Cache.Entry)localObject).data = paramNetworkResponse.data;
      ((Cache.Entry)localObject).etag = str;
      ((Cache.Entry)localObject).softTtl = l6;
      ((Cache.Entry)localObject).ttl = ((Cache.Entry)localObject).softTtl;
      ((Cache.Entry)localObject).serverDate = l2;
      ((Cache.Entry)localObject).responseHeaders = localMap;
      for (paramNetworkResponse = (NetworkResponse)localObject;; paramNetworkResponse = null)
      {
        return paramNetworkResponse;
        str = localObject[i].trim();
        if ((!str.equals("no-cache")) && (!str.equals("no-store"))) {
          break;
        }
      }
      if (str.startsWith("max-age=")) {}
      for (;;)
      {
        try
        {
          l5 = Long.parseLong(str.substring(8));
          l6 = l5;
          i++;
        }
        catch (Exception localException)
        {
          continue;
        }
        break;
        if ((str.equals("must-revalidate")) || (str.equals("proxy-revalidate"))) {
          l6 = 0L;
        }
      }
      label312:
      l6 = l4;
      if (l2 > 0L)
      {
        l6 = l4;
        if (l5 >= l2) {
          l6 = l1 + (l5 - l2);
        }
      }
    }
  }
  
  public static String parseCharset(Map<String, String> paramMap)
  {
    paramMap = (String)paramMap.get("Content-Type");
    String[] arrayOfString;
    if (paramMap != null) {
      arrayOfString = paramMap.split(";");
    }
    for (int i = 1;; i++)
    {
      if (i >= arrayOfString.length) {}
      for (paramMap = "ISO-8859-1";; paramMap = paramMap[1])
      {
        return paramMap;
        paramMap = arrayOfString[i].trim().split("=");
        if ((paramMap.length != 2) || (!paramMap[0].equals("charset"))) {
          break;
        }
      }
    }
  }
  
  public static long parseDateAsEpoch(String paramString)
  {
    try
    {
      l = DateUtils.parseDate(paramString).getTime();
      return l;
    }
    catch (DateParseException paramString)
    {
      for (;;)
      {
        long l = 0L;
      }
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/android/volley/toolbox/HttpHeaderParser.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */