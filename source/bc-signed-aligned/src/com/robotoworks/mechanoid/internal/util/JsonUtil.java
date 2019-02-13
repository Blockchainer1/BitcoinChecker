package com.robotoworks.mechanoid.internal.util;

import com.robotoworks.mechanoid.net.JsonReaderUtil;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class JsonUtil
{
  public static List<Boolean> readBooleanList(JsonReader paramJsonReader)
    throws IOException
  {
    ArrayList localArrayList = new ArrayList();
    paramJsonReader.beginArray();
    while (paramJsonReader.hasNext()) {
      localArrayList.add(Boolean.valueOf(JsonReaderUtil.coerceNextBoolean(paramJsonReader)));
    }
    paramJsonReader.endArray();
    return localArrayList;
  }
  
  public static List<Double> readDoubleList(JsonReader paramJsonReader)
    throws IOException
  {
    ArrayList localArrayList = new ArrayList();
    paramJsonReader.beginArray();
    while (paramJsonReader.hasNext()) {
      localArrayList.add(Double.valueOf(paramJsonReader.nextDouble()));
    }
    paramJsonReader.endArray();
    return localArrayList;
  }
  
  public static List<Integer> readIntegerList(JsonReader paramJsonReader)
    throws IOException
  {
    ArrayList localArrayList = new ArrayList();
    paramJsonReader.beginArray();
    while (paramJsonReader.hasNext()) {
      localArrayList.add(Integer.valueOf(paramJsonReader.nextInt()));
    }
    paramJsonReader.endArray();
    return localArrayList;
  }
  
  public static List<Long> readLongList(JsonReader paramJsonReader)
    throws IOException
  {
    ArrayList localArrayList = new ArrayList();
    paramJsonReader.beginArray();
    while (paramJsonReader.hasNext()) {
      localArrayList.add(Long.valueOf(paramJsonReader.nextLong()));
    }
    paramJsonReader.endArray();
    return localArrayList;
  }
  
  public static List<String> readStringList(JsonReader paramJsonReader)
    throws IOException
  {
    ArrayList localArrayList = new ArrayList();
    paramJsonReader.beginArray();
    while (paramJsonReader.hasNext()) {
      localArrayList.add(paramJsonReader.nextString());
    }
    paramJsonReader.endArray();
    return localArrayList;
  }
  
  public static void writeBooleanList(JsonWriter paramJsonWriter, List<Boolean> paramList)
    throws IOException
  {
    paramJsonWriter.beginArray();
    paramList = paramList.iterator();
    while (paramList.hasNext()) {
      paramJsonWriter.value(((Boolean)paramList.next()).booleanValue());
    }
    paramJsonWriter.endArray();
  }
  
  public static void writeDoubleList(JsonWriter paramJsonWriter, List<Double> paramList)
    throws IOException
  {
    paramJsonWriter.beginArray();
    paramList = paramList.iterator();
    while (paramList.hasNext()) {
      paramJsonWriter.value((Double)paramList.next());
    }
    paramJsonWriter.endArray();
  }
  
  public static void writeIntegerList(JsonWriter paramJsonWriter, List<Integer> paramList)
    throws IOException
  {
    paramJsonWriter.beginArray();
    paramList = paramList.iterator();
    while (paramList.hasNext()) {
      paramJsonWriter.value((Integer)paramList.next());
    }
    paramJsonWriter.endArray();
  }
  
  public static void writeLongList(JsonWriter paramJsonWriter, List<Long> paramList)
    throws IOException
  {
    paramJsonWriter.beginArray();
    paramList = paramList.iterator();
    while (paramList.hasNext()) {
      paramJsonWriter.value((Long)paramList.next());
    }
    paramJsonWriter.endArray();
  }
  
  public static void writeStringList(JsonWriter paramJsonWriter, List<String> paramList)
    throws IOException
  {
    paramJsonWriter.beginArray();
    paramList = paramList.iterator();
    while (paramList.hasNext()) {
      paramJsonWriter.value((String)paramList.next());
    }
    paramJsonWriter.endArray();
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/robotoworks/mechanoid/internal/util/JsonUtil.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */