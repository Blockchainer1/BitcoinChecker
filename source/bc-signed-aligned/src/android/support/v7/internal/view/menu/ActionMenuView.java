package android.support.v7.internal.view.menu;

import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.os.Build.VERSION;
import android.support.v7.appcompat.R.attr;
import android.support.v7.appcompat.R.styleable;
import android.support.v7.internal.widget.LinearLayoutICS;
import android.util.AttributeSet;
import android.util.DisplayMetrics;
import android.view.View;
import android.view.View.MeasureSpec;
import android.view.ViewDebug.ExportedProperty;
import android.view.ViewGroup.LayoutParams;
import android.view.accessibility.AccessibilityEvent;
import android.widget.LinearLayout.LayoutParams;

public class ActionMenuView
  extends LinearLayoutICS
  implements MenuBuilder.ItemInvoker, MenuView
{
  static final int GENERATED_ITEM_PADDING = 4;
  static final int MIN_CELL_SIZE = 56;
  private static final String TAG = "ActionMenuView";
  private boolean mFormatItems;
  private int mFormatItemsWidth;
  private int mGeneratedItemPadding;
  private int mMaxItemHeight;
  private int mMeasuredExtraWidth;
  private MenuBuilder mMenu;
  private int mMinCellSize;
  private ActionMenuPresenter mPresenter;
  private boolean mReserveOverflow;
  
  public ActionMenuView(Context paramContext)
  {
    this(paramContext, null);
  }
  
  public ActionMenuView(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    setBaselineAligned(false);
    float f = paramContext.getResources().getDisplayMetrics().density;
    this.mMinCellSize = ((int)(56.0F * f));
    this.mGeneratedItemPadding = ((int)(4.0F * f));
    paramContext = paramContext.obtainStyledAttributes(paramAttributeSet, R.styleable.ActionBar, R.attr.actionBarStyle, 0);
    this.mMaxItemHeight = paramContext.getDimensionPixelSize(1, 0);
    paramContext.recycle();
  }
  
  static int measureChildForCells(View paramView, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    LayoutParams localLayoutParams = (LayoutParams)paramView.getLayoutParams();
    int i = View.MeasureSpec.makeMeasureSpec(View.MeasureSpec.getSize(paramInt3) - paramInt4, View.MeasureSpec.getMode(paramInt3));
    ActionMenuItemView localActionMenuItemView;
    if ((paramView instanceof ActionMenuItemView))
    {
      localActionMenuItemView = (ActionMenuItemView)paramView;
      if ((localActionMenuItemView == null) || (!localActionMenuItemView.hasText())) {
        break label182;
      }
      paramInt4 = 1;
      label54:
      int j = 0;
      paramInt3 = j;
      if (paramInt2 > 0) {
        if (paramInt4 != 0)
        {
          paramInt3 = j;
          if (paramInt2 < 2) {}
        }
        else
        {
          paramView.measure(View.MeasureSpec.makeMeasureSpec(paramInt1 * paramInt2, Integer.MIN_VALUE), i);
          j = paramView.getMeasuredWidth();
          paramInt3 = j / paramInt1;
          paramInt2 = paramInt3;
          if (j % paramInt1 != 0) {
            paramInt2 = paramInt3 + 1;
          }
          paramInt3 = paramInt2;
          if (paramInt4 != 0)
          {
            paramInt3 = paramInt2;
            if (paramInt2 < 2) {
              paramInt3 = 2;
            }
          }
        }
      }
      if ((localLayoutParams.isOverflowButton) || (paramInt4 == 0)) {
        break label188;
      }
    }
    label182:
    label188:
    for (boolean bool = true;; bool = false)
    {
      localLayoutParams.expandable = bool;
      localLayoutParams.cellsUsed = paramInt3;
      paramView.measure(View.MeasureSpec.makeMeasureSpec(paramInt3 * paramInt1, 1073741824), i);
      return paramInt3;
      localActionMenuItemView = null;
      break;
      paramInt4 = 0;
      break label54;
    }
  }
  
  private void onMeasureExactFormat(int paramInt1, int paramInt2)
  {
    int i = View.MeasureSpec.getMode(paramInt2);
    paramInt1 = View.MeasureSpec.getSize(paramInt1);
    int j = View.MeasureSpec.getSize(paramInt2);
    paramInt2 = getPaddingLeft();
    int k = getPaddingRight();
    int m = getPaddingTop() + getPaddingBottom();
    int n;
    int i1;
    if (i == 1073741824)
    {
      n = View.MeasureSpec.makeMeasureSpec(j - m, 1073741824);
      i1 = paramInt1 - (paramInt2 + k);
      paramInt2 = i1 / this.mMinCellSize;
      paramInt1 = this.mMinCellSize;
      if (paramInt2 != 0) {
        break label111;
      }
      setMeasuredDimension(i1, 0);
    }
    for (;;)
    {
      return;
      n = View.MeasureSpec.makeMeasureSpec(Math.min(this.mMaxItemHeight, j - m), Integer.MIN_VALUE);
      break;
      label111:
      int i2 = this.mMinCellSize + i1 % paramInt1 / paramInt2;
      k = 0;
      int i3 = 0;
      int i4 = 0;
      int i5 = 0;
      int i6 = 0;
      long l1 = 0L;
      int i7 = getChildCount();
      int i8 = 0;
      Object localObject1;
      long l2;
      int i9;
      int i10;
      Object localObject2;
      label296:
      int i12;
      int i13;
      int i14;
      while (i8 < i7)
      {
        localObject1 = getChildAt(i8);
        if (((View)localObject1).getVisibility() == 8)
        {
          l2 = l1;
          i9 = i6;
          i8++;
          i6 = i9;
          l1 = l2;
        }
        else
        {
          boolean bool = localObject1 instanceof ActionMenuItemView;
          i10 = i5 + 1;
          if (bool) {
            ((View)localObject1).setPadding(this.mGeneratedItemPadding, 0, this.mGeneratedItemPadding, 0);
          }
          localObject2 = (LayoutParams)((View)localObject1).getLayoutParams();
          ((LayoutParams)localObject2).expanded = false;
          ((LayoutParams)localObject2).extraPixels = 0;
          ((LayoutParams)localObject2).cellsUsed = 0;
          ((LayoutParams)localObject2).expandable = false;
          ((LayoutParams)localObject2).leftMargin = 0;
          ((LayoutParams)localObject2).rightMargin = 0;
          if ((bool) && (((ActionMenuItemView)localObject1).hasText()))
          {
            bool = true;
            ((LayoutParams)localObject2).preventEdgeOffset = bool;
            if (!((LayoutParams)localObject2).isOverflowButton) {
              break label454;
            }
          }
          label454:
          for (paramInt1 = 1;; paramInt1 = paramInt2)
          {
            int i11 = measureChildForCells((View)localObject1, i2, paramInt1, n, m);
            i12 = Math.max(i3, i11);
            paramInt1 = i4;
            if (((LayoutParams)localObject2).expandable) {
              paramInt1 = i4 + 1;
            }
            if (((LayoutParams)localObject2).isOverflowButton) {
              i6 = 1;
            }
            i13 = paramInt2 - i11;
            i14 = Math.max(k, ((View)localObject1).getMeasuredHeight());
            paramInt2 = i13;
            i4 = paramInt1;
            i9 = i6;
            i3 = i12;
            k = i14;
            l2 = l1;
            i5 = i10;
            if (i11 != 1) {
              break;
            }
            l2 = l1 | 1 << i8;
            paramInt2 = i13;
            i4 = paramInt1;
            i9 = i6;
            i3 = i12;
            k = i14;
            i5 = i10;
            break;
            bool = false;
            break label296;
          }
        }
      }
      long l3;
      if ((i6 != 0) && (i5 == 2))
      {
        i9 = 1;
        paramInt1 = 0;
        l2 = l1;
        if (i4 <= 0) {
          break label662;
        }
        l2 = l1;
        if (paramInt2 <= 0) {
          break label662;
        }
        i10 = Integer.MAX_VALUE;
        l3 = 0L;
        i14 = 0;
        i13 = 0;
        label505:
        if (i13 >= i7) {
          break label645;
        }
        localObject2 = (LayoutParams)getChildAt(i13).getLayoutParams();
        if (((LayoutParams)localObject2).expandable) {
          break label570;
        }
        l2 = l3;
        i8 = i14;
        i12 = i10;
      }
      for (;;)
      {
        i13++;
        i10 = i12;
        i14 = i8;
        l3 = l2;
        break label505;
        i9 = 0;
        break;
        label570:
        if (((LayoutParams)localObject2).cellsUsed < i10)
        {
          i12 = ((LayoutParams)localObject2).cellsUsed;
          l2 = 1 << i13;
          i8 = 1;
        }
        else
        {
          i12 = i10;
          i8 = i14;
          l2 = l3;
          if (((LayoutParams)localObject2).cellsUsed == i10)
          {
            l2 = l3 | 1 << i13;
            i8 = i14 + 1;
            i12 = i10;
          }
        }
      }
      label645:
      l1 |= l3;
      if (i14 > paramInt2)
      {
        l2 = l1;
        label662:
        if ((i6 != 0) || (i5 != 1)) {
          break label1035;
        }
        i8 = 1;
        label676:
        i6 = paramInt2;
        i4 = paramInt1;
        if (paramInt2 <= 0) {
          break label1195;
        }
        i6 = paramInt2;
        i4 = paramInt1;
        if (l2 == 0L) {
          break label1195;
        }
        if ((paramInt2 >= i5 - 1) && (i8 == 0))
        {
          i6 = paramInt2;
          i4 = paramInt1;
          if (i3 <= 1) {
            break label1195;
          }
        }
        float f1 = Long.bitCount(l2);
        float f2 = f1;
        if (i8 == 0)
        {
          float f3 = f1;
          if ((1L & l2) != 0L)
          {
            f3 = f1;
            if (!((LayoutParams)getChildAt(0).getLayoutParams()).preventEdgeOffset) {
              f3 = f1 - 0.5F;
            }
          }
          f2 = f3;
          if ((1 << i7 - 1 & l2) != 0L)
          {
            f2 = f3;
            if (!((LayoutParams)getChildAt(i7 - 1).getLayoutParams()).preventEdgeOffset) {
              f2 = f3 - 0.5F;
            }
          }
        }
        if (f2 <= 0.0F) {
          break label1041;
        }
        i6 = (int)(paramInt2 * i2 / f2);
        label850:
        i4 = 0;
        label853:
        if (i4 >= i7) {
          break label1189;
        }
        if ((1 << i4 & l2) != 0L) {
          break label1047;
        }
        paramInt2 = paramInt1;
      }
      for (;;)
      {
        i4++;
        paramInt1 = paramInt2;
        break label853;
        paramInt1 = 0;
        if (paramInt1 < i7)
        {
          localObject2 = getChildAt(paramInt1);
          localObject1 = (LayoutParams)((View)localObject2).getLayoutParams();
          if ((1 << paramInt1 & l3) == 0L)
          {
            i8 = paramInt2;
            l2 = l1;
            if (((LayoutParams)localObject1).cellsUsed == i10 + 1)
            {
              l2 = l1 | 1 << paramInt1;
              i8 = paramInt2;
            }
          }
          for (;;)
          {
            paramInt1++;
            paramInt2 = i8;
            l1 = l2;
            break;
            if ((i9 != 0) && (((LayoutParams)localObject1).preventEdgeOffset) && (paramInt2 == 1)) {
              ((View)localObject2).setPadding(this.mGeneratedItemPadding + i2, 0, this.mGeneratedItemPadding, 0);
            }
            ((LayoutParams)localObject1).cellsUsed += 1;
            ((LayoutParams)localObject1).expanded = true;
            i8 = paramInt2 - 1;
            l2 = l1;
          }
        }
        paramInt1 = 1;
        break;
        label1035:
        i8 = 0;
        break label676;
        label1041:
        i6 = 0;
        break label850;
        label1047:
        localObject1 = getChildAt(i4);
        localObject2 = (LayoutParams)((View)localObject1).getLayoutParams();
        if ((localObject1 instanceof ActionMenuItemView))
        {
          ((LayoutParams)localObject2).extraPixels = i6;
          ((LayoutParams)localObject2).expanded = true;
          if ((i4 == 0) && (!((LayoutParams)localObject2).preventEdgeOffset)) {
            ((LayoutParams)localObject2).leftMargin = (-i6 / 2);
          }
          paramInt2 = 1;
        }
        else if (((LayoutParams)localObject2).isOverflowButton)
        {
          ((LayoutParams)localObject2).extraPixels = i6;
          ((LayoutParams)localObject2).expanded = true;
          ((LayoutParams)localObject2).rightMargin = (-i6 / 2);
          paramInt2 = 1;
        }
        else
        {
          if (i4 != 0) {
            ((LayoutParams)localObject2).leftMargin = (i6 / 2);
          }
          paramInt2 = paramInt1;
          if (i4 != i7 - 1)
          {
            ((LayoutParams)localObject2).rightMargin = (i6 / 2);
            paramInt2 = paramInt1;
          }
        }
      }
      label1189:
      i6 = 0;
      i4 = paramInt1;
      label1195:
      if (i4 != 0)
      {
        paramInt1 = 0;
        if (paramInt1 < i7)
        {
          localObject2 = getChildAt(paramInt1);
          localObject1 = (LayoutParams)((View)localObject2).getLayoutParams();
          if (!((LayoutParams)localObject1).expanded) {}
          for (;;)
          {
            paramInt1++;
            break;
            ((View)localObject2).measure(View.MeasureSpec.makeMeasureSpec(((LayoutParams)localObject1).cellsUsed * i2 + ((LayoutParams)localObject1).extraPixels, 1073741824), n);
          }
        }
      }
      paramInt1 = j;
      if (i != 1073741824) {
        paramInt1 = k;
      }
      setMeasuredDimension(i1, paramInt1);
      this.mMeasuredExtraWidth = (i6 * i2);
    }
  }
  
  protected boolean checkLayoutParams(ViewGroup.LayoutParams paramLayoutParams)
  {
    if ((paramLayoutParams != null) && ((paramLayoutParams instanceof LayoutParams))) {}
    for (boolean bool = true;; bool = false) {
      return bool;
    }
  }
  
  public boolean dispatchPopulateAccessibilityEvent(AccessibilityEvent paramAccessibilityEvent)
  {
    return false;
  }
  
  protected LayoutParams generateDefaultLayoutParams()
  {
    LayoutParams localLayoutParams = new LayoutParams(-2, -2);
    localLayoutParams.gravity = 16;
    return localLayoutParams;
  }
  
  public LayoutParams generateLayoutParams(AttributeSet paramAttributeSet)
  {
    return new LayoutParams(getContext(), paramAttributeSet);
  }
  
  protected LayoutParams generateLayoutParams(ViewGroup.LayoutParams paramLayoutParams)
  {
    LayoutParams localLayoutParams;
    if ((paramLayoutParams instanceof LayoutParams))
    {
      localLayoutParams = new LayoutParams((LayoutParams)paramLayoutParams);
      paramLayoutParams = localLayoutParams;
      if (localLayoutParams.gravity <= 0) {
        localLayoutParams.gravity = 16;
      }
    }
    for (paramLayoutParams = localLayoutParams;; paramLayoutParams = generateDefaultLayoutParams()) {
      return paramLayoutParams;
    }
  }
  
  public LayoutParams generateOverflowButtonLayoutParams()
  {
    LayoutParams localLayoutParams = generateDefaultLayoutParams();
    localLayoutParams.isOverflowButton = true;
    return localLayoutParams;
  }
  
  public int getWindowAnimations()
  {
    return 0;
  }
  
  protected boolean hasSupportDividerBeforeChildAt(int paramInt)
  {
    View localView1 = getChildAt(paramInt - 1);
    View localView2 = getChildAt(paramInt);
    boolean bool1 = false;
    boolean bool2 = bool1;
    if (paramInt < getChildCount())
    {
      bool2 = bool1;
      if ((localView1 instanceof ActionMenuChildView)) {
        bool2 = false | ((ActionMenuChildView)localView1).needsDividerAfter();
      }
    }
    bool1 = bool2;
    if (paramInt > 0)
    {
      bool1 = bool2;
      if ((localView2 instanceof ActionMenuChildView)) {
        bool1 = bool2 | ((ActionMenuChildView)localView2).needsDividerBefore();
      }
    }
    return bool1;
  }
  
  public void initialize(MenuBuilder paramMenuBuilder)
  {
    this.mMenu = paramMenuBuilder;
  }
  
  public boolean invokeItem(MenuItemImpl paramMenuItemImpl)
  {
    return this.mMenu.performItemAction(paramMenuItemImpl, 0);
  }
  
  public boolean isExpandedFormat()
  {
    return this.mFormatItems;
  }
  
  public boolean isOverflowReserved()
  {
    return this.mReserveOverflow;
  }
  
  public void onConfigurationChanged(Configuration paramConfiguration)
  {
    if (Build.VERSION.SDK_INT >= 8) {
      super.onConfigurationChanged(paramConfiguration);
    }
    this.mPresenter.updateMenuView(false);
    if ((this.mPresenter != null) && (this.mPresenter.isOverflowMenuShowing()))
    {
      this.mPresenter.hideOverflowMenu();
      this.mPresenter.showOverflowMenu();
    }
  }
  
  public void onDetachedFromWindow()
  {
    super.onDetachedFromWindow();
    this.mPresenter.dismissPopupMenus();
  }
  
  protected void onLayout(boolean paramBoolean, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    if (!this.mFormatItems) {
      super.onLayout(paramBoolean, paramInt1, paramInt2, paramInt3, paramInt4);
    }
    int i;
    int j;
    int m;
    int n;
    int i1;
    Object localObject1;
    Object localObject2;
    for (;;)
    {
      return;
      i = getChildCount();
      j = (paramInt2 + paramInt4) / 2;
      int k = getSupportDividerWidth();
      m = 0;
      paramInt4 = 0;
      paramInt2 = paramInt3 - paramInt1 - getPaddingRight() - getPaddingLeft();
      n = 0;
      i1 = 0;
      if (i1 < i)
      {
        localObject1 = getChildAt(i1);
        if (((View)localObject1).getVisibility() == 8) {}
        for (;;)
        {
          i1++;
          break;
          localObject2 = (LayoutParams)((View)localObject1).getLayoutParams();
          int i2;
          if (((LayoutParams)localObject2).isOverflowButton)
          {
            i2 = ((View)localObject1).getMeasuredWidth();
            n = i2;
            if (hasSupportDividerBeforeChildAt(i1)) {
              n = i2 + k;
            }
            int i3 = ((View)localObject1).getMeasuredHeight();
            int i4 = getWidth() - getPaddingRight() - ((LayoutParams)localObject2).rightMargin;
            i2 = j - i3 / 2;
            ((View)localObject1).layout(i4 - n, i2, i4, i2 + i3);
            paramInt2 -= n;
            n = 1;
          }
          else
          {
            i2 = ((View)localObject1).getMeasuredWidth() + ((LayoutParams)localObject2).leftMargin + ((LayoutParams)localObject2).rightMargin;
            m += i2;
            i2 = paramInt2 - i2;
            paramInt2 = m;
            if (hasSupportDividerBeforeChildAt(i1)) {
              paramInt2 = m + k;
            }
            paramInt4++;
            m = paramInt2;
            paramInt2 = i2;
          }
        }
      }
      if ((i != 1) || (n != 0)) {
        break;
      }
      localObject2 = getChildAt(0);
      paramInt2 = ((View)localObject2).getMeasuredWidth();
      paramInt4 = ((View)localObject2).getMeasuredHeight();
      paramInt1 = (paramInt3 - paramInt1) / 2 - paramInt2 / 2;
      paramInt3 = j - paramInt4 / 2;
      ((View)localObject2).layout(paramInt1, paramInt3, paramInt1 + paramInt2, paramInt3 + paramInt4);
    }
    if (n != 0)
    {
      paramInt1 = 0;
      label344:
      paramInt1 = paramInt4 - paramInt1;
      if (paramInt1 <= 0) {
        break label432;
      }
      paramInt1 = paramInt2 / paramInt1;
      label357:
      paramInt4 = Math.max(0, paramInt1);
      paramInt2 = getPaddingLeft();
      paramInt1 = 0;
      label371:
      if (paramInt1 < i)
      {
        localObject2 = getChildAt(paramInt1);
        localObject1 = (LayoutParams)((View)localObject2).getLayoutParams();
        paramInt3 = paramInt2;
        if (((View)localObject2).getVisibility() != 8) {
          if (!((LayoutParams)localObject1).isOverflowButton) {
            break label437;
          }
        }
      }
    }
    for (paramInt3 = paramInt2;; paramInt3 = i1 + (((LayoutParams)localObject1).rightMargin + paramInt3 + paramInt4))
    {
      paramInt1++;
      paramInt2 = paramInt3;
      break label371;
      break;
      paramInt1 = 1;
      break label344;
      label432:
      paramInt1 = 0;
      break label357;
      label437:
      i1 = paramInt2 + ((LayoutParams)localObject1).leftMargin;
      paramInt3 = ((View)localObject2).getMeasuredWidth();
      m = ((View)localObject2).getMeasuredHeight();
      paramInt2 = j - m / 2;
      ((View)localObject2).layout(i1, paramInt2, i1 + paramInt3, paramInt2 + m);
    }
  }
  
  protected void onMeasure(int paramInt1, int paramInt2)
  {
    boolean bool1 = this.mFormatItems;
    boolean bool2;
    int i;
    if (View.MeasureSpec.getMode(paramInt1) == 1073741824)
    {
      bool2 = true;
      this.mFormatItems = bool2;
      if (bool1 != this.mFormatItems) {
        this.mFormatItemsWidth = 0;
      }
      i = View.MeasureSpec.getMode(paramInt1);
      if ((this.mFormatItems) && (this.mMenu != null) && (i != this.mFormatItemsWidth))
      {
        this.mFormatItemsWidth = i;
        this.mMenu.onItemsChanged(true);
      }
      if (!this.mFormatItems) {
        break label99;
      }
      onMeasureExactFormat(paramInt1, paramInt2);
    }
    for (;;)
    {
      return;
      bool2 = false;
      break;
      label99:
      int j = getChildCount();
      for (i = 0; i < j; i++)
      {
        LayoutParams localLayoutParams = (LayoutParams)getChildAt(i).getLayoutParams();
        localLayoutParams.rightMargin = 0;
        localLayoutParams.leftMargin = 0;
      }
      super.onMeasure(paramInt1, paramInt2);
    }
  }
  
  public void setOverflowReserved(boolean paramBoolean)
  {
    this.mReserveOverflow = paramBoolean;
  }
  
  public void setPresenter(ActionMenuPresenter paramActionMenuPresenter)
  {
    this.mPresenter = paramActionMenuPresenter;
  }
  
  public static abstract interface ActionMenuChildView
  {
    public abstract boolean needsDividerAfter();
    
    public abstract boolean needsDividerBefore();
  }
  
  public static class LayoutParams
    extends LinearLayout.LayoutParams
  {
    @ViewDebug.ExportedProperty
    public int cellsUsed;
    @ViewDebug.ExportedProperty
    public boolean expandable;
    public boolean expanded;
    @ViewDebug.ExportedProperty
    public int extraPixels;
    @ViewDebug.ExportedProperty
    public boolean isOverflowButton;
    @ViewDebug.ExportedProperty
    public boolean preventEdgeOffset;
    
    public LayoutParams(int paramInt1, int paramInt2)
    {
      super(paramInt2);
      this.isOverflowButton = false;
    }
    
    public LayoutParams(int paramInt1, int paramInt2, boolean paramBoolean)
    {
      super(paramInt2);
      this.isOverflowButton = paramBoolean;
    }
    
    public LayoutParams(Context paramContext, AttributeSet paramAttributeSet)
    {
      super(paramAttributeSet);
    }
    
    public LayoutParams(LayoutParams paramLayoutParams)
    {
      super();
      this.isOverflowButton = paramLayoutParams.isOverflowButton;
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/android/support/v7/internal/view/menu/ActionMenuView.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */