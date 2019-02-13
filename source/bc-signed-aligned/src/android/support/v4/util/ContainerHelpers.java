package android.support.v4.util;

class ContainerHelpers
{
  static final int[] EMPTY_INTS = new int[0];
  static final long[] EMPTY_LONGS = new long[0];
  static final Object[] EMPTY_OBJECTS = new Object[0];
  
  static int binarySearch(int[] paramArrayOfInt, int paramInt1, int paramInt2)
  {
    int i = 0;
    int j = paramInt1 - 1;
    paramInt1 = i;
    while (paramInt1 <= j)
    {
      i = paramInt1 + j >>> 1;
      int k = paramArrayOfInt[i];
      if (k < paramInt2)
      {
        paramInt1 = i + 1;
      }
      else
      {
        j = i;
        if (k <= paramInt2) {
          break label62;
        }
        j = i - 1;
      }
    }
    j = paramInt1 ^ 0xFFFFFFFF;
    label62:
    return j;
  }
  
  static int binarySearch(long[] paramArrayOfLong, int paramInt, long paramLong)
  {
    int i = 0;
    int j = paramInt - 1;
    paramInt = i;
    while (paramInt <= j)
    {
      i = paramInt + j >>> 1;
      long l = paramArrayOfLong[i];
      if (l < paramLong)
      {
        paramInt = i + 1;
      }
      else
      {
        j = i;
        if (l <= paramLong) {
          break label71;
        }
        j = i - 1;
      }
    }
    j = paramInt ^ 0xFFFFFFFF;
    label71:
    return j;
  }
  
  public static boolean equal(Object paramObject1, Object paramObject2)
  {
    if ((paramObject1 == paramObject2) || ((paramObject1 != null) && (paramObject1.equals(paramObject2)))) {}
    for (boolean bool = true;; bool = false) {
      return bool;
    }
  }
  
  public static int idealByteArraySize(int paramInt)
  {
    for (int i = 4;; i++)
    {
      int j = paramInt;
      if (i < 32)
      {
        if (paramInt <= (1 << i) - 12) {
          j = (1 << i) - 12;
        }
      }
      else {
        return j;
      }
    }
  }
  
  public static int idealIntArraySize(int paramInt)
  {
    return idealByteArraySize(paramInt * 4) / 4;
  }
  
  public static int idealLongArraySize(int paramInt)
  {
    return idealByteArraySize(paramInt * 8) / 8;
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/android/support/v4/util/ContainerHelpers.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */