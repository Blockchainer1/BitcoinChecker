package uk.co.senab.actionbarpulltorefresh.library;

import android.app.Activity;
import android.content.Context;
import android.content.res.Configuration;
import android.content.res.TypedArray;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.FrameLayout.LayoutParams;
import uk.co.senab.actionbarpulltorefresh.library.listeners.HeaderViewListener;
import uk.co.senab.actionbarpulltorefresh.library.viewdelegates.ViewDelegate;

public class PullToRefreshLayout
  extends FrameLayout
{
  private static final boolean DEBUG = false;
  private static final String LOG_TAG = "PullToRefreshLayout";
  private PullToRefreshAttacher mPullToRefreshAttacher;
  
  public PullToRefreshLayout(Context paramContext)
  {
    this(paramContext, null);
  }
  
  public PullToRefreshLayout(Context paramContext, AttributeSet paramAttributeSet)
  {
    this(paramContext, paramAttributeSet, 0);
  }
  
  public PullToRefreshLayout(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
  }
  
  private void ensureAttacher()
  {
    if (this.mPullToRefreshAttacher == null) {
      throw new IllegalStateException("You need to setup the PullToRefreshLayout before using it");
    }
  }
  
  void addAllChildrenAsPullable()
  {
    ensureAttacher();
    int i = 0;
    int j = getChildCount();
    while (i < j)
    {
      addRefreshableView(getChildAt(i));
      i++;
    }
  }
  
  void addChildrenAsPullable(int... paramVarArgs)
  {
    if (paramVarArgs.length > 0)
    {
      int i = 0;
      int j = paramVarArgs.length;
      while (i < j)
      {
        addRefreshableView(findViewById(paramVarArgs[i]));
        i++;
      }
    }
  }
  
  void addRefreshableView(View paramView)
  {
    if (this.mPullToRefreshAttacher != null) {
      this.mPullToRefreshAttacher.addRefreshableView(paramView, getViewDelegateFromLayoutParams(paramView));
    }
  }
  
  protected PullToRefreshAttacher createPullToRefreshAttacher(Activity paramActivity, Options paramOptions)
  {
    if (paramOptions != null) {}
    for (;;)
    {
      return new PullToRefreshAttacher(paramActivity, paramOptions);
      paramOptions = new Options();
    }
  }
  
  public FrameLayout.LayoutParams generateLayoutParams(AttributeSet paramAttributeSet)
  {
    return new LayoutParams(getContext(), paramAttributeSet);
  }
  
  public HeaderTransformer getHeaderTransformer()
  {
    ensureAttacher();
    return this.mPullToRefreshAttacher.getHeaderTransformer();
  }
  
  public final View getHeaderView()
  {
    ensureAttacher();
    return this.mPullToRefreshAttacher.getHeaderView();
  }
  
  ViewDelegate getViewDelegateFromLayoutParams(View paramView)
  {
    String str;
    int i;
    if ((paramView != null) && ((paramView.getLayoutParams() instanceof LayoutParams)))
    {
      str = ((LayoutParams)paramView.getLayoutParams()).getViewDelegateClassName();
      if (!TextUtils.isEmpty(str))
      {
        i = str.indexOf('.');
        if (i == -1) {
          paramView = getContext().getPackageName() + "." + str;
        }
      }
    }
    for (paramView = (ViewDelegate)InstanceCreationUtils.instantiateViewDelegate(getContext(), paramView);; paramView = null)
    {
      return paramView;
      paramView = str;
      if (i != 0) {
        break;
      }
      paramView = getContext().getPackageName() + str;
      break;
    }
  }
  
  public final boolean isRefreshing()
  {
    ensureAttacher();
    return this.mPullToRefreshAttacher.isRefreshing();
  }
  
  protected void onConfigurationChanged(Configuration paramConfiguration)
  {
    if (this.mPullToRefreshAttacher != null) {
      this.mPullToRefreshAttacher.onConfigurationChanged(paramConfiguration);
    }
    super.onConfigurationChanged(paramConfiguration);
  }
  
  protected void onDetachedFromWindow()
  {
    if (this.mPullToRefreshAttacher != null) {
      this.mPullToRefreshAttacher.destroy();
    }
    super.onDetachedFromWindow();
  }
  
  public final boolean onInterceptTouchEvent(MotionEvent paramMotionEvent)
  {
    if ((isEnabled()) && (this.mPullToRefreshAttacher != null) && (getChildCount() > 0)) {}
    for (boolean bool = this.mPullToRefreshAttacher.onInterceptTouchEvent(paramMotionEvent);; bool = false) {
      return bool;
    }
  }
  
  public final boolean onTouchEvent(MotionEvent paramMotionEvent)
  {
    if ((isEnabled()) && (this.mPullToRefreshAttacher != null)) {}
    for (boolean bool = this.mPullToRefreshAttacher.onTouchEvent(paramMotionEvent);; bool = super.onTouchEvent(paramMotionEvent)) {
      return bool;
    }
  }
  
  public final void setHeaderViewListener(HeaderViewListener paramHeaderViewListener)
  {
    ensureAttacher();
    this.mPullToRefreshAttacher.setHeaderViewListener(paramHeaderViewListener);
  }
  
  void setPullToRefreshAttacher(PullToRefreshAttacher paramPullToRefreshAttacher)
  {
    if (this.mPullToRefreshAttacher != null) {
      this.mPullToRefreshAttacher.destroy();
    }
    this.mPullToRefreshAttacher = paramPullToRefreshAttacher;
  }
  
  public final void setRefreshComplete()
  {
    ensureAttacher();
    this.mPullToRefreshAttacher.setRefreshComplete();
  }
  
  public final void setRefreshing(boolean paramBoolean)
  {
    ensureAttacher();
    this.mPullToRefreshAttacher.setRefreshing(paramBoolean);
  }
  
  static class LayoutParams
    extends FrameLayout.LayoutParams
  {
    private final String mViewDelegateClassName;
    
    LayoutParams(Context paramContext, AttributeSet paramAttributeSet)
    {
      super(paramAttributeSet);
      paramContext = paramContext.obtainStyledAttributes(paramAttributeSet, R.styleable.PullToRefreshView);
      this.mViewDelegateClassName = paramContext.getString(R.styleable.PullToRefreshView_ptrViewDelegateClass);
      paramContext.recycle();
    }
    
    String getViewDelegateClassName()
    {
      return this.mViewDelegateClassName;
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/uk/co/senab/actionbarpulltorefresh/library/PullToRefreshLayout.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */