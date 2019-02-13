package uk.co.senab.actionbarpulltorefresh.library;

import android.app.Activity;
import android.content.res.Configuration;
import android.view.View;

public abstract class HeaderTransformer
{
  public abstract boolean hideHeaderView();
  
  public void onConfigurationChanged(Activity paramActivity, Configuration paramConfiguration) {}
  
  public void onPulled(float paramFloat) {}
  
  public void onRefreshMinimized() {}
  
  public void onRefreshStarted() {}
  
  public void onReleaseToRefresh() {}
  
  public void onReset() {}
  
  public void onViewCreated(Activity paramActivity, View paramView) {}
  
  public abstract boolean showHeaderView();
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/uk/co/senab/actionbarpulltorefresh/library/HeaderTransformer.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */