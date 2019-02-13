package com.mobnetic.coinguardian.model;

public class Futures
{
  public static final int CONTRACT_TYPE_BIMONTHLY = 3;
  public static final int CONTRACT_TYPE_BIWEEKLY = 1;
  public static final int CONTRACT_TYPE_MONTHLY = 2;
  public static final int CONTRACT_TYPE_QUARTERLY = 4;
  private static final String[] CONTRACT_TYPE_SHORT_NAMES = { "1W", "2W", "1M", "2M", "3M" };
  public static final int CONTRACT_TYPE_WEEKLY = 0;
  
  public static String getContractTypeShortName(int paramInt)
  {
    if ((paramInt >= 0) && (paramInt < CONTRACT_TYPE_SHORT_NAMES.length)) {}
    for (String str = CONTRACT_TYPE_SHORT_NAMES[paramInt];; str = null) {
      return str;
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/model/Futures.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */