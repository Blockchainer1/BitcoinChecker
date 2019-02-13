package com.mobnetic.coinguardian.activity;

import android.content.Intent;
import com.mobnetic.coinguardian.activity.generic.SimpleFragmentSubActivity;
import com.mobnetic.coinguardian.fragment.SettingsSoundsFragment;

public class SettingsSoundsActivity
  extends SimpleFragmentSubActivity<SettingsSoundsFragment>
{
  protected SettingsSoundsFragment createChildFragment()
  {
    return new SettingsSoundsFragment();
  }
  
  protected void onActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    ((SettingsSoundsFragment)getChildFragment()).onActivityResult(paramInt1, paramInt2, paramIntent);
    super.onActivityResult(paramInt1, paramInt2, paramIntent);
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/activity/SettingsSoundsActivity.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */