package com.robotoworks.mechanoid;

import java.lang.reflect.Field;

public class ReflectUtil
{
  public static Field getFieldSilently(Class<?> paramClass, String paramString)
  {
    try
    {
      paramClass = paramClass.getField(paramString);
      return paramClass;
    }
    catch (NoSuchFieldException paramClass)
    {
      for (;;)
      {
        paramClass = null;
      }
    }
  }
  
  public static <T> Object getFieldValueSilently(Field paramField)
  {
    Object localObject = null;
    try
    {
      paramField = paramField.get(null);
      return paramField;
    }
    catch (IllegalArgumentException paramField)
    {
      for (;;)
      {
        paramField = (Field)localObject;
      }
    }
    catch (IllegalAccessException paramField)
    {
      for (;;)
      {
        paramField = (Field)localObject;
      }
    }
  }
  
  public static Class<?> loadClassSilently(ClassLoader paramClassLoader, String paramString)
  {
    try
    {
      paramClassLoader = paramClassLoader.loadClass(paramString);
      return paramClassLoader;
    }
    catch (ClassNotFoundException paramClassLoader)
    {
      for (;;)
      {
        paramClassLoader = null;
      }
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/robotoworks/mechanoid/ReflectUtil.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */