package com.robotoworks.mechanoid.db;

import android.content.ContentProvider;
import android.content.ContentProviderOperation;
import android.content.ContentProviderResult;
import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.content.OperationApplicationException;
import android.content.UriMatcher;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.net.Uri;
import android.net.Uri.Builder;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

public abstract class MechanoidContentProvider
  extends ContentProvider
{
  public static final String PARAM_GROUP_BY = "mechdb_group_by";
  public static final String PARAM_NOTIFY = "mechdb_notify";
  private String[] mContentTypes;
  private MechanoidSQLiteOpenHelper mOpenHelper;
  private UriMatcher mUriMatcher;
  
  public ContentProviderResult[] applyBatch(ArrayList<ContentProviderOperation> paramArrayList)
    throws OperationApplicationException
  {
    SQLiteDatabase localSQLiteDatabase = getOpenHelper().getWritableDatabase();
    localSQLiteDatabase.beginTransaction();
    try
    {
      int i = paramArrayList.size();
      ContentProviderResult[] arrayOfContentProviderResult = new ContentProviderResult[i];
      for (int j = 0; j < i; j++) {
        arrayOfContentProviderResult[j] = ((ContentProviderOperation)paramArrayList.get(j)).apply(this, arrayOfContentProviderResult, j);
      }
      localSQLiteDatabase.setTransactionSuccessful();
      return arrayOfContentProviderResult;
    }
    finally
    {
      localSQLiteDatabase.endTransaction();
    }
  }
  
  public int bulkInsert(Uri paramUri, ContentValues[] paramArrayOfContentValues)
  {
    int i = matchUri(paramUri);
    if (i == -1) {
      throw new UnsupportedOperationException("Unknown uri: " + paramUri);
    }
    i = createActions(i).bulkInsert(this, paramUri, paramArrayOfContentValues);
    if (i > 0) {
      tryNotifyChange(paramUri);
    }
    return i;
  }
  
  protected abstract ContentProviderActions createActions(int paramInt);
  
  protected abstract String[] createContentTypes();
  
  protected abstract MechanoidSQLiteOpenHelper createOpenHelper(Context paramContext);
  
  protected abstract UriMatcher createUriMatcher();
  
  public int delete(Uri paramUri, String paramString, String[] paramArrayOfString)
  {
    int i = matchUri(paramUri);
    if (i == -1) {
      throw new UnsupportedOperationException("Unknown uri: " + paramUri);
    }
    i = createActions(i).delete(this, paramUri, paramString, paramArrayOfString);
    if (i > 0) {
      tryNotifyChange(paramUri);
    }
    return i;
  }
  
  public MechanoidSQLiteOpenHelper getOpenHelper()
  {
    return this.mOpenHelper;
  }
  
  protected abstract Set<Uri> getRelatedUris(Uri paramUri);
  
  public String getType(Uri paramUri)
  {
    int i = matchUri(paramUri);
    if (i == -1) {
      throw new UnsupportedOperationException("Unknown uri: " + paramUri);
    }
    return this.mContentTypes[i];
  }
  
  public Uri insert(Uri paramUri, ContentValues paramContentValues)
  {
    int i = matchUri(paramUri);
    if (i == -1) {
      throw new UnsupportedOperationException("Unknown uri: " + paramUri);
    }
    paramContentValues = createActions(i).insert(this, paramUri, paramContentValues);
    if (paramContentValues != null) {
      tryNotifyChange(paramUri);
    }
    return paramContentValues;
  }
  
  protected int matchUri(Uri paramUri)
  {
    return this.mUriMatcher.match(paramUri);
  }
  
  public boolean onCreate()
  {
    Context localContext = getContext();
    this.mUriMatcher = createUriMatcher();
    this.mContentTypes = createContentTypes();
    this.mOpenHelper = createOpenHelper(localContext);
    return true;
  }
  
  public Cursor query(Uri paramUri, String[] paramArrayOfString1, String paramString1, String[] paramArrayOfString2, String paramString2)
  {
    int i = matchUri(paramUri);
    if (i == -1) {
      throw new UnsupportedOperationException("Unknown uri: " + paramUri);
    }
    paramArrayOfString1 = createActions(i).query(this, paramUri, paramArrayOfString1, paramString1, paramArrayOfString2, paramString2);
    trySetNotificationUri(paramArrayOfString1, paramUri);
    return paramArrayOfString1;
  }
  
  public <T extends ActiveRecord> Map<String, T> selectRecordMap(Uri paramUri, SQuery paramSQuery, String paramString)
  {
    int i = matchUri(paramUri);
    if (i == -1) {
      throw new UnsupportedOperationException("Unknown uri: " + paramUri);
    }
    return createActions(i).selectRecordMap(this, paramUri, paramSQuery, paramString);
  }
  
  public <T extends ActiveRecord> List<T> selectRecords(Uri paramUri, SQuery paramSQuery, String paramString)
  {
    int i = matchUri(paramUri);
    if (i == -1) {
      throw new UnsupportedOperationException("Unknown uri: " + paramUri);
    }
    return createActions(i).selectRecords(this, paramUri, paramSQuery, paramString);
  }
  
  protected void tryNotifyChange(Uri paramUri)
  {
    boolean bool = true;
    Object localObject = paramUri.getQueryParameter("mechdb_notify");
    if (localObject != null) {
      bool = Boolean.valueOf((String)localObject).booleanValue();
    }
    if (bool)
    {
      getContext().getContentResolver().notifyChange(paramUri, null);
      if (paramUri.getPathSegments().size() > 0)
      {
        paramUri = getRelatedUris(new Uri.Builder().scheme(paramUri.getScheme()).authority(paramUri.getAuthority()).appendPath((String)paramUri.getPathSegments().get(0)).build());
        if (paramUri != null)
        {
          paramUri = paramUri.iterator();
          while (paramUri.hasNext())
          {
            localObject = (Uri)paramUri.next();
            getContext().getContentResolver().notifyChange((Uri)localObject, null);
          }
        }
      }
    }
  }
  
  protected void trySetNotificationUri(Cursor paramCursor, Uri paramUri)
  {
    if (paramCursor == null) {}
    for (;;)
    {
      return;
      boolean bool = true;
      String str = paramUri.getQueryParameter("mechdb_notify");
      if (str != null) {
        bool = Boolean.valueOf(str).booleanValue();
      }
      if (bool) {
        paramCursor.setNotificationUri(getContext().getContentResolver(), paramUri);
      }
    }
  }
  
  public int update(Uri paramUri, ContentValues paramContentValues, String paramString, String[] paramArrayOfString)
  {
    int i = matchUri(paramUri);
    if (i == -1) {
      throw new UnsupportedOperationException("Unknown uri: " + paramUri);
    }
    i = createActions(i).update(this, paramUri, paramContentValues, paramString, paramArrayOfString);
    if (i > 0) {
      tryNotifyChange(paramUri);
    }
    return i;
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/robotoworks/mechanoid/db/MechanoidContentProvider.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */