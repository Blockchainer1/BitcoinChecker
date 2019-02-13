package com.mobnetic.coinguardian.fragment;

import android.content.Intent;
import android.content.SharedPreferences;
import android.content.SharedPreferences.OnSharedPreferenceChangeListener;
import android.os.Bundle;
import android.preference.ListPreference;
import android.preference.Preference;
import android.preference.Preference.OnPreferenceChangeListener;
import android.preference.Preference.OnPreferenceClickListener;
import android.preference.PreferenceManager;
import android.support.v4.app.FragmentActivity;
import android.support.v4.preference.PreferenceFragment;
import com.mobnetic.coinguardian.model.CurrencySubunit;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.market.Bitstamp;
import com.mobnetic.coinguardian.util.CurrencyUtils;
import com.mobnetic.coinguardian.util.FormatUtils;
import com.mobnetic.coinguardian.util.TTSHelper;
import com.mobnetic.coinguardian.util.Utils;

public class SettingsTTSFragment
  extends PreferenceFragment
  implements SharedPreferences.OnSharedPreferenceChangeListener
{
  private final String currencyDst = "USD";
  private final String currencySrc = "BTC";
  private Preference formatExamplePreference;
  private final double lastPrice = 712.67D;
  private final Market market = new Bitstamp();
  private final CurrencySubunit subunitDst = CurrencyUtils.getCurrencySubunit("USD", 1L);
  
  private void refreshFormatExamplePreference()
  {
    String str = FormatUtils.formatTextForTTS(getActivity(), 712.67D, "BTC", 0, false, this.subunitDst, false, this.market, this.market.name, false);
    this.formatExamplePreference.setSummary(str);
  }
  
  public void onCreate(final Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    addPreferencesFromResource(2131034116);
    findPreference(getString(2131165414)).setOnPreferenceClickListener(new Preference.OnPreferenceClickListener()
    {
      public boolean onPreferenceClick(Preference paramAnonymousPreference)
      {
        try
        {
          paramAnonymousPreference = new android/content/Intent;
          paramAnonymousPreference.<init>();
          paramAnonymousPreference.setAction("com.android.settings.TTS_SETTINGS");
          paramAnonymousPreference.setFlags(268435456);
          SettingsTTSFragment.this.getActivity().startActivity(paramAnonymousPreference);
          return true;
        }
        catch (Exception paramAnonymousPreference)
        {
          for (;;)
          {
            paramAnonymousPreference.printStackTrace();
          }
        }
      }
    });
    this.formatExamplePreference = findPreference(getString(2131165418));
    paramBundle = getString(2131165294, new Object[] { "BTC", "USD" });
    this.formatExamplePreference.setTitle(getString(2131165419, new Object[] { paramBundle, this.market.name }));
    this.formatExamplePreference.setOnPreferenceClickListener(new Preference.OnPreferenceClickListener()
    {
      public boolean onPreferenceClick(Preference paramAnonymousPreference)
      {
        TTSHelper.speak(SettingsTTSFragment.this.getActivity(), FormatUtils.formatTextForTTS(SettingsTTSFragment.this.getActivity(), 712.67D, "BTC", 0, false, SettingsTTSFragment.this.subunitDst, false, SettingsTTSFragment.this.market, SettingsTTSFragment.this.market.ttsName, false));
        return true;
      }
    });
    paramBundle = (ListPreference)findPreference(getString(2131165408));
    paramBundle.setSummary(paramBundle.getEntry());
    paramBundle.setOnPreferenceChangeListener(new Preference.OnPreferenceChangeListener()
    {
      public boolean onPreferenceChange(Preference paramAnonymousPreference, Object paramAnonymousObject)
      {
        return Utils.handleIntListOnPreferenceChange(paramBundle, paramAnonymousObject);
      }
    });
  }
  
  public void onSharedPreferenceChanged(SharedPreferences paramSharedPreferences, String paramString)
  {
    if ((getString(2131165423).equals(paramString)) || (getString(2131165420).equals(paramString)) || (getString(2131165426).equals(paramString)) || (getString(2131165429).equals(paramString))) {
      refreshFormatExamplePreference();
    }
  }
  
  public void onStart()
  {
    super.onStart();
    getPreferenceManager().getSharedPreferences().registerOnSharedPreferenceChangeListener(this);
    refreshFormatExamplePreference();
  }
  
  public void onStop()
  {
    super.onStop();
    try
    {
      getPreferenceManager().getSharedPreferences().unregisterOnSharedPreferenceChangeListener(this);
      return;
    }
    catch (Exception localException)
    {
      for (;;)
      {
        localException.printStackTrace();
      }
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/fragment/SettingsTTSFragment.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */