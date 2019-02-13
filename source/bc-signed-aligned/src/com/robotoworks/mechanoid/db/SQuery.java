package com.robotoworks.mechanoid.db;

import android.annotation.TargetApi;
import android.content.ContentProviderClient;
import android.content.ContentResolver;
import android.content.ContentValues;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.net.Uri;
import android.net.Uri.Builder;
import android.os.Build.VERSION;
import android.text.TextUtils;
import com.robotoworks.mechanoid.Mechanoid;
import com.robotoworks.mechanoid.util.Closeables;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class SQuery
{
  private static final String AND = " AND ";
  public static final Literal CURRENT_DATE = new Literal("CURRENT_DATE");
  public static final Literal CURRENT_TIME;
  public static final Literal CURRENT_TIMESTAMP = new Literal("CURRENT_TIMESTAMP");
  public static final Literal NULL = new Literal("NULL");
  private static final String OR = " OR ";
  private List<String> mArgs = new ArrayList();
  private StringBuilder mBuilder = new StringBuilder();
  private String mNextOp = null;
  private MechanoidContentProvider mProvider;
  
  static
  {
    CURRENT_TIME = new Literal("CURRENT_TIME");
  }
  
  private SQuery() {}
  
  public SQuery(MechanoidContentProvider paramMechanoidContentProvider)
  {
    this();
    this.mProvider = paramMechanoidContentProvider;
  }
  
  private Uri appendGroupByToUri(Uri paramUri, String... paramVarArgs)
  {
    Object localObject = paramUri;
    if (paramVarArgs != null) {
      if (paramVarArgs.length != 0) {
        break label15;
      }
    }
    for (localObject = paramUri;; localObject = paramUri.buildUpon().appendQueryParameter("mechdb_group_by", ((StringBuilder)localObject).toString()).build())
    {
      return (Uri)localObject;
      label15:
      localObject = new StringBuilder();
      int i = 0;
      if (i < paramVarArgs.length)
      {
        if (TextUtils.isEmpty(paramVarArgs[i])) {}
        for (;;)
        {
          i++;
          break;
          ((StringBuilder)localObject).append(paramVarArgs[i]);
          if (i < paramVarArgs.length - 1) {
            ((StringBuilder)localObject).append(", ");
          }
        }
      }
    }
  }
  
  private void ensureOp()
  {
    if (this.mBuilder.length() == 0) {}
    for (;;)
    {
      return;
      if (this.mNextOp == null)
      {
        this.mBuilder.append(" AND ");
      }
      else
      {
        this.mBuilder.append(this.mNextOp);
        this.mNextOp = null;
      }
    }
  }
  
  private MechanoidContentProvider getContentProvider(Uri paramUri)
  {
    if (this.mProvider != null) {}
    for (paramUri = this.mProvider;; paramUri = (MechanoidContentProvider)Mechanoid.getContentResolver().acquireContentProviderClient(paramUri).getLocalContentProvider()) {
      return paramUri;
    }
  }
  
  public static SQuery newQuery()
  {
    return new SQuery();
  }
  
  public static SQuery newQuery(MechanoidContentProvider paramMechanoidContentProvider)
  {
    return new SQuery(paramMechanoidContentProvider);
  }
  
  public SQuery and()
  {
    this.mNextOp = " AND ";
    return this;
  }
  
  public SQuery append(String paramString, String... paramVarArgs)
  {
    if ((paramString != null) && (paramString.length() > 0))
    {
      ensureOp();
      this.mBuilder.append(paramString);
      if ((paramVarArgs != null) && (paramVarArgs.length > 0))
      {
        int i = paramVarArgs.length;
        for (int j = 0; j < i; j++)
        {
          paramString = paramVarArgs[j];
          this.mArgs.add(paramString);
        }
      }
      this.mNextOp = null;
    }
    return this;
  }
  
  public int count(Uri paramUri)
  {
    ContentResolver localContentResolver = Mechanoid.getContentResolver();
    Cursor localCursor = null;
    Uri localUri = paramUri.buildUpon().appendQueryParameter("mechdb_notify", "false").build();
    paramUri = localCursor;
    try
    {
      String str = toString();
      paramUri = localCursor;
      String[] arrayOfString = getArgsArray();
      paramUri = localCursor;
      localCursor = localContentResolver.query(localUri, new String[] { "count(*)" }, str, arrayOfString, null);
      int i = 0;
      paramUri = localCursor;
      if (localCursor.moveToFirst())
      {
        paramUri = localCursor;
        i = localCursor.getInt(0);
      }
      return i;
    }
    finally
    {
      Closeables.closeSilently(paramUri);
    }
  }
  
  @TargetApi(11)
  public android.content.CursorLoader createLoader(Uri paramUri, String[] paramArrayOfString)
  {
    Object localObject = null;
    if (Build.VERSION.SDK_INT < 11) {}
    for (paramUri = (Uri)localObject;; paramUri = new android.content.CursorLoader(Mechanoid.getApplicationContext(), paramUri, paramArrayOfString, toString(), getArgsArray(), null)) {
      return paramUri;
    }
  }
  
  @TargetApi(11)
  public android.content.CursorLoader createLoader(Uri paramUri, String[] paramArrayOfString, String paramString)
  {
    if (Build.VERSION.SDK_INT < 11) {}
    for (paramUri = null;; paramUri = new android.content.CursorLoader(Mechanoid.getApplicationContext(), paramUri, paramArrayOfString, toString(), getArgsArray(), paramString)) {
      return paramUri;
    }
  }
  
  @TargetApi(11)
  public android.content.CursorLoader createLoader(Uri paramUri, String[] paramArrayOfString, String paramString, boolean paramBoolean)
  {
    if (Build.VERSION.SDK_INT < 11) {}
    for (paramUri = null;; paramUri = new android.content.CursorLoader(Mechanoid.getApplicationContext(), paramUri, paramArrayOfString, toString(), getArgsArray(), paramString))
    {
      return paramUri;
      paramUri = paramUri.buildUpon().appendQueryParameter("mechdb_notify", String.valueOf(paramBoolean)).build();
    }
  }
  
  @TargetApi(11)
  public android.content.CursorLoader createLoader(Uri paramUri, String[] paramArrayOfString1, String paramString, boolean paramBoolean, String... paramVarArgs)
  {
    if (Build.VERSION.SDK_INT < 11) {}
    for (paramUri = null;; paramUri = new android.content.CursorLoader(Mechanoid.getApplicationContext(), paramUri, paramArrayOfString1, toString(), getArgsArray(), paramString))
    {
      return paramUri;
      paramUri = appendGroupByToUri(paramUri.buildUpon().appendQueryParameter("mechdb_notify", String.valueOf(paramBoolean)).build(), paramVarArgs);
    }
  }
  
  @TargetApi(11)
  public android.content.CursorLoader createLoader(Uri paramUri, String[] paramArrayOfString1, String paramString, String... paramVarArgs)
  {
    if (Build.VERSION.SDK_INT < 11) {}
    for (paramUri = null;; paramUri = new android.content.CursorLoader(Mechanoid.getApplicationContext(), paramUri, paramArrayOfString1, toString(), getArgsArray(), paramString))
    {
      return paramUri;
      paramUri = appendGroupByToUri(paramUri, paramVarArgs);
    }
  }
  
  @TargetApi(11)
  public android.content.CursorLoader createLoader(Uri paramUri, String[] paramArrayOfString1, boolean paramBoolean, String... paramVarArgs)
  {
    Object localObject = null;
    if (Build.VERSION.SDK_INT < 11) {}
    for (paramUri = (Uri)localObject;; paramUri = new android.content.CursorLoader(Mechanoid.getApplicationContext(), paramUri, paramArrayOfString1, toString(), getArgsArray(), null))
    {
      return paramUri;
      paramUri = appendGroupByToUri(paramUri.buildUpon().appendQueryParameter("mechdb_notify", String.valueOf(paramBoolean)).build(), paramVarArgs);
    }
  }
  
  public android.support.v4.content.CursorLoader createSupportLoader(Uri paramUri, String[] paramArrayOfString)
  {
    return new android.support.v4.content.CursorLoader(Mechanoid.getApplicationContext(), paramUri, paramArrayOfString, toString(), getArgsArray(), null);
  }
  
  public android.support.v4.content.CursorLoader createSupportLoader(Uri paramUri, String[] paramArrayOfString, String paramString)
  {
    return new android.support.v4.content.CursorLoader(Mechanoid.getApplicationContext(), paramUri, paramArrayOfString, toString(), getArgsArray(), paramString);
  }
  
  public android.support.v4.content.CursorLoader createSupportLoader(Uri paramUri, String[] paramArrayOfString, String paramString, boolean paramBoolean)
  {
    paramUri = paramUri.buildUpon().appendQueryParameter("mechdb_notify", String.valueOf(paramBoolean)).build();
    return new android.support.v4.content.CursorLoader(Mechanoid.getApplicationContext(), paramUri, paramArrayOfString, toString(), getArgsArray(), paramString);
  }
  
  public android.support.v4.content.CursorLoader createSupportLoader(Uri paramUri, String[] paramArrayOfString1, String paramString, boolean paramBoolean, String... paramVarArgs)
  {
    paramUri = appendGroupByToUri(paramUri.buildUpon().appendQueryParameter("mechdb_notify", String.valueOf(paramBoolean)).build(), paramVarArgs);
    return new android.support.v4.content.CursorLoader(Mechanoid.getApplicationContext(), paramUri, paramArrayOfString1, toString(), getArgsArray(), paramString);
  }
  
  public android.support.v4.content.CursorLoader createSupportLoader(Uri paramUri, String[] paramArrayOfString1, String paramString, String... paramVarArgs)
  {
    paramUri = appendGroupByToUri(paramUri, paramVarArgs);
    return new android.support.v4.content.CursorLoader(Mechanoid.getApplicationContext(), paramUri, paramArrayOfString1, toString(), getArgsArray(), paramString);
  }
  
  public android.support.v4.content.CursorLoader createSupportLoader(Uri paramUri, String[] paramArrayOfString, boolean paramBoolean)
  {
    paramUri = paramUri.buildUpon().appendQueryParameter("mechdb_notify", String.valueOf(paramBoolean)).build();
    return new android.support.v4.content.CursorLoader(Mechanoid.getApplicationContext(), paramUri, paramArrayOfString, toString(), getArgsArray(), null);
  }
  
  public android.support.v4.content.CursorLoader createSupportLoader(Uri paramUri, String[] paramArrayOfString1, boolean paramBoolean, String... paramVarArgs)
  {
    paramUri = appendGroupByToUri(paramUri.buildUpon().appendQueryParameter("mechdb_notify", String.valueOf(paramBoolean)).build(), paramVarArgs);
    return new android.support.v4.content.CursorLoader(Mechanoid.getApplicationContext(), paramUri, paramArrayOfString1, toString(), getArgsArray(), null);
  }
  
  public int delete(SQLiteDatabase paramSQLiteDatabase, String paramString)
  {
    return paramSQLiteDatabase.delete(paramString, this.mBuilder.toString(), getArgsArray());
  }
  
  public int delete(Uri paramUri)
  {
    return Mechanoid.getContentResolver().delete(paramUri, toString(), getArgsArray());
  }
  
  public int delete(Uri paramUri, boolean paramBoolean)
  {
    paramUri = paramUri.buildUpon().appendQueryParameter("mechdb_notify", String.valueOf(paramBoolean)).build();
    return Mechanoid.getContentResolver().delete(paramUri, toString(), getArgsArray());
  }
  
  public boolean exists(Uri paramUri)
  {
    if (count(paramUri) > 0) {}
    for (boolean bool = true;; bool = false) {
      return bool;
    }
  }
  
  public SQuery expr(SQuery paramSQuery)
  {
    List localList = paramSQuery.getArgs();
    ensureOp();
    this.mBuilder.append("(").append(paramSQuery).append(")");
    if (localList.size() > 0) {
      this.mArgs.addAll(localList);
    }
    this.mNextOp = null;
    return this;
  }
  
  public SQuery expr(String paramString1, String paramString2, double paramDouble)
  {
    return expr(paramString1, paramString2, String.valueOf(paramDouble));
  }
  
  public SQuery expr(String paramString1, String paramString2, float paramFloat)
  {
    return expr(paramString1, paramString2, String.valueOf(paramFloat));
  }
  
  public SQuery expr(String paramString1, String paramString2, int paramInt)
  {
    return expr(paramString1, paramString2, String.valueOf(paramInt));
  }
  
  public SQuery expr(String paramString1, String paramString2, long paramLong)
  {
    return expr(paramString1, paramString2, String.valueOf(paramLong));
  }
  
  public SQuery expr(String paramString1, String paramString2, Literal paramLiteral)
  {
    ensureOp();
    this.mBuilder.append(paramString1).append(paramString2).append(" ").append(paramLiteral.value);
    this.mNextOp = null;
    return this;
  }
  
  public SQuery expr(String paramString1, String paramString2, String paramString3)
  {
    ensureOp();
    this.mBuilder.append(paramString1).append(paramString2).append("?");
    this.mArgs.add(paramString3);
    this.mNextOp = null;
    return this;
  }
  
  public SQuery expr(String paramString1, String paramString2, boolean paramBoolean)
  {
    if (paramBoolean) {}
    for (String str = "1";; str = "0") {
      return expr(paramString1, paramString2, str);
    }
  }
  
  public SQuery exprIsNull(String paramString)
  {
    ensureOp();
    this.mBuilder.append(paramString).append(" ISNULL");
    this.mNextOp = null;
    return this;
  }
  
  public SQuery exprNotNull(String paramString)
  {
    ensureOp();
    this.mBuilder.append(paramString).append(" NOTNULL");
    this.mNextOp = null;
    return this;
  }
  
  public byte[] firstBlob(SQLiteDatabase paramSQLiteDatabase, String paramString1, String paramString2)
  {
    return firstBlob(paramSQLiteDatabase, paramString1, paramString2, null);
  }
  
  public byte[] firstBlob(SQLiteDatabase paramSQLiteDatabase, String paramString1, String paramString2, String paramString3)
  {
    String str = null;
    Object localObject = null;
    try
    {
      paramString1 = query(paramSQLiteDatabase, paramString1, new String[] { paramString2 }, paramString3, null);
      paramSQLiteDatabase = (SQLiteDatabase)localObject;
      str = paramString1;
      if (paramString1.moveToFirst())
      {
        str = paramString1;
        paramSQLiteDatabase = paramString1.getBlob(0);
      }
      return paramSQLiteDatabase;
    }
    finally
    {
      Closeables.closeSilently(str);
    }
  }
  
  public byte[] firstBlob(Uri paramUri, String paramString)
  {
    return firstBlob(paramUri, paramString, null);
  }
  
  public byte[] firstBlob(Uri paramUri, String paramString1, String paramString2)
  {
    String str = null;
    Object localObject = null;
    try
    {
      paramString1 = select(paramUri, new String[] { paramString1 }, paramString2, false);
      paramUri = (Uri)localObject;
      str = paramString1;
      if (paramString1.moveToFirst())
      {
        str = paramString1;
        paramUri = paramString1.getBlob(0);
      }
      return paramUri;
    }
    finally
    {
      Closeables.closeSilently(str);
    }
  }
  
  public boolean firstBoolean(SQLiteDatabase paramSQLiteDatabase, String paramString1, String paramString2)
  {
    return firstBoolean(paramSQLiteDatabase, paramString1, paramString2, null);
  }
  
  public boolean firstBoolean(SQLiteDatabase paramSQLiteDatabase, String paramString1, String paramString2, String paramString3)
  {
    if (firstShort(paramSQLiteDatabase, paramString1, paramString2, paramString3) > 0) {}
    for (boolean bool = true;; bool = false) {
      return bool;
    }
  }
  
  public boolean firstBoolean(Uri paramUri, String paramString)
  {
    return firstBoolean(paramUri, paramString, null);
  }
  
  public boolean firstBoolean(Uri paramUri, String paramString1, String paramString2)
  {
    if (firstShort(paramUri, paramString1, paramString2) > 0) {}
    for (boolean bool = true;; bool = false) {
      return bool;
    }
  }
  
  public double firstDouble(SQLiteDatabase paramSQLiteDatabase, String paramString1, String paramString2)
  {
    return firstDouble(paramSQLiteDatabase, paramString1, paramString2, null);
  }
  
  public double firstDouble(SQLiteDatabase paramSQLiteDatabase, String paramString1, String paramString2, String paramString3)
  {
    SQLiteDatabase localSQLiteDatabase = null;
    double d = 0.0D;
    try
    {
      paramSQLiteDatabase = query(paramSQLiteDatabase, paramString1, new String[] { paramString2 }, paramString3, null);
      localSQLiteDatabase = paramSQLiteDatabase;
      if (paramSQLiteDatabase.moveToFirst())
      {
        localSQLiteDatabase = paramSQLiteDatabase;
        d = paramSQLiteDatabase.getDouble(0);
      }
      return d;
    }
    finally
    {
      Closeables.closeSilently(localSQLiteDatabase);
    }
  }
  
  public double firstDouble(Uri paramUri, String paramString)
  {
    return firstDouble(paramUri, paramString, null);
  }
  
  public double firstDouble(Uri paramUri, String paramString1, String paramString2)
  {
    Uri localUri = null;
    double d = 0.0D;
    try
    {
      paramUri = select(paramUri, new String[] { paramString1 }, paramString2, false);
      localUri = paramUri;
      if (paramUri.moveToFirst())
      {
        localUri = paramUri;
        d = paramUri.getDouble(0);
      }
      return d;
    }
    finally
    {
      Closeables.closeSilently(localUri);
    }
  }
  
  public float firstFloat(SQLiteDatabase paramSQLiteDatabase, String paramString1, String paramString2)
  {
    return firstFloat(paramSQLiteDatabase, paramString1, paramString2, null);
  }
  
  public float firstFloat(SQLiteDatabase paramSQLiteDatabase, String paramString1, String paramString2, String paramString3)
  {
    SQLiteDatabase localSQLiteDatabase = null;
    float f = 0.0F;
    try
    {
      paramSQLiteDatabase = query(paramSQLiteDatabase, paramString1, new String[] { paramString2 }, paramString3, null);
      localSQLiteDatabase = paramSQLiteDatabase;
      if (paramSQLiteDatabase.moveToFirst())
      {
        localSQLiteDatabase = paramSQLiteDatabase;
        f = paramSQLiteDatabase.getFloat(0);
      }
      return f;
    }
    finally
    {
      Closeables.closeSilently(localSQLiteDatabase);
    }
  }
  
  public float firstFloat(Uri paramUri, String paramString)
  {
    return firstFloat(paramUri, paramString, null);
  }
  
  public float firstFloat(Uri paramUri, String paramString1, String paramString2)
  {
    Uri localUri = null;
    float f = 0.0F;
    try
    {
      paramUri = select(paramUri, new String[] { paramString1 }, paramString2, false);
      localUri = paramUri;
      if (paramUri.moveToFirst())
      {
        localUri = paramUri;
        f = paramUri.getFloat(0);
      }
      return f;
    }
    finally
    {
      Closeables.closeSilently(localUri);
    }
  }
  
  public int firstInt(SQLiteDatabase paramSQLiteDatabase, String paramString1, String paramString2)
  {
    return firstInt(paramSQLiteDatabase, paramString1, paramString2, null);
  }
  
  public int firstInt(SQLiteDatabase paramSQLiteDatabase, String paramString1, String paramString2, String paramString3)
  {
    SQLiteDatabase localSQLiteDatabase = null;
    int i = 0;
    try
    {
      paramSQLiteDatabase = query(paramSQLiteDatabase, paramString1, new String[] { paramString2 }, paramString3, null);
      localSQLiteDatabase = paramSQLiteDatabase;
      if (paramSQLiteDatabase.moveToFirst())
      {
        localSQLiteDatabase = paramSQLiteDatabase;
        i = paramSQLiteDatabase.getInt(0);
      }
      return i;
    }
    finally
    {
      Closeables.closeSilently(localSQLiteDatabase);
    }
  }
  
  public int firstInt(Uri paramUri, String paramString)
  {
    return firstInt(paramUri, paramString, null);
  }
  
  public int firstInt(Uri paramUri, String paramString1, String paramString2)
  {
    Uri localUri = null;
    int i = 0;
    try
    {
      paramUri = select(paramUri, new String[] { paramString1 }, paramString2, false);
      localUri = paramUri;
      if (paramUri.moveToFirst())
      {
        localUri = paramUri;
        i = paramUri.getInt(0);
      }
      return i;
    }
    finally
    {
      Closeables.closeSilently(localUri);
    }
  }
  
  public long firstLong(SQLiteDatabase paramSQLiteDatabase, String paramString1, String paramString2)
  {
    return firstLong(paramSQLiteDatabase, paramString1, paramString2, null);
  }
  
  public long firstLong(SQLiteDatabase paramSQLiteDatabase, String paramString1, String paramString2, String paramString3)
  {
    SQLiteDatabase localSQLiteDatabase = null;
    long l = 0L;
    try
    {
      paramSQLiteDatabase = query(paramSQLiteDatabase, paramString1, new String[] { paramString2 }, paramString3, null);
      localSQLiteDatabase = paramSQLiteDatabase;
      if (paramSQLiteDatabase.moveToFirst())
      {
        localSQLiteDatabase = paramSQLiteDatabase;
        l = paramSQLiteDatabase.getLong(0);
      }
      return l;
    }
    finally
    {
      Closeables.closeSilently(localSQLiteDatabase);
    }
  }
  
  public long firstLong(Uri paramUri, String paramString)
  {
    return firstLong(paramUri, paramString, null);
  }
  
  public long firstLong(Uri paramUri, String paramString1, String paramString2)
  {
    Uri localUri = null;
    long l = 0L;
    try
    {
      paramUri = select(paramUri, new String[] { paramString1 }, paramString2, false);
      localUri = paramUri;
      if (paramUri.moveToFirst())
      {
        localUri = paramUri;
        l = paramUri.getLong(0);
      }
      return l;
    }
    finally
    {
      Closeables.closeSilently(localUri);
    }
  }
  
  public short firstShort(SQLiteDatabase paramSQLiteDatabase, String paramString1, String paramString2)
  {
    return firstShort(paramSQLiteDatabase, paramString1, paramString2, null);
  }
  
  public short firstShort(SQLiteDatabase paramSQLiteDatabase, String paramString1, String paramString2, String paramString3)
  {
    SQLiteDatabase localSQLiteDatabase = null;
    short s1 = 0;
    try
    {
      paramSQLiteDatabase = query(paramSQLiteDatabase, paramString1, new String[] { paramString2 }, paramString3, null);
      short s2 = s1;
      localSQLiteDatabase = paramSQLiteDatabase;
      if (paramSQLiteDatabase.moveToFirst())
      {
        localSQLiteDatabase = paramSQLiteDatabase;
        s1 = paramSQLiteDatabase.getShort(0);
        s2 = s1;
      }
      return s2;
    }
    finally
    {
      Closeables.closeSilently(localSQLiteDatabase);
    }
  }
  
  public short firstShort(Uri paramUri, String paramString)
  {
    return firstShort(paramUri, paramString, null);
  }
  
  public short firstShort(Uri paramUri, String paramString1, String paramString2)
  {
    Uri localUri = null;
    short s1 = 0;
    try
    {
      paramUri = select(paramUri, new String[] { paramString1 }, paramString2, false);
      short s2 = s1;
      localUri = paramUri;
      if (paramUri.moveToFirst())
      {
        localUri = paramUri;
        s1 = paramUri.getShort(0);
        s2 = s1;
      }
      return s2;
    }
    finally
    {
      Closeables.closeSilently(localUri);
    }
  }
  
  public String firstString(SQLiteDatabase paramSQLiteDatabase, String paramString1, String paramString2)
  {
    return firstString(paramSQLiteDatabase, paramString1, paramString2, null);
  }
  
  public String firstString(SQLiteDatabase paramSQLiteDatabase, String paramString1, String paramString2, String paramString3)
  {
    String str = null;
    Object localObject = null;
    try
    {
      paramString1 = query(paramSQLiteDatabase, paramString1, new String[] { paramString2 }, paramString3, null);
      paramSQLiteDatabase = (SQLiteDatabase)localObject;
      str = paramString1;
      if (paramString1.moveToFirst())
      {
        str = paramString1;
        paramSQLiteDatabase = paramString1.getString(0);
      }
      return paramSQLiteDatabase;
    }
    finally
    {
      Closeables.closeSilently(str);
    }
  }
  
  public String firstString(Uri paramUri, String paramString)
  {
    return firstString(paramUri, paramString, null);
  }
  
  public String firstString(Uri paramUri, String paramString1, String paramString2)
  {
    String str = null;
    Object localObject = null;
    try
    {
      paramString1 = select(paramUri, new String[] { paramString1 }, paramString2, false);
      paramUri = (Uri)localObject;
      str = paramString1;
      if (paramString1.moveToFirst())
      {
        str = paramString1;
        paramUri = paramString1.getString(0);
      }
      return paramUri;
    }
    finally
    {
      Closeables.closeSilently(str);
    }
  }
  
  public List<String> getArgs()
  {
    return this.mArgs;
  }
  
  public String[] getArgsArray()
  {
    return (String[])this.mArgs.toArray(new String[this.mArgs.size()]);
  }
  
  public SQuery opt(String paramString1, String paramString2, double paramDouble)
  {
    if (paramDouble == 0.0D) {}
    for (paramString1 = this;; paramString1 = expr(paramString1, paramString2, paramDouble)) {
      return paramString1;
    }
  }
  
  public SQuery opt(String paramString1, String paramString2, float paramFloat)
  {
    if (paramFloat == 0.0F) {}
    for (paramString1 = this;; paramString1 = expr(paramString1, paramString2, paramFloat)) {
      return paramString1;
    }
  }
  
  public SQuery opt(String paramString1, String paramString2, int paramInt)
  {
    if (paramInt == 0) {}
    for (paramString1 = this;; paramString1 = expr(paramString1, paramString2, String.valueOf(paramInt))) {
      return paramString1;
    }
  }
  
  public SQuery opt(String paramString1, String paramString2, long paramLong)
  {
    if (paramLong == 0L) {}
    for (paramString1 = this;; paramString1 = expr(paramString1, paramString2, paramLong)) {
      return paramString1;
    }
  }
  
  public SQuery opt(String paramString1, String paramString2, String paramString3)
  {
    if (paramString3 == null) {}
    for (paramString1 = this;; paramString1 = expr(paramString1, paramString2, paramString3)) {
      return paramString1;
    }
  }
  
  public SQuery opt(String paramString1, String paramString2, boolean paramBoolean)
  {
    if (!paramBoolean) {}
    for (paramString1 = this;; paramString1 = expr(paramString1, paramString2, paramBoolean)) {
      return paramString1;
    }
  }
  
  public SQuery or()
  {
    this.mNextOp = " OR ";
    return this;
  }
  
  public Cursor query(SQLiteDatabase paramSQLiteDatabase, String paramString1, String[] paramArrayOfString, String paramString2, String paramString3)
  {
    return paramSQLiteDatabase.query(paramString1, paramArrayOfString, this.mBuilder.toString(), getArgsArray(), paramString3, null, paramString2);
  }
  
  public Cursor select(Uri paramUri, String[] paramArrayOfString)
  {
    return select(paramUri, paramArrayOfString, (String)null);
  }
  
  public Cursor select(Uri paramUri, String[] paramArrayOfString, String paramString)
  {
    return Mechanoid.getContentResolver().query(paramUri, paramArrayOfString, toString(), getArgsArray(), paramString);
  }
  
  public Cursor select(Uri paramUri, String[] paramArrayOfString, String paramString, boolean paramBoolean)
  {
    return Mechanoid.getContentResolver().query(paramUri.buildUpon().appendQueryParameter("mechdb_notify", String.valueOf(paramBoolean)).build(), paramArrayOfString, toString(), getArgsArray(), paramString);
  }
  
  public Cursor select(Uri paramUri, String[] paramArrayOfString1, String paramString, boolean paramBoolean, String... paramVarArgs)
  {
    return Mechanoid.getContentResolver().query(appendGroupByToUri(paramUri.buildUpon().appendQueryParameter("mechdb_notify", String.valueOf(paramBoolean)).build(), paramVarArgs), paramArrayOfString1, toString(), getArgsArray(), paramString);
  }
  
  public Cursor select(Uri paramUri, String[] paramArrayOfString1, String paramString, String... paramVarArgs)
  {
    return Mechanoid.getContentResolver().query(appendGroupByToUri(paramUri, paramVarArgs), paramArrayOfString1, toString(), getArgsArray(), paramString);
  }
  
  public Cursor select(Uri paramUri, String[] paramArrayOfString, boolean paramBoolean)
  {
    return select(paramUri, paramArrayOfString, null, paramBoolean);
  }
  
  public Cursor select(Uri paramUri, String[] paramArrayOfString1, boolean paramBoolean, String... paramVarArgs)
  {
    return select(paramUri, paramArrayOfString1, null, paramBoolean, paramVarArgs);
  }
  
  public Cursor select(Uri paramUri, String[] paramArrayOfString1, String... paramVarArgs)
  {
    return select(paramUri, paramArrayOfString1, null, paramVarArgs);
  }
  
  public <T extends ActiveRecord> List<T> select(Uri paramUri)
  {
    return getContentProvider(paramUri).selectRecords(paramUri, this, null);
  }
  
  public <T extends ActiveRecord> List<T> select(Uri paramUri, String paramString)
  {
    return getContentProvider(paramUri).selectRecords(paramUri, this, paramString);
  }
  
  public <T extends ActiveRecord> List<T> select(Uri paramUri, String paramString, String... paramVarArgs)
  {
    paramUri = appendGroupByToUri(paramUri, paramVarArgs);
    return getContentProvider(paramUri).selectRecords(paramUri, this, paramString);
  }
  
  public byte[][] selectBlobArray(Uri paramUri, String paramString)
  {
    return selectBlobArray(paramUri, paramString, null);
  }
  
  public byte[][] selectBlobArray(Uri paramUri, String paramString1, String paramString2)
  {
    Uri localUri = null;
    try
    {
      paramUri = select(paramUri, new String[] { paramString1 }, paramString2, false);
      localUri = paramUri;
      paramString1 = new byte[paramUri.getCount()][];
      for (int i = 0;; i++)
      {
        localUri = paramUri;
        if (i >= paramUri.getCount()) {
          break;
        }
        localUri = paramUri;
        paramUri.moveToNext();
        localUri = paramUri;
        paramString1[i] = paramUri.getBlob(0);
      }
      return paramString1;
    }
    finally
    {
      Closeables.closeSilently(localUri);
    }
  }
  
  public List<byte[]> selectBlobList(Uri paramUri, String paramString)
  {
    return selectBlobList(paramUri, paramString, null);
  }
  
  public List<byte[]> selectBlobList(Uri paramUri, String paramString1, String paramString2)
  {
    Uri localUri = null;
    try
    {
      paramUri = select(paramUri, new String[] { paramString1 }, paramString2, false);
      localUri = paramUri;
      paramString1 = new java/util/ArrayList;
      localUri = paramUri;
      paramString1.<init>(paramUri.getCount());
      for (int i = 0;; i++)
      {
        localUri = paramUri;
        if (i >= paramUri.getCount()) {
          break;
        }
        localUri = paramUri;
        paramUri.moveToNext();
        localUri = paramUri;
        paramString1.add(paramUri.getBlob(0));
      }
      return paramString1;
    }
    finally
    {
      Closeables.closeSilently(localUri);
    }
  }
  
  public boolean[] selectBooleanArray(Uri paramUri, String paramString)
  {
    return selectBooleanArray(paramUri, paramString, null);
  }
  
  public boolean[] selectBooleanArray(Uri paramUri, String paramString1, String paramString2)
  {
    Uri localUri = null;
    try
    {
      paramUri = select(paramUri, new String[] { paramString1 }, paramString2, false);
      localUri = paramUri;
      paramString1 = new boolean[paramUri.getCount()];
      int i = 0;
      localUri = paramUri;
      if (i < paramUri.getCount())
      {
        localUri = paramUri;
        paramUri.moveToNext();
        localUri = paramUri;
        if (paramUri.getLong(0) > 0L) {}
        for (int j = 1;; j = 0)
        {
          paramString1[i] = j;
          i++;
          break;
        }
      }
      return paramString1;
    }
    finally
    {
      Closeables.closeSilently(localUri);
    }
  }
  
  public List<Boolean> selectBooleanList(Uri paramUri, String paramString)
  {
    return selectBooleanList(paramUri, paramString, null);
  }
  
  public List<Boolean> selectBooleanList(Uri paramUri, String paramString1, String paramString2)
  {
    Uri localUri = null;
    try
    {
      paramUri = select(paramUri, new String[] { paramString1 }, paramString2, false);
      localUri = paramUri;
      paramString1 = new java/util/ArrayList;
      localUri = paramUri;
      paramString1.<init>(paramUri.getCount());
      int i = 0;
      localUri = paramUri;
      if (i < paramUri.getCount())
      {
        localUri = paramUri;
        paramUri.moveToNext();
        localUri = paramUri;
        if (paramUri.getLong(0) > 0L) {}
        for (boolean bool = true;; bool = false)
        {
          localUri = paramUri;
          paramString1.add(Boolean.valueOf(bool));
          i++;
          break;
        }
      }
      return paramString1;
    }
    finally
    {
      Closeables.closeSilently(localUri);
    }
  }
  
  public double[] selectDoubleArray(Uri paramUri, String paramString)
  {
    return selectDoubleArray(paramUri, paramString, null);
  }
  
  public double[] selectDoubleArray(Uri paramUri, String paramString1, String paramString2)
  {
    Uri localUri = null;
    try
    {
      paramUri = select(paramUri, new String[] { paramString1 }, paramString2, false);
      localUri = paramUri;
      paramString1 = new double[paramUri.getCount()];
      for (int i = 0;; i++)
      {
        localUri = paramUri;
        if (i >= paramUri.getCount()) {
          break;
        }
        localUri = paramUri;
        paramUri.moveToNext();
        localUri = paramUri;
        paramString1[i] = paramUri.getDouble(0);
      }
      return paramString1;
    }
    finally
    {
      Closeables.closeSilently(localUri);
    }
  }
  
  public List<Double> selectDoubleList(Uri paramUri, String paramString)
  {
    return selectDoubleList(paramUri, paramString, null);
  }
  
  public List<Double> selectDoubleList(Uri paramUri, String paramString1, String paramString2)
  {
    Uri localUri = null;
    try
    {
      paramUri = select(paramUri, new String[] { paramString1 }, paramString2, false);
      localUri = paramUri;
      paramString1 = new java/util/ArrayList;
      localUri = paramUri;
      paramString1.<init>(paramUri.getCount());
      for (int i = 0;; i++)
      {
        localUri = paramUri;
        if (i >= paramUri.getCount()) {
          break;
        }
        localUri = paramUri;
        paramUri.moveToNext();
        localUri = paramUri;
        paramString1.add(Double.valueOf(paramUri.getDouble(0)));
      }
      return paramString1;
    }
    finally
    {
      Closeables.closeSilently(localUri);
    }
  }
  
  public <T extends ActiveRecord> T selectFirst(Uri paramUri)
  {
    Object localObject = null;
    List localList = getContentProvider(paramUri).selectRecords(paramUri, this, null);
    paramUri = (Uri)localObject;
    if (localList.size() > 0) {
      paramUri = (ActiveRecord)localList.get(0);
    }
    return paramUri;
  }
  
  public <T extends ActiveRecord> T selectFirst(Uri paramUri, String paramString)
  {
    paramUri = getContentProvider(paramUri).selectRecords(paramUri, this, paramString);
    if (paramUri.size() > 0) {}
    for (paramUri = (ActiveRecord)paramUri.get(0);; paramUri = null) {
      return paramUri;
    }
  }
  
  public float[] selectFloatArray(Uri paramUri, String paramString)
  {
    return selectFloatArray(paramUri, paramString, null);
  }
  
  public float[] selectFloatArray(Uri paramUri, String paramString1, String paramString2)
  {
    Uri localUri = null;
    try
    {
      paramUri = select(paramUri, new String[] { paramString1 }, paramString2, false);
      localUri = paramUri;
      paramString1 = new float[paramUri.getCount()];
      for (int i = 0;; i++)
      {
        localUri = paramUri;
        if (i >= paramUri.getCount()) {
          break;
        }
        localUri = paramUri;
        paramUri.moveToNext();
        localUri = paramUri;
        paramString1[i] = paramUri.getFloat(0);
      }
      return paramString1;
    }
    finally
    {
      Closeables.closeSilently(localUri);
    }
  }
  
  public List<Float> selectFloatList(Uri paramUri, String paramString)
  {
    return selectFloatList(paramUri, paramString, null);
  }
  
  public List<Float> selectFloatList(Uri paramUri, String paramString1, String paramString2)
  {
    Uri localUri = null;
    try
    {
      paramUri = select(paramUri, new String[] { paramString1 }, paramString2, false);
      localUri = paramUri;
      paramString1 = new java/util/ArrayList;
      localUri = paramUri;
      paramString1.<init>(paramUri.getCount());
      for (int i = 0;; i++)
      {
        localUri = paramUri;
        if (i >= paramUri.getCount()) {
          break;
        }
        localUri = paramUri;
        paramUri.moveToNext();
        localUri = paramUri;
        paramString1.add(Float.valueOf(paramUri.getFloat(0)));
      }
      return paramString1;
    }
    finally
    {
      Closeables.closeSilently(localUri);
    }
  }
  
  public int[] selectIntArray(Uri paramUri, String paramString)
  {
    return selectIntArray(paramUri, paramString, null);
  }
  
  public int[] selectIntArray(Uri paramUri, String paramString1, String paramString2)
  {
    Uri localUri = null;
    try
    {
      paramUri = select(paramUri, new String[] { paramString1 }, paramString2, false);
      localUri = paramUri;
      paramString1 = new int[paramUri.getCount()];
      for (int i = 0;; i++)
      {
        localUri = paramUri;
        if (i >= paramUri.getCount()) {
          break;
        }
        localUri = paramUri;
        paramUri.moveToNext();
        localUri = paramUri;
        paramString1[i] = paramUri.getInt(0);
      }
      return paramString1;
    }
    finally
    {
      Closeables.closeSilently(localUri);
    }
  }
  
  public List<Integer> selectIntegerList(Uri paramUri, String paramString)
  {
    return selectIntegerList(paramUri, paramString, null);
  }
  
  public List<Integer> selectIntegerList(Uri paramUri, String paramString1, String paramString2)
  {
    Uri localUri = null;
    try
    {
      paramUri = select(paramUri, new String[] { paramString1 }, paramString2, false);
      localUri = paramUri;
      paramString1 = new java/util/ArrayList;
      localUri = paramUri;
      paramString1.<init>(paramUri.getCount());
      for (int i = 0;; i++)
      {
        localUri = paramUri;
        if (i >= paramUri.getCount()) {
          break;
        }
        localUri = paramUri;
        paramUri.moveToNext();
        localUri = paramUri;
        paramString1.add(Integer.valueOf(paramUri.getInt(0)));
      }
      return paramString1;
    }
    finally
    {
      Closeables.closeSilently(localUri);
    }
  }
  
  public long[] selectLongArray(Uri paramUri, String paramString)
  {
    return selectLongArray(paramUri, paramString, null);
  }
  
  public long[] selectLongArray(Uri paramUri, String paramString1, String paramString2)
  {
    Uri localUri = null;
    try
    {
      paramUri = select(paramUri, new String[] { paramString1 }, paramString2, false);
      localUri = paramUri;
      paramString1 = new long[paramUri.getCount()];
      for (int i = 0;; i++)
      {
        localUri = paramUri;
        if (i >= paramUri.getCount()) {
          break;
        }
        localUri = paramUri;
        paramUri.moveToNext();
        localUri = paramUri;
        paramString1[i] = paramUri.getLong(0);
      }
      return paramString1;
    }
    finally
    {
      Closeables.closeSilently(localUri);
    }
  }
  
  public List<Long> selectLongList(Uri paramUri, String paramString)
  {
    return selectLongList(paramUri, paramString, null);
  }
  
  public List<Long> selectLongList(Uri paramUri, String paramString1, String paramString2)
  {
    Uri localUri = null;
    try
    {
      paramUri = select(paramUri, new String[] { paramString1 }, paramString2, false);
      localUri = paramUri;
      paramString1 = new java/util/ArrayList;
      localUri = paramUri;
      paramString1.<init>(paramUri.getCount());
      for (int i = 0;; i++)
      {
        localUri = paramUri;
        if (i >= paramUri.getCount()) {
          break;
        }
        localUri = paramUri;
        paramUri.moveToNext();
        localUri = paramUri;
        paramString1.add(Long.valueOf(paramUri.getLong(0)));
      }
      return paramString1;
    }
    finally
    {
      Closeables.closeSilently(localUri);
    }
  }
  
  public <T extends ActiveRecord> Map<String, T> selectMap(Uri paramUri, String paramString, String... paramVarArgs)
  {
    paramUri = appendGroupByToUri(paramUri, paramVarArgs);
    return getContentProvider(paramUri).selectRecordMap(paramUri, this, paramString);
  }
  
  public short[] selectShortArray(Uri paramUri, String paramString)
  {
    return selectShortArray(paramUri, paramString, null);
  }
  
  public short[] selectShortArray(Uri paramUri, String paramString1, String paramString2)
  {
    Uri localUri = null;
    try
    {
      paramUri = select(paramUri, new String[] { paramString1 }, paramString2, false);
      localUri = paramUri;
      paramString1 = new short[paramUri.getCount()];
      for (int i = 0;; i++)
      {
        localUri = paramUri;
        if (i >= paramUri.getCount()) {
          break;
        }
        localUri = paramUri;
        paramUri.moveToNext();
        localUri = paramUri;
        paramString1[i] = paramUri.getShort(0);
      }
      return paramString1;
    }
    finally
    {
      Closeables.closeSilently(localUri);
    }
  }
  
  public List<Short> selectShortList(Uri paramUri, String paramString)
  {
    return selectShortList(paramUri, paramString, null);
  }
  
  public List<Short> selectShortList(Uri paramUri, String paramString1, String paramString2)
  {
    Uri localUri = null;
    try
    {
      paramUri = select(paramUri, new String[] { paramString1 }, paramString2, false);
      localUri = paramUri;
      paramString1 = new java/util/ArrayList;
      localUri = paramUri;
      paramString1.<init>(paramUri.getCount());
      for (int i = 0;; i++)
      {
        localUri = paramUri;
        if (i >= paramUri.getCount()) {
          break;
        }
        localUri = paramUri;
        paramUri.moveToNext();
        localUri = paramUri;
        paramString1.add(Short.valueOf(paramUri.getShort(0)));
      }
      return paramString1;
    }
    finally
    {
      Closeables.closeSilently(localUri);
    }
  }
  
  public String[] selectStringArray(Uri paramUri, String paramString)
  {
    return selectStringArray(paramUri, paramString, null);
  }
  
  public String[] selectStringArray(Uri paramUri, String paramString1, String paramString2)
  {
    Uri localUri = null;
    try
    {
      paramUri = select(paramUri, new String[] { paramString1 }, paramString2, false);
      localUri = paramUri;
      paramString1 = new String[paramUri.getCount()];
      for (int i = 0;; i++)
      {
        localUri = paramUri;
        if (i >= paramUri.getCount()) {
          break;
        }
        localUri = paramUri;
        paramUri.moveToNext();
        localUri = paramUri;
        paramString1[i] = paramUri.getString(0);
      }
      return paramString1;
    }
    finally
    {
      Closeables.closeSilently(localUri);
    }
  }
  
  public List<String> selectStringList(Uri paramUri, String paramString)
  {
    return selectStringList(paramUri, paramString, null);
  }
  
  public List<String> selectStringList(Uri paramUri, String paramString1, String paramString2)
  {
    Uri localUri = null;
    try
    {
      paramUri = select(paramUri, new String[] { paramString1 }, paramString2, false);
      localUri = paramUri;
      paramString1 = new java/util/ArrayList;
      localUri = paramUri;
      paramString1.<init>(paramUri.getCount());
      for (int i = 0;; i++)
      {
        localUri = paramUri;
        if (i >= paramUri.getCount()) {
          break;
        }
        localUri = paramUri;
        paramUri.moveToNext();
        localUri = paramUri;
        paramString1.add(paramUri.getString(0));
      }
      return paramString1;
    }
    finally
    {
      Closeables.closeSilently(localUri);
    }
  }
  
  public String toString()
  {
    return this.mBuilder.toString();
  }
  
  public int update(SQLiteDatabase paramSQLiteDatabase, String paramString, ContentValues paramContentValues)
  {
    return paramSQLiteDatabase.update(paramString, paramContentValues, this.mBuilder.toString(), getArgsArray());
  }
  
  public int update(Uri paramUri, ContentValues paramContentValues)
  {
    return Mechanoid.getContentResolver().update(paramUri, paramContentValues, toString(), getArgsArray());
  }
  
  public int update(Uri paramUri, ContentValues paramContentValues, boolean paramBoolean)
  {
    paramUri = paramUri.buildUpon().appendQueryParameter("mechdb_notify", String.valueOf(paramBoolean)).build();
    return Mechanoid.getContentResolver().update(paramUri, paramContentValues, toString(), getArgsArray());
  }
  
  public static final class Literal
  {
    protected final String value;
    
    public Literal(String paramString)
    {
      this.value = paramString;
    }
  }
  
  public static abstract interface Op
  {
    public static final String EQ = " = ";
    public static final String GT = " > ";
    public static final String GTEQ = " >= ";
    public static final String IS = " IS ";
    public static final String ISNOT = " IS NOT ";
    public static final String LIKE = " LIKE ";
    public static final String LT = " < ";
    public static final String LTEQ = " <= ";
    public static final String NEQ = " != ";
    public static final String REGEXP = " REGEXP ";
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/robotoworks/mechanoid/db/SQuery.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */