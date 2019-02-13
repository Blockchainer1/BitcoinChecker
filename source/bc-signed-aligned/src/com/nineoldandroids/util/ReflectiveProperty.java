package com.nineoldandroids.util;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

class ReflectiveProperty<T, V>
  extends Property<T, V>
{
  private static final String PREFIX_GET = "get";
  private static final String PREFIX_IS = "is";
  private static final String PREFIX_SET = "set";
  private Field mField;
  private Method mGetter;
  private Method mSetter;
  
  public ReflectiveProperty(Class<T> paramClass, Class<V> paramClass1, String paramString)
  {
    super(paramClass1, paramString);
    char c = Character.toUpperCase(paramString.charAt(0));
    String str1 = paramString.substring(1);
    str1 = c + str1;
    String str2 = "get" + str1;
    try
    {
      this.mGetter = paramClass.getMethod(str2, (Class[])null);
      paramString = this.mGetter.getReturnType();
      if (!typesMatch(paramClass1, paramString)) {
        throw new NoSuchPropertyException("Underlying type (" + paramString + ") " + "does not match Property type (" + paramClass1 + ")");
      }
    }
    catch (NoSuchMethodException localNoSuchMethodException3)
    {
      NoSuchPropertyException localNoSuchPropertyException;
      try
      {
        this.mGetter = paramClass.getDeclaredMethod(str2, (Class[])null);
        this.mGetter.setAccessible(true);
      }
      catch (NoSuchMethodException localNoSuchMethodException2)
      {
        for (;;)
        {
          Object localObject = "is" + str1;
          try
          {
            this.mGetter = paramClass.getMethod((String)localObject, (Class[])null);
          }
          catch (NoSuchMethodException localNoSuchMethodException4)
          {
            try
            {
              this.mGetter = paramClass.getDeclaredMethod((String)localObject, (Class[])null);
              this.mGetter.setAccessible(true);
            }
            catch (NoSuchMethodException localNoSuchMethodException1)
            {
              try
              {
                this.mField = paramClass.getField(paramString);
                localObject = this.mField.getType();
                if (typesMatch(paramClass1, (Class)localObject)) {
                  break label397;
                }
                localNoSuchPropertyException = new com/nineoldandroids/util/NoSuchPropertyException;
                paramClass = new java/lang/StringBuilder;
                paramClass.<init>();
                localNoSuchPropertyException.<init>("Underlying type (" + localObject + ") " + "does not match Property type (" + paramClass1 + ")");
                throw localNoSuchPropertyException;
              }
              catch (NoSuchFieldException paramClass)
              {
                throw new NoSuchPropertyException("No accessor method or field found for property with name " + paramString);
              }
            }
          }
        }
      }
      paramClass1 = "set" + localNoSuchPropertyException;
    }
    try
    {
      this.mSetter = paramClass.getDeclaredMethod(paramClass1, new Class[] { paramString });
      this.mSetter.setAccessible(true);
      label397:
      return;
    }
    catch (NoSuchMethodException paramClass)
    {
      for (;;) {}
    }
  }
  
  private boolean typesMatch(Class<V> paramClass, Class paramClass1)
  {
    boolean bool1 = false;
    if (paramClass1 != paramClass)
    {
      bool2 = bool1;
      if (paramClass1.isPrimitive()) {
        if (((paramClass1 != Float.TYPE) || (paramClass != Float.class)) && ((paramClass1 != Integer.TYPE) || (paramClass != Integer.class)) && ((paramClass1 != Boolean.TYPE) || (paramClass != Boolean.class)) && ((paramClass1 != Long.TYPE) || (paramClass != Long.class)) && ((paramClass1 != Double.TYPE) || (paramClass != Double.class)) && ((paramClass1 != Short.TYPE) || (paramClass != Short.class)) && ((paramClass1 != Byte.TYPE) || (paramClass != Byte.class)))
        {
          bool2 = bool1;
          if (paramClass1 != Character.TYPE) {
            break label130;
          }
          bool2 = bool1;
          if (paramClass != Character.class) {
            break label130;
          }
        }
      }
    }
    for (boolean bool2 = true;; bool2 = true) {
      label130:
      return bool2;
    }
  }
  
  public V get(T paramT)
  {
    if (this.mGetter != null) {}
    for (;;)
    {
      try
      {
        paramT = this.mGetter.invoke(paramT, (Object[])null);
        return paramT;
      }
      catch (IllegalAccessException paramT)
      {
        throw new AssertionError();
      }
      catch (InvocationTargetException paramT)
      {
        throw new RuntimeException(paramT.getCause());
      }
      if (this.mField != null) {
        try
        {
          paramT = this.mField.get(paramT);
        }
        catch (IllegalAccessException paramT)
        {
          throw new AssertionError();
        }
      }
    }
    throw new AssertionError();
  }
  
  public boolean isReadOnly()
  {
    if ((this.mSetter == null) && (this.mField == null)) {}
    for (boolean bool = true;; bool = false) {
      return bool;
    }
  }
  
  public void set(T paramT, V paramV)
  {
    if (this.mSetter != null) {}
    for (;;)
    {
      try
      {
        this.mSetter.invoke(paramT, new Object[] { paramV });
        return;
      }
      catch (IllegalAccessException paramT)
      {
        throw new AssertionError();
      }
      catch (InvocationTargetException paramT)
      {
        throw new RuntimeException(paramT.getCause());
      }
      if (this.mField != null) {
        try
        {
          this.mField.set(paramT, paramV);
        }
        catch (IllegalAccessException paramT)
        {
          throw new AssertionError();
        }
      }
    }
    throw new UnsupportedOperationException("Property " + getName() + " is read-only");
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/nineoldandroids/util/ReflectiveProperty.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */