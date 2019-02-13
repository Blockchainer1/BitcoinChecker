package com.robotoworks.mechanoid.net;

import java.util.LinkedHashMap;
import java.util.Set;

public abstract class ServiceRequest
{
  private int mConnectTimeout = -1;
  private LinkedHashMap<String, String> mHeaders = new LinkedHashMap();
  private int mReadTimeout = -1;
  
  public abstract String createUrl(String paramString);
  
  public int getConnectTimeout()
  {
    return this.mConnectTimeout;
  }
  
  public Set<String> getHeaderKeys()
  {
    return this.mHeaders.keySet();
  }
  
  public String getHeaderValue(String paramString)
  {
    return (String)this.mHeaders.get(paramString);
  }
  
  public int getReadTimeout()
  {
    return this.mReadTimeout;
  }
  
  public void setConnectTimeout(int paramInt)
  {
    this.mConnectTimeout = paramInt;
  }
  
  public void setHeader(String paramString1, String paramString2)
  {
    this.mHeaders.put(paramString1, paramString2);
  }
  
  public void setReadTimeout(int paramInt)
  {
    this.mReadTimeout = paramInt;
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/robotoworks/mechanoid/net/ServiceRequest.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */