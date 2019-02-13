package uk.co.senab.actionbarpulltorefresh.library;

import android.app.Activity;
import android.view.View;
import android.view.ViewGroup;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map.Entry;
import java.util.Set;
import uk.co.senab.actionbarpulltorefresh.library.listeners.OnRefreshListener;
import uk.co.senab.actionbarpulltorefresh.library.viewdelegates.ViewDelegate;

public class ActionBarPullToRefresh
{
  public static SetupWizard from(Activity paramActivity)
  {
    return new SetupWizard(paramActivity, null);
  }
  
  public static final class SetupWizard
  {
    private final Activity mActivity;
    private OnRefreshListener mOnRefreshListener;
    private Options mOptions;
    private HashMap<Class, ViewDelegate> mViewDelegates;
    private ViewGroup mViewGroupToInsertInto;
    private int[] refreshableViewIds;
    
    private SetupWizard(Activity paramActivity)
    {
      this.mActivity = paramActivity;
    }
    
    private static void insertLayoutIntoViewGroup(ViewGroup paramViewGroup, PullToRefreshLayout paramPullToRefreshLayout)
    {
      for (View localView = paramViewGroup.getChildAt(0); localView != null; localView = paramViewGroup.getChildAt(0))
      {
        paramViewGroup.removeViewAt(0);
        paramPullToRefreshLayout.addView(localView);
      }
      paramViewGroup.addView(paramPullToRefreshLayout, -1, -1);
    }
    
    public SetupWizard allChildrenArePullable()
    {
      this.refreshableViewIds = null;
      return this;
    }
    
    public SetupWizard insertLayoutInto(ViewGroup paramViewGroup)
    {
      this.mViewGroupToInsertInto = paramViewGroup;
      return this;
    }
    
    public SetupWizard listener(OnRefreshListener paramOnRefreshListener)
    {
      this.mOnRefreshListener = paramOnRefreshListener;
      return this;
    }
    
    public SetupWizard options(Options paramOptions)
    {
      this.mOptions = paramOptions;
      return this;
    }
    
    public void setup(PullToRefreshLayout paramPullToRefreshLayout)
    {
      PullToRefreshAttacher localPullToRefreshAttacher = paramPullToRefreshLayout.createPullToRefreshAttacher(this.mActivity, this.mOptions);
      localPullToRefreshAttacher.setOnRefreshListener(this.mOnRefreshListener);
      if (this.mViewGroupToInsertInto != null) {
        insertLayoutIntoViewGroup(this.mViewGroupToInsertInto, paramPullToRefreshLayout);
      }
      paramPullToRefreshLayout.setPullToRefreshAttacher(localPullToRefreshAttacher);
      if (this.refreshableViewIds != null) {
        paramPullToRefreshLayout.addChildrenAsPullable(this.refreshableViewIds);
      }
      while (this.mViewDelegates != null)
      {
        Iterator localIterator = this.mViewDelegates.entrySet().iterator();
        while (localIterator.hasNext())
        {
          paramPullToRefreshLayout = (Map.Entry)localIterator.next();
          localPullToRefreshAttacher.useViewDelegate((Class)paramPullToRefreshLayout.getKey(), (ViewDelegate)paramPullToRefreshLayout.getValue());
        }
        paramPullToRefreshLayout.addAllChildrenAsPullable();
      }
    }
    
    public SetupWizard theseChildrenArePullable(int... paramVarArgs)
    {
      this.refreshableViewIds = paramVarArgs;
      return this;
    }
    
    public SetupWizard useViewDelegate(Class<?> paramClass, ViewDelegate paramViewDelegate)
    {
      if (this.mViewDelegates == null) {
        this.mViewDelegates = new HashMap();
      }
      this.mViewDelegates.put(paramClass, paramViewDelegate);
      return this;
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/uk/co/senab/actionbarpulltorefresh/library/ActionBarPullToRefresh.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */