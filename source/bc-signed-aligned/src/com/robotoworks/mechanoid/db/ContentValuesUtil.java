package com.robotoworks.mechanoid.db;

import android.content.ContentValues;
import java.util.Map;

public class ContentValuesUtil
{
  public static void putMapped(String paramString, Map<String, String> paramMap, ContentValues paramContentValues, byte paramByte)
  {
    if ((paramMap == null) || (!paramMap.containsKey(paramString))) {
      paramContentValues.put(paramString, Byte.valueOf(paramByte));
    }
    paramString = (String)paramMap.get(paramString);
    if (paramString != null) {
      paramContentValues.put(paramString, Byte.valueOf(paramByte));
    }
  }
  
  public static void putMapped(String paramString, Map<String, String> paramMap, ContentValues paramContentValues, double paramDouble)
  {
    if ((paramMap == null) || (!paramMap.containsKey(paramString))) {
      paramContentValues.put(paramString, Double.valueOf(paramDouble));
    }
    paramString = (String)paramMap.get(paramString);
    if (paramString != null) {
      paramContentValues.put(paramString, Double.valueOf(paramDouble));
    }
  }
  
  public static void putMapped(String paramString, Map<String, String> paramMap, ContentValues paramContentValues, float paramFloat)
  {
    if ((paramMap == null) || (!paramMap.containsKey(paramString))) {
      paramContentValues.put(paramString, Float.valueOf(paramFloat));
    }
    paramString = (String)paramMap.get(paramString);
    if (paramString != null) {
      paramContentValues.put(paramString, Float.valueOf(paramFloat));
    }
  }
  
  public static void putMapped(String paramString, Map<String, String> paramMap, ContentValues paramContentValues, int paramInt)
  {
    if ((paramMap == null) || (!paramMap.containsKey(paramString))) {
      paramContentValues.put(paramString, Integer.valueOf(paramInt));
    }
    paramString = (String)paramMap.get(paramString);
    if (paramString != null) {
      paramContentValues.put(paramString, Integer.valueOf(paramInt));
    }
  }
  
  public static void putMapped(String paramString, Map<String, String> paramMap, ContentValues paramContentValues, long paramLong)
  {
    if ((paramMap == null) || (!paramMap.containsKey(paramString))) {
      paramContentValues.put(paramString, Long.valueOf(paramLong));
    }
    paramString = (String)paramMap.get(paramString);
    if (paramString != null) {
      paramContentValues.put(paramString, Long.valueOf(paramLong));
    }
  }
  
  public static void putMapped(String paramString, Map<String, String> paramMap, ContentValues paramContentValues, Object paramObject)
  {
    if ((paramMap == null) || (!paramMap.containsKey(paramString))) {
      paramContentValues.put(paramString, paramObject.toString());
    }
    paramString = (String)paramMap.get(paramString);
    if (paramString != null) {
      paramContentValues.put(paramString, paramObject.toString());
    }
  }
  
  public static void putMapped(String paramString1, Map<String, String> paramMap, ContentValues paramContentValues, String paramString2)
  {
    if ((paramMap == null) || (!paramMap.containsKey(paramString1))) {
      paramContentValues.put(paramString1, paramString2);
    }
    paramString1 = (String)paramMap.get(paramString1);
    if (paramString1 != null) {
      paramContentValues.put(paramString1, paramString2);
    }
  }
  
  public static void putMapped(String paramString, Map<String, String> paramMap, ContentValues paramContentValues, short paramShort)
  {
    if ((paramMap == null) || (!paramMap.containsKey(paramString))) {
      paramContentValues.put(paramString, Short.valueOf(paramShort));
    }
    paramString = (String)paramMap.get(paramString);
    if (paramString != null) {
      paramContentValues.put(paramString, Short.valueOf(paramShort));
    }
  }
  
  public static void putMapped(String paramString, Map<String, String> paramMap, ContentValues paramContentValues, boolean paramBoolean)
  {
    if ((paramMap == null) || (!paramMap.containsKey(paramString))) {
      paramContentValues.put(paramString, Boolean.valueOf(paramBoolean));
    }
    paramString = (String)paramMap.get(paramString);
    if (paramString != null) {
      paramContentValues.put(paramString, Boolean.valueOf(paramBoolean));
    }
  }
  
  public static void putMapped(String paramString, Map<String, String> paramMap, ContentValues paramContentValues, byte[] paramArrayOfByte)
  {
    if ((paramMap == null) || (!paramMap.containsKey(paramString))) {
      paramContentValues.put(paramString, paramArrayOfByte);
    }
    paramString = (String)paramMap.get(paramString);
    if (paramString != null) {
      paramContentValues.put(paramString, paramArrayOfByte);
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/robotoworks/mechanoid/db/ContentValuesUtil.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */