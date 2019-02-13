package com.mobnetic.coinguardiandatamodule.tester.util;

import android.content.Context;
import android.text.Html;
import android.text.SpannableStringBuilder;
import com.android.volley.NetworkError;
import com.android.volley.NetworkResponse;
import com.android.volley.ParseError;
import com.android.volley.ServerError;
import com.android.volley.TimeoutError;
import com.android.volley.VolleyError;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

public class CheckErrorsUtils
{
  private static final int RAW_RESPONSE_CHARS_LIMIT = 5000;
  
  public static final String formatError(Context paramContext, String paramString)
  {
    if (paramString != null) {}
    for (;;)
    {
      return paramContext.getString(2131034113, new Object[] { paramString });
      paramString = "UNKNOWN";
    }
  }
  
  private static String formatMapToHtmlString(Map<String, String> paramMap)
  {
    Object localObject = "";
    Iterator localIterator = paramMap.entrySet().iterator();
    for (paramMap = (Map<String, String>)localObject; localIterator.hasNext(); paramMap = paramMap + String.format("<b>%1$s</b> = %2$s<br\\>", new Object[] { ((Map.Entry)localObject).getKey(), ((Map.Entry)localObject).getValue() })) {
      localObject = (Map.Entry)localIterator.next();
    }
    return paramMap;
  }
  
  public static SpannableStringBuilder formatResponseDebug(Context paramContext, SpannableStringBuilder paramSpannableStringBuilder, String paramString1, Map<String, String> paramMap, NetworkResponse paramNetworkResponse, String paramString2, Exception paramException)
  {
    if (paramString1 != null)
    {
      paramSpannableStringBuilder.append("\n\n");
      paramSpannableStringBuilder.append(paramContext.getString(2131034140, new Object[] { paramString1 }));
    }
    if (paramMap != null)
    {
      paramSpannableStringBuilder.append("\n\n");
      paramSpannableStringBuilder.append(Html.fromHtml(paramContext.getString(2131034135) + "<br\\><small>" + formatMapToHtmlString(paramMap) + "</small>"));
    }
    if (paramNetworkResponse != null)
    {
      paramSpannableStringBuilder.append("\n\n");
      paramSpannableStringBuilder.append(paramContext.getString(2131034137, new Object[] { String.valueOf(paramNetworkResponse.statusCode) }));
      paramSpannableStringBuilder.append("\n\n");
      paramSpannableStringBuilder.append(Html.fromHtml(paramContext.getString(2131034138) + "<br\\><small>" + formatMapToHtmlString(paramNetworkResponse.headers) + "</small>"));
    }
    if (paramString2 != null)
    {
      paramSpannableStringBuilder.append("\n\n");
      paramString1 = paramString2;
      if (paramString2.length() > 5000) {
        paramString1 = paramString2.substring(0, 5000) + "...";
      }
      paramSpannableStringBuilder.append(Html.fromHtml(paramContext.getString(2131034136) + "<br\\><small>" + paramString1 + "</small>"));
    }
    if (paramException != null)
    {
      paramSpannableStringBuilder.append("\n\n");
      paramSpannableStringBuilder.append(Html.fromHtml(paramContext.getString(2131034139) + "<br\\><small>" + printException(paramException) + "</small>"));
    }
    return paramSpannableStringBuilder;
  }
  
  public static final String parseVolleyErrorMsg(Context paramContext, VolleyError paramVolleyError)
  {
    if ((paramVolleyError instanceof NetworkError)) {
      paramContext = paramContext.getString(2131034114);
    }
    for (;;)
    {
      return paramContext;
      if ((paramVolleyError instanceof TimeoutError)) {
        paramContext = paramContext.getString(2131034117);
      } else if ((paramVolleyError instanceof ServerError)) {
        paramContext = paramContext.getString(2131034116);
      } else if ((paramVolleyError instanceof ParseError)) {
        paramContext = paramContext.getString(2131034115);
      } else {
        paramContext = paramContext.getString(2131034118);
      }
    }
  }
  
  private static String printException(Exception paramException)
  {
    StringWriter localStringWriter = new StringWriter();
    paramException.printStackTrace(new PrintWriter(localStringWriter));
    return localStringWriter.toString();
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardiandatamodule/tester/util/CheckErrorsUtils.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */