package android.support.v4.provider;

import android.content.ContentResolver;
import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.provider.DocumentsContract;
import android.text.TextUtils;
import android.util.Log;

class DocumentsContractApi19
{
  private static final String TAG = "DocumentFile";
  
  public static boolean canRead(Context paramContext, Uri paramUri)
  {
    boolean bool = false;
    if (paramContext.checkCallingOrSelfUriPermission(paramUri, 1) != 0) {}
    for (;;)
    {
      return bool;
      if (!TextUtils.isEmpty(getRawType(paramContext, paramUri))) {
        bool = true;
      }
    }
  }
  
  public static boolean canWrite(Context paramContext, Uri paramUri)
  {
    boolean bool1 = false;
    boolean bool2;
    if (paramContext.checkCallingOrSelfUriPermission(paramUri, 2) != 0) {
      bool2 = bool1;
    }
    for (;;)
    {
      return bool2;
      String str = getRawType(paramContext, paramUri);
      int i = queryForInt(paramContext, paramUri, "flags", 0);
      bool2 = bool1;
      if (!TextUtils.isEmpty(str)) {
        if ((i & 0x4) != 0)
        {
          bool2 = true;
        }
        else if (("vnd.android.document/directory".equals(str)) && ((i & 0x8) != 0))
        {
          bool2 = true;
        }
        else
        {
          bool2 = bool1;
          if (!TextUtils.isEmpty(str))
          {
            bool2 = bool1;
            if ((i & 0x2) != 0) {
              bool2 = true;
            }
          }
        }
      }
    }
  }
  
  private static void closeQuietly(AutoCloseable paramAutoCloseable)
  {
    if (paramAutoCloseable != null) {}
    try
    {
      paramAutoCloseable.close();
      return;
    }
    catch (RuntimeException paramAutoCloseable)
    {
      throw paramAutoCloseable;
    }
    catch (Exception paramAutoCloseable)
    {
      for (;;) {}
    }
  }
  
  public static boolean delete(Context paramContext, Uri paramUri)
  {
    return DocumentsContract.deleteDocument(paramContext.getContentResolver(), paramUri);
  }
  
  public static boolean exists(Context paramContext, Uri paramUri)
  {
    ContentResolver localContentResolver = paramContext.getContentResolver();
    localObject = null;
    paramContext = null;
    for (;;)
    {
      try
      {
        paramUri = localContentResolver.query(paramUri, new String[] { "document_id" }, null, null, null);
        paramContext = paramUri;
        localObject = paramUri;
        int i = paramUri.getCount();
        if (i <= 0) {
          continue;
        }
        bool = true;
        closeQuietly(paramUri);
      }
      catch (Exception localException)
      {
        localObject = paramContext;
        paramUri = new java/lang/StringBuilder;
        localObject = paramContext;
        paramUri.<init>();
        localObject = paramContext;
        Log.w("DocumentFile", "Failed query: " + localException);
        closeQuietly(paramContext);
        boolean bool = false;
        continue;
      }
      finally
      {
        closeQuietly((AutoCloseable)localObject);
      }
      return bool;
      bool = false;
    }
  }
  
  public static String getName(Context paramContext, Uri paramUri)
  {
    return queryForString(paramContext, paramUri, "_display_name", null);
  }
  
  private static String getRawType(Context paramContext, Uri paramUri)
  {
    return queryForString(paramContext, paramUri, "mime_type", null);
  }
  
  public static String getType(Context paramContext, Uri paramUri)
  {
    paramUri = getRawType(paramContext, paramUri);
    paramContext = paramUri;
    if ("vnd.android.document/directory".equals(paramUri)) {
      paramContext = null;
    }
    return paramContext;
  }
  
  public static boolean isDirectory(Context paramContext, Uri paramUri)
  {
    return "vnd.android.document/directory".equals(getRawType(paramContext, paramUri));
  }
  
  public static boolean isDocumentUri(Context paramContext, Uri paramUri)
  {
    return DocumentsContract.isDocumentUri(paramContext, paramUri);
  }
  
  public static boolean isFile(Context paramContext, Uri paramUri)
  {
    paramContext = getRawType(paramContext, paramUri);
    if (("vnd.android.document/directory".equals(paramContext)) || (TextUtils.isEmpty(paramContext))) {}
    for (boolean bool = false;; bool = true) {
      return bool;
    }
  }
  
  public static long lastModified(Context paramContext, Uri paramUri)
  {
    return queryForLong(paramContext, paramUri, "last_modified", 0L);
  }
  
  public static long length(Context paramContext, Uri paramUri)
  {
    return queryForLong(paramContext, paramUri, "_size", 0L);
  }
  
  private static int queryForInt(Context paramContext, Uri paramUri, String paramString, int paramInt)
  {
    return (int)queryForLong(paramContext, paramUri, paramString, paramInt);
  }
  
  private static long queryForLong(Context paramContext, Uri paramUri, String paramString, long paramLong)
  {
    ContentResolver localContentResolver = paramContext.getContentResolver();
    paramContext = null;
    localUri = null;
    for (;;)
    {
      try
      {
        paramUri = localContentResolver.query(paramUri, new String[] { paramString }, null, null, null);
        localUri = paramUri;
        paramContext = paramUri;
        if (!paramUri.moveToFirst()) {
          continue;
        }
        localUri = paramUri;
        paramContext = paramUri;
        if (paramUri.isNull(0)) {
          continue;
        }
        localUri = paramUri;
        paramContext = paramUri;
        long l = paramUri.getLong(0);
        paramLong = l;
      }
      catch (Exception paramString)
      {
        paramContext = localUri;
        paramUri = new java/lang/StringBuilder;
        paramContext = localUri;
        paramUri.<init>();
        paramContext = localUri;
        Log.w("DocumentFile", "Failed query: " + paramString);
        closeQuietly(localUri);
        continue;
      }
      finally
      {
        closeQuietly(paramContext);
      }
      return paramLong;
      closeQuietly(paramUri);
    }
  }
  
  private static String queryForString(Context paramContext, Uri paramUri, String paramString1, String paramString2)
  {
    ContentResolver localContentResolver = paramContext.getContentResolver();
    paramContext = null;
    localUri = null;
    for (;;)
    {
      try
      {
        paramUri = localContentResolver.query(paramUri, new String[] { paramString1 }, null, null, null);
        localUri = paramUri;
        paramContext = paramUri;
        if (!paramUri.moveToFirst()) {
          continue;
        }
        localUri = paramUri;
        paramContext = paramUri;
        if (paramUri.isNull(0)) {
          continue;
        }
        localUri = paramUri;
        paramContext = paramUri;
        paramString1 = paramUri.getString(0);
        paramContext = paramString1;
      }
      catch (Exception paramUri)
      {
        paramContext = localUri;
        paramString1 = new java/lang/StringBuilder;
        paramContext = localUri;
        paramString1.<init>();
        paramContext = localUri;
        Log.w("DocumentFile", "Failed query: " + paramUri);
        closeQuietly(localUri);
        paramContext = paramString2;
        continue;
      }
      finally
      {
        closeQuietly(paramContext);
      }
      return paramContext;
      closeQuietly(paramUri);
      paramContext = paramString2;
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/android/support/v4/provider/DocumentsContractApi19.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */