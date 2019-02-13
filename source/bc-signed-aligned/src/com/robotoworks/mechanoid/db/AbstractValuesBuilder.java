package com.robotoworks.mechanoid.db;

import android.content.ContentProviderOperation;
import android.content.ContentProviderOperation.Builder;
import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.net.Uri;
import android.net.Uri.Builder;

public abstract class AbstractValuesBuilder
{
  private ContentResolver mContentResolver;
  private Uri mContentUri;
  protected ContentValues mValues = new ContentValues();
  
  protected AbstractValuesBuilder(Context paramContext, Uri paramUri)
  {
    this.mContentResolver = paramContext.getContentResolver();
    this.mContentUri = paramUri;
  }
  
  public ContentValues getValues()
  {
    return this.mValues;
  }
  
  public Uri insert()
  {
    return this.mContentResolver.insert(this.mContentUri, this.mValues);
  }
  
  public Uri insert(boolean paramBoolean)
  {
    Uri localUri = this.mContentUri.buildUpon().appendQueryParameter("mechdb_notify", String.valueOf(paramBoolean)).build();
    return this.mContentResolver.insert(localUri, this.mValues);
  }
  
  public ContentProviderOperation.Builder toAssertQueryOperationBuilder()
  {
    return ContentProviderOperation.newAssertQuery(this.mContentUri).withValues(this.mValues);
  }
  
  public ContentProviderOperation.Builder toDeleteOperationBuilder()
  {
    return ContentProviderOperation.newDelete(this.mContentUri);
  }
  
  public ContentProviderOperation.Builder toInsertOperationBuilder()
  {
    return ContentProviderOperation.newInsert(this.mContentUri).withValues(this.mValues);
  }
  
  public ContentProviderOperation.Builder toUpdateOperationBuilder()
  {
    return ContentProviderOperation.newUpdate(this.mContentUri).withValues(this.mValues);
  }
  
  public int update(long paramLong)
  {
    return this.mContentResolver.update(this.mContentUri.buildUpon().appendPath(String.valueOf(paramLong)).build(), this.mValues, null, null);
  }
  
  public int update(long paramLong, boolean paramBoolean)
  {
    Uri localUri = this.mContentUri.buildUpon().appendPath(String.valueOf(paramLong)).appendQueryParameter("mechdb_notify", String.valueOf(paramBoolean)).build();
    return this.mContentResolver.update(localUri, this.mValues, null, null);
  }
  
  public int update(SQuery paramSQuery)
  {
    return this.mContentResolver.update(this.mContentUri, this.mValues, paramSQuery.toString(), paramSQuery.getArgsArray());
  }
  
  public int update(SQuery paramSQuery, boolean paramBoolean)
  {
    Uri localUri = this.mContentUri.buildUpon().appendQueryParameter("mechdb_notify", String.valueOf(paramBoolean)).build();
    return this.mContentResolver.update(localUri, this.mValues, paramSQuery.toString(), paramSQuery.getArgsArray());
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/robotoworks/mechanoid/db/AbstractValuesBuilder.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */