package com.robotoworks.mechanoid.db;

import android.content.ContentUris;
import android.content.ContentValues;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.net.Uri;
import android.text.TextUtils;
import com.robotoworks.mechanoid.util.Closeables;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DefaultContentProviderActions
  extends ContentProviderActions
{
  private boolean mForUrisWithId;
  private ActiveRecordFactory<?> mRecordFactory;
  private String mSource;
  
  public DefaultContentProviderActions(String paramString, boolean paramBoolean)
  {
    this(paramString, paramBoolean, null);
  }
  
  public <T extends ActiveRecord> DefaultContentProviderActions(String paramString, boolean paramBoolean, ActiveRecordFactory<T> paramActiveRecordFactory)
  {
    this.mSource = paramString;
    this.mForUrisWithId = paramBoolean;
    this.mRecordFactory = paramActiveRecordFactory;
  }
  
  public int bulkInsert(MechanoidContentProvider paramMechanoidContentProvider, Uri paramUri, ContentValues[] paramArrayOfContentValues)
  {
    paramMechanoidContentProvider = paramMechanoidContentProvider.getOpenHelper().getWritableDatabase();
    int i = paramArrayOfContentValues.length;
    try
    {
      paramMechanoidContentProvider.beginTransaction();
      for (int j = 0; j < i; j++) {
        paramMechanoidContentProvider.insertOrThrow(this.mSource, null, paramArrayOfContentValues[j]);
      }
      paramMechanoidContentProvider.setTransactionSuccessful();
      return i;
    }
    finally
    {
      paramMechanoidContentProvider.endTransaction();
    }
  }
  
  public int delete(MechanoidContentProvider paramMechanoidContentProvider, Uri paramUri, String paramString, String[] paramArrayOfString)
  {
    paramMechanoidContentProvider = paramMechanoidContentProvider.getOpenHelper().getWritableDatabase();
    long l;
    if (this.mForUrisWithId) {
      l = ContentUris.parseId(paramUri);
    }
    for (int i = SQuery.newQuery().expr("_id", " = ", l).append(paramString, paramArrayOfString).delete(paramMechanoidContentProvider, this.mSource);; i = paramMechanoidContentProvider.delete(this.mSource, paramString, paramArrayOfString)) {
      return i;
    }
  }
  
  public Uri insert(MechanoidContentProvider paramMechanoidContentProvider, Uri paramUri, ContentValues paramContentValues)
  {
    Object localObject = null;
    if (this.mForUrisWithId) {
      paramMechanoidContentProvider = (MechanoidContentProvider)localObject;
    }
    for (;;)
    {
      return paramMechanoidContentProvider;
      long l = paramMechanoidContentProvider.getOpenHelper().getWritableDatabase().insertOrThrow(this.mSource, null, paramContentValues);
      paramMechanoidContentProvider = (MechanoidContentProvider)localObject;
      if (l > -1L) {
        paramMechanoidContentProvider = ContentUris.withAppendedId(paramUri, l);
      }
    }
  }
  
  public Cursor query(MechanoidContentProvider paramMechanoidContentProvider, Uri paramUri, String[] paramArrayOfString1, String paramString1, String[] paramArrayOfString2, String paramString2)
  {
    SQLiteDatabase localSQLiteDatabase = paramMechanoidContentProvider.getOpenHelper().getWritableDatabase();
    paramMechanoidContentProvider = paramUri.getQueryParameter("mechdb_group_by");
    if (this.mForUrisWithId)
    {
      long l = ContentUris.parseId(paramUri);
      paramString1 = SQuery.newQuery().expr("_id", " = ", l).append(paramString1, paramArrayOfString2);
      paramUri = this.mSource;
      if (TextUtils.isEmpty(paramMechanoidContentProvider)) {
        paramMechanoidContentProvider = null;
      }
      for (;;)
      {
        paramMechanoidContentProvider = paramString1.query(localSQLiteDatabase, paramUri, paramArrayOfString1, paramString2, paramMechanoidContentProvider);
        return paramMechanoidContentProvider;
      }
    }
    paramUri = this.mSource;
    if (TextUtils.isEmpty(paramMechanoidContentProvider)) {
      paramMechanoidContentProvider = null;
    }
    for (;;)
    {
      paramMechanoidContentProvider = localSQLiteDatabase.query(paramUri, paramArrayOfString1, paramString1, paramArrayOfString2, paramMechanoidContentProvider, null, paramString2);
      break;
    }
  }
  
  public <T extends ActiveRecord> Map<String, T> selectRecordMap(MechanoidContentProvider paramMechanoidContentProvider, Uri paramUri, SQuery paramSQuery, String paramString)
  {
    if (this.mRecordFactory == null) {}
    HashMap localHashMap;
    for (paramMechanoidContentProvider = null;; paramMechanoidContentProvider = localHashMap)
    {
      return paramMechanoidContentProvider;
      paramUri = paramUri.getQueryParameter("mechdb_group_by");
      SQLiteDatabase localSQLiteDatabase = paramMechanoidContentProvider.getOpenHelper().getWritableDatabase();
      Object localObject = null;
      localHashMap = new HashMap();
      paramMechanoidContentProvider = (MechanoidContentProvider)localObject;
      try
      {
        String str1 = this.mSource;
        paramMechanoidContentProvider = (MechanoidContentProvider)localObject;
        String[] arrayOfString = this.mRecordFactory.getProjection();
        paramMechanoidContentProvider = (MechanoidContentProvider)localObject;
        String str2 = paramSQuery.toString();
        paramMechanoidContentProvider = (MechanoidContentProvider)localObject;
        paramSQuery = paramSQuery.getArgsArray();
        paramMechanoidContentProvider = (MechanoidContentProvider)localObject;
        if (TextUtils.isEmpty(paramUri)) {
          paramUri = null;
        }
        for (;;)
        {
          paramMechanoidContentProvider = (MechanoidContentProvider)localObject;
          paramUri = localSQLiteDatabase.query(str1, arrayOfString, str2, paramSQuery, paramUri, null, null);
          paramMechanoidContentProvider = paramUri;
          int i = paramUri.getColumnIndexOrThrow(paramString);
          for (;;)
          {
            paramMechanoidContentProvider = paramUri;
            if (!paramUri.moveToNext()) {
              break;
            }
            paramMechanoidContentProvider = paramUri;
            localHashMap.put(paramUri.getString(i), this.mRecordFactory.create(paramUri));
          }
        }
      }
      finally
      {
        Closeables.closeSilently(paramMechanoidContentProvider);
      }
      Closeables.closeSilently(paramUri);
    }
  }
  
  public <T extends ActiveRecord> List<T> selectRecords(MechanoidContentProvider paramMechanoidContentProvider, Uri paramUri, SQuery paramSQuery, String paramString)
  {
    Object localObject1 = null;
    if (this.mRecordFactory == null) {}
    ArrayList localArrayList;
    for (paramMechanoidContentProvider = null;; paramMechanoidContentProvider = localArrayList)
    {
      return paramMechanoidContentProvider;
      paramUri = paramUri.getQueryParameter("mechdb_group_by");
      SQLiteDatabase localSQLiteDatabase = paramMechanoidContentProvider.getOpenHelper().getWritableDatabase();
      Object localObject2 = null;
      localArrayList = new ArrayList();
      paramMechanoidContentProvider = (MechanoidContentProvider)localObject2;
      try
      {
        String str1 = this.mSource;
        paramMechanoidContentProvider = (MechanoidContentProvider)localObject2;
        String[] arrayOfString = this.mRecordFactory.getProjection();
        paramMechanoidContentProvider = (MechanoidContentProvider)localObject2;
        String str2 = paramSQuery.toString();
        paramMechanoidContentProvider = (MechanoidContentProvider)localObject2;
        paramSQuery = paramSQuery.getArgsArray();
        paramMechanoidContentProvider = (MechanoidContentProvider)localObject2;
        if (TextUtils.isEmpty(paramUri)) {
          paramUri = (Uri)localObject1;
        }
        for (;;)
        {
          paramMechanoidContentProvider = (MechanoidContentProvider)localObject2;
          paramUri = localSQLiteDatabase.query(str1, arrayOfString, str2, paramSQuery, paramUri, null, paramString);
          for (;;)
          {
            paramMechanoidContentProvider = paramUri;
            if (!paramUri.moveToNext()) {
              break;
            }
            paramMechanoidContentProvider = paramUri;
            localArrayList.add(this.mRecordFactory.create(paramUri));
          }
        }
      }
      finally
      {
        Closeables.closeSilently(paramMechanoidContentProvider);
      }
      Closeables.closeSilently(paramUri);
    }
  }
  
  public int update(MechanoidContentProvider paramMechanoidContentProvider, Uri paramUri, ContentValues paramContentValues, String paramString, String[] paramArrayOfString)
  {
    paramMechanoidContentProvider = paramMechanoidContentProvider.getOpenHelper().getWritableDatabase();
    long l;
    if (this.mForUrisWithId) {
      l = ContentUris.parseId(paramUri);
    }
    for (int i = SQuery.newQuery().expr("_id", " = ", l).append(paramString, paramArrayOfString).update(paramMechanoidContentProvider, this.mSource, paramContentValues);; i = paramMechanoidContentProvider.update(this.mSource, paramContentValues, paramString, paramArrayOfString)) {
      return i;
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/robotoworks/mechanoid/db/DefaultContentProviderActions.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */