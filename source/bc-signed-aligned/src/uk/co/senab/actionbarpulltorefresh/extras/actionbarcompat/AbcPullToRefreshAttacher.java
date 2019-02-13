package uk.co.senab.actionbarpulltorefresh.extras.actionbarcompat;

import android.app.Activity;
import android.content.Context;
import android.os.Build.VERSION;
import android.support.v7.app.ActionBar;
import android.support.v7.app.ActionBarActivity;
import android.view.View;
import android.widget.FrameLayout;
import uk.co.senab.actionbarpulltorefresh.library.EnvironmentDelegate;
import uk.co.senab.actionbarpulltorefresh.library.HeaderTransformer;
import uk.co.senab.actionbarpulltorefresh.library.Options;
import uk.co.senab.actionbarpulltorefresh.library.PullToRefreshAttacher;

class AbcPullToRefreshAttacher
  extends PullToRefreshAttacher
{
  private FrameLayout mHeaderViewWrapper;
  
  protected AbcPullToRefreshAttacher(Activity paramActivity, Options paramOptions)
  {
    super(paramActivity, paramOptions);
  }
  
  protected void addHeaderViewToActivity(View paramView, Activity paramActivity)
  {
    if (Build.VERSION.SDK_INT >= 14) {
      super.addHeaderViewToActivity(paramView, paramActivity);
    }
    for (;;)
    {
      return;
      this.mHeaderViewWrapper = new FrameLayout(paramActivity);
      this.mHeaderViewWrapper.addView(paramView);
      super.addHeaderViewToActivity(this.mHeaderViewWrapper, paramActivity);
    }
  }
  
  protected EnvironmentDelegate createDefaultEnvironmentDelegate()
  {
    return new AbcEnvironmentDelegate();
  }
  
  protected HeaderTransformer createDefaultHeaderTransformer()
  {
    return new AbcDefaultHeaderTransformer();
  }
  
  protected void removeHeaderViewFromActivity(View paramView, Activity paramActivity)
  {
    if (Build.VERSION.SDK_INT >= 14) {
      super.removeHeaderViewFromActivity(paramView, paramActivity);
    }
    for (;;)
    {
      return;
      if (this.mHeaderViewWrapper != null)
      {
        super.removeHeaderViewFromActivity(this.mHeaderViewWrapper, paramActivity);
        this.mHeaderViewWrapper = null;
      }
    }
  }
  
  public static class AbcEnvironmentDelegate
    implements EnvironmentDelegate
  {
    public Context getContextForInflater(Activity paramActivity)
    {
      Context localContext = null;
      Object localObject = ((ActionBarActivity)paramActivity).getSupportActionBar();
      if (localObject != null) {
        localContext = ((ActionBar)localObject).getThemedContext();
      }
      localObject = localContext;
      if (localContext == null) {
        localObject = paramActivity;
      }
      return (Context)localObject;
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/uk/co/senab/actionbarpulltorefresh/extras/actionbarcompat/AbcPullToRefreshAttacher.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */