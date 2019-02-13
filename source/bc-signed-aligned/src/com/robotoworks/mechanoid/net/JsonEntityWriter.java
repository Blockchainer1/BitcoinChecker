package com.robotoworks.mechanoid.net;

import com.robotoworks.mechanoid.internal.util.JsonWriter;
import java.io.IOException;
import java.util.List;

public abstract class JsonEntityWriter<T>
{
  private JsonEntityWriterProvider mProvider;
  
  public JsonEntityWriter(JsonEntityWriterProvider paramJsonEntityWriterProvider)
  {
    this.mProvider = paramJsonEntityWriterProvider;
  }
  
  public JsonEntityWriterProvider getProvider()
  {
    return this.mProvider;
  }
  
  public abstract void write(JsonWriter paramJsonWriter, T paramT)
    throws IOException;
  
  public abstract void writeList(JsonWriter paramJsonWriter, List<T> paramList)
    throws IOException;
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/robotoworks/mechanoid/net/JsonEntityWriter.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */