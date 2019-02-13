package com.mobnetic.coinguardian.util;

import android.content.Context;
import android.text.format.DateUtils;
import com.mobnetic.coinguardian.model.CurrencySubunit;
import java.text.DecimalFormat;
import java.util.Date;

public class FormatUtilsBase
{
  private static final DecimalFormat FORMAT_EIGHT_SIGNIFICANT_AT_MOST = new DecimalFormat("@#######");
  private static final DecimalFormat FORMAT_THREE_SIGNIFICANT_AT_MOST;
  private static final DecimalFormat FORMAT_TWO_DECIMAL = new DecimalFormat("0.00");
  
  static
  {
    FORMAT_THREE_SIGNIFICANT_AT_MOST = new DecimalFormat("@##");
  }
  
  public static String formatDateTime(Context paramContext, long paramLong)
  {
    Date localDate = new Date(paramLong);
    return android.text.format.DateFormat.getTimeFormat(paramContext).format(localDate) + ", " + android.text.format.DateFormat.getDateFormat(paramContext).format(localDate);
  }
  
  public static String formatDouble(double paramDouble, boolean paramBoolean)
  {
    if (paramDouble < 1.0D) {}
    for (DecimalFormat localDecimalFormat = FORMAT_THREE_SIGNIFICANT_AT_MOST;; localDecimalFormat = FORMAT_TWO_DECIMAL) {
      return formatDouble(localDecimalFormat, paramDouble);
    }
  }
  
  protected static final String formatDouble(DecimalFormat paramDecimalFormat, double paramDouble)
  {
    try
    {
      str1 = paramDecimalFormat.format(paramDouble);
    }
    catch (Exception localException)
    {
      for (;;)
      {
        String str1;
        localException.printStackTrace();
        String str2 = String.valueOf(paramDouble);
      }
    }
    finally {}
    return str1;
  }
  
  protected static String formatDoubleWithEightMax(double paramDouble)
  {
    return formatDouble(FORMAT_EIGHT_SIGNIFICANT_AT_MOST, paramDouble);
  }
  
  public static String formatDoubleWithThreeMax(double paramDouble)
  {
    return formatDouble(FORMAT_THREE_SIGNIFICANT_AT_MOST, paramDouble);
  }
  
  public static String formatPriceValueForSubunit(double paramDouble, CurrencySubunit paramCurrencySubunit, boolean paramBoolean1, boolean paramBoolean2)
  {
    paramDouble *= paramCurrencySubunit.subunitToUnit;
    if ((!paramCurrencySubunit.allowDecimal) || (paramBoolean1)) {
      paramCurrencySubunit = String.valueOf((0.5D + paramDouble));
    }
    for (;;)
    {
      return paramCurrencySubunit;
      if (paramBoolean2) {
        paramCurrencySubunit = formatDoubleWithEightMax(paramDouble);
      } else {
        paramCurrencySubunit = formatDouble(paramDouble, true);
      }
    }
  }
  
  public static String formatPriceWithCurrency(double paramDouble, CurrencySubunit paramCurrencySubunit)
  {
    return formatPriceWithCurrency(paramDouble, paramCurrencySubunit, true);
  }
  
  protected static String formatPriceWithCurrency(double paramDouble, CurrencySubunit paramCurrencySubunit, boolean paramBoolean)
  {
    String str1 = formatPriceValueForSubunit(paramDouble, paramCurrencySubunit, false, false);
    String str2 = str1;
    if (paramBoolean) {
      str2 = formatPriceWithCurrency(str1, paramCurrencySubunit.name);
    }
    return str2;
  }
  
  public static String formatPriceWithCurrency(double paramDouble, String paramString)
  {
    return formatPriceWithCurrency(formatDouble(paramDouble, true), paramString);
  }
  
  public static String formatPriceWithCurrency(String paramString1, String paramString2)
  {
    return paramString1 + " " + CurrencyUtils.getCurrencySymbol(paramString2);
  }
  
  public static String formatSameDayTimeOrDate(Context paramContext, long paramLong)
  {
    if (DateUtils.isToday(paramLong)) {}
    for (paramContext = android.text.format.DateFormat.getTimeFormat(paramContext).format(new Date(paramLong));; paramContext = android.text.format.DateFormat.getDateFormat(paramContext).format(new Date(paramLong))) {
      return paramContext;
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/util/FormatUtilsBase.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */