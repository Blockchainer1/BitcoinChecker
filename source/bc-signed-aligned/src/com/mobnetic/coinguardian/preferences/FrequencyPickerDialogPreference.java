package com.mobnetic.coinguardian.preferences;

import android.app.AlertDialog.Builder;
import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.preference.DialogPreference;
import android.preference.Preference.BaseSavedState;
import android.util.AttributeSet;
import android.view.View;
import net.simonvt.numberpicker.NumberPicker;
import net.simonvt.numberpicker.NumberPicker.OnValueChangeListener;

public class FrequencyPickerDialogPreference
  extends DialogPreference
{
  public static final long DEFAULT_FREQUENCY_MILLIS = 600000L;
  public static final long[] FREQUENCY_TYPE_MULTIPLAYERS;
  public static final int[] FREQUENCY_TYPE_NAMES = { 2131165453, 2131165450, 2131165447, 2131165445 };
  public static final int[] FREQUENCY_TYPE_PLURALS = { 2131689476, 2131689474, 2131689473, 2131689472 };
  public static final int[] FREQUENCY_VALUE_MAX = { 59, 59, 23, 365 };
  public static final int[] FREQUENCY_VALUE_MIN;
  public static final long MIN_FREQUENCY_MILLIS = FREQUENCY_VALUE_MIN[0] * FREQUENCY_TYPE_MULTIPLAYERS[0];
  private long baseFrequencyMillis;
  private String[] frequencyTypeEntries = new String[4];
  private NumberPicker frequencyTypePicker;
  private NumberPicker frequencyValuePicker;
  private long viewFrequencyMillis;
  
  static
  {
    FREQUENCY_TYPE_MULTIPLAYERS = new long[] { 1000L, 60000L, 3600000L, 86400000L };
    FREQUENCY_VALUE_MIN = new int[] { 5, 1, 1, 1 };
  }
  
  public FrequencyPickerDialogPreference(Context paramContext)
  {
    this(paramContext, null);
  }
  
  public FrequencyPickerDialogPreference(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    for (int i = 0; i < FREQUENCY_TYPE_NAMES.length; i++) {
      this.frequencyTypeEntries[i] = paramContext.getString(FREQUENCY_TYPE_NAMES[i]);
    }
    setDialogLayoutResource(2130903077);
    setPositiveButtonText(17039370);
    setNegativeButtonText(17039360);
    setDialogIcon(null);
    setDefaultValue(Long.valueOf(600000L));
  }
  
  private long getFrequencyMillis()
  {
    return this.baseFrequencyMillis;
  }
  
  private long getFrequencyMillis(int paramInt1, int paramInt2)
  {
    return FREQUENCY_TYPE_MULTIPLAYERS[paramInt1] * paramInt2;
  }
  
  private int parseFrequencyTypeId(long paramLong)
  {
    int i = FREQUENCY_TYPE_MULTIPLAYERS.length - 1;
    if (i >= 0) {
      if (paramLong < FREQUENCY_TYPE_MULTIPLAYERS[i] * FREQUENCY_VALUE_MIN[1]) {}
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
    return (int)(paramLong / FREQUENCY_TYPE_MULTIPLAYERS[paramInt]);
  }
  
  protected void onBindDialogView(View paramView)
  {
    super.onBindDialogView(paramView);
    this.frequencyTypePicker = ((NumberPicker)paramView.findViewById(2131624069));
    this.frequencyValuePicker = ((NumberPicker)paramView.findViewById(2131624068));
    paramView.findViewById(2131624070).setVisibility(8);
    this.frequencyTypePicker.setMinValue(0);
    this.frequencyTypePicker.setMaxValue(this.frequencyTypeEntries.length - 1);
    this.frequencyTypePicker.setDisplayedValues(this.frequencyTypeEntries);
    this.frequencyTypePicker.setOnValueChangedListener(new NumberPicker.OnValueChangeListener()
    {
      public void onValueChange(NumberPicker paramAnonymousNumberPicker, int paramAnonymousInt1, int paramAnonymousInt2)
      {
        FrequencyPickerDialogPreference.this.frequencyValuePicker.setMinValue(FrequencyPickerDialogPreference.FREQUENCY_VALUE_MIN[paramAnonymousInt2]);
        FrequencyPickerDialogPreference.this.frequencyValuePicker.setMaxValue(FrequencyPickerDialogPreference.FREQUENCY_VALUE_MAX[paramAnonymousInt2]);
      }
    });
    this.frequencyValuePicker.setOnValueChangedListener(new NumberPicker.OnValueChangeListener()
    {
      public void onValueChange(NumberPicker paramAnonymousNumberPicker, int paramAnonymousInt1, int paramAnonymousInt2) {}
    });
    if (this.viewFrequencyMillis < 0L) {
      this.viewFrequencyMillis = this.baseFrequencyMillis;
    }
    int i = parseFrequencyTypeId(this.viewFrequencyMillis);
    this.frequencyTypePicker.setValue(i);
    this.frequencyValuePicker.setMinValue(FREQUENCY_VALUE_MIN[this.frequencyTypePicker.getValue()]);
    this.frequencyValuePicker.setMaxValue(FREQUENCY_VALUE_MAX[this.frequencyTypePicker.getValue()]);
    this.frequencyValuePicker.setValue(parseFrequencyValue(this.viewFrequencyMillis, i));
  }
  
  protected void onDialogClosed(boolean paramBoolean)
  {
    super.onDialogClosed(paramBoolean);
    if (paramBoolean)
    {
      long l = getFrequencyMillis(this.frequencyTypePicker.getValue(), this.frequencyValuePicker.getValue());
      if (callChangeListener(Long.valueOf(l))) {
        setFrequencyMillis(l);
      }
    }
    for (;;)
    {
      return;
      this.viewFrequencyMillis = -1L;
    }
  }
  
  protected Object onGetDefaultValue(TypedArray paramTypedArray, int paramInt)
  {
    return Long.valueOf(600000L);
  }
  
  protected void onPrepareDialogBuilder(AlertDialog.Builder paramBuilder)
  {
    super.onPrepareDialogBuilder(paramBuilder);
    paramBuilder.setInverseBackgroundForced(true);
  }
  
  protected void onRestoreInstanceState(Parcelable paramParcelable)
  {
    if ((paramParcelable == null) || (!paramParcelable.getClass().equals(SavedState.class))) {
      super.onRestoreInstanceState(paramParcelable);
    }
    for (;;)
    {
      return;
      paramParcelable = (SavedState)paramParcelable;
      setFrequencyMillis(paramParcelable.baseFrequencyMillis);
      this.viewFrequencyMillis = paramParcelable.viewFrequencyMillis;
      super.onRestoreInstanceState(paramParcelable.getSuperState());
    }
  }
  
  protected Parcelable onSaveInstanceState()
  {
    SavedState localSavedState = new SavedState(super.onSaveInstanceState());
    localSavedState.baseFrequencyMillis = getFrequencyMillis();
    if ((this.frequencyTypePicker != null) && (this.frequencyValuePicker != null)) {
      localSavedState.viewFrequencyMillis = getFrequencyMillis(this.frequencyTypePicker.getValue(), this.frequencyValuePicker.getValue());
    }
    return localSavedState;
  }
  
  protected void onSetInitialValue(boolean paramBoolean, Object paramObject)
  {
    if (paramBoolean) {}
    for (long l = getPersistedLong(600000L);; l = ((Long)paramObject).longValue())
    {
      setFrequencyMillis(l);
      return;
    }
  }
  
  public void setFrequencyMillis(long paramLong)
  {
    long l = paramLong;
    if (paramLong < MIN_FREQUENCY_MILLIS) {
      l = MIN_FREQUENCY_MILLIS;
    }
    this.viewFrequencyMillis = l;
    int i = parseFrequencyTypeId(l);
    int j = parseFrequencyValue(l, i);
    setSummary(getContext().getResources().getQuantityString(FREQUENCY_TYPE_PLURALS[i], j, new Object[] { Integer.valueOf(j) }));
    if (l != this.baseFrequencyMillis)
    {
      this.baseFrequencyMillis = l;
      persistLong(l);
      notifyChanged();
    }
  }
  
  private static class SavedState
    extends Preference.BaseSavedState
  {
    public static final Parcelable.Creator<SavedState> CREATOR = new Parcelable.Creator()
    {
      public FrequencyPickerDialogPreference.SavedState createFromParcel(Parcel paramAnonymousParcel)
      {
        return new FrequencyPickerDialogPreference.SavedState(paramAnonymousParcel);
      }
      
      public FrequencyPickerDialogPreference.SavedState[] newArray(int paramAnonymousInt)
      {
        return new FrequencyPickerDialogPreference.SavedState[paramAnonymousInt];
      }
    };
    long baseFrequencyMillis;
    long viewFrequencyMillis;
    
    public SavedState(Parcel paramParcel)
    {
      super();
      this.baseFrequencyMillis = paramParcel.readLong();
      this.viewFrequencyMillis = paramParcel.readLong();
    }
    
    public SavedState(Parcelable paramParcelable)
    {
      super();
      this.viewFrequencyMillis = -1L;
    }
    
    public void writeToParcel(Parcel paramParcel, int paramInt)
    {
      super.writeToParcel(paramParcel, paramInt);
      paramParcel.writeLong(this.baseFrequencyMillis);
      paramParcel.writeLong(this.viewFrequencyMillis);
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */