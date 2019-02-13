package com.mobeta.android.dslv;

import android.content.Context;
import android.content.res.TypedArray;
import android.database.DataSetObserver;
import android.graphics.Canvas;
import android.graphics.Point;
import android.graphics.drawable.Drawable;
import android.os.Environment;
import android.os.SystemClock;
import android.util.AttributeSet;
import android.util.Log;
import android.util.SparseBooleanArray;
import android.util.SparseIntArray;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.MeasureSpec;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.view.ViewParent;
import android.widget.AbsListView.LayoutParams;
import android.widget.BaseAdapter;
import android.widget.Checkable;
import android.widget.ListAdapter;
import android.widget.ListView;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;

public class DragSortListView
  extends ListView
{
  private static final int DRAGGING = 4;
  public static final int DRAG_NEG_X = 2;
  public static final int DRAG_NEG_Y = 8;
  public static final int DRAG_POS_X = 1;
  public static final int DRAG_POS_Y = 4;
  private static final int DROPPING = 2;
  private static final int IDLE = 0;
  private static final int NO_CANCEL = 0;
  private static final int ON_INTERCEPT_TOUCH_EVENT = 2;
  private static final int ON_TOUCH_EVENT = 1;
  private static final int REMOVING = 1;
  private static final int STOPPED = 3;
  private static final int sCacheSize = 3;
  private AdapterWrapper mAdapterWrapper;
  private boolean mAnimate = false;
  private boolean mBlockLayoutRequests = false;
  private MotionEvent mCancelEvent;
  private int mCancelMethod = 0;
  private HeightCache mChildHeightCache = new HeightCache(3);
  private float mCurrFloatAlpha = 1.0F;
  private int mDownScrollStartY;
  private float mDownScrollStartYF;
  private int mDragDeltaX;
  private int mDragDeltaY;
  private float mDragDownScrollHeight;
  private float mDragDownScrollStartFrac = 0.33333334F;
  private boolean mDragEnabled = true;
  private int mDragFlags = 0;
  private DragListener mDragListener;
  private DragScroller mDragScroller;
  private DragSortTracker mDragSortTracker;
  private int mDragStartY;
  private int mDragState = 0;
  private float mDragUpScrollHeight;
  private float mDragUpScrollStartFrac = 0.33333334F;
  private DropAnimator mDropAnimator;
  private DropListener mDropListener;
  private int mFirstExpPos;
  private float mFloatAlpha = 1.0F;
  private Point mFloatLoc = new Point();
  private int mFloatPos;
  private View mFloatView;
  private int mFloatViewHeight;
  private int mFloatViewHeightHalf;
  private boolean mFloatViewInvalidated = false;
  private FloatViewManager mFloatViewManager = null;
  private int mFloatViewMid;
  private boolean mFloatViewOnMeasured = false;
  private boolean mIgnoreTouchEvent = false;
  private boolean mInTouchEvent = false;
  private int mItemHeightCollapsed = 1;
  private boolean mLastCallWasIntercept = false;
  private int mLastX;
  private int mLastY;
  private LiftAnimator mLiftAnimator;
  private boolean mListViewIntercepted = false;
  private float mMaxScrollSpeed = 0.5F;
  private DataSetObserver mObserver;
  private int mOffsetX;
  private int mOffsetY;
  private RemoveAnimator mRemoveAnimator;
  private RemoveListener mRemoveListener;
  private float mRemoveVelocityX = 0.0F;
  private View[] mSampleViewTypes = new View[1];
  private DragScrollProfile mScrollProfile = new DragScrollProfile()
  {
    public float getSpeed(float paramAnonymousFloat, long paramAnonymousLong)
    {
      return DragSortListView.this.mMaxScrollSpeed * paramAnonymousFloat;
    }
  };
  private int mSecondExpPos;
  private float mSlideFrac = 0.0F;
  private float mSlideRegionFrac = 0.25F;
  private int mSrcPos;
  private Point mTouchLoc = new Point();
  private boolean mTrackDragSort = false;
  private int mUpScrollStartY;
  private float mUpScrollStartYF;
  private boolean mUseRemoveVelocity;
  private int mWidthMeasureSpec = 0;
  private int mX;
  private int mY;
  
  public DragSortListView(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    int i = 150;
    int j = 150;
    int k = j;
    int m = i;
    if (paramAttributeSet != null)
    {
      paramAttributeSet = getContext().obtainStyledAttributes(paramAttributeSet, R.styleable.DragSortListView, 0, 0);
      this.mItemHeightCollapsed = Math.max(1, paramAttributeSet.getDimensionPixelSize(R.styleable.DragSortListView_collapsed_height, 1));
      this.mTrackDragSort = paramAttributeSet.getBoolean(R.styleable.DragSortListView_track_drag_sort, false);
      if (this.mTrackDragSort) {
        this.mDragSortTracker = new DragSortTracker();
      }
      this.mFloatAlpha = paramAttributeSet.getFloat(R.styleable.DragSortListView_float_alpha, this.mFloatAlpha);
      this.mCurrFloatAlpha = this.mFloatAlpha;
      this.mDragEnabled = paramAttributeSet.getBoolean(R.styleable.DragSortListView_drag_enabled, this.mDragEnabled);
      this.mSlideRegionFrac = Math.max(0.0F, Math.min(1.0F, 1.0F - paramAttributeSet.getFloat(R.styleable.DragSortListView_slide_shuffle_speed, 0.75F)));
      if (this.mSlideRegionFrac <= 0.0F) {
        break label625;
      }
    }
    label625:
    for (boolean bool1 = true;; bool1 = false)
    {
      this.mAnimate = bool1;
      setDragScrollStart(paramAttributeSet.getFloat(R.styleable.DragSortListView_drag_scroll_start, this.mDragUpScrollStartFrac));
      this.mMaxScrollSpeed = paramAttributeSet.getFloat(R.styleable.DragSortListView_max_drag_scroll_speed, this.mMaxScrollSpeed);
      m = paramAttributeSet.getInt(R.styleable.DragSortListView_remove_animation_duration, i);
      k = paramAttributeSet.getInt(R.styleable.DragSortListView_drop_animation_duration, j);
      if (paramAttributeSet.getBoolean(R.styleable.DragSortListView_use_default_controller, true))
      {
        bool1 = paramAttributeSet.getBoolean(R.styleable.DragSortListView_remove_enabled, false);
        int n = paramAttributeSet.getInt(R.styleable.DragSortListView_remove_mode, 1);
        boolean bool2 = paramAttributeSet.getBoolean(R.styleable.DragSortListView_sort_enabled, true);
        int i1 = paramAttributeSet.getInt(R.styleable.DragSortListView_drag_start_mode, 0);
        j = paramAttributeSet.getResourceId(R.styleable.DragSortListView_drag_handle_id, 0);
        int i2 = paramAttributeSet.getResourceId(R.styleable.DragSortListView_fling_handle_id, 0);
        i = paramAttributeSet.getResourceId(R.styleable.DragSortListView_click_remove_id, 0);
        int i3 = paramAttributeSet.getColor(R.styleable.DragSortListView_float_background_color, -16777216);
        paramContext = new DragSortController(this, j, i1, n, i, i2);
        paramContext.setRemoveEnabled(bool1);
        paramContext.setSortEnabled(bool2);
        paramContext.setBackgroundColor(i3);
        this.mFloatViewManager = paramContext;
        setOnTouchListener(paramContext);
      }
      paramAttributeSet.recycle();
      this.mDragScroller = new DragScroller();
      if (m > 0) {
        this.mRemoveAnimator = new RemoveAnimator(0.5F, m);
      }
      if (k > 0) {
        this.mDropAnimator = new DropAnimator(0.5F, k);
      }
      this.mCancelEvent = MotionEvent.obtain(0L, 0L, 3, 0.0F, 0.0F, 0.0F, 0.0F, 0, 0.0F, 0.0F, 0, 0);
      this.mObserver = new DataSetObserver()
      {
        private void cancel()
        {
          if (DragSortListView.this.mDragState == 4) {
            DragSortListView.this.cancelDrag();
          }
        }
        
        public void onChanged()
        {
          cancel();
        }
        
        public void onInvalidated()
        {
          cancel();
        }
      };
      return;
    }
  }
  
  private void adjustAllItems()
  {
    int i = getFirstVisiblePosition();
    int j = getLastVisiblePosition();
    int k = Math.max(0, getHeaderViewsCount() - i);
    j = Math.min(j - i, getCount() - 1 - getFooterViewsCount() - i);
    while (k <= j)
    {
      View localView = getChildAt(k);
      if (localView != null) {
        adjustItem(i + k, localView, false);
      }
      k++;
    }
  }
  
  private void adjustItem(int paramInt)
  {
    View localView = getChildAt(paramInt - getFirstVisiblePosition());
    if (localView != null) {
      adjustItem(paramInt, localView, false);
    }
  }
  
  private void adjustItem(int paramInt, View paramView, boolean paramBoolean)
  {
    ViewGroup.LayoutParams localLayoutParams = paramView.getLayoutParams();
    int i;
    if ((paramInt != this.mSrcPos) && (paramInt != this.mFirstExpPos) && (paramInt != this.mSecondExpPos))
    {
      i = -2;
      if (i != localLayoutParams.height)
      {
        localLayoutParams.height = i;
        paramView.setLayoutParams(localLayoutParams);
      }
      if ((paramInt == this.mFirstExpPos) || (paramInt == this.mSecondExpPos))
      {
        if (paramInt >= this.mSrcPos) {
          break label151;
        }
        ((DragSortItemView)paramView).setGravity(80);
      }
    }
    for (;;)
    {
      int j = paramView.getVisibility();
      int k = 0;
      i = k;
      if (paramInt == this.mSrcPos)
      {
        i = k;
        if (this.mFloatView != null) {
          i = 4;
        }
      }
      if (i != j) {
        paramView.setVisibility(i);
      }
      return;
      i = calcItemHeight(paramInt, paramView, paramBoolean);
      break;
      label151:
      if (paramInt > this.mSrcPos) {
        ((DragSortItemView)paramView).setGravity(48);
      }
    }
  }
  
  private void adjustOnReorder()
  {
    int i = getFirstVisiblePosition();
    if (this.mSrcPos < i)
    {
      View localView = getChildAt(0);
      int j = 0;
      if (localView != null) {
        j = localView.getTop();
      }
      setSelectionFromTop(i - 1, j - getPaddingTop());
    }
  }
  
  private int adjustScroll(int paramInt1, View paramView, int paramInt2, int paramInt3)
  {
    int i = 0;
    int j = getChildHeight(paramInt1);
    int k = paramView.getHeight();
    int m = calcItemHeight(paramInt1, j);
    int n = k;
    int i1 = m;
    int i2 = i1;
    int i3 = n;
    if (paramInt1 != this.mSrcPos)
    {
      i3 = n - j;
      i2 = i1 - j;
    }
    n = this.mFloatViewHeight;
    i1 = n;
    if (this.mSrcPos != this.mFirstExpPos)
    {
      i1 = n;
      if (this.mSrcPos != this.mSecondExpPos) {
        i1 = n - this.mItemHeightCollapsed;
      }
    }
    if (paramInt1 <= paramInt2)
    {
      paramInt2 = i;
      if (paramInt1 > this.mFirstExpPos) {
        paramInt2 = 0 + (i1 - i2);
      }
    }
    for (;;)
    {
      return paramInt2;
      if (paramInt1 == paramInt3)
      {
        if (paramInt1 <= this.mFirstExpPos) {
          paramInt2 = 0 + (i3 - i1);
        } else if (paramInt1 == this.mSecondExpPos) {
          paramInt2 = 0 + (k - m);
        } else {
          paramInt2 = 0 + i3;
        }
      }
      else if (paramInt1 <= this.mFirstExpPos)
      {
        paramInt2 = 0 - i1;
      }
      else
      {
        paramInt2 = i;
        if (paramInt1 == this.mSecondExpPos) {
          paramInt2 = 0 - i2;
        }
      }
    }
  }
  
  private static int buildRunList(SparseBooleanArray paramSparseBooleanArray, int paramInt1, int paramInt2, int[] paramArrayOfInt1, int[] paramArrayOfInt2)
  {
    int i = 0;
    int j = 0;
    int k = findFirstSetIndex(paramSparseBooleanArray, paramInt1, paramInt2);
    if (k == -1) {
      paramInt2 = i;
    }
    for (;;)
    {
      return paramInt2;
      int m = paramSparseBooleanArray.keyAt(k);
      i = m + 1;
      k++;
      if (k < paramSparseBooleanArray.size())
      {
        int n = paramSparseBooleanArray.keyAt(k);
        if (n < paramInt2)
        {
          if (!paramSparseBooleanArray.valueAt(k)) {}
          for (;;)
          {
            k++;
            break;
            if (n == i)
            {
              i++;
            }
            else
            {
              paramArrayOfInt1[j] = m;
              paramArrayOfInt2[j] = i;
              j++;
              m = n;
              i = n + 1;
            }
          }
        }
      }
      k = i;
      if (i == paramInt2) {
        k = paramInt1;
      }
      paramArrayOfInt1[j] = m;
      paramArrayOfInt2[j] = k;
      i = j + 1;
      paramInt2 = i;
      if (i > 1)
      {
        paramInt2 = i;
        if (paramArrayOfInt1[0] == paramInt1)
        {
          paramInt2 = i;
          if (paramArrayOfInt2[(i - 1)] == paramInt1)
          {
            paramArrayOfInt1[0] = paramArrayOfInt1[(i - 1)];
            paramInt2 = i - 1;
          }
        }
      }
    }
  }
  
  private int calcItemHeight(int paramInt1, int paramInt2)
  {
    getDividerHeight();
    int i;
    int j;
    int k;
    if ((this.mAnimate) && (this.mFirstExpPos != this.mSecondExpPos))
    {
      i = 1;
      j = this.mFloatViewHeight - this.mItemHeightCollapsed;
      k = (int)(this.mSlideFrac * j);
      if (paramInt1 != this.mSrcPos) {
        break label123;
      }
      if (this.mSrcPos != this.mFirstExpPos) {
        break label93;
      }
      if (i == 0) {
        break label85;
      }
      paramInt1 = k + this.mItemHeightCollapsed;
    }
    for (;;)
    {
      return paramInt1;
      i = 0;
      break;
      label85:
      paramInt1 = this.mFloatViewHeight;
      continue;
      label93:
      if (this.mSrcPos == this.mSecondExpPos)
      {
        paramInt1 = this.mFloatViewHeight - k;
      }
      else
      {
        paramInt1 = this.mItemHeightCollapsed;
        continue;
        label123:
        if (paramInt1 == this.mFirstExpPos)
        {
          if (i != 0) {
            paramInt1 = paramInt2 + k;
          } else {
            paramInt1 = paramInt2 + j;
          }
        }
        else if (paramInt1 == this.mSecondExpPos) {
          paramInt1 = paramInt2 + j - k;
        } else {
          paramInt1 = paramInt2;
        }
      }
    }
  }
  
  private int calcItemHeight(int paramInt, View paramView, boolean paramBoolean)
  {
    return calcItemHeight(paramInt, getChildHeight(paramInt, paramView, paramBoolean));
  }
  
  private void clearPositions()
  {
    this.mSrcPos = -1;
    this.mFirstExpPos = -1;
    this.mSecondExpPos = -1;
    this.mFloatPos = -1;
  }
  
  private void continueDrag(int paramInt1, int paramInt2)
  {
    this.mFloatLoc.x = (paramInt1 - this.mDragDeltaX);
    this.mFloatLoc.y = (paramInt2 - this.mDragDeltaY);
    doDragFloatView(true);
    paramInt1 = Math.min(paramInt2, this.mFloatViewMid + this.mFloatViewHeightHalf);
    paramInt2 = Math.max(paramInt2, this.mFloatViewMid - this.mFloatViewHeightHalf);
    int i = this.mDragScroller.getScrollDir();
    if ((paramInt1 > this.mLastY) && (paramInt1 > this.mDownScrollStartY) && (i != 1))
    {
      if (i != -1) {
        this.mDragScroller.stopScrolling(true);
      }
      this.mDragScroller.startScrolling(1);
    }
    for (;;)
    {
      return;
      if ((paramInt2 < this.mLastY) && (paramInt2 < this.mUpScrollStartY) && (i != 0))
      {
        if (i != -1) {
          this.mDragScroller.stopScrolling(true);
        }
        this.mDragScroller.startScrolling(0);
      }
      else if ((paramInt2 >= this.mUpScrollStartY) && (paramInt1 <= this.mDownScrollStartY) && (this.mDragScroller.isScrolling()))
      {
        this.mDragScroller.stopScrolling(true);
      }
    }
  }
  
  private void destroyFloatView()
  {
    if (this.mFloatView != null)
    {
      this.mFloatView.setVisibility(8);
      if (this.mFloatViewManager != null) {
        this.mFloatViewManager.onDestroyFloatView(this.mFloatView);
      }
      this.mFloatView = null;
      invalidate();
    }
  }
  
  private void doActionUpOrCancel()
  {
    this.mCancelMethod = 0;
    this.mInTouchEvent = false;
    if (this.mDragState == 3) {
      this.mDragState = 0;
    }
    this.mCurrFloatAlpha = this.mFloatAlpha;
    this.mListViewIntercepted = false;
    this.mChildHeightCache.clear();
  }
  
  private void doDragFloatView(int paramInt, View paramView, boolean paramBoolean)
  {
    this.mBlockLayoutRequests = true;
    updateFloatView();
    int i = this.mFirstExpPos;
    int j = this.mSecondExpPos;
    boolean bool = updatePositions();
    if (bool)
    {
      adjustAllItems();
      j = adjustScroll(paramInt, paramView, i, j);
      setSelectionFromTop(paramInt, paramView.getTop() + j - getPaddingTop());
      layoutChildren();
    }
    if ((bool) || (paramBoolean)) {
      invalidate();
    }
    this.mBlockLayoutRequests = false;
  }
  
  private void doDragFloatView(boolean paramBoolean)
  {
    int i = getFirstVisiblePosition();
    int j = getChildCount() / 2;
    View localView = getChildAt(getChildCount() / 2);
    if (localView == null) {}
    for (;;)
    {
      return;
      doDragFloatView(i + j, localView, paramBoolean);
    }
  }
  
  private void doRemoveItem()
  {
    doRemoveItem(this.mSrcPos - getHeaderViewsCount());
  }
  
  private void doRemoveItem(int paramInt)
  {
    this.mDragState = 1;
    if (this.mRemoveListener != null) {
      this.mRemoveListener.remove(paramInt);
    }
    destroyFloatView();
    adjustOnReorder();
    clearPositions();
    if (this.mInTouchEvent) {}
    for (this.mDragState = 3;; this.mDragState = 0) {
      return;
    }
  }
  
  private void drawDivider(int paramInt, Canvas paramCanvas)
  {
    Drawable localDrawable = getDivider();
    int i = getDividerHeight();
    ViewGroup localViewGroup;
    int j;
    int k;
    int m;
    if ((localDrawable != null) && (i != 0))
    {
      localViewGroup = (ViewGroup)getChildAt(paramInt - getFirstVisiblePosition());
      if (localViewGroup != null)
      {
        j = getPaddingLeft();
        k = getWidth() - getPaddingRight();
        m = localViewGroup.getChildAt(0).getHeight();
        if (paramInt <= this.mSrcPos) {
          break label129;
        }
        paramInt = localViewGroup.getTop() + m;
        m = paramInt + i;
      }
    }
    for (;;)
    {
      paramCanvas.save();
      paramCanvas.clipRect(j, paramInt, k, m);
      localDrawable.setBounds(j, paramInt, k, m);
      localDrawable.draw(paramCanvas);
      paramCanvas.restore();
      return;
      label129:
      m = localViewGroup.getBottom() - m;
      paramInt = m - i;
    }
  }
  
  private void dropFloatView()
  {
    this.mDragState = 2;
    if ((this.mDropListener != null) && (this.mFloatPos >= 0) && (this.mFloatPos < getCount()))
    {
      int i = getHeaderViewsCount();
      this.mDropListener.drop(this.mSrcPos - i, this.mFloatPos - i);
    }
    destroyFloatView();
    adjustOnReorder();
    clearPositions();
    adjustAllItems();
    if (this.mInTouchEvent) {}
    for (this.mDragState = 3;; this.mDragState = 0) {
      return;
    }
  }
  
  private static int findFirstSetIndex(SparseBooleanArray paramSparseBooleanArray, int paramInt1, int paramInt2)
  {
    int i = paramSparseBooleanArray.size();
    for (paramInt1 = insertionIndexForKey(paramSparseBooleanArray, paramInt1); (paramInt1 < i) && (paramSparseBooleanArray.keyAt(paramInt1) < paramInt2) && (!paramSparseBooleanArray.valueAt(paramInt1)); paramInt1++) {}
    if (paramInt1 != i)
    {
      i = paramInt1;
      if (paramSparseBooleanArray.keyAt(paramInt1) < paramInt2) {}
    }
    else
    {
      i = -1;
    }
    return i;
  }
  
  private int getChildHeight(int paramInt)
  {
    int i = 0;
    if (paramInt == this.mSrcPos) {}
    do
    {
      for (;;)
      {
        return i;
        localObject = getChildAt(paramInt - getFirstVisiblePosition());
        if (localObject == null) {
          break;
        }
        i = getChildHeight(paramInt, (View)localObject, false);
      }
      j = this.mChildHeightCache.get(paramInt);
      i = j;
    } while (j != -1);
    Object localObject = getAdapter();
    i = ((ListAdapter)localObject).getItemViewType(paramInt);
    int j = ((ListAdapter)localObject).getViewTypeCount();
    if (j != this.mSampleViewTypes.length) {
      this.mSampleViewTypes = new View[j];
    }
    if (i >= 0) {
      if (this.mSampleViewTypes[i] == null)
      {
        localObject = ((ListAdapter)localObject).getView(paramInt, null, this);
        this.mSampleViewTypes[i] = localObject;
      }
    }
    for (;;)
    {
      i = getChildHeight(paramInt, (View)localObject, true);
      this.mChildHeightCache.add(paramInt, i);
      break;
      localObject = ((ListAdapter)localObject).getView(paramInt, this.mSampleViewTypes[i], this);
      continue;
      localObject = ((ListAdapter)localObject).getView(paramInt, null, this);
    }
  }
  
  private int getChildHeight(int paramInt, View paramView, boolean paramBoolean)
  {
    int i = 0;
    if (paramInt == this.mSrcPos) {
      paramInt = i;
    }
    for (;;)
    {
      return paramInt;
      if ((paramInt < getHeaderViewsCount()) || (paramInt >= getCount() - getFooterViewsCount())) {}
      for (;;)
      {
        ViewGroup.LayoutParams localLayoutParams = paramView.getLayoutParams();
        if ((localLayoutParams == null) || (localLayoutParams.height <= 0)) {
          break label77;
        }
        paramInt = localLayoutParams.height;
        break;
        paramView = ((ViewGroup)paramView).getChildAt(0);
      }
      label77:
      paramInt = paramView.getHeight();
      if ((paramInt == 0) || (paramBoolean))
      {
        measureItem(paramView);
        paramInt = paramView.getMeasuredHeight();
      }
    }
  }
  
  private int getItemHeight(int paramInt)
  {
    View localView = getChildAt(paramInt - getFirstVisiblePosition());
    if (localView != null) {}
    for (paramInt = localView.getHeight();; paramInt = calcItemHeight(paramInt, getChildHeight(paramInt))) {
      return paramInt;
    }
  }
  
  private int getShuffleEdge(int paramInt1, int paramInt2)
  {
    int i = getHeaderViewsCount();
    int j = getFooterViewsCount();
    if ((paramInt1 <= i) || (paramInt1 >= getCount() - j)) {
      paramInt1 = paramInt2;
    }
    for (;;)
    {
      return paramInt1;
      int k = getDividerHeight();
      int m = this.mFloatViewHeight - this.mItemHeightCollapsed;
      int n = getChildHeight(paramInt1);
      int i1 = getItemHeight(paramInt1);
      i = paramInt2;
      if (this.mSecondExpPos <= this.mSrcPos) {
        if ((paramInt1 == this.mSecondExpPos) && (this.mFirstExpPos != this.mSecondExpPos)) {
          if (paramInt1 == this.mSrcPos) {
            j = paramInt2 + i1 - this.mFloatViewHeight;
          }
        }
      }
      for (;;)
      {
        if (paramInt1 > this.mSrcPos) {
          break label253;
        }
        paramInt1 = j + (this.mFloatViewHeight - k - getChildHeight(paramInt1 - 1)) / 2;
        break;
        j = paramInt2 + (i1 - n) - m;
        continue;
        j = i;
        if (paramInt1 > this.mSecondExpPos)
        {
          j = i;
          if (paramInt1 <= this.mSrcPos)
          {
            j = paramInt2 - m;
            continue;
            if ((paramInt1 > this.mSrcPos) && (paramInt1 <= this.mFirstExpPos))
            {
              j = paramInt2 + m;
            }
            else
            {
              j = i;
              if (paramInt1 == this.mSecondExpPos)
              {
                j = i;
                if (this.mFirstExpPos != this.mSecondExpPos) {
                  j = paramInt2 + (i1 - n);
                }
              }
            }
          }
        }
      }
      label253:
      paramInt1 = j + (n - k - this.mFloatViewHeight) / 2;
    }
  }
  
  private static int insertionIndexForKey(SparseBooleanArray paramSparseBooleanArray, int paramInt)
  {
    int i = 0;
    int j = paramSparseBooleanArray.size();
    while (j - i > 0)
    {
      int k = i + j >> 1;
      if (paramSparseBooleanArray.keyAt(k) < paramInt) {
        i = k + 1;
      } else {
        j = k;
      }
    }
    return i;
  }
  
  private void invalidateFloatView()
  {
    this.mFloatViewInvalidated = true;
  }
  
  private void measureFloatView()
  {
    if (this.mFloatView != null)
    {
      measureItem(this.mFloatView);
      this.mFloatViewHeight = this.mFloatView.getMeasuredHeight();
      this.mFloatViewHeightHalf = (this.mFloatViewHeight / 2);
    }
  }
  
  private void measureItem(View paramView)
  {
    ViewGroup.LayoutParams localLayoutParams = paramView.getLayoutParams();
    Object localObject = localLayoutParams;
    if (localLayoutParams == null)
    {
      localObject = new AbsListView.LayoutParams(-1, -2);
      paramView.setLayoutParams((ViewGroup.LayoutParams)localObject);
    }
    int i = ViewGroup.getChildMeasureSpec(this.mWidthMeasureSpec, getListPaddingLeft() + getListPaddingRight(), ((ViewGroup.LayoutParams)localObject).width);
    if (((ViewGroup.LayoutParams)localObject).height > 0) {}
    for (int j = View.MeasureSpec.makeMeasureSpec(((ViewGroup.LayoutParams)localObject).height, 1073741824);; j = View.MeasureSpec.makeMeasureSpec(0, 0))
    {
      paramView.measure(i, j);
      return;
    }
  }
  
  private void printPosData()
  {
    Log.d("mobeta", "mSrcPos=" + this.mSrcPos + " mFirstExpPos=" + this.mFirstExpPos + " mSecondExpPos=" + this.mSecondExpPos);
  }
  
  private static int rotate(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    int i = paramInt4 - paramInt3;
    paramInt2 = paramInt1 + paramInt2;
    if (paramInt2 < paramInt3) {
      paramInt1 = paramInt2 + i;
    }
    for (;;)
    {
      return paramInt1;
      paramInt1 = paramInt2;
      if (paramInt2 >= paramInt4) {
        paramInt1 = paramInt2 - i;
      }
    }
  }
  
  private void saveTouchCoords(MotionEvent paramMotionEvent)
  {
    int i = paramMotionEvent.getAction() & 0xFF;
    if (i != 0)
    {
      this.mLastX = this.mX;
      this.mLastY = this.mY;
    }
    this.mX = ((int)paramMotionEvent.getX());
    this.mY = ((int)paramMotionEvent.getY());
    if (i == 0)
    {
      this.mLastX = this.mX;
      this.mLastY = this.mY;
    }
    this.mOffsetX = ((int)paramMotionEvent.getRawX() - this.mX);
    this.mOffsetY = ((int)paramMotionEvent.getRawY() - this.mY);
  }
  
  private void updateFloatView()
  {
    if (this.mFloatViewManager != null)
    {
      this.mTouchLoc.set(this.mX, this.mY);
      this.mFloatViewManager.onDragFloatView(this.mFloatView, this.mFloatLoc, this.mTouchLoc);
    }
    int i = this.mFloatLoc.x;
    int j = this.mFloatLoc.y;
    int k = getPaddingLeft();
    int m;
    if (((this.mDragFlags & 0x1) == 0) && (i > k))
    {
      this.mFloatLoc.x = k;
      i = getHeaderViewsCount();
      m = getFooterViewsCount();
      int n = getFirstVisiblePosition();
      int i1 = getLastVisiblePosition();
      k = getPaddingTop();
      if (n < i) {
        k = getChildAt(i - n - 1).getBottom();
      }
      i = k;
      if ((this.mDragFlags & 0x8) == 0)
      {
        i = k;
        if (n <= this.mSrcPos) {
          i = Math.max(getChildAt(this.mSrcPos - n).getTop(), k);
        }
      }
      k = getHeight() - getPaddingBottom();
      if (i1 >= getCount() - m - 1) {
        k = getChildAt(getCount() - m - 1 - n).getBottom();
      }
      m = k;
      if ((this.mDragFlags & 0x4) == 0)
      {
        m = k;
        if (i1 >= this.mSrcPos) {
          m = Math.min(getChildAt(this.mSrcPos - n).getBottom(), k);
        }
      }
      if (j >= i) {
        break label319;
      }
      this.mFloatLoc.y = i;
    }
    for (;;)
    {
      this.mFloatViewMid = (this.mFloatLoc.y + this.mFloatViewHeightHalf);
      return;
      if (((this.mDragFlags & 0x2) != 0) || (i >= k)) {
        break;
      }
      this.mFloatLoc.x = k;
      break;
      label319:
      if (this.mFloatViewHeight + j > m) {
        this.mFloatLoc.y = (m - this.mFloatViewHeight);
      }
    }
  }
  
  private boolean updatePositions()
  {
    int i = getFirstVisiblePosition();
    int j = this.mFirstExpPos;
    View localView1 = getChildAt(j - i);
    View localView2 = localView1;
    if (localView1 == null)
    {
      j = i + getChildCount() / 2;
      localView2 = getChildAt(j - i);
    }
    int k = localView2.getTop();
    int m = localView2.getHeight();
    i = getShuffleEdge(j, k);
    int n = i;
    int i1 = getDividerHeight();
    int i2;
    int i3;
    label130:
    int i4;
    boolean bool;
    float f1;
    label190:
    float f2;
    if (this.mFloatViewMid < i)
    {
      i2 = k;
      k = j;
      i3 = n;
      if (j >= 0)
      {
        m = j - 1;
        i = getItemHeight(m);
        if (m == 0)
        {
          i = i2 - i1 - i;
          i3 = n;
          k = m;
        }
      }
      else
      {
        j = getHeaderViewsCount();
        i4 = getFooterViewsCount();
        bool = false;
        i2 = this.mFirstExpPos;
        m = this.mSecondExpPos;
        f1 = this.mSlideFrac;
        if (!this.mAnimate) {
          break label592;
        }
        i1 = Math.abs(i - i3);
        if (this.mFloatViewMid >= i) {
          break label521;
        }
        n = i3;
        i3 = (int)(0.5F * this.mSlideRegionFrac * i1);
        f2 = i3;
        n += i3;
        if (this.mFloatViewMid >= n) {
          break label530;
        }
        this.mFirstExpPos = (k - 1);
        this.mSecondExpPos = k;
        this.mSlideFrac = (0.5F * (n - this.mFloatViewMid) / f2);
        label257:
        if (this.mFirstExpPos >= j) {
          break label607;
        }
        k = j;
        this.mFirstExpPos = k;
        this.mSecondExpPos = k;
      }
    }
    for (;;)
    {
      if ((this.mFirstExpPos != i2) || (this.mSecondExpPos != m) || (this.mSlideFrac != f1)) {
        bool = true;
      }
      if (k != this.mFloatPos)
      {
        if (this.mDragListener != null) {
          this.mDragListener.drag(this.mFloatPos - j, k - j);
        }
        this.mFloatPos = k;
        bool = true;
      }
      return bool;
      i2 -= i + i1;
      j = getShuffleEdge(m, i2);
      i = j;
      k = m;
      i3 = n;
      if (this.mFloatViewMid >= j) {
        break label130;
      }
      n = j;
      i = j;
      j = m;
      break;
      int i5 = getCount();
      i2 = k;
      for (;;)
      {
        k = j;
        i3 = n;
        if (j >= i5) {
          break;
        }
        if (j == i5 - 1)
        {
          i = i2 + i1 + m;
          k = j;
          i3 = n;
          break;
        }
        i2 += i1 + m;
        i4 = getItemHeight(j + 1);
        m = getShuffleEdge(j + 1, i2);
        i = m;
        k = j;
        i3 = n;
        if (this.mFloatViewMid < m) {
          break;
        }
        n = m;
        j++;
        i = m;
        m = i4;
      }
      label521:
      n = i;
      i = i3;
      break label190;
      label530:
      if (this.mFloatViewMid < i - i3)
      {
        this.mFirstExpPos = k;
        this.mSecondExpPos = k;
        break label257;
      }
      this.mFirstExpPos = k;
      this.mSecondExpPos = (k + 1);
      this.mSlideFrac = (0.5F * (1.0F + (i - this.mFloatViewMid) / f2));
      break label257;
      label592:
      this.mFirstExpPos = k;
      this.mSecondExpPos = k;
      break label257;
      label607:
      if (this.mSecondExpPos >= getCount() - i4)
      {
        k = getCount() - i4 - 1;
        this.mFirstExpPos = k;
        this.mSecondExpPos = k;
      }
    }
  }
  
  private void updateScrollStarts()
  {
    int i = getPaddingTop();
    int j = getHeight() - i - getPaddingBottom();
    float f = j;
    this.mUpScrollStartYF = (i + this.mDragUpScrollStartFrac * f);
    this.mDownScrollStartYF = (i + (1.0F - this.mDragDownScrollStartFrac) * f);
    this.mUpScrollStartY = ((int)this.mUpScrollStartYF);
    this.mDownScrollStartY = ((int)this.mDownScrollStartYF);
    this.mDragUpScrollHeight = (this.mUpScrollStartYF - i);
    this.mDragDownScrollHeight = (i + j - this.mDownScrollStartYF);
  }
  
  public void cancelDrag()
  {
    if (this.mDragState == 4)
    {
      this.mDragScroller.stopScrolling(true);
      destroyFloatView();
      clearPositions();
      adjustAllItems();
      if (!this.mInTouchEvent) {
        break label41;
      }
    }
    label41:
    for (this.mDragState = 3;; this.mDragState = 0) {
      return;
    }
  }
  
  protected void dispatchDraw(Canvas paramCanvas)
  {
    super.dispatchDraw(paramCanvas);
    if (this.mDragState != 0)
    {
      if (this.mFirstExpPos != this.mSrcPos) {
        drawDivider(this.mFirstExpPos, paramCanvas);
      }
      if ((this.mSecondExpPos != this.mFirstExpPos) && (this.mSecondExpPos != this.mSrcPos)) {
        drawDivider(this.mSecondExpPos, paramCanvas);
      }
    }
    int i;
    int j;
    int n;
    float f;
    if (this.mFloatView != null)
    {
      i = this.mFloatView.getWidth();
      j = this.mFloatView.getHeight();
      int k = this.mFloatLoc.x;
      int m = getWidth();
      n = k;
      if (k < 0) {
        n = -k;
      }
      if (n >= m) {
        break label221;
      }
      f = (m - n) / m;
    }
    label221:
    for (f *= f;; f = 0.0F)
    {
      n = (int)(255.0F * this.mCurrFloatAlpha * f);
      paramCanvas.save();
      paramCanvas.translate(this.mFloatLoc.x, this.mFloatLoc.y);
      paramCanvas.clipRect(0, 0, i, j);
      paramCanvas.saveLayerAlpha(0.0F, 0.0F, i, j, n, 31);
      this.mFloatView.draw(paramCanvas);
      paramCanvas.restore();
      paramCanvas.restore();
      return;
    }
  }
  
  public float getFloatAlpha()
  {
    return this.mCurrFloatAlpha;
  }
  
  public ListAdapter getInputAdapter()
  {
    if (this.mAdapterWrapper == null) {}
    for (ListAdapter localListAdapter = null;; localListAdapter = this.mAdapterWrapper.getAdapter()) {
      return localListAdapter;
    }
  }
  
  public boolean isDragEnabled()
  {
    return this.mDragEnabled;
  }
  
  protected void layoutChildren()
  {
    super.layoutChildren();
    if (this.mFloatView != null)
    {
      if ((this.mFloatView.isLayoutRequested()) && (!this.mFloatViewOnMeasured)) {
        measureFloatView();
      }
      this.mFloatView.layout(0, 0, this.mFloatView.getMeasuredWidth(), this.mFloatView.getMeasuredHeight());
      this.mFloatViewOnMeasured = false;
    }
  }
  
  public boolean listViewIntercepted()
  {
    return this.mListViewIntercepted;
  }
  
  public void moveCheckState(int paramInt1, int paramInt2)
  {
    SparseBooleanArray localSparseBooleanArray = getCheckedItemPositions();
    int i = paramInt1;
    int j = paramInt2;
    if (paramInt2 < paramInt1)
    {
      i = paramInt2;
      j = paramInt1;
    }
    int k = j + 1;
    int[] arrayOfInt1 = new int[localSparseBooleanArray.size()];
    int[] arrayOfInt2 = new int[localSparseBooleanArray.size()];
    j = buildRunList(localSparseBooleanArray, i, k, arrayOfInt1, arrayOfInt2);
    if ((j == 1) && (arrayOfInt1[0] == arrayOfInt2[0])) {}
    for (;;)
    {
      return;
      if (paramInt1 < paramInt2) {
        for (paramInt1 = 0; paramInt1 != j; paramInt1++)
        {
          setItemChecked(rotate(arrayOfInt1[paramInt1], -1, i, k), true);
          setItemChecked(rotate(arrayOfInt2[paramInt1], -1, i, k), false);
        }
      } else {
        for (paramInt1 = 0; paramInt1 != j; paramInt1++)
        {
          setItemChecked(arrayOfInt1[paramInt1], false);
          setItemChecked(arrayOfInt2[paramInt1], true);
        }
      }
    }
  }
  
  public void moveItem(int paramInt1, int paramInt2)
  {
    if (this.mDropListener != null)
    {
      int i = getInputAdapter().getCount();
      if ((paramInt1 >= 0) && (paramInt1 < i) && (paramInt2 >= 0) && (paramInt2 < i)) {
        this.mDropListener.drop(paramInt1, paramInt2);
      }
    }
  }
  
  protected boolean onDragTouchEvent(MotionEvent paramMotionEvent)
  {
    paramMotionEvent.getAction();
    switch (paramMotionEvent.getAction() & 0xFF)
    {
    }
    for (;;)
    {
      return true;
      if (this.mDragState == 4) {
        cancelDrag();
      }
      doActionUpOrCancel();
      continue;
      if (this.mDragState == 4) {
        stopDrag(false);
      }
      doActionUpOrCancel();
      continue;
      continueDrag((int)paramMotionEvent.getX(), (int)paramMotionEvent.getY());
    }
  }
  
  protected void onDraw(Canvas paramCanvas)
  {
    super.onDraw(paramCanvas);
    if (this.mTrackDragSort) {
      this.mDragSortTracker.appendState();
    }
  }
  
  public boolean onInterceptTouchEvent(MotionEvent paramMotionEvent)
  {
    if (!this.mDragEnabled) {}
    int i;
    for (boolean bool1 = super.onInterceptTouchEvent(paramMotionEvent);; bool1 = true)
    {
      return bool1;
      saveTouchCoords(paramMotionEvent);
      this.mLastCallWasIntercept = true;
      i = paramMotionEvent.getAction() & 0xFF;
      if (i != 0) {
        break label60;
      }
      if (this.mDragState == 0) {
        break;
      }
      this.mIgnoreTouchEvent = true;
    }
    this.mInTouchEvent = true;
    label60:
    boolean bool2 = false;
    if (this.mFloatView != null) {
      bool2 = true;
    }
    for (;;)
    {
      if (i != 1)
      {
        bool1 = bool2;
        if (i != 3) {
          break;
        }
      }
      this.mInTouchEvent = false;
      bool1 = bool2;
      break;
      if (super.onInterceptTouchEvent(paramMotionEvent))
      {
        this.mListViewIntercepted = true;
        bool2 = true;
      }
      switch (i)
      {
      case 2: 
      default: 
        if (bool2) {
          this.mCancelMethod = 1;
        }
        break;
      case 1: 
      case 3: 
        doActionUpOrCancel();
        continue;
        this.mCancelMethod = 2;
      }
    }
  }
  
  protected void onMeasure(int paramInt1, int paramInt2)
  {
    super.onMeasure(paramInt1, paramInt2);
    if (this.mFloatView != null)
    {
      if (this.mFloatView.isLayoutRequested()) {
        measureFloatView();
      }
      this.mFloatViewOnMeasured = true;
    }
    this.mWidthMeasureSpec = paramInt1;
  }
  
  protected void onSizeChanged(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    super.onSizeChanged(paramInt1, paramInt2, paramInt3, paramInt4);
    updateScrollStarts();
  }
  
  public boolean onTouchEvent(MotionEvent paramMotionEvent)
  {
    boolean bool1;
    if (this.mIgnoreTouchEvent)
    {
      this.mIgnoreTouchEvent = false;
      bool1 = false;
    }
    for (;;)
    {
      return bool1;
      if (!this.mDragEnabled)
      {
        bool1 = super.onTouchEvent(paramMotionEvent);
      }
      else
      {
        bool1 = false;
        boolean bool2 = this.mLastCallWasIntercept;
        this.mLastCallWasIntercept = false;
        if (!bool2) {
          saveTouchCoords(paramMotionEvent);
        }
        if (this.mDragState == 4)
        {
          onDragTouchEvent(paramMotionEvent);
          bool1 = true;
        }
        else
        {
          bool2 = bool1;
          if (this.mDragState == 0)
          {
            bool2 = bool1;
            if (super.onTouchEvent(paramMotionEvent)) {
              bool2 = true;
            }
          }
          switch (paramMotionEvent.getAction() & 0xFF)
          {
          case 2: 
          default: 
            bool1 = bool2;
            if (bool2)
            {
              this.mCancelMethod = 1;
              bool1 = bool2;
            }
            break;
          case 1: 
          case 3: 
            doActionUpOrCancel();
            bool1 = bool2;
          }
        }
      }
    }
  }
  
  public void removeCheckState(int paramInt)
  {
    SparseBooleanArray localSparseBooleanArray = getCheckedItemPositions();
    if (localSparseBooleanArray.size() == 0) {}
    for (;;)
    {
      return;
      int[] arrayOfInt1 = new int[localSparseBooleanArray.size()];
      int[] arrayOfInt2 = new int[localSparseBooleanArray.size()];
      int i = localSparseBooleanArray.keyAt(localSparseBooleanArray.size() - 1) + 1;
      int j = buildRunList(localSparseBooleanArray, paramInt, i, arrayOfInt1, arrayOfInt2);
      for (int k = 0; k != j; k++)
      {
        if ((arrayOfInt1[k] != paramInt) && ((arrayOfInt2[k] >= arrayOfInt1[k]) || (arrayOfInt2[k] <= paramInt))) {
          setItemChecked(rotate(arrayOfInt1[k], -1, paramInt, i), true);
        }
        setItemChecked(rotate(arrayOfInt2[k], -1, paramInt, i), false);
      }
    }
  }
  
  public void removeItem(int paramInt)
  {
    this.mUseRemoveVelocity = false;
    removeItem(paramInt, 0.0F);
  }
  
  public void removeItem(int paramInt, float paramFloat)
  {
    if ((this.mDragState == 0) || (this.mDragState == 4))
    {
      if (this.mDragState == 0)
      {
        this.mSrcPos = (getHeaderViewsCount() + paramInt);
        this.mFirstExpPos = this.mSrcPos;
        this.mSecondExpPos = this.mSrcPos;
        this.mFloatPos = this.mSrcPos;
        View localView = getChildAt(this.mSrcPos - getFirstVisiblePosition());
        if (localView != null) {
          localView.setVisibility(4);
        }
      }
      this.mDragState = 1;
      this.mRemoveVelocityX = paramFloat;
      if (this.mInTouchEvent) {}
      switch (this.mCancelMethod)
      {
      default: 
        if (this.mRemoveAnimator != null) {
          this.mRemoveAnimator.start();
        }
        break;
      }
    }
    for (;;)
    {
      return;
      super.onTouchEvent(this.mCancelEvent);
      break;
      super.onInterceptTouchEvent(this.mCancelEvent);
      break;
      doRemoveItem(paramInt);
    }
  }
  
  public void requestLayout()
  {
    if (!this.mBlockLayoutRequests) {
      super.requestLayout();
    }
  }
  
  public void setAdapter(ListAdapter paramListAdapter)
  {
    if (paramListAdapter != null)
    {
      this.mAdapterWrapper = new AdapterWrapper(paramListAdapter);
      paramListAdapter.registerDataSetObserver(this.mObserver);
      if ((paramListAdapter instanceof DropListener)) {
        setDropListener((DropListener)paramListAdapter);
      }
      if ((paramListAdapter instanceof DragListener)) {
        setDragListener((DragListener)paramListAdapter);
      }
      if ((paramListAdapter instanceof RemoveListener)) {
        setRemoveListener((RemoveListener)paramListAdapter);
      }
    }
    for (;;)
    {
      super.setAdapter(this.mAdapterWrapper);
      return;
      this.mAdapterWrapper = null;
    }
  }
  
  public void setDragEnabled(boolean paramBoolean)
  {
    this.mDragEnabled = paramBoolean;
  }
  
  public void setDragListener(DragListener paramDragListener)
  {
    this.mDragListener = paramDragListener;
  }
  
  public void setDragScrollProfile(DragScrollProfile paramDragScrollProfile)
  {
    if (paramDragScrollProfile != null) {
      this.mScrollProfile = paramDragScrollProfile;
    }
  }
  
  public void setDragScrollStart(float paramFloat)
  {
    setDragScrollStarts(paramFloat, paramFloat);
  }
  
  public void setDragScrollStarts(float paramFloat1, float paramFloat2)
  {
    if (paramFloat2 > 0.5F)
    {
      this.mDragDownScrollStartFrac = 0.5F;
      if (paramFloat1 <= 0.5F) {
        break label46;
      }
    }
    label46:
    for (this.mDragUpScrollStartFrac = 0.5F;; this.mDragUpScrollStartFrac = paramFloat1)
    {
      if (getHeight() != 0) {
        updateScrollStarts();
      }
      return;
      this.mDragDownScrollStartFrac = paramFloat2;
      break;
    }
  }
  
  public void setDragSortListener(DragSortListener paramDragSortListener)
  {
    setDropListener(paramDragSortListener);
    setDragListener(paramDragSortListener);
    setRemoveListener(paramDragSortListener);
  }
  
  public void setDropListener(DropListener paramDropListener)
  {
    this.mDropListener = paramDropListener;
  }
  
  public void setFloatAlpha(float paramFloat)
  {
    this.mCurrFloatAlpha = paramFloat;
  }
  
  public void setFloatViewManager(FloatViewManager paramFloatViewManager)
  {
    this.mFloatViewManager = paramFloatViewManager;
  }
  
  public void setMaxScrollSpeed(float paramFloat)
  {
    this.mMaxScrollSpeed = paramFloat;
  }
  
  public void setRemoveListener(RemoveListener paramRemoveListener)
  {
    this.mRemoveListener = paramRemoveListener;
  }
  
  public boolean startDrag(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    boolean bool1 = false;
    boolean bool2 = bool1;
    if (this.mInTouchEvent)
    {
      if (this.mFloatViewManager != null) {
        break label28;
      }
      bool2 = bool1;
    }
    for (;;)
    {
      return bool2;
      label28:
      View localView = this.mFloatViewManager.onCreateFloatView(paramInt1);
      bool2 = bool1;
      if (localView != null) {
        bool2 = startDrag(paramInt1, localView, paramInt2, paramInt3, paramInt4);
      }
    }
  }
  
  public boolean startDrag(int paramInt1, View paramView, int paramInt2, int paramInt3, int paramInt4)
  {
    boolean bool1 = true;
    boolean bool2;
    if ((this.mDragState != 0) || (!this.mInTouchEvent) || (this.mFloatView != null) || (paramView == null) || (!this.mDragEnabled))
    {
      bool2 = false;
      return bool2;
    }
    if (getParent() != null) {
      getParent().requestDisallowInterceptTouchEvent(true);
    }
    paramInt1 += getHeaderViewsCount();
    this.mFirstExpPos = paramInt1;
    this.mSecondExpPos = paramInt1;
    this.mSrcPos = paramInt1;
    this.mFloatPos = paramInt1;
    this.mDragState = 4;
    this.mDragFlags = 0;
    this.mDragFlags |= paramInt2;
    this.mFloatView = paramView;
    measureFloatView();
    this.mDragDeltaX = paramInt3;
    this.mDragDeltaY = paramInt4;
    this.mDragStartY = this.mY;
    this.mFloatLoc.x = (this.mX - this.mDragDeltaX);
    this.mFloatLoc.y = (this.mY - this.mDragDeltaY);
    paramView = getChildAt(this.mSrcPos - getFirstVisiblePosition());
    if (paramView != null) {
      paramView.setVisibility(4);
    }
    if (this.mTrackDragSort) {
      this.mDragSortTracker.startTracking();
    }
    switch (this.mCancelMethod)
    {
    }
    for (;;)
    {
      requestLayout();
      bool2 = bool1;
      if (this.mLiftAnimator == null) {
        break;
      }
      this.mLiftAnimator.start();
      bool2 = bool1;
      break;
      super.onTouchEvent(this.mCancelEvent);
      continue;
      super.onInterceptTouchEvent(this.mCancelEvent);
    }
  }
  
  public boolean stopDrag(boolean paramBoolean)
  {
    this.mUseRemoveVelocity = false;
    return stopDrag(paramBoolean, 0.0F);
  }
  
  public boolean stopDrag(boolean paramBoolean, float paramFloat)
  {
    boolean bool = true;
    if (this.mFloatView != null)
    {
      this.mDragScroller.stopScrolling(true);
      if (paramBoolean)
      {
        removeItem(this.mSrcPos - getHeaderViewsCount(), paramFloat);
        paramBoolean = bool;
        if (this.mTrackDragSort) {
          this.mDragSortTracker.stopTracking();
        }
      }
    }
    for (paramBoolean = bool;; paramBoolean = false)
    {
      return paramBoolean;
      if (this.mDropAnimator != null)
      {
        this.mDropAnimator.start();
        break;
      }
      dropFloatView();
      break;
    }
  }
  
  public boolean stopDragWithVelocity(boolean paramBoolean, float paramFloat)
  {
    this.mUseRemoveVelocity = true;
    return stopDrag(paramBoolean, paramFloat);
  }
  
  private class AdapterWrapper
    extends BaseAdapter
  {
    private ListAdapter mAdapter;
    
    public AdapterWrapper(ListAdapter paramListAdapter)
    {
      this.mAdapter = paramListAdapter;
      this.mAdapter.registerDataSetObserver(new DataSetObserver()
      {
        public void onChanged()
        {
          DragSortListView.AdapterWrapper.this.notifyDataSetChanged();
        }
        
        public void onInvalidated()
        {
          DragSortListView.AdapterWrapper.this.notifyDataSetInvalidated();
        }
      });
    }
    
    public boolean areAllItemsEnabled()
    {
      return this.mAdapter.areAllItemsEnabled();
    }
    
    public ListAdapter getAdapter()
    {
      return this.mAdapter;
    }
    
    public int getCount()
    {
      return this.mAdapter.getCount();
    }
    
    public Object getItem(int paramInt)
    {
      return this.mAdapter.getItem(paramInt);
    }
    
    public long getItemId(int paramInt)
    {
      return this.mAdapter.getItemId(paramInt);
    }
    
    public int getItemViewType(int paramInt)
    {
      return this.mAdapter.getItemViewType(paramInt);
    }
    
    public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
    {
      if (paramView != null)
      {
        paramViewGroup = (DragSortItemView)paramView;
        View localView1 = paramViewGroup.getChildAt(0);
        View localView2 = this.mAdapter.getView(paramInt, localView1, DragSortListView.this);
        paramView = paramViewGroup;
        if (localView2 != localView1)
        {
          if (localView1 != null) {
            paramViewGroup.removeViewAt(0);
          }
          paramViewGroup.addView(localView2);
          paramView = paramViewGroup;
        }
        DragSortListView.this.adjustItem(DragSortListView.this.getHeaderViewsCount() + paramInt, paramView, true);
        return paramView;
      }
      paramViewGroup = this.mAdapter.getView(paramInt, null, DragSortListView.this);
      if ((paramViewGroup instanceof Checkable)) {}
      for (paramView = new DragSortItemViewCheckable(DragSortListView.this.getContext());; paramView = new DragSortItemView(DragSortListView.this.getContext()))
      {
        paramView.setLayoutParams(new AbsListView.LayoutParams(-1, -2));
        paramView.addView(paramViewGroup);
        break;
      }
    }
    
    public int getViewTypeCount()
    {
      return this.mAdapter.getViewTypeCount();
    }
    
    public boolean hasStableIds()
    {
      return this.mAdapter.hasStableIds();
    }
    
    public boolean isEmpty()
    {
      return this.mAdapter.isEmpty();
    }
    
    public boolean isEnabled(int paramInt)
    {
      return this.mAdapter.isEnabled(paramInt);
    }
  }
  
  public static abstract interface DragListener
  {
    public abstract void drag(int paramInt1, int paramInt2);
  }
  
  public static abstract interface DragScrollProfile
  {
    public abstract float getSpeed(float paramFloat, long paramLong);
  }
  
  private class DragScroller
    implements Runnable
  {
    public static final int DOWN = 1;
    public static final int STOP = -1;
    public static final int UP = 0;
    private float dt;
    private int dy;
    private boolean mAbort;
    private long mCurrTime;
    private int mFirstFooter;
    private int mLastHeader;
    private long mPrevTime;
    private float mScrollSpeed;
    private boolean mScrolling = false;
    private int scrollDir;
    private long tStart;
    
    public DragScroller() {}
    
    public int getScrollDir()
    {
      if (this.mScrolling) {}
      for (int i = this.scrollDir;; i = -1) {
        return i;
      }
    }
    
    public boolean isScrolling()
    {
      return this.mScrolling;
    }
    
    public void run()
    {
      if (this.mAbort) {
        this.mScrolling = false;
      }
      int i;
      int j;
      int k;
      int m;
      int n;
      int i1;
      int i2;
      View localView;
      for (;;)
      {
        return;
        i = DragSortListView.this.getFirstVisiblePosition();
        j = DragSortListView.this.getLastVisiblePosition();
        k = DragSortListView.this.getCount();
        m = DragSortListView.this.getPaddingTop();
        n = DragSortListView.this.getHeight() - m - DragSortListView.this.getPaddingBottom();
        i1 = Math.min(DragSortListView.this.mY, DragSortListView.this.mFloatViewMid + DragSortListView.this.mFloatViewHeightHalf);
        i2 = Math.max(DragSortListView.this.mY, DragSortListView.this.mFloatViewMid - DragSortListView.this.mFloatViewHeightHalf);
        if (this.scrollDir != 0) {
          break label389;
        }
        localView = DragSortListView.this.getChildAt(0);
        if (localView == null)
        {
          this.mScrolling = false;
        }
        else
        {
          if ((i != 0) || (localView.getTop() != m)) {
            break;
          }
          this.mScrolling = false;
        }
      }
      this.mScrollSpeed = DragSortListView.this.mScrollProfile.getSpeed((DragSortListView.this.mUpScrollStartYF - i2) / DragSortListView.this.mDragUpScrollHeight, this.mPrevTime);
      label211:
      this.mCurrTime = SystemClock.uptimeMillis();
      this.dt = ((float)(this.mCurrTime - this.mPrevTime));
      this.dy = Math.round(this.mScrollSpeed * this.dt);
      if (this.dy >= 0)
      {
        this.dy = Math.min(n, this.dy);
        j = i;
      }
      for (;;)
      {
        localView = DragSortListView.this.getChildAt(j - i);
        i2 = localView.getTop() + this.dy;
        i = i2;
        if (j == 0)
        {
          i = i2;
          if (i2 > m) {
            i = m;
          }
        }
        DragSortListView.access$2602(DragSortListView.this, true);
        DragSortListView.this.setSelectionFromTop(j, i - m);
        DragSortListView.this.layoutChildren();
        DragSortListView.this.invalidate();
        DragSortListView.access$2602(DragSortListView.this, false);
        DragSortListView.this.doDragFloatView(j, localView, false);
        this.mPrevTime = this.mCurrTime;
        DragSortListView.this.post(this);
        break;
        label389:
        localView = DragSortListView.this.getChildAt(j - i);
        if (localView == null)
        {
          this.mScrolling = false;
          break;
        }
        if ((j == k - 1) && (localView.getBottom() <= n + m))
        {
          this.mScrolling = false;
          break;
        }
        this.mScrollSpeed = (-DragSortListView.this.mScrollProfile.getSpeed((i1 - DragSortListView.this.mDownScrollStartYF) / DragSortListView.this.mDragDownScrollHeight, this.mPrevTime));
        break label211;
        this.dy = Math.max(-n, this.dy);
      }
    }
    
    public void startScrolling(int paramInt)
    {
      if (!this.mScrolling)
      {
        this.mAbort = false;
        this.mScrolling = true;
        this.tStart = SystemClock.uptimeMillis();
        this.mPrevTime = this.tStart;
        this.scrollDir = paramInt;
        DragSortListView.this.post(this);
      }
    }
    
    public void stopScrolling(boolean paramBoolean)
    {
      if (paramBoolean)
      {
        DragSortListView.this.removeCallbacks(this);
        this.mScrolling = false;
      }
      for (;;)
      {
        return;
        this.mAbort = true;
      }
    }
  }
  
  public static abstract interface DragSortListener
    extends DragSortListView.DropListener, DragSortListView.DragListener, DragSortListView.RemoveListener
  {}
  
  private class DragSortTracker
  {
    StringBuilder mBuilder = new StringBuilder();
    File mFile = new File(Environment.getExternalStorageDirectory(), "dslv_state.txt");
    private int mNumFlushes = 0;
    private int mNumInBuffer = 0;
    private boolean mTracking = false;
    
    public DragSortTracker()
    {
      if (!this.mFile.exists()) {}
      try
      {
        this.mFile.createNewFile();
        Log.d("mobeta", "file created");
        return;
      }
      catch (IOException this$1)
      {
        for (;;)
        {
          Log.w("mobeta", "Could not create dslv_state.txt");
          Log.d("mobeta", DragSortListView.this.getMessage());
        }
      }
    }
    
    public void appendState()
    {
      if (!this.mTracking) {}
      for (;;)
      {
        return;
        this.mBuilder.append("<DSLVState>\n");
        int i = DragSortListView.this.getChildCount();
        int j = DragSortListView.this.getFirstVisiblePosition();
        this.mBuilder.append("    <Positions>");
        for (int k = 0; k < i; k++) {
          this.mBuilder.append(j + k).append(",");
        }
        this.mBuilder.append("</Positions>\n");
        this.mBuilder.append("    <Tops>");
        for (k = 0; k < i; k++) {
          this.mBuilder.append(DragSortListView.this.getChildAt(k).getTop()).append(",");
        }
        this.mBuilder.append("</Tops>\n");
        this.mBuilder.append("    <Bottoms>");
        for (k = 0; k < i; k++) {
          this.mBuilder.append(DragSortListView.this.getChildAt(k).getBottom()).append(",");
        }
        this.mBuilder.append("</Bottoms>\n");
        this.mBuilder.append("    <FirstExpPos>").append(DragSortListView.this.mFirstExpPos).append("</FirstExpPos>\n");
        this.mBuilder.append("    <FirstExpBlankHeight>").append(DragSortListView.this.getItemHeight(DragSortListView.this.mFirstExpPos) - DragSortListView.this.getChildHeight(DragSortListView.this.mFirstExpPos)).append("</FirstExpBlankHeight>\n");
        this.mBuilder.append("    <SecondExpPos>").append(DragSortListView.this.mSecondExpPos).append("</SecondExpPos>\n");
        this.mBuilder.append("    <SecondExpBlankHeight>").append(DragSortListView.this.getItemHeight(DragSortListView.this.mSecondExpPos) - DragSortListView.this.getChildHeight(DragSortListView.this.mSecondExpPos)).append("</SecondExpBlankHeight>\n");
        this.mBuilder.append("    <SrcPos>").append(DragSortListView.this.mSrcPos).append("</SrcPos>\n");
        this.mBuilder.append("    <SrcHeight>").append(DragSortListView.this.mFloatViewHeight + DragSortListView.this.getDividerHeight()).append("</SrcHeight>\n");
        this.mBuilder.append("    <ViewHeight>").append(DragSortListView.this.getHeight()).append("</ViewHeight>\n");
        this.mBuilder.append("    <LastY>").append(DragSortListView.this.mLastY).append("</LastY>\n");
        this.mBuilder.append("    <FloatY>").append(DragSortListView.this.mFloatViewMid).append("</FloatY>\n");
        this.mBuilder.append("    <ShuffleEdges>");
        for (k = 0; k < i; k++) {
          this.mBuilder.append(DragSortListView.this.getShuffleEdge(j + k, DragSortListView.this.getChildAt(k).getTop())).append(",");
        }
        this.mBuilder.append("</ShuffleEdges>\n");
        this.mBuilder.append("</DSLVState>\n");
        this.mNumInBuffer += 1;
        if (this.mNumInBuffer > 1000)
        {
          flush();
          this.mNumInBuffer = 0;
        }
      }
    }
    
    public void flush()
    {
      if (!this.mTracking) {}
      for (;;)
      {
        return;
        boolean bool = true;
        try
        {
          if (this.mNumFlushes == 0) {
            bool = false;
          }
          FileWriter localFileWriter = new java/io/FileWriter;
          localFileWriter.<init>(this.mFile, bool);
          localFileWriter.write(this.mBuilder.toString());
          this.mBuilder.delete(0, this.mBuilder.length());
          localFileWriter.flush();
          localFileWriter.close();
          this.mNumFlushes += 1;
        }
        catch (IOException localIOException) {}
      }
    }
    
    public void startTracking()
    {
      this.mBuilder.append("<DSLVStates>\n");
      this.mNumFlushes = 0;
      this.mTracking = true;
    }
    
    public void stopTracking()
    {
      if (this.mTracking)
      {
        this.mBuilder.append("</DSLVStates>\n");
        flush();
        this.mTracking = false;
      }
    }
  }
  
  private class DropAnimator
    extends DragSortListView.SmoothAnimator
  {
    private int mDropPos;
    private float mInitDeltaX;
    private float mInitDeltaY;
    private int srcPos;
    
    public DropAnimator(float paramFloat, int paramInt)
    {
      super(paramFloat, paramInt);
    }
    
    private int getTargetY()
    {
      int i = DragSortListView.this.getFirstVisiblePosition();
      int j = (DragSortListView.this.mItemHeightCollapsed + DragSortListView.this.getDividerHeight()) / 2;
      View localView = DragSortListView.this.getChildAt(this.mDropPos - i);
      i = -1;
      if (localView != null) {
        if (this.mDropPos == this.srcPos) {
          i = localView.getTop();
        }
      }
      for (;;)
      {
        return i;
        if (this.mDropPos < this.srcPos)
        {
          i = localView.getTop() - j;
        }
        else
        {
          i = localView.getBottom() + j - DragSortListView.this.mFloatViewHeight;
          continue;
          cancel();
        }
      }
    }
    
    public void onStart()
    {
      this.mDropPos = DragSortListView.this.mFloatPos;
      this.srcPos = DragSortListView.this.mSrcPos;
      DragSortListView.access$102(DragSortListView.this, 2);
      this.mInitDeltaY = (DragSortListView.this.mFloatLoc.y - getTargetY());
      this.mInitDeltaX = (DragSortListView.this.mFloatLoc.x - DragSortListView.this.getPaddingLeft());
    }
    
    public void onStop()
    {
      DragSortListView.this.dropFloatView();
    }
    
    public void onUpdate(float paramFloat1, float paramFloat2)
    {
      int i = getTargetY();
      int j = DragSortListView.this.getPaddingLeft();
      float f = DragSortListView.this.mFloatLoc.y - i;
      paramFloat1 = DragSortListView.this.mFloatLoc.x - j;
      paramFloat2 = 1.0F - paramFloat2;
      if ((paramFloat2 < Math.abs(f / this.mInitDeltaY)) || (paramFloat2 < Math.abs(paramFloat1 / this.mInitDeltaX)))
      {
        DragSortListView.this.mFloatLoc.y = ((int)(this.mInitDeltaY * paramFloat2) + i);
        DragSortListView.this.mFloatLoc.x = (DragSortListView.this.getPaddingLeft() + (int)(this.mInitDeltaX * paramFloat2));
        DragSortListView.this.doDragFloatView(true);
      }
    }
  }
  
  public static abstract interface DropListener
  {
    public abstract void drop(int paramInt1, int paramInt2);
  }
  
  public static abstract interface FloatViewManager
  {
    public abstract View onCreateFloatView(int paramInt);
    
    public abstract void onDestroyFloatView(View paramView);
    
    public abstract void onDragFloatView(View paramView, Point paramPoint1, Point paramPoint2);
  }
  
  private class HeightCache
  {
    private SparseIntArray mMap;
    private int mMaxSize;
    private ArrayList<Integer> mOrder;
    
    public HeightCache(int paramInt)
    {
      this.mMap = new SparseIntArray(paramInt);
      this.mOrder = new ArrayList(paramInt);
      this.mMaxSize = paramInt;
    }
    
    public void add(int paramInt1, int paramInt2)
    {
      int i = this.mMap.get(paramInt1, -1);
      if (i != paramInt2)
      {
        if (i != -1) {
          break label77;
        }
        if (this.mMap.size() == this.mMaxSize) {
          this.mMap.delete(((Integer)this.mOrder.remove(0)).intValue());
        }
      }
      for (;;)
      {
        this.mMap.put(paramInt1, paramInt2);
        this.mOrder.add(Integer.valueOf(paramInt1));
        return;
        label77:
        this.mOrder.remove(Integer.valueOf(paramInt1));
      }
    }
    
    public void clear()
    {
      this.mMap.clear();
      this.mOrder.clear();
    }
    
    public int get(int paramInt)
    {
      return this.mMap.get(paramInt, -1);
    }
  }
  
  private class LiftAnimator
    extends DragSortListView.SmoothAnimator
  {
    private float mFinalDragDeltaY;
    private float mInitDragDeltaY;
    
    public LiftAnimator(float paramFloat, int paramInt)
    {
      super(paramFloat, paramInt);
    }
    
    public void onStart()
    {
      this.mInitDragDeltaY = DragSortListView.this.mDragDeltaY;
      this.mFinalDragDeltaY = DragSortListView.this.mFloatViewHeightHalf;
    }
    
    public void onUpdate(float paramFloat1, float paramFloat2)
    {
      if (DragSortListView.this.mDragState != 4) {
        cancel();
      }
      for (;;)
      {
        return;
        DragSortListView.access$302(DragSortListView.this, (int)(this.mFinalDragDeltaY * paramFloat2 + (1.0F - paramFloat2) * this.mInitDragDeltaY));
        DragSortListView.this.mFloatLoc.y = (DragSortListView.this.mY - DragSortListView.this.mDragDeltaY);
        DragSortListView.this.doDragFloatView(true);
      }
    }
  }
  
  private class RemoveAnimator
    extends DragSortListView.SmoothAnimator
  {
    private int mFirstChildHeight = -1;
    private int mFirstPos;
    private float mFirstStartBlank;
    private float mFloatLocX;
    private int mSecondChildHeight = -1;
    private int mSecondPos;
    private float mSecondStartBlank;
    private int srcPos;
    
    public RemoveAnimator(float paramFloat, int paramInt)
    {
      super(paramFloat, paramInt);
    }
    
    public void onStart()
    {
      int i = -1;
      this.mFirstChildHeight = -1;
      this.mSecondChildHeight = -1;
      this.mFirstPos = DragSortListView.this.mFirstExpPos;
      this.mSecondPos = DragSortListView.this.mSecondExpPos;
      this.srcPos = DragSortListView.this.mSrcPos;
      DragSortListView.access$102(DragSortListView.this, 1);
      this.mFloatLocX = DragSortListView.this.mFloatLoc.x;
      float f;
      if (DragSortListView.this.mUseRemoveVelocity)
      {
        f = 2.0F * DragSortListView.this.getWidth();
        if (DragSortListView.this.mRemoveVelocityX == 0.0F)
        {
          DragSortListView localDragSortListView = DragSortListView.this;
          if (this.mFloatLocX < 0.0F) {
            DragSortListView.access$1602(localDragSortListView, i * f);
          }
        }
      }
      for (;;)
      {
        return;
        i = 1;
        break;
        f *= 2.0F;
        if ((DragSortListView.this.mRemoveVelocityX < 0.0F) && (DragSortListView.this.mRemoveVelocityX > -f))
        {
          DragSortListView.access$1602(DragSortListView.this, -f);
        }
        else if ((DragSortListView.this.mRemoveVelocityX > 0.0F) && (DragSortListView.this.mRemoveVelocityX < f))
        {
          DragSortListView.access$1602(DragSortListView.this, f);
          continue;
          DragSortListView.this.destroyFloatView();
        }
      }
    }
    
    public void onStop()
    {
      DragSortListView.this.doRemoveItem();
    }
    
    public void onUpdate(float paramFloat1, float paramFloat2)
    {
      float f1 = 1.0F - paramFloat2;
      int i = DragSortListView.this.getFirstVisiblePosition();
      View localView = DragSortListView.this.getChildAt(this.mFirstPos - i);
      float f2;
      if (DragSortListView.this.mUseRemoveVelocity)
      {
        f2 = (float)(SystemClock.uptimeMillis() - this.mStartTime) / 1000.0F;
        if (f2 != 0.0F) {}
      }
      for (;;)
      {
        return;
        paramFloat1 = DragSortListView.this.mRemoveVelocityX;
        int j = DragSortListView.this.getWidth();
        Object localObject = DragSortListView.this;
        paramFloat2 = DragSortListView.this.mRemoveVelocityX;
        if (DragSortListView.this.mRemoveVelocityX > 0.0F) {}
        for (int k = 1;; k = -1)
        {
          DragSortListView.access$1602((DragSortListView)localObject, k * f2 * j + paramFloat2);
          this.mFloatLocX += paramFloat1 * f2;
          DragSortListView.this.mFloatLoc.x = ((int)this.mFloatLocX);
          if ((this.mFloatLocX >= j) || (this.mFloatLocX <= -j)) {
            break label200;
          }
          this.mStartTime = SystemClock.uptimeMillis();
          DragSortListView.this.doDragFloatView(true);
          break;
        }
        label200:
        if (localView != null)
        {
          if (this.mFirstChildHeight == -1)
          {
            this.mFirstChildHeight = DragSortListView.this.getChildHeight(this.mFirstPos, localView, false);
            this.mFirstStartBlank = (localView.getHeight() - this.mFirstChildHeight);
          }
          k = Math.max((int)(this.mFirstStartBlank * f1), 1);
          localObject = localView.getLayoutParams();
          ((ViewGroup.LayoutParams)localObject).height = (this.mFirstChildHeight + k);
          localView.setLayoutParams((ViewGroup.LayoutParams)localObject);
        }
        if (this.mSecondPos != this.mFirstPos)
        {
          localView = DragSortListView.this.getChildAt(this.mSecondPos - i);
          if (localView != null)
          {
            if (this.mSecondChildHeight == -1)
            {
              this.mSecondChildHeight = DragSortListView.this.getChildHeight(this.mSecondPos, localView, false);
              this.mSecondStartBlank = (localView.getHeight() - this.mSecondChildHeight);
            }
            k = Math.max((int)(this.mSecondStartBlank * f1), 1);
            localObject = localView.getLayoutParams();
            ((ViewGroup.LayoutParams)localObject).height = (this.mSecondChildHeight + k);
            localView.setLayoutParams((ViewGroup.LayoutParams)localObject);
          }
        }
      }
    }
  }
  
  public static abstract interface RemoveListener
  {
    public abstract void remove(int paramInt);
  }
  
  private class SmoothAnimator
    implements Runnable
  {
    private float mA;
    private float mAlpha;
    private float mB;
    private float mC;
    private boolean mCanceled;
    private float mD;
    private float mDurationF;
    protected long mStartTime;
    
    public SmoothAnimator(float paramFloat, int paramInt)
    {
      this.mAlpha = paramFloat;
      this.mDurationF = paramInt;
      paramFloat = 1.0F / (this.mAlpha * 2.0F * (1.0F - this.mAlpha));
      this.mD = paramFloat;
      this.mA = paramFloat;
      this.mB = (this.mAlpha / ((this.mAlpha - 1.0F) * 2.0F));
      this.mC = (1.0F / (1.0F - this.mAlpha));
    }
    
    public void cancel()
    {
      this.mCanceled = true;
    }
    
    public void onStart() {}
    
    public void onStop() {}
    
    public void onUpdate(float paramFloat1, float paramFloat2) {}
    
    public void run()
    {
      if (this.mCanceled) {}
      for (;;)
      {
        return;
        float f = (float)(SystemClock.uptimeMillis() - this.mStartTime) / this.mDurationF;
        if (f >= 1.0F)
        {
          onUpdate(1.0F, 1.0F);
          onStop();
        }
        else
        {
          onUpdate(f, transform(f));
          DragSortListView.this.post(this);
        }
      }
    }
    
    public void start()
    {
      this.mStartTime = SystemClock.uptimeMillis();
      this.mCanceled = false;
      onStart();
      DragSortListView.this.post(this);
    }
    
    public float transform(float paramFloat)
    {
      if (paramFloat < this.mAlpha) {
        paramFloat = this.mA * paramFloat * paramFloat;
      }
      for (;;)
      {
        return paramFloat;
        if (paramFloat < 1.0F - this.mAlpha) {
          paramFloat = this.mB + this.mC * paramFloat;
        } else {
          paramFloat = 1.0F - this.mD * (paramFloat - 1.0F) * (paramFloat - 1.0F);
        }
      }
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobeta/android/dslv/DragSortListView.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */