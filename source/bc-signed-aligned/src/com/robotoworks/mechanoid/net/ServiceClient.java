package com.robotoworks.mechanoid.net;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Set;

public abstract class ServiceClient
{
  private static final String DEFAULT_LOG_TAG = ServiceClient.class.getSimpleName();
  protected static final String METHOD_DELETE = "DELETE";
  protected static final String METHOD_GET = "GET";
  protected static final String METHOD_POST = "POST";
  protected static final String METHOD_PUT = "PUT";
  private String mBaseUrl;
  private int mConnectTimeout = 20000;
  private boolean mDebug;
  private LinkedHashMap<String, String> mHeaders = new LinkedHashMap();
  private int mReadTimeout = 20000;
  private JsonEntityReaderProvider mReaderProvider;
  private JsonEntityWriterProvider mWriterProvider;
  
  public ServiceClient(String paramString, boolean paramBoolean)
  {
    this.mBaseUrl = paramString;
    this.mDebug = paramBoolean;
    this.mReaderProvider = createReaderProvider();
    this.mWriterProvider = createWriterProvider();
  }
  
  protected <REQUEST extends ServiceRequest> void applyRequestProperties(REQUEST paramREQUEST, HttpURLConnection paramHttpURLConnection)
  {
    Object localObject1 = getHeaders().keySet().iterator();
    while (((Iterator)localObject1).hasNext())
    {
      localObject2 = (String)((Iterator)localObject1).next();
      paramHttpURLConnection.setRequestProperty((String)localObject2, (String)getHeaders().get(localObject2));
    }
    Object localObject2 = paramREQUEST.getHeaderKeys().iterator();
    while (((Iterator)localObject2).hasNext())
    {
      localObject1 = (String)((Iterator)localObject2).next();
      paramHttpURLConnection.setRequestProperty((String)localObject1, paramREQUEST.getHeaderValue((String)localObject1));
    }
  }
  
  protected <REQUEST extends ServiceRequest> void applyRequestTimeouts(REQUEST paramREQUEST, HttpURLConnection paramHttpURLConnection)
  {
    if (paramREQUEST.getReadTimeout() > -1)
    {
      paramHttpURLConnection.setReadTimeout(paramREQUEST.getReadTimeout());
      if (paramREQUEST.getConnectTimeout() <= -1) {
        break label44;
      }
      paramHttpURLConnection.setConnectTimeout(paramREQUEST.getConnectTimeout());
    }
    for (;;)
    {
      return;
      paramHttpURLConnection.setReadTimeout(this.mReadTimeout);
      break;
      label44:
      paramHttpURLConnection.setConnectTimeout(this.mConnectTimeout);
    }
  }
  
  protected <REQUEST extends ServiceRequest, RESULT extends ServiceResult> Response<RESULT> createMockedResponse(URL paramURL, REQUEST paramREQUEST, Parser<RESULT> paramParser)
  {
    return null;
  }
  
  protected abstract JsonEntityReaderProvider createReaderProvider();
  
  protected <REQUEST extends ServiceRequest> URL createUrl(REQUEST paramREQUEST)
    throws MalformedURLException
  {
    return new URL(paramREQUEST.createUrl(getBaseUrl()));
  }
  
  protected abstract JsonEntityWriterProvider createWriterProvider();
  
  /* Error */
  protected <REQUEST extends ServiceRequest, RESULT extends ServiceResult> Response<RESULT> delete(REQUEST paramREQUEST, Parser<RESULT> paramParser)
    throws ServiceException
  {
    // Byte code:
    //   0: aload_0
    //   1: aload_1
    //   2: invokevirtual 162	com/robotoworks/mechanoid/net/ServiceClient:createUrl	(Lcom/robotoworks/mechanoid/net/ServiceRequest;)Ljava/net/URL;
    //   5: astore_3
    //   6: aload_0
    //   7: aload_3
    //   8: aload_1
    //   9: aload_2
    //   10: invokevirtual 164	com/robotoworks/mechanoid/net/ServiceClient:createMockedResponse	(Ljava/net/URL;Lcom/robotoworks/mechanoid/net/ServiceRequest;Lcom/robotoworks/mechanoid/net/Parser;)Lcom/robotoworks/mechanoid/net/Response;
    //   13: astore 4
    //   15: aload 4
    //   17: ifnull +28 -> 45
    //   20: aload 4
    //   22: astore_1
    //   23: aload_0
    //   24: invokevirtual 167	com/robotoworks/mechanoid/net/ServiceClient:isDebug	()Z
    //   27: ifeq +16 -> 43
    //   30: aload_0
    //   31: invokevirtual 170	com/robotoworks/mechanoid/net/ServiceClient:getLogTag	()Ljava/lang/String;
    //   34: ldc -84
    //   36: invokestatic 178	android/util/Log:d	(Ljava/lang/String;Ljava/lang/String;)I
    //   39: pop
    //   40: aload 4
    //   42: astore_1
    //   43: aload_1
    //   44: areturn
    //   45: aload_0
    //   46: invokevirtual 167	com/robotoworks/mechanoid/net/ServiceClient:isDebug	()Z
    //   49: ifeq +42 -> 91
    //   52: aload_0
    //   53: invokevirtual 170	com/robotoworks/mechanoid/net/ServiceClient:getLogTag	()Ljava/lang/String;
    //   56: astore 5
    //   58: new 180	java/lang/StringBuilder
    //   61: astore 4
    //   63: aload 4
    //   65: invokespecial 181	java/lang/StringBuilder:<init>	()V
    //   68: aload 5
    //   70: aload 4
    //   72: ldc -73
    //   74: invokevirtual 187	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   77: aload_3
    //   78: invokevirtual 190	java/net/URL:toString	()Ljava/lang/String;
    //   81: invokevirtual 187	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   84: invokevirtual 191	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   87: invokestatic 178	android/util/Log:d	(Ljava/lang/String;Ljava/lang/String;)I
    //   90: pop
    //   91: aload_0
    //   92: aload_3
    //   93: invokevirtual 195	com/robotoworks/mechanoid/net/ServiceClient:openConnection	(Ljava/net/URL;)Ljava/net/HttpURLConnection;
    //   96: astore 4
    //   98: aload_0
    //   99: aload_1
    //   100: aload 4
    //   102: invokevirtual 197	com/robotoworks/mechanoid/net/ServiceClient:applyRequestTimeouts	(Lcom/robotoworks/mechanoid/net/ServiceRequest;Ljava/net/HttpURLConnection;)V
    //   105: aload 4
    //   107: ldc 9
    //   109: invokevirtual 200	java/net/HttpURLConnection:setRequestMethod	(Ljava/lang/String;)V
    //   112: aload_0
    //   113: aload_1
    //   114: aload 4
    //   116: invokevirtual 202	com/robotoworks/mechanoid/net/ServiceClient:applyRequestProperties	(Lcom/robotoworks/mechanoid/net/ServiceRequest;Ljava/net/HttpURLConnection;)V
    //   119: aload_0
    //   120: invokevirtual 167	com/robotoworks/mechanoid/net/ServiceClient:isDebug	()Z
    //   123: ifeq +15 -> 138
    //   126: aload_0
    //   127: invokevirtual 170	com/robotoworks/mechanoid/net/ServiceClient:getLogTag	()Ljava/lang/String;
    //   130: aload 4
    //   132: invokevirtual 206	java/net/HttpURLConnection:getRequestProperties	()Ljava/util/Map;
    //   135: invokestatic 212	com/robotoworks/mechanoid/net/NetLogHelper:logProperties	(Ljava/lang/String;Ljava/util/Map;)V
    //   138: aload 4
    //   140: invokevirtual 215	java/net/HttpURLConnection:connect	()V
    //   143: new 217	com/robotoworks/mechanoid/net/HttpUrlConnectionResponse
    //   146: astore_1
    //   147: aload_1
    //   148: aload 4
    //   150: aload_2
    //   151: invokespecial 220	com/robotoworks/mechanoid/net/HttpUrlConnectionResponse:<init>	(Ljava/net/HttpURLConnection;Lcom/robotoworks/mechanoid/net/Parser;)V
    //   154: aload_0
    //   155: invokevirtual 167	com/robotoworks/mechanoid/net/ServiceClient:isDebug	()Z
    //   158: ifeq +30 -> 188
    //   161: aload_0
    //   162: invokevirtual 170	com/robotoworks/mechanoid/net/ServiceClient:getLogTag	()Ljava/lang/String;
    //   165: aload_1
    //   166: invokeinterface 224 1 0
    //   171: invokestatic 212	com/robotoworks/mechanoid/net/NetLogHelper:logProperties	(Ljava/lang/String;Ljava/util/Map;)V
    //   174: aload_0
    //   175: invokevirtual 170	com/robotoworks/mechanoid/net/ServiceClient:getLogTag	()Ljava/lang/String;
    //   178: aload_1
    //   179: invokeinterface 227 1 0
    //   184: invokestatic 178	android/util/Log:d	(Ljava/lang/String;Ljava/lang/String;)I
    //   187: pop
    //   188: goto -145 -> 43
    //   191: astore_1
    //   192: new 158	com/robotoworks/mechanoid/net/ServiceException
    //   195: dup
    //   196: aload_1
    //   197: invokespecial 230	com/robotoworks/mechanoid/net/ServiceException:<init>	(Ljava/lang/Throwable;)V
    //   200: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	201	0	this	ServiceClient
    //   0	201	1	paramREQUEST	REQUEST
    //   0	201	2	paramParser	Parser<RESULT>
    //   5	88	3	localURL	URL
    //   13	136	4	localObject	Object
    //   56	13	5	str	String
    // Exception table:
    //   from	to	target	type
    //   0	15	191	java/lang/Exception
    //   23	40	191	java/lang/Exception
    //   45	91	191	java/lang/Exception
    //   91	138	191	java/lang/Exception
    //   138	188	191	java/lang/Exception
  }
  
  /* Error */
  protected <REQUEST extends ServiceRequest, RESULT extends ServiceResult> Response<RESULT> get(REQUEST paramREQUEST, Parser<RESULT> paramParser)
    throws ServiceException
  {
    // Byte code:
    //   0: aload_0
    //   1: aload_1
    //   2: invokevirtual 162	com/robotoworks/mechanoid/net/ServiceClient:createUrl	(Lcom/robotoworks/mechanoid/net/ServiceRequest;)Ljava/net/URL;
    //   5: astore_3
    //   6: aload_0
    //   7: aload_3
    //   8: aload_1
    //   9: aload_2
    //   10: invokevirtual 164	com/robotoworks/mechanoid/net/ServiceClient:createMockedResponse	(Ljava/net/URL;Lcom/robotoworks/mechanoid/net/ServiceRequest;Lcom/robotoworks/mechanoid/net/Parser;)Lcom/robotoworks/mechanoid/net/Response;
    //   13: astore 4
    //   15: aload 4
    //   17: ifnull +28 -> 45
    //   20: aload 4
    //   22: astore_1
    //   23: aload_0
    //   24: invokevirtual 167	com/robotoworks/mechanoid/net/ServiceClient:isDebug	()Z
    //   27: ifeq +16 -> 43
    //   30: aload_0
    //   31: invokevirtual 170	com/robotoworks/mechanoid/net/ServiceClient:getLogTag	()Ljava/lang/String;
    //   34: ldc -23
    //   36: invokestatic 178	android/util/Log:d	(Ljava/lang/String;Ljava/lang/String;)I
    //   39: pop
    //   40: aload 4
    //   42: astore_1
    //   43: aload_1
    //   44: areturn
    //   45: aload_0
    //   46: invokevirtual 167	com/robotoworks/mechanoid/net/ServiceClient:isDebug	()Z
    //   49: ifeq +42 -> 91
    //   52: aload_0
    //   53: invokevirtual 170	com/robotoworks/mechanoid/net/ServiceClient:getLogTag	()Ljava/lang/String;
    //   56: astore 5
    //   58: new 180	java/lang/StringBuilder
    //   61: astore 4
    //   63: aload 4
    //   65: invokespecial 181	java/lang/StringBuilder:<init>	()V
    //   68: aload 5
    //   70: aload 4
    //   72: ldc -21
    //   74: invokevirtual 187	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   77: aload_3
    //   78: invokevirtual 190	java/net/URL:toString	()Ljava/lang/String;
    //   81: invokevirtual 187	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   84: invokevirtual 191	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   87: invokestatic 178	android/util/Log:d	(Ljava/lang/String;Ljava/lang/String;)I
    //   90: pop
    //   91: aload_0
    //   92: aload_3
    //   93: invokevirtual 195	com/robotoworks/mechanoid/net/ServiceClient:openConnection	(Ljava/net/URL;)Ljava/net/HttpURLConnection;
    //   96: astore 4
    //   98: aload_0
    //   99: aload_1
    //   100: aload 4
    //   102: invokevirtual 197	com/robotoworks/mechanoid/net/ServiceClient:applyRequestTimeouts	(Lcom/robotoworks/mechanoid/net/ServiceRequest;Ljava/net/HttpURLConnection;)V
    //   105: aload 4
    //   107: ldc 12
    //   109: invokevirtual 200	java/net/HttpURLConnection:setRequestMethod	(Ljava/lang/String;)V
    //   112: aload 4
    //   114: ldc -19
    //   116: ldc -17
    //   118: invokevirtual 109	java/net/HttpURLConnection:setRequestProperty	(Ljava/lang/String;Ljava/lang/String;)V
    //   121: aload_0
    //   122: aload_1
    //   123: aload 4
    //   125: invokevirtual 202	com/robotoworks/mechanoid/net/ServiceClient:applyRequestProperties	(Lcom/robotoworks/mechanoid/net/ServiceRequest;Ljava/net/HttpURLConnection;)V
    //   128: aload_0
    //   129: invokevirtual 167	com/robotoworks/mechanoid/net/ServiceClient:isDebug	()Z
    //   132: ifeq +15 -> 147
    //   135: aload_0
    //   136: invokevirtual 170	com/robotoworks/mechanoid/net/ServiceClient:getLogTag	()Ljava/lang/String;
    //   139: aload 4
    //   141: invokevirtual 206	java/net/HttpURLConnection:getRequestProperties	()Ljava/util/Map;
    //   144: invokestatic 212	com/robotoworks/mechanoid/net/NetLogHelper:logProperties	(Ljava/lang/String;Ljava/util/Map;)V
    //   147: aload 4
    //   149: invokevirtual 215	java/net/HttpURLConnection:connect	()V
    //   152: new 217	com/robotoworks/mechanoid/net/HttpUrlConnectionResponse
    //   155: astore_1
    //   156: aload_1
    //   157: aload 4
    //   159: aload_2
    //   160: invokespecial 220	com/robotoworks/mechanoid/net/HttpUrlConnectionResponse:<init>	(Ljava/net/HttpURLConnection;Lcom/robotoworks/mechanoid/net/Parser;)V
    //   163: aload_0
    //   164: invokevirtual 167	com/robotoworks/mechanoid/net/ServiceClient:isDebug	()Z
    //   167: ifeq +30 -> 197
    //   170: aload_0
    //   171: invokevirtual 170	com/robotoworks/mechanoid/net/ServiceClient:getLogTag	()Ljava/lang/String;
    //   174: aload_1
    //   175: invokeinterface 224 1 0
    //   180: invokestatic 212	com/robotoworks/mechanoid/net/NetLogHelper:logProperties	(Ljava/lang/String;Ljava/util/Map;)V
    //   183: aload_0
    //   184: invokevirtual 170	com/robotoworks/mechanoid/net/ServiceClient:getLogTag	()Ljava/lang/String;
    //   187: aload_1
    //   188: invokeinterface 227 1 0
    //   193: invokestatic 178	android/util/Log:d	(Ljava/lang/String;Ljava/lang/String;)I
    //   196: pop
    //   197: goto -154 -> 43
    //   200: astore_1
    //   201: new 158	com/robotoworks/mechanoid/net/ServiceException
    //   204: dup
    //   205: aload_1
    //   206: invokespecial 230	com/robotoworks/mechanoid/net/ServiceException:<init>	(Ljava/lang/Throwable;)V
    //   209: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	210	0	this	ServiceClient
    //   0	210	1	paramREQUEST	REQUEST
    //   0	210	2	paramParser	Parser<RESULT>
    //   5	88	3	localURL	URL
    //   13	145	4	localObject	Object
    //   56	13	5	str	String
    // Exception table:
    //   from	to	target	type
    //   0	15	200	java/lang/Exception
    //   23	40	200	java/lang/Exception
    //   45	91	200	java/lang/Exception
    //   91	147	200	java/lang/Exception
    //   147	197	200	java/lang/Exception
  }
  
  protected String getBaseUrl()
  {
    return this.mBaseUrl;
  }
  
  protected LinkedHashMap<String, String> getHeaders()
  {
    return this.mHeaders;
  }
  
  protected String getLogTag()
  {
    return DEFAULT_LOG_TAG;
  }
  
  public JsonEntityReaderProvider getReaderProvider()
  {
    return this.mReaderProvider;
  }
  
  public JsonEntityWriterProvider getWriterProvider()
  {
    return this.mWriterProvider;
  }
  
  protected boolean isDebug()
  {
    return this.mDebug;
  }
  
  protected HttpURLConnection openConnection(URL paramURL)
    throws IOException
  {
    return (HttpURLConnection)paramURL.openConnection();
  }
  
  protected <REQUEST extends ServiceRequest, RESULT extends ServiceResult> Response<RESULT> post(REQUEST paramREQUEST, Parser<RESULT> paramParser)
    throws ServiceException
  {
    return postUnlessPut(paramREQUEST, paramParser, false);
  }
  
  /* Error */
  protected <REQUEST extends ServiceRequest, RESULT extends ServiceResult> Response<RESULT> postUnlessPut(REQUEST paramREQUEST, Parser<RESULT> paramParser, boolean paramBoolean)
    throws ServiceException
  {
    // Byte code:
    //   0: iload_3
    //   1: ifeq +76 -> 77
    //   4: ldc 18
    //   6: astore 4
    //   8: aload_0
    //   9: aload_1
    //   10: invokevirtual 162	com/robotoworks/mechanoid/net/ServiceClient:createUrl	(Lcom/robotoworks/mechanoid/net/ServiceRequest;)Ljava/net/URL;
    //   13: astore 5
    //   15: aload_0
    //   16: aload 5
    //   18: aload_1
    //   19: aload_2
    //   20: invokevirtual 164	com/robotoworks/mechanoid/net/ServiceClient:createMockedResponse	(Ljava/net/URL;Lcom/robotoworks/mechanoid/net/ServiceRequest;Lcom/robotoworks/mechanoid/net/Parser;)Lcom/robotoworks/mechanoid/net/Response;
    //   23: astore 6
    //   25: aload 6
    //   27: ifnull +57 -> 84
    //   30: aload 6
    //   32: astore_1
    //   33: aload_0
    //   34: invokevirtual 167	com/robotoworks/mechanoid/net/ServiceClient:isDebug	()Z
    //   37: ifeq +38 -> 75
    //   40: aload_0
    //   41: invokevirtual 170	com/robotoworks/mechanoid/net/ServiceClient:getLogTag	()Ljava/lang/String;
    //   44: astore_2
    //   45: new 180	java/lang/StringBuilder
    //   48: astore_1
    //   49: aload_1
    //   50: invokespecial 181	java/lang/StringBuilder:<init>	()V
    //   53: aload_2
    //   54: aload_1
    //   55: aload 4
    //   57: invokevirtual 187	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   60: ldc -2
    //   62: invokevirtual 187	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   65: invokevirtual 191	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   68: invokestatic 178	android/util/Log:d	(Ljava/lang/String;Ljava/lang/String;)I
    //   71: pop
    //   72: aload 6
    //   74: astore_1
    //   75: aload_1
    //   76: areturn
    //   77: ldc 15
    //   79: astore 4
    //   81: goto -73 -> 8
    //   84: aload_0
    //   85: invokevirtual 167	com/robotoworks/mechanoid/net/ServiceClient:isDebug	()Z
    //   88: ifeq +49 -> 137
    //   91: aload_0
    //   92: invokevirtual 170	com/robotoworks/mechanoid/net/ServiceClient:getLogTag	()Ljava/lang/String;
    //   95: astore 6
    //   97: new 180	java/lang/StringBuilder
    //   100: astore 7
    //   102: aload 7
    //   104: invokespecial 181	java/lang/StringBuilder:<init>	()V
    //   107: aload 6
    //   109: aload 7
    //   111: aload 4
    //   113: invokevirtual 187	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   116: ldc_w 256
    //   119: invokevirtual 187	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   122: aload 5
    //   124: invokevirtual 190	java/net/URL:toString	()Ljava/lang/String;
    //   127: invokevirtual 187	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   130: invokevirtual 191	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   133: invokestatic 178	android/util/Log:d	(Ljava/lang/String;Ljava/lang/String;)I
    //   136: pop
    //   137: aload_0
    //   138: aload 5
    //   140: invokevirtual 195	com/robotoworks/mechanoid/net/ServiceClient:openConnection	(Ljava/net/URL;)Ljava/net/HttpURLConnection;
    //   143: astore 6
    //   145: aload_0
    //   146: aload_1
    //   147: aload 6
    //   149: invokevirtual 197	com/robotoworks/mechanoid/net/ServiceClient:applyRequestTimeouts	(Lcom/robotoworks/mechanoid/net/ServiceRequest;Ljava/net/HttpURLConnection;)V
    //   152: aload 6
    //   154: iconst_1
    //   155: invokevirtual 260	java/net/HttpURLConnection:setDoOutput	(Z)V
    //   158: aload 6
    //   160: aload 4
    //   162: invokevirtual 200	java/net/HttpURLConnection:setRequestMethod	(Ljava/lang/String;)V
    //   165: aload 6
    //   167: ldc_w 262
    //   170: ldc -17
    //   172: invokevirtual 109	java/net/HttpURLConnection:setRequestProperty	(Ljava/lang/String;Ljava/lang/String;)V
    //   175: aload_0
    //   176: aload_1
    //   177: aload 6
    //   179: invokevirtual 202	com/robotoworks/mechanoid/net/ServiceClient:applyRequestProperties	(Lcom/robotoworks/mechanoid/net/ServiceRequest;Ljava/net/HttpURLConnection;)V
    //   182: aload_0
    //   183: invokevirtual 167	com/robotoworks/mechanoid/net/ServiceClient:isDebug	()Z
    //   186: ifeq +15 -> 201
    //   189: aload_0
    //   190: invokevirtual 170	com/robotoworks/mechanoid/net/ServiceClient:getLogTag	()Ljava/lang/String;
    //   193: aload 6
    //   195: invokevirtual 206	java/net/HttpURLConnection:getRequestProperties	()Ljava/util/Map;
    //   198: invokestatic 212	com/robotoworks/mechanoid/net/NetLogHelper:logProperties	(Ljava/lang/String;Ljava/util/Map;)V
    //   201: aload 6
    //   203: invokevirtual 215	java/net/HttpURLConnection:connect	()V
    //   206: aload_1
    //   207: instanceof 264
    //   210: ifeq +80 -> 290
    //   213: aload_1
    //   214: checkcast 264	com/robotoworks/mechanoid/net/EntityEnclosedServiceRequest
    //   217: astore_1
    //   218: aload_0
    //   219: invokevirtual 167	com/robotoworks/mechanoid/net/ServiceClient:isDebug	()Z
    //   222: ifeq +55 -> 277
    //   225: new 266	java/io/ByteArrayOutputStream
    //   228: astore 5
    //   230: aload 5
    //   232: invokespecial 267	java/io/ByteArrayOutputStream:<init>	()V
    //   235: aload_1
    //   236: aload_0
    //   237: getfield 71	com/robotoworks/mechanoid/net/ServiceClient:mWriterProvider	Lcom/robotoworks/mechanoid/net/JsonEntityWriterProvider;
    //   240: aload 5
    //   242: invokevirtual 271	com/robotoworks/mechanoid/net/EntityEnclosedServiceRequest:writeBody	(Lcom/robotoworks/mechanoid/net/JsonEntityWriterProvider;Ljava/io/OutputStream;)V
    //   245: aload_0
    //   246: invokevirtual 170	com/robotoworks/mechanoid/net/ServiceClient:getLogTag	()Ljava/lang/String;
    //   249: astore 7
    //   251: new 99	java/lang/String
    //   254: astore 4
    //   256: aload 4
    //   258: aload 5
    //   260: invokevirtual 275	java/io/ByteArrayOutputStream:toByteArray	()[B
    //   263: ldc_w 277
    //   266: invokespecial 280	java/lang/String:<init>	([BLjava/lang/String;)V
    //   269: aload 7
    //   271: aload 4
    //   273: invokestatic 178	android/util/Log:d	(Ljava/lang/String;Ljava/lang/String;)I
    //   276: pop
    //   277: aload_1
    //   278: aload_0
    //   279: getfield 71	com/robotoworks/mechanoid/net/ServiceClient:mWriterProvider	Lcom/robotoworks/mechanoid/net/JsonEntityWriterProvider;
    //   282: aload 6
    //   284: invokevirtual 284	java/net/HttpURLConnection:getOutputStream	()Ljava/io/OutputStream;
    //   287: invokevirtual 271	com/robotoworks/mechanoid/net/EntityEnclosedServiceRequest:writeBody	(Lcom/robotoworks/mechanoid/net/JsonEntityWriterProvider;Ljava/io/OutputStream;)V
    //   290: new 217	com/robotoworks/mechanoid/net/HttpUrlConnectionResponse
    //   293: astore_1
    //   294: aload_1
    //   295: aload 6
    //   297: aload_2
    //   298: invokespecial 220	com/robotoworks/mechanoid/net/HttpUrlConnectionResponse:<init>	(Ljava/net/HttpURLConnection;Lcom/robotoworks/mechanoid/net/Parser;)V
    //   301: aload_0
    //   302: invokevirtual 167	com/robotoworks/mechanoid/net/ServiceClient:isDebug	()Z
    //   305: ifeq +30 -> 335
    //   308: aload_0
    //   309: invokevirtual 170	com/robotoworks/mechanoid/net/ServiceClient:getLogTag	()Ljava/lang/String;
    //   312: aload_1
    //   313: invokeinterface 224 1 0
    //   318: invokestatic 212	com/robotoworks/mechanoid/net/NetLogHelper:logProperties	(Ljava/lang/String;Ljava/util/Map;)V
    //   321: aload_0
    //   322: invokevirtual 170	com/robotoworks/mechanoid/net/ServiceClient:getLogTag	()Ljava/lang/String;
    //   325: aload_1
    //   326: invokeinterface 227 1 0
    //   331: invokestatic 178	android/util/Log:d	(Ljava/lang/String;Ljava/lang/String;)I
    //   334: pop
    //   335: goto -260 -> 75
    //   338: astore_1
    //   339: new 158	com/robotoworks/mechanoid/net/ServiceException
    //   342: dup
    //   343: aload_1
    //   344: invokespecial 230	com/robotoworks/mechanoid/net/ServiceException:<init>	(Ljava/lang/Throwable;)V
    //   347: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	348	0	this	ServiceClient
    //   0	348	1	paramREQUEST	REQUEST
    //   0	348	2	paramParser	Parser<RESULT>
    //   0	348	3	paramBoolean	boolean
    //   6	266	4	str	String
    //   13	246	5	localObject1	Object
    //   23	273	6	localObject2	Object
    //   100	170	7	localObject3	Object
    // Exception table:
    //   from	to	target	type
    //   8	25	338	java/lang/Exception
    //   33	72	338	java/lang/Exception
    //   84	137	338	java/lang/Exception
    //   137	201	338	java/lang/Exception
    //   201	277	338	java/lang/Exception
    //   277	290	338	java/lang/Exception
    //   290	335	338	java/lang/Exception
  }
  
  protected <REQUEST extends ServiceRequest, RESULT extends ServiceResult> Response<RESULT> put(REQUEST paramREQUEST, Parser<RESULT> paramParser)
    throws ServiceException
  {
    return postUnlessPut(paramREQUEST, paramParser, true);
  }
  
  public void setHeader(String paramString1, String paramString2)
  {
    getHeaders().put(paramString1, paramString2);
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/robotoworks/mechanoid/net/ServiceClient.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */