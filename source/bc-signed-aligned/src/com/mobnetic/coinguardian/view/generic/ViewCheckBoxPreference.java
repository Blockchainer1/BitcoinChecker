package com.mobnetic.coinguardian.view.generic;

import android.annotation.TargetApi;
import android.content.Context;
import android.util.AttributeSet;
import android.widget.CheckBox;
import android.widget.CompoundButton;

public class ViewCheckBoxPreference
  extends ViewTwoStatePreference
{
  public ViewCheckBoxPreference(Context paramContext)
  {
    super(paramContext);
  }
  
  public ViewCheckBoxPreference(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
  }
  
  @TargetApi(11)
  public ViewCheckBoxPreference(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
  }
  
  protected CompoundButton createCompoundButton()
  {
    CheckBox localCheckBox = new CheckBox(getContext());
    localCheckBox.setClickable(false);
    return localCheckBox;
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/view/generic/ViewCheckBoxPreference.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */