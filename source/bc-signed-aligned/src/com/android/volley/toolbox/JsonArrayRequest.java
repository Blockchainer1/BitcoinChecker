package com.android.volley.toolbox;

import com.android.volley.NetworkResponse;
import com.android.volley.ParseError;
import com.android.volley.Response;
import com.android.volley.Response.ErrorListener;
import com.android.volley.Response.Listener;
import java.io.UnsupportedEncodingException;
import org.json.JSONArray;
import org.json.JSONException;

public class JsonArrayRequest
  extends JsonRequest<JSONArray>
{
  public JsonArrayRequest(String paramString, Response.Listener<JSONArray> paramListener, Response.ErrorListener paramErrorListener)
  {
    super(0, paramString, null, paramListener, paramErrorListener);
  }
  
  protected Response<JSONArray> parseNetworkResponse(NetworkResponse paramNetworkResponse)
  {
    try
    {
      String str = new java/lang/String;
      str.<init>(paramNetworkResponse.data, HttpHeaderParser.parseCharset(paramNetworkResponse.headers));
      JSONArray localJSONArray = new org/json/JSONArray;
      localJSONArray.<init>(str);
      paramNetworkResponse = Response.success(localJSONArray, HttpHeaderParser.parseCacheHeaders(paramNetworkResponse));
      return paramNetworkResponse;
    }
    catch (UnsupportedEncodingException paramNetworkResponse)
    {
      for (;;)
      {
        paramNetworkResponse = Response.error(new ParseError(paramNetworkResponse));
      }
    }
    catch (JSONException paramNetworkResponse)
    {
      for (;;)
      {
        paramNetworkResponse = Response.error(new ParseError(paramNetworkResponse));
      }
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/android/volley/toolbox/JsonArrayRequest.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */