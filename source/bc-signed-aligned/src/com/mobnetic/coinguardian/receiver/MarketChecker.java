package com.mobnetic.coinguardian.receiver;

import android.app.AlarmManager;
import android.app.PendingIntent;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.database.Cursor;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.SystemClock;
import com.android.volley.NetworkError;
import com.android.volley.RequestQueue;
import com.android.volley.Response.ErrorListener;
import com.android.volley.Response.Listener;
import com.android.volley.VolleyError;
import com.mobnetic.coinguardian.appwidget.WidgetProvider;
import com.mobnetic.coinguardian.db.content.CheckerRecord;
import com.mobnetic.coinguardian.db.content.MaindbContract.Checker;
import com.mobnetic.coinguardian.fragment.CheckersListFragment;
import com.mobnetic.coinguardian.model.Ticker;
import com.mobnetic.coinguardian.util.AsyncTaskCompat;
import com.mobnetic.coinguardian.util.CheckErrorsUtils;
import com.mobnetic.coinguardian.util.CheckerRecordHelper;
import com.mobnetic.coinguardian.util.HttpsHelper;
import com.mobnetic.coinguardian.util.NotificationUtils;
import com.mobnetic.coinguardian.util.TickerUtils;
import com.mobnetic.coinguardian.volley.CheckerVolleyAsyncTask;
import com.robotoworks.mechanoid.db.SQuery;
import java.util.Iterator;
import java.util.List;

public class MarketChecker
  extends BroadcastReceiver
{
  private static final String ACTION_CHECK_MARKET = "com.mobnetic.coinguardian.receiver.action.check_market";
  public static final String EXTRA_ALARM_RECORD_ID = "alarm_record_id";
  public static final String EXTRA_CHECKER_RECORD_ID = "checker_record_id";
  private static final Object LOCK = new Object();
  private static RequestQueue requestQueue = null;
  
  public static void cancelCheckingForCheckerRecord(long paramLong)
  {
    CheckerVolleyAsyncTask.cancelCheckingForCheckerRecord(paramLong);
  }
  
  public static void checkIfAlarmsAreSet(Context paramContext)
  {
    AsyncTaskCompat.execute(new AsyncTask()
    {
      protected Void doInBackground(Void... paramAnonymousVarArgs)
      {
        paramAnonymousVarArgs = SQuery.newQuery().select(MaindbContract.Checker.CONTENT_URI, CheckerRecord.PROJECTION);
        if (paramAnonymousVarArgs != null) {
          if (!paramAnonymousVarArgs.moveToFirst()) {}
        }
        for (;;)
        {
          if ((paramAnonymousVarArgs.getInt(1) != 0) && (MarketChecker.isAlarmScheduledForChecker(this.val$appContext, paramAnonymousVarArgs.getInt(0)))) {}
          while (!paramAnonymousVarArgs.moveToNext())
          {
            paramAnonymousVarArgs.close();
            return null;
            MarketChecker.resetAlarmManagerForChecker(this.val$appContext, CheckerRecord.fromCursor(paramAnonymousVarArgs), true);
          }
        }
      }
    }, new Void[0]);
  }
  
  public static void checkMarketAsyncForCheckerRecord(Context paramContext, CheckerRecord paramCheckerRecord)
  {
    if ((paramCheckerRecord == null) || (!paramCheckerRecord.getEnabled())) {
      return;
    }
    for (;;)
    {
      Context localContext;
      synchronized (LOCK)
      {
        localContext = paramContext.getApplicationContext();
        if (requestQueue != null)
        {
          CheckerVolleyAsyncTask localCheckerVolleyAsyncTask = new com/mobnetic/coinguardian/volley/CheckerVolleyAsyncTask;
          paramContext = requestQueue;
          Response.Listener local2 = new com/mobnetic/coinguardian/receiver/MarketChecker$2;
          local2.<init>(localContext, paramCheckerRecord);
          Response.ErrorListener local3 = new com/mobnetic/coinguardian/receiver/MarketChecker$3;
          local3.<init>(localContext, paramCheckerRecord);
          localCheckerVolleyAsyncTask.<init>(paramContext, paramCheckerRecord, local2, local3);
          AsyncTaskCompat.execute(localCheckerVolleyAsyncTask, new Void[0]);
        }
      }
      requestQueue = HttpsHelper.newRequestQueue(localContext);
    }
  }
  
  private static Intent createIntentForCheckerRecord(Context paramContext, long paramLong)
  {
    paramContext = new Intent(paramContext, MarketChecker.class);
    paramContext.setAction("com.mobnetic.coinguardian.receiver.action.check_market");
    paramContext.putExtra("checker_record_id", paramLong);
    paramContext.setData(Uri.parse(paramContext.toUri(1)));
    return paramContext;
  }
  
  private static PendingIntent createPendingIntentForMarket(Context paramContext, long paramLong)
  {
    return PendingIntent.getBroadcast(paramContext, (int)paramLong, createIntentForCheckerRecord(paramContext, paramLong), 134217728);
  }
  
  private static void handleNewTicker(Context paramContext, CheckerRecord paramCheckerRecord, Ticker paramTicker, String paramString)
  {
    paramCheckerRecord.setLastCheckDate(System.currentTimeMillis());
    paramCheckerRecord.setErrorMsg(paramString);
    if (paramTicker != null)
    {
      paramCheckerRecord.setPreviousCheckTicker(paramCheckerRecord.getLastCheckTicker());
      paramCheckerRecord.setLastCheckTicker(TickerUtils.toJson(paramTicker));
    }
    paramCheckerRecord.save();
    NotificationUtils.showOngoingNotification(paramContext, paramCheckerRecord, NotificationUtils.checkfThereIsAlertSituationAndShowAlertNotification(paramContext, paramCheckerRecord, paramTicker));
    WidgetProvider.refreshWidget(paramContext);
  }
  
  public static boolean isAlarmScheduledForChecker(Context paramContext, long paramLong)
  {
    if (PendingIntent.getBroadcast(paramContext, (int)paramLong, createIntentForCheckerRecord(paramContext, paramLong), 536870912) != null) {}
    for (boolean bool = true;; bool = false) {
      return bool;
    }
  }
  
  public static void refreshAllEnabledCheckerRecords(Context paramContext)
  {
    Iterator localIterator = SQuery.newQuery().expr("enabled", " = ", true).select(MaindbContract.Checker.CONTENT_URI, CheckersListFragment.getSortOrderString(paramContext)).iterator();
    while (localIterator.hasNext()) {
      checkMarketAsyncForCheckerRecord(paramContext, (CheckerRecord)localIterator.next());
    }
  }
  
  public static void resetAlarmManager(Context paramContext)
  {
    Context localContext = paramContext.getApplicationContext();
    paramContext = SQuery.newQuery().select(MaindbContract.Checker.CONTENT_URI).iterator();
    while (paramContext.hasNext()) {
      resetAlarmManagerForChecker(localContext, (CheckerRecord)paramContext.next(), true);
    }
  }
  
  public static void resetAlarmManagerForAllEnabledThatUseGlobalFrequency(Context paramContext)
  {
    paramContext = paramContext.getApplicationContext();
    Iterator localIterator = SQuery.newQuery().expr("frequency", " = ", -1L).and().expr("enabled", " = ", true).select(MaindbContract.Checker.CONTENT_URI).iterator();
    while (localIterator.hasNext()) {
      resetAlarmManagerForChecker(paramContext, (CheckerRecord)localIterator.next(), true);
    }
  }
  
  public static void resetAlarmManagerForChecker(Context paramContext, CheckerRecord paramCheckerRecord, boolean paramBoolean)
  {
    AlarmManager localAlarmManager = (AlarmManager)paramContext.getSystemService("alarm");
    if (paramCheckerRecord.getEnabled())
    {
      if (paramBoolean) {
        checkMarketAsyncForCheckerRecord(paramContext, paramCheckerRecord);
      }
      PendingIntent localPendingIntent = createPendingIntentForMarket(paramContext, paramCheckerRecord.getId());
      localAlarmManager.cancel(localPendingIntent);
      long l = CheckerRecordHelper.getDisplayedFrequency(paramContext, paramCheckerRecord);
      localAlarmManager.setInexactRepeating(2, SystemClock.elapsedRealtime() + l, l, localPendingIntent);
    }
    for (;;)
    {
      return;
      cancelCheckingForCheckerRecord(paramCheckerRecord.getId());
      localAlarmManager.cancel(createPendingIntentForMarket(paramContext, paramCheckerRecord.getId()));
    }
  }
  
  public void onReceive(Context paramContext, Intent paramIntent)
  {
    if (paramIntent == null) {}
    for (;;)
    {
      return;
      if ("com.mobnetic.coinguardian.receiver.action.check_market".equals(paramIntent.getAction()))
      {
        long l = paramIntent.getLongExtra("checker_record_id", -1L);
        if (l > 0L) {
          checkMarketAsyncForCheckerRecord(paramContext, CheckerRecord.get(l));
        }
      }
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/receiver/MarketChecker.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */