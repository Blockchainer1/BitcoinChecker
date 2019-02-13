package com.mobnetic.coinguardian.view;

import android.annotation.TargetApi;
import android.content.Context;
import android.content.res.Resources;
import android.text.TextUtils;
import android.util.AttributeSet;
import com.mobnetic.coinguardian.view.generic.ViewSpinnerPreference;

public class ViewAlarmTypeSpinnerPreference
  extends ViewSpinnerPreference
{
  private CharSequence[] alarmTypeHints;
  
  public ViewAlarmTypeSpinnerPreference(Context paramContext)
  {
    super(paramContext);
  }
  
  public ViewAlarmTypeSpinnerPreference(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
  }
  
  @TargetApi(11)
  public ViewAlarmTypeSpinnerPreference(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
  }
  
  public CharSequence getEntry()
  {
    Object localObject1 = null;
    Object localObject2 = localObject1;
    if (this.alarmTypeHints != null)
    {
      localObject2 = localObject1;
      if (getSelection() >= 0)
      {
        localObject2 = localObject1;
        if (getSelection() < this.alarmTypeHints.length) {
          localObject2 = this.alarmTypeHints[getSelection()];
        }
      }
    }
    if (TextUtils.isEmpty((CharSequence)localObject2)) {}
    for (localObject2 = super.getEntry();; localObject2 = super.getEntry() + "\n\n" + localObject2) {
      return (CharSequence)localObject2;
    }
  }
  
  protected void init(Context paramContext, AttributeSet paramAttributeSet)
  {
    this.alarmTypeHints = getResources().getStringArray(2131492865);
    super.init(paramContext, paramAttributeSet);
    setEntries(getResources().getStringArray(2131492866));
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/view/ViewAlarmTypeSpinnerPreference.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */