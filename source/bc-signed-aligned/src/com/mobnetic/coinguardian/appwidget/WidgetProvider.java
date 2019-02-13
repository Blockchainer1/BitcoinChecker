package com.mobnetic.coinguardian.appwidget;

import android.annotation.TargetApi;
import android.app.PendingIntent;
import android.appwidget.AppWidgetManager;
import android.appwidget.AppWidgetProvider;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.net.Uri;
import android.os.Build.VERSION;
import android.widget.RemoteViews;
import com.mobnetic.coinguardian.receiver.NotificationAndWidgetReceiver;
import com.mobnetic.coinguardian.util.NotificationUtils;

public class WidgetProvider
  extends AppWidgetProvider
{
  private static int getWidgetBackgroundForAlpha(boolean paramBoolean, int paramInt)
  {
    int i = 2130837593;
    if (paramInt == 100) {
      if (paramBoolean) {
        i = 2130837598;
      }
    }
    for (;;)
    {
      return i;
      if (paramInt >= 90)
      {
        if (paramBoolean) {
          i = 2130837602;
        } else {
          i = 2130837597;
        }
      }
      else if (paramInt >= 75)
      {
        if (paramBoolean) {
          i = 2130837601;
        } else {
          i = 2130837596;
        }
      }
      else if (paramInt >= 50)
      {
        if (paramBoolean) {
          i = 2130837600;
        } else {
          i = 2130837595;
        }
      }
      else if (paramInt >= 25)
      {
        if (paramBoolean) {
          i = 2130837599;
        } else {
          i = 2130837594;
        }
      }
      else if (paramInt >= 0) {
        i = 2130837680;
      }
    }
  }
  
  @TargetApi(11)
  public static void refreshWidget(Context paramContext)
  {
    if (Build.VERSION.SDK_INT >= 11)
    {
      AppWidgetManager localAppWidgetManager = AppWidgetManager.getInstance(paramContext);
      localAppWidgetManager.notifyAppWidgetViewDataChanged(localAppWidgetManager.getAppWidgetIds(new ComponentName(paramContext, WidgetProvider.class)), 2131624093);
    }
  }
  
  @TargetApi(11)
  public static final void updateWdgetWithId(Context paramContext, AppWidgetManager paramAppWidgetManager, int paramInt)
  {
    RemoteViews localRemoteViews;
    Object localObject;
    int j;
    if (Build.VERSION.SDK_INT >= 11)
    {
      localRemoteViews = new RemoteViews(paramContext.getPackageName(), 2130903087);
      boolean bool = WidgetPrefsUtils.getDarkTheme(paramContext, paramInt);
      localObject = paramContext.getResources();
      if (!bool) {
        break label371;
      }
      i = 2131558419;
      j = ((Resources)localObject).getColor(i);
      localRemoteViews.setInt(2131624089, "setBackgroundResource", getWidgetBackgroundForAlpha(bool, WidgetPrefsUtils.getAlphaPercent(paramContext, paramInt)));
      if (!bool) {
        break label378;
      }
      i = 2130837676;
      label80:
      localRemoteViews.setInt(2131624090, "setBackgroundResource", i);
      if (!bool) {
        break label385;
      }
      i = 2130837674;
      label99:
      localRemoteViews.setInt(2131624091, "setBackgroundResource", i);
      if (!WidgetPrefsUtils.getShowActionBar(paramContext, paramInt)) {
        break label392;
      }
      i = 0;
      label120:
      localRemoteViews.setTextColor(2131623948, j);
      localRemoteViews.setViewVisibility(2131624090, i);
      if (!bool) {
        break label399;
      }
      j = 2131558414;
      label145:
      localRemoteViews.setImageViewResource(2131624092, j);
      localRemoteViews.setViewVisibility(2131624092, i);
      localObject = paramContext.getResources();
      if (!bool) {
        break label406;
      }
      i = 2131558417;
      label176:
      localRemoteViews.setTextColor(2131624094, ((Resources)localObject).getColor(i));
      localObject = new Intent(paramContext, WidgetService.class);
      ((Intent)localObject).putExtra("appWidgetId", paramInt);
      ((Intent)localObject).setData(Uri.parse(((Intent)localObject).toUri(1)));
      localRemoteViews.setRemoteAdapter(paramInt, 2131624093, (Intent)localObject);
      localRemoteViews.setEmptyView(2131624093, 2131624094);
      localRemoteViews.setTextViewText(2131624094, paramContext.getString(2131165459));
      localObject = NotificationUtils.createMainActivityPendingIntent(paramContext);
      localRemoteViews.setOnClickPendingIntent(2131624090, (PendingIntent)localObject);
      localRemoteViews.setOnClickPendingIntent(2131624094, (PendingIntent)localObject);
      if (!bool) {
        break label413;
      }
    }
    label371:
    label378:
    label385:
    label392:
    label399:
    label406:
    label413:
    for (int i = 2130837615;; i = 2130837614)
    {
      localRemoteViews.setImageViewResource(2131624091, i);
      localRemoteViews.setOnClickPendingIntent(2131624091, PendingIntent.getBroadcast(paramContext, 0, new Intent("com.mobnetic.coinguardian.receiver.action.notification_refresh_all", null, paramContext, NotificationAndWidgetReceiver.class), 134217728));
      localObject = new Intent("com.mobnetic.coinguardian.receiver.action.notification_refresh", null, paramContext, NotificationAndWidgetReceiver.class);
      ((Intent)localObject).setData(Uri.parse(((Intent)localObject).toUri(1)));
      localRemoteViews.setPendingIntentTemplate(2131624093, PendingIntent.getBroadcast(paramContext, 0, (Intent)localObject, 134217728));
      paramAppWidgetManager.updateAppWidget(paramInt, localRemoteViews);
      return;
      i = 2131558420;
      break;
      i = 2130837677;
      break label80;
      i = 2130837675;
      break label99;
      i = 8;
      break label120;
      j = 2131558415;
      break label145;
      i = 2131558418;
      break label176;
    }
  }
  
  public void onDeleted(Context paramContext, int[] paramArrayOfInt)
  {
    super.onDeleted(paramContext, paramArrayOfInt);
  }
  
  public void onDisabled(Context paramContext)
  {
    super.onDisabled(paramContext);
  }
  
  public void onEnabled(Context paramContext)
  {
    super.onEnabled(paramContext);
  }
  
  public void onReceive(Context paramContext, Intent paramIntent)
  {
    super.onReceive(paramContext, paramIntent);
  }
  
  @TargetApi(11)
  public void onUpdate(Context paramContext, AppWidgetManager paramAppWidgetManager, int[] paramArrayOfInt)
  {
    if (Build.VERSION.SDK_INT >= 11)
    {
      for (int i = 0; i < paramArrayOfInt.length; i++) {
        updateWdgetWithId(paramContext, paramAppWidgetManager, paramArrayOfInt[i]);
      }
      paramAppWidgetManager.notifyAppWidgetViewDataChanged(paramArrayOfInt, 2131624093);
    }
    super.onUpdate(paramContext, paramAppWidgetManager, paramArrayOfInt);
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/appwidget/WidgetProvider.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */