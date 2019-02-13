package com.mobnetic.coinguardian.view.generic;

import android.annotation.TargetApi;
import android.app.AlertDialog.Builder;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import net.simonvt.numberpicker.NumberPicker;

public class ViewNumberPickerPreference
  extends ViewDialogPreference
{
  private OnValueChangedListener onValueSelectedListener;
  private int value = -1;
  private String valueSufix;
  
  public ViewNumberPickerPreference(Context paramContext)
  {
    super(paramContext);
  }
  
  public ViewNumberPickerPreference(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
  }
  
  @TargetApi(11)
  public ViewNumberPickerPreference(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
  }
  
  public String getEntry()
  {
    StringBuilder localStringBuilder = new StringBuilder().append(String.valueOf(getValue()));
    if (this.valueSufix != null) {}
    for (String str = this.valueSufix;; str = "") {
      return str;
    }
  }
  
  public int getValue()
  {
    return this.value;
  }
  
  protected void onPrepareDialog(AlertDialog.Builder paramBuilder)
  {
    View localView = LayoutInflater.from(getContext()).inflate(2130903080, null);
    final NumberPicker localNumberPicker = (NumberPicker)localView.findViewById(2131624078);
    localNumberPicker.setMinValue(1);
    localNumberPicker.setMaxValue(100);
    localNumberPicker.setValue(getValue());
    paramBuilder.setPositiveButton(17039370, new DialogInterface.OnClickListener()
    {
      public void onClick(DialogInterface paramAnonymousDialogInterface, int paramAnonymousInt)
      {
        localNumberPicker.clearFocus();
        ViewNumberPickerPreference.this.setValue(localNumberPicker.getValue());
        paramAnonymousDialogInterface.dismiss();
      }
    });
    paramBuilder.setView(localView);
  }
  
  public void setOnValueChangedListener(OnValueChangedListener paramOnValueChangedListener)
  {
    this.onValueSelectedListener = paramOnValueChangedListener;
  }
  
  public void setValue(int paramInt)
  {
    if ((getValue() != paramInt) && ((this.onValueSelectedListener == null) || (this.onValueSelectedListener.onValueChanged(this, paramInt)))) {
      this.value = paramInt;
    }
    setSummary(getEntry());
  }
  
  public void setValueSufix(String paramString)
  {
    this.valueSufix = paramString;
  }
  
  public static abstract interface OnValueChangedListener
  {
    public abstract boolean onValueChanged(ViewNumberPickerPreference paramViewNumberPickerPreference, int paramInt);
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/view/generic/ViewNumberPickerPreference.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */