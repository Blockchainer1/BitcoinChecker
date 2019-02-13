package com.mobnetic.coinguardian.fragment;

import android.app.Activity;
import android.app.AlertDialog.Builder;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.Intent;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.os.Bundle;
import android.preference.Preference;
import android.preference.Preference.OnPreferenceChangeListener;
import android.preference.Preference.OnPreferenceClickListener;
import android.support.v4.app.FragmentActivity;
import com.mobnetic.coinguardian.activity.SettingsMainActivity;
import com.mobnetic.coinguardian.activity.SettingsNotificationsActivity;
import com.mobnetic.coinguardian.activity.SettingsSoundsActivity;
import com.mobnetic.coinguardian.activity.SettingsTTSActivity;
import com.mobnetic.coinguardian.dialog.ChangeLogDialog;
import com.mobnetic.coinguardian.fragment.generic.TTSAwareFragment;
import com.mobnetic.coinguardian.preferences.FrequencyPickerDialogPreference;
import com.mobnetic.coinguardian.receiver.MarketChecker;
import com.mobnetic.coinguardian.util.PreferencesUtils;
import com.mobnetic.coinguardian.util.Utils;

public class SettingsMainFragment
  extends TTSAwareFragment
{
  private SettingsMainActivity settingsMainActivity;
  private Preference ttsCategoryPreference;
  
  public static void startShareIntent(Context paramContext)
  {
    Intent localIntent = new Intent("android.intent.action.SEND");
    localIntent.putExtra("android.intent.extra.TITLE", paramContext.getString(2131165197));
    localIntent.putExtra("android.intent.extra.SUBJECT", paramContext.getString(2131165197));
    localIntent.putExtra("android.intent.extra.TEXT", "https://play.google.com/store/apps/details?id=com.mobnetic.coinguardian");
    localIntent.setType("text/plain");
    paramContext.startActivity(Intent.createChooser(localIntent, paramContext.getString(2131165372)));
  }
  
  public void onAttach(Activity paramActivity)
  {
    super.onAttach(paramActivity);
    if ((paramActivity instanceof SettingsMainActivity)) {
      this.settingsMainActivity = ((SettingsMainActivity)paramActivity);
    }
  }
  
  public void onCreateBeforeInitTTS(Bundle paramBundle)
  {
    super.onCreateBeforeInitTTS(paramBundle);
    addPreferencesFromResource(2131034113);
    findPreference(getString(2131165393)).setOnPreferenceClickListener(new Preference.OnPreferenceClickListener()
    {
      public boolean onPreferenceClick(Preference paramAnonymousPreference)
      {
        SettingsMainFragment.this.startActivity(new Intent(SettingsMainFragment.this.getActivity(), SettingsNotificationsActivity.class));
        return true;
      }
    });
    ((FrequencyPickerDialogPreference)findPreference(getString(2131165380))).setOnPreferenceChangeListener(new Preference.OnPreferenceChangeListener()
    {
      public boolean onPreferenceChange(Preference paramAnonymousPreference, Object paramAnonymousObject)
      {
        long l = ((Long)paramAnonymousObject).longValue();
        PreferencesUtils.setCheckGlobalFrequency(SettingsMainFragment.this.getActivity(), l);
        MarketChecker.resetAlarmManagerForAllEnabledThatUseGlobalFrequency(SettingsMainFragment.this.getActivity());
        return true;
      }
    });
    findPreference(getString(2131165404)).setOnPreferenceClickListener(new Preference.OnPreferenceClickListener()
    {
      public boolean onPreferenceClick(Preference paramAnonymousPreference)
      {
        SettingsMainFragment.this.startActivity(new Intent(SettingsMainFragment.this.getActivity(), SettingsSoundsActivity.class));
        return true;
      }
    });
    this.ttsCategoryPreference = findPreference(getString(2131165412));
    this.ttsCategoryPreference.setOnPreferenceClickListener(new Preference.OnPreferenceClickListener()
    {
      public boolean onPreferenceClick(Preference paramAnonymousPreference)
      {
        SettingsMainFragment.this.startActivity(new Intent(SettingsMainFragment.this.getActivity(), SettingsTTSActivity.class));
        return true;
      }
    });
    findPreference(getString(2131165367)).setOnPreferenceClickListener(new Preference.OnPreferenceClickListener()
    {
      public boolean onPreferenceClick(Preference paramAnonymousPreference)
      {
        Utils.goToGitHubIssues(SettingsMainFragment.this.getActivity());
        return true;
      }
    });
    findPreference(getString(2131165361)).setOnPreferenceClickListener(new Preference.OnPreferenceClickListener()
    {
      public boolean onPreferenceClick(Preference paramAnonymousPreference)
      {
        Utils.goToGitHub(SettingsMainFragment.this.getActivity());
        return true;
      }
    });
    findPreference(getString(2131165350)).setOnPreferenceClickListener(new Preference.OnPreferenceClickListener()
    {
      public boolean onPreferenceClick(Preference paramAnonymousPreference)
      {
        if (SettingsMainFragment.this.settingsMainActivity != null) {
          SettingsMainFragment.this.settingsMainActivity.showDonateDialog();
        }
        return true;
      }
    });
    findPreference(getString(2131165370)).setOnPreferenceClickListener(new Preference.OnPreferenceClickListener()
    {
      public boolean onPreferenceClick(Preference paramAnonymousPreference)
      {
        SettingsMainFragment.startShareIntent(SettingsMainFragment.this.getActivity());
        return true;
      }
    });
    findPreference(getString(2131165364)).setOnPreferenceClickListener(new Preference.OnPreferenceClickListener()
    {
      public boolean onPreferenceClick(Preference paramAnonymousPreference)
      {
        Utils.goToGooglePlay(SettingsMainFragment.this.getActivity(), SettingsMainFragment.this.getActivity().getPackageName());
        return true;
      }
    });
    findPreference(getString(2131165345)).setOnPreferenceClickListener(new Preference.OnPreferenceClickListener()
    {
      public boolean onPreferenceClick(Preference paramAnonymousPreference)
      {
        new ChangeLogDialog(SettingsMainFragment.this.getActivity()).show();
        return true;
      }
    });
    paramBundle = findPreference(getString(2131165376));
    try
    {
      PackageInfo localPackageInfo = getActivity().getPackageManager().getPackageInfo(getActivity().getPackageName(), 0);
      paramBundle.setTitle(getString(2131165378, new Object[] { getString(2131165197), localPackageInfo.versionName }));
      paramBundle.setOnPreferenceClickListener(new Preference.OnPreferenceClickListener()
      {
        public boolean onPreferenceClick(Preference paramAnonymousPreference)
        {
          new AlertDialog.Builder(SettingsMainFragment.this.getActivity()).setMessage(2131165375).setNeutralButton(2131165374, new DialogInterface.OnClickListener()
          {
            public void onClick(DialogInterface paramAnonymous2DialogInterface, int paramAnonymous2Int)
            {
              Utils.goToGitHubIssues(SettingsMainFragment.this.getActivity());
            }
          }).setPositiveButton(2131165373, new DialogInterface.OnClickListener()
          {
            public void onClick(DialogInterface paramAnonymous2DialogInterface, int paramAnonymous2Int)
            {
              Utils.sendEmail(SettingsMainFragment.this.getActivity(), "mobnetic@gmail.com", "Bitcoin Checker");
            }
          }).show();
          return true;
        }
      });
      return;
    }
    catch (PackageManager.NameNotFoundException localNameNotFoundException)
    {
      for (;;)
      {
        localNameNotFoundException.printStackTrace();
      }
    }
  }
  
  protected void onTTSAvailable(boolean paramBoolean)
  {
    super.onTTSAvailable(paramBoolean);
    if (getActivity() == null) {}
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/fragment/SettingsMainFragment.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */