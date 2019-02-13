package com.mobnetic.coinguardian.util;

import android.content.Context;
import android.content.res.Resources;
import com.mobnetic.coinguardian.db.content.AlarmRecord;
import com.mobnetic.coinguardian.db.content.CheckerRecord;
import com.mobnetic.coinguardian.model.CurrencySubunit;

public class AlarmRecordHelper
{
  public static final int ALARM_TYPE_GREATER_THAN = 6;
  public static final int ALARM_TYPE_LOWER_THAN = 7;
  public static final int ALARM_TYPE_PERCENT_CHANGE = 0;
  public static final int ALARM_TYPE_PERCENT_CHANGE_DOWN = 2;
  public static final int ALARM_TYPE_PERCENT_CHANGE_UP = 1;
  public static final int ALARM_TYPE_VALUE_CHANGE = 3;
  public static final int ALARM_TYPE_VALUE_CHANGE_DOWN = 5;
  public static final int ALARM_TYPE_VALUE_CHANGE_UP = 4;
  
  public static AlarmRecord generateDefaultAlarmRecord(boolean paramBoolean)
  {
    AlarmRecord localAlarmRecord = new AlarmRecord();
    localAlarmRecord.setEnabled(paramBoolean);
    localAlarmRecord.setValue(3.0D);
    localAlarmRecord.setSound(true);
    localAlarmRecord.setVibrate(true);
    localAlarmRecord.setLed(true);
    return localAlarmRecord;
  }
  
  public static int getAlarmTypeForPosition(Context paramContext, int paramInt)
  {
    paramContext = paramContext.getResources().getIntArray(2131492867);
    if ((paramContext != null) && (paramInt > 0) && (paramInt < paramContext.length)) {}
    for (paramInt = paramContext[paramInt];; paramInt = 0) {
      return paramInt;
    }
  }
  
  public static double getDifferenceForPercentageChange(double paramDouble1, double paramDouble2)
  {
    double d = 0.0D;
    if (paramDouble1 == 0.0D) {}
    for (paramDouble1 = d;; paramDouble1 = (paramDouble2 - paramDouble1) / paramDouble1 * 100.0D) {
      return paramDouble1;
    }
  }
  
  public static int getPositionForAlarmType(Context paramContext, AlarmRecord paramAlarmRecord)
  {
    paramContext = paramContext.getResources().getIntArray(2131492867);
    int i;
    if (paramContext != null)
    {
      i = 0;
      if (i < paramContext.length) {
        if (paramContext[i] != paramAlarmRecord.getType()) {}
      }
    }
    for (;;)
    {
      return i;
      i++;
      break;
      i = 0;
    }
  }
  
  public static String getPrefixForAlarmType(CheckerRecord paramCheckerRecord, AlarmRecord paramAlarmRecord)
  {
    switch ((int)paramAlarmRecord.getType())
    {
    case 3: 
    default: 
      paramCheckerRecord = "±";
    }
    for (;;)
    {
      return paramCheckerRecord;
      paramCheckerRecord = "+";
      continue;
      paramCheckerRecord = "-";
      continue;
      paramCheckerRecord = ">";
      continue;
      paramCheckerRecord = "<";
    }
  }
  
  public static String getSufixForAlarmType(CheckerRecord paramCheckerRecord, AlarmRecord paramAlarmRecord)
  {
    switch ((int)paramAlarmRecord.getType())
    {
    }
    for (paramCheckerRecord = "%";; paramCheckerRecord = CurrencyUtils.getCurrencySymbol(CurrencyUtils.getCurrencySubunit(paramCheckerRecord.getCurrencyDst(), paramCheckerRecord.getCurrencySubunitDst()).name)) {
      return paramCheckerRecord;
    }
  }
  
  public static double getTriggerPriceForPercentageChange(double paramDouble1, double paramDouble2)
  {
    return paramDouble2 / 100.0D * paramDouble1 + paramDouble1;
  }
  
  public static String getValueForAlarmType(CheckerRecord paramCheckerRecord, AlarmRecord paramAlarmRecord)
  {
    return getValueForAlarmType(CurrencyUtils.getCurrencySubunit(paramCheckerRecord.getCurrencyDst(), paramCheckerRecord.getCurrencySubunitDst()), paramAlarmRecord);
  }
  
  public static String getValueForAlarmType(CurrencySubunit paramCurrencySubunit, AlarmRecord paramAlarmRecord)
  {
    switch ((int)paramAlarmRecord.getType())
    {
    }
    for (paramCurrencySubunit = FormatUtils.formatDoubleWithThreeMax(paramAlarmRecord.getValue());; paramCurrencySubunit = FormatUtils.formatPriceValueForSubunit(paramAlarmRecord.getValue(), paramCurrencySubunit, false, true)) {
      return paramCurrencySubunit;
    }
  }
  
  public static boolean isCheckPointAvailableForAlarmType(AlarmRecord paramAlarmRecord)
  {
    switch ((int)paramAlarmRecord.getType())
    {
    }
    for (boolean bool = true;; bool = false) {
      return bool;
    }
  }
  
  public static double parseEnteredValueForAlarmType(CurrencySubunit paramCurrencySubunit, AlarmRecord paramAlarmRecord, double paramDouble)
  {
    double d;
    switch ((int)paramAlarmRecord.getType())
    {
    default: 
      d = paramDouble;
    }
    for (;;)
    {
      return d;
      d = paramDouble;
      if (paramCurrencySubunit != null) {
        d = paramDouble / paramCurrencySubunit.subunitToUnit;
      }
    }
  }
  
  public static boolean shouldDisableAlarmAfterDismiss(AlarmRecord paramAlarmRecord)
  {
    int i = (int)paramAlarmRecord.getType();
    if ((i == 6) || (i == 7)) {}
    for (boolean bool = true;; bool = false) {
      return bool;
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/util/AlarmRecordHelper.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */