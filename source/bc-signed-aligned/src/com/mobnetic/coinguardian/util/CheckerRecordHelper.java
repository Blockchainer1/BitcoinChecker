package com.mobnetic.coinguardian.util;

import android.content.Context;
import com.mobnetic.coinguardian.alarm.AlarmKlaxonHelper;
import com.mobnetic.coinguardian.appwidget.WidgetProvider;
import com.mobnetic.coinguardian.db.content.AlarmRecord;
import com.mobnetic.coinguardian.db.content.CheckerRecord;
import com.mobnetic.coinguardian.db.content.MaindbContract.Alarm;
import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.receiver.MarketChecker;
import com.robotoworks.mechanoid.db.SQuery;
import java.util.List;

public class CheckerRecordHelper
{
  public static CheckerInfo createCheckerInfo(CheckerRecord paramCheckerRecord)
  {
    return new CheckerInfo(paramCheckerRecord.getCurrencySrc(), paramCheckerRecord.getCurrencyDst(), paramCheckerRecord.getCurrencyPairId(), (int)paramCheckerRecord.getContractType());
  }
  
  public static final void doAfterDelete(Context paramContext, CheckerRecord paramCheckerRecord)
  {
    WidgetProvider.refreshWidget(paramContext.getApplicationContext());
  }
  
  public static final void doAfterEdit(Context paramContext, CheckerRecord paramCheckerRecord, boolean paramBoolean)
  {
    MarketChecker.cancelCheckingForCheckerRecord(paramCheckerRecord.getId());
    MarketChecker.resetAlarmManagerForChecker(paramContext.getApplicationContext(), paramCheckerRecord, true);
    if (!paramCheckerRecord.getEnabled()) {
      NotificationUtils.clearNotificationsForCheckerRecord(paramContext, paramCheckerRecord);
    }
    if (paramBoolean) {
      WidgetProvider.refreshWidget(paramContext.getApplicationContext());
    }
    paramContext.sendBroadcast(AlarmKlaxonHelper.createAlarmKlaxonDismissIntent(paramContext, paramCheckerRecord.getId(), -1L));
  }
  
  public static final void doBeforeDelete(Context paramContext, CheckerRecord paramCheckerRecord)
  {
    paramCheckerRecord.setEnabled(false);
    doAfterEdit(paramContext, paramCheckerRecord, false);
    MaindbContract.Alarm.delete("checkerId = ?", new String[] { String.valueOf(paramCheckerRecord.getId()) });
  }
  
  private static List<AlarmRecord> getAlarmsForCheckerRecord(long paramLong, boolean paramBoolean)
  {
    SQuery localSQuery = SQuery.newQuery().expr("checkerId", " = ", paramLong);
    if (paramBoolean) {
      localSQuery.and().expr("enabled", " = ", true);
    }
    return localSQuery.select(MaindbContract.Alarm.CONTENT_URI);
  }
  
  public static List<AlarmRecord> getAlarmsForCheckerRecord(CheckerRecord paramCheckerRecord, boolean paramBoolean)
  {
    return getAlarmsForCheckerRecord(paramCheckerRecord.getId(), paramBoolean);
  }
  
  public static List<Long> getAlarmsIdsForCheckerRecord(long paramLong)
  {
    return SQuery.newQuery().expr("checkerId", " = ", paramLong).selectLongList(MaindbContract.Alarm.CONTENT_URI, "_id");
  }
  
  public static long getDisplayedFrequency(Context paramContext, CheckerRecord paramCheckerRecord)
  {
    if (paramCheckerRecord.getFrequency() <= -1L) {}
    for (long l = PreferencesUtils.getCheckGlobalFrequency(paramContext);; l = paramCheckerRecord.getFrequency()) {
      return l;
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/util/CheckerRecordHelper.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */