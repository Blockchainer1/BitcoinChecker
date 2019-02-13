package com.mobnetic.coinguardian.fragment;

import android.os.Build.VERSION;
import android.os.Bundle;
import android.preference.Preference;
import android.preference.Preference.OnPreferenceChangeListener;
import android.preference.PreferenceCategory;
import android.support.v4.preference.PreferenceFragment;
import com.mobnetic.coinguardian.util.NotificationUtils;
import com.mobnetic.coinguardian.util.PreferencesUtils;

public class SettingsNotificationsFragment
  extends PreferenceFragment
{
  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    addPreferencesFromResource(2131034114);
    paramBundle = (PreferenceCategory)findPreference(getString(2131165382));
    Preference localPreference = findPreference(getString(2131165387));
    if (Build.VERSION.SDK_INT < 16)
    {
      paramBundle.removePreference(localPreference);
      localPreference = findPreference(getString(2131165384));
      if (Build.VERSION.SDK_INT >= 14) {
        break label91;
      }
      paramBundle.removePreference(localPreference);
    }
    for (;;)
    {
      return;
      localPreference.setOnPreferenceChangeListener(new Preference.OnPreferenceChangeListener()
      {
        public boolean onPreferenceChange(Preference paramAnonymousPreference, Object paramAnonymousObject)
        {
          PreferencesUtils.setCheckNotificationExpandable(SettingsNotificationsFragment.this.getActivity(), ((Boolean)paramAnonymousObject).booleanValue());
          NotificationUtils.refreshOngoingNotifications(SettingsNotificationsFragment.this.getActivity());
          return true;
        }
      });
      break;
      label91:
      localPreference.setOnPreferenceChangeListener(new Preference.OnPreferenceChangeListener()
      {
        public boolean onPreferenceChange(Preference paramAnonymousPreference, Object paramAnonymousObject)
        {
          PreferencesUtils.setCheckNotificationCustomLayout(SettingsNotificationsFragment.this.getActivity(), ((Boolean)paramAnonymousObject).booleanValue());
          NotificationUtils.refreshOngoingNotifications(SettingsNotificationsFragment.this.getActivity());
          return true;
        }
      });
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/fragment/SettingsNotificationsFragment.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */