package com.mobnetic.coinguardian.view.generic;

import android.annotation.TargetApi;
import android.app.AlertDialog.Builder;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.res.Resources;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.CompoundButton;
import android.widget.CompoundButton.OnCheckedChangeListener;
import com.mobnetic.coinguardian.preferences.FrequencyPickerDialogPreference;
import com.mobnetic.coinguardian.util.PreferencesUtils;
import net.simonvt.numberpicker.NumberPicker;
import net.simonvt.numberpicker.NumberPicker.OnValueChangeListener;

public class ViewFrequencyPickerPreference
  extends ViewDialogPreference
{
  public static final long USE_GLOBAL_CHECK_FREQUENCY = -1L;
  private long frequency;
  private String[] frequencyTypeEntries;
  private OnFrequencySelectedListener onFrequencySelectedListener;
  
  public ViewFrequencyPickerPreference(Context paramContext)
  {
    super(paramContext);
  }
  
  public ViewFrequencyPickerPreference(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
  }
  
  @TargetApi(11)
  public ViewFrequencyPickerPreference(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
  }
  
  private long getFrequencyMillis(int paramInt1, int paramInt2)
  {
    return FrequencyPickerDialogPreference.FREQUENCY_TYPE_MULTIPLAYERS[paramInt1] * paramInt2;
  }
  
  private int parseFrequencyTypeId(long paramLong)
  {
    int i = FrequencyPickerDialogPreference.FREQUENCY_TYPE_MULTIPLAYERS.length - 1;
    if (i >= 0) {
      if (paramLong < FrequencyPickerDialogPreference.FREQUENCY_TYPE_MULTIPLAYERS[i] * FrequencyPickerDialogPreference.FREQUENCY_VALUE_MIN[1]) {}
    }
    for (;;)
    {
      return i;
      i--;
      break;
      i = 0;
    }
  }
  
  private int parseFrequencyValue(long paramLong, int paramInt)
  {
    return (int)(paramLong / FrequencyPickerDialogPreference.FREQUENCY_TYPE_MULTIPLAYERS[paramInt]);
  }
  
  private void refreshFrequencyPickers(NumberPicker paramNumberPicker1, NumberPicker paramNumberPicker2, long paramLong)
  {
    long l = paramLong;
    if (paramLong <= -1L) {
      l = PreferencesUtils.getCheckGlobalFrequency(getContext());
    }
    int i = parseFrequencyTypeId(l);
    paramNumberPicker1.setValue(i);
    paramNumberPicker2.setMinValue(FrequencyPickerDialogPreference.FREQUENCY_VALUE_MIN[paramNumberPicker1.getValue()]);
    paramNumberPicker2.setMaxValue(FrequencyPickerDialogPreference.FREQUENCY_VALUE_MAX[paramNumberPicker1.getValue()]);
    paramNumberPicker2.setValue(parseFrequencyValue(l, i));
  }
  
  public CharSequence getEntry()
  {
    long l = this.frequency;
    if (this.frequency <= -1L) {
      l = PreferencesUtils.getCheckGlobalFrequency(getContext());
    }
    int i = parseFrequencyTypeId(l);
    int j = parseFrequencyValue(l, i);
    String str1 = getContext().getResources().getQuantityString(FrequencyPickerDialogPreference.FREQUENCY_TYPE_PLURALS[i], j, new Object[] { Integer.valueOf(j) });
    String str2 = str1;
    if (this.frequency <= -1L) {
      str2 = getResources().getString(2131165246, new Object[] { str1 });
    }
    return str2;
  }
  
  public long getFrequency()
  {
    return this.frequency;
  }
  
  protected void init(Context paramContext, AttributeSet paramAttributeSet)
  {
    this.frequencyTypeEntries = new String[4];
    for (int i = 0; i < FrequencyPickerDialogPreference.FREQUENCY_TYPE_NAMES.length; i++) {
      this.frequencyTypeEntries[i] = getContext().getString(FrequencyPickerDialogPreference.FREQUENCY_TYPE_NAMES[i]);
    }
    super.init(paramContext, paramAttributeSet);
  }
  
  protected void onFinishInflate()
  {
    super.onFinishInflate();
    setFrequency(600000L);
  }
  
  protected void onPrepareDialog(AlertDialog.Builder paramBuilder)
  {
    boolean bool = false;
    View localView = LayoutInflater.from(getContext()).inflate(2130903077, null);
    final NumberPicker localNumberPicker1 = (NumberPicker)localView.findViewById(2131624069);
    final NumberPicker localNumberPicker2 = (NumberPicker)localView.findViewById(2131624068);
    final CompoundButton localCompoundButton = (CompoundButton)localView.findViewById(2131624070);
    localNumberPicker1.setMinValue(0);
    localNumberPicker1.setMaxValue(this.frequencyTypeEntries.length - 1);
    localNumberPicker1.setDisplayedValues(this.frequencyTypeEntries);
    localNumberPicker1.setOnValueChangedListener(new NumberPicker.OnValueChangeListener()
    {
      public void onValueChange(NumberPicker paramAnonymousNumberPicker, int paramAnonymousInt1, int paramAnonymousInt2)
      {
        localNumberPicker2.setMinValue(FrequencyPickerDialogPreference.FREQUENCY_VALUE_MIN[paramAnonymousInt2]);
        localNumberPicker2.setMaxValue(FrequencyPickerDialogPreference.FREQUENCY_VALUE_MAX[paramAnonymousInt2]);
      }
    });
    localNumberPicker2.setOnValueChangedListener(new NumberPicker.OnValueChangeListener()
    {
      public void onValueChange(NumberPicker paramAnonymousNumberPicker, int paramAnonymousInt1, int paramAnonymousInt2) {}
    });
    localCompoundButton.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener()
    {
      public void onCheckedChanged(CompoundButton paramAnonymousCompoundButton, boolean paramAnonymousBoolean)
      {
        boolean bool1 = true;
        ViewFrequencyPickerPreference.this.refreshFrequencyPickers(localNumberPicker1, localNumberPicker2, -1L);
        paramAnonymousCompoundButton = localNumberPicker1;
        boolean bool2;
        if (!paramAnonymousBoolean)
        {
          bool2 = true;
          paramAnonymousCompoundButton.setEnabled(bool2);
          paramAnonymousCompoundButton = localNumberPicker2;
          if (paramAnonymousBoolean) {
            break label75;
          }
        }
        label75:
        for (paramAnonymousBoolean = bool1;; paramAnonymousBoolean = false)
        {
          paramAnonymousCompoundButton.setEnabled(paramAnonymousBoolean);
          localNumberPicker1.clearFocus();
          localNumberPicker2.clearFocus();
          return;
          bool2 = false;
          break;
        }
      }
    });
    if (this.frequency <= -1L) {
      bool = true;
    }
    localCompoundButton.setChecked(bool);
    refreshFrequencyPickers(localNumberPicker1, localNumberPicker2, this.frequency);
    paramBuilder.setPositiveButton(17039370, new DialogInterface.OnClickListener()
    {
      public void onClick(DialogInterface paramAnonymousDialogInterface, int paramAnonymousInt)
      {
        localNumberPicker1.clearFocus();
        localNumberPicker2.clearFocus();
        if (localCompoundButton.isChecked()) {}
        for (long l = -1L;; l = ViewFrequencyPickerPreference.this.getFrequencyMillis(localNumberPicker1.getValue(), localNumberPicker2.getValue()))
        {
          ViewFrequencyPickerPreference.this.setFrequency(l);
          paramAnonymousDialogInterface.dismiss();
          return;
        }
      }
    });
    paramBuilder.setView(localView);
  }
  
  public void setFrequency(long paramLong)
  {
    long l = paramLong;
    if (paramLong >= 0L)
    {
      l = paramLong;
      if (paramLong < FrequencyPickerDialogPreference.MIN_FREQUENCY_MILLIS) {
        l = FrequencyPickerDialogPreference.MIN_FREQUENCY_MILLIS;
      }
    }
    if ((this.frequency != l) && ((this.onFrequencySelectedListener == null) || (this.onFrequencySelectedListener.onFrequencySelected(this, l)))) {
      this.frequency = l;
    }
    setSummary(getEntry());
  }
  
  public void setOnFrequencySelectedListener(OnFrequencySelectedListener paramOnFrequencySelectedListener)
  {
    this.onFrequencySelectedListener = paramOnFrequencySelectedListener;
  }
  
  public static abstract interface OnFrequencySelectedListener
  {
    public abstract boolean onFrequencySelected(ViewFrequencyPickerPreference paramViewFrequencyPickerPreference, long paramLong);
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */