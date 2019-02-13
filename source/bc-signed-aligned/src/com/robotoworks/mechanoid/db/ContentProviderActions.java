package com.robotoworks.mechanoid.db;

import android.content.ContentValues;
import android.database.Cursor;
import android.net.Uri;
import java.util.List;
import java.util.Map;

public class ContentProviderActions
{
  public int bulkInsert(MechanoidContentProvider paramMechanoidContentProvider, Uri paramUri, ContentValues[] paramArrayOfContentValues)
  {
    int i = paramArrayOfContentValues.length;
    for (int j = 0; j < i; j++) {
      insert(paramMechanoidContentProvider, paramUri, paramArrayOfContentValues[j]);
    }
    return i;
  }
  
  public int delete(MechanoidContentProvider paramMechanoidContentProvider, Uri paramUri, String paramString, String[] paramArrayOfString)
  {
    return -1;
  }
  
  public Uri insert(MechanoidContentProvider paramMechanoidContentProvider, Uri paramUri, ContentValues paramContentValues)
  {
    return null;
  }
  
  public Cursor query(MechanoidContentProvider paramMechanoidContentProvider, Uri paramUri, String[] paramArrayOfString1, String paramString1, String[] paramArrayOfString2, String paramString2)
  {
    return null;
  }
  
  public <T extends ActiveRecord> Map<String, T> selectRecordMap(MechanoidContentProvider paramMechanoidContentProvider, Uri paramUri, SQuery paramSQuery, String paramString)
  {
    return null;
  }
  
  public <T extends ActiveRecord> List<T> selectRecords(MechanoidContentProvider paramMechanoidContentProvider, Uri paramUri, SQuery paramSQuery, String paramString)
  {
    return null;
  }
  
  public int update(MechanoidContentProvider paramMechanoidContentProvider, Uri paramUri, ContentValues paramContentValues, String paramString, String[] paramArrayOfString)
  {
    return -1;
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/robotoworks/mechanoid/db/ContentProviderActions.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */