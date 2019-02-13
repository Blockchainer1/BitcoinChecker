package com.robotoworks.mechanoid.db;

import android.content.ContentResolver;
import android.content.ContentValues;
import android.net.Uri;
import com.robotoworks.mechanoid.Mechanoid;
import java.util.List;

public abstract class BulkInsertHelper<T>
{
  protected abstract ContentValues createValues(T paramT);
  
  public int insert(Uri paramUri, List<T> paramList)
  {
    ContentResolver localContentResolver = Mechanoid.getContentResolver();
    if ((paramList == null) || (paramList.size() == 0)) {}
    ContentValues[] arrayOfContentValues;
    for (int i = 0;; i = localContentResolver.bulkInsert(paramUri, arrayOfContentValues))
    {
      return i;
      arrayOfContentValues = new ContentValues[paramList.size()];
      for (i = 0; i < arrayOfContentValues.length; i++) {
        arrayOfContentValues[i] = createValues(paramList.get(i));
      }
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/robotoworks/mechanoid/db/BulkInsertHelper.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */