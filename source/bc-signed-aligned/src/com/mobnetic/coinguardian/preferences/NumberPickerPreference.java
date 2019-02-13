package com.mobnetic.coinguardian.preferences;

import android.app.AlertDialog.Builder;
import android.content.Context;
import android.content.res.TypedArray;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.preference.DialogPreference;
import android.preference.Preference.BaseSavedState;
import android.util.AttributeSet;
import android.view.View;
import net.simonvt.numberpicker.NumberPicker;

public class NumberPickerPreference
  extends DialogPreference
{
  int initialValue;
  NumberPicker picker;
  int viewValue;
  
  public NumberPickerPreference(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    setDialogLayoutResource(2130903080);
    setPositiveButtonText(17039370);
    setNegativeButtonText(17039360);
  }
  
  protected void onBindDialogView(View paramView)
  {
    super.onBindDialogView(paramView);
    this.picker = ((NumberPicker)paramView.findViewById(2131624078));
    if (this.viewValue == 0) {
      this.viewValue = this.initialValue;
    }
    this.picker.setMinValue(1);
    this.picker.setMaxValue(100);
    this.picker.setValue(this.viewValue);
  }
  
  protected void onDialogClosed(boolean paramBoolean)
  {
    super.onDialogClosed(paramBoolean);
    if (paramBoolean)
    {
      int i = this.picker.getValue();
      if (callChangeListener(Integer.valueOf(i))) {
        setValue(i);
      }
    }
    for (;;)
    {
      return;
      this.viewValue = 0;
    }
  }
  
  protected Object onGetDefaultValue(TypedArray paramTypedArray, int paramInt)
  {
    return Integer.valueOf(paramTypedArray.getInt(paramInt, 1));
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
      setValue(paramParcelable.initialValue);
      this.viewValue = paramParcelable.viewValue;
      super.onRestoreInstanceState(paramParcelable.getSuperState());
    }
  }
  
  protected Parcelable onSaveInstanceState()
  {
    SavedState localSavedState = new SavedState(super.onSaveInstanceState());
    localSavedState.initialValue = this.initialValue;
    if (this.picker != null) {
      localSavedState.viewValue = this.picker.getValue();
    }
    return localSavedState;
  }
  
  protected void onSetInitialValue(boolean paramBoolean, Object paramObject)
  {
    if (paramBoolean) {}
    for (int i = getPersistedInt(1);; i = ((Integer)paramObject).intValue())
    {
      setValue(i);
      return;
    }
  }
  
  public void setValue(int paramInt)
  {
    this.viewValue = paramInt;
    setSummary(paramInt + "%");
    if (paramInt != this.initialValue)
    {
      this.initialValue = paramInt;
      persistInt(paramInt);
      notifyChanged();
    }
  }
  
  private static class SavedState
    extends Preference.BaseSavedState
  {
    public static final Parcelable.Creator<SavedState> CREATOR = new Parcelable.Creator()
    {
      public NumberPickerPreference.SavedState createFromParcel(Parcel paramAnonymousParcel)
      {
        return new NumberPickerPreference.SavedState(paramAnonymousParcel);
      }
      
      public NumberPickerPreference.SavedState[] newArray(int paramAnonymousInt)
      {
        return new NumberPickerPreference.SavedState[paramAnonymousInt];
      }
    };
    int initialValue;
    int viewValue;
    
    public SavedState(Parcel paramParcel)
    {
      super();
      this.initialValue = paramParcel.readInt();
      this.viewValue = paramParcel.readInt();
    }
    
    public SavedState(Parcelable paramParcelable)
    {
      super();
    }
    
    public void writeToParcel(Parcel paramParcel, int paramInt)
    {
      super.writeToParcel(paramParcel, paramInt);
      paramParcel.writeInt(this.initialValue);
      paramParcel.writeInt(this.viewValue);
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/preferences/NumberPickerPreference.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */