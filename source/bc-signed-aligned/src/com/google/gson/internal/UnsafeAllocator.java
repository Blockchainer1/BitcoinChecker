package com.google.gson.internal;

import java.io.ObjectInputStream;
import java.io.ObjectStreamClass;
import java.lang.reflect.Field;
import java.lang.reflect.Method;

public abstract class UnsafeAllocator
{
  public static UnsafeAllocator create()
  {
    try
    {
      Object localObject1 = Class.forName("sun.misc.Unsafe");
      localObject3 = ((Class)localObject1).getDeclaredField("theUnsafe");
      ((Field)localObject3).setAccessible(true);
      localObject3 = ((Field)localObject3).get(null);
      Method localMethod = ((Class)localObject1).getMethod("allocateInstance", new Class[] { Class.class });
      localObject1 = new com/google/gson/internal/UnsafeAllocator$1;
      ((1)localObject1).<init>(localMethod, localObject3);
      return (UnsafeAllocator)localObject1;
    }
    catch (Exception localException1)
    {
      for (;;)
      {
        try
        {
          localObject3 = ObjectInputStream.class.getDeclaredMethod("newInstance", new Class[] { Class.class, Class.class });
          ((Method)localObject3).setAccessible(true);
          UnsafeAllocator local2 = new com/google/gson/internal/UnsafeAllocator$2;
          local2.<init>((Method)localObject3);
        }
        catch (Exception localException2)
        {
          try
          {
            Object localObject2 = ObjectStreamClass.class.getDeclaredMethod("getConstructorId", new Class[] { Class.class });
            ((Method)localObject2).setAccessible(true);
            int i = ((Integer)((Method)localObject2).invoke(null, new Object[] { Object.class })).intValue();
            Object localObject3 = ObjectStreamClass.class.getDeclaredMethod("newInstance", new Class[] { Class.class, Integer.TYPE });
            ((Method)localObject3).setAccessible(true);
            localObject2 = new com/google/gson/internal/UnsafeAllocator$3;
            ((3)localObject2).<init>((Method)localObject3, i);
          }
          catch (Exception localException3)
          {
            UnsafeAllocator local4 = new UnsafeAllocator()
            {
              public <T> T newInstance(Class<T> paramAnonymousClass)
              {
                throw new UnsupportedOperationException("Cannot allocate " + paramAnonymousClass);
              }
            };
          }
        }
      }
    }
  }
  
  public abstract <T> T newInstance(Class<T> paramClass)
    throws Exception;
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/google/gson/internal/UnsafeAllocator.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */