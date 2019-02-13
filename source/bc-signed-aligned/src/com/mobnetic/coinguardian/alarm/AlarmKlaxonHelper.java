package com.mobnetic.coinguardian.alarm;

import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import com.mobnetic.coinguardian.db.content.AlarmRecord;

public class AlarmKlaxonHelper
{
  public static Intent createAlarmKlaxonDismissIntent(Context paramContext, long paramLong1, long paramLong2)
  {
    paramContext = new Intent("com.mobnetic.coinguardian.alarm.ALARM_DISMISS");
    paramContext.putExtra("checker_record_id", paramLong1);
    paramContext.putExtra("alarm_record_id", paramLong2);
    return paramContext;
  }
  
  public static PendingIntent createAlarmKlaxonDismissPendingIntent(Context paramContext, long paramLong1, long paramLong2)
  {
    Intent localIntent = createAlarmKlaxonDismissIntent(paramContext, paramLong1, paramLong2);
    return PendingIntent.getBroadcast(paramContext, (int)paramLong2, localIntent, 134217728);
  }
  
  public static void startAlarmKlaxon(Context paramContext, AlarmRecord paramAlarmRecord) {}
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/alarm/AlarmKlaxonHelper.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */