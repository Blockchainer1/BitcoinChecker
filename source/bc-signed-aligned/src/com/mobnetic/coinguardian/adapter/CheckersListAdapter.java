package com.mobnetic.coinguardian.adapter;

import android.content.Context;
import android.database.Cursor;
import android.text.Html;
import android.text.TextUtils;
import android.text.style.RelativeSizeSpan;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.CompoundButton;
import android.widget.CompoundButton.OnCheckedChangeListener;
import android.widget.TextView;
import butterknife.ButterKnife;
import butterknife.InjectView;
import com.mobeta.android.dslv.DragSortCursorAdapter;
import com.mobnetic.coinguardian.db.content.AlarmRecord;
import com.mobnetic.coinguardian.db.content.CheckerRecord;
import com.mobnetic.coinguardian.db.content.MaindbContract.Checker;
import com.mobnetic.coinguardian.db.content.MaindbContract.Checker.Builder;
import com.mobnetic.coinguardian.model.CurrencySubunit;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import com.mobnetic.coinguardian.util.AlarmRecordHelper;
import com.mobnetic.coinguardian.util.CheckerRecordHelper;
import com.mobnetic.coinguardian.util.CurrencyUtils;
import com.mobnetic.coinguardian.util.FormatUtils;
import com.mobnetic.coinguardian.util.MarketsConfigUtils;
import com.mobnetic.coinguardian.util.NotificationUtils;
import com.mobnetic.coinguardian.util.SpannableUtils;
import com.mobnetic.coinguardian.util.TickerUtils;
import java.util.Iterator;
import java.util.List;

public class CheckersListAdapter
  extends DragSortCursorAdapter
{
  private boolean actionModeActive;
  private final Context context;
  
  public CheckersListAdapter(Context paramContext)
  {
    super(paramContext, null, false);
    this.context = paramContext;
  }
  
  public void bindView(View paramView, final Context paramContext, Cursor paramCursor)
  {
    ViewHolder localViewHolder = (ViewHolder)paramView.getTag();
    final CheckerRecord localCheckerRecord = CheckerRecord.fromCursor(paramCursor);
    CurrencySubunit localCurrencySubunit = CurrencyUtils.getCurrencySubunit(localCheckerRecord.getCurrencyDst(), localCheckerRecord.getCurrencySubunitDst());
    paramView = MarketsConfigUtils.getMarketByKey(localCheckerRecord.getMarketKey());
    localViewHolder.marketView.setText(paramView.name);
    localViewHolder.currencyView.setText(paramContext.getString(2131165294, new Object[] { FormatUtils.getCurrencySrcWithContractType(localCheckerRecord.getCurrencySrc(), paramView, (int)localCheckerRecord.getContractType()), localCheckerRecord.getCurrencyDst() }));
    paramCursor = TickerUtils.fromJson(localCheckerRecord.getLastCheckTicker());
    if (localCheckerRecord.getErrorMsg() != null)
    {
      localViewHolder.lastCheckView.setText(paramContext.getString(2131165200, new Object[] { "" }));
      localViewHolder.lastCheckValueView.setText(Html.fromHtml("<small>" + localCheckerRecord.getErrorMsg() + "</small>"));
      localViewHolder.lastCheckValueView.setCompoundDrawablesWithIntrinsicBounds(0, 0, 0, 0);
      i = 0;
      localViewHolder.lastCheckTimeView.setText(FormatUtils.formatSameDayTimeOrDate(paramContext, localCheckerRecord.getLastCheckDate()));
      localViewHolder.lastCheckView.setVisibility(i);
      localViewHolder.lastCheckValueView.setVisibility(localViewHolder.lastCheckView.getVisibility());
      localViewHolder.lastCheckTimeView.setVisibility(localViewHolder.lastCheckView.getVisibility());
      localViewHolder.separator.setVisibility(localViewHolder.lastCheckView.getVisibility());
      paramCursor = CheckerRecordHelper.getAlarmsForCheckerRecord(localCheckerRecord, true);
      if ((paramCursor != null) && (paramCursor.size() != 0)) {
        break label538;
      }
      localViewHolder.alarmView.setText(paramContext.getString(2131165277, new Object[] { " " + paramContext.getString(2131165278) }));
      label329:
      paramView = localViewHolder.dragHandle;
      if (!this.actionModeActive) {
        break label712;
      }
      i = 0;
      label345:
      paramView.setVisibility(i);
      paramView = localViewHolder.switchView;
      if (!this.actionModeActive) {
        break label719;
      }
    }
    label538:
    label712:
    label719:
    for (int i = 4;; i = 0)
    {
      paramView.setVisibility(i);
      localViewHolder.switchView.setOnCheckedChangeListener(null);
      localViewHolder.switchView.setChecked(localCheckerRecord.getEnabled());
      localViewHolder.switchView.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener()
      {
        public void onCheckedChanged(CompoundButton paramAnonymousCompoundButton, boolean paramAnonymousBoolean)
        {
          MaindbContract.Checker.newBuilder().setEnabled(paramAnonymousBoolean).update(localCheckerRecord.getId(), true);
          localCheckerRecord.setEnabled(paramAnonymousBoolean);
          CheckerRecordHelper.doAfterEdit(paramContext, localCheckerRecord, true);
        }
      });
      return;
      if (paramCursor != null)
      {
        localViewHolder.lastCheckView.setText(2131165282);
        localViewHolder.lastCheckValueView.setText(" " + FormatUtils.formatPriceWithCurrency(paramCursor.last, localCurrencySubunit));
        paramView = TickerUtils.fromJson(localCheckerRecord.getPreviousCheckTicker());
        localViewHolder.lastCheckValueView.setCompoundDrawablesWithIntrinsicBounds(0, 0, NotificationUtils.getIconResIdForTickers(paramView, paramCursor, true), 0);
        i = 0;
        localViewHolder.lastCheckTimeView.setText(FormatUtils.formatSameDayTimeOrDate(paramContext, paramCursor.timestamp));
        break;
      }
      localViewHolder.lastCheckView.setText(2131165282);
      localViewHolder.lastCheckValueView.setText(null);
      i = 8;
      break;
      paramView = "";
      Iterator localIterator = paramCursor.iterator();
      while (localIterator.hasNext())
      {
        AlarmRecord localAlarmRecord = (AlarmRecord)localIterator.next();
        paramCursor = paramView;
        if (!TextUtils.isEmpty(paramView)) {
          paramCursor = paramView + ",  ";
        }
        paramView = paramCursor + paramContext.getString(2131165279, new Object[] { AlarmRecordHelper.getPrefixForAlarmType(localCheckerRecord, localAlarmRecord), AlarmRecordHelper.getValueForAlarmType(localCurrencySubunit, localAlarmRecord), AlarmRecordHelper.getSufixForAlarmType(localCheckerRecord, localAlarmRecord) });
      }
      localViewHolder.alarmView.setText(SpannableUtils.formatWithSpans(paramContext.getString(2131165277), " " + paramView, new RelativeSizeSpan(1.25F)));
      break label329;
      i = 8;
      break label345;
    }
  }
  
  public View newView(Context paramContext, Cursor paramCursor, ViewGroup paramViewGroup)
  {
    paramContext = LayoutInflater.from(this.context).inflate(2130903073, paramViewGroup, false);
    paramContext.setTag(new ViewHolder(paramContext));
    return paramContext;
  }
  
  public void setActionModeActive(boolean paramBoolean)
  {
    this.actionModeActive = paramBoolean;
    notifyDataSetChanged();
  }
  
  static class ViewHolder
  {
    @InjectView(2131624024)
    TextView alarmView;
    @InjectView(2131624056)
    TextView currencyView;
    @InjectView(2131624055)
    View dragHandle;
    @InjectView(2131624063)
    TextView lastCheckTimeView;
    @InjectView(2131624062)
    TextView lastCheckValueView;
    @InjectView(2131624061)
    TextView lastCheckView;
    @InjectView(2131624058)
    TextView marketView;
    @InjectView(2131624060)
    View separator;
    @InjectView(2131624064)
    CompoundButton switchView;
    
    public ViewHolder(View paramView)
    {
      ButterKnife.inject(this, paramView);
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/adapter/CheckersListAdapter.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */