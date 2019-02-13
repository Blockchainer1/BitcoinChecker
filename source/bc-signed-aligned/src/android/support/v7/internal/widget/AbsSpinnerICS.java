package android.support.v7.internal.widget;

import android.content.Context;
import android.database.DataSetObserver;
import android.graphics.Rect;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.util.AttributeSet;
import android.util.SparseArray;
import android.view.View;
import android.view.View.BaseSavedState;
import android.view.View.MeasureSpec;
import android.view.ViewGroup.LayoutParams;
import android.widget.SpinnerAdapter;

abstract class AbsSpinnerICS
  extends AdapterViewICS<SpinnerAdapter>
{
  SpinnerAdapter mAdapter;
  boolean mBlockLayoutRequests;
  private DataSetObserver mDataSetObserver;
  int mHeightMeasureSpec;
  final RecycleBin mRecycler = new RecycleBin();
  int mSelectionBottomPadding = 0;
  int mSelectionLeftPadding = 0;
  int mSelectionRightPadding = 0;
  int mSelectionTopPadding = 0;
  final Rect mSpinnerPadding = new Rect();
  private Rect mTouchFrame;
  int mWidthMeasureSpec;
  
  AbsSpinnerICS(Context paramContext)
  {
    super(paramContext);
    initAbsSpinner();
  }
  
  AbsSpinnerICS(Context paramContext, AttributeSet paramAttributeSet)
  {
    this(paramContext, paramAttributeSet, 0);
  }
  
  AbsSpinnerICS(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    initAbsSpinner();
  }
  
  private void initAbsSpinner()
  {
    setFocusable(true);
    setWillNotDraw(false);
  }
  
  protected ViewGroup.LayoutParams generateDefaultLayoutParams()
  {
    return new ViewGroup.LayoutParams(-1, -2);
  }
  
  public SpinnerAdapter getAdapter()
  {
    return this.mAdapter;
  }
  
  int getChildHeight(View paramView)
  {
    return paramView.getMeasuredHeight();
  }
  
  int getChildWidth(View paramView)
  {
    return paramView.getMeasuredWidth();
  }
  
  public int getCount()
  {
    return this.mItemCount;
  }
  
  public View getSelectedView()
  {
    if ((this.mItemCount > 0) && (this.mSelectedPosition >= 0)) {}
    for (View localView = getChildAt(this.mSelectedPosition - this.mFirstPosition);; localView = null) {
      return localView;
    }
  }
  
  abstract void layout(int paramInt, boolean paramBoolean);
  
  protected void onMeasure(int paramInt1, int paramInt2)
  {
    int i = View.MeasureSpec.getMode(paramInt1);
    int j = getPaddingLeft();
    int k = getPaddingTop();
    int m = getPaddingRight();
    int n = getPaddingBottom();
    Object localObject = this.mSpinnerPadding;
    if (j > this.mSelectionLeftPadding)
    {
      ((Rect)localObject).left = j;
      localObject = this.mSpinnerPadding;
      if (k <= this.mSelectionTopPadding) {
        break label496;
      }
      j = k;
      label70:
      ((Rect)localObject).top = j;
      localObject = this.mSpinnerPadding;
      if (m <= this.mSelectionRightPadding) {
        break label505;
      }
      j = m;
      label96:
      ((Rect)localObject).right = j;
      localObject = this.mSpinnerPadding;
      if (n <= this.mSelectionBottomPadding) {
        break label514;
      }
    }
    label496:
    label505:
    label514:
    for (j = n;; j = this.mSelectionBottomPadding)
    {
      ((Rect)localObject).bottom = j;
      if (this.mDataChanged) {
        handleDataChanged();
      }
      int i1 = 0;
      k = 0;
      int i2 = 1;
      int i3 = getSelectedItemPosition();
      m = i2;
      n = i1;
      j = k;
      if (i3 >= 0)
      {
        m = i2;
        n = i1;
        j = k;
        if (this.mAdapter != null)
        {
          m = i2;
          n = i1;
          j = k;
          if (i3 < this.mAdapter.getCount())
          {
            View localView = this.mRecycler.get(i3);
            localObject = localView;
            if (localView == null) {
              localObject = this.mAdapter.getView(i3, null, this);
            }
            if (localObject != null) {
              this.mRecycler.put(i3, (View)localObject);
            }
            m = i2;
            n = i1;
            j = k;
            if (localObject != null)
            {
              if (((View)localObject).getLayoutParams() == null)
              {
                this.mBlockLayoutRequests = true;
                ((View)localObject).setLayoutParams(generateDefaultLayoutParams());
                this.mBlockLayoutRequests = false;
              }
              measureChild((View)localObject, paramInt1, paramInt2);
              n = getChildHeight((View)localObject) + this.mSpinnerPadding.top + this.mSpinnerPadding.bottom;
              j = getChildWidth((View)localObject) + this.mSpinnerPadding.left + this.mSpinnerPadding.right;
              m = 0;
            }
          }
        }
      }
      k = n;
      n = j;
      if (m != 0)
      {
        m = this.mSpinnerPadding.top + this.mSpinnerPadding.bottom;
        k = m;
        n = j;
        if (i == 0)
        {
          n = this.mSpinnerPadding.left + this.mSpinnerPadding.right;
          k = m;
        }
      }
      j = Math.max(k, getSuggestedMinimumHeight());
      n = Math.max(n, getSuggestedMinimumWidth());
      j = resolveSize(j, paramInt2);
      setMeasuredDimension(resolveSize(n, paramInt1), j);
      this.mHeightMeasureSpec = paramInt2;
      this.mWidthMeasureSpec = paramInt1;
      return;
      j = this.mSelectionLeftPadding;
      break;
      j = this.mSelectionTopPadding;
      break label70;
      j = this.mSelectionRightPadding;
      break label96;
    }
  }
  
  public void onRestoreInstanceState(Parcelable paramParcelable)
  {
    paramParcelable = (SavedState)paramParcelable;
    super.onRestoreInstanceState(paramParcelable.getSuperState());
    if (paramParcelable.selectedId >= 0L)
    {
      this.mDataChanged = true;
      this.mNeedSync = true;
      this.mSyncRowId = paramParcelable.selectedId;
      this.mSyncPosition = paramParcelable.position;
      this.mSyncMode = 0;
      requestLayout();
    }
  }
  
  public Parcelable onSaveInstanceState()
  {
    SavedState localSavedState = new SavedState(super.onSaveInstanceState());
    localSavedState.selectedId = getSelectedItemId();
    if (localSavedState.selectedId >= 0L) {}
    for (localSavedState.position = getSelectedItemPosition();; localSavedState.position = -1) {
      return localSavedState;
    }
  }
  
  public int pointToPosition(int paramInt1, int paramInt2)
  {
    Object localObject1 = this.mTouchFrame;
    Object localObject2 = localObject1;
    if (localObject1 == null)
    {
      this.mTouchFrame = new Rect();
      localObject2 = this.mTouchFrame;
    }
    int i = getChildCount() - 1;
    if (i >= 0)
    {
      localObject1 = getChildAt(i);
      if (((View)localObject1).getVisibility() == 0)
      {
        ((View)localObject1).getHitRect((Rect)localObject2);
        if (!((Rect)localObject2).contains(paramInt1, paramInt2)) {}
      }
    }
    for (paramInt1 = this.mFirstPosition + i;; paramInt1 = -1)
    {
      return paramInt1;
      i--;
      break;
    }
  }
  
  void recycleAllViews()
  {
    int i = getChildCount();
    RecycleBin localRecycleBin = this.mRecycler;
    int j = this.mFirstPosition;
    for (int k = 0; k < i; k++) {
      localRecycleBin.put(j + k, getChildAt(k));
    }
  }
  
  public void requestLayout()
  {
    if (!this.mBlockLayoutRequests) {
      super.requestLayout();
    }
  }
  
  void resetList()
  {
    this.mDataChanged = false;
    this.mNeedSync = false;
    removeAllViewsInLayout();
    this.mOldSelectedPosition = -1;
    this.mOldSelectedRowId = Long.MIN_VALUE;
    setSelectedPositionInt(-1);
    setNextSelectedPositionInt(-1);
    invalidate();
  }
  
  public void setAdapter(SpinnerAdapter paramSpinnerAdapter)
  {
    int i = -1;
    if (this.mAdapter != null)
    {
      this.mAdapter.unregisterDataSetObserver(this.mDataSetObserver);
      resetList();
    }
    this.mAdapter = paramSpinnerAdapter;
    this.mOldSelectedPosition = -1;
    this.mOldSelectedRowId = Long.MIN_VALUE;
    if (this.mAdapter != null)
    {
      this.mOldItemCount = this.mItemCount;
      this.mItemCount = this.mAdapter.getCount();
      checkFocus();
      this.mDataSetObserver = new AdapterViewICS.AdapterDataSetObserver(this);
      this.mAdapter.registerDataSetObserver(this.mDataSetObserver);
      if (this.mItemCount > 0) {
        i = 0;
      }
      setSelectedPositionInt(i);
      setNextSelectedPositionInt(i);
      if (this.mItemCount == 0) {
        checkSelectionChanged();
      }
    }
    for (;;)
    {
      requestLayout();
      return;
      checkFocus();
      resetList();
      checkSelectionChanged();
    }
  }
  
  public void setSelection(int paramInt)
  {
    setNextSelectedPositionInt(paramInt);
    requestLayout();
    invalidate();
  }
  
  public void setSelection(int paramInt, boolean paramBoolean)
  {
    if ((paramBoolean) && (this.mFirstPosition <= paramInt) && (paramInt <= this.mFirstPosition + getChildCount() - 1)) {}
    for (paramBoolean = true;; paramBoolean = false)
    {
      setSelectionInt(paramInt, paramBoolean);
      return;
    }
  }
  
  void setSelectionInt(int paramInt, boolean paramBoolean)
  {
    if (paramInt != this.mOldSelectedPosition)
    {
      this.mBlockLayoutRequests = true;
      int i = this.mSelectedPosition;
      setNextSelectedPositionInt(paramInt);
      layout(paramInt - i, paramBoolean);
      this.mBlockLayoutRequests = false;
    }
  }
  
  class RecycleBin
  {
    private final SparseArray<View> mScrapHeap = new SparseArray();
    
    RecycleBin() {}
    
    void clear()
    {
      SparseArray localSparseArray = this.mScrapHeap;
      int i = localSparseArray.size();
      for (int j = 0; j < i; j++)
      {
        View localView = (View)localSparseArray.valueAt(j);
        if (localView != null) {
          AbsSpinnerICS.this.removeDetachedView(localView, true);
        }
      }
      localSparseArray.clear();
    }
    
    View get(int paramInt)
    {
      View localView = (View)this.mScrapHeap.get(paramInt);
      if (localView != null) {
        this.mScrapHeap.delete(paramInt);
      }
      return localView;
    }
    
    public void put(int paramInt, View paramView)
    {
      this.mScrapHeap.put(paramInt, paramView);
    }
  }
  
  static class SavedState
    extends View.BaseSavedState
  {
    public static final Parcelable.Creator<SavedState> CREATOR = new Parcelable.Creator()
    {
      public AbsSpinnerICS.SavedState createFromParcel(Parcel paramAnonymousParcel)
      {
        return new AbsSpinnerICS.SavedState(paramAnonymousParcel, null);
      }
      
      public AbsSpinnerICS.SavedState[] newArray(int paramAnonymousInt)
      {
        return new AbsSpinnerICS.SavedState[paramAnonymousInt];
      }
    };
    int position;
    long selectedId;
    
    private SavedState(Parcel paramParcel)
    {
      super();
      this.selectedId = paramParcel.readLong();
      this.position = paramParcel.readInt();
    }
    
    SavedState(Parcelable paramParcelable)
    {
      super();
    }
    
    public String toString()
    {
      return "AbsSpinner.SavedState{" + Integer.toHexString(System.identityHashCode(this)) + " selectedId=" + this.selectedId + " position=" + this.position + "}";
    }
    
    public void writeToParcel(Parcel paramParcel, int paramInt)
    {
      super.writeToParcel(paramParcel, paramInt);
      paramParcel.writeLong(this.selectedId);
      paramParcel.writeInt(this.position);
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/android/support/v7/internal/widget/AbsSpinnerICS.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */