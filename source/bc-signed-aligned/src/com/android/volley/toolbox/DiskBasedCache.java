package com.android.volley.toolbox;

import android.os.SystemClock;
import com.android.volley.Cache;
import com.android.volley.Cache.Entry;
import com.android.volley.VolleyLog;
import java.io.EOFException;
import java.io.File;
import java.io.FilterInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

public class DiskBasedCache
  implements Cache
{
  private static final int CACHE_MAGIC = 538051844;
  private static final int DEFAULT_DISK_USAGE_BYTES = 5242880;
  private static final float HYSTERESIS_FACTOR = 0.9F;
  private final Map<String, CacheHeader> mEntries = new LinkedHashMap(16, 0.75F, true);
  private final int mMaxCacheSizeInBytes;
  private final File mRootDirectory;
  private long mTotalSize = 0L;
  
  public DiskBasedCache(File paramFile)
  {
    this(paramFile, 5242880);
  }
  
  public DiskBasedCache(File paramFile, int paramInt)
  {
    this.mRootDirectory = paramFile;
    this.mMaxCacheSizeInBytes = paramInt;
  }
  
  private String getFilenameForKey(String paramString)
  {
    int i = paramString.length() / 2;
    return String.valueOf(paramString.substring(0, i).hashCode()) + String.valueOf(paramString.substring(i).hashCode());
  }
  
  private void pruneIfNeeded(int paramInt)
  {
    if (this.mTotalSize + paramInt < this.mMaxCacheSizeInBytes) {}
    int i;
    Iterator localIterator;
    for (;;)
    {
      return;
      if (VolleyLog.DEBUG) {
        VolleyLog.v("Pruning old cache entries.", new Object[0]);
      }
      long l1 = this.mTotalSize;
      i = 0;
      long l2 = SystemClock.elapsedRealtime();
      localIterator = this.mEntries.entrySet().iterator();
      label61:
      if (localIterator.hasNext()) {
        break;
      }
      label71:
      if (!VolleyLog.DEBUG) {
        break label212;
      }
      VolleyLog.v("pruned %d files, %d bytes, %d ms", new Object[] { Integer.valueOf(i), Long.valueOf(this.mTotalSize - l1), Long.valueOf(SystemClock.elapsedRealtime() - l2) });
    }
    CacheHeader localCacheHeader = (CacheHeader)((Map.Entry)localIterator.next()).getValue();
    if (getFileForKey(localCacheHeader.key).delete()) {
      this.mTotalSize -= localCacheHeader.size;
    }
    for (;;)
    {
      localIterator.remove();
      int j = i + 1;
      i = j;
      if ((float)(this.mTotalSize + paramInt) >= this.mMaxCacheSizeInBytes * 0.9F) {
        break label61;
      }
      i = j;
      break label71;
      label212:
      break;
      VolleyLog.d("Could not delete cache entry for key=%s, filename=%s", new Object[] { localCacheHeader.key, getFilenameForKey(localCacheHeader.key) });
    }
  }
  
  private void putEntry(String paramString, CacheHeader paramCacheHeader)
  {
    if (!this.mEntries.containsKey(paramString)) {}
    CacheHeader localCacheHeader;
    for (this.mTotalSize += paramCacheHeader.size;; this.mTotalSize += paramCacheHeader.size - localCacheHeader.size)
    {
      this.mEntries.put(paramString, paramCacheHeader);
      return;
      localCacheHeader = (CacheHeader)this.mEntries.get(paramString);
    }
  }
  
  private static int read(InputStream paramInputStream)
    throws IOException
  {
    int i = paramInputStream.read();
    if (i == -1) {
      throw new EOFException();
    }
    return i;
  }
  
  static int readInt(InputStream paramInputStream)
    throws IOException
  {
    return 0x0 | read(paramInputStream) << 0 | read(paramInputStream) << 8 | read(paramInputStream) << 16 | read(paramInputStream) << 24;
  }
  
  static long readLong(InputStream paramInputStream)
    throws IOException
  {
    return 0L | (read(paramInputStream) & 0xFF) << 0 | (read(paramInputStream) & 0xFF) << 8 | (read(paramInputStream) & 0xFF) << 16 | (read(paramInputStream) & 0xFF) << 24 | (read(paramInputStream) & 0xFF) << 32 | (read(paramInputStream) & 0xFF) << 40 | (read(paramInputStream) & 0xFF) << 48 | (read(paramInputStream) & 0xFF) << 56;
  }
  
  static String readString(InputStream paramInputStream)
    throws IOException
  {
    return new String(streamToBytes(paramInputStream, (int)readLong(paramInputStream)), "UTF-8");
  }
  
  static Map<String, String> readStringStringMap(InputStream paramInputStream)
    throws IOException
  {
    int i = readInt(paramInputStream);
    Object localObject;
    if (i == 0) {
      localObject = Collections.emptyMap();
    }
    for (int j = 0;; j++)
    {
      if (j >= i)
      {
        return (Map<String, String>)localObject;
        localObject = new HashMap(i);
        break;
      }
      ((Map)localObject).put(readString(paramInputStream).intern(), readString(paramInputStream).intern());
    }
  }
  
  private void removeEntry(String paramString)
  {
    CacheHeader localCacheHeader = (CacheHeader)this.mEntries.get(paramString);
    if (localCacheHeader != null)
    {
      this.mTotalSize -= localCacheHeader.size;
      this.mEntries.remove(paramString);
    }
  }
  
  private static byte[] streamToBytes(InputStream paramInputStream, int paramInt)
    throws IOException
  {
    byte[] arrayOfByte = new byte[paramInt];
    int i = 0;
    for (;;)
    {
      int j;
      if (i < paramInt)
      {
        j = paramInputStream.read(arrayOfByte, i, paramInt - i);
        if (j != -1) {}
      }
      else
      {
        if (i == paramInt) {
          break;
        }
        throw new IOException("Expected " + paramInt + " bytes, read " + i + " bytes");
      }
      i += j;
    }
    return arrayOfByte;
  }
  
  static void writeInt(OutputStream paramOutputStream, int paramInt)
    throws IOException
  {
    paramOutputStream.write(paramInt >> 0 & 0xFF);
    paramOutputStream.write(paramInt >> 8 & 0xFF);
    paramOutputStream.write(paramInt >> 16 & 0xFF);
    paramOutputStream.write(paramInt >> 24 & 0xFF);
  }
  
  static void writeLong(OutputStream paramOutputStream, long paramLong)
    throws IOException
  {
    paramOutputStream.write((byte)(int)(paramLong >>> 0));
    paramOutputStream.write((byte)(int)(paramLong >>> 8));
    paramOutputStream.write((byte)(int)(paramLong >>> 16));
    paramOutputStream.write((byte)(int)(paramLong >>> 24));
    paramOutputStream.write((byte)(int)(paramLong >>> 32));
    paramOutputStream.write((byte)(int)(paramLong >>> 40));
    paramOutputStream.write((byte)(int)(paramLong >>> 48));
    paramOutputStream.write((byte)(int)(paramLong >>> 56));
  }
  
  static void writeString(OutputStream paramOutputStream, String paramString)
    throws IOException
  {
    paramString = paramString.getBytes("UTF-8");
    writeLong(paramOutputStream, paramString.length);
    paramOutputStream.write(paramString, 0, paramString.length);
  }
  
  static void writeStringStringMap(Map<String, String> paramMap, OutputStream paramOutputStream)
    throws IOException
  {
    if (paramMap != null)
    {
      writeInt(paramOutputStream, paramMap.size());
      paramMap = paramMap.entrySet().iterator();
      if (paramMap.hasNext()) {}
    }
    for (;;)
    {
      return;
      Map.Entry localEntry = (Map.Entry)paramMap.next();
      writeString(paramOutputStream, (String)localEntry.getKey());
      writeString(paramOutputStream, (String)localEntry.getValue());
      break;
      writeInt(paramOutputStream, 0);
    }
  }
  
  /* Error */
  public void clear()
  {
    // Byte code:
    //   0: iconst_0
    //   1: istore_1
    //   2: aload_0
    //   3: monitorenter
    //   4: aload_0
    //   5: getfield 49	com/android/volley/toolbox/DiskBasedCache:mRootDirectory	Ljava/io/File;
    //   8: invokevirtual 293	java/io/File:listFiles	()[Ljava/io/File;
    //   11: astore_2
    //   12: aload_2
    //   13: ifnull +11 -> 24
    //   16: aload_2
    //   17: arraylength
    //   18: istore_3
    //   19: iload_1
    //   20: iload_3
    //   21: if_icmplt +30 -> 51
    //   24: aload_0
    //   25: getfield 45	com/android/volley/toolbox/DiskBasedCache:mEntries	Ljava/util/Map;
    //   28: invokeinterface 295 1 0
    //   33: aload_0
    //   34: lconst_0
    //   35: putfield 47	com/android/volley/toolbox/DiskBasedCache:mTotalSize	J
    //   38: ldc_w 297
    //   41: iconst_0
    //   42: anewarray 4	java/lang/Object
    //   45: invokestatic 173	com/android/volley/VolleyLog:d	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   48: aload_0
    //   49: monitorexit
    //   50: return
    //   51: aload_2
    //   52: iload_1
    //   53: aaload
    //   54: invokevirtual 160	java/io/File:delete	()Z
    //   57: pop
    //   58: iinc 1 1
    //   61: goto -42 -> 19
    //   64: astore_2
    //   65: aload_0
    //   66: monitorexit
    //   67: aload_2
    //   68: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	69	0	this	DiskBasedCache
    //   1	58	1	i	int
    //   11	41	2	arrayOfFile	File[]
    //   64	4	2	localObject	Object
    //   18	4	3	j	int
    // Exception table:
    //   from	to	target	type
    //   4	12	64	finally
    //   16	19	64	finally
    //   24	48	64	finally
    //   51	58	64	finally
  }
  
  /* Error */
  public Cache.Entry get(String paramString)
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore_2
    //   2: aload_0
    //   3: monitorenter
    //   4: aload_0
    //   5: getfield 45	com/android/volley/toolbox/DiskBasedCache:mEntries	Ljava/util/Map;
    //   8: aload_1
    //   9: invokeinterface 187 2 0
    //   14: checkcast 8	com/android/volley/toolbox/DiskBasedCache$CacheHeader
    //   17: astore_3
    //   18: aload_3
    //   19: ifnonnull +9 -> 28
    //   22: aload_2
    //   23: astore_1
    //   24: aload_0
    //   25: monitorexit
    //   26: aload_1
    //   27: areturn
    //   28: aload_0
    //   29: aload_1
    //   30: invokevirtual 155	com/android/volley/toolbox/DiskBasedCache:getFileForKey	(Ljava/lang/String;)Ljava/io/File;
    //   33: astore 4
    //   35: aconst_null
    //   36: astore 5
    //   38: aconst_null
    //   39: astore 6
    //   41: aload 5
    //   43: astore 7
    //   45: new 11	com/android/volley/toolbox/DiskBasedCache$CountingInputStream
    //   48: astore 8
    //   50: aload 5
    //   52: astore 7
    //   54: new 300	java/io/FileInputStream
    //   57: astore 9
    //   59: aload 5
    //   61: astore 7
    //   63: aload 9
    //   65: aload 4
    //   67: invokespecial 302	java/io/FileInputStream:<init>	(Ljava/io/File;)V
    //   70: aload 5
    //   72: astore 7
    //   74: aload 8
    //   76: aload 9
    //   78: aconst_null
    //   79: invokespecial 305	com/android/volley/toolbox/DiskBasedCache$CountingInputStream:<init>	(Ljava/io/InputStream;Lcom/android/volley/toolbox/DiskBasedCache$CountingInputStream;)V
    //   82: aload 8
    //   84: invokestatic 309	com/android/volley/toolbox/DiskBasedCache$CacheHeader:readHeader	(Ljava/io/InputStream;)Lcom/android/volley/toolbox/DiskBasedCache$CacheHeader;
    //   87: pop
    //   88: aload_3
    //   89: aload 8
    //   91: aload 4
    //   93: invokevirtual 311	java/io/File:length	()J
    //   96: aload 8
    //   98: invokestatic 315	com/android/volley/toolbox/DiskBasedCache$CountingInputStream:access$1	(Lcom/android/volley/toolbox/DiskBasedCache$CountingInputStream;)I
    //   101: i2l
    //   102: lsub
    //   103: l2i
    //   104: invokestatic 214	com/android/volley/toolbox/DiskBasedCache:streamToBytes	(Ljava/io/InputStream;I)[B
    //   107: invokevirtual 319	com/android/volley/toolbox/DiskBasedCache$CacheHeader:toCacheEntry	([B)Lcom/android/volley/Cache$Entry;
    //   110: astore 7
    //   112: aload 8
    //   114: ifnull +8 -> 122
    //   117: aload 8
    //   119: invokevirtual 322	com/android/volley/toolbox/DiskBasedCache$CountingInputStream:close	()V
    //   122: aload 7
    //   124: astore_1
    //   125: goto -101 -> 24
    //   128: astore_1
    //   129: aload_2
    //   130: astore_1
    //   131: goto -107 -> 24
    //   134: astore 5
    //   136: aload 6
    //   138: astore 8
    //   140: aload 8
    //   142: astore 7
    //   144: ldc_w 324
    //   147: iconst_2
    //   148: anewarray 4	java/lang/Object
    //   151: dup
    //   152: iconst_0
    //   153: aload 4
    //   155: invokevirtual 327	java/io/File:getAbsolutePath	()Ljava/lang/String;
    //   158: aastore
    //   159: dup
    //   160: iconst_1
    //   161: aload 5
    //   163: invokevirtual 328	java/io/IOException:toString	()Ljava/lang/String;
    //   166: aastore
    //   167: invokestatic 173	com/android/volley/VolleyLog:d	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   170: aload 8
    //   172: astore 7
    //   174: aload_0
    //   175: aload_1
    //   176: invokevirtual 330	com/android/volley/toolbox/DiskBasedCache:remove	(Ljava/lang/String;)V
    //   179: aload_2
    //   180: astore_1
    //   181: aload 8
    //   183: ifnull -159 -> 24
    //   186: aload 8
    //   188: invokevirtual 322	com/android/volley/toolbox/DiskBasedCache$CountingInputStream:close	()V
    //   191: aload_2
    //   192: astore_1
    //   193: goto -169 -> 24
    //   196: astore_1
    //   197: aload_2
    //   198: astore_1
    //   199: goto -175 -> 24
    //   202: astore_1
    //   203: aload 7
    //   205: ifnull +8 -> 213
    //   208: aload 7
    //   210: invokevirtual 322	com/android/volley/toolbox/DiskBasedCache$CountingInputStream:close	()V
    //   213: aload_1
    //   214: athrow
    //   215: astore_1
    //   216: aload_0
    //   217: monitorexit
    //   218: aload_1
    //   219: athrow
    //   220: astore_1
    //   221: aload_2
    //   222: astore_1
    //   223: goto -199 -> 24
    //   226: astore_1
    //   227: aload 8
    //   229: astore 7
    //   231: goto -28 -> 203
    //   234: astore 7
    //   236: aload 7
    //   238: astore 5
    //   240: goto -100 -> 140
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	243	0	this	DiskBasedCache
    //   0	243	1	paramString	String
    //   1	221	2	localObject1	Object
    //   17	72	3	localCacheHeader	CacheHeader
    //   33	121	4	localFile	File
    //   36	35	5	localObject2	Object
    //   134	28	5	localIOException1	IOException
    //   238	1	5	localObject3	Object
    //   39	98	6	localObject4	Object
    //   43	187	7	localObject5	Object
    //   234	3	7	localIOException2	IOException
    //   48	180	8	localObject6	Object
    //   57	20	9	localFileInputStream	java.io.FileInputStream
    // Exception table:
    //   from	to	target	type
    //   117	122	128	java/io/IOException
    //   45	50	134	java/io/IOException
    //   54	59	134	java/io/IOException
    //   63	70	134	java/io/IOException
    //   74	82	134	java/io/IOException
    //   186	191	196	java/io/IOException
    //   45	50	202	finally
    //   54	59	202	finally
    //   63	70	202	finally
    //   74	82	202	finally
    //   144	170	202	finally
    //   174	179	202	finally
    //   4	18	215	finally
    //   28	35	215	finally
    //   117	122	215	finally
    //   186	191	215	finally
    //   208	213	215	finally
    //   213	215	215	finally
    //   208	213	220	java/io/IOException
    //   82	112	226	finally
    //   82	112	234	java/io/IOException
  }
  
  public File getFileForKey(String paramString)
  {
    return new File(this.mRootDirectory, getFilenameForKey(paramString));
  }
  
  /* Error */
  public void initialize()
  {
    // Byte code:
    //   0: iconst_0
    //   1: istore_1
    //   2: aload_0
    //   3: monitorenter
    //   4: aload_0
    //   5: getfield 49	com/android/volley/toolbox/DiskBasedCache:mRootDirectory	Ljava/io/File;
    //   8: invokevirtual 337	java/io/File:exists	()Z
    //   11: ifne +36 -> 47
    //   14: aload_0
    //   15: getfield 49	com/android/volley/toolbox/DiskBasedCache:mRootDirectory	Ljava/io/File;
    //   18: invokevirtual 340	java/io/File:mkdirs	()Z
    //   21: ifne +23 -> 44
    //   24: ldc_w 342
    //   27: iconst_1
    //   28: anewarray 4	java/lang/Object
    //   31: dup
    //   32: iconst_0
    //   33: aload_0
    //   34: getfield 49	com/android/volley/toolbox/DiskBasedCache:mRootDirectory	Ljava/io/File;
    //   37: invokevirtual 327	java/io/File:getAbsolutePath	()Ljava/lang/String;
    //   40: aastore
    //   41: invokestatic 345	com/android/volley/VolleyLog:e	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   44: aload_0
    //   45: monitorexit
    //   46: return
    //   47: aload_0
    //   48: getfield 49	com/android/volley/toolbox/DiskBasedCache:mRootDirectory	Ljava/io/File;
    //   51: invokevirtual 293	java/io/File:listFiles	()[Ljava/io/File;
    //   54: astore_2
    //   55: aload_2
    //   56: ifnull -12 -> 44
    //   59: aload_2
    //   60: arraylength
    //   61: istore_3
    //   62: iload_1
    //   63: iload_3
    //   64: if_icmpge -20 -> 44
    //   67: aload_2
    //   68: iload_1
    //   69: aaload
    //   70: astore 4
    //   72: aconst_null
    //   73: astore 5
    //   75: aconst_null
    //   76: astore 6
    //   78: aload 5
    //   80: astore 7
    //   82: new 300	java/io/FileInputStream
    //   85: astore 8
    //   87: aload 5
    //   89: astore 7
    //   91: aload 8
    //   93: aload 4
    //   95: invokespecial 302	java/io/FileInputStream:<init>	(Ljava/io/File;)V
    //   98: aload 8
    //   100: invokestatic 309	com/android/volley/toolbox/DiskBasedCache$CacheHeader:readHeader	(Ljava/io/InputStream;)Lcom/android/volley/toolbox/DiskBasedCache$CacheHeader;
    //   103: astore 7
    //   105: aload 7
    //   107: aload 4
    //   109: invokevirtual 311	java/io/File:length	()J
    //   112: putfield 163	com/android/volley/toolbox/DiskBasedCache$CacheHeader:size	J
    //   115: aload_0
    //   116: aload 7
    //   118: getfield 151	com/android/volley/toolbox/DiskBasedCache$CacheHeader:key	Ljava/lang/String;
    //   121: aload 7
    //   123: invokespecial 347	com/android/volley/toolbox/DiskBasedCache:putEntry	(Ljava/lang/String;Lcom/android/volley/toolbox/DiskBasedCache$CacheHeader;)V
    //   126: aload 8
    //   128: ifnull +107 -> 235
    //   131: aload 8
    //   133: invokevirtual 348	java/io/FileInputStream:close	()V
    //   136: iinc 1 1
    //   139: goto -77 -> 62
    //   142: astore 7
    //   144: aload 6
    //   146: astore 8
    //   148: aload 4
    //   150: ifnull +13 -> 163
    //   153: aload 8
    //   155: astore 7
    //   157: aload 4
    //   159: invokevirtual 160	java/io/File:delete	()Z
    //   162: pop
    //   163: aload 8
    //   165: ifnull -29 -> 136
    //   168: aload 8
    //   170: invokevirtual 348	java/io/FileInputStream:close	()V
    //   173: goto -37 -> 136
    //   176: astore 7
    //   178: goto -42 -> 136
    //   181: astore 8
    //   183: aload 7
    //   185: astore 6
    //   187: aload 6
    //   189: ifnull +8 -> 197
    //   192: aload 6
    //   194: invokevirtual 348	java/io/FileInputStream:close	()V
    //   197: aload 8
    //   199: athrow
    //   200: astore 7
    //   202: aload_0
    //   203: monitorexit
    //   204: aload 7
    //   206: athrow
    //   207: astore 7
    //   209: goto -73 -> 136
    //   212: astore 7
    //   214: goto -17 -> 197
    //   217: astore 7
    //   219: aload 8
    //   221: astore 6
    //   223: aload 7
    //   225: astore 8
    //   227: goto -40 -> 187
    //   230: astore 7
    //   232: goto -84 -> 148
    //   235: goto -99 -> 136
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	238	0	this	DiskBasedCache
    //   1	136	1	i	int
    //   54	14	2	arrayOfFile	File[]
    //   61	4	3	j	int
    //   70	88	4	localFile	File
    //   73	15	5	localObject1	Object
    //   76	146	6	localObject2	Object
    //   80	42	7	localObject3	Object
    //   142	1	7	localIOException1	IOException
    //   155	1	7	localObject4	Object
    //   176	8	7	localIOException2	IOException
    //   200	5	7	localObject5	Object
    //   207	1	7	localIOException3	IOException
    //   212	1	7	localIOException4	IOException
    //   217	7	7	localObject6	Object
    //   230	1	7	localIOException5	IOException
    //   85	84	8	localObject7	Object
    //   181	39	8	localObject8	Object
    //   225	1	8	localObject9	Object
    // Exception table:
    //   from	to	target	type
    //   82	87	142	java/io/IOException
    //   91	98	142	java/io/IOException
    //   168	173	176	java/io/IOException
    //   82	87	181	finally
    //   91	98	181	finally
    //   157	163	181	finally
    //   4	44	200	finally
    //   47	55	200	finally
    //   59	62	200	finally
    //   131	136	200	finally
    //   168	173	200	finally
    //   192	197	200	finally
    //   197	200	200	finally
    //   131	136	207	java/io/IOException
    //   192	197	212	java/io/IOException
    //   98	126	217	finally
    //   98	126	230	java/io/IOException
  }
  
  public void invalidate(String paramString, boolean paramBoolean)
  {
    try
    {
      Cache.Entry localEntry = get(paramString);
      if (localEntry != null)
      {
        localEntry.softTtl = 0L;
        if (paramBoolean) {
          localEntry.ttl = 0L;
        }
        put(paramString, localEntry);
      }
      return;
    }
    finally {}
  }
  
  /* Error */
  public void put(String paramString, Cache.Entry paramEntry)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: aload_2
    //   4: getfield 367	com/android/volley/Cache$Entry:data	[B
    //   7: arraylength
    //   8: invokespecial 369	com/android/volley/toolbox/DiskBasedCache:pruneIfNeeded	(I)V
    //   11: aload_0
    //   12: aload_1
    //   13: invokevirtual 155	com/android/volley/toolbox/DiskBasedCache:getFileForKey	(Ljava/lang/String;)Ljava/io/File;
    //   16: astore_3
    //   17: new 371	java/io/FileOutputStream
    //   20: astore 4
    //   22: aload 4
    //   24: aload_3
    //   25: invokespecial 372	java/io/FileOutputStream:<init>	(Ljava/io/File;)V
    //   28: new 8	com/android/volley/toolbox/DiskBasedCache$CacheHeader
    //   31: astore 5
    //   33: aload 5
    //   35: aload_1
    //   36: aload_2
    //   37: invokespecial 374	com/android/volley/toolbox/DiskBasedCache$CacheHeader:<init>	(Ljava/lang/String;Lcom/android/volley/Cache$Entry;)V
    //   40: aload 5
    //   42: aload 4
    //   44: invokevirtual 378	com/android/volley/toolbox/DiskBasedCache$CacheHeader:writeHeader	(Ljava/io/OutputStream;)Z
    //   47: pop
    //   48: aload 4
    //   50: aload_2
    //   51: getfield 367	com/android/volley/Cache$Entry:data	[B
    //   54: invokevirtual 381	java/io/FileOutputStream:write	([B)V
    //   57: aload 4
    //   59: invokevirtual 382	java/io/FileOutputStream:close	()V
    //   62: aload_0
    //   63: aload_1
    //   64: aload 5
    //   66: invokespecial 347	com/android/volley/toolbox/DiskBasedCache:putEntry	(Ljava/lang/String;Lcom/android/volley/toolbox/DiskBasedCache$CacheHeader;)V
    //   69: aload_0
    //   70: monitorexit
    //   71: return
    //   72: astore_1
    //   73: aload_3
    //   74: invokevirtual 160	java/io/File:delete	()Z
    //   77: ifne -8 -> 69
    //   80: ldc_w 384
    //   83: iconst_1
    //   84: anewarray 4	java/lang/Object
    //   87: dup
    //   88: iconst_0
    //   89: aload_3
    //   90: invokevirtual 327	java/io/File:getAbsolutePath	()Ljava/lang/String;
    //   93: aastore
    //   94: invokestatic 173	com/android/volley/VolleyLog:d	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   97: goto -28 -> 69
    //   100: astore_1
    //   101: aload_0
    //   102: monitorexit
    //   103: aload_1
    //   104: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	105	0	this	DiskBasedCache
    //   0	105	1	paramString	String
    //   0	105	2	paramEntry	Cache.Entry
    //   16	74	3	localFile	File
    //   20	38	4	localFileOutputStream	java.io.FileOutputStream
    //   31	34	5	localCacheHeader	CacheHeader
    // Exception table:
    //   from	to	target	type
    //   17	69	72	java/io/IOException
    //   2	17	100	finally
    //   17	69	100	finally
    //   73	97	100	finally
  }
  
  public void remove(String paramString)
  {
    try
    {
      boolean bool = getFileForKey(paramString).delete();
      removeEntry(paramString);
      if (!bool) {
        VolleyLog.d("Could not delete cache entry for key=%s, filename=%s", new Object[] { paramString, getFilenameForKey(paramString) });
      }
      return;
    }
    finally {}
  }
  
  static class CacheHeader
  {
    public String etag;
    public String key;
    public Map<String, String> responseHeaders;
    public long serverDate;
    public long size;
    public long softTtl;
    public long ttl;
    
    private CacheHeader() {}
    
    public CacheHeader(String paramString, Cache.Entry paramEntry)
    {
      this.key = paramString;
      this.size = paramEntry.data.length;
      this.etag = paramEntry.etag;
      this.serverDate = paramEntry.serverDate;
      this.ttl = paramEntry.ttl;
      this.softTtl = paramEntry.softTtl;
      this.responseHeaders = paramEntry.responseHeaders;
    }
    
    public static CacheHeader readHeader(InputStream paramInputStream)
      throws IOException
    {
      CacheHeader localCacheHeader = new CacheHeader();
      if (DiskBasedCache.readInt(paramInputStream) != 538051844) {
        throw new IOException();
      }
      localCacheHeader.key = DiskBasedCache.readString(paramInputStream);
      localCacheHeader.etag = DiskBasedCache.readString(paramInputStream);
      if (localCacheHeader.etag.equals("")) {
        localCacheHeader.etag = null;
      }
      localCacheHeader.serverDate = DiskBasedCache.readLong(paramInputStream);
      localCacheHeader.ttl = DiskBasedCache.readLong(paramInputStream);
      localCacheHeader.softTtl = DiskBasedCache.readLong(paramInputStream);
      localCacheHeader.responseHeaders = DiskBasedCache.readStringStringMap(paramInputStream);
      return localCacheHeader;
    }
    
    public Cache.Entry toCacheEntry(byte[] paramArrayOfByte)
    {
      Cache.Entry localEntry = new Cache.Entry();
      localEntry.data = paramArrayOfByte;
      localEntry.etag = this.etag;
      localEntry.serverDate = this.serverDate;
      localEntry.ttl = this.ttl;
      localEntry.softTtl = this.softTtl;
      localEntry.responseHeaders = this.responseHeaders;
      return localEntry;
    }
    
    public boolean writeHeader(OutputStream paramOutputStream)
    {
      bool = true;
      for (;;)
      {
        try
        {
          DiskBasedCache.writeInt(paramOutputStream, 538051844);
          DiskBasedCache.writeString(paramOutputStream, this.key);
          if (this.etag != null) {
            continue;
          }
          str = "";
          DiskBasedCache.writeString(paramOutputStream, str);
          DiskBasedCache.writeLong(paramOutputStream, this.serverDate);
          DiskBasedCache.writeLong(paramOutputStream, this.ttl);
          DiskBasedCache.writeLong(paramOutputStream, this.softTtl);
          DiskBasedCache.writeStringStringMap(this.responseHeaders, paramOutputStream);
          paramOutputStream.flush();
        }
        catch (IOException paramOutputStream)
        {
          String str;
          VolleyLog.d("%s", new Object[] { paramOutputStream.toString() });
          bool = false;
          continue;
        }
        return bool;
        str = this.etag;
      }
    }
  }
  
  private static class CountingInputStream
    extends FilterInputStream
  {
    private int bytesRead = 0;
    
    private CountingInputStream(InputStream paramInputStream)
    {
      super();
    }
    
    public int read()
      throws IOException
    {
      int i = super.read();
      if (i != -1) {
        this.bytesRead += 1;
      }
      return i;
    }
    
    public int read(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
      throws IOException
    {
      paramInt1 = super.read(paramArrayOfByte, paramInt1, paramInt2);
      if (paramInt1 != -1) {
        this.bytesRead += paramInt1;
      }
      return paramInt1;
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/android/volley/toolbox/DiskBasedCache.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */