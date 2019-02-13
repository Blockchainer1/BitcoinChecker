package com.mobnetic.coinguardian.fragment;

import android.content.Context;
import android.media.Ringtone;
import android.media.RingtoneManager;
import android.net.Uri;
import android.os.Bundle;
import android.preference.ListPreference;
import android.preference.Preference;
import android.preference.Preference.OnPreferenceChangeListener;
import android.preference.PreferenceCategory;
import android.preference.RingtonePreference;
import android.support.v4.preference.PreferenceFragment;
import com.mobnetic.coinguardian.util.PreferencesUtils;
import com.mobnetic.coinguardian.util.SoundFilesManager;
import com.mobnetic.coinguardian.util.Utils;

public class SettingsSoundsFragment
  extends PreferenceFragment
{
  private String getRingtoneName(String paramString)
  {
    if (paramString != null)
    {
      paramString = Uri.parse(paramString);
      if (paramString != null)
      {
        paramString = RingtoneManager.getRingtone(getActivity(), paramString);
        if (paramString == null) {}
      }
    }
    for (paramString = paramString.getTitle(getActivity());; paramString = "") {
      return paramString;
    }
  }
  
  public void onCreate(final Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    addPreferencesFromResource(2131034115);
    final RingtonePreference local1 = new RingtonePreference(getActivity())
    {
      protected Uri onRestoreRingtone()
      {
        Uri localUri1 = super.onRestoreRingtone();
        Uri localUri2 = localUri1;
        if (localUri1 == null) {
          localUri2 = SoundFilesManager.getUriForRingtone(SettingsSoundsFragment.this.getActivity(), "bitcoin_checker_up_cheers");
        }
        return localUri2;
      }
    };
    local1.setKey(getString(2131165402));
    local1.setTitle(2131165403);
    local1.setRingtoneType(2);
    local1.setSummary(getRingtoneName(PreferencesUtils.getSoundAlarmNotificationUp(getActivity())));
    local1.setOnPreferenceChangeListener(new Preference.OnPreferenceChangeListener()
    {
      public boolean onPreferenceChange(Preference paramAnonymousPreference, Object paramAnonymousObject)
      {
        local1.setSummary(SettingsSoundsFragment.this.getRingtoneName((String)paramAnonymousObject));
        return true;
      }
    });
    final RingtonePreference local3 = new RingtonePreference(getActivity())
    {
      protected Uri onRestoreRingtone()
      {
        Uri localUri1 = super.onRestoreRingtone();
        Uri localUri2 = localUri1;
        if (localUri1 == null) {
          localUri2 = SoundFilesManager.getUriForRingtone(SettingsSoundsFragment.this.getActivity(), "bitcoin_checker_down_alert");
        }
        return localUri2;
      }
    };
    local3.setKey(getString(2131165400));
    local3.setTitle(2131165401);
    local3.setRingtoneType(2);
    local3.setSummary(getRingtoneName(PreferencesUtils.getSoundAlarmNotificationDown(getActivity())));
    local3.setOnPreferenceChangeListener(new Preference.OnPreferenceChangeListener()
    {
      public boolean onPreferenceChange(Preference paramAnonymousPreference, Object paramAnonymousObject)
      {
        local3.setSummary(SettingsSoundsFragment.this.getRingtoneName((String)paramAnonymousObject));
        return true;
      }
    });
    paramBundle = (PreferenceCategory)findPreference(getString(2131165398));
    paramBundle.addPreference(local1);
    paramBundle.addPreference(local3);
    paramBundle = (ListPreference)findPreference(getString(2131165395));
    paramBundle.setSummary(paramBundle.getEntry());
    paramBundle.setOnPreferenceChangeListener(new Preference.OnPreferenceChangeListener()
    {
      public boolean onPreferenceChange(Preference paramAnonymousPreference, Object paramAnonymousObject)
      {
        return Utils.handleIntListOnPreferenceChange(paramBundle, paramAnonymousObject);
      }
    });
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/fragment/SettingsSoundsFragment.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */