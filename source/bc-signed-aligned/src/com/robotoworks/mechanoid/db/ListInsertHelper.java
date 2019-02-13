package com.robotoworks.mechanoid.db;

import android.content.ContentResolver;
import android.content.ContentValues;
import android.net.Uri;
import com.robotoworks.mechanoid.Mechanoid;
import java.util.List;

public abstract class ListInsertHelper<T>
{
  protected abstract ContentValues createValues(T paramT);
  
  public void insert(Uri paramUri, List<T> paramList)
  {
    ContentResolver localContentResolver = Mechanoid.getContentResolver();
    if ((paramList == null) || (paramList.size() == 0)) {}
    for (;;)
    {
      return;
      for (int i = 0; i < paramList.size(); i++)
      {
        Object localObject = paramList.get(i);
        ContentValues localContentValues = createValues(localObject);
        if (onBeforeInsert(localContentResolver, localObject)) {
          onAfterInsert(localContentResolver.insert(paramUri, localContentValues), localObject);
        }
      }
    }
  }
  
  protected void onAfterInsert(Uri paramUri, T paramT) {}
  
  protected boolean onBeforeInsert(ContentResolver paramContentResolver, T paramT)
  {
    return true;
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/robotoworks/mechanoid/db/ListInsertHelper.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */