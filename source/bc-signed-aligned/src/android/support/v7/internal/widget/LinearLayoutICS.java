package android.support.v7.internal.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.drawable.Drawable;
import android.support.v7.appcompat.R.styleable;
import android.util.AttributeSet;
import android.view.View;
import android.widget.LinearLayout;
import android.widget.LinearLayout.LayoutParams;

public class LinearLayoutICS
  extends LinearLayout
{
  private static final int SHOW_DIVIDER_BEGINNING = 1;
  private static final int SHOW_DIVIDER_END = 4;
  private static final int SHOW_DIVIDER_MIDDLE = 2;
  private static final int SHOW_DIVIDER_NONE = 0;
  private final Drawable mDivider;
  private final int mDividerHeight;
  private final int mDividerPadding;
  private final int mDividerWidth;
  private final int mShowDividers;
  
  public LinearLayoutICS(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    paramContext = paramContext.obtainStyledAttributes(paramAttributeSet, R.styleable.LinearLayoutICS);
    this.mDivider = paramContext.getDrawable(0);
    if (this.mDivider != null)
    {
      this.mDividerWidth = this.mDivider.getIntrinsicWidth();
      this.mDividerHeight = this.mDivider.getIntrinsicHeight();
      this.mShowDividers = paramContext.getInt(1, 0);
      this.mDividerPadding = paramContext.getDimensionPixelSize(2, 0);
      paramContext.recycle();
      if (this.mDivider != null) {
        break label105;
      }
    }
    for (;;)
    {
      setWillNotDraw(bool);
      return;
      this.mDividerWidth = 0;
      this.mDividerHeight = 0;
      break;
      label105:
      bool = false;
    }
  }
  
  void drawSupportDividersHorizontal(Canvas paramCanvas)
  {
    int i = getChildCount();
    Object localObject;
    for (int j = 0; j < i; j++)
    {
      View localView = getChildAt(j);
      if ((localView != null) && (localView.getVisibility() != 8) && (hasSupportDividerBeforeChildAt(j)))
      {
        localObject = (LinearLayout.LayoutParams)localView.getLayoutParams();
        drawSupportVerticalDivider(paramCanvas, localView.getLeft() - ((LinearLayout.LayoutParams)localObject).leftMargin);
      }
    }
    if (hasSupportDividerBeforeChildAt(i))
    {
      localObject = getChildAt(i - 1);
      if (localObject != null) {
        break label118;
      }
    }
    label118:
    for (j = getWidth() - getPaddingRight() - this.mDividerWidth;; j = ((View)localObject).getRight())
    {
      drawSupportVerticalDivider(paramCanvas, j);
      return;
    }
  }
  
  void drawSupportDividersVertical(Canvas paramCanvas)
  {
    int i = getChildCount();
    Object localObject;
    for (int j = 0; j < i; j++)
    {
      View localView = getChildAt(j);
      if ((localView != null) && (localView.getVisibility() != 8) && (hasSupportDividerBeforeChildAt(j)))
      {
        localObject = (LinearLayout.LayoutParams)localView.getLayoutParams();
        drawSupportHorizontalDivider(paramCanvas, localView.getTop() - ((LinearLayout.LayoutParams)localObject).topMargin);
      }
    }
    if (hasSupportDividerBeforeChildAt(i))
    {
      localObject = getChildAt(i - 1);
      if (localObject != null) {
        break label118;
      }
    }
    label118:
    for (j = getHeight() - getPaddingBottom() - this.mDividerHeight;; j = ((View)localObject).getBottom())
    {
      drawSupportHorizontalDivider(paramCanvas, j);
      return;
    }
  }
  
  void drawSupportHorizontalDivider(Canvas paramCanvas, int paramInt)
  {
    this.mDivider.setBounds(getPaddingLeft() + this.mDividerPadding, paramInt, getWidth() - getPaddingRight() - this.mDividerPadding, this.mDividerHeight + paramInt);
    this.mDivider.draw(paramCanvas);
  }
  
  void drawSupportVerticalDivider(Canvas paramCanvas, int paramInt)
  {
    this.mDivider.setBounds(paramInt, getPaddingTop() + this.mDividerPadding, this.mDividerWidth + paramInt, getHeight() - getPaddingBottom() - this.mDividerPadding);
    this.mDivider.draw(paramCanvas);
  }
  
  public int getSupportDividerWidth()
  {
    return this.mDividerWidth;
  }
  
  protected boolean hasSupportDividerBeforeChildAt(int paramInt)
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
  
  protected void measureChildWithMargins(View paramView, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    int i;
    int j;
    LinearLayout.LayoutParams localLayoutParams;
    if (this.mDivider != null)
    {
      i = indexOfChild(paramView);
      j = getChildCount();
      localLayoutParams = (LinearLayout.LayoutParams)paramView.getLayoutParams();
      if (getOrientation() != 1) {
        break label97;
      }
      if (!hasSupportDividerBeforeChildAt(i)) {
        break label67;
      }
      localLayoutParams.topMargin = this.mDividerHeight;
    }
    for (;;)
    {
      super.measureChildWithMargins(paramView, paramInt1, paramInt2, paramInt3, paramInt4);
      return;
      label67:
      if ((i == j - 1) && (hasSupportDividerBeforeChildAt(j)))
      {
        localLayoutParams.bottomMargin = this.mDividerHeight;
        continue;
        label97:
        if (hasSupportDividerBeforeChildAt(i)) {
          localLayoutParams.leftMargin = this.mDividerWidth;
        } else if ((i == j - 1) && (hasSupportDividerBeforeChildAt(j))) {
          localLayoutParams.rightMargin = this.mDividerWidth;
        }
      }
    }
  }
  
  protected void onDraw(Canvas paramCanvas)
  {
    if (this.mDivider == null) {}
    for (;;)
    {
      return;
      if (getOrientation() == 1) {
        drawSupportDividersVertical(paramCanvas);
      } else {
        drawSupportDividersHorizontal(paramCanvas);
      }
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/android/support/v7/internal/widget/LinearLayoutICS.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */