package com.mobnetic.coinguardian.receiver;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.net.NetworkInfo;
import com.mobnetic.coinguardian.db.content.CheckerRecord;
import com.mobnetic.coinguardian.db.content.MaindbContract.Checker;
import com.mobnetic.coinguardian.fragment.CheckersListFragment;
import com.mobnetic.coinguardian.util.PreferencesUtils;
import com.robotoworks.mechanoid.db.SQuery;
import java.util.Iterator;
import java.util.List;

public class MyHelperEventsReceiver
  extends BroadcastReceiver
{
  public void onReceive(Context paramContext, Intent paramIntent)
  {
    if ("android.intent.action.BOOT_COMPLETED".equals(paramIntent.getAction())) {
      MarketChecker.resetAlarmManager(paramContext);
    }
    for (;;)
    {
      return;
      if (!"android.net.conn.CONNECTIVITY_CHANGE".equals(paramIntent.getAction())) {
        continue;
      }
      try
      {
        paramIntent = (NetworkInfo)paramIntent.getParcelableExtra("networkInfo");
        if ((paramIntent == null) || (!paramIntent.isConnectedOrConnecting())) {
          continue;
        }
        long l = System.currentTimeMillis();
        paramIntent = SQuery.newQuery().expr("enabled", " = ", true).and();
        StringBuilder localStringBuilder = new java/lang/StringBuilder;
        localStringBuilder.<init>();
        paramIntent = paramIntent.append("((lastCheckDate > " + Long.toString(l) + ") OR (" + "frequency" + " = " + -1L + " AND " + "lastCheckDate" + " < " + Long.toString(l - PreferencesUtils.getCheckGlobalFrequency(paramContext)) + ") OR (" + "frequency" + " <> " + -1L + " AND " + "lastCheckDate" + " < " + Long.toString(l) + "-" + "frequency" + "))", new String[0]).select(MaindbContract.Checker.CONTENT_URI, CheckersListFragment.getSortOrderString(paramContext)).iterator();
        while (paramIntent.hasNext()) {
          MarketChecker.checkMarketAsyncForCheckerRecord(paramContext, (CheckerRecord)paramIntent.next());
        }
      }
      catch (Throwable paramContext)
      {
        paramContext.printStackTrace();
      }
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/receiver/MyHelperEventsReceiver.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */