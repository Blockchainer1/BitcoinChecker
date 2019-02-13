package uk.co.senab.actionbarpulltorefresh.extras.actionbarcompat;

import android.app.Activity;
import android.content.Context;
import android.util.AttributeSet;
import uk.co.senab.actionbarpulltorefresh.library.Options;
import uk.co.senab.actionbarpulltorefresh.library.PullToRefreshAttacher;

public class PullToRefreshLayout
  extends uk.co.senab.actionbarpulltorefresh.library.PullToRefreshLayout
{
  public PullToRefreshLayout(Context paramContext)
  {
    super(paramContext);
  }
  
  public PullToRefreshLayout(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
  }
  
  public PullToRefreshLayout(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
  }
  
  protected PullToRefreshAttacher createPullToRefreshAttacher(Activity paramActivity, Options paramOptions)
  {
    return new AbcPullToRefreshAttacher(paramActivity, paramOptions);
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/uk/co/senab/actionbarpulltorefresh/extras/actionbarcompat/PullToRefreshLayout.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */