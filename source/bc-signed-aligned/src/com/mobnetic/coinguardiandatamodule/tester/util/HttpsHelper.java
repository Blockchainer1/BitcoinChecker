package com.mobnetic.coinguardiandatamodule.tester.util;

import android.content.Context;
import com.android.volley.RequestQueue;
import com.android.volley.toolbox.HurlStack;
import com.android.volley.toolbox.Volley;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSocketFactory;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;

public class HttpsHelper
{
  public static SSLSocketFactory getMySSLSocketFactory()
  {
    Object localObject1 = null;
    try
    {
      SSLContext localSSLContext = SSLContext.getInstance("TLS");
      Object localObject2 = new com/mobnetic/coinguardiandatamodule/tester/util/HttpsHelper$1;
      ((1)localObject2).<init>();
      localSSLContext.init(null, new TrustManager[] { localObject2 }, null);
      localObject2 = localSSLContext.getSocketFactory();
      localObject1 = localObject2;
    }
    catch (Exception localException)
    {
      for (;;)
      {
        localException.printStackTrace();
      }
    }
    return (SSLSocketFactory)localObject1;
  }
  
  public static final RequestQueue newRequestQueue(Context paramContext)
  {
    return Volley.newRequestQueue(paramContext, new HurlStack(null, getMySSLSocketFactory()));
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardiandatamodule/tester/util/HttpsHelper.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */