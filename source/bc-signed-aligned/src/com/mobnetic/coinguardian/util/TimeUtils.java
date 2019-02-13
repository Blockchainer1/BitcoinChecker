package com.mobnetic.coinguardian.util;

public class TimeUtils
{
  public static final long MILLIS_IN_DAY = 86400000L;
  public static final long MILLIS_IN_HOUR = 3600000L;
  public static final long MILLIS_IN_MINUTE = 60000L;
  public static final long MILLIS_IN_SECOND = 1000L;
  private static final long MILLIS_IN_YEAR = 31536000000L;
  public static final long NANOS_IN_MILLIS = 1000L;
  
  public static long parseTimeToMillis(long paramLong)
  {
    long l;
    if (paramLong < 31536000000L) {
      l = paramLong * 1000L;
    }
    for (;;)
    {
      return l;
      l = paramLong;
      if (paramLong > 157680000000000L) {
        l = paramLong / 1000L;
      }
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/util/TimeUtils.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */