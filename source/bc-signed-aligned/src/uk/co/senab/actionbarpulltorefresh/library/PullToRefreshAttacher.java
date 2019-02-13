package uk.co.senab.actionbarpulltorefresh.library;

import android.app.ActionBar;
import android.app.Activity;
import android.content.Context;
import android.content.res.Configuration;
import android.graphics.Rect;
import android.os.Build.VERSION;
import android.os.Handler;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.view.Window;
import android.view.WindowManager;
import android.view.WindowManager.LayoutParams;
import java.util.Iterator;
import java.util.Set;
import java.util.WeakHashMap;
import uk.co.senab.actionbarpulltorefresh.library.listeners.HeaderViewListener;
import uk.co.senab.actionbarpulltorefresh.library.listeners.OnRefreshListener;
import uk.co.senab.actionbarpulltorefresh.library.viewdelegates.ViewDelegate;

public class PullToRefreshAttacher
{
  private static final boolean DEBUG = false;
  private static final String LOG_TAG = "PullToRefreshAttacher";
  private Activity mActivity;
  private EnvironmentDelegate mEnvironmentDelegate;
  private final Handler mHandler = new Handler();
  private boolean mHandlingTouchEventFromDown;
  private HeaderTransformer mHeaderTransformer;
  private View mHeaderView;
  private HeaderViewListener mHeaderViewListener;
  private float mInitialMotionX;
  private float mInitialMotionY;
  private boolean mIsBeingDragged;
  private boolean mIsDestroyed = false;
  private boolean mIsRefreshing;
  private float mLastMotionY;
  private OnRefreshListener mOnRefreshListener;
  private float mPullBeginY;
  private final Rect mRect = new Rect();
  private final boolean mRefreshMinimize;
  private final int mRefreshMinimizeDelay;
  private final Runnable mRefreshMinimizeRunnable = new Runnable()
  {
    public void run()
    {
      PullToRefreshAttacher.this.minimizeHeader();
    }
  };
  private final boolean mRefreshOnUp;
  private final float mRefreshScrollDistance;
  private final WeakHashMap<View, ViewDelegate> mRefreshableViews;
  private final int mTouchSlop;
  private View mViewBeingDragged;
  private final int[] mViewLocationResult = new int[2];
  
  protected PullToRefreshAttacher(Activity paramActivity, final Options paramOptions)
  {
    Options localOptions = paramOptions;
    if (paramOptions == null)
    {
      Log.i("PullToRefreshAttacher", "Given null options so using default options.");
      localOptions = new Options();
    }
    this.mActivity = paramActivity;
    this.mRefreshableViews = new WeakHashMap();
    this.mRefreshScrollDistance = localOptions.refreshScrollDistance;
    this.mRefreshOnUp = localOptions.refreshOnUp;
    this.mRefreshMinimizeDelay = localOptions.refreshMinimizeDelay;
    this.mRefreshMinimize = localOptions.refreshMinimize;
    if (localOptions.environmentDelegate != null)
    {
      paramOptions = localOptions.environmentDelegate;
      this.mEnvironmentDelegate = paramOptions;
      if (localOptions.headerTransformer == null) {
        break label227;
      }
    }
    label227:
    for (paramOptions = localOptions.headerTransformer;; paramOptions = createDefaultHeaderTransformer())
    {
      this.mHeaderTransformer = paramOptions;
      this.mTouchSlop = ViewConfiguration.get(paramActivity).getScaledTouchSlop();
      paramOptions = (ViewGroup)paramActivity.getWindow().getDecorView();
      this.mHeaderView = LayoutInflater.from(this.mEnvironmentDelegate.getContextForInflater(paramActivity)).inflate(localOptions.headerLayout, paramOptions, false);
      if (this.mHeaderView != null) {
        break label235;
      }
      throw new IllegalArgumentException("Must supply valid layout id for header.");
      paramOptions = createDefaultEnvironmentDelegate();
      break;
    }
    label235:
    this.mHeaderView.setVisibility(4);
    this.mHeaderTransformer.onViewCreated(paramActivity, this.mHeaderView);
    this.mHandler.post(new Runnable()
    {
      public void run()
      {
        if (paramOptions.getWindowToken() != null) {
          PullToRefreshAttacher.this.addHeaderViewToActivity(PullToRefreshAttacher.this.mHeaderView, PullToRefreshAttacher.this.mActivity);
        }
        for (;;)
        {
          return;
          PullToRefreshAttacher.this.mHandler.post(this);
        }
      }
    });
  }
  
  private boolean canRefresh(boolean paramBoolean)
  {
    if ((!this.mIsRefreshing) && ((!paramBoolean) || (this.mOnRefreshListener != null))) {}
    for (paramBoolean = true;; paramBoolean = false) {
      return paramBoolean;
    }
  }
  
  private boolean checkScrollForRefresh(View paramView)
  {
    boolean bool = true;
    if ((this.mIsBeingDragged) && (this.mRefreshOnUp) && (paramView != null) && (this.mLastMotionY - this.mPullBeginY >= getScrollNeededForRefresh(paramView))) {
      setRefreshingInt(paramView, true, true);
    }
    for (;;)
    {
      return bool;
      bool = false;
    }
  }
  
  private float getScrollNeededForRefresh(View paramView)
  {
    return paramView.getHeight() * this.mRefreshScrollDistance;
  }
  
  private boolean isDestroyed()
  {
    if (this.mIsDestroyed) {
      Log.i("PullToRefreshAttacher", "PullToRefreshAttacher is destroyed.");
    }
    return this.mIsDestroyed;
  }
  
  private void reset(boolean paramBoolean)
  {
    this.mIsRefreshing = false;
    if (this.mRefreshMinimize) {
      this.mHandler.removeCallbacks(this.mRefreshMinimizeRunnable);
    }
    hideHeaderView();
  }
  
  private void setRefreshingInt(View paramView, boolean paramBoolean1, boolean paramBoolean2)
  {
    if (isDestroyed()) {}
    for (;;)
    {
      return;
      if (this.mIsRefreshing != paramBoolean1)
      {
        resetTouch();
        if ((paramBoolean1) && (canRefresh(paramBoolean2))) {
          startRefresh(paramView, paramBoolean2);
        } else {
          reset(paramBoolean2);
        }
      }
    }
  }
  
  private void startRefresh(View paramView, boolean paramBoolean)
  {
    this.mIsRefreshing = true;
    if ((paramBoolean) && (this.mOnRefreshListener != null)) {
      this.mOnRefreshListener.onRefreshStarted(paramView);
    }
    this.mHeaderTransformer.onRefreshStarted();
    showHeaderView();
    if (this.mRefreshMinimize)
    {
      if (this.mRefreshMinimizeDelay <= 0) {
        break label69;
      }
      this.mHandler.postDelayed(this.mRefreshMinimizeRunnable, this.mRefreshMinimizeDelay);
    }
    for (;;)
    {
      return;
      label69:
      this.mHandler.post(this.mRefreshMinimizeRunnable);
    }
  }
  
  protected void addHeaderViewToActivity(View paramView, Activity paramActivity)
  {
    Object localObject = paramActivity.getWindow().getDecorView();
    Rect localRect = new Rect();
    ((View)localObject).getWindowVisibleDisplayFrame(localRect);
    int i = -1;
    int j = -2;
    localObject = paramView.getLayoutParams();
    if (localObject != null)
    {
      i = ((ViewGroup.LayoutParams)localObject).width;
      j = ((ViewGroup.LayoutParams)localObject).height;
    }
    localObject = new WindowManager.LayoutParams(i, j, 1000, 24, -3);
    ((WindowManager.LayoutParams)localObject).x = 0;
    ((WindowManager.LayoutParams)localObject).y = localRect.top;
    ((WindowManager.LayoutParams)localObject).gravity = 48;
    paramActivity.getWindowManager().addView(paramView, (ViewGroup.LayoutParams)localObject);
  }
  
  void addRefreshableView(View paramView, ViewDelegate paramViewDelegate)
  {
    if (isDestroyed()) {}
    for (;;)
    {
      return;
      if (paramView == null)
      {
        Log.i("PullToRefreshAttacher", "Refreshable View is null.");
      }
      else
      {
        ViewDelegate localViewDelegate = paramViewDelegate;
        if (paramViewDelegate == null) {
          localViewDelegate = InstanceCreationUtils.getBuiltInViewDelegate(paramView);
        }
        this.mRefreshableViews.put(paramView, localViewDelegate);
      }
    }
  }
  
  void clearRefreshableViews()
  {
    this.mRefreshableViews.clear();
  }
  
  protected EnvironmentDelegate createDefaultEnvironmentDelegate()
  {
    new EnvironmentDelegate()
    {
      public Context getContextForInflater(Activity paramAnonymousActivity)
      {
        Object localObject1 = null;
        Object localObject2 = localObject1;
        if (Build.VERSION.SDK_INT >= 14)
        {
          ActionBar localActionBar = paramAnonymousActivity.getActionBar();
          localObject2 = localObject1;
          if (localActionBar != null) {
            localObject2 = localActionBar.getThemedContext();
          }
        }
        localObject1 = localObject2;
        if (localObject2 == null) {
          localObject1 = paramAnonymousActivity;
        }
        return (Context)localObject1;
      }
    };
  }
  
  protected HeaderTransformer createDefaultHeaderTransformer()
  {
    return new DefaultHeaderTransformer();
  }
  
  void destroy()
  {
    if (this.mIsDestroyed) {}
    for (;;)
    {
      return;
      removeHeaderViewFromActivity(this.mHeaderView, this.mActivity);
      clearRefreshableViews();
      this.mActivity = null;
      this.mHeaderView = null;
      this.mHeaderViewListener = null;
      this.mEnvironmentDelegate = null;
      this.mHeaderTransformer = null;
      this.mIsDestroyed = true;
    }
  }
  
  final Activity getAttachedActivity()
  {
    return this.mActivity;
  }
  
  HeaderTransformer getHeaderTransformer()
  {
    return this.mHeaderTransformer;
  }
  
  final View getHeaderView()
  {
    return this.mHeaderView;
  }
  
  void hideHeaderView()
  {
    if ((this.mHeaderTransformer.hideHeaderView()) && (this.mHeaderViewListener != null)) {
      this.mHeaderViewListener.onStateChanged(this.mHeaderView, 2);
    }
  }
  
  final boolean isRefreshing()
  {
    return this.mIsRefreshing;
  }
  
  final boolean isViewBeingDragged(View paramView, MotionEvent paramMotionEvent)
  {
    boolean bool1 = false;
    boolean bool2 = bool1;
    if (paramView.isShown())
    {
      bool2 = bool1;
      if (this.mRefreshableViews.containsKey(paramView))
      {
        paramView.getLocationOnScreen(this.mViewLocationResult);
        int i = this.mViewLocationResult[0];
        int j = this.mViewLocationResult[1];
        this.mRect.set(i, j, paramView.getWidth() + i, paramView.getHeight() + j);
        j = (int)paramMotionEvent.getRawX();
        i = (int)paramMotionEvent.getRawY();
        bool2 = bool1;
        if (this.mRect.contains(j, i))
        {
          paramMotionEvent = (ViewDelegate)this.mRefreshableViews.get(paramView);
          bool2 = bool1;
          if (paramMotionEvent != null) {
            bool2 = paramMotionEvent.isReadyForPull(paramView, j - this.mRect.left, i - this.mRect.top);
          }
        }
      }
    }
    return bool2;
  }
  
  void minimizeHeader()
  {
    if (isDestroyed()) {}
    for (;;)
    {
      return;
      this.mHeaderTransformer.onRefreshMinimized();
      if (this.mHeaderViewListener != null) {
        this.mHeaderViewListener.onStateChanged(this.mHeaderView, 1);
      }
    }
  }
  
  public void onConfigurationChanged(Configuration paramConfiguration)
  {
    this.mHeaderTransformer.onConfigurationChanged(this.mActivity, paramConfiguration);
  }
  
  final boolean onInterceptTouchEvent(MotionEvent paramMotionEvent)
  {
    boolean bool;
    if (isRefreshing())
    {
      bool = false;
      return bool;
    }
    float f1 = paramMotionEvent.getX();
    float f2 = paramMotionEvent.getY();
    switch (paramMotionEvent.getAction())
    {
    }
    for (;;)
    {
      bool = this.mIsBeingDragged;
      break;
      if ((!this.mIsBeingDragged) && (this.mInitialMotionY > 0.0F))
      {
        float f3 = f2 - this.mInitialMotionY;
        if ((f3 > f1 - this.mInitialMotionX) && (f3 > this.mTouchSlop))
        {
          this.mIsBeingDragged = true;
          onPullStarted(f2);
        }
        else if (f3 < -this.mTouchSlop)
        {
          resetTouch();
          continue;
          if (canRefresh(true))
          {
            Iterator localIterator = this.mRefreshableViews.keySet().iterator();
            while (localIterator.hasNext())
            {
              View localView = (View)localIterator.next();
              if (isViewBeingDragged(localView, paramMotionEvent))
              {
                this.mInitialMotionX = f1;
                this.mInitialMotionY = f2;
                this.mViewBeingDragged = localView;
              }
            }
            resetTouch();
          }
        }
      }
    }
  }
  
  void onPull(View paramView, float paramFloat)
  {
    float f = getScrollNeededForRefresh(paramView);
    paramFloat -= this.mPullBeginY;
    if (paramFloat < f) {
      this.mHeaderTransformer.onPulled(paramFloat / f);
    }
    for (;;)
    {
      return;
      if (this.mRefreshOnUp) {
        this.mHeaderTransformer.onReleaseToRefresh();
      } else {
        setRefreshingInt(paramView, true, true);
      }
    }
  }
  
  void onPullEnded()
  {
    if (!this.mIsRefreshing) {
      reset(true);
    }
  }
  
  void onPullStarted(float paramFloat)
  {
    showHeaderView();
    this.mPullBeginY = paramFloat;
  }
  
  final boolean onTouchEvent(MotionEvent paramMotionEvent)
  {
    boolean bool1 = true;
    if (paramMotionEvent.getAction() == 0) {
      this.mHandlingTouchEventFromDown = true;
    }
    boolean bool2;
    if ((this.mHandlingTouchEventFromDown) && (!this.mIsBeingDragged))
    {
      onInterceptTouchEvent(paramMotionEvent);
      bool2 = bool1;
    }
    for (;;)
    {
      return bool2;
      if (this.mViewBeingDragged == null) {
        bool2 = false;
      } else {
        switch (paramMotionEvent.getAction())
        {
        default: 
          bool2 = bool1;
          break;
        case 1: 
        case 3: 
          checkScrollForRefresh(this.mViewBeingDragged);
          if (this.mIsBeingDragged) {
            onPullEnded();
          }
          resetTouch();
          bool2 = bool1;
          break;
        case 2: 
          if (isRefreshing())
          {
            bool2 = false;
          }
          else
          {
            float f1 = paramMotionEvent.getY();
            bool2 = bool1;
            if (this.mIsBeingDragged)
            {
              bool2 = bool1;
              if (f1 != this.mLastMotionY)
              {
                float f2 = f1 - this.mLastMotionY;
                if (f2 >= -this.mTouchSlop)
                {
                  onPull(this.mViewBeingDragged, f1);
                  bool2 = bool1;
                  if (f2 > 0.0F)
                  {
                    this.mLastMotionY = f1;
                    bool2 = bool1;
                  }
                }
                else
                {
                  onPullEnded();
                  resetTouch();
                  bool2 = bool1;
                }
              }
            }
          }
          break;
        }
      }
    }
  }
  
  protected void removeHeaderViewFromActivity(View paramView, Activity paramActivity)
  {
    if (paramView.getWindowToken() != null) {
      paramActivity.getWindowManager().removeView(paramView);
    }
  }
  
  void resetTouch()
  {
    this.mIsBeingDragged = false;
    this.mHandlingTouchEventFromDown = false;
    this.mPullBeginY = -1.0F;
    this.mLastMotionY = -1.0F;
    this.mInitialMotionY = -1.0F;
  }
  
  final void setHeaderViewListener(HeaderViewListener paramHeaderViewListener)
  {
    this.mHeaderViewListener = paramHeaderViewListener;
  }
  
  void setOnRefreshListener(OnRefreshListener paramOnRefreshListener)
  {
    this.mOnRefreshListener = paramOnRefreshListener;
  }
  
  final void setRefreshComplete()
  {
    setRefreshingInt(null, false, false);
  }
  
  final void setRefreshing(boolean paramBoolean)
  {
    setRefreshingInt(null, paramBoolean, false);
  }
  
  void showHeaderView()
  {
    if ((this.mHeaderTransformer.showHeaderView()) && (this.mHeaderViewListener != null)) {
      this.mHeaderViewListener.onStateChanged(this.mHeaderView, 0);
    }
  }
  
  void useViewDelegate(Class<?> paramClass, ViewDelegate paramViewDelegate)
  {
    Iterator localIterator = this.mRefreshableViews.keySet().iterator();
    while (localIterator.hasNext())
    {
      View localView = (View)localIterator.next();
      if (paramClass.isInstance(localView)) {
        this.mRefreshableViews.put(localView, paramViewDelegate);
      }
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/uk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */