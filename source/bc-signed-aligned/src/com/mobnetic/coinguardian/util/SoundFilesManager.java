package com.mobnetic.coinguardian.util;

import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.os.Environment;
import android.provider.MediaStore.Audio.Media;
import java.io.File;

public class SoundFilesManager
{
  public static final String BITCOIN_CHECKER_DOWN_ALERT_FILENAME = "bitcoin_checker_down_alert";
  public static final String BITCOIN_CHECKER_UP_CHEERS_FILENAME = "bitcoin_checker_up_cheers";
  
  private static Uri checkRingtoneUri(Context paramContext, Uri paramUri, String paramString)
  {
    Object localObject1 = null;
    Object localObject2 = null;
    paramContext = paramContext.getContentResolver();
    paramString = "_data='" + paramString + "'";
    paramString = paramContext.query(paramUri, new String[] { "_id" }, paramString, null, null);
    paramContext = (Context)localObject1;
    if (paramString != null)
    {
      paramContext = (Context)localObject2;
      if (paramString.moveToFirst()) {
        paramContext = Uri.withAppendedPath(paramUri, String.valueOf(paramString.getInt(0)));
      }
      paramString.close();
    }
    return paramContext;
  }
  
  /* Error */
  private static File copyRingtoneFromResources(Context paramContext, String paramString)
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore_2
    //   2: aconst_null
    //   3: astore_3
    //   4: aconst_null
    //   5: astore 4
    //   7: aconst_null
    //   8: astore 5
    //   10: aload_3
    //   11: astore 6
    //   13: aload 4
    //   15: astore 7
    //   17: aload_2
    //   18: astore 8
    //   20: invokestatic 82	com/mobnetic/coinguardian/util/SoundFilesManager:getRingtonesDir	()Ljava/io/File;
    //   23: astore 9
    //   25: aload_3
    //   26: astore 6
    //   28: aload 4
    //   30: astore 7
    //   32: aload_2
    //   33: astore 8
    //   35: aload 9
    //   37: invokevirtual 87	java/io/File:exists	()Z
    //   40: ifne +19 -> 59
    //   43: aload_3
    //   44: astore 6
    //   46: aload 4
    //   48: astore 7
    //   50: aload_2
    //   51: astore 8
    //   53: aload 9
    //   55: invokevirtual 90	java/io/File:mkdirs	()Z
    //   58: pop
    //   59: aload_3
    //   60: astore 6
    //   62: aload 4
    //   64: astore 7
    //   66: aload_2
    //   67: astore 8
    //   69: aload 9
    //   71: aload_1
    //   72: invokestatic 94	com/mobnetic/coinguardian/util/SoundFilesManager:getRingtonePath	(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;
    //   75: astore 9
    //   77: aload_3
    //   78: astore 6
    //   80: aload 4
    //   82: astore 7
    //   84: aload_2
    //   85: astore 8
    //   87: aload 9
    //   89: invokevirtual 87	java/io/File:exists	()Z
    //   92: istore 10
    //   94: iload 10
    //   96: ifeq +51 -> 147
    //   99: iconst_0
    //   100: ifeq +11 -> 111
    //   103: new 96	java/lang/NullPointerException
    //   106: dup
    //   107: invokespecial 97	java/lang/NullPointerException:<init>	()V
    //   110: athrow
    //   111: aload 9
    //   113: astore_0
    //   114: iconst_0
    //   115: ifeq +11 -> 126
    //   118: new 96	java/lang/NullPointerException
    //   121: dup
    //   122: invokespecial 97	java/lang/NullPointerException:<init>	()V
    //   125: athrow
    //   126: aload_0
    //   127: areturn
    //   128: astore_0
    //   129: aload_0
    //   130: invokevirtual 100	java/io/IOException:printStackTrace	()V
    //   133: goto -22 -> 111
    //   136: astore_0
    //   137: aload_0
    //   138: invokevirtual 100	java/io/IOException:printStackTrace	()V
    //   141: aload 9
    //   143: astore_0
    //   144: goto -18 -> 126
    //   147: aload_3
    //   148: astore 6
    //   150: aload 4
    //   152: astore 7
    //   154: aload_2
    //   155: astore 8
    //   157: new 26	java/lang/StringBuilder
    //   160: astore 11
    //   162: aload_3
    //   163: astore 6
    //   165: aload 4
    //   167: astore 7
    //   169: aload_2
    //   170: astore 8
    //   172: aload 11
    //   174: invokespecial 27	java/lang/StringBuilder:<init>	()V
    //   177: aload_3
    //   178: astore 6
    //   180: aload 4
    //   182: astore 7
    //   184: aload_2
    //   185: astore 8
    //   187: aload 11
    //   189: ldc 102
    //   191: invokevirtual 33	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   194: aload_0
    //   195: invokevirtual 105	android/content/Context:getPackageName	()Ljava/lang/String;
    //   198: invokevirtual 33	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   201: ldc 107
    //   203: invokevirtual 33	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   206: aload_1
    //   207: invokevirtual 33	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   210: invokevirtual 39	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   213: invokestatic 111	android/net/Uri:parse	(Ljava/lang/String;)Landroid/net/Uri;
    //   216: astore_1
    //   217: aload_3
    //   218: astore 6
    //   220: aload 4
    //   222: astore 7
    //   224: aload_2
    //   225: astore 8
    //   227: aload_0
    //   228: invokevirtual 24	android/content/Context:getContentResolver	()Landroid/content/ContentResolver;
    //   231: aload_1
    //   232: ldc 113
    //   234: invokevirtual 117	android/content/ContentResolver:openAssetFileDescriptor	(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;
    //   237: invokevirtual 123	android/content/res/AssetFileDescriptor:createInputStream	()Ljava/io/FileInputStream;
    //   240: astore_0
    //   241: aload_0
    //   242: ifnonnull +44 -> 286
    //   245: iconst_0
    //   246: ifeq +11 -> 257
    //   249: new 96	java/lang/NullPointerException
    //   252: dup
    //   253: invokespecial 97	java/lang/NullPointerException:<init>	()V
    //   256: athrow
    //   257: aload_0
    //   258: ifnull +7 -> 265
    //   261: aload_0
    //   262: invokevirtual 126	java/io/InputStream:close	()V
    //   265: aconst_null
    //   266: astore_0
    //   267: goto -141 -> 126
    //   270: astore_1
    //   271: aload_1
    //   272: invokevirtual 100	java/io/IOException:printStackTrace	()V
    //   275: goto -18 -> 257
    //   278: astore_0
    //   279: aload_0
    //   280: invokevirtual 100	java/io/IOException:printStackTrace	()V
    //   283: goto -18 -> 265
    //   286: aload_0
    //   287: astore 6
    //   289: aload 4
    //   291: astore 7
    //   293: aload_0
    //   294: astore 8
    //   296: new 128	java/io/FileOutputStream
    //   299: astore_1
    //   300: aload_0
    //   301: astore 6
    //   303: aload 4
    //   305: astore 7
    //   307: aload_0
    //   308: astore 8
    //   310: aload_1
    //   311: aload 9
    //   313: invokespecial 131	java/io/FileOutputStream:<init>	(Ljava/io/File;)V
    //   316: sipush 1024
    //   319: newarray <illegal type>
    //   321: astore 6
    //   323: aload_0
    //   324: aload 6
    //   326: invokevirtual 135	java/io/InputStream:read	([B)I
    //   329: istore 12
    //   331: iload 12
    //   333: ifle +49 -> 382
    //   336: aload_1
    //   337: aload 6
    //   339: iconst_0
    //   340: iload 12
    //   342: invokevirtual 141	java/io/OutputStream:write	([BII)V
    //   345: goto -22 -> 323
    //   348: astore 9
    //   350: aload_0
    //   351: astore 6
    //   353: aload_1
    //   354: astore 7
    //   356: aload 9
    //   358: invokevirtual 142	java/lang/Exception:printStackTrace	()V
    //   361: aload_1
    //   362: ifnull +7 -> 369
    //   365: aload_1
    //   366: invokevirtual 143	java/io/OutputStream:close	()V
    //   369: aload_0
    //   370: ifnull +7 -> 377
    //   373: aload_0
    //   374: invokevirtual 126	java/io/InputStream:close	()V
    //   377: aconst_null
    //   378: astore_0
    //   379: goto -253 -> 126
    //   382: aload_1
    //   383: ifnull +7 -> 390
    //   386: aload_1
    //   387: invokevirtual 143	java/io/OutputStream:close	()V
    //   390: aload_0
    //   391: ifnull +7 -> 398
    //   394: aload_0
    //   395: invokevirtual 126	java/io/InputStream:close	()V
    //   398: aload 9
    //   400: astore_0
    //   401: goto -275 -> 126
    //   404: astore_1
    //   405: aload_1
    //   406: invokevirtual 100	java/io/IOException:printStackTrace	()V
    //   409: goto -19 -> 390
    //   412: astore_0
    //   413: aload_0
    //   414: invokevirtual 100	java/io/IOException:printStackTrace	()V
    //   417: goto -19 -> 398
    //   420: astore_1
    //   421: aload_1
    //   422: invokevirtual 100	java/io/IOException:printStackTrace	()V
    //   425: goto -56 -> 369
    //   428: astore_0
    //   429: aload_0
    //   430: invokevirtual 100	java/io/IOException:printStackTrace	()V
    //   433: goto -56 -> 377
    //   436: astore_0
    //   437: aload 7
    //   439: astore_1
    //   440: aload_1
    //   441: ifnull +7 -> 448
    //   444: aload_1
    //   445: invokevirtual 143	java/io/OutputStream:close	()V
    //   448: aload 6
    //   450: ifnull +8 -> 458
    //   453: aload 6
    //   455: invokevirtual 126	java/io/InputStream:close	()V
    //   458: aload_0
    //   459: athrow
    //   460: astore_1
    //   461: aload_1
    //   462: invokevirtual 100	java/io/IOException:printStackTrace	()V
    //   465: goto -17 -> 448
    //   468: astore_1
    //   469: aload_1
    //   470: invokevirtual 100	java/io/IOException:printStackTrace	()V
    //   473: goto -15 -> 458
    //   476: astore 7
    //   478: aload_0
    //   479: astore 6
    //   481: aload 7
    //   483: astore_0
    //   484: goto -44 -> 440
    //   487: astore 9
    //   489: aload 8
    //   491: astore_0
    //   492: aload 5
    //   494: astore_1
    //   495: goto -145 -> 350
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	498	0	paramContext	Context
    //   0	498	1	paramString	String
    //   1	224	2	localObject1	Object
    //   3	215	3	localObject2	Object
    //   5	299	4	localObject3	Object
    //   8	485	5	localObject4	Object
    //   11	469	6	localObject5	Object
    //   15	423	7	localObject6	Object
    //   476	6	7	localObject7	Object
    //   18	472	8	localObject8	Object
    //   23	289	9	localFile	File
    //   348	51	9	localException1	Exception
    //   487	1	9	localException2	Exception
    //   92	3	10	bool	boolean
    //   160	28	11	localStringBuilder	StringBuilder
    //   329	12	12	i	int
    // Exception table:
    //   from	to	target	type
    //   103	111	128	java/io/IOException
    //   118	126	136	java/io/IOException
    //   249	257	270	java/io/IOException
    //   261	265	278	java/io/IOException
    //   316	323	348	java/lang/Exception
    //   323	331	348	java/lang/Exception
    //   336	345	348	java/lang/Exception
    //   386	390	404	java/io/IOException
    //   394	398	412	java/io/IOException
    //   365	369	420	java/io/IOException
    //   373	377	428	java/io/IOException
    //   20	25	436	finally
    //   35	43	436	finally
    //   53	59	436	finally
    //   69	77	436	finally
    //   87	94	436	finally
    //   157	162	436	finally
    //   172	177	436	finally
    //   187	217	436	finally
    //   227	241	436	finally
    //   296	300	436	finally
    //   310	316	436	finally
    //   356	361	436	finally
    //   444	448	460	java/io/IOException
    //   453	458	468	java/io/IOException
    //   316	323	476	finally
    //   323	331	476	finally
    //   336	345	476	finally
    //   20	25	487	java/lang/Exception
    //   35	43	487	java/lang/Exception
    //   53	59	487	java/lang/Exception
    //   69	77	487	java/lang/Exception
    //   87	94	487	java/lang/Exception
    //   157	162	487	java/lang/Exception
    //   172	177	487	java/lang/Exception
    //   187	217	487	java/lang/Exception
    //   227	241	487	java/lang/Exception
    //   296	300	487	java/lang/Exception
    //   310	316	487	java/lang/Exception
  }
  
  private static ContentValues createRingtoneDatabaseEntry(File paramFile, String paramString)
  {
    ContentValues localContentValues = new ContentValues();
    localContentValues.put("_data", paramFile.getAbsolutePath());
    localContentValues.put("title", paramString);
    localContentValues.put("_size", Long.valueOf(paramFile.length()));
    localContentValues.put("mime_type", "audio/mp3");
    localContentValues.put("is_ringtone", Boolean.valueOf(false));
    localContentValues.put("is_notification", Boolean.valueOf(true));
    localContentValues.put("is_alarm", Boolean.valueOf(false));
    localContentValues.put("is_music", Boolean.valueOf(false));
    return localContentValues;
  }
  
  private static File getRingtonePath(File paramFile, String paramString)
  {
    return new File(paramFile, paramString + ".mp3");
  }
  
  private static File getRingtonesDir()
  {
    return new File(Environment.getExternalStorageDirectory().getAbsolutePath() + "/media/audio/notifications");
  }
  
  public static Uri getUriForRingtone(Context paramContext, String paramString)
  {
    paramString = getRingtonePath(getRingtonesDir(), paramString).getAbsoluteFile();
    return checkRingtoneUri(paramContext, MediaStore.Audio.Media.getContentUriForPath(paramString.getAbsolutePath()), paramString.getAbsolutePath());
  }
  
  private static void installRingtoneFileIfNeeded(Context paramContext, String paramString1, String paramString2)
  {
    paramString1 = copyRingtoneFromResources(paramContext, paramString1);
    Uri localUri;
    if (paramString1 != null)
    {
      localUri = MediaStore.Audio.Media.getContentUriForPath(paramString1.getAbsolutePath());
      if (checkRingtoneUri(paramContext, localUri, paramString1.getAbsolutePath()) != null) {}
    }
    try
    {
      paramContext.getContentResolver().insert(localUri, createRingtoneDatabaseEntry(paramString1, paramString2));
      return;
    }
    catch (Exception paramContext)
    {
      for (;;)
      {
        paramContext.printStackTrace();
      }
    }
  }
  
  public static void installRingtonesIfNeeded(Context paramContext)
  {
    installRingtoneFileIfNeeded(paramContext, "bitcoin_checker_up_cheers", "Bitcoin Checker Up Cheers");
    installRingtoneFileIfNeeded(paramContext, "bitcoin_checker_down_alert", "Bitcoin Checker Down Alert");
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/util/SoundFilesManager.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */