package android.support.v7.internal.widget;

import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.drawable.Drawable;
import android.support.v7.appcompat.R.attr;
import android.support.v7.appcompat.R.id;
import android.support.v7.appcompat.R.layout;
import android.support.v7.appcompat.R.styleable;
import android.support.v7.internal.view.menu.ActionMenuPresenter;
import android.support.v7.internal.view.menu.ActionMenuView;
import android.support.v7.internal.view.menu.MenuBuilder;
import android.support.v7.view.ActionMode;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.util.DisplayMetrics;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.MeasureSpec;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.view.ViewGroup.MarginLayoutParams;
import android.widget.LinearLayout;
import android.widget.TextView;

public class ActionBarContextView
  extends AbsActionBarView
{
  private static final String TAG = "ActionBarContextView";
  private View mClose;
  private View mCustomView;
  private Drawable mSplitBackground;
  private CharSequence mSubtitle;
  private int mSubtitleStyleRes;
  private TextView mSubtitleView;
  private CharSequence mTitle;
  private LinearLayout mTitleLayout;
  private boolean mTitleOptional;
  private int mTitleStyleRes;
  private TextView mTitleView;
  
  public ActionBarContextView(Context paramContext)
  {
    this(paramContext, null);
  }
  
  public ActionBarContextView(Context paramContext, AttributeSet paramAttributeSet)
  {
    this(paramContext, paramAttributeSet, R.attr.actionModeStyle);
  }
  
  public ActionBarContextView(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    paramContext = paramContext.obtainStyledAttributes(paramAttributeSet, R.styleable.ActionMode, paramInt, 0);
    setBackgroundDrawable(paramContext.getDrawable(3));
    this.mTitleStyleRes = paramContext.getResourceId(1, 0);
    this.mSubtitleStyleRes = paramContext.getResourceId(2, 0);
    this.mContentHeight = paramContext.getLayoutDimension(0, 0);
    this.mSplitBackground = paramContext.getDrawable(4);
    paramContext.recycle();
  }
  
  private void initTitle()
  {
    int i = 8;
    if (this.mTitleLayout == null)
    {
      LayoutInflater.from(getContext()).inflate(R.layout.abc_action_bar_title_item, this);
      this.mTitleLayout = ((LinearLayout)getChildAt(getChildCount() - 1));
      this.mTitleView = ((TextView)this.mTitleLayout.findViewById(R.id.action_bar_title));
      this.mSubtitleView = ((TextView)this.mTitleLayout.findViewById(R.id.action_bar_subtitle));
      if (this.mTitleStyleRes != 0) {
        this.mTitleView.setTextAppearance(getContext(), this.mTitleStyleRes);
      }
      if (this.mSubtitleStyleRes != 0) {
        this.mSubtitleView.setTextAppearance(getContext(), this.mSubtitleStyleRes);
      }
    }
    this.mTitleView.setText(this.mTitle);
    this.mSubtitleView.setText(this.mSubtitle);
    int j;
    int k;
    label166:
    Object localObject;
    if (!TextUtils.isEmpty(this.mTitle))
    {
      j = 1;
      if (TextUtils.isEmpty(this.mSubtitle)) {
        break label234;
      }
      k = 1;
      localObject = this.mSubtitleView;
      if (k == 0) {
        break label239;
      }
    }
    label234:
    label239:
    for (int m = 0;; m = 8)
    {
      ((TextView)localObject).setVisibility(m);
      localObject = this.mTitleLayout;
      if (j == 0)
      {
        j = i;
        if (k == 0) {}
      }
      else
      {
        j = 0;
      }
      ((LinearLayout)localObject).setVisibility(j);
      if (this.mTitleLayout.getParent() == null) {
        addView(this.mTitleLayout);
      }
      return;
      j = 0;
      break;
      k = 0;
      break label166;
    }
  }
  
  public void closeMode()
  {
    if (this.mClose == null) {
      killMode();
    }
  }
  
  protected ViewGroup.LayoutParams generateDefaultLayoutParams()
  {
    return new ViewGroup.MarginLayoutParams(-1, -2);
  }
  
  public ViewGroup.LayoutParams generateLayoutParams(AttributeSet paramAttributeSet)
  {
    return new ViewGroup.MarginLayoutParams(getContext(), paramAttributeSet);
  }
  
  public CharSequence getSubtitle()
  {
    return this.mSubtitle;
  }
  
  public CharSequence getTitle()
  {
    return this.mTitle;
  }
  
  public boolean hideOverflowMenu()
  {
    if (this.mActionMenuPresenter != null) {}
    for (boolean bool = this.mActionMenuPresenter.hideOverflowMenu();; bool = false) {
      return bool;
    }
  }
  
  public void initForMode(final ActionMode paramActionMode)
  {
    if (this.mClose == null)
    {
      this.mClose = LayoutInflater.from(getContext()).inflate(R.layout.abc_action_mode_close_item, this, false);
      addView(this.mClose);
    }
    label273:
    for (;;)
    {
      this.mClose.findViewById(R.id.action_mode_close_button).setOnClickListener(new View.OnClickListener()
      {
        public void onClick(View paramAnonymousView)
        {
          paramActionMode.finish();
        }
      });
      MenuBuilder localMenuBuilder = (MenuBuilder)paramActionMode.getMenu();
      if (this.mActionMenuPresenter != null) {
        this.mActionMenuPresenter.dismissPopupMenus();
      }
      this.mActionMenuPresenter = new ActionMenuPresenter(getContext());
      this.mActionMenuPresenter.setReserveOverflow(true);
      paramActionMode = new ViewGroup.LayoutParams(-2, -1);
      if (!this.mSplitActionBar)
      {
        localMenuBuilder.addMenuPresenter(this.mActionMenuPresenter);
        this.mMenuView = ((ActionMenuView)this.mActionMenuPresenter.getMenuView(this));
        this.mMenuView.setBackgroundDrawable(null);
        addView(this.mMenuView, paramActionMode);
      }
      for (;;)
      {
        return;
        if (this.mClose.getParent() != null) {
          break label273;
        }
        addView(this.mClose);
        break;
        this.mActionMenuPresenter.setWidthLimit(getContext().getResources().getDisplayMetrics().widthPixels, true);
        this.mActionMenuPresenter.setItemLimit(Integer.MAX_VALUE);
        paramActionMode.width = -1;
        paramActionMode.height = this.mContentHeight;
        localMenuBuilder.addMenuPresenter(this.mActionMenuPresenter);
        this.mMenuView = ((ActionMenuView)this.mActionMenuPresenter.getMenuView(this));
        this.mMenuView.setBackgroundDrawable(this.mSplitBackground);
        this.mSplitView.addView(this.mMenuView, paramActionMode);
      }
    }
  }
  
  public boolean isOverflowMenuShowing()
  {
    if (this.mActionMenuPresenter != null) {}
    for (boolean bool = this.mActionMenuPresenter.isOverflowMenuShowing();; bool = false) {
      return bool;
    }
  }
  
  public boolean isTitleOptional()
  {
    return this.mTitleOptional;
  }
  
  public void killMode()
  {
    removeAllViews();
    if (this.mSplitView != null) {
      this.mSplitView.removeView(this.mMenuView);
    }
    this.mCustomView = null;
    this.mMenuView = null;
  }
  
  public void onDetachedFromWindow()
  {
    super.onDetachedFromWindow();
    if (this.mActionMenuPresenter != null)
    {
      this.mActionMenuPresenter.hideOverflowMenu();
      this.mActionMenuPresenter.hideSubMenus();
    }
  }
  
  protected void onLayout(boolean paramBoolean, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    int i = getPaddingLeft();
    int j = getPaddingTop();
    int k = paramInt4 - paramInt2 - getPaddingTop() - getPaddingBottom();
    paramInt2 = i;
    if (this.mClose != null)
    {
      paramInt2 = i;
      if (this.mClose.getVisibility() != 8)
      {
        ViewGroup.MarginLayoutParams localMarginLayoutParams = (ViewGroup.MarginLayoutParams)this.mClose.getLayoutParams();
        paramInt2 = i + localMarginLayoutParams.leftMargin;
        paramInt2 = paramInt2 + positionChild(this.mClose, paramInt2, j, k) + localMarginLayoutParams.rightMargin;
      }
    }
    paramInt4 = paramInt2;
    if (this.mTitleLayout != null)
    {
      paramInt4 = paramInt2;
      if (this.mCustomView == null)
      {
        paramInt4 = paramInt2;
        if (this.mTitleLayout.getVisibility() != 8) {
          paramInt4 = paramInt2 + positionChild(this.mTitleLayout, paramInt2, j, k);
        }
      }
    }
    if (this.mCustomView != null) {
      positionChild(this.mCustomView, paramInt4, j, k);
    }
    paramInt1 = paramInt3 - paramInt1 - getPaddingRight();
    if (this.mMenuView != null) {
      positionChildInverse(this.mMenuView, paramInt1, j, k);
    }
  }
  
  protected void onMeasure(int paramInt1, int paramInt2)
  {
    if (View.MeasureSpec.getMode(paramInt1) != 1073741824) {
      throw new IllegalStateException(getClass().getSimpleName() + " can only be used " + "with android:layout_width=\"FILL_PARENT\" (or fill_parent)");
    }
    if (View.MeasureSpec.getMode(paramInt2) == 0) {
      throw new IllegalStateException(getClass().getSimpleName() + " can only be used " + "with android:layout_height=\"wrap_content\"");
    }
    int i = View.MeasureSpec.getSize(paramInt1);
    int j;
    int k;
    int m;
    int n;
    if (this.mContentHeight > 0)
    {
      j = this.mContentHeight;
      k = getPaddingTop() + getPaddingBottom();
      paramInt1 = i - getPaddingLeft() - getPaddingRight();
      m = j - k;
      n = View.MeasureSpec.makeMeasureSpec(m, Integer.MIN_VALUE);
      paramInt2 = paramInt1;
      Object localObject;
      if (this.mClose != null)
      {
        paramInt1 = measureChildView(this.mClose, paramInt1, n, 0);
        localObject = (ViewGroup.MarginLayoutParams)this.mClose.getLayoutParams();
        paramInt2 = paramInt1 - (((ViewGroup.MarginLayoutParams)localObject).leftMargin + ((ViewGroup.MarginLayoutParams)localObject).rightMargin);
      }
      paramInt1 = paramInt2;
      if (this.mMenuView != null)
      {
        paramInt1 = paramInt2;
        if (this.mMenuView.getParent() == this) {
          paramInt1 = measureChildView(this.mMenuView, paramInt2, n, 0);
        }
      }
      paramInt2 = paramInt1;
      if (this.mTitleLayout != null)
      {
        paramInt2 = paramInt1;
        if (this.mCustomView == null)
        {
          if (!this.mTitleOptional) {
            break label509;
          }
          paramInt2 = View.MeasureSpec.makeMeasureSpec(0, 0);
          this.mTitleLayout.measure(paramInt2, n);
          int i1 = this.mTitleLayout.getMeasuredWidth();
          if (i1 > paramInt1) {
            break label497;
          }
          n = 1;
          label297:
          paramInt2 = paramInt1;
          if (n != 0) {
            paramInt2 = paramInt1 - i1;
          }
          localObject = this.mTitleLayout;
          if (n == 0) {
            break label503;
          }
          paramInt1 = 0;
          label322:
          ((LinearLayout)localObject).setVisibility(paramInt1);
        }
      }
      label328:
      if (this.mCustomView != null)
      {
        localObject = this.mCustomView.getLayoutParams();
        if (((ViewGroup.LayoutParams)localObject).width == -2) {
          break label525;
        }
        paramInt1 = 1073741824;
        label358:
        if (((ViewGroup.LayoutParams)localObject).width < 0) {
          break label532;
        }
        paramInt2 = Math.min(((ViewGroup.LayoutParams)localObject).width, paramInt2);
        label376:
        if (((ViewGroup.LayoutParams)localObject).height == -2) {
          break label535;
        }
        n = 1073741824;
        label391:
        if (((ViewGroup.LayoutParams)localObject).height < 0) {
          break label543;
        }
        m = Math.min(((ViewGroup.LayoutParams)localObject).height, m);
      }
    }
    label497:
    label503:
    label509:
    label525:
    label532:
    label535:
    label543:
    for (;;)
    {
      this.mCustomView.measure(View.MeasureSpec.makeMeasureSpec(paramInt2, paramInt1), View.MeasureSpec.makeMeasureSpec(m, n));
      if (this.mContentHeight > 0) {
        break label553;
      }
      paramInt1 = 0;
      m = getChildCount();
      j = 0;
      while (j < m)
      {
        n = getChildAt(j).getMeasuredHeight() + k;
        paramInt2 = paramInt1;
        if (n > paramInt1) {
          paramInt2 = n;
        }
        j++;
        paramInt1 = paramInt2;
      }
      j = View.MeasureSpec.getSize(paramInt2);
      break;
      n = 0;
      break label297;
      paramInt1 = 8;
      break label322;
      paramInt2 = measureChildView(this.mTitleLayout, paramInt1, n, 0);
      break label328;
      paramInt1 = Integer.MIN_VALUE;
      break label358;
      break label376;
      n = Integer.MIN_VALUE;
      break label391;
    }
    setMeasuredDimension(i, paramInt1);
    for (;;)
    {
      return;
      label553:
      setMeasuredDimension(i, j);
    }
  }
  
  public void setContentHeight(int paramInt)
  {
    this.mContentHeight = paramInt;
  }
  
  public void setCustomView(View paramView)
  {
    if (this.mCustomView != null) {
      removeView(this.mCustomView);
    }
    this.mCustomView = paramView;
    if (this.mTitleLayout != null)
    {
      removeView(this.mTitleLayout);
      this.mTitleLayout = null;
    }
    if (paramView != null) {
      addView(paramView);
    }
    requestLayout();
  }
  
  public void setSplitActionBar(boolean paramBoolean)
  {
    ViewGroup.LayoutParams localLayoutParams;
    ViewGroup localViewGroup;
    if (this.mSplitActionBar != paramBoolean) {
      if (this.mActionMenuPresenter != null)
      {
        localLayoutParams = new ViewGroup.LayoutParams(-2, -1);
        if (paramBoolean) {
          break label91;
        }
        this.mMenuView = ((ActionMenuView)this.mActionMenuPresenter.getMenuView(this));
        this.mMenuView.setBackgroundDrawable(null);
        localViewGroup = (ViewGroup)this.mMenuView.getParent();
        if (localViewGroup != null) {
          localViewGroup.removeView(this.mMenuView);
        }
        addView(this.mMenuView, localLayoutParams);
      }
    }
    for (;;)
    {
      super.setSplitActionBar(paramBoolean);
      return;
      label91:
      this.mActionMenuPresenter.setWidthLimit(getContext().getResources().getDisplayMetrics().widthPixels, true);
      this.mActionMenuPresenter.setItemLimit(Integer.MAX_VALUE);
      localLayoutParams.width = -1;
      localLayoutParams.height = this.mContentHeight;
      this.mMenuView = ((ActionMenuView)this.mActionMenuPresenter.getMenuView(this));
      this.mMenuView.setBackgroundDrawable(this.mSplitBackground);
      localViewGroup = (ViewGroup)this.mMenuView.getParent();
      if (localViewGroup != null) {
        localViewGroup.removeView(this.mMenuView);
      }
      this.mSplitView.addView(this.mMenuView, localLayoutParams);
    }
  }
  
  public void setSubtitle(CharSequence paramCharSequence)
  {
    this.mSubtitle = paramCharSequence;
    initTitle();
  }
  
  public void setTitle(CharSequence paramCharSequence)
  {
    this.mTitle = paramCharSequence;
    initTitle();
  }
  
  public void setTitleOptional(boolean paramBoolean)
  {
    if (paramBoolean != this.mTitleOptional) {
      requestLayout();
    }
    this.mTitleOptional = paramBoolean;
  }
  
  public boolean showOverflowMenu()
  {
    if (this.mActionMenuPresenter != null) {}
    for (boolean bool = this.mActionMenuPresenter.showOverflowMenu();; bool = false) {
      return bool;
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/android/support/v7/internal/widget/ActionBarContextView.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */