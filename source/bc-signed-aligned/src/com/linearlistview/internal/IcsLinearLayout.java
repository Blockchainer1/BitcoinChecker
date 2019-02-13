package com.linearlistview.internal;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.os.Build.VERSION;
import android.util.AttributeSet;
import android.view.View;
import android.view.View.MeasureSpec;
import android.widget.LinearLayout;
import android.widget.LinearLayout.LayoutParams;

public class IcsLinearLayout
  extends LinearLayout
{
  private static final boolean IS_HONEYCOMB;
  private static final int LinearLayout_divider = 0;
  private static final int LinearLayout_dividerPadding = 3;
  private static final int LinearLayout_measureWithLargestChild = 1;
  private static final int LinearLayout_showDividers = 2;
  private static final int[] R_styleable_LinearLayout = { 16843049, 16843476, 16843561, 16843562 };
  public static final int SHOW_DIVIDER_BEGINNING = 1;
  public static final int SHOW_DIVIDER_END = 4;
  public static final int SHOW_DIVIDER_MIDDLE = 2;
  public static final int SHOW_DIVIDER_NONE = 0;
  private boolean mClipDivider;
  private Drawable mDivider;
  protected int mDividerHeight;
  private int mDividerPadding;
  protected int mDividerWidth;
  private int mShowDividers;
  private boolean mUseLargestChild;
  
  static
  {
    if (Build.VERSION.SDK_INT >= 11) {}
    for (boolean bool = true;; bool = false)
    {
      IS_HONEYCOMB = bool;
      return;
    }
  }
  
  public IcsLinearLayout(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    paramContext = paramContext.obtainStyledAttributes(paramAttributeSet, R_styleable_LinearLayout);
    setDividerDrawable(paramContext.getDrawable(0));
    this.mShowDividers = paramContext.getInt(2, 0);
    this.mDividerPadding = paramContext.getDimensionPixelSize(3, 0);
    this.mUseLargestChild = paramContext.getBoolean(1, false);
    paramContext.recycle();
  }
  
  private void useLargestChildHorizontal()
  {
    int i = getChildCount();
    int j = 0;
    for (int k = 0; k < i; k++) {
      j = Math.max(getChildAt(k).getMeasuredWidth(), j);
    }
    int m = 0;
    k = 0;
    while (k < i)
    {
      View localView = getChildAt(k);
      int n = m;
      if (localView != null)
      {
        if (localView.getVisibility() == 8) {
          n = m;
        }
      }
      else
      {
        k++;
        m = n;
        continue;
      }
      LinearLayout.LayoutParams localLayoutParams = (LinearLayout.LayoutParams)localView.getLayoutParams();
      if (localLayoutParams.weight > 0.0F)
      {
        localView.measure(View.MeasureSpec.makeMeasureSpec(j, 1073741824), View.MeasureSpec.makeMeasureSpec(localView.getMeasuredHeight(), 1073741824));
        m += j;
      }
      for (;;)
      {
        n = m + (localLayoutParams.leftMargin + localLayoutParams.rightMargin);
        break;
        m += localView.getMeasuredWidth();
      }
    }
    setMeasuredDimension(m + (getPaddingLeft() + getPaddingRight()), getMeasuredHeight());
  }
  
  private void useLargestChildVertical()
  {
    int i = getChildCount();
    int j = 0;
    for (int k = 0; k < i; k++) {
      j = Math.max(getChildAt(k).getMeasuredHeight(), j);
    }
    int m = 0;
    k = 0;
    while (k < i)
    {
      View localView = getChildAt(k);
      int n = m;
      if (localView != null)
      {
        if (localView.getVisibility() == 8) {
          n = m;
        }
      }
      else
      {
        k++;
        m = n;
        continue;
      }
      LinearLayout.LayoutParams localLayoutParams = (LinearLayout.LayoutParams)localView.getLayoutParams();
      if (localLayoutParams.weight > 0.0F)
      {
        localView.measure(View.MeasureSpec.makeMeasureSpec(localView.getMeasuredWidth(), 1073741824), View.MeasureSpec.makeMeasureSpec(j, 1073741824));
        m += j;
      }
      for (;;)
      {
        n = m + (localLayoutParams.leftMargin + localLayoutParams.rightMargin);
        break;
        m += localView.getMeasuredHeight();
      }
    }
    j = getPaddingLeft();
    k = getPaddingRight();
    setMeasuredDimension(getMeasuredWidth(), m + (j + k));
  }
  
  void drawDividersHorizontal(Canvas paramCanvas)
  {
    int i = getChildCount();
    Object localObject;
    for (int j = 0; j < i; j++)
    {
      View localView = getChildAt(j);
      if ((localView != null) && (localView.getVisibility() != 8) && (hasDividerBeforeChildAt(j)))
      {
        localObject = (LinearLayout.LayoutParams)localView.getLayoutParams();
        drawVerticalDivider(paramCanvas, localView.getLeft() - ((LinearLayout.LayoutParams)localObject).leftMargin);
      }
    }
    if (hasDividerBeforeChildAt(i))
    {
      localObject = getChildAt(i - 1);
      if (localObject != null) {
        break label118;
      }
    }
    label118:
    for (j = getWidth() - getPaddingRight() - this.mDividerWidth;; j = ((View)localObject).getRight())
    {
      drawVerticalDivider(paramCanvas, j);
      return;
    }
  }
  
  void drawDividersVertical(Canvas paramCanvas)
  {
    int i = getChildCount();
    View localView;
    for (int j = 0; j < i; j++)
    {
      localView = getChildAt(j);
      if ((localView != null) && (localView.getVisibility() != 8) && (hasDividerBeforeChildAt(j)))
      {
        LinearLayout.LayoutParams localLayoutParams = (LinearLayout.LayoutParams)localView.getLayoutParams();
        drawHorizontalDivider(paramCanvas, localView.getTop() - localLayoutParams.topMargin);
      }
    }
    if (hasDividerBeforeChildAt(i))
    {
      localView = getChildAt(i - 1);
      if (localView != null) {
        break label118;
      }
    }
    label118:
    for (j = getHeight() - getPaddingBottom() - this.mDividerHeight;; j = localView.getBottom())
    {
      drawHorizontalDivider(paramCanvas, j);
      return;
    }
  }
  
  void drawHorizontalDivider(Canvas paramCanvas, int paramInt)
  {
    if ((this.mClipDivider) && (!IS_HONEYCOMB))
    {
      paramCanvas.save();
      paramCanvas.clipRect(getPaddingLeft() + this.mDividerPadding, paramInt, getWidth() - getPaddingRight() - this.mDividerPadding, this.mDividerHeight + paramInt);
      this.mDivider.draw(paramCanvas);
      paramCanvas.restore();
    }
    for (;;)
    {
      return;
      this.mDivider.setBounds(getPaddingLeft() + this.mDividerPadding, paramInt, getWidth() - getPaddingRight() - this.mDividerPadding, this.mDividerHeight + paramInt);
      this.mDivider.draw(paramCanvas);
    }
  }
  
  void drawVerticalDivider(Canvas paramCanvas, int paramInt)
  {
    if ((this.mClipDivider) && (!IS_HONEYCOMB))
    {
      paramCanvas.save();
      paramCanvas.clipRect(paramInt, getPaddingTop() + this.mDividerPadding, this.mDividerWidth + paramInt, getHeight() - getPaddingBottom() - this.mDividerPadding);
      this.mDivider.draw(paramCanvas);
      paramCanvas.restore();
    }
    for (;;)
    {
      return;
      this.mDivider.setBounds(paramInt, getPaddingTop() + this.mDividerPadding, this.mDividerWidth + paramInt, getHeight() - getPaddingBottom() - this.mDividerPadding);
      this.mDivider.draw(paramCanvas);
    }
  }
  
  public int getDividerPadding()
  {
    return this.mDividerPadding;
  }
  
  public int getDividerWidth()
  {
    return this.mDividerWidth;
  }
  
  public int getShowDividers()
  {
    return this.mShowDividers;
  }
  
  protected boolean hasDividerBeforeChildAt(int paramInt)
  {
    boolean bool1 = true;
    if (paramInt == 0) {
      if ((this.mShowDividers & 0x1) == 0) {}
    }
    for (;;)
    {
      return bool1;
      bool1 = false;
      continue;
      if (paramInt == getChildCount())
      {
        if ((this.mShowDividers & 0x4) == 0) {
          bool1 = false;
        }
      }
      else
      {
        if ((this.mShowDividers & 0x2) != 0)
        {
          boolean bool2 = false;
          paramInt--;
          for (;;)
          {
            bool1 = bool2;
            if (paramInt >= 0)
            {
              if (getChildAt(paramInt).getVisibility() != 8) {
                bool1 = true;
              }
            }
            else {
              break;
            }
            paramInt--;
          }
        }
        bool1 = false;
      }
    }
  }
  
  public boolean isMeasureWithLargestChildEnabled()
  {
    return this.mUseLargestChild;
  }
  
  protected void measureChildWithMargins(View paramView, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    int i = indexOfChild(paramView);
    int j = getOrientation();
    LinearLayout.LayoutParams localLayoutParams = (LinearLayout.LayoutParams)paramView.getLayoutParams();
    if (hasDividerBeforeChildAt(i))
    {
      if (j == 1) {
        localLayoutParams.topMargin = this.mDividerHeight;
      }
    }
    else
    {
      int k = getChildCount();
      if ((i == k - 1) && (hasDividerBeforeChildAt(k)))
      {
        if (j != 1) {
          break label109;
        }
        localLayoutParams.bottomMargin = this.mDividerHeight;
      }
    }
    for (;;)
    {
      super.measureChildWithMargins(paramView, paramInt1, paramInt2, paramInt3, paramInt4);
      return;
      localLayoutParams.leftMargin = this.mDividerWidth;
      break;
      label109:
      localLayoutParams.rightMargin = this.mDividerWidth;
    }
  }
  
  protected void onDraw(Canvas paramCanvas)
  {
    if (this.mDivider != null)
    {
      if (getOrientation() != 1) {
        break label26;
      }
      drawDividersVertical(paramCanvas);
    }
    for (;;)
    {
      super.onDraw(paramCanvas);
      return;
      label26:
      drawDividersHorizontal(paramCanvas);
    }
  }
  
  protected void onMeasure(int paramInt1, int paramInt2)
  {
    super.onMeasure(paramInt1, paramInt2);
    if (this.mUseLargestChild) {
      switch (getOrientation())
      {
      }
    }
    for (;;)
    {
      return;
      useLargestChildHorizontal();
      continue;
      useLargestChildVertical();
    }
  }
  
  public void setDividerDrawable(Drawable paramDrawable)
  {
    boolean bool = false;
    if (paramDrawable == this.mDivider) {
      return;
    }
    this.mDivider = paramDrawable;
    this.mClipDivider = (paramDrawable instanceof ColorDrawable);
    if (paramDrawable != null) {
      this.mDividerWidth = paramDrawable.getIntrinsicWidth();
    }
    for (this.mDividerHeight = paramDrawable.getIntrinsicHeight();; this.mDividerHeight = 0)
    {
      if (paramDrawable == null) {
        bool = true;
      }
      setWillNotDraw(bool);
      requestLayout();
      break;
      this.mDividerWidth = 0;
    }
  }
  
  public void setDividerPadding(int paramInt)
  {
    this.mDividerPadding = paramInt;
  }
  
  public void setMeasureWithLargestChildEnabled(boolean paramBoolean)
  {
    this.mUseLargestChild = paramBoolean;
  }
  
  public void setShowDividers(int paramInt)
  {
    if (paramInt != this.mShowDividers)
    {
      requestLayout();
      invalidate();
    }
    this.mShowDividers = paramInt;
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/linearlistview/internal/IcsLinearLayout.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */