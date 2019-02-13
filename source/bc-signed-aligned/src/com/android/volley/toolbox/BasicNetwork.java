package com.android.volley.toolbox;

import android.os.SystemClock;
import com.android.volley.AuthFailureError;
import com.android.volley.Cache.Entry;
import com.android.volley.Network;
import com.android.volley.NetworkError;
import com.android.volley.NetworkResponse;
import com.android.volley.NoConnectionError;
import com.android.volley.Request;
import com.android.volley.Request<*>;
import com.android.volley.RetryPolicy;
import com.android.volley.ServerError;
import com.android.volley.TimeoutError;
import com.android.volley.VolleyError;
import com.android.volley.VolleyLog;
import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.SocketTimeoutException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import org.apache.http.Header;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.StatusLine;
import org.apache.http.conn.ConnectTimeoutException;
import org.apache.http.impl.cookie.DateUtils;

public class BasicNetwork
  implements Network
{
  protected static final boolean DEBUG = VolleyLog.DEBUG;
  private static int DEFAULT_POOL_SIZE = 4096;
  private static int SLOW_REQUEST_THRESHOLD_MS = 3000;
  protected final HttpStack mHttpStack;
  protected final ByteArrayPool mPool;
  
  public BasicNetwork(HttpStack paramHttpStack)
  {
    this(paramHttpStack, new ByteArrayPool(DEFAULT_POOL_SIZE));
  }
  
  public BasicNetwork(HttpStack paramHttpStack, ByteArrayPool paramByteArrayPool)
  {
    this.mHttpStack = paramHttpStack;
    this.mPool = paramByteArrayPool;
  }
  
  private void addCacheHeaders(Map<String, String> paramMap, Cache.Entry paramEntry)
  {
    if (paramEntry == null) {}
    for (;;)
    {
      return;
      if (paramEntry.etag != null) {
        paramMap.put("If-None-Match", paramEntry.etag);
      }
      if (paramEntry.serverDate > 0L) {
        paramMap.put("If-Modified-Since", DateUtils.formatDate(new Date(paramEntry.serverDate)));
      }
    }
  }
  
  private static void attemptRetryOnException(String paramString, Request<?> paramRequest, VolleyError paramVolleyError)
    throws VolleyError
  {
    RetryPolicy localRetryPolicy = paramRequest.getRetryPolicy();
    int i = paramRequest.getTimeoutMs();
    try
    {
      localRetryPolicy.retry(paramVolleyError);
      paramRequest.addMarker(String.format("%s-retry [timeout=%s]", new Object[] { paramString, Integer.valueOf(i) }));
      return;
    }
    catch (VolleyError paramVolleyError)
    {
      paramRequest.addMarker(String.format("%s-timeout-giveup [timeout=%s]", new Object[] { paramString, Integer.valueOf(i) }));
      throw paramVolleyError;
    }
  }
  
  private static Map<String, String> convertHeaders(Header[] paramArrayOfHeader)
  {
    HashMap localHashMap = new HashMap();
    for (int i = 0;; i++)
    {
      if (i >= paramArrayOfHeader.length) {
        return localHashMap;
      }
      localHashMap.put(paramArrayOfHeader[i].getName(), paramArrayOfHeader[i].getValue());
    }
  }
  
  private byte[] entityToBytes(HttpEntity paramHttpEntity)
    throws IOException, ServerError
  {
    PoolingByteArrayOutputStream localPoolingByteArrayOutputStream = new PoolingByteArrayOutputStream(this.mPool, (int)paramHttpEntity.getContentLength());
    Object localObject1 = null;
    Object localObject3 = localObject1;
    Object localObject4;
    try
    {
      localObject4 = paramHttpEntity.getContent();
      if (localObject4 == null)
      {
        localObject3 = localObject1;
        localObject4 = new com/android/volley/ServerError;
        localObject3 = localObject1;
        ((ServerError)localObject4).<init>();
        localObject3 = localObject1;
        throw ((Throwable)localObject4);
      }
    }
    finally {}
    try
    {
      paramHttpEntity.consumeContent();
      this.mPool.returnBuf((byte[])localObject3);
      localPoolingByteArrayOutputStream.close();
      throw ((Throwable)localObject2);
      localObject3 = localObject2;
      byte[] arrayOfByte = this.mPool.getBuf(1024);
      for (;;)
      {
        localObject3 = arrayOfByte;
        int i = ((InputStream)localObject4).read(arrayOfByte);
        if (i == -1)
        {
          localObject3 = arrayOfByte;
          localObject4 = localPoolingByteArrayOutputStream.toByteArray();
        }
        try
        {
          paramHttpEntity.consumeContent();
          this.mPool.returnBuf(arrayOfByte);
          localPoolingByteArrayOutputStream.close();
          return (byte[])localObject4;
          localObject3 = arrayOfByte;
          localPoolingByteArrayOutputStream.write(arrayOfByte, 0, i);
        }
        catch (IOException paramHttpEntity)
        {
          for (;;)
          {
            VolleyLog.v("Error occured when calling consumingContent", new Object[0]);
          }
        }
      }
    }
    catch (IOException paramHttpEntity)
    {
      for (;;)
      {
        VolleyLog.v("Error occured when calling consumingContent", new Object[0]);
      }
    }
  }
  
  private void logSlowRequests(long paramLong, Request<?> paramRequest, byte[] paramArrayOfByte, StatusLine paramStatusLine)
  {
    if ((DEBUG) || (paramLong > SLOW_REQUEST_THRESHOLD_MS)) {
      if (paramArrayOfByte == null) {
        break label82;
      }
    }
    label82:
    for (paramArrayOfByte = Integer.valueOf(paramArrayOfByte.length);; paramArrayOfByte = "null")
    {
      VolleyLog.d("HTTP response for request=<%s> [lifetime=%d], [size=%s], [rc=%d], [retryCount=%s]", new Object[] { paramRequest, Long.valueOf(paramLong), paramArrayOfByte, Integer.valueOf(paramStatusLine.getStatusCode()), Integer.valueOf(paramRequest.getRetryPolicy().getCurrentRetryCount()) });
      return;
    }
  }
  
  protected void logError(String paramString1, String paramString2, long paramLong)
  {
    VolleyLog.v("HTTP ERROR(%s) %d ms to fetch %s", new Object[] { paramString1, Long.valueOf(SystemClock.elapsedRealtime() - paramLong), paramString2 });
  }
  
  public NetworkResponse performRequest(Request<?> paramRequest)
    throws VolleyError
  {
    long l = SystemClock.elapsedRealtime();
    label508:
    NetworkResponse localNetworkResponse;
    for (;;)
    {
      HttpResponse localHttpResponse1 = null;
      IOException localIOException1 = null;
      Object localObject1 = new HashMap();
      HttpResponse localHttpResponse2 = null;
      Object localObject2 = localHttpResponse2;
      if (paramRequest.getCacheEntry() != null)
      {
        localObject2 = localHttpResponse2;
        if (paramRequest.getCacheEntry().responseHeaders != null) {
          localObject2 = (String)paramRequest.getCacheEntry().responseHeaders.get("Content-Encoding");
        }
      }
      Object localObject4 = localIOException1;
      localHttpResponse2 = localHttpResponse1;
      Object localObject5 = localObject1;
      try
      {
        Object localObject6 = new java/util/HashMap;
        localObject4 = localIOException1;
        localHttpResponse2 = localHttpResponse1;
        localObject5 = localObject1;
        ((HashMap)localObject6).<init>();
        localObject4 = localIOException1;
        localHttpResponse2 = localHttpResponse1;
        localObject5 = localObject1;
        addCacheHeaders((Map)localObject6, paramRequest.getCacheEntry());
        localObject4 = localIOException1;
        localHttpResponse2 = localHttpResponse1;
        localObject5 = localObject1;
        localHttpResponse1 = this.mHttpStack.performRequest(paramRequest, (Map)localObject6);
        localObject4 = localIOException1;
        localHttpResponse2 = localHttpResponse1;
        localObject5 = localObject1;
        localObject6 = localHttpResponse1.getStatusLine();
        localObject4 = localIOException1;
        localHttpResponse2 = localHttpResponse1;
        localObject5 = localObject1;
        i = ((StatusLine)localObject6).getStatusCode();
        localObject4 = localIOException1;
        localHttpResponse2 = localHttpResponse1;
        localObject5 = localObject1;
        localObject1 = convertHeaders(localHttpResponse1.getAllHeaders());
        if (i == 304)
        {
          if (localObject2 != null)
          {
            localObject4 = localIOException1;
            localHttpResponse2 = localHttpResponse1;
            localObject5 = localObject1;
            ((Map)localObject1).put("Content-Encoding", localObject2);
          }
          localObject4 = localIOException1;
          localHttpResponse2 = localHttpResponse1;
          localObject5 = localObject1;
          if (paramRequest.getCacheEntry() == null) {}
          for (localObject2 = null;; localObject2 = paramRequest.getCacheEntry().data)
          {
            localObject4 = localIOException1;
            localHttpResponse2 = localHttpResponse1;
            localObject5 = localObject1;
            localObject2 = new NetworkResponse(304, (byte[])localObject2, (Map)localObject1, true);
            paramRequest = (Request<?>)localObject2;
            return paramRequest;
            localObject4 = localIOException1;
            localHttpResponse2 = localHttpResponse1;
            localObject5 = localObject1;
          }
        }
        localObject4 = localIOException1;
        localHttpResponse2 = localHttpResponse1;
        localObject5 = localObject1;
        if (localHttpResponse1.getEntity() != null)
        {
          localObject4 = localIOException1;
          localHttpResponse2 = localHttpResponse1;
          localObject5 = localObject1;
          localObject2 = entityToBytes(localHttpResponse1.getEntity());
          localObject4 = localObject2;
          localHttpResponse2 = localHttpResponse1;
          localObject5 = localObject1;
          logSlowRequests(SystemClock.elapsedRealtime() - l, paramRequest, (byte[])localObject2, (StatusLine)localObject6);
          if ((i >= 200) && (i <= 299)) {
            break label508;
          }
          localObject4 = localObject2;
          localHttpResponse2 = localHttpResponse1;
          localObject5 = localObject1;
          localIOException1 = new java/io/IOException;
          localObject4 = localObject2;
          localHttpResponse2 = localHttpResponse1;
          localObject5 = localObject1;
          localIOException1.<init>();
          localObject4 = localObject2;
          localHttpResponse2 = localHttpResponse1;
          localObject5 = localObject1;
          throw localIOException1;
        }
      }
      catch (SocketTimeoutException localSocketTimeoutException)
      {
        for (;;)
        {
          attemptRetryOnException("socket", paramRequest, new TimeoutError());
          break;
          localObject4 = localIOException1;
          localHttpResponse2 = localHttpResponse1;
          localObject5 = localObject1;
          Object localObject3 = new byte[0];
          continue;
          localObject4 = localObject3;
          localHttpResponse2 = localHttpResponse1;
          localObject5 = localObject1;
          localObject3 = new NetworkResponse(i, (byte[])localObject3, (Map)localObject1, false);
          paramRequest = (Request<?>)localObject3;
        }
      }
      catch (ConnectTimeoutException localConnectTimeoutException)
      {
        attemptRetryOnException("connection", paramRequest, new TimeoutError());
      }
      catch (MalformedURLException localMalformedURLException)
      {
        throw new RuntimeException("Bad URL " + paramRequest.getUrl(), localMalformedURLException);
      }
      catch (IOException localIOException2)
      {
        int i;
        if (localHttpResponse2 != null)
        {
          i = localHttpResponse2.getStatusLine().getStatusCode();
          VolleyLog.e("Unexpected response code %d for %s", new Object[] { Integer.valueOf(i), paramRequest.getUrl() });
          if (localObject4 == null) {
            break label715;
          }
          localNetworkResponse = new NetworkResponse(i, (byte[])localObject4, (Map)localObject5, false);
          if ((i == 401) || (i == 403)) {
            attemptRetryOnException("auth", paramRequest, new AuthFailureError(localNetworkResponse));
          }
        }
        else
        {
          throw new NoConnectionError(localNetworkResponse);
        }
      }
    }
    throw new ServerError(localNetworkResponse);
    label715:
    throw new NetworkError(null);
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/android/volley/toolbox/BasicNetwork.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */