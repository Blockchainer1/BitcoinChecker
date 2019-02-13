package com.robotoworks.mechanoid.db;

import android.database.Cursor;
import com.robotoworks.mechanoid.util.Closeables;

public abstract class CursorWalker
{
  protected abstract Cursor createCursor();
  
  protected abstract void step(Cursor paramCursor);
  
  public int walk()
  {
    Object localObject1 = null;
    try
    {
      Cursor localCursor = createCursor();
      for (int i = 0;; i++)
      {
        localObject1 = localCursor;
        if (i >= localCursor.getCount()) {
          break;
        }
        localObject1 = localCursor;
        localCursor.moveToNext();
        localObject1 = localCursor;
        step(localCursor);
      }
      localObject1 = localCursor;
      i = localCursor.getCount();
      Closeables.closeSilently(localCursor);
      return i;
    }
    finally
    {
      Closeables.closeSilently((Cursor)localObject1);
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/robotoworks/mechanoid/db/CursorWalker.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */