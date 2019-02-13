package com.android.volley.toolbox;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import java.io.IOException;
import java.net.URI;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpDelete;
import org.apache.http.client.methods.HttpEntityEnclosingRequestBase;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpHead;
import org.apache.http.client.methods.HttpOptions;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpPut;
import org.apache.http.client.methods.HttpTrace;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.entity.ByteArrayEntity;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.params.HttpConnectionParams;

public class HttpClientStack
  implements HttpStack
{
  private static final String HEADER_CONTENT_TYPE = "Content-Type";
  protected final HttpClient mClient;
  
  public HttpClientStack(HttpClient paramHttpClient)
  {
    this.mClient = paramHttpClient;
  }
  
  private static void addHeaders(HttpUriRequest paramHttpUriRequest, Map<String, String> paramMap)
  {
    Iterator localIterator = paramMap.keySet().iterator();
    for (;;)
    {
      if (!localIterator.hasNext()) {
        return;
      }
      String str = (String)localIterator.next();
      paramHttpUriRequest.setHeader(str, (String)paramMap.get(str));
    }
  }
  
  static HttpUriRequest createHttpRequest(Request<?> paramRequest, Map<String, String> paramMap)
    throws AuthFailureError
  {
    switch (paramRequest.getMethod())
    {
    default: 
      throw new IllegalStateException("Unknown request method.");
    case -1: 
      byte[] arrayOfByte = paramRequest.getPostBody();
      if (arrayOfByte != null)
      {
        paramMap = new HttpPost(paramRequest.getUrl());
        paramMap.addHeader("Content-Type", paramRequest.getPostBodyContentType());
        paramMap.setEntity(new ByteArrayEntity(arrayOfByte));
        paramRequest = paramMap;
      }
      break;
    }
    for (;;)
    {
      return paramRequest;
      paramRequest = new HttpGet(paramRequest.getUrl());
      continue;
      paramRequest = new HttpGet(paramRequest.getUrl());
      continue;
      paramRequest = new HttpDelete(paramRequest.getUrl());
      continue;
      paramMap = new HttpPost(paramRequest.getUrl());
      paramMap.addHeader("Content-Type", paramRequest.getBodyContentType());
      setEntityIfNonEmptyBody(paramMap, paramRequest);
      paramRequest = paramMap;
      continue;
      paramMap = new HttpPut(paramRequest.getUrl());
      paramMap.addHeader("Content-Type", paramRequest.getBodyContentType());
      setEntityIfNonEmptyBody(paramMap, paramRequest);
      paramRequest = paramMap;
      continue;
      paramRequest = new HttpHead(paramRequest.getUrl());
      continue;
      paramRequest = new HttpOptions(paramRequest.getUrl());
      continue;
      paramRequest = new HttpTrace(paramRequest.getUrl());
      continue;
      paramMap = new HttpPatch(paramRequest.getUrl());
      paramMap.addHeader("Content-Type", paramRequest.getBodyContentType());
      setEntityIfNonEmptyBody(paramMap, paramRequest);
      paramRequest = paramMap;
    }
  }
  
  private static List<NameValuePair> getPostParameterPairs(Map<String, String> paramMap)
  {
    ArrayList localArrayList = new ArrayList(paramMap.size());
    Iterator localIterator = paramMap.keySet().iterator();
    for (;;)
    {
      if (!localIterator.hasNext()) {
        return localArrayList;
      }
      String str = (String)localIterator.next();
      localArrayList.add(new BasicNameValuePair(str, (String)paramMap.get(str)));
    }
  }
  
  private static void setEntityIfNonEmptyBody(HttpEntityEnclosingRequestBase paramHttpEntityEnclosingRequestBase, Request<?> paramRequest)
    throws AuthFailureError
  {
    paramRequest = paramRequest.getBody();
    if (paramRequest != null) {
      paramHttpEntityEnclosingRequestBase.setEntity(new ByteArrayEntity(paramRequest));
    }
  }
  
  protected void onPrepareRequest(HttpUriRequest paramHttpUriRequest)
    throws IOException
  {}
  
  public HttpResponse performRequest(Request<?> paramRequest, Map<String, String> paramMap)
    throws IOException, AuthFailureError
  {
    HttpUriRequest localHttpUriRequest = createHttpRequest(paramRequest, paramMap);
    addHeaders(localHttpUriRequest, paramMap);
    addHeaders(localHttpUriRequest, paramRequest.getHeaders());
    onPrepareRequest(localHttpUriRequest);
    paramMap = localHttpUriRequest.getParams();
    int i = paramRequest.getTimeoutMs();
    HttpConnectionParams.setConnectionTimeout(paramMap, 5000);
    HttpConnectionParams.setSoTimeout(paramMap, i);
    return this.mClient.execute(localHttpUriRequest);
  }
  
  public static final class HttpPatch
    extends HttpEntityEnclosingRequestBase
  {
    public static final String METHOD_NAME = "PATCH";
    
    public HttpPatch() {}
    
    public HttpPatch(String paramString)
    {
      setURI(URI.create(paramString));
    }
    
    public HttpPatch(URI paramURI)
    {
      setURI(paramURI);
    }
    
    public String getMethod()
    {
      return "PATCH";
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/android/volley/toolbox/HttpClientStack.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */