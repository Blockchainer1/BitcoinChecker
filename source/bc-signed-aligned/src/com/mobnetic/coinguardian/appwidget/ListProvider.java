package com.mobnetic.coinguardian.appwidget;

import android.annotation.TargetApi;
import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.os.Bundle;
import android.widget.RemoteViews;
import android.widget.RemoteViewsService.RemoteViewsFactory;
import com.mobnetic.coinguardian.db.content.CheckerRecord;
import com.mobnetic.coinguardian.db.content.MaindbContract.Checker;
import com.mobnetic.coinguardian.fragment.CheckersListFragment;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import com.mobnetic.coinguardian.util.FormatUtils;
import com.mobnetic.coinguardian.util.MarketsConfigUtils;
import com.mobnetic.coinguardian.util.NotificationUtils;
import com.mobnetic.coinguardian.util.TickerUtils;
import com.robotoworks.mechanoid.db.SQuery;
import java.util.List;

@TargetApi(11)
public class ListProvider
  implements RemoteViewsService.RemoteViewsFactory
{
  private int appWidgetId;
  private Context context = null;
  private List<CheckerRecord> items;
  
  public ListProvider(Context paramContext, Intent paramIntent)
  {
    this.context = paramContext;
    this.appWidgetId = paramIntent.getIntExtra("appWidgetId", 0);
  }
  
  private void refreshItems()
  {
    this.items = SQuery.newQuery().expr("enabled", " = ", true).select(MaindbContract.Checker.CONTENT_URI, CheckersListFragment.getSortOrderString(this.context));
  }
  
  public int getCount()
  {
    if (this.items != null) {}
    for (int i = this.items.size();; i = 0) {
      return i;
    }
  }
  
  public long getItemId(int paramInt)
  {
    CheckerRecord localCheckerRecord = (CheckerRecord)this.items.get(paramInt);
    if (localCheckerRecord != null) {}
    for (long l = localCheckerRecord.getId();; l = paramInt) {
      return l;
    }
  }
  
  public RemoteViews getLoadingView()
  {
    return null;
  }
  
  public RemoteViews getViewAt(int paramInt)
  {
    boolean bool1 = WidgetPrefsUtils.getCompactMode(this.context, this.appWidgetId);
    boolean bool2 = WidgetPrefsUtils.getDarkTheme(this.context, this.appWidgetId);
    Object localObject1 = this.context.getResources();
    int i;
    label67:
    int k;
    label93:
    RemoteViews localRemoteViews;
    CheckerRecord localCheckerRecord;
    Object localObject2;
    long l;
    if (bool2)
    {
      i = 2131558419;
      int j = ((Resources)localObject1).getColor(i);
      localObject1 = this.context.getResources();
      if (!bool2) {
        break label418;
      }
      i = 2131558421;
      k = ((Resources)localObject1).getColor(i);
      localObject1 = this.context.getPackageName();
      if (!bool1) {
        break label425;
      }
      i = 2130903089;
      localRemoteViews = new RemoteViews((String)localObject1, i);
      localCheckerRecord = (CheckerRecord)this.items.get(paramInt);
      localObject1 = MarketsConfigUtils.getMarketByKey(localCheckerRecord.getMarketKey());
      localRemoteViews.setTextColor(2131624058, k);
      localRemoteViews.setTextViewText(2131624058, ((Market)localObject1).name);
      localRemoteViews.setTextColor(2131624056, j);
      localObject1 = FormatUtils.getCurrencySrcWithContractType(localCheckerRecord.getCurrencySrc(), (Market)localObject1, (int)localCheckerRecord.getContractType());
      localObject2 = this.context.getString(2131165294, new Object[] { localObject1, localCheckerRecord.getCurrencyDst() });
      localObject1 = localObject2;
      if (bool1) {
        localObject1 = this.context.getString(2131165280, new Object[] { localObject2 });
      }
      localRemoteViews.setTextViewText(2131624056, (CharSequence)localObject1);
      localObject1 = TickerUtils.fromJson(localCheckerRecord.getLastCheckTicker());
      if (localCheckerRecord.getErrorMsg() == null) {
        break label432;
      }
      localRemoteViews.setTextViewText(2131624062, this.context.getString(2131165199));
      localRemoteViews.setViewVisibility(2131624097, 8);
      l = localCheckerRecord.getLastCheckDate();
      label294:
      if ((bool1) || ((localObject1 == null) && (localCheckerRecord.getErrorMsg() == null))) {
        break label541;
      }
      paramInt = 0;
      label313:
      localRemoteViews.setViewVisibility(2131624096, paramInt);
      localRemoteViews.setTextColor(2131624062, k);
      if (!bool1)
      {
        localRemoteViews.setTextColor(2131624061, k);
        if (l != -1L) {
          break label547;
        }
        localRemoteViews.setViewVisibility(2131624063, 8);
      }
    }
    for (;;)
    {
      localObject1 = new Bundle();
      ((Bundle)localObject1).putLong("checker_record_id", localCheckerRecord.getId());
      localObject2 = new Intent();
      ((Intent)localObject2).putExtras((Bundle)localObject1);
      localRemoteViews.setOnClickFillInIntent(2131624095, (Intent)localObject2);
      return localRemoteViews;
      i = 2131558420;
      break;
      label418:
      i = 2131558422;
      break label67;
      label425:
      i = 2130903088;
      break label93;
      label432:
      if (localObject1 != null)
      {
        localObject2 = TickerUtils.fromJson(localCheckerRecord.getPreviousCheckTicker());
        localRemoteViews.setTextViewText(2131624062, FormatUtils.formatPriceWithCurrency(((Ticker)localObject1).last, localCheckerRecord));
        if (!bool2) {}
        for (bool2 = true;; bool2 = false)
        {
          localRemoteViews.setImageViewResource(2131624097, NotificationUtils.getIconResIdForTickers((Ticker)localObject2, (Ticker)localObject1, bool2));
          localRemoteViews.setViewVisibility(2131624097, 0);
          l = ((Ticker)localObject1).timestamp;
          break;
        }
      }
      localRemoteViews.setTextViewText(2131624062, this.context.getString(2131165297));
      localRemoteViews.setViewVisibility(2131624097, 8);
      l = -1L;
      break label294;
      label541:
      paramInt = 8;
      break label313;
      label547:
      localRemoteViews.setTextColor(2131624063, k);
      localRemoteViews.setTextViewText(2131624063, FormatUtils.formatSameDayTimeOrDate(this.context, l));
      localRemoteViews.setViewVisibility(2131624063, 0);
    }
  }
  
  public int getViewTypeCount()
  {
    return 1;
  }
  
  public boolean hasStableIds()
  {
    return true;
  }
  
  public void onCreate() {}
  
  public void onDataSetChanged()
  {
    refreshItems();
  }
  
  public void onDestroy()
  {
    this.items = null;
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/appwidget/ListProvider.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */