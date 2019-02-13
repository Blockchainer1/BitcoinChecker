package com.android.volley;

import java.util.Collections;
import java.util.Map;

public abstract interface Cache
{
  public abstract void clear();
  
  public abstract Entry get(String paramString);
  
  public abstract void initialize();
  
  public abstract void invalidate(String paramString, boolean paramBoolean);
  
  public abstract void put(String paramString, Entry paramEntry);
  
  public abstract void remove(String paramString);
  
  public static class Entry
  {
    public byte[] data;
    public String etag;
    public Map<String, String> responseHeaders = Collections.emptyMap();
    public long serverDate;
    public long softTtl;
    public long ttl;
    
    public boolean isExpired()
    {
      if (this.ttl < System.currentTimeMillis()) {}
      for (boolean bool = true;; bool = false) {
        return bool;
      }
    }
    
    public boolean refreshNeeded()
    {
      if (this.softTtl < System.currentTimeMillis()) {}
      for (boolean bool = true;; bool = false) {
        return bool;
      }
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/android/volley/Cache.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */