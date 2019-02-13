package com.robotoworks.mechanoid.net;

import com.robotoworks.mechanoid.internal.util.JsonReader;
import java.io.IOException;
import java.util.List;

public abstract class JsonEntityReader<T>
{
  private JsonEntityReaderProvider mProvider;
  
  public JsonEntityReader(JsonEntityReaderProvider paramJsonEntityReaderProvider)
  {
    this.mProvider = paramJsonEntityReaderProvider;
  }
  
  public JsonEntityReaderProvider getProvider()
  {
    return this.mProvider;
  }
  
  public abstract void read(JsonReader paramJsonReader, T paramT)
    throws IOException;
  
  public abstract void readList(JsonReader paramJsonReader, List<T> paramList)
    throws IOException;
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/robotoworks/mechanoid/net/JsonEntityReader.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */