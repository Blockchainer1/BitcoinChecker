package com.android.volley;

import android.os.SystemClock;
import android.util.Log;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

public class VolleyLog
{
  public static boolean DEBUG = Log.isLoggable(TAG, 2);
  public static String TAG = "Volley";
  
  private static String buildMessage(String paramString, Object... paramVarArgs)
  {
    StackTraceElement[] arrayOfStackTraceElement;
    if (paramVarArgs == null)
    {
      arrayOfStackTraceElement = new Throwable().fillInStackTrace().getStackTrace();
      paramVarArgs = "<unknown>";
    }
    label151:
    for (int i = 2;; i++)
    {
      if (i >= arrayOfStackTraceElement.length) {}
      for (;;)
      {
        return String.format(Locale.US, "[%d] %s: %s", new Object[] { Long.valueOf(Thread.currentThread().getId()), paramVarArgs, paramString });
        paramString = String.format(Locale.US, paramString, paramVarArgs);
        break;
        if (arrayOfStackTraceElement[i].getClass().equals(VolleyLog.class)) {
          break label151;
        }
        paramVarArgs = arrayOfStackTraceElement[i].getClassName();
        paramVarArgs = paramVarArgs.substring(paramVarArgs.lastIndexOf('.') + 1);
        paramVarArgs = paramVarArgs.substring(paramVarArgs.lastIndexOf('$') + 1) + "." + arrayOfStackTraceElement[i].getMethodName();
      }
    }
  }
  
  public static void d(String paramString, Object... paramVarArgs)
  {
    Log.d(TAG, buildMessage(paramString, paramVarArgs));
  }
  
  public static void e(String paramString, Object... paramVarArgs)
  {
    Log.e(TAG, buildMessage(paramString, paramVarArgs));
  }
  
  public static void e(Throwable paramThrowable, String paramString, Object... paramVarArgs)
  {
    Log.e(TAG, buildMessage(paramString, paramVarArgs), paramThrowable);
  }
  
  public static void setTag(String paramString)
  {
    d("Changing log tag to %s", new Object[] { paramString });
    TAG = paramString;
    DEBUG = Log.isLoggable(TAG, 2);
  }
  
  public static void v(String paramString, Object... paramVarArgs)
  {
    if (DEBUG) {
      Log.v(TAG, buildMessage(paramString, paramVarArgs));
    }
  }
  
  public static void wtf(String paramString, Object... paramVarArgs)
  {
    Log.wtf(TAG, buildMessage(paramString, paramVarArgs));
  }
  
  public static void wtf(Throwable paramThrowable, String paramString, Object... paramVarArgs)
  {
    Log.wtf(TAG, buildMessage(paramString, paramVarArgs), paramThrowable);
  }
  
  static class MarkerLog
  {
    public static final boolean ENABLED = VolleyLog.DEBUG;
    private static final long MIN_DURATION_FOR_LOGGING_MS = 0L;
    private boolean mFinished = false;
    private final List<Marker> mMarkers = new ArrayList();
    
    private long getTotalDuration()
    {
      if (this.mMarkers.size() == 0) {}
      for (long l = 0L;; l = ((Marker)this.mMarkers.get(this.mMarkers.size() - 1)).time - l)
      {
        return l;
        l = ((Marker)this.mMarkers.get(0)).time;
      }
    }
    
    public void add(String paramString, long paramLong)
    {
      try
      {
        if (this.mFinished)
        {
          paramString = new java/lang/IllegalStateException;
          paramString.<init>("Marker added to finished log");
          throw paramString;
        }
      }
      finally {}
      List localList = this.mMarkers;
      Marker localMarker = new com/android/volley/VolleyLog$MarkerLog$Marker;
      localMarker.<init>(paramString, paramLong, SystemClock.elapsedRealtime());
      localList.add(localMarker);
    }
    
    protected void finalize()
      throws Throwable
    {
      if (!this.mFinished)
      {
        finish("Request on the loose");
        VolleyLog.e("Marker log finalized without finish() - uncaught exit point for request", new Object[0]);
      }
    }
    
    /* Error */
    public void finish(String paramString)
    {
      // Byte code:
      //   0: aload_0
      //   1: monitorenter
      //   2: aload_0
      //   3: iconst_1
      //   4: putfield 38	com/android/volley/VolleyLog$MarkerLog:mFinished	Z
      //   7: aload_0
      //   8: invokespecial 90	com/android/volley/VolleyLog$MarkerLog:getTotalDuration	()J
      //   11: lstore_2
      //   12: lload_2
      //   13: lconst_0
      //   14: lcmp
      //   15: ifgt +6 -> 21
      //   18: aload_0
      //   19: monitorexit
      //   20: return
      //   21: aload_0
      //   22: getfield 36	com/android/volley/VolleyLog$MarkerLog:mMarkers	Ljava/util/List;
      //   25: iconst_0
      //   26: invokeinterface 50 2 0
      //   31: checkcast 9	com/android/volley/VolleyLog$MarkerLog$Marker
      //   34: getfield 53	com/android/volley/VolleyLog$MarkerLog$Marker:time	J
      //   37: lstore 4
      //   39: ldc 92
      //   41: iconst_2
      //   42: anewarray 4	java/lang/Object
      //   45: dup
      //   46: iconst_0
      //   47: lload_2
      //   48: invokestatic 98	java/lang/Long:valueOf	(J)Ljava/lang/Long;
      //   51: aastore
      //   52: dup
      //   53: iconst_1
      //   54: aload_1
      //   55: aastore
      //   56: invokestatic 101	com/android/volley/VolleyLog:d	(Ljava/lang/String;[Ljava/lang/Object;)V
      //   59: aload_0
      //   60: getfield 36	com/android/volley/VolleyLog$MarkerLog:mMarkers	Ljava/util/List;
      //   63: invokeinterface 105 1 0
      //   68: astore 6
      //   70: aload 6
      //   72: invokeinterface 111 1 0
      //   77: ifeq -59 -> 18
      //   80: aload 6
      //   82: invokeinterface 115 1 0
      //   87: checkcast 9	com/android/volley/VolleyLog$MarkerLog$Marker
      //   90: astore_1
      //   91: aload_1
      //   92: getfield 53	com/android/volley/VolleyLog$MarkerLog$Marker:time	J
      //   95: lstore_2
      //   96: ldc 117
      //   98: iconst_3
      //   99: anewarray 4	java/lang/Object
      //   102: dup
      //   103: iconst_0
      //   104: lload_2
      //   105: lload 4
      //   107: lsub
      //   108: invokestatic 98	java/lang/Long:valueOf	(J)Ljava/lang/Long;
      //   111: aastore
      //   112: dup
      //   113: iconst_1
      //   114: aload_1
      //   115: getfield 120	com/android/volley/VolleyLog$MarkerLog$Marker:thread	J
      //   118: invokestatic 98	java/lang/Long:valueOf	(J)Ljava/lang/Long;
      //   121: aastore
      //   122: dup
      //   123: iconst_2
      //   124: aload_1
      //   125: getfield 124	com/android/volley/VolleyLog$MarkerLog$Marker:name	Ljava/lang/String;
      //   128: aastore
      //   129: invokestatic 101	com/android/volley/VolleyLog:d	(Ljava/lang/String;[Ljava/lang/Object;)V
      //   132: lload_2
      //   133: lstore 4
      //   135: goto -65 -> 70
      //   138: astore_1
      //   139: aload_0
      //   140: monitorexit
      //   141: aload_1
      //   142: athrow
      // Local variable table:
      //   start	length	slot	name	signature
      //   0	143	0	this	MarkerLog
      //   0	143	1	paramString	String
      //   11	122	2	l1	long
      //   37	97	4	l2	long
      //   68	13	6	localIterator	java.util.Iterator
      // Exception table:
      //   from	to	target	type
      //   2	12	138	finally
      //   21	70	138	finally
      //   70	132	138	finally
    }
    
    private static class Marker
    {
      public final String name;
      public final long thread;
      public final long time;
      
      public Marker(String paramString, long paramLong1, long paramLong2)
      {
        this.name = paramString;
        this.thread = paramLong1;
        this.time = paramLong2;
      }
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/android/volley/VolleyLog.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */