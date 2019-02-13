package android.support.v4.provider;

import android.content.Context;
import android.net.Uri;
import android.provider.DocumentsContract;

class DocumentsContractApi21
{
  private static final String TAG = "DocumentFile";
  
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
  
  public static Uri createDirectory(Context paramContext, Uri paramUri, String paramString)
  {
    return createFile(paramContext, paramUri, "vnd.android.document/directory", paramString);
  }
  
  public static Uri createFile(Context paramContext, Uri paramUri, String paramString1, String paramString2)
  {
    return DocumentsContract.createDocument(paramContext.getContentResolver(), paramUri, paramString1, paramString2);
  }
  
  /* Error */
  public static Uri[] listFiles(Context paramContext, Uri paramUri)
  {
    // Byte code:
    //   0: aload_0
    //   1: invokevirtual 38	android/content/Context:getContentResolver	()Landroid/content/ContentResolver;
    //   4: astore_2
    //   5: aload_1
    //   6: aload_1
    //   7: invokestatic 50	android/provider/DocumentsContract:getDocumentId	(Landroid/net/Uri;)Ljava/lang/String;
    //   10: invokestatic 54	android/provider/DocumentsContract:buildChildDocumentsUriUsingTree	(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;
    //   13: astore_3
    //   14: new 56	java/util/ArrayList
    //   17: dup
    //   18: invokespecial 57	java/util/ArrayList:<init>	()V
    //   21: astore 4
    //   23: aconst_null
    //   24: astore 5
    //   26: aconst_null
    //   27: astore_0
    //   28: aload_2
    //   29: aload_3
    //   30: iconst_1
    //   31: anewarray 59	java/lang/String
    //   34: dup
    //   35: iconst_0
    //   36: ldc 61
    //   38: aastore
    //   39: aconst_null
    //   40: aconst_null
    //   41: aconst_null
    //   42: invokevirtual 67	android/content/ContentResolver:query	(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   45: astore_2
    //   46: aload_2
    //   47: astore_0
    //   48: aload_2
    //   49: astore 5
    //   51: aload_2
    //   52: invokeinterface 73 1 0
    //   57: ifeq +86 -> 143
    //   60: aload_2
    //   61: astore_0
    //   62: aload_2
    //   63: astore 5
    //   65: aload 4
    //   67: aload_1
    //   68: aload_2
    //   69: iconst_0
    //   70: invokeinterface 77 2 0
    //   75: invokestatic 80	android/provider/DocumentsContract:buildDocumentUriUsingTree	(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;
    //   78: invokevirtual 84	java/util/ArrayList:add	(Ljava/lang/Object;)Z
    //   81: pop
    //   82: goto -36 -> 46
    //   85: astore_2
    //   86: aload_0
    //   87: astore 5
    //   89: new 86	java/lang/StringBuilder
    //   92: astore_1
    //   93: aload_0
    //   94: astore 5
    //   96: aload_1
    //   97: invokespecial 87	java/lang/StringBuilder:<init>	()V
    //   100: aload_0
    //   101: astore 5
    //   103: ldc 8
    //   105: aload_1
    //   106: ldc 89
    //   108: invokevirtual 93	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   111: aload_2
    //   112: invokevirtual 96	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   115: invokevirtual 100	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   118: invokestatic 106	android/util/Log:w	(Ljava/lang/String;Ljava/lang/String;)I
    //   121: pop
    //   122: aload_0
    //   123: invokestatic 108	android/support/v4/provider/DocumentsContractApi21:closeQuietly	(Ljava/lang/AutoCloseable;)V
    //   126: aload 4
    //   128: aload 4
    //   130: invokevirtual 112	java/util/ArrayList:size	()I
    //   133: anewarray 114	android/net/Uri
    //   136: invokevirtual 118	java/util/ArrayList:toArray	([Ljava/lang/Object;)[Ljava/lang/Object;
    //   139: checkcast 120	[Landroid/net/Uri;
    //   142: areturn
    //   143: aload_2
    //   144: invokestatic 108	android/support/v4/provider/DocumentsContractApi21:closeQuietly	(Ljava/lang/AutoCloseable;)V
    //   147: goto -21 -> 126
    //   150: astore_0
    //   151: aload 5
    //   153: invokestatic 108	android/support/v4/provider/DocumentsContractApi21:closeQuietly	(Ljava/lang/AutoCloseable;)V
    //   156: aload_0
    //   157: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	158	0	paramContext	Context
    //   0	158	1	paramUri	Uri
    //   4	65	2	localObject1	Object
    //   85	59	2	localException	Exception
    //   13	17	3	localUri	Uri
    //   21	108	4	localArrayList	java.util.ArrayList
    //   24	128	5	localObject2	Object
    // Exception table:
    //   from	to	target	type
    //   28	46	85	java/lang/Exception
    //   51	60	85	java/lang/Exception
    //   65	82	85	java/lang/Exception
    //   28	46	150	finally
    //   51	60	150	finally
    //   65	82	150	finally
    //   89	93	150	finally
    //   96	100	150	finally
    //   103	122	150	finally
  }
  
  public static Uri prepareTreeUri(Uri paramUri)
  {
    return DocumentsContract.buildDocumentUriUsingTree(paramUri, DocumentsContract.getTreeDocumentId(paramUri));
  }
  
  public static Uri renameTo(Context paramContext, Uri paramUri, String paramString)
  {
    return DocumentsContract.renameDocument(paramContext.getContentResolver(), paramUri, paramString);
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/android/support/v4/provider/DocumentsContractApi21.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */