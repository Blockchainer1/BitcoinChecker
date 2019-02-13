package com.robotoworks.mechanoid.net;

import com.robotoworks.mechanoid.util.Streams;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.util.List;
import java.util.Map;

public class HttpUrlConnectionResponse<T>
  implements Response<T>
{
  private HttpURLConnection mConn;
  private T mContent;
  private Map<String, List<String>> mHeaders;
  private byte[] mInputBytes;
  private boolean mParsed;
  private Parser<T> mParser;
  private int mResponseCode;
  
  public HttpUrlConnectionResponse(HttpURLConnection paramHttpURLConnection, Parser<T> paramParser)
    throws ServiceException
  {
    this.mConn = paramHttpURLConnection;
    this.mParser = paramParser;
    try
    {
      this.mResponseCode = paramHttpURLConnection.getResponseCode();
      this.mHeaders = paramHttpURLConnection.getHeaderFields();
      return;
    }
    catch (Exception paramHttpURLConnection)
    {
      throw new ServiceException(paramHttpURLConnection);
    }
  }
  
  private InputStream getInputStream()
    throws IOException
  {
    InputStream localInputStream = this.mConn.getErrorStream();
    if (localInputStream != null) {}
    for (;;)
    {
      return localInputStream;
      localInputStream = this.mConn.getInputStream();
    }
  }
  
  public void checkResponseCode(int paramInt)
    throws UnexpectedHttpStatusException
  {
    if (this.mResponseCode != paramInt) {
      throw new UnexpectedHttpStatusException(this.mResponseCode, 200);
    }
  }
  
  public void checkResponseCodeOk()
    throws UnexpectedHttpStatusException
  {
    if (this.mResponseCode != 200) {
      throw new UnexpectedHttpStatusException(this.mResponseCode, 200);
    }
  }
  
  public Map<String, List<String>> getHeaders()
  {
    return this.mHeaders;
  }
  
  public int getResponseCode()
  {
    return this.mResponseCode;
  }
  
  /* Error */
  public T parse()
    throws ServiceException
  {
    // Byte code:
    //   0: aload_0
    //   1: getfield 81	com/robotoworks/mechanoid/net/HttpUrlConnectionResponse:mParsed	Z
    //   4: ifeq +10 -> 14
    //   7: aload_0
    //   8: getfield 83	com/robotoworks/mechanoid/net/HttpUrlConnectionResponse:mContent	Ljava/lang/Object;
    //   11: astore_1
    //   12: aload_1
    //   13: areturn
    //   14: aconst_null
    //   15: astore_1
    //   16: aload_0
    //   17: getfield 85	com/robotoworks/mechanoid/net/HttpUrlConnectionResponse:mInputBytes	[B
    //   20: ifnonnull +39 -> 59
    //   23: aload_0
    //   24: invokespecial 86	com/robotoworks/mechanoid/net/HttpUrlConnectionResponse:getInputStream	()Ljava/io/InputStream;
    //   27: astore_1
    //   28: aload_1
    //   29: ifnull +17 -> 46
    //   32: aload_0
    //   33: aload_0
    //   34: getfield 37	com/robotoworks/mechanoid/net/HttpUrlConnectionResponse:mParser	Lcom/robotoworks/mechanoid/net/Parser;
    //   37: aload_1
    //   38: invokeinterface 91 2 0
    //   43: putfield 83	com/robotoworks/mechanoid/net/HttpUrlConnectionResponse:mContent	Ljava/lang/Object;
    //   46: aload_0
    //   47: iconst_1
    //   48: putfield 81	com/robotoworks/mechanoid/net/HttpUrlConnectionResponse:mParsed	Z
    //   51: aload_0
    //   52: getfield 83	com/robotoworks/mechanoid/net/HttpUrlConnectionResponse:mContent	Ljava/lang/Object;
    //   55: astore_1
    //   56: goto -44 -> 12
    //   59: aload_0
    //   60: getfield 85	com/robotoworks/mechanoid/net/HttpUrlConnectionResponse:mInputBytes	[B
    //   63: arraylength
    //   64: ifle -36 -> 28
    //   67: new 93	java/io/ByteArrayInputStream
    //   70: dup
    //   71: aload_0
    //   72: getfield 85	com/robotoworks/mechanoid/net/HttpUrlConnectionResponse:mInputBytes	[B
    //   75: invokespecial 96	java/io/ByteArrayInputStream:<init>	([B)V
    //   78: astore_1
    //   79: goto -51 -> 28
    //   82: astore_1
    //   83: new 28	com/robotoworks/mechanoid/net/ServiceException
    //   86: dup
    //   87: aload_1
    //   88: invokespecial 54	com/robotoworks/mechanoid/net/ServiceException:<init>	(Ljava/lang/Throwable;)V
    //   91: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	92	0	this	HttpUrlConnectionResponse
    //   11	68	1	localObject	Object
    //   82	6	1	localException	Exception
    // Exception table:
    //   from	to	target	type
    //   16	28	82	java/lang/Exception
    //   32	46	82	java/lang/Exception
    //   59	79	82	java/lang/Exception
  }
  
  public String readAsText()
    throws IOException
  {
    if (this.mInputBytes == null) {
      if (getInputStream() != null) {
        break label36;
      }
    }
    label36:
    for (this.mInputBytes = new byte[0];; this.mInputBytes = Streams.readAllBytes(getInputStream())) {
      return Streams.readAllText(new ByteArrayInputStream(this.mInputBytes));
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/robotoworks/mechanoid/net/HttpUrlConnectionResponse.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */