package com.robotoworks.mechanoid.internal.util;

public final class StringPool
{
  private final String[] pool = new String['Ȁ'];
  
  private static boolean contentEquals(String paramString, char[] paramArrayOfChar, int paramInt1, int paramInt2)
  {
    boolean bool1 = false;
    boolean bool2;
    if (paramString.length() != paramInt2) {
      bool2 = bool1;
    }
    for (;;)
    {
      return bool2;
      for (int i = 0;; i++)
      {
        if (i >= paramInt2) {
          break label52;
        }
        bool2 = bool1;
        if (paramArrayOfChar[(paramInt1 + i)] != paramString.charAt(i)) {
          break;
        }
      }
      label52:
      bool2 = true;
    }
  }
  
  public String get(char[] paramArrayOfChar, int paramInt1, int paramInt2)
  {
    int i = 0;
    for (int j = paramInt1; j < paramInt1 + paramInt2; j++) {
      i = i * 31 + paramArrayOfChar[j];
    }
    j = i ^ i >>> 20 ^ i >>> 12;
    j = (j ^ j >>> 7 ^ j >>> 4) & this.pool.length - 1;
    String str = this.pool[j];
    if ((str != null) && (contentEquals(str, paramArrayOfChar, paramInt1, paramInt2))) {
      paramArrayOfChar = str;
    }
    for (;;)
    {
      return paramArrayOfChar;
      paramArrayOfChar = new String(paramArrayOfChar, paramInt1, paramInt2);
      this.pool[j] = paramArrayOfChar;
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/robotoworks/mechanoid/internal/util/StringPool.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */