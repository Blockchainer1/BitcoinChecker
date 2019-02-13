package com.mobnetic.coinguardian.util;

import android.annotation.TargetApi;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.net.Uri;
import android.os.Build.VERSION;
import android.support.v4.app.NotificationCompat.BigTextStyle;
import android.support.v4.app.NotificationCompat.Builder;
import android.support.v4.app.NotificationCompat.Style;
import android.support.v4.app.NotificationManagerCompat;
import android.text.Html;
import android.text.SpannableStringBuilder;
import android.text.Spanned;
import android.text.SpannedString;
import android.text.TextUtils;
import android.widget.RemoteViews;
import com.mobnetic.coinguardian.activity.CheckerAddActivity;
import com.mobnetic.coinguardian.activity.CheckersListActivity;
import com.mobnetic.coinguardian.alarm.AlarmKlaxonHelper;
import com.mobnetic.coinguardian.db.content.AlarmRecord;
import com.mobnetic.coinguardian.db.content.CheckerRecord;
import com.mobnetic.coinguardian.db.content.MaindbContract.Checker;
import com.mobnetic.coinguardian.model.CurrencySubunit;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import com.mobnetic.coinguardian.receiver.NotificationAndWidgetReceiver;
import com.robotoworks.mechanoid.db.SQuery;
import java.math.BigDecimal;
import java.util.Iterator;
import java.util.List;

public class NotificationUtils
{
  private static final String NOTIFICATION_ALARM_TAG = "alarm";
  private static final String NOTIFICATION_CHECKER_TAG = "checker";
  
  public static boolean checkfThereIsAlertSituationAndShowAlertNotification(Context paramContext, CheckerRecord paramCheckerRecord, Ticker paramTicker)
  {
    NotificationManagerCompat localNotificationManagerCompat = NotificationManagerCompat.from(paramContext);
    boolean bool = false;
    if (!paramCheckerRecord.getEnabled())
    {
      clearAlarmNotificationForCheckerRecord(paramContext, localNotificationManagerCompat, paramCheckerRecord);
      bool = false;
    }
    for (;;)
    {
      return bool;
      if (paramCheckerRecord.getErrorMsg() != null)
      {
        bool = false;
      }
      else
      {
        Iterator localIterator = CheckerRecordHelper.getAlarmsForCheckerRecord(paramCheckerRecord, false).iterator();
        while (localIterator.hasNext())
        {
          AlarmRecord localAlarmRecord = (AlarmRecord)localIterator.next();
          if (localAlarmRecord != null) {
            if (!localAlarmRecord.getEnabled())
            {
              localNotificationManagerCompat.cancel("alarm", (int)localAlarmRecord.getId());
            }
            else
            {
              int i = 1;
              int j = 0;
              Object localObject1 = null;
              Object localObject2 = null;
              Object localObject3 = "";
              Market localMarket = MarketsConfigUtils.getMarketByKey(paramCheckerRecord.getMarketKey());
              Object localObject4 = FormatUtils.getCurrencySrcWithContractType(paramCheckerRecord.getCurrencySrc(), localMarket, (int)paramCheckerRecord.getContractType());
              Object localObject5 = CurrencyUtils.getCurrencySubunit(paramCheckerRecord.getCurrencyDst(), paramCheckerRecord.getCurrencySubunitDst());
              int k = (int)localAlarmRecord.getType();
              switch (k)
              {
              default: 
                k = 0;
              }
              for (;;)
              {
                if (k != 0) {
                  break label1587;
                }
                localNotificationManagerCompat.cancel("alarm", (int)localAlarmRecord.getId());
                break;
                Ticker localTicker = TickerUtils.fromJson(localAlarmRecord.getLastCheckPointTicker());
                if (localTicker == null)
                {
                  localAlarmRecord.setLastCheckPointTicker(TickerUtils.toJson(paramTicker));
                  localAlarmRecord.save();
                  k = 0;
                }
                else
                {
                  double d1 = AlarmRecordHelper.getDifferenceForPercentageChange(localTicker.last, paramTicker.last);
                  double d2 = localAlarmRecord.getValue();
                  if ((k == 0) && (Math.abs(d1) < d2))
                  {
                    k = 0;
                  }
                  else if ((k == 1) && (d1 < d2))
                  {
                    k = 0;
                  }
                  else if ((k == 2) && (d1 > -d2))
                  {
                    k = 0;
                  }
                  else
                  {
                    localAlarmRecord.setLastCheckPointTicker(TickerUtils.toJson(paramTicker));
                    localAlarmRecord.save();
                    int m;
                    if (d1 < 0.0D)
                    {
                      m = 1;
                      label380:
                      if (m == 0) {
                        break label712;
                      }
                      k = 2131165323;
                      label389:
                      localObject1 = paramContext.getString(k);
                      localObject4 = Html.fromHtml(paramContext.getString(2131165321, new Object[] { localObject4, "<b>" + FormatUtils.formatPriceWithCurrency(paramTicker.last, (CurrencySubunit)localObject5) + "</b>", localMarket.name }));
                      localObject2 = new StringBuilder().append("<b>");
                      if (d1 <= 0.0D) {
                        break label719;
                      }
                    }
                    Object localObject6;
                    label712:
                    label719:
                    for (localObject3 = "+";; localObject3 = "")
                    {
                      localObject6 = Html.fromHtml(paramContext.getString(2131165318, new Object[] { (String)localObject3 + FormatUtils.formatDouble(d1, false) + "%</b>", "<b>" + FormatUtils.formatPriceWithCurrency(localTicker.last, (CurrencySubunit)localObject5) + "</b>", FormatUtils.formatRelativeTime(paramContext, localTicker.timestamp, paramTicker.timestamp, true) }));
                      localObject5 = paramContext.getString(2131165325, new Object[] { localObject1, FormatUtils.formatTextForTTS(paramContext, localTicker.last, paramCheckerRecord, true, (CurrencySubunit)localObject5, true, localMarket, true), FormatUtils.formatTextForTTS(paramContext, paramTicker.last, paramCheckerRecord, true, (CurrencySubunit)localObject5, false, localMarket, false) });
                      j = m;
                      k = i;
                      localObject1 = localObject6;
                      localObject2 = localObject4;
                      localObject3 = localObject5;
                      if (!PreferencesUtils.getTTSFormatSpeakBaseCurrency(paramContext)) {
                        break;
                      }
                      localObject3 = paramContext.getString(2131165455, new Object[] { paramCheckerRecord.getCurrencySrc(), localObject5 });
                      j = m;
                      k = i;
                      localObject1 = localObject6;
                      localObject2 = localObject4;
                      break;
                      m = 0;
                      break label380;
                      k = 2131165326;
                      break label389;
                    }
                    localTicker = TickerUtils.fromJson(localAlarmRecord.getLastCheckPointTicker());
                    if (localTicker == null)
                    {
                      localAlarmRecord.setLastCheckPointTicker(TickerUtils.toJson(paramTicker));
                      localAlarmRecord.save();
                      k = 0;
                    }
                    else
                    {
                      BigDecimal localBigDecimal = FormatUtils.fixSatoshi(localAlarmRecord.getValue());
                      localObject6 = FormatUtils.fixSatoshi(paramTicker.last).subtract(FormatUtils.fixSatoshi(localTicker.last));
                      if ((k == 3) && (((BigDecimal)localObject6).abs().compareTo(localBigDecimal) < 0))
                      {
                        k = 0;
                      }
                      else if ((k == 4) && (((BigDecimal)localObject6).compareTo(localBigDecimal) < 0))
                      {
                        k = 0;
                      }
                      else if ((k == 5) && (((BigDecimal)localObject6).compareTo(localBigDecimal.negate()) > 0))
                      {
                        k = 0;
                      }
                      else
                      {
                        localAlarmRecord.setLastCheckPointTicker(TickerUtils.toJson(paramTicker));
                        localAlarmRecord.save();
                        if (((BigDecimal)localObject6).doubleValue() < 0.0D)
                        {
                          m = 1;
                          label892:
                          if (m == 0) {
                            break label1231;
                          }
                          k = 2131165323;
                          label901:
                          localObject1 = paramContext.getString(k);
                          localObject4 = Html.fromHtml(paramContext.getString(2131165322, new Object[] { localObject4, "<b>" + FormatUtils.formatPriceWithCurrency(paramTicker.last, (CurrencySubunit)localObject5) + "</b>", localMarket.name }));
                          localObject2 = new StringBuilder().append("<b>");
                          if (((BigDecimal)localObject6).doubleValue() <= 0.0D) {
                            break label1238;
                          }
                        }
                        label1231:
                        label1238:
                        for (localObject3 = "+";; localObject3 = "")
                        {
                          localObject6 = Html.fromHtml(paramContext.getString(2131165319, new Object[] { (String)localObject3 + FormatUtils.formatPriceWithCurrency(((BigDecimal)localObject6).doubleValue(), (CurrencySubunit)localObject5) + "</b>", "<b>" + FormatUtils.formatPriceWithCurrency(localTicker.last, (CurrencySubunit)localObject5) + "</b>", FormatUtils.formatRelativeTime(paramContext, localTicker.timestamp, paramTicker.timestamp, true) }));
                          localObject5 = paramContext.getString(2131165325, new Object[] { localObject1, FormatUtils.formatTextForTTS(paramContext, localTicker.last, paramCheckerRecord, true, (CurrencySubunit)localObject5, true, localMarket, true), FormatUtils.formatTextForTTS(paramContext, paramTicker.last, paramCheckerRecord, true, (CurrencySubunit)localObject5, false, localMarket, false) });
                          j = m;
                          k = i;
                          localObject1 = localObject6;
                          localObject2 = localObject4;
                          localObject3 = localObject5;
                          if (!PreferencesUtils.getTTSFormatSpeakBaseCurrency(paramContext)) {
                            break;
                          }
                          localObject3 = paramContext.getString(2131165455, new Object[] { paramCheckerRecord.getCurrencySrc(), localObject5 });
                          j = m;
                          k = i;
                          localObject1 = localObject6;
                          localObject2 = localObject4;
                          break;
                          m = 0;
                          break label892;
                          k = 2131165326;
                          break label901;
                        }
                        if (paramTicker.last < localAlarmRecord.getValue())
                        {
                          k = 0;
                        }
                        else
                        {
                          j = 0;
                          localObject2 = Html.fromHtml(paramContext.getString(2131165320, new Object[] { localObject4, "<b>" + FormatUtils.formatPriceWithCurrency(paramTicker.last, (CurrencySubunit)localObject5) + "</b>", localMarket.name }));
                          localObject1 = Html.fromHtml(paramContext.getString(2131165316, new Object[] { "<b>" + FormatUtils.formatPriceWithCurrency(localAlarmRecord.getValue(), (CurrencySubunit)localObject5) + "</b>" }));
                          localObject3 = paramContext.getString(2131165324, new Object[] { FormatUtils.formatTextForTTS(paramContext, paramTicker.last, paramCheckerRecord, (CurrencySubunit)localObject5, localMarket) });
                          k = i;
                          continue;
                          if (paramTicker.last > localAlarmRecord.getValue())
                          {
                            k = 0;
                          }
                          else
                          {
                            j = 1;
                            localObject2 = Html.fromHtml(paramContext.getString(2131165320, new Object[] { localObject4, "<b>" + FormatUtils.formatPriceWithCurrency(paramTicker.last, (CurrencySubunit)localObject5) + "</b>", localMarket.name }));
                            localObject1 = Html.fromHtml(paramContext.getString(2131165317, new Object[] { "<b>" + FormatUtils.formatPriceWithCurrency(localAlarmRecord.getValue(), (CurrencySubunit)localObject5) + "</b>" }));
                            localObject3 = paramContext.getString(2131165324, new Object[] { FormatUtils.formatTextForTTS(paramContext, paramTicker.last, paramCheckerRecord, (CurrencySubunit)localObject5, localMarket) });
                            k = i;
                          }
                        }
                      }
                    }
                  }
                }
              }
              label1587:
              localObject2 = new NotificationCompat.Builder(paramContext).setContentTitle((CharSequence)localObject2).setContentText((CharSequence)localObject1).setTicker((CharSequence)localObject2).setOngoing(false).setAutoCancel(true).setOnlyAlertOnce(false).setWhen(paramTicker.timestamp).setPriority(2).setContentIntent(createCheckerAlertDetailsPendingIntent(paramContext, paramCheckerRecord, localAlarmRecord));
              if (Build.VERSION.SDK_INT >= 21) {
                if (j != 0)
                {
                  k = 2130837632;
                  label1663:
                  ((NotificationCompat.Builder)localObject2).setSmallIcon(k);
                  localObject1 = paramContext.getResources();
                  if (j == 0) {
                    break label1901;
                  }
                  k = 2131558407;
                  label1687:
                  ((NotificationCompat.Builder)localObject2).setColor(((Resources)localObject1).getColor(k));
                  ((NotificationCompat.Builder)localObject2).setDeleteIntent(createAlarmDismissPendingIntent(paramContext, paramCheckerRecord, localAlarmRecord));
                  if (0 == 0) {
                    break label1938;
                  }
                  ((NotificationCompat.Builder)localObject2).addAction(2130837630, paramContext.getResources().getString(2131165315), AlarmKlaxonHelper.createAlarmKlaxonDismissPendingIntent(paramContext, paramCheckerRecord.getId(), localAlarmRecord.getId()));
                  label1749:
                  if (localAlarmRecord.getVibrate()) {
                    ((NotificationCompat.Builder)localObject2).setVibrate(new long[] { 0L, 500L, 250L, 500L });
                  }
                  if (localAlarmRecord.getLed()) {
                    if (j == 0) {
                      break label1984;
                    }
                  }
                }
              }
              label1901:
              label1938:
              label1984:
              for (k = -65536;; k = -16711936)
              {
                ((NotificationCompat.Builder)localObject2).setLights(k, 1000, 1000);
                localNotificationManagerCompat.cancel("alarm", (int)localAlarmRecord.getId());
                localNotificationManagerCompat.notify("alarm", (int)localAlarmRecord.getId(), ((NotificationCompat.Builder)localObject2).build());
                if (0 != 0) {
                  AlarmKlaxonHelper.startAlarmKlaxon(paramContext, localAlarmRecord);
                }
                if ((!localAlarmRecord.getTtsEnabled()) || (TextUtils.isEmpty((CharSequence)localObject3))) {
                  break;
                }
                TTSHelper.speak(paramContext.getApplicationContext(), (String)localObject3);
                bool |= true;
                break;
                k = 2130837634;
                break label1663;
                k = 2131558406;
                break label1687;
                if (j != 0) {}
                for (k = 2130837631;; k = 2130837633)
                {
                  ((NotificationCompat.Builder)localObject2).setSmallIcon(k);
                  break;
                }
                if (!localAlarmRecord.getSound()) {
                  break label1749;
                }
                if (j != 0) {}
                for (localObject1 = PreferencesUtils.getSoundAlarmNotificationDown(paramContext);; localObject1 = PreferencesUtils.getSoundAlarmNotificationUp(paramContext))
                {
                  ((NotificationCompat.Builder)localObject2).setSound(Uri.parse((String)localObject1), PreferencesUtils.getSoundsAdvancedAlarmStream(paramContext));
                  break;
                }
              }
            }
          }
        }
      }
    }
  }
  
  public static void clearAlarmNotificationForAlarmRecord(Context paramContext, long paramLong)
  {
    if (paramLong > 0L) {
      NotificationManagerCompat.from(paramContext).cancel("alarm", (int)paramLong);
    }
  }
  
  private static void clearAlarmNotificationForCheckerRecord(Context paramContext, NotificationManagerCompat paramNotificationManagerCompat, CheckerRecord paramCheckerRecord)
  {
    paramContext = CheckerRecordHelper.getAlarmsIdsForCheckerRecord(paramCheckerRecord.getId()).iterator();
    while (paramContext.hasNext())
    {
      long l = ((Long)paramContext.next()).longValue();
      if (l > 0L) {
        paramNotificationManagerCompat.cancel("alarm", (int)l);
      }
    }
  }
  
  public static void clearAlarmNotificationForCheckerRecord(Context paramContext, CheckerRecord paramCheckerRecord)
  {
    clearAlarmNotificationForCheckerRecord(paramContext, NotificationManagerCompat.from(paramContext), paramCheckerRecord);
  }
  
  public static void clearNotificationsForCheckerRecord(Context paramContext, CheckerRecord paramCheckerRecord)
  {
    NotificationManagerCompat localNotificationManagerCompat = NotificationManagerCompat.from(paramContext);
    clearOngoingNotificationForCheckerRecord(paramContext, localNotificationManagerCompat, paramCheckerRecord);
    clearAlarmNotificationForCheckerRecord(paramContext, localNotificationManagerCompat, paramCheckerRecord);
  }
  
  public static void clearOngoingNotification(Context paramContext, CheckerRecord paramCheckerRecord)
  {
    clearOngoingNotificationForCheckerRecord(paramContext, NotificationManagerCompat.from(paramContext), paramCheckerRecord);
  }
  
  private static void clearOngoingNotificationForCheckerRecord(Context paramContext, NotificationManagerCompat paramNotificationManagerCompat, CheckerRecord paramCheckerRecord)
  {
    paramNotificationManagerCompat.cancel("checker", (int)paramCheckerRecord.getId());
  }
  
  private static PendingIntent createAlarmDismissPendingIntent(Context paramContext, CheckerRecord paramCheckerRecord, AlarmRecord paramAlarmRecord)
  {
    Intent localIntent = new Intent("com.mobnetic.coinguardian.receiver.action.notification_alarm_dismiss", null, paramContext, NotificationAndWidgetReceiver.class);
    localIntent.putExtra("checker_record_id", paramCheckerRecord.getId());
    localIntent.putExtra("alarm_record_id", paramAlarmRecord.getId());
    return PendingIntent.getBroadcast(paramContext, (int)paramAlarmRecord.getId(), localIntent, 134217728);
  }
  
  private static PendingIntent createCheckerAlertDetailsPendingIntent(Context paramContext, CheckerRecord paramCheckerRecord, AlarmRecord paramAlarmRecord)
  {
    Intent localIntent = new Intent("com.mobnetic.coinguardian.receiver.action.notification_checker_alarm_details", null, paramContext, NotificationAndWidgetReceiver.class);
    localIntent.putExtra("checker_record_id", paramCheckerRecord.getId());
    localIntent.putExtra("alarm_record_id", paramAlarmRecord.getId());
    return PendingIntent.getBroadcast(paramContext, (int)paramAlarmRecord.getId(), localIntent, 0);
  }
  
  private static PendingIntent createCheckerDetailsPendingIntent(Context paramContext, CheckerRecord paramCheckerRecord)
  {
    Intent localIntent = new Intent(paramContext, CheckerAddActivity.class);
    localIntent.putExtra("checker_record_id", paramCheckerRecord.getId());
    return PendingIntent.getActivity(paramContext, (int)paramCheckerRecord.getId(), localIntent, 0);
  }
  
  public static PendingIntent createMainActivityPendingIntent(Context paramContext)
  {
    Intent localIntent = new Intent(paramContext, CheckersListActivity.class);
    localIntent.setFlags(603979776);
    return PendingIntent.getActivity(paramContext, 0, localIntent, 0);
  }
  
  public static int getIconBackgroundColorResIdForTickersLollipop(Ticker paramTicker1, Ticker paramTicker2)
  {
    int i;
    if ((paramTicker1 == null) || (paramTicker2 == null) || (paramTicker1.last == paramTicker2.last)) {
      i = 2131558405;
    }
    for (;;)
    {
      return i;
      if (paramTicker2.last > paramTicker1.last) {
        i = 2131558406;
      } else {
        i = 2131558407;
      }
    }
  }
  
  private static int getIconBackgroundResIdForTickersLollipop(Ticker paramTicker1, Ticker paramTicker2)
  {
    int i;
    if ((paramTicker1 == null) || (paramTicker2 == null) || (paramTicker1.last == paramTicker2.last)) {
      i = 2130837603;
    }
    for (;;)
    {
      return i;
      if (paramTicker2.last > paramTicker1.last) {
        i = 2130837604;
      } else {
        i = 2130837605;
      }
    }
  }
  
  private static int getIconResIdForNotification(Ticker paramTicker1, Ticker paramTicker2)
  {
    int i;
    if (Build.VERSION.SDK_INT >= 21)
    {
      i = 1;
      if ((paramTicker1 != null) && (paramTicker2 != null) && (paramTicker1.last != paramTicker2.last)) {
        break label52;
      }
      if (i == 0) {
        break label45;
      }
      i = 2130837641;
    }
    for (;;)
    {
      return i;
      i = 0;
      break;
      label45:
      i = 2130837639;
      continue;
      label52:
      if (paramTicker2.last > paramTicker1.last)
      {
        if (i != 0) {
          i = 2130837643;
        } else {
          i = 2130837642;
        }
      }
      else if (i != 0) {
        i = 2130837636;
      } else {
        i = 2130837635;
      }
    }
  }
  
  public static int getIconResIdForTickers(Ticker paramTicker1, Ticker paramTicker2, boolean paramBoolean)
  {
    int i;
    if ((paramTicker1 == null) || (paramTicker2 == null) || (paramTicker1.last == paramTicker2.last)) {
      if (paramBoolean) {
        i = 2130837640;
      }
    }
    for (;;)
    {
      return i;
      i = 2130837639;
      continue;
      if (paramTicker2.last > paramTicker1.last) {
        i = 2130837642;
      } else {
        i = 2130837635;
      }
    }
  }
  
  public static void refreshOngoingNotifications(Context paramContext)
  {
    Iterator localIterator = SQuery.newQuery().expr("enabled", " = ", true).and().expr("notificationPriority", " >= ", -2).select(MaindbContract.Checker.CONTENT_URI).iterator();
    while (localIterator.hasNext()) {
      showOngoingNotification(paramContext, (CheckerRecord)localIterator.next(), true);
    }
  }
  
  @TargetApi(16)
  public static void showOngoingNotification(Context paramContext, CheckerRecord paramCheckerRecord, boolean paramBoolean)
  {
    NotificationManagerCompat localNotificationManagerCompat = NotificationManagerCompat.from(paramContext);
    if (paramCheckerRecord == null) {}
    label1180:
    label1287:
    label1294:
    label1313:
    for (;;)
    {
      return;
      if (!paramCheckerRecord.getEnabled())
      {
        localNotificationManagerCompat.cancel("checker", (int)paramCheckerRecord.getId());
      }
      else
      {
        Market localMarket = MarketsConfigUtils.getMarketByKey(paramCheckerRecord.getMarketKey());
        Ticker localTicker = TickerUtils.fromJson(paramCheckerRecord.getLastCheckTicker());
        if ((localMarket != null) && ((localTicker != null) || (paramCheckerRecord.getErrorMsg() != null)))
        {
          Object localObject1 = null;
          Object localObject2 = FormatUtils.getCurrencySrcWithContractType(paramCheckerRecord.getCurrencySrc(), localMarket, (int)paramCheckerRecord.getContractType());
          Object localObject3 = paramCheckerRecord.getCurrencyDst();
          CurrencySubunit localCurrencySubunit = CurrencyUtils.getCurrencySubunit((String)localObject3, paramCheckerRecord.getCurrencySubunitDst());
          int i;
          int j;
          long l;
          Object localObject4;
          Object localObject5;
          Object localObject6;
          if (paramCheckerRecord.getNotificationPriority() >= -2L) {
            if (paramCheckerRecord.getErrorMsg() != null)
            {
              i = getIconResIdForNotification(null, null);
              j = getIconBackgroundResIdForTickersLollipop(null, null);
              l = paramCheckerRecord.getLastCheckDate();
              localObject4 = paramContext.getString(2131165334, new Object[] { paramContext.getString(2131165294, new Object[] { localObject2, localObject3 }), localMarket.name });
              localObject5 = paramContext.getString(2131165200, new Object[] { paramCheckerRecord.getErrorMsg() });
              localObject2 = localObject5;
              localObject3 = localObject2;
              localObject6 = new NotificationCompat.Builder(paramContext).setSmallIcon(i).setContentTitle((CharSequence)localObject4).setContentText((CharSequence)localObject2).setOngoing(true).setOnlyAlertOnce(true).setWhen(l).setPriority(-2).setContentIntent(createMainActivityPendingIntent(paramContext));
              if (PreferencesUtils.getCheckNotificationTicker(paramContext)) {
                ((NotificationCompat.Builder)localObject6).setTicker((CharSequence)localObject5);
              }
              if ((Build.VERSION.SDK_INT >= 14) && (PreferencesUtils.getCheckNotificationCustomLayout(paramContext)))
              {
                localObject5 = new RemoteViews(paramContext.getPackageName(), 2130903079);
                ((RemoteViews)localObject5).setImageViewResource(2131624074, i);
                if (Build.VERSION.SDK_INT >= 21)
                {
                  ((RemoteViews)localObject5).setInt(2131624074, "setBackgroundResource", j);
                  ((NotificationCompat.Builder)localObject6).setColor(paramContext.getResources().getColor(getIconBackgroundColorResIdForTickersLollipop((Ticker)localObject1, localTicker)));
                }
                ((RemoteViews)localObject5).setTextViewText(2131624075, (CharSequence)localObject4);
                ((RemoteViews)localObject5).setTextViewText(2131624076, (CharSequence)localObject2);
                localObject2 = new Intent("com.mobnetic.coinguardian.receiver.action.notification_refresh", null, paramContext, NotificationAndWidgetReceiver.class);
                ((Intent)localObject2).putExtra("checker_record_id", paramCheckerRecord.getId());
                ((RemoteViews)localObject5).setOnClickPendingIntent(2131624077, PendingIntent.getBroadcast(paramContext, (int)paramCheckerRecord.getId(), (Intent)localObject2, 134217728));
                ((NotificationCompat.Builder)localObject6).setContent((RemoteViews)localObject5);
              }
              if ((Build.VERSION.SDK_INT >= 16) && (PreferencesUtils.getCheckNotificationExpandable(paramContext)))
              {
                localObject2 = new NotificationCompat.BigTextStyle();
                ((NotificationCompat.BigTextStyle)localObject2).setBigContentTitle((CharSequence)localObject4);
                ((NotificationCompat.BigTextStyle)localObject2).bigText((CharSequence)localObject3);
                ((NotificationCompat.Builder)localObject6).setStyle((NotificationCompat.Style)localObject2);
                ((NotificationCompat.Builder)localObject6).addAction(2130837637, paramContext.getString(2131165296), createCheckerDetailsPendingIntent(paramContext, paramCheckerRecord));
                localObject2 = new Intent("com.mobnetic.coinguardian.receiver.action.notification_refresh", null, paramContext, NotificationAndWidgetReceiver.class);
                ((Intent)localObject2).putExtra("checker_record_id", paramCheckerRecord.getId());
                localObject2 = PendingIntent.getBroadcast(paramContext, (int)paramCheckerRecord.getId(), (Intent)localObject2, 134217728);
                ((NotificationCompat.Builder)localObject6).addAction(2130837638, paramContext.getString(2131165300), (PendingIntent)localObject2);
              }
              localNotificationManagerCompat.notify("checker", (int)paramCheckerRecord.getId(), ((NotificationCompat.Builder)localObject6).build());
            }
          }
          for (;;)
          {
            if ((paramBoolean) || (!paramCheckerRecord.getTtsEnabled()) || (localTicker == null) || (paramCheckerRecord.getErrorMsg() != null)) {
              break label1313;
            }
            paramCheckerRecord = FormatUtils.formatTextForTTS(paramContext, localTicker.last, paramCheckerRecord, localCurrencySubunit, localMarket);
            TTSHelper.speak(paramContext.getApplicationContext(), paramCheckerRecord);
            break;
            if (localTicker == null) {
              break;
            }
            localObject6 = TickerUtils.fromJson(paramCheckerRecord.getPreviousCheckTicker());
            i = getIconResIdForNotification((Ticker)localObject6, localTicker);
            j = getIconBackgroundResIdForTickersLollipop((Ticker)localObject6, localTicker);
            l = localTicker.timestamp;
            localObject4 = Html.fromHtml(paramContext.getString(2131165333, new Object[] { localObject2, "<b>" + FormatUtils.formatPriceWithCurrency(localTicker.last, localCurrencySubunit) + "</b>", localMarket.name }));
            localObject5 = localObject4;
            localObject2 = null;
            localObject3 = localObject2;
            if (localTicker.high >= 0.0D)
            {
              localObject3 = localObject2;
              if (localTicker.low >= 0.0D) {
                localObject3 = Html.fromHtml(paramContext.getString(2131165327, new Object[] { "<b>" + FormatUtils.formatPriceWithCurrency(localTicker.high, localCurrencySubunit) + "</b>", "<b>" + FormatUtils.formatPriceWithCurrency(localTicker.low, localCurrencySubunit) + "</b>" }));
              }
            }
            SpannableStringBuilder localSpannableStringBuilder1 = new SpannableStringBuilder();
            if (localTicker.bid >= 0.0D) {
              localSpannableStringBuilder1.append(Html.fromHtml(paramContext.getString(2131165329, new Object[] { "<b>" + FormatUtils.formatPriceWithCurrency(localTicker.bid, localCurrencySubunit) + "</b>" })));
            }
            if (localTicker.ask >= 0.0D)
            {
              if (localSpannableStringBuilder1.length() > 0) {
                localSpannableStringBuilder1.append(paramContext.getString(2131165331));
              }
              localSpannableStringBuilder1.append(Html.fromHtml(paramContext.getString(2131165328, new Object[] { "<b>" + FormatUtils.formatPriceWithCurrency(localTicker.ask, localCurrencySubunit) + "</b>" })));
            }
            localObject1 = null;
            if (localTicker.vol >= 0.0D) {
              localObject1 = Html.fromHtml(paramContext.getString(2131165332, new Object[] { "<b>" + FormatUtils.formatPriceWithCurrency(localTicker.vol, paramCheckerRecord.getCurrencySrc()) + "</b>" }));
            }
            String str = "";
            SpannableStringBuilder localSpannableStringBuilder2 = new SpannableStringBuilder();
            localObject2 = str;
            if (localObject3 != null)
            {
              localObject2 = str;
              if (((Spanned)localObject3).length() > 0)
              {
                localObject2 = localObject3;
                localSpannableStringBuilder2.append((CharSequence)localObject3);
              }
            }
            localObject3 = localObject2;
            if (localSpannableStringBuilder1 != null)
            {
              localObject3 = localObject2;
              if (localSpannableStringBuilder1.length() > 0)
              {
                if (localSpannableStringBuilder2.length() <= 0) {
                  break label1287;
                }
                localSpannableStringBuilder2.append("\n");
                localSpannableStringBuilder2.append(localSpannableStringBuilder1);
                localObject3 = localObject2;
              }
            }
            localObject2 = localObject3;
            if (localObject1 != null)
            {
              localObject2 = localObject3;
              if (((Spanned)localObject1).length() > 0)
              {
                if (localSpannableStringBuilder2.length() <= 0) {
                  break label1294;
                }
                localSpannableStringBuilder2.append("\n");
              }
            }
            for (localObject2 = localObject3;; localObject2 = localObject1)
            {
              localSpannableStringBuilder2.append((CharSequence)localObject1);
              if (TextUtils.isEmpty(localSpannableStringBuilder2))
              {
                localObject2 = new SpannedString(paramContext.getString(2131165330));
                localSpannableStringBuilder2.append((CharSequence)localObject2);
              }
              localObject3 = localSpannableStringBuilder2;
              localObject1 = localObject6;
              break;
              localObject2 = localSpannableStringBuilder1;
              break label1180;
            }
            localNotificationManagerCompat.cancel("checker", (int)paramCheckerRecord.getId());
          }
        }
      }
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/util/NotificationUtils.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */