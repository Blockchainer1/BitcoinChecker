package com.mobnetic.coinguardiandatamodule.tester.volley;

import com.android.volley.toolbox.RequestFuture;
import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardiandatamodule.tester.volley.generic.GenericCheckerVolleyRequest;
import java.util.Map;

public class CheckerVolleyNextRequest
  extends GenericCheckerVolleyRequest<String>
{
  public CheckerVolleyNextRequest(String paramString, CheckerInfo paramCheckerInfo, RequestFuture<String> paramRequestFuture)
  {
    super(paramString, paramCheckerInfo, paramRequestFuture, paramRequestFuture);
  }
  
  protected String parseNetworkResponse(Map<String, String> paramMap, String paramString)
    throws Exception
  {
    return paramString;
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardiandatamodule/tester/volley/CheckerVolleyNextRequest.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */