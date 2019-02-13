package com.mobnetic.coinguardian.volley.generic;

import com.android.volley.Response.ErrorListener;
import com.android.volley.Response.Listener;

public class GzipVolleyStringRequest
  extends GzipVolleyRequest<String>
{
  public GzipVolleyStringRequest(String paramString, Response.Listener<String> paramListener, Response.ErrorListener paramErrorListener)
  {
    super(paramString, paramListener, paramErrorListener);
  }
  
  protected String parseNetworkResponse(String paramString)
    throws Exception
  {
    return paramString;
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/volley/generic/GzipVolleyStringRequest.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */