package com.mobnetic.coinguardian.appwidget;

import android.os.Bundle;
import android.preference.ListPreference;
import android.preference.Preference;
import android.preference.Preference.OnPreferenceChangeListener;
import android.preference.PreferenceManager;
import android.support.v4.preference.PreferenceFragment;

public class WidgetConfigureFragment
  extends PreferenceFragment
{
  public static WidgetConfigureFragment newInstance(int paramInt)
  {
    WidgetConfigureFragment localWidgetConfigureFragment = new WidgetConfigureFragment();
    Bundle localBundle = new Bundle();
    localBundle.putInt("appWidgetId", paramInt);
    localWidgetConfigureFragment.setArguments(localBundle);
    return localWidgetConfigureFragment;
  }
  
  private void setAlphaPercentPreferenceSummary(ListPreference paramListPreference, CharSequence paramCharSequence)
  {
    paramListPreference.setSummary(String.valueOf(paramCharSequence).replace("%", "%%"));
  }
  
  public void onCreate(final Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    int i = 0;
    if (getArguments() != null) {
      i = getArguments().getInt("appWidgetId", 0);
    }
    getPreferenceManager().setSharedPreferencesName(WidgetPrefsUtils.getSharedPreferencesName(i));
    addPreferencesFromResource(2131034118);
    paramBundle = (ListPreference)findPreference(getString(2131165462));
    setAlphaPercentPreferenceSummary(paramBundle, paramBundle.getEntry());
    paramBundle.setOnPreferenceChangeListener(new Preference.OnPreferenceChangeListener()
    {
      public boolean onPreferenceChange(Preference paramAnonymousPreference, Object paramAnonymousObject)
      {
        try
        {
          paramAnonymousPreference = paramBundle.getEntries();
          int i = paramBundle.findIndexOfValue((String)paramAnonymousObject);
          int j;
          if (i >= 0)
          {
            j = i;
            if (i < paramAnonymousPreference.length) {}
          }
          else
          {
            j = 0;
          }
          WidgetConfigureFragment.this.setAlphaPercentPreferenceSummary(paramBundle, paramBundle.getEntries()[j]);
          bool = true;
        }
        catch (Exception paramAnonymousPreference)
        {
          for (;;)
          {
            paramAnonymousPreference.printStackTrace();
            boolean bool = false;
          }
        }
        return bool;
      }
    });
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/appwidget/WidgetConfigureFragment.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */