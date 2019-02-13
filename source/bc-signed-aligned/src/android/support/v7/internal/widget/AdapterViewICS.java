package android.support.v7.internal.widget;

import android.content.Context;
import android.database.DataSetObserver;
import android.os.Parcelable;
import android.os.SystemClock;
import android.util.AttributeSet;
import android.util.SparseArray;
import android.view.ContextMenu.ContextMenuInfo;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewDebug.CapturedViewProperty;
import android.view.ViewDebug.ExportedProperty;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.view.accessibility.AccessibilityEvent;
import android.widget.Adapter;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;

abstract class AdapterViewICS<T extends Adapter>
  extends ViewGroup
{
  public static final int INVALID_POSITION = -1;
  public static final long INVALID_ROW_ID = Long.MIN_VALUE;
  static final int ITEM_VIEW_TYPE_HEADER_OR_FOOTER = -2;
  static final int ITEM_VIEW_TYPE_IGNORE = -1;
  static final int SYNC_FIRST_POSITION = 1;
  static final int SYNC_MAX_DURATION_MILLIS = 100;
  static final int SYNC_SELECTED_POSITION = 0;
  boolean mBlockLayoutRequests = false;
  boolean mDataChanged;
  private boolean mDesiredFocusableInTouchModeState;
  private boolean mDesiredFocusableState;
  private View mEmptyView;
  @ViewDebug.ExportedProperty(category="scrolling")
  int mFirstPosition = 0;
  boolean mInLayout = false;
  @ViewDebug.ExportedProperty(category="list")
  int mItemCount;
  private int mLayoutHeight;
  boolean mNeedSync = false;
  @ViewDebug.ExportedProperty(category="list")
  int mNextSelectedPosition = -1;
  long mNextSelectedRowId = Long.MIN_VALUE;
  int mOldItemCount;
  int mOldSelectedPosition = -1;
  long mOldSelectedRowId = Long.MIN_VALUE;
  OnItemClickListener mOnItemClickListener;
  OnItemLongClickListener mOnItemLongClickListener;
  OnItemSelectedListener mOnItemSelectedListener;
  @ViewDebug.ExportedProperty(category="list")
  int mSelectedPosition = -1;
  long mSelectedRowId = Long.MIN_VALUE;
  private AdapterViewICS<T>.SelectionNotifier mSelectionNotifier;
  int mSpecificTop;
  long mSyncHeight;
  int mSyncMode;
  int mSyncPosition;
  long mSyncRowId = Long.MIN_VALUE;
  
  AdapterViewICS(Context paramContext)
  {
    super(paramContext);
  }
  
  AdapterViewICS(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
  }
  
  AdapterViewICS(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
  }
  
  private void fireOnSelected()
  {
    if (this.mOnItemSelectedListener == null) {}
    for (;;)
    {
      return;
      int i = getSelectedItemPosition();
      if (i >= 0)
      {
        View localView = getSelectedView();
        this.mOnItemSelectedListener.onItemSelected(this, localView, i, getAdapter().getItemId(i));
      }
      else
      {
        this.mOnItemSelectedListener.onNothingSelected(this);
      }
    }
  }
  
  private void updateEmptyStatus(boolean paramBoolean)
  {
    if (isInFilterMode()) {
      paramBoolean = false;
    }
    if (paramBoolean) {
      if (this.mEmptyView != null)
      {
        this.mEmptyView.setVisibility(0);
        setVisibility(8);
        if (this.mDataChanged) {
          onLayout(false, getLeft(), getTop(), getRight(), getBottom());
        }
      }
    }
    for (;;)
    {
      return;
      setVisibility(0);
      break;
      if (this.mEmptyView != null) {
        this.mEmptyView.setVisibility(8);
      }
      setVisibility(0);
    }
  }
  
  public void addView(View paramView)
  {
    throw new UnsupportedOperationException("addView(View) is not supported in AdapterView");
  }
  
  public void addView(View paramView, int paramInt)
  {
    throw new UnsupportedOperationException("addView(View, int) is not supported in AdapterView");
  }
  
  public void addView(View paramView, int paramInt, ViewGroup.LayoutParams paramLayoutParams)
  {
    throw new UnsupportedOperationException("addView(View, int, LayoutParams) is not supported in AdapterView");
  }
  
  public void addView(View paramView, ViewGroup.LayoutParams paramLayoutParams)
  {
    throw new UnsupportedOperationException("addView(View, LayoutParams) is not supported in AdapterView");
  }
  
  protected boolean canAnimate()
  {
    if ((super.canAnimate()) && (this.mItemCount > 0)) {}
    for (boolean bool = true;; bool = false) {
      return bool;
    }
  }
  
  void checkFocus()
  {
    boolean bool1 = false;
    Adapter localAdapter = getAdapter();
    int i;
    if ((localAdapter == null) || (localAdapter.getCount() == 0))
    {
      i = 1;
      if ((i != 0) && (!isInFilterMode())) {
        break label113;
      }
      i = 1;
      label35:
      if ((i == 0) || (!this.mDesiredFocusableInTouchModeState)) {
        break label118;
      }
      bool2 = true;
      label49:
      super.setFocusableInTouchMode(bool2);
      if ((i == 0) || (!this.mDesiredFocusableState)) {
        break label124;
      }
    }
    label113:
    label118:
    label124:
    for (boolean bool2 = true;; bool2 = false)
    {
      super.setFocusable(bool2);
      if (this.mEmptyView != null)
      {
        if (localAdapter != null)
        {
          bool2 = bool1;
          if (!localAdapter.isEmpty()) {}
        }
        else
        {
          bool2 = true;
        }
        updateEmptyStatus(bool2);
      }
      return;
      i = 0;
      break;
      i = 0;
      break label35;
      bool2 = false;
      break label49;
    }
  }
  
  void checkSelectionChanged()
  {
    if ((this.mSelectedPosition != this.mOldSelectedPosition) || (this.mSelectedRowId != this.mOldSelectedRowId))
    {
      selectionChanged();
      this.mOldSelectedPosition = this.mSelectedPosition;
      this.mOldSelectedRowId = this.mSelectedRowId;
    }
  }
  
  public boolean dispatchPopulateAccessibilityEvent(AccessibilityEvent paramAccessibilityEvent)
  {
    View localView = getSelectedView();
    if ((localView != null) && (localView.getVisibility() == 0) && (localView.dispatchPopulateAccessibilityEvent(paramAccessibilityEvent))) {}
    for (boolean bool = true;; bool = false) {
      return bool;
    }
  }
  
  protected void dispatchRestoreInstanceState(SparseArray<Parcelable> paramSparseArray)
  {
    dispatchThawSelfOnly(paramSparseArray);
  }
  
  protected void dispatchSaveInstanceState(SparseArray<Parcelable> paramSparseArray)
  {
    dispatchFreezeSelfOnly(paramSparseArray);
  }
  
  int findSyncPosition()
  {
    int i = this.mItemCount;
    int j;
    if (i == 0) {
      j = -1;
    }
    long l1;
    int k;
    long l2;
    int m;
    int n;
    Adapter localAdapter;
    for (;;)
    {
      return j;
      l1 = this.mSyncRowId;
      j = this.mSyncPosition;
      if (l1 == Long.MIN_VALUE)
      {
        j = -1;
      }
      else
      {
        k = Math.min(i - 1, Math.max(0, j));
        l2 = SystemClock.uptimeMillis();
        m = k;
        n = k;
        i1 = 0;
        localAdapter = getAdapter();
        if (localAdapter != null) {
          break;
        }
        j = -1;
      }
    }
    label81:
    int i2;
    if ((i2 != 0) || ((i1 != 0) && (j == 0)))
    {
      n++;
      k = n;
    }
    for (int i1 = 0;; i1 = 1)
    {
      label145:
      label167:
      label172:
      label176:
      do
      {
        if (SystemClock.uptimeMillis() <= l2 + 100L)
        {
          j = k;
          if (localAdapter.getItemId(k) == l1) {
            break;
          }
          if (n != i - 1) {
            break label167;
          }
          j = 1;
          if (m != 0) {
            break label172;
          }
        }
        for (i2 = 1;; i2 = 0)
        {
          if ((j == 0) || (i2 == 0)) {
            break label176;
          }
          j = -1;
          break;
          j = 0;
          break label145;
        }
        break label81;
      } while ((j == 0) && ((i1 != 0) || (i2 != 0)));
      m--;
      k = m;
    }
  }
  
  public abstract T getAdapter();
  
  @ViewDebug.CapturedViewProperty
  public int getCount()
  {
    return this.mItemCount;
  }
  
  public View getEmptyView()
  {
    return this.mEmptyView;
  }
  
  public int getFirstVisiblePosition()
  {
    return this.mFirstPosition;
  }
  
  public Object getItemAtPosition(int paramInt)
  {
    Object localObject = getAdapter();
    if ((localObject == null) || (paramInt < 0)) {}
    for (localObject = null;; localObject = ((Adapter)localObject).getItem(paramInt)) {
      return localObject;
    }
  }
  
  public long getItemIdAtPosition(int paramInt)
  {
    Adapter localAdapter = getAdapter();
    if ((localAdapter == null) || (paramInt < 0)) {}
    for (long l = Long.MIN_VALUE;; l = localAdapter.getItemId(paramInt)) {
      return l;
    }
  }
  
  public int getLastVisiblePosition()
  {
    return this.mFirstPosition + getChildCount() - 1;
  }
  
  public final OnItemClickListener getOnItemClickListener()
  {
    return this.mOnItemClickListener;
  }
  
  public final OnItemLongClickListener getOnItemLongClickListener()
  {
    return this.mOnItemLongClickListener;
  }
  
  public final OnItemSelectedListener getOnItemSelectedListener()
  {
    return this.mOnItemSelectedListener;
  }
  
  public int getPositionForView(View paramView)
  {
    int i = -1;
    int j;
    try
    {
      for (;;)
      {
        View localView = (View)paramView.getParent();
        boolean bool = localView.equals(this);
        if (bool) {
          break;
        }
        paramView = localView;
      }
      return j;
    }
    catch (ClassCastException paramView)
    {
      j = i;
    }
    int k = getChildCount();
    for (int m = 0;; m++)
    {
      j = i;
      if (m >= k) {
        break;
      }
      if (getChildAt(m).equals(paramView))
      {
        j = this.mFirstPosition + m;
        break;
      }
    }
  }
  
  public Object getSelectedItem()
  {
    Object localObject = getAdapter();
    int i = getSelectedItemPosition();
    if ((localObject != null) && (((Adapter)localObject).getCount() > 0) && (i >= 0)) {}
    for (localObject = ((Adapter)localObject).getItem(i);; localObject = null) {
      return localObject;
    }
  }
  
  @ViewDebug.CapturedViewProperty
  public long getSelectedItemId()
  {
    return this.mNextSelectedRowId;
  }
  
  @ViewDebug.CapturedViewProperty
  public int getSelectedItemPosition()
  {
    return this.mNextSelectedPosition;
  }
  
  public abstract View getSelectedView();
  
  void handleDataChanged()
  {
    int i = this.mItemCount;
    int j = 0;
    int k = 0;
    if (i > 0)
    {
      int m = k;
      if (this.mNeedSync)
      {
        this.mNeedSync = false;
        j = findSyncPosition();
        m = k;
        if (j >= 0)
        {
          m = k;
          if (lookForSelectablePosition(j, true) == j)
          {
            setNextSelectedPositionInt(j);
            m = 1;
          }
        }
      }
      j = m;
      if (m == 0)
      {
        k = getSelectedItemPosition();
        j = k;
        if (k >= i) {
          j = i - 1;
        }
        i = j;
        if (j < 0) {
          i = 0;
        }
        j = lookForSelectablePosition(i, true);
        k = j;
        if (j < 0) {
          k = lookForSelectablePosition(i, false);
        }
        j = m;
        if (k >= 0)
        {
          setNextSelectedPositionInt(k);
          checkSelectionChanged();
          j = 1;
        }
      }
    }
    if (j == 0)
    {
      this.mSelectedPosition = -1;
      this.mSelectedRowId = Long.MIN_VALUE;
      this.mNextSelectedPosition = -1;
      this.mNextSelectedRowId = Long.MIN_VALUE;
      this.mNeedSync = false;
      checkSelectionChanged();
    }
  }
  
  boolean isInFilterMode()
  {
    return false;
  }
  
  int lookForSelectablePosition(int paramInt, boolean paramBoolean)
  {
    return paramInt;
  }
  
  protected void onDetachedFromWindow()
  {
    super.onDetachedFromWindow();
    removeCallbacks(this.mSelectionNotifier);
  }
  
  protected void onLayout(boolean paramBoolean, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    this.mLayoutHeight = getHeight();
  }
  
  public boolean performItemClick(View paramView, int paramInt, long paramLong)
  {
    boolean bool = false;
    if (this.mOnItemClickListener != null)
    {
      playSoundEffect(0);
      if (paramView != null) {
        paramView.sendAccessibilityEvent(1);
      }
      this.mOnItemClickListener.onItemClick(this, paramView, paramInt, paramLong);
      bool = true;
    }
    return bool;
  }
  
  void rememberSyncState()
  {
    if (getChildCount() > 0)
    {
      this.mNeedSync = true;
      this.mSyncHeight = this.mLayoutHeight;
      if (this.mSelectedPosition >= 0)
      {
        localObject = getChildAt(this.mSelectedPosition - this.mFirstPosition);
        this.mSyncRowId = this.mNextSelectedRowId;
        this.mSyncPosition = this.mNextSelectedPosition;
        if (localObject != null) {
          this.mSpecificTop = ((View)localObject).getTop();
        }
        this.mSyncMode = 0;
      }
    }
    else
    {
      return;
    }
    View localView = getChildAt(0);
    Object localObject = getAdapter();
    if ((this.mFirstPosition >= 0) && (this.mFirstPosition < ((Adapter)localObject).getCount())) {}
    for (this.mSyncRowId = ((Adapter)localObject).getItemId(this.mFirstPosition);; this.mSyncRowId = -1L)
    {
      this.mSyncPosition = this.mFirstPosition;
      if (localView != null) {
        this.mSpecificTop = localView.getTop();
      }
      this.mSyncMode = 1;
      break;
    }
  }
  
  public void removeAllViews()
  {
    throw new UnsupportedOperationException("removeAllViews() is not supported in AdapterView");
  }
  
  public void removeView(View paramView)
  {
    throw new UnsupportedOperationException("removeView(View) is not supported in AdapterView");
  }
  
  public void removeViewAt(int paramInt)
  {
    throw new UnsupportedOperationException("removeViewAt(int) is not supported in AdapterView");
  }
  
  void selectionChanged()
  {
    if (this.mOnItemSelectedListener != null)
    {
      if ((!this.mInLayout) && (!this.mBlockLayoutRequests)) {
        break label78;
      }
      if (this.mSelectionNotifier == null) {
        this.mSelectionNotifier = new SelectionNotifier(null);
      }
      post(this.mSelectionNotifier);
    }
    for (;;)
    {
      if ((this.mSelectedPosition != -1) && (isShown()) && (!isInTouchMode())) {
        sendAccessibilityEvent(4);
      }
      return;
      label78:
      fireOnSelected();
    }
  }
  
  public abstract void setAdapter(T paramT);
  
  public void setEmptyView(View paramView)
  {
    this.mEmptyView = paramView;
    paramView = getAdapter();
    if ((paramView == null) || (paramView.isEmpty())) {}
    for (boolean bool = true;; bool = false)
    {
      updateEmptyStatus(bool);
      return;
    }
  }
  
  public void setFocusable(boolean paramBoolean)
  {
    boolean bool = true;
    Adapter localAdapter = getAdapter();
    int i;
    if ((localAdapter == null) || (localAdapter.getCount() == 0))
    {
      i = 1;
      this.mDesiredFocusableState = paramBoolean;
      if (!paramBoolean) {
        this.mDesiredFocusableInTouchModeState = false;
      }
      if (!paramBoolean) {
        break label69;
      }
      paramBoolean = bool;
      if (i != 0) {
        if (!isInFilterMode()) {
          break label69;
        }
      }
    }
    label69:
    for (paramBoolean = bool;; paramBoolean = false)
    {
      super.setFocusable(paramBoolean);
      return;
      i = 0;
      break;
    }
  }
  
  public void setFocusableInTouchMode(boolean paramBoolean)
  {
    boolean bool = true;
    Adapter localAdapter = getAdapter();
    int i;
    if ((localAdapter == null) || (localAdapter.getCount() == 0))
    {
      i = 1;
      this.mDesiredFocusableInTouchModeState = paramBoolean;
      if (paramBoolean) {
        this.mDesiredFocusableState = true;
      }
      if (!paramBoolean) {
        break label69;
      }
      paramBoolean = bool;
      if (i != 0) {
        if (!isInFilterMode()) {
          break label69;
        }
      }
    }
    label69:
    for (paramBoolean = bool;; paramBoolean = false)
    {
      super.setFocusableInTouchMode(paramBoolean);
      return;
      i = 0;
      break;
    }
  }
  
  void setNextSelectedPositionInt(int paramInt)
  {
    this.mNextSelectedPosition = paramInt;
    this.mNextSelectedRowId = getItemIdAtPosition(paramInt);
    if ((this.mNeedSync) && (this.mSyncMode == 0) && (paramInt >= 0))
    {
      this.mSyncPosition = paramInt;
      this.mSyncRowId = this.mNextSelectedRowId;
    }
  }
  
  public void setOnClickListener(View.OnClickListener paramOnClickListener)
  {
    throw new RuntimeException("Don't call setOnClickListener for an AdapterView. You probably want setOnItemClickListener instead");
  }
  
  public void setOnItemClickListener(OnItemClickListener paramOnItemClickListener)
  {
    this.mOnItemClickListener = paramOnItemClickListener;
  }
  
  public void setOnItemLongClickListener(OnItemLongClickListener paramOnItemLongClickListener)
  {
    if (!isLongClickable()) {
      setLongClickable(true);
    }
    this.mOnItemLongClickListener = paramOnItemLongClickListener;
  }
  
  public void setOnItemSelectedListener(OnItemSelectedListener paramOnItemSelectedListener)
  {
    this.mOnItemSelectedListener = paramOnItemSelectedListener;
  }
  
  void setSelectedPositionInt(int paramInt)
  {
    this.mSelectedPosition = paramInt;
    this.mSelectedRowId = getItemIdAtPosition(paramInt);
  }
  
  public abstract void setSelection(int paramInt);
  
  public static class AdapterContextMenuInfo
    implements ContextMenu.ContextMenuInfo
  {
    public long id;
    public int position;
    public View targetView;
    
    public AdapterContextMenuInfo(View paramView, int paramInt, long paramLong)
    {
      this.targetView = paramView;
      this.position = paramInt;
      this.id = paramLong;
    }
  }
  
  class AdapterDataSetObserver
    extends DataSetObserver
  {
    private Parcelable mInstanceState = null;
    
    AdapterDataSetObserver() {}
    
    public void clearSavedState()
    {
      this.mInstanceState = null;
    }
    
    public void onChanged()
    {
      AdapterViewICS.this.mDataChanged = true;
      AdapterViewICS.this.mOldItemCount = AdapterViewICS.this.mItemCount;
      AdapterViewICS.this.mItemCount = AdapterViewICS.this.getAdapter().getCount();
      if ((AdapterViewICS.this.getAdapter().hasStableIds()) && (this.mInstanceState != null) && (AdapterViewICS.this.mOldItemCount == 0) && (AdapterViewICS.this.mItemCount > 0))
      {
        AdapterViewICS.this.onRestoreInstanceState(this.mInstanceState);
        this.mInstanceState = null;
      }
      for (;;)
      {
        AdapterViewICS.this.checkFocus();
        AdapterViewICS.this.requestLayout();
        return;
        AdapterViewICS.this.rememberSyncState();
      }
    }
    
    public void onInvalidated()
    {
      AdapterViewICS.this.mDataChanged = true;
      if (AdapterViewICS.this.getAdapter().hasStableIds()) {
        this.mInstanceState = AdapterViewICS.this.onSaveInstanceState();
      }
      AdapterViewICS.this.mOldItemCount = AdapterViewICS.this.mItemCount;
      AdapterViewICS.this.mItemCount = 0;
      AdapterViewICS.this.mSelectedPosition = -1;
      AdapterViewICS.this.mSelectedRowId = Long.MIN_VALUE;
      AdapterViewICS.this.mNextSelectedPosition = -1;
      AdapterViewICS.this.mNextSelectedRowId = Long.MIN_VALUE;
      AdapterViewICS.this.mNeedSync = false;
      AdapterViewICS.this.checkFocus();
      AdapterViewICS.this.requestLayout();
    }
  }
  
  public static abstract interface OnItemClickListener
  {
    public abstract void onItemClick(AdapterViewICS<?> paramAdapterViewICS, View paramView, int paramInt, long paramLong);
  }
  
  class OnItemClickListenerWrapper
    implements AdapterView.OnItemClickListener
  {
    private final AdapterViewICS.OnItemClickListener mWrappedListener;
    
    public OnItemClickListenerWrapper(AdapterViewICS.OnItemClickListener paramOnItemClickListener)
    {
      this.mWrappedListener = paramOnItemClickListener;
    }
    
    public void onItemClick(AdapterView<?> paramAdapterView, View paramView, int paramInt, long paramLong)
    {
      this.mWrappedListener.onItemClick(AdapterViewICS.this, paramView, paramInt, paramLong);
    }
  }
  
  public static abstract interface OnItemLongClickListener
  {
    public abstract boolean onItemLongClick(AdapterViewICS<?> paramAdapterViewICS, View paramView, int paramInt, long paramLong);
  }
  
  public static abstract interface OnItemSelectedListener
  {
    public abstract void onItemSelected(AdapterViewICS<?> paramAdapterViewICS, View paramView, int paramInt, long paramLong);
    
    public abstract void onNothingSelected(AdapterViewICS<?> paramAdapterViewICS);
  }
  
  private class SelectionNotifier
    implements Runnable
  {
    private SelectionNotifier() {}
    
    public void run()
    {
      if (AdapterViewICS.this.mDataChanged) {
        if (AdapterViewICS.this.getAdapter() != null) {
          AdapterViewICS.this.post(this);
        }
      }
      for (;;)
      {
        return;
        AdapterViewICS.this.fireOnSelected();
      }
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/android/support/v7/internal/widget/AdapterViewICS.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */