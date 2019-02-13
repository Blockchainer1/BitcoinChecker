package com.robotoworks.mechanoid.db;

import android.content.ContentResolver;
import android.content.ContentUris;
import android.database.Cursor;
import android.net.Uri;
import android.net.Uri.Builder;
import com.robotoworks.mechanoid.Mechanoid;
import com.robotoworks.mechanoid.util.Closeables;

public abstract class ActiveRecord
{
  protected final Uri mContentUri;
  private long mId;
  
  protected ActiveRecord(Uri paramUri)
  {
    this.mContentUri = paramUri;
  }
  
  protected abstract String[] _getProjection();
  
  protected abstract AbstractValuesBuilder createBuilder();
  
  public boolean delete()
  {
    return delete(true);
  }
  
  public boolean delete(boolean paramBoolean)
  {
    if (Mechanoid.getContentResolver().delete(this.mContentUri.buildUpon().appendPath(String.valueOf(this.mId)).appendQueryParameter("mechdb_notify", String.valueOf(paramBoolean)).build(), null, null) > 0) {}
    for (paramBoolean = true;; paramBoolean = false)
    {
      makeDirty(false);
      return paramBoolean;
    }
  }
  
  public long getId()
  {
    return this.mId;
  }
  
  public long insert()
  {
    return insert(true);
  }
  
  public long insert(boolean paramBoolean)
  {
    this.mId = ContentUris.parseId(createBuilder().insert(paramBoolean));
    makeDirty(false);
    return this.mId;
  }
  
  public abstract void makeDirty(boolean paramBoolean);
  
  public void reload()
  {
    if (this.mId == 0L) {}
    for (;;)
    {
      return;
      Object localObject1 = null;
      Object localObject2 = Mechanoid.getContentResolver();
      try
      {
        localObject2 = ((ContentResolver)localObject2).query(this.mContentUri.buildUpon().appendPath(String.valueOf(this.mId)).build(), _getProjection(), null, null, null);
        localObject1 = localObject2;
        if (((Cursor)localObject2).moveToFirst())
        {
          localObject1 = localObject2;
          setPropertiesFromCursor((Cursor)localObject2);
          localObject1 = localObject2;
          makeDirty(false);
        }
        Closeables.closeSilently((Cursor)localObject2);
      }
      finally
      {
        Closeables.closeSilently((Cursor)localObject1);
      }
    }
  }
  
  public long save()
  {
    return save(true);
  }
  
  public long save(boolean paramBoolean)
  {
    if (this.mId > 0L) {}
    for (long l = update(paramBoolean);; l = insert(paramBoolean))
    {
      this.mId = l;
      return this.mId;
    }
  }
  
  public void setId(long paramLong)
  {
    if (this.mId != paramLong) {
      makeDirty(true);
    }
    this.mId = paramLong;
  }
  
  protected abstract void setPropertiesFromCursor(Cursor paramCursor);
  
  public long update()
  {
    return update(true);
  }
  
  public long update(boolean paramBoolean)
  {
    createBuilder().update(this.mId, paramBoolean);
    makeDirty(false);
    return this.mId;
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/robotoworks/mechanoid/db/ActiveRecord.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */