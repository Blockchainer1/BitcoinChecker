package com.mobnetic.coinguardian.activity;

import com.mobnetic.coinguardian.activity.generic.SimpleFragmentSubActivity;
import com.mobnetic.coinguardian.fragment.SettingsNotificationsFragment;

public class SettingsNotificationsActivity
  extends SimpleFragmentSubActivity<SettingsNotificationsFragment>
{
  protected SettingsNotificationsFragment createChildFragment()
  {
    return new SettingsNotificationsFragment();
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/activity/SettingsNotificationsActivity.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */