package com.mobnetic.coinguardian.util;

import android.content.Context;
import android.text.TextUtils;
import com.android.volley.NetworkError;
import com.android.volley.ParseError;
import com.android.volley.ServerError;
import com.android.volley.TimeoutError;
import com.android.volley.VolleyError;
import com.mobnetic.coinguardian.volley.CheckerErrorParsedError;

public class CheckErrorsUtils
{
  public static final String formatError(Context paramContext, String paramString)
  {
    if (paramString != null) {}
    for (;;)
    {
      return paramContext.getString(2131165200, new Object[] { paramString });
      paramString = "UNKNOWN";
    }
  }
  
  public static final String parseErrorMsg(Context paramContext, VolleyError paramVolleyError)
  {
    if (((paramVolleyError instanceof CheckerErrorParsedError)) && (!TextUtils.isEmpty(((CheckerErrorParsedError)paramVolleyError).getErrorMsg()))) {}
    for (paramContext = ((CheckerErrorParsedError)paramVolleyError).getErrorMsg();; paramContext = parseVolleyErrorMsg(paramContext, paramVolleyError)) {
      return paramContext;
    }
  }
  
  public static final String parseVolleyErrorMsg(Context paramContext, VolleyError paramVolleyError)
  {
    if ((paramVolleyError instanceof NetworkError)) {
      paramContext = paramContext.getString(2131165201);
    }
    for (;;)
    {
      return paramContext;
      if ((paramVolleyError instanceof TimeoutError)) {
        paramContext = paramContext.getString(2131165204);
      } else if ((paramVolleyError instanceof ServerError)) {
        paramContext = paramContext.getString(2131165203);
      } else if ((paramVolleyError instanceof ParseError)) {
        paramContext = paramContext.getString(2131165202);
      } else {
        paramContext = paramContext.getString(2131165205);
      }
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/util/CheckErrorsUtils.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */