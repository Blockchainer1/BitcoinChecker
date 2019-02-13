package com.mobnetic.coinguardian.activity;

import android.app.AlertDialog.Builder;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.res.Resources;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import butterknife.ButterKnife;
import butterknife.InjectView;
import com.mobnetic.coinguardian.activity.generic.SimpleFragmentActivity;
import com.mobnetic.coinguardian.appwidget.WidgetProvider;
import com.mobnetic.coinguardian.fragment.CheckersListFragment;
import com.mobnetic.coinguardian.receiver.MarketChecker;
import com.mobnetic.coinguardian.util.PreferencesUtils;
import com.mobnetic.coinguardian.util.Utils;
import com.tjeannin.apprate.AppRate;

public class CheckersListActivity
  extends SimpleFragmentActivity<CheckersListFragment>
{
  private static final int CURRENT_NEWS_ID = 3;
  @InjectView(2131624051)
  View donateBar;
  private boolean wasDialogShown;
  
  protected CheckersListFragment createChildFragment()
  {
    return new CheckersListFragment();
  }
  
  protected int getContentViewResId()
  {
    return 2130903071;
  }
  
  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    String str = getString(2131165197);
    AppRate localAppRate = new AppRate(this).setShowIfAppHasCrashed(false).setMinDaysUntilPrompt(4L).setMinLaunchesUntilPrompt(10L);
    localAppRate.setCustomDialog(new AlertDialog.Builder(this).setTitle(getString(2131165342, new Object[] { str })).setMessage(getResources().getText(2131165341, str)).setPositiveButton(2131165340, localAppRate).setNeutralButton(2131165339, localAppRate).setNegativeButton(2131165338, localAppRate).setOnCancelListener(localAppRate));
    localAppRate.init();
    if (paramBundle == null)
    {
      WidgetProvider.refreshWidget(this);
      MarketChecker.checkIfAlarmsAreSet(this);
    }
    boolean bool;
    if (paramBundle != null)
    {
      bool = paramBundle.getBoolean("wasDialogShown");
      this.wasDialogShown = bool;
      if (!this.wasDialogShown)
      {
        if (PreferencesUtils.isDefaultItemAdded(this)) {
          break label200;
        }
        new AlertDialog.Builder(this).setCancelable(false).setTitle(2131165276).setMessage(2131165275).setPositiveButton(2131165273, new DialogInterface.OnClickListener()
        {
          public void onClick(DialogInterface paramAnonymousDialogInterface, int paramAnonymousInt)
          {
            CheckersListActivity.access$002(CheckersListActivity.this, true);
            PreferencesUtils.setDefaultItemAdded(CheckersListActivity.this);
            CheckerAddActivity.startCheckerAddActivity(CheckersListActivity.this, null);
          }
        }).show();
      }
    }
    for (;;)
    {
      ButterKnife.inject(this);
      return;
      bool = false;
      break;
      label200:
      if (!PreferencesUtils.wasNewsShown(this, 3)) {
        new AlertDialog.Builder(this).setCancelable(false).setTitle(2131165262).setMessage(2131165261).setNeutralButton(17039370, new DialogInterface.OnClickListener()
        {
          public void onClick(DialogInterface paramAnonymousDialogInterface, int paramAnonymousInt)
          {
            CheckersListActivity.access$002(CheckersListActivity.this, true);
            PreferencesUtils.setNewsShown(CheckersListActivity.this, 3);
          }
        }).setPositiveButton(2131165283, new DialogInterface.OnClickListener()
        {
          public void onClick(DialogInterface paramAnonymousDialogInterface, int paramAnonymousInt)
          {
            CheckersListActivity.access$002(CheckersListActivity.this, true);
            PreferencesUtils.setNewsShown(CheckersListActivity.this, 3);
            Utils.goToGitHubIssues(CheckersListActivity.this);
          }
        }).show();
      }
    }
  }
  
  public boolean onCreateOptionsMenu(Menu paramMenu)
  {
    getMenuInflater().inflate(2131755010, paramMenu);
    return super.onCreateOptionsMenu(paramMenu);
  }
  
  public void onDonateClicked(View paramView)
  {
    SettingsMainActivity.startSettingsMainActivity(this, true);
  }
  
  public boolean onOptionsItemSelected(MenuItem paramMenuItem)
  {
    if (paramMenuItem.getItemId() == 2131624100) {
      SettingsMainActivity.startSettingsMainActivity(this, false);
    }
    for (boolean bool = true;; bool = super.onOptionsItemSelected(paramMenuItem)) {
      return bool;
    }
  }
  
  protected void onSaveInstanceState(Bundle paramBundle)
  {
    paramBundle.putBoolean("wasDialogShown", this.wasDialogShown);
    super.onSaveInstanceState(paramBundle);
  }
  
  protected void onStart()
  {
    super.onStart();
    View localView = this.donateBar;
    if (PreferencesUtils.getDonationMade(this)) {}
    for (int i = 8;; i = 0)
    {
      localView.setVisibility(i);
      return;
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/activity/CheckersListActivity.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */