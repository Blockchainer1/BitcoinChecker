package com.mobnetic.coinguardiandatamodule.tester.volley.generic;

import com.android.volley.NetworkResponse;
import com.android.volley.Response.ErrorListener;
import com.android.volley.VolleyError;
import java.util.Map;

public abstract class ResponseErrorListener
  implements Response.ErrorListener
{
  public void onErrorResponse(VolleyError paramVolleyError)
  {
    onErrorResponse(null, null, null, null, paramVolleyError);
  }
  
  public abstract void onErrorResponse(String paramString1, Map<String, String> paramMap, NetworkResponse paramNetworkResponse, String paramString2, VolleyError paramVolleyError);
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardiandatamodule/tester/volley/generic/ResponseErrorListener.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */