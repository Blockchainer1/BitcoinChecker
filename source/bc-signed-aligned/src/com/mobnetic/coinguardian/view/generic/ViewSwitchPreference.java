package com.mobnetic.coinguardian.view.generic;

import android.annotation.TargetApi;
import android.content.Context;
import android.util.AttributeSet;
import android.widget.CompoundButton;
import de.ankri.views.Switch;

public class ViewSwitchPreference
  extends ViewTwoStatePreference
{
  public ViewSwitchPreference(Context paramContext)
  {
    super(paramContext);
  }
  
  public ViewSwitchPreference(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
  }
  
  @TargetApi(11)
  public ViewSwitchPreference(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
  }
  
  protected CompoundButton createCompoundButton()
  {
    return new Switch(getContext());
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/view/generic/ViewSwitchPreference.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */