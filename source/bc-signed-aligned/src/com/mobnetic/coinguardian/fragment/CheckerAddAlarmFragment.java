package com.mobnetic.coinguardian.fragment;

import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import butterknife.ButterKnife;
import butterknife.InjectView;
import com.mobnetic.coinguardian.db.content.AlarmRecord;
import com.mobnetic.coinguardian.db.content.CheckerRecord;
import com.mobnetic.coinguardian.model.CurrencySubunit;
import com.mobnetic.coinguardian.model.Ticker;
import com.mobnetic.coinguardian.util.AlarmRecordHelper;
import com.mobnetic.coinguardian.util.CurrencyUtils;
import com.mobnetic.coinguardian.util.TickerUtils;
import com.mobnetic.coinguardian.view.ViewAlarmCheckPointPreference;
import com.mobnetic.coinguardian.view.ViewAlarmCheckPointPreference.OnCheckpointChangedListener;
import com.mobnetic.coinguardian.view.ViewAlarmTypeSpinnerPreference;
import com.mobnetic.coinguardian.view.ViewAlarmValuePickerPreference;
import com.mobnetic.coinguardian.view.ViewAlarmValuePickerPreference.OnValueChangedListener;
import com.mobnetic.coinguardian.view.generic.ViewSpinnerPreference;
import com.mobnetic.coinguardian.view.generic.ViewSpinnerPreference.OnItemSelectedListener;
import com.mobnetic.coinguardian.view.generic.ViewTwoStatePreference;
import com.mobnetic.coinguardian.view.generic.ViewTwoStatePreference.OnCheckChangedListener;

public class CheckerAddAlarmFragment
  extends Fragment
{
  private static final String EXTRA_SHOULD_SAVE_STATE = "should_save_state";
  private static final String EXTRA_UNSAVED_CHANGES = "unsaved_changes";
  @InjectView(2131624019)
  ViewAlarmCheckPointPreference alarmCheckPointView;
  @InjectView(2131624016)
  ViewTwoStatePreference alarmEnabledView;
  @InjectView(2131624022)
  ViewTwoStatePreference alarmLedView;
  private AlarmRecord alarmRecord;
  @InjectView(2131624020)
  ViewTwoStatePreference alarmSoundView;
  @InjectView(2131624023)
  ViewTwoStatePreference alarmTTSView;
  @InjectView(2131624017)
  ViewAlarmTypeSpinnerPreference alarmTypeView;
  @InjectView(2131624018)
  ViewAlarmValuePickerPreference alarmValueView;
  @InjectView(2131624021)
  ViewTwoStatePreference alarmVibrateView;
  private CheckerRecord checkerRecord;
  private boolean unsavedChanges;
  
  public static final CheckerAddAlarmFragment newInstance(CheckerRecord paramCheckerRecord, AlarmRecord paramAlarmRecord)
  {
    CheckerAddAlarmFragment localCheckerAddAlarmFragment = new CheckerAddAlarmFragment();
    Bundle localBundle = new Bundle();
    localBundle.putParcelable("checker_record", paramCheckerRecord);
    localBundle.putParcelable("alarm_record", paramAlarmRecord);
    localBundle.putBoolean("should_save_state", true);
    localCheckerAddAlarmFragment.setArguments(localBundle);
    return localCheckerAddAlarmFragment;
  }
  
  private void refreshAlarmToggles(boolean paramBoolean)
  {
    this.alarmTypeView.setEnabled(paramBoolean);
    this.alarmValueView.setEnabled(paramBoolean);
    this.alarmCheckPointView.setEnabled(paramBoolean);
    this.alarmSoundView.setEnabled(paramBoolean);
    this.alarmVibrateView.setEnabled(paramBoolean);
    this.alarmLedView.setEnabled(paramBoolean);
    this.alarmTTSView.setEnabled(paramBoolean);
  }
  
  private void refreshAlarmValueView()
  {
    this.alarmValueView.setPrefix(AlarmRecordHelper.getPrefixForAlarmType(this.checkerRecord, this.alarmRecord));
    this.alarmValueView.setSufix(AlarmRecordHelper.getSufixForAlarmType(this.checkerRecord, this.alarmRecord));
    this.alarmValueView.setValue(this.alarmRecord.getValue());
  }
  
  private void refreshLastCheckPoint()
  {
    String str = CurrencyUtils.getCurrencySubunit(this.checkerRecord.getCurrencyDst(), this.checkerRecord.getCurrencySubunitDst()).name;
    this.alarmCheckPointView.setSufix(CurrencyUtils.getCurrencySymbol(str));
    this.alarmCheckPointView.setCheckerAndAlarmRecord(this.checkerRecord, this.alarmRecord);
    refreshLastCheckPointVisibility();
  }
  
  private void refreshLastCheckPointVisibility()
  {
    ViewAlarmCheckPointPreference localViewAlarmCheckPointPreference = this.alarmCheckPointView;
    if (AlarmRecordHelper.isCheckPointAvailableForAlarmType(this.alarmRecord)) {}
    for (int i = 0;; i = 8)
    {
      localViewAlarmCheckPointPreference.setVisibility(i);
      return;
    }
  }
  
  private void refreshUI()
  {
    refreshAlarmToggles(this.alarmRecord.getEnabled());
    this.alarmEnabledView.setOnCheckChangedListener(null);
    this.alarmEnabledView.setChecked(this.alarmRecord.getEnabled());
    this.alarmEnabledView.setOnCheckChangedListener(new ViewTwoStatePreference.OnCheckChangedListener()
    {
      public boolean onCheckChanged(ViewTwoStatePreference paramAnonymousViewTwoStatePreference, boolean paramAnonymousBoolean)
      {
        CheckerAddAlarmFragment.this.alarmRecord.setEnabled(paramAnonymousBoolean);
        CheckerAddAlarmFragment.access$102(CheckerAddAlarmFragment.this, true);
        CheckerAddAlarmFragment.this.refreshAlarmToggles(paramAnonymousBoolean);
        return true;
      }
    });
    this.alarmTypeView.setOnItemSelectedListener(null);
    this.alarmTypeView.setSelection(AlarmRecordHelper.getPositionForAlarmType(getActivity(), this.alarmRecord));
    this.alarmTypeView.setOnItemSelectedListener(new ViewSpinnerPreference.OnItemSelectedListener()
    {
      public boolean onItemSelected(ViewSpinnerPreference paramAnonymousViewSpinnerPreference, int paramAnonymousInt)
      {
        CheckerAddAlarmFragment.this.alarmRecord.setType(AlarmRecordHelper.getAlarmTypeForPosition(CheckerAddAlarmFragment.this.getActivity(), paramAnonymousInt));
        CheckerAddAlarmFragment.access$102(CheckerAddAlarmFragment.this, true);
        CheckerAddAlarmFragment.this.refreshAlarmValueView();
        CheckerAddAlarmFragment.this.refreshLastCheckPointVisibility();
        return true;
      }
    });
    this.alarmValueView.setOnValueChangedListener(null);
    this.alarmValueView.setCheckerAndAlarmRecord(this.checkerRecord, this.alarmRecord);
    refreshAlarmValueView();
    this.alarmValueView.setOnValueChangedListener(new ViewAlarmValuePickerPreference.OnValueChangedListener()
    {
      public boolean onValueChanged(ViewAlarmValuePickerPreference paramAnonymousViewAlarmValuePickerPreference, double paramAnonymousDouble)
      {
        CheckerAddAlarmFragment.this.alarmRecord.setValue(paramAnonymousDouble);
        CheckerAddAlarmFragment.access$102(CheckerAddAlarmFragment.this, true);
        return true;
      }
    });
    this.alarmCheckPointView.setOnCheckpointChangedListener(null);
    refreshLastCheckPoint();
    this.alarmCheckPointView.setOnCheckpointChangedListener(new ViewAlarmCheckPointPreference.OnCheckpointChangedListener()
    {
      public boolean onCheckpointChanged(ViewAlarmCheckPointPreference paramAnonymousViewAlarmCheckPointPreference, Ticker paramAnonymousTicker)
      {
        AlarmRecord localAlarmRecord = CheckerAddAlarmFragment.this.alarmRecord;
        if (paramAnonymousTicker != null) {}
        for (paramAnonymousViewAlarmCheckPointPreference = TickerUtils.toJson(paramAnonymousTicker);; paramAnonymousViewAlarmCheckPointPreference = null)
        {
          localAlarmRecord.setLastCheckPointTicker(paramAnonymousViewAlarmCheckPointPreference);
          CheckerAddAlarmFragment.access$102(CheckerAddAlarmFragment.this, true);
          return true;
        }
      }
    });
    this.alarmSoundView.setOnCheckChangedListener(null);
    this.alarmSoundView.setChecked(this.alarmRecord.getSound());
    this.alarmSoundView.setOnCheckChangedListener(new ViewTwoStatePreference.OnCheckChangedListener()
    {
      public boolean onCheckChanged(ViewTwoStatePreference paramAnonymousViewTwoStatePreference, boolean paramAnonymousBoolean)
      {
        CheckerAddAlarmFragment.this.alarmRecord.setSound(paramAnonymousBoolean);
        CheckerAddAlarmFragment.access$102(CheckerAddAlarmFragment.this, true);
        return true;
      }
    });
    this.alarmVibrateView.setOnCheckChangedListener(null);
    this.alarmVibrateView.setChecked(this.alarmRecord.getVibrate());
    this.alarmVibrateView.setOnCheckChangedListener(new ViewTwoStatePreference.OnCheckChangedListener()
    {
      public boolean onCheckChanged(ViewTwoStatePreference paramAnonymousViewTwoStatePreference, boolean paramAnonymousBoolean)
      {
        CheckerAddAlarmFragment.this.alarmRecord.setVibrate(paramAnonymousBoolean);
        CheckerAddAlarmFragment.access$102(CheckerAddAlarmFragment.this, true);
        return true;
      }
    });
    this.alarmLedView.setOnCheckChangedListener(null);
    this.alarmLedView.setChecked(this.alarmRecord.getLed());
    this.alarmLedView.setOnCheckChangedListener(new ViewTwoStatePreference.OnCheckChangedListener()
    {
      public boolean onCheckChanged(ViewTwoStatePreference paramAnonymousViewTwoStatePreference, boolean paramAnonymousBoolean)
      {
        CheckerAddAlarmFragment.this.alarmRecord.setLed(paramAnonymousBoolean);
        CheckerAddAlarmFragment.access$102(CheckerAddAlarmFragment.this, true);
        return true;
      }
    });
    this.alarmTTSView.setOnCheckChangedListener(null);
    this.alarmTTSView.setChecked(this.alarmRecord.getTtsEnabled());
    this.alarmTTSView.setOnCheckChangedListener(new ViewTwoStatePreference.OnCheckChangedListener()
    {
      public boolean onCheckChanged(ViewTwoStatePreference paramAnonymousViewTwoStatePreference, boolean paramAnonymousBoolean)
      {
        CheckerAddAlarmFragment.this.alarmRecord.setTtsEnabled(paramAnonymousBoolean);
        CheckerAddAlarmFragment.access$102(CheckerAddAlarmFragment.this, true);
        return true;
      }
    });
  }
  
  private boolean shouldSaveState()
  {
    if ((getArguments() != null) && (getArguments().getBoolean("should_save_state"))) {}
    for (boolean bool = true;; bool = false) {
      return bool;
    }
  }
  
  public AlarmRecord getAlarmRecord()
  {
    return this.alarmRecord;
  }
  
  public boolean getUnsavedChanges()
  {
    return this.unsavedChanges;
  }
  
  public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
  {
    paramLayoutInflater = paramLayoutInflater.inflate(2130903068, null);
    ButterKnife.inject(this, paramLayoutInflater);
    return paramLayoutInflater;
  }
  
  public void onDestroyView()
  {
    super.onDestroyView();
    ButterKnife.reset(this);
  }
  
  public void onSaveInstanceState(Bundle paramBundle)
  {
    if (shouldSaveState()) {
      paramBundle.putParcelable("alarm_record", this.alarmRecord);
    }
    paramBundle.putBoolean("unsaved_changes", this.unsavedChanges);
    super.onSaveInstanceState(paramBundle);
  }
  
  public void onViewCreated(View paramView, Bundle paramBundle)
  {
    super.onViewCreated(paramView, paramBundle);
    if (shouldSaveState()) {
      if (paramBundle != null)
      {
        this.alarmRecord = ((AlarmRecord)paramBundle.getParcelable("alarm_record"));
        this.unsavedChanges = paramBundle.getBoolean("unsaved_changes");
        if (getArguments() != null) {
          this.checkerRecord = ((CheckerRecord)getArguments().getParcelable("checker_record"));
        }
      }
    }
    for (;;)
    {
      setCheckerAndAlarmRecord(this.checkerRecord, this.alarmRecord);
      return;
      if (getArguments() == null) {
        break;
      }
      this.alarmRecord = ((AlarmRecord)getArguments().getParcelable("alarm_record"));
      break;
      if (paramBundle != null) {
        this.unsavedChanges = paramBundle.getBoolean("unsaved_changes");
      }
    }
  }
  
  public void setCheckerAndAlarmRecord(CheckerRecord paramCheckerRecord, AlarmRecord paramAlarmRecord)
  {
    if ((paramAlarmRecord == null) || (paramCheckerRecord == null)) {}
    for (;;)
    {
      return;
      this.checkerRecord = paramCheckerRecord;
      this.alarmRecord = paramAlarmRecord;
      refreshUI();
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */