package com.mobnetic.coinguardiandatamodule.tester.volley.generic;

import com.android.volley.AuthFailureError;
import com.android.volley.NetworkResponse;
import com.android.volley.ParseError;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.Response.ErrorListener;
import com.android.volley.Response.Listener;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.HttpHeaderParser;
import com.mobnetic.coinguardiandatamodule.tester.volley.CheckerErrorParsedError;
import com.mobnetic.coinguardiandatamodule.tester.volley.UnknownVolleyError;
import java.util.HashMap;
import java.util.Map;

public abstract class GzipVolleyRequest<T>
  extends Request<T>
{
  private static final int MAX_REDIRECTION_COUNT = 3;
  private final Response.ErrorListener errorListener;
  private final Map<String, String> headers;
  private final Response.Listener<T> listener;
  private NetworkResponse networkResponse;
  private int redirectionCount;
  private String redirectionUrl = null;
  private Map<String, String> requestHeaders;
  private RequestQueue requestQueue;
  private String responseString;
  
  public GzipVolleyRequest(String paramString, Response.Listener<T> paramListener, Response.ErrorListener paramErrorListener)
  {
    super(0, paramString, paramErrorListener);
    this.listener = paramListener;
    this.errorListener = paramErrorListener;
    this.headers = new HashMap();
    this.headers.put("Accept-Encoding", "gzip");
    this.headers.put("User-Agent", "Bitcoin Checker (gzip)");
  }
  
  /* Error */
  private String decodeGZip(byte[] paramArrayOfByte)
    throws Exception
  {
    // Byte code:
    //   0: ldc 66
    //   2: astore_2
    //   3: aconst_null
    //   4: astore_3
    //   5: aconst_null
    //   6: astore 4
    //   8: aconst_null
    //   9: astore 5
    //   11: aconst_null
    //   12: astore 6
    //   14: aconst_null
    //   15: astore 7
    //   17: aconst_null
    //   18: astore 8
    //   20: aconst_null
    //   21: astore 9
    //   23: aconst_null
    //   24: astore 10
    //   26: aconst_null
    //   27: astore 11
    //   29: aconst_null
    //   30: astore 12
    //   32: aconst_null
    //   33: astore 13
    //   35: aload_3
    //   36: astore 14
    //   38: aload 5
    //   40: astore 15
    //   42: aload 11
    //   44: astore 16
    //   46: aload 8
    //   48: astore 17
    //   50: new 68	java/io/ByteArrayInputStream
    //   53: astore 18
    //   55: aload_3
    //   56: astore 14
    //   58: aload 5
    //   60: astore 15
    //   62: aload 11
    //   64: astore 16
    //   66: aload 8
    //   68: astore 17
    //   70: aload 18
    //   72: aload_1
    //   73: invokespecial 71	java/io/ByteArrayInputStream:<init>	([B)V
    //   76: new 73	java/util/zip/GZIPInputStream
    //   79: astore_1
    //   80: aload_1
    //   81: aload 18
    //   83: invokespecial 76	java/util/zip/GZIPInputStream:<init>	(Ljava/io/InputStream;)V
    //   86: new 78	java/io/InputStreamReader
    //   89: astore_3
    //   90: aload_3
    //   91: aload_1
    //   92: invokespecial 79	java/io/InputStreamReader:<init>	(Ljava/io/InputStream;)V
    //   95: new 81	java/io/BufferedReader
    //   98: astore 17
    //   100: aload 17
    //   102: aload_3
    //   103: invokespecial 84	java/io/BufferedReader:<init>	(Ljava/io/Reader;)V
    //   106: aload_2
    //   107: astore 14
    //   109: aload 17
    //   111: invokevirtual 88	java/io/BufferedReader:readLine	()Ljava/lang/String;
    //   114: astore 15
    //   116: aload 15
    //   118: ifnull +38 -> 156
    //   121: new 90	java/lang/StringBuilder
    //   124: astore 16
    //   126: aload 16
    //   128: invokespecial 91	java/lang/StringBuilder:<init>	()V
    //   131: aload 16
    //   133: aload 14
    //   135: invokevirtual 95	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   138: aload 15
    //   140: invokevirtual 95	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   143: ldc 97
    //   145: invokevirtual 95	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   148: invokevirtual 100	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   151: astore 14
    //   153: goto -44 -> 109
    //   156: aload 18
    //   158: ifnull +8 -> 166
    //   161: aload 18
    //   163: invokevirtual 103	java/io/ByteArrayInputStream:close	()V
    //   166: aload_1
    //   167: ifnull +7 -> 174
    //   170: aload_1
    //   171: invokevirtual 104	java/util/zip/GZIPInputStream:close	()V
    //   174: aload_3
    //   175: ifnull +7 -> 182
    //   178: aload_3
    //   179: invokevirtual 105	java/io/InputStreamReader:close	()V
    //   182: aload 17
    //   184: ifnull +8 -> 192
    //   187: aload 17
    //   189: invokevirtual 106	java/io/BufferedReader:close	()V
    //   192: aload 14
    //   194: areturn
    //   195: astore 18
    //   197: aload 10
    //   199: astore 17
    //   201: aload 13
    //   203: astore 16
    //   205: aload 7
    //   207: astore_3
    //   208: aload 4
    //   210: astore_1
    //   211: aload_1
    //   212: astore 14
    //   214: aload_3
    //   215: astore 15
    //   217: aload 18
    //   219: athrow
    //   220: astore_3
    //   221: aload 15
    //   223: astore 18
    //   225: aload 14
    //   227: astore_1
    //   228: aload_1
    //   229: ifnull +7 -> 236
    //   232: aload_1
    //   233: invokevirtual 103	java/io/ByteArrayInputStream:close	()V
    //   236: aload 18
    //   238: ifnull +8 -> 246
    //   241: aload 18
    //   243: invokevirtual 104	java/util/zip/GZIPInputStream:close	()V
    //   246: aload 17
    //   248: ifnull +8 -> 256
    //   251: aload 17
    //   253: invokevirtual 105	java/io/InputStreamReader:close	()V
    //   256: aload 16
    //   258: ifnull +8 -> 266
    //   261: aload 16
    //   263: invokevirtual 106	java/io/BufferedReader:close	()V
    //   266: aload_3
    //   267: athrow
    //   268: astore_1
    //   269: goto -3 -> 266
    //   272: astore_3
    //   273: aload 18
    //   275: astore_1
    //   276: aload 6
    //   278: astore 18
    //   280: aload 12
    //   282: astore 16
    //   284: aload 9
    //   286: astore 17
    //   288: goto -60 -> 228
    //   291: astore_3
    //   292: aload_1
    //   293: astore 17
    //   295: aload 18
    //   297: astore_1
    //   298: aload 17
    //   300: astore 18
    //   302: aload 12
    //   304: astore 16
    //   306: aload 9
    //   308: astore 17
    //   310: goto -82 -> 228
    //   313: astore 14
    //   315: aload_1
    //   316: astore 17
    //   318: aload 18
    //   320: astore_1
    //   321: aload 17
    //   323: astore 18
    //   325: aload 12
    //   327: astore 16
    //   329: aload_3
    //   330: astore 17
    //   332: aload 14
    //   334: astore_3
    //   335: goto -107 -> 228
    //   338: astore 14
    //   340: aload_1
    //   341: astore 15
    //   343: aload 18
    //   345: astore_1
    //   346: aload 15
    //   348: astore 18
    //   350: aload 17
    //   352: astore 16
    //   354: aload_3
    //   355: astore 17
    //   357: aload 14
    //   359: astore_3
    //   360: goto -132 -> 228
    //   363: astore_3
    //   364: aload 18
    //   366: astore_1
    //   367: aload_3
    //   368: astore 18
    //   370: aload 7
    //   372: astore_3
    //   373: aload 13
    //   375: astore 16
    //   377: aload 10
    //   379: astore 17
    //   381: goto -170 -> 211
    //   384: astore 17
    //   386: aload_1
    //   387: astore_3
    //   388: aload 18
    //   390: astore_1
    //   391: aload 17
    //   393: astore 18
    //   395: aload 13
    //   397: astore 16
    //   399: aload 10
    //   401: astore 17
    //   403: goto -192 -> 211
    //   406: astore 14
    //   408: aload_3
    //   409: astore 17
    //   411: aload_1
    //   412: astore_3
    //   413: aload 18
    //   415: astore_1
    //   416: aload 14
    //   418: astore 18
    //   420: aload 13
    //   422: astore 16
    //   424: goto -213 -> 211
    //   427: astore 15
    //   429: aload_3
    //   430: astore 14
    //   432: aload_1
    //   433: astore_3
    //   434: aload 18
    //   436: astore_1
    //   437: aload 15
    //   439: astore 18
    //   441: aload 17
    //   443: astore 16
    //   445: aload 14
    //   447: astore 17
    //   449: goto -238 -> 211
    //   452: astore_1
    //   453: goto -261 -> 192
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	456	0	this	GzipVolleyRequest
    //   0	456	1	paramArrayOfByte	byte[]
    //   2	105	2	str	String
    //   4	211	3	localObject1	Object
    //   220	47	3	localObject2	Object
    //   272	1	3	localObject3	Object
    //   291	39	3	localObject4	Object
    //   334	26	3	localObject5	Object
    //   363	5	3	localException1	Exception
    //   372	62	3	localObject6	Object
    //   6	203	4	localObject7	Object
    //   9	50	5	localObject8	Object
    //   12	265	6	localObject9	Object
    //   15	356	7	localObject10	Object
    //   18	49	8	localObject11	Object
    //   21	286	9	localObject12	Object
    //   24	376	10	localObject13	Object
    //   27	36	11	localObject14	Object
    //   30	296	12	localObject15	Object
    //   33	388	13	localObject16	Object
    //   36	190	14	localObject17	Object
    //   313	20	14	localObject18	Object
    //   338	20	14	localObject19	Object
    //   406	11	14	localException2	Exception
    //   430	16	14	localObject20	Object
    //   40	307	15	localObject21	Object
    //   427	11	15	localException3	Exception
    //   44	400	16	localObject22	Object
    //   48	332	17	localObject23	Object
    //   384	8	17	localException4	Exception
    //   401	47	17	localObject24	Object
    //   53	109	18	localByteArrayInputStream	java.io.ByteArrayInputStream
    //   195	23	18	localException5	Exception
    //   223	217	18	localObject25	Object
    // Exception table:
    //   from	to	target	type
    //   50	55	195	java/lang/Exception
    //   70	76	195	java/lang/Exception
    //   50	55	220	finally
    //   70	76	220	finally
    //   217	220	220	finally
    //   232	236	268	java/lang/Exception
    //   241	246	268	java/lang/Exception
    //   251	256	268	java/lang/Exception
    //   261	266	268	java/lang/Exception
    //   76	86	272	finally
    //   86	95	291	finally
    //   95	106	313	finally
    //   109	116	338	finally
    //   121	153	338	finally
    //   76	86	363	java/lang/Exception
    //   86	95	384	java/lang/Exception
    //   95	106	406	java/lang/Exception
    //   109	116	427	java/lang/Exception
    //   121	153	427	java/lang/Exception
    //   161	166	452	java/lang/Exception
    //   170	174	452	java/lang/Exception
    //   178	182	452	java/lang/Exception
    //   187	192	452	java/lang/Exception
  }
  
  public void deliverError(VolleyError paramVolleyError)
  {
    if ((paramVolleyError != null) && (paramVolleyError.networkResponse != null))
    {
      int i = paramVolleyError.networkResponse.statusCode;
      if ((i == 301) || (i == 302))
      {
        String str = (String)paramVolleyError.networkResponse.headers.get("Location");
        if ((str != null) && (this.redirectionCount < 3))
        {
          this.redirectionCount += 1;
          this.redirectionUrl = str;
          this.requestQueue.add(this);
        }
      }
    }
    for (;;)
    {
      return;
      if ((this.errorListener instanceof ResponseErrorListener)) {
        ((ResponseErrorListener)this.errorListener).onErrorResponse(getUrl(), this.requestHeaders, this.networkResponse, this.responseString, paramVolleyError);
      } else {
        super.deliverError(paramVolleyError);
      }
    }
  }
  
  protected void deliverResponse(T paramT)
  {
    if ((this.listener instanceof ResponseListener)) {
      ((ResponseListener)this.listener).onResponse(getUrl(), this.requestHeaders, this.networkResponse, this.responseString, paramT);
    }
    for (;;)
    {
      return;
      this.listener.onResponse(paramT);
    }
  }
  
  public Map<String, String> getHeaders()
    throws AuthFailureError
  {
    if (this.headers != null) {}
    for (Map localMap = this.headers;; localMap = super.getHeaders())
    {
      this.requestHeaders = localMap;
      return this.requestHeaders;
    }
  }
  
  public RequestQueue getRequestQueue()
  {
    return this.requestQueue;
  }
  
  public String getUrl()
  {
    if (this.redirectionUrl != null) {}
    for (String str = this.redirectionUrl;; str = super.getUrl()) {
      return str;
    }
  }
  
  protected Response<T> parseNetworkResponse(NetworkResponse paramNetworkResponse)
  {
    for (;;)
    {
      try
      {
        this.networkResponse = paramNetworkResponse;
        str = (String)paramNetworkResponse.headers.get("Content-Encoding");
        if ((str == null) || (!str.contains("gzip"))) {
          continue;
        }
        str = decodeGZip(paramNetworkResponse.data);
        this.responseString = str;
        Map localMap = paramNetworkResponse.headers;
        paramNetworkResponse = HttpHeaderParser.parseCacheHeaders(paramNetworkResponse);
        paramNetworkResponse = Response.success(parseNetworkResponse(localMap, str), paramNetworkResponse);
      }
      catch (CheckerErrorParsedError paramNetworkResponse)
      {
        String str;
        paramNetworkResponse = Response.error(paramNetworkResponse);
        continue;
      }
      catch (Exception paramNetworkResponse)
      {
        paramNetworkResponse = Response.error(new ParseError(paramNetworkResponse));
        continue;
      }
      catch (Throwable paramNetworkResponse)
      {
        paramNetworkResponse = Response.error(new UnknownVolleyError(paramNetworkResponse));
        continue;
      }
      return paramNetworkResponse;
      str = new String(paramNetworkResponse.data, HttpHeaderParser.parseCharset(paramNetworkResponse.headers));
    }
  }
  
  protected abstract T parseNetworkResponse(Map<String, String> paramMap, String paramString)
    throws Exception;
  
  public Request<?> setRequestQueue(RequestQueue paramRequestQueue)
  {
    this.requestQueue = paramRequestQueue;
    return super.setRequestQueue(paramRequestQueue);
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardiandatamodule/tester/volley/generic/GzipVolleyRequest.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */