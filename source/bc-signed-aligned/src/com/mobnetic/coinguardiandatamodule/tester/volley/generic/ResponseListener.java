package com.mobnetic.coinguardiandatamodule.tester.volley.generic;

import com.android.volley.NetworkResponse;
import com.android.volley.Response.Listener;
import java.util.Map;

public abstract class ResponseListener<T>
  implements Response.Listener<T>
{
  public void onResponse(T paramT)
  {
    onResponse(null, null, null, null, paramT);
  }
  
  public abstract void onResponse(String paramString1, Map<String, String> paramMap, NetworkResponse paramNetworkResponse, String paramString2, T paramT);
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardiandatamodule/tester/volley/generic/ResponseListener.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */