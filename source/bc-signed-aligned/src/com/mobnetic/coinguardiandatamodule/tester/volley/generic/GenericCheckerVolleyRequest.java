package com.mobnetic.coinguardiandatamodule.tester.volley.generic;

import com.android.volley.Response.ErrorListener;
import com.android.volley.Response.Listener;
import com.mobnetic.coinguardian.model.CheckerInfo;

public abstract class GenericCheckerVolleyRequest<T>
  extends GzipVolleyRequest<T>
{
  protected final CheckerInfo checkerInfo;
  
  public GenericCheckerVolleyRequest(String paramString, CheckerInfo paramCheckerInfo, Response.Listener<T> paramListener, Response.ErrorListener paramErrorListener)
  {
    super(paramString, paramListener, paramErrorListener);
    this.checkerInfo = paramCheckerInfo;
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardiandatamodule/tester/volley/generic/GenericCheckerVolleyRequest.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */