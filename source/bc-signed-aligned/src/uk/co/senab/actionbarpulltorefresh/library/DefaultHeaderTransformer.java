package uk.co.senab.actionbarpulltorefresh.library;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.app.Activity;
import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.content.res.Resources.Theme;
import android.content.res.TypedArray;
import android.graphics.drawable.Drawable;
import android.os.Build.VERSION;
import android.util.TypedValue;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.AccelerateInterpolator;
import android.view.animation.Interpolator;
import android.widget.RelativeLayout.LayoutParams;
import android.widget.TextView;
import uk.co.senab.actionbarpulltorefresh.library.sdk.Compat;
import uk.co.senab.actionbarpulltorefresh.library.widget.PullToRefreshProgressBar;

public class DefaultHeaderTransformer
  extends HeaderTransformer
{
  public static final int PROGRESS_BAR_STYLE_INSIDE = 0;
  public static final int PROGRESS_BAR_STYLE_OUTSIDE = 1;
  private long mAnimationDuration;
  private ViewGroup mContentLayout;
  private PullToRefreshProgressBar mHeaderProgressBar;
  private TextView mHeaderTextView;
  private View mHeaderView;
  private final Interpolator mInterpolator = new AccelerateInterpolator();
  private int mProgressBarHeight = -2;
  private int mProgressBarStyle;
  private float mProgressCornerRadius;
  private int mProgressDrawableColor;
  private CharSequence mPullRefreshLabel;
  private CharSequence mRefreshingLabel;
  private CharSequence mReleaseLabel;
  
  protected DefaultHeaderTransformer()
  {
    int i = getMinimumApiLevel();
    if (Build.VERSION.SDK_INT < i) {
      throw new IllegalStateException("This HeaderTransformer is designed to run on SDK " + i + "+. If using ActionBarSherlock or ActionBarCompat you should use the appropriate provided extra.");
    }
  }
  
  private void applyProgressBarSettings()
  {
    if (this.mHeaderProgressBar != null)
    {
      this.mHeaderProgressBar.setProgressBarColor(this.mProgressDrawableColor);
      this.mHeaderProgressBar.setProgressBarCornerRadius(this.mProgressCornerRadius);
    }
  }
  
  private void applyProgressBarStyle()
  {
    RelativeLayout.LayoutParams localLayoutParams = new RelativeLayout.LayoutParams(-1, this.mProgressBarHeight);
    switch (this.mProgressBarStyle)
    {
    }
    for (;;)
    {
      this.mHeaderProgressBar.setLayoutParams(localLayoutParams);
      return;
      localLayoutParams.addRule(8, R.id.ptr_content);
      continue;
      localLayoutParams.addRule(3, R.id.ptr_content);
    }
  }
  
  protected static TypedArray obtainStyledAttrsFromThemeAttr(Context paramContext, int paramInt, int[] paramArrayOfInt)
  {
    TypedValue localTypedValue = new TypedValue();
    paramContext.getTheme().resolveAttribute(paramInt, localTypedValue, true);
    return paramContext.obtainStyledAttributes(localTypedValue.resourceId, paramArrayOfInt);
  }
  
  private void setupViewsFromStyles(Activity paramActivity, View paramView)
  {
    TypedArray localTypedArray = obtainStyledAttrsFromThemeAttr(paramActivity, R.attr.ptrHeaderStyle, R.styleable.PullToRefreshHeader);
    int i;
    if (this.mContentLayout != null)
    {
      i = localTypedArray.getDimensionPixelSize(R.styleable.PullToRefreshHeader_ptrHeaderHeight, getActionBarSize(paramActivity));
      this.mContentLayout.getLayoutParams().height = i;
      this.mContentLayout.requestLayout();
    }
    if (localTypedArray.hasValue(R.styleable.PullToRefreshHeader_ptrHeaderBackground)) {}
    for (paramActivity = localTypedArray.getDrawable(R.styleable.PullToRefreshHeader_ptrHeaderBackground);; paramActivity = getActionBarBackground(paramActivity))
    {
      if (paramActivity != null)
      {
        this.mHeaderTextView.setBackgroundDrawable(paramActivity);
        if ((this.mContentLayout != null) && (paramActivity.getOpacity() == -1)) {
          this.mContentLayout.setBackgroundResource(0);
        }
      }
      paramActivity = paramView.getContext();
      i = localTypedArray.getResourceId(R.styleable.PullToRefreshHeader_ptrHeaderTitleTextAppearance, getActionBarTitleStyle(paramActivity));
      if (i != 0) {
        this.mHeaderTextView.setTextAppearance(paramActivity, i);
      }
      if (localTypedArray.hasValue(R.styleable.PullToRefreshHeader_ptrProgressBarColor)) {
        this.mProgressDrawableColor = localTypedArray.getColor(R.styleable.PullToRefreshHeader_ptrProgressBarColor, this.mProgressDrawableColor);
      }
      if (localTypedArray.hasValue(R.styleable.PullToRefreshHeader_ptrProgressBarCornerRadius)) {
        this.mProgressCornerRadius = localTypedArray.getDimensionPixelSize(R.styleable.PullToRefreshHeader_ptrProgressBarCornerRadius, 0);
      }
      this.mProgressBarStyle = localTypedArray.getInt(R.styleable.PullToRefreshHeader_ptrProgressBarStyle, 1);
      if (localTypedArray.hasValue(R.styleable.PullToRefreshHeader_ptrProgressBarHeight)) {
        this.mProgressBarHeight = localTypedArray.getDimensionPixelSize(R.styleable.PullToRefreshHeader_ptrProgressBarHeight, this.mProgressBarHeight);
      }
      if (localTypedArray.hasValue(R.styleable.PullToRefreshHeader_ptrPullText)) {
        this.mPullRefreshLabel = localTypedArray.getString(R.styleable.PullToRefreshHeader_ptrPullText);
      }
      if (localTypedArray.hasValue(R.styleable.PullToRefreshHeader_ptrRefreshingText)) {
        this.mRefreshingLabel = localTypedArray.getString(R.styleable.PullToRefreshHeader_ptrRefreshingText);
      }
      if (localTypedArray.hasValue(R.styleable.PullToRefreshHeader_ptrReleaseText)) {
        this.mReleaseLabel = localTypedArray.getString(R.styleable.PullToRefreshHeader_ptrReleaseText);
      }
      localTypedArray.recycle();
      return;
    }
  }
  
  protected Drawable getActionBarBackground(Context paramContext)
  {
    paramContext = obtainStyledAttrsFromThemeAttr(paramContext, 16843470, new int[] { 16842964 });
    try
    {
      Drawable localDrawable = paramContext.getDrawable(0);
      return localDrawable;
    }
    finally
    {
      paramContext.recycle();
    }
  }
  
  protected int getActionBarSize(Context paramContext)
  {
    TypedArray localTypedArray = paramContext.getTheme().obtainStyledAttributes(new int[] { 16843499 });
    try
    {
      int i = localTypedArray.getDimensionPixelSize(0, 0);
      return i;
    }
    finally
    {
      localTypedArray.recycle();
    }
  }
  
  protected int getActionBarTitleStyle(Context paramContext)
  {
    TypedArray localTypedArray = obtainStyledAttrsFromThemeAttr(paramContext, 16843470, new int[] { 16843512 });
    try
    {
      int i = localTypedArray.getResourceId(0, 0);
      return i;
    }
    finally
    {
      localTypedArray.recycle();
    }
  }
  
  public View getHeaderView()
  {
    return this.mHeaderView;
  }
  
  protected int getMinimumApiLevel()
  {
    return 14;
  }
  
  public boolean hideHeaderView()
  {
    boolean bool;
    Object localObject;
    if (this.mHeaderView.getVisibility() != 8)
    {
      bool = true;
      if (bool)
      {
        if (this.mContentLayout.getAlpha() < 0.5F) {
          break label145;
        }
        localObject = new AnimatorSet();
        ObjectAnimator localObjectAnimator1 = ObjectAnimator.ofFloat(this.mContentLayout, "translationY", new float[] { 0.0F, -this.mContentLayout.getHeight() });
        ObjectAnimator localObjectAnimator2 = ObjectAnimator.ofFloat(this.mHeaderView, "alpha", new float[] { 1.0F, 0.0F });
        ((AnimatorSet)localObject).playTogether(new Animator[] { localObjectAnimator1, localObjectAnimator2 });
      }
    }
    for (;;)
    {
      ((Animator)localObject).setDuration(this.mAnimationDuration);
      ((Animator)localObject).addListener(new HideAnimationCallback());
      ((Animator)localObject).start();
      return bool;
      bool = false;
      break;
      label145:
      localObject = ObjectAnimator.ofFloat(this.mHeaderView, "alpha", new float[] { 1.0F, 0.0F });
    }
  }
  
  public void onConfigurationChanged(Activity paramActivity, Configuration paramConfiguration)
  {
    setupViewsFromStyles(paramActivity, getHeaderView());
  }
  
  public void onPulled(float paramFloat)
  {
    if (this.mHeaderProgressBar != null)
    {
      this.mHeaderProgressBar.setVisibility(0);
      paramFloat = this.mInterpolator.getInterpolation(paramFloat);
      this.mHeaderProgressBar.setProgress(Math.round(this.mHeaderProgressBar.getMax() * paramFloat));
    }
  }
  
  public void onRefreshMinimized()
  {
    if (this.mContentLayout != null) {
      ObjectAnimator.ofFloat(this.mContentLayout, "alpha", new float[] { 1.0F, 0.0F }).start();
    }
  }
  
  public void onRefreshStarted()
  {
    if (this.mHeaderTextView != null) {
      this.mHeaderTextView.setText(this.mRefreshingLabel);
    }
    if (this.mHeaderProgressBar != null)
    {
      this.mHeaderProgressBar.setVisibility(0);
      this.mHeaderProgressBar.setIndeterminate(true);
    }
  }
  
  public void onReleaseToRefresh()
  {
    if (this.mHeaderTextView != null) {
      this.mHeaderTextView.setText(this.mReleaseLabel);
    }
    if (this.mHeaderProgressBar != null) {
      this.mHeaderProgressBar.setProgress(this.mHeaderProgressBar.getMax());
    }
  }
  
  public void onReset()
  {
    if (this.mHeaderProgressBar != null)
    {
      this.mHeaderProgressBar.setVisibility(8);
      this.mHeaderProgressBar.setProgress(0);
      this.mHeaderProgressBar.setIndeterminate(false);
    }
    if (this.mHeaderTextView != null)
    {
      this.mHeaderTextView.setVisibility(0);
      this.mHeaderTextView.setText(this.mPullRefreshLabel);
    }
    if (this.mContentLayout != null)
    {
      this.mContentLayout.setVisibility(0);
      Compat.setAlpha(this.mContentLayout, 1.0F);
    }
  }
  
  public void onViewCreated(Activity paramActivity, View paramView)
  {
    this.mHeaderView = paramView;
    this.mHeaderProgressBar = ((PullToRefreshProgressBar)paramView.findViewById(R.id.ptr_progress));
    this.mHeaderTextView = ((TextView)paramView.findViewById(R.id.ptr_text));
    this.mContentLayout = ((ViewGroup)paramView.findViewById(R.id.ptr_content));
    this.mPullRefreshLabel = paramActivity.getString(R.string.pull_to_refresh_pull_label);
    this.mRefreshingLabel = paramActivity.getString(R.string.pull_to_refresh_refreshing_label);
    this.mReleaseLabel = paramActivity.getString(R.string.pull_to_refresh_release_label);
    this.mAnimationDuration = paramActivity.getResources().getInteger(17694720);
    this.mProgressDrawableColor = paramActivity.getResources().getColor(R.color.default_progress_bar_color);
    this.mProgressCornerRadius = paramActivity.getResources().getDimensionPixelSize(R.dimen.default_corner_radius);
    setupViewsFromStyles(paramActivity, paramView);
    applyProgressBarStyle();
    applyProgressBarSettings();
    onReset();
  }
  
  public void setProgressBarColor(int paramInt)
  {
    this.mProgressDrawableColor = paramInt;
    applyProgressBarSettings();
  }
  
  public void setProgressBarCornerRadius(float paramFloat)
  {
    this.mProgressCornerRadius = Math.max(paramFloat, 0.0F);
    applyProgressBarSettings();
  }
  
  public void setProgressBarHeight(int paramInt)
  {
    if (this.mProgressBarHeight != paramInt)
    {
      this.mProgressBarHeight = paramInt;
      applyProgressBarStyle();
    }
  }
  
  public void setProgressBarStyle(int paramInt)
  {
    if (this.mProgressBarStyle != paramInt)
    {
      this.mProgressBarStyle = paramInt;
      applyProgressBarStyle();
    }
  }
  
  public void setPullText(CharSequence paramCharSequence)
  {
    this.mPullRefreshLabel = paramCharSequence;
    if (this.mHeaderTextView != null) {
      this.mHeaderTextView.setText(this.mPullRefreshLabel);
    }
  }
  
  public void setRefreshingText(CharSequence paramCharSequence)
  {
    this.mRefreshingLabel = paramCharSequence;
  }
  
  public void setReleaseText(CharSequence paramCharSequence)
  {
    this.mReleaseLabel = paramCharSequence;
  }
  
  public boolean showHeaderView()
  {
    if (this.mHeaderView.getVisibility() != 0) {}
    for (boolean bool = true;; bool = false)
    {
      if (bool)
      {
        this.mHeaderView.setVisibility(0);
        AnimatorSet localAnimatorSet = new AnimatorSet();
        localAnimatorSet.playTogether(new Animator[] { ObjectAnimator.ofFloat(this.mContentLayout, "translationY", new float[] { -this.mContentLayout.getHeight(), 0.0F }), ObjectAnimator.ofFloat(this.mHeaderView, "alpha", new float[] { 0.0F, 1.0F }) });
        localAnimatorSet.setDuration(this.mAnimationDuration);
        localAnimatorSet.start();
      }
      return bool;
    }
  }
  
  class HideAnimationCallback
    extends AnimatorListenerAdapter
  {
    HideAnimationCallback() {}
    
    public void onAnimationEnd(Animator paramAnimator)
    {
      paramAnimator = DefaultHeaderTransformer.this.getHeaderView();
      if (paramAnimator != null) {
        paramAnimator.setVisibility(8);
      }
      DefaultHeaderTransformer.this.onReset();
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/uk/co/senab/actionbarpulltorefresh/library/DefaultHeaderTransformer.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */