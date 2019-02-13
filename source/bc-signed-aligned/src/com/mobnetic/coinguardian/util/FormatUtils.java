package com.mobnetic.coinguardian.util;

import android.content.Context;
import android.content.res.Resources;
import com.mobnetic.coinguardian.db.content.CheckerRecord;
import com.mobnetic.coinguardian.model.CurrencySubunit;
import com.mobnetic.coinguardian.model.Futures;
import com.mobnetic.coinguardian.model.FuturesMarket;
import com.mobnetic.coinguardian.model.Market;
import java.math.BigDecimal;
import java.math.RoundingMode;

public class FormatUtils
  extends FormatUtilsBase
{
  private static final int[] CONTRACT_TYPE_NAMES = { 2131165292, 2131165289, 2131165290, 2131165288, 2131165291 };
  
  public static BigDecimal fixSatoshi(double paramDouble)
  {
    return new BigDecimal(paramDouble).setScale(8, RoundingMode.HALF_UP);
  }
  
  public static String formatPrice(double paramDouble, CheckerRecord paramCheckerRecord, boolean paramBoolean)
  {
    return formatPriceWithCurrency(paramDouble, CurrencyUtils.getCurrencySubunit(paramCheckerRecord.getCurrencyDst(), paramCheckerRecord.getCurrencySubunitDst()), paramBoolean);
  }
  
  public static String formatPriceWithCurrency(double paramDouble, CheckerRecord paramCheckerRecord)
  {
    return formatPrice(paramDouble, paramCheckerRecord, true);
  }
  
  public static String formatRelativeTime(Context paramContext, long paramLong1, long paramLong2, boolean paramBoolean)
  {
    Resources localResources = paramContext.getResources();
    paramLong2 = paramLong1 - paramLong2;
    int i = 0;
    paramLong1 = paramLong2;
    if (paramLong2 < 0L)
    {
      i = 1;
      paramLong1 = -paramLong2;
    }
    int j;
    int k;
    if (paramLong1 < 60000L)
    {
      j = (int)((float)paramLong1 / 1000.0F);
      if (paramBoolean)
      {
        k = 2131165452;
        if (!paramBoolean) {
          break label280;
        }
        paramContext = j + localResources.getString(k);
        label83:
        if (i == 0) {
          break label305;
        }
      }
    }
    label280:
    label305:
    for (paramContext = localResources.getString(2131165443, new Object[] { paramContext });; paramContext = localResources.getString(2131165448, new Object[] { paramContext }))
    {
      return paramContext;
      k = 2131689476;
      break;
      if (paramLong1 < 3600000L)
      {
        j = (int)((float)paramLong1 / 60000.0F);
        if (paramBoolean) {}
        for (k = 2131165449;; k = 2131689474) {
          break;
        }
      }
      if (paramLong1 < 86400000L)
      {
        j = (int)((float)paramLong1 / 3600000.0F);
        if (paramBoolean) {}
        for (k = 2131165446;; k = 2131689473) {
          break;
        }
      }
      if (paramLong1 < 2563200000L)
      {
        j = (int)((float)paramLong1 / 8.64E7F);
        if (paramBoolean) {}
        for (k = 2131165444;; k = 2131689472) {
          break;
        }
      }
      if (paramLong1 < 30758400000L)
      {
        j = (int)((float)paramLong1 / 2.5632E9F);
        if (paramBoolean) {}
        for (k = 2131165451;; k = 2131689475) {
          break;
        }
      }
      j = (int)((float)paramLong1 / 3.07584E10F);
      if (paramBoolean) {}
      for (k = 2131165454;; k = 2131689477) {
        break;
      }
      paramContext = localResources.getQuantityString(k, j, new Object[] { Integer.valueOf(j) });
      break label83;
    }
  }
  
  public static String formatTextForTTS(Context paramContext, double paramDouble, CheckerRecord paramCheckerRecord, CurrencySubunit paramCurrencySubunit, Market paramMarket)
  {
    return formatTextForTTS(paramContext, paramDouble, paramCheckerRecord, false, paramCurrencySubunit, false, paramMarket, false);
  }
  
  public static String formatTextForTTS(Context paramContext, double paramDouble, CheckerRecord paramCheckerRecord, boolean paramBoolean1, CurrencySubunit paramCurrencySubunit, boolean paramBoolean2, Market paramMarket, boolean paramBoolean3)
  {
    return formatTextForTTS(paramContext, paramDouble, paramCheckerRecord.getCurrencySrc(), (int)paramCheckerRecord.getContractType(), paramBoolean1, paramCurrencySubunit, paramBoolean2, paramMarket, paramMarket.ttsName, paramBoolean3);
  }
  
  public static String formatTextForTTS(Context paramContext, double paramDouble, String paramString1, int paramInt, boolean paramBoolean1, CurrencySubunit paramCurrencySubunit, boolean paramBoolean2, Market paramMarket, String paramString2, boolean paramBoolean3)
  {
    String str1 = formatValueForTTS(paramContext, paramDouble, paramCurrencySubunit);
    String str2 = str1;
    if (!paramBoolean1)
    {
      str2 = str1;
      if (PreferencesUtils.getTTSFormatSpeakBaseCurrency(paramContext)) {
        str2 = paramContext.getString(2131165455, new Object[] { getCurrencySrcWithContractTypeForTTS(paramContext, paramString1, paramMarket, paramInt), str1 });
      }
    }
    paramString1 = str2;
    if (!paramBoolean2)
    {
      paramString1 = str2;
      if (PreferencesUtils.getTTSFormatSpeakCounterCurrency(paramContext)) {
        paramString1 = paramContext.getString(2131165456, new Object[] { str2, paramCurrencySubunit.name });
      }
    }
    paramCurrencySubunit = paramString1;
    if (!paramBoolean3)
    {
      paramCurrencySubunit = paramString1;
      if (PreferencesUtils.getTTSFormatSpeakExchange(paramContext)) {
        paramCurrencySubunit = paramContext.getString(2131165457, new Object[] { paramString1, paramString2 });
      }
    }
    return paramCurrencySubunit;
  }
  
  private static String formatValueForTTS(Context paramContext, double paramDouble, CurrencySubunit paramCurrencySubunit)
  {
    if ((paramDouble >= 1.0D) && (PreferencesUtils.getTTSFormatIntegerOnly(paramContext))) {}
    for (boolean bool = true;; bool = false) {
      return formatPriceValueForSubunit(paramDouble, paramCurrencySubunit, bool, true);
    }
  }
  
  public static CharSequence getContractTypeName(Context paramContext, int paramInt)
  {
    if ((paramInt >= 0) && (paramInt < CONTRACT_TYPE_NAMES.length)) {}
    for (paramContext = paramContext.getString(CONTRACT_TYPE_NAMES[paramInt]);; paramContext = Futures.getContractTypeShortName(paramInt)) {
      return paramContext;
    }
  }
  
  public static String getCurrencySrcWithContractType(String paramString, Market paramMarket, int paramInt)
  {
    String str = paramString;
    if ((paramMarket instanceof FuturesMarket))
    {
      paramMarket = Futures.getContractTypeShortName(paramInt);
      str = paramString;
      if (paramMarket != null) {
        str = paramString + paramMarket;
      }
    }
    return str;
  }
  
  public static String getCurrencySrcWithContractTypeForTTS(Context paramContext, String paramString, Market paramMarket, int paramInt)
  {
    String str = paramString;
    if ((paramMarket instanceof FuturesMarket))
    {
      paramContext = getContractTypeName(paramContext, paramInt);
      str = paramString;
      if (paramContext != null) {
        str = paramString + " " + paramContext;
      }
    }
    return str;
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/util/FormatUtils.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */