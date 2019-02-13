package com.mobnetic.coinguardiandatamodule.tester.volley;

import com.android.volley.toolbox.RequestFuture;
import com.mobnetic.coinguardiandatamodule.tester.volley.generic.GzipVolleyRequest;
import java.util.Map;

public class DynamicCurrencyPairsVolleyNextRequest
  extends GzipVolleyRequest<String>
{
  public DynamicCurrencyPairsVolleyNextRequest(String paramString, RequestFuture<String> paramRequestFuture)
  {
    super(paramString, paramRequestFuture, paramRequestFuture);
  }
  
  protected String parseNetworkResponse(Map<String, String> paramMap, String paramString)
    throws Exception
  {
    return paramString;
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardiandatamodule/tester/volley/DynamicCurrencyPairsVolleyNextRequest.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */