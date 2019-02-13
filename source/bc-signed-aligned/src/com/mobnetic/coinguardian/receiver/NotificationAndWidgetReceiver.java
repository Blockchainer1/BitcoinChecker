package com.mobnetic.coinguardian.receiver;

import android.content.BroadcastReceiver;
import android.content.ContentResolver;
import android.content.Context;
import android.content.Intent;
import com.mobnetic.coinguardian.activity.CheckerAddActivity;
import com.mobnetic.coinguardian.alarm.AlarmKlaxonHelper;
import com.mobnetic.coinguardian.db.content.AlarmRecord;
import com.mobnetic.coinguardian.db.content.CheckerRecord;
import com.mobnetic.coinguardian.db.content.MaindbContract.Checker;
import com.mobnetic.coinguardian.util.AlarmRecordHelper;
import com.mobnetic.coinguardian.util.NotificationUtils;
import com.robotoworks.mechanoid.Mechanoid;

public class NotificationAndWidgetReceiver
  extends BroadcastReceiver
{
  public static final String ACTION_NOTIFICATION_ALARM_DISMISS = "com.mobnetic.coinguardian.receiver.action.notification_alarm_dismiss";
  public static final String ACTION_NOTIFICATION_CHECKER_ALARM_DETAILS = "com.mobnetic.coinguardian.receiver.action.notification_checker_alarm_details";
  public static final String ACTION_NOTIFICATION_REFRESH = "com.mobnetic.coinguardian.receiver.action.notification_refresh";
  public static final String ACTION_NOTIFICATION_REFRESH_ALL = "com.mobnetic.coinguardian.receiver.action.notification_refresh_all";
  
  private boolean disableAlarmRecordIfNeeded(long paramLong)
  {
    boolean bool = true;
    AlarmRecord localAlarmRecord = AlarmRecord.get(paramLong);
    if ((localAlarmRecord == null) || (!AlarmRecordHelper.shouldDisableAlarmAfterDismiss(localAlarmRecord))) {
      bool = false;
    }
    for (;;)
    {
      return bool;
      localAlarmRecord.setEnabled(false);
      try
      {
        localAlarmRecord.save(true);
        Mechanoid.getContentResolver().notifyChange(MaindbContract.Checker.CONTENT_URI, null);
      }
      catch (Exception localException)
      {
        localException.printStackTrace();
      }
    }
  }
  
  public void onReceive(Context paramContext, Intent paramIntent)
  {
    if (paramIntent == null) {}
    for (;;)
    {
      return;
      String str = paramIntent.getAction();
      long l1;
      if ("com.mobnetic.coinguardian.receiver.action.notification_refresh".equals(str))
      {
        l1 = paramIntent.getLongExtra("checker_record_id", -1L);
        if (l1 > 0L) {
          MarketChecker.checkMarketAsyncForCheckerRecord(paramContext, CheckerRecord.get(l1));
        }
      }
      else if ("com.mobnetic.coinguardian.receiver.action.notification_refresh_all".equals(str))
      {
        MarketChecker.refreshAllEnabledCheckerRecords(paramContext);
      }
      else
      {
        long l2;
        if ("com.mobnetic.coinguardian.receiver.action.notification_checker_alarm_details".equals(str))
        {
          l2 = paramIntent.getLongExtra("checker_record_id", -1L);
          l1 = paramIntent.getLongExtra("alarm_record_id", -1L);
          if ((l2 > 0L) && (l1 > 0L))
          {
            disableAlarmRecordIfNeeded(l1);
            paramIntent = CheckerRecord.get(l2);
            if (paramIntent != null) {
              CheckerAddActivity.startCheckerAddActivity(paramContext, paramIntent, l1, true);
            }
          }
        }
        else if ("com.mobnetic.coinguardian.receiver.action.notification_alarm_dismiss".equals(str))
        {
          l2 = paramIntent.getLongExtra("checker_record_id", -1L);
          l1 = paramIntent.getLongExtra("alarm_record_id", -1L);
          if ((l2 > 0L) && (l1 > 0L))
          {
            disableAlarmRecordIfNeeded(l1);
            paramContext.sendBroadcast(AlarmKlaxonHelper.createAlarmKlaxonDismissIntent(paramContext, l2, l1));
          }
        }
        else if ("com.mobnetic.coinguardian.alarm.ALARM_DISMISS".equals(str))
        {
          l1 = paramIntent.getLongExtra("alarm_record_id", -1L);
          if (l1 > 0L)
          {
            NotificationUtils.clearAlarmNotificationForAlarmRecord(paramContext, l1);
            disableAlarmRecordIfNeeded(l1);
          }
        }
        else if ("com.mobnetic.coinguardian.alarm.ALARM_DONE".equals(str))
        {
          l1 = paramIntent.getLongExtra("alarm_record_id", -1L);
          if (l1 > 0L) {
            NotificationUtils.clearAlarmNotificationForAlarmRecord(paramContext, l1);
          }
        }
      }
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/receiver/NotificationAndWidgetReceiver.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */