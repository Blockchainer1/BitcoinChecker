package com.mobnetic.coinguardian.activity;

import android.content.Context;
import android.os.Bundle;
import com.mobnetic.coinguardian.activity.generic.SimpleDonateFragmentSubActivity;
import com.mobnetic.coinguardian.fragment.SettingsMainFragment;
import com.mobnetic.coinguardian.util.SoundFilesManager;

public class SettingsMainActivity
  extends SimpleDonateFragmentSubActivity<SettingsMainFragment>
{
  public static void startSettingsMainActivity(Context paramContext, boolean paramBoolean)
  {
    startSimpleDonateFragmentActivity(paramContext, SettingsMainActivity.class, paramBoolean);
  }
  
  protected SettingsMainFragment createChildFragment()
  {
    return new SettingsMainFragment();
  }
  
  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    SoundFilesManager.installRingtonesIfNeeded(this);
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/activity/SettingsMainActivity.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */