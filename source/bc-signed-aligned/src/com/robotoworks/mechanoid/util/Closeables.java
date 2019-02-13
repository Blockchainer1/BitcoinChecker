package com.robotoworks.mechanoid.util;

import android.database.Cursor;
import java.io.Closeable;
import java.io.IOException;

public final class Closeables
{
  public static void closeSilently(Cursor paramCursor)
  {
    if (paramCursor == null) {}
    for (;;)
    {
      return;
      paramCursor.close();
    }
  }
  
  public static void closeSilently(Closeable paramCloseable)
  {
    if (paramCloseable == null) {}
    for (;;)
    {
      return;
      try
      {
        paramCloseable.close();
      }
      catch (IOException paramCloseable)
      {
        paramCloseable.printStackTrace();
      }
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/robotoworks/mechanoid/util/Closeables.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */