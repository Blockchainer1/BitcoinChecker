package com.mobnetic.coinguardian.adapter;

import android.annotation.TargetApi;
import android.content.Context;
import android.content.res.Resources;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.View.OnLongClickListener;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.CompoundButton;
import android.widget.CompoundButton.OnCheckedChangeListener;
import android.widget.FrameLayout;
import android.widget.TextView;
import butterknife.ButterKnife;
import butterknife.InjectView;
import com.mobnetic.coinguardian.db.content.AlarmRecord;
import com.mobnetic.coinguardian.db.content.CheckerRecord;
import com.mobnetic.coinguardian.fragment.CheckerAddFragment;
import com.mobnetic.coinguardian.util.AlarmRecordHelper;
import com.nineoldandroids.view.ViewHelper;
import java.util.List;

public abstract class CheckerAlarmsListAdapter
  extends BaseAdapter
{
  private static final float ALPHA_OFF = 0.1F;
  private static final float ALPHA_ON = 1.0F;
  private final CheckerAddFragment checkerAddFragment;
  private final CheckerRecord checkerRecord;
  private final Context context;
  private final List<AlarmRecord> items;
  private final int verticalPadding;
  
  public CheckerAlarmsListAdapter(Context paramContext, CheckerAddFragment paramCheckerAddFragment, CheckerRecord paramCheckerRecord, List<AlarmRecord> paramList)
  {
    this.context = paramContext;
    this.checkerAddFragment = paramCheckerAddFragment;
    this.checkerRecord = paramCheckerRecord;
    this.items = paramList;
    this.verticalPadding = paramContext.getResources().getDimensionPixelSize(2131296289);
  }
  
  public int getCount()
  {
    int i = 1;
    int j = i;
    if (this.items != null)
    {
      j = i;
      if (this.items.size() > 1) {
        j = this.items.size() + 1;
      }
    }
    return j;
  }
  
  public AlarmRecord getItem(int paramInt)
  {
    if ((paramInt >= 0) && (paramInt < this.items.size())) {}
    for (AlarmRecord localAlarmRecord = (AlarmRecord)this.items.get(paramInt);; localAlarmRecord = null) {
      return localAlarmRecord;
    }
  }
  
  public long getItemId(int paramInt)
  {
    return paramInt;
  }
  
  public int getItemViewType(int paramInt)
  {
    if (paramInt == getCount() - 1) {}
    for (paramInt = 1;; paramInt = 0) {
      return paramInt;
    }
  }
  
  @TargetApi(11)
  public View getView(final int paramInt, final View paramView, final ViewGroup paramViewGroup)
  {
    if (paramInt == getCount() - 1)
    {
      paramView = LayoutInflater.from(this.context).inflate(2130903067, paramViewGroup, false);
      paramViewGroup = (TextView)paramView.findViewById(2131624015);
      if (getCount() == 1) {}
      for (paramInt = 2131165213;; paramInt = 2131165212)
      {
        paramViewGroup.setText(paramInt);
        return paramView;
      }
    }
    View localView = paramView;
    if (paramView == null)
    {
      localView = LayoutInflater.from(this.context).inflate(2130903069, paramViewGroup, false);
      localView.setTag(new ViewHolder(localView));
    }
    int i = localView.getPaddingLeft();
    int j = this.verticalPadding;
    int k;
    label116:
    Object localObject;
    if (paramInt == 0)
    {
      k = 2;
      localView.setPadding(i, k * j, localView.getPaddingRight(), localView.getPaddingBottom());
      paramViewGroup = getItem(paramInt);
      if (paramViewGroup != null)
      {
        paramView = (ViewHolder)localView.getTag();
        localObject = this.context.getString(2131165230, new Object[] { AlarmRecordHelper.getPrefixForAlarmType(this.checkerRecord, paramViewGroup), AlarmRecordHelper.getValueForAlarmType(this.checkerRecord, paramViewGroup), AlarmRecordHelper.getSufixForAlarmType(this.checkerRecord, paramViewGroup) });
        paramView.alarmView.setText((CharSequence)localObject);
        localObject = paramView.alarmSoundView;
        if (!paramViewGroup.getSound()) {
          break label384;
        }
        f = 1.0F;
        label230:
        ViewHelper.setAlpha((View)localObject, f);
        localObject = paramView.alarmVibrateView;
        if (!paramViewGroup.getVibrate()) {
          break label391;
        }
        f = 1.0F;
        label253:
        ViewHelper.setAlpha((View)localObject, f);
        localObject = paramView.alarmLedView;
        if (!paramViewGroup.getLed()) {
          break label398;
        }
        f = 1.0F;
        label276:
        ViewHelper.setAlpha((View)localObject, f);
        localObject = paramView.alarmTtsView;
        if (!paramViewGroup.getTtsEnabled()) {
          break label405;
        }
      }
    }
    label384:
    label391:
    label398:
    label405:
    for (float f = 1.0F;; f = 0.1F)
    {
      ViewHelper.setAlpha((View)localObject, f);
      paramView.checkBox.setOnCheckedChangeListener(null);
      paramView.checkBox.setChecked(paramViewGroup.getEnabled());
      paramView.checkBox.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener()
      {
        public void onCheckedChanged(CompoundButton paramAnonymousCompoundButton, boolean paramAnonymousBoolean)
        {
          paramViewGroup.setEnabled(paramAnonymousBoolean);
          CheckerAlarmsListAdapter.this.checkerAddFragment.makeUnsavedChanges();
        }
      });
      paramView.checkBoxWrapper.setOnClickListener(new View.OnClickListener()
      {
        public void onClick(View paramAnonymousView)
        {
          paramView.checkBox.toggle();
        }
      });
      localView.setOnLongClickListener(new View.OnLongClickListener()
      {
        public boolean onLongClick(View paramAnonymousView)
        {
          CheckerAlarmsListAdapter.this.onItemLongClick(paramViewGroup, paramInt);
          return true;
        }
      });
      paramView = localView;
      break;
      k = 1;
      break label116;
      f = 0.1F;
      break label230;
      f = 0.1F;
      break label253;
      f = 0.1F;
      break label276;
    }
  }
  
  public int getViewTypeCount()
  {
    return 2;
  }
  
  public abstract void onItemLongClick(AlarmRecord paramAlarmRecord, int paramInt);
  
  static class ViewHolder
  {
    @InjectView(2131624022)
    View alarmLedView;
    @InjectView(2131624020)
    View alarmSoundView;
    @InjectView(2131624025)
    View alarmTtsView;
    @InjectView(2131624021)
    View alarmVibrateView;
    @InjectView(2131624024)
    TextView alarmView;
    @InjectView(2131624027)
    CompoundButton checkBox;
    @InjectView(2131624026)
    FrameLayout checkBoxWrapper;
    
    public ViewHolder(View paramView)
    {
      ButterKnife.inject(this, paramView);
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */