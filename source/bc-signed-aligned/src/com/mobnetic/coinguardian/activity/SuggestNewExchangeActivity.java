package com.mobnetic.coinguardian.activity;

import android.content.Context;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.text.method.LinkMovementMethod;
import android.view.View;
import android.widget.TextView;
import butterknife.ButterKnife;
import butterknife.InjectView;
import butterknife.OnClick;
import com.mobnetic.coinguardian.activity.generic.SimpleDonateFragmentSubActivity;
import com.mobnetic.coinguardian.util.Utils;

public class SuggestNewExchangeActivity
  extends SimpleDonateFragmentSubActivity<Fragment>
{
  @InjectView(2131624084)
  View suggestButton;
  @InjectView(2131624015)
  TextView textView;
  
  public static void startSettingsMainActivity(Context paramContext)
  {
    startSimpleDonateFragmentActivity(paramContext, SuggestNewExchangeActivity.class, false);
  }
  
  protected Fragment createChildFragment()
  {
    return null;
  }
  
  protected int getContentViewResId()
  {
    return 2130903084;
  }
  
  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    ButterKnife.inject(this);
    this.textView.setMovementMethod(LinkMovementMethod.getInstance());
  }
  
  @OnClick({2131624085})
  public void onDonateButtonClicked()
  {
    showDonateDialog();
  }
  
  @OnClick({2131624084})
  public void onSuggestButtonClicked()
  {
    Utils.goToGitHubIssues(this);
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/activity/SuggestNewExchangeActivity.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */