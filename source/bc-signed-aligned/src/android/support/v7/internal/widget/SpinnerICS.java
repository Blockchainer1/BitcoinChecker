package android.support.v7.internal.widget;

import android.app.AlertDialog;
import android.app.AlertDialog.Builder;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.res.TypedArray;
import android.database.DataSetObserver;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.support.v7.appcompat.R.attr;
import android.support.v7.appcompat.R.styleable;
import android.util.AttributeSet;
import android.view.View;
import android.view.View.MeasureSpec;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.SpinnerAdapter;

class SpinnerICS
  extends AbsSpinnerICS
  implements DialogInterface.OnClickListener
{
  private static final int MAX_ITEMS_MEASURED = 15;
  static final int MODE_DIALOG = 0;
  static final int MODE_DROPDOWN = 1;
  private static final int MODE_THEME = -1;
  private static final String TAG = "Spinner";
  int mDropDownWidth;
  private int mGravity;
  private SpinnerPopup mPopup;
  private DropDownAdapter mTempAdapter;
  private Rect mTempRect = new Rect();
  
  SpinnerICS(Context paramContext)
  {
    this(paramContext, null);
  }
  
  SpinnerICS(Context paramContext, int paramInt)
  {
    this(paramContext, null, R.attr.spinnerStyle, paramInt);
  }
  
  SpinnerICS(Context paramContext, AttributeSet paramAttributeSet)
  {
    this(paramContext, paramAttributeSet, R.attr.spinnerStyle);
  }
  
  SpinnerICS(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    this(paramContext, paramAttributeSet, paramInt, -1);
  }
  
  SpinnerICS(Context paramContext, AttributeSet paramAttributeSet, int paramInt1, int paramInt2)
  {
    super(paramContext, paramAttributeSet, paramInt1);
    TypedArray localTypedArray = paramContext.obtainStyledAttributes(paramAttributeSet, R.styleable.Spinner, paramInt1, 0);
    int i = paramInt2;
    if (paramInt2 == -1) {
      i = localTypedArray.getInt(7, 0);
    }
    switch (i)
    {
    }
    for (;;)
    {
      this.mGravity = localTypedArray.getInt(0, 17);
      this.mPopup.setPromptText(localTypedArray.getString(6));
      localTypedArray.recycle();
      if (this.mTempAdapter != null)
      {
        this.mPopup.setAdapter(this.mTempAdapter);
        this.mTempAdapter = null;
      }
      return;
      this.mPopup = new DialogPopup(null);
      continue;
      paramContext = new DropdownPopup(paramContext, paramAttributeSet, paramInt1);
      this.mDropDownWidth = localTypedArray.getLayoutDimension(3, -2);
      paramContext.setBackgroundDrawable(localTypedArray.getDrawable(2));
      paramInt1 = localTypedArray.getDimensionPixelOffset(5, 0);
      if (paramInt1 != 0) {
        paramContext.setVerticalOffset(paramInt1);
      }
      paramInt1 = localTypedArray.getDimensionPixelOffset(4, 0);
      if (paramInt1 != 0) {
        paramContext.setHorizontalOffset(paramInt1);
      }
      this.mPopup = paramContext;
    }
  }
  
  private View makeAndAddView(int paramInt)
  {
    View localView;
    if (!this.mDataChanged)
    {
      localView = this.mRecycler.get(paramInt);
      if (localView != null) {
        setUpChild(localView);
      }
    }
    for (;;)
    {
      return localView;
      localView = this.mAdapter.getView(paramInt, null, this);
      setUpChild(localView);
    }
  }
  
  private void setUpChild(View paramView)
  {
    ViewGroup.LayoutParams localLayoutParams1 = paramView.getLayoutParams();
    ViewGroup.LayoutParams localLayoutParams2 = localLayoutParams1;
    if (localLayoutParams1 == null) {
      localLayoutParams2 = generateDefaultLayoutParams();
    }
    addViewInLayout(paramView, 0, localLayoutParams2);
    paramView.setSelected(hasFocus());
    int i = ViewGroup.getChildMeasureSpec(this.mHeightMeasureSpec, this.mSpinnerPadding.top + this.mSpinnerPadding.bottom, localLayoutParams2.height);
    paramView.measure(ViewGroup.getChildMeasureSpec(this.mWidthMeasureSpec, this.mSpinnerPadding.left + this.mSpinnerPadding.right, localLayoutParams2.width), i);
    i = this.mSpinnerPadding.top + (getMeasuredHeight() - this.mSpinnerPadding.bottom - this.mSpinnerPadding.top - paramView.getMeasuredHeight()) / 2;
    int j = paramView.getMeasuredHeight();
    paramView.layout(0, i, 0 + paramView.getMeasuredWidth(), i + j);
  }
  
  public int getBaseline()
  {
    int i = -1;
    Object localObject1 = null;
    Object localObject2;
    if (getChildCount() > 0) {
      localObject2 = getChildAt(0);
    }
    for (;;)
    {
      int j = i;
      if (localObject2 != null)
      {
        int k = ((View)localObject2).getBaseline();
        j = i;
        if (k >= 0) {
          j = ((View)localObject2).getTop() + k;
        }
      }
      return j;
      localObject2 = localObject1;
      if (this.mAdapter != null)
      {
        localObject2 = localObject1;
        if (this.mAdapter.getCount() > 0)
        {
          localObject2 = makeAndAddView(0);
          this.mRecycler.put(0, (View)localObject2);
          removeAllViewsInLayout();
        }
      }
    }
  }
  
  public CharSequence getPrompt()
  {
    return this.mPopup.getHintText();
  }
  
  void layout(int paramInt, boolean paramBoolean)
  {
    int i = this.mSpinnerPadding.left;
    int j = getRight() - getLeft() - this.mSpinnerPadding.left - this.mSpinnerPadding.right;
    if (this.mDataChanged) {
      handleDataChanged();
    }
    if (this.mItemCount == 0)
    {
      resetList();
      return;
    }
    if (this.mNextSelectedPosition >= 0) {
      setSelectedPositionInt(this.mNextSelectedPosition);
    }
    recycleAllViews();
    removeAllViewsInLayout();
    this.mFirstPosition = this.mSelectedPosition;
    View localView = makeAndAddView(this.mSelectedPosition);
    int k = localView.getMeasuredWidth();
    paramInt = i;
    switch (this.mGravity & 0x7)
    {
    }
    for (;;)
    {
      localView.offsetLeftAndRight(paramInt);
      this.mRecycler.clear();
      invalidate();
      checkSelectionChanged();
      this.mDataChanged = false;
      this.mNeedSync = false;
      setNextSelectedPositionInt(this.mSelectedPosition);
      break;
      paramInt = j / 2 + i - k / 2;
      continue;
      paramInt = i + j - k;
    }
  }
  
  int measureContentWidth(SpinnerAdapter paramSpinnerAdapter, Drawable paramDrawable)
  {
    int i;
    if (paramSpinnerAdapter == null) {
      i = 0;
    }
    for (;;)
    {
      return i;
      int j = 0;
      View localView = null;
      int k = 0;
      int m = View.MeasureSpec.makeMeasureSpec(0, 0);
      int n = View.MeasureSpec.makeMeasureSpec(0, 0);
      i = Math.max(0, getSelectedItemPosition());
      int i1 = Math.min(paramSpinnerAdapter.getCount(), i + 15);
      i = Math.max(0, i - (15 - (i1 - i)));
      while (i < i1)
      {
        int i2 = paramSpinnerAdapter.getItemViewType(i);
        int i3 = k;
        if (i2 != k)
        {
          i3 = i2;
          localView = null;
        }
        localView = paramSpinnerAdapter.getView(i, localView, this);
        if (localView.getLayoutParams() == null) {
          localView.setLayoutParams(new ViewGroup.LayoutParams(-2, -2));
        }
        localView.measure(m, n);
        j = Math.max(j, localView.getMeasuredWidth());
        i++;
        k = i3;
      }
      i = j;
      if (paramDrawable != null)
      {
        paramDrawable.getPadding(this.mTempRect);
        i = j + (this.mTempRect.left + this.mTempRect.right);
      }
    }
  }
  
  public void onClick(DialogInterface paramDialogInterface, int paramInt)
  {
    setSelection(paramInt);
    paramDialogInterface.dismiss();
  }
  
  protected void onDetachedFromWindow()
  {
    super.onDetachedFromWindow();
    if ((this.mPopup != null) && (this.mPopup.isShowing())) {
      this.mPopup.dismiss();
    }
  }
  
  protected void onLayout(boolean paramBoolean, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    super.onLayout(paramBoolean, paramInt1, paramInt2, paramInt3, paramInt4);
    this.mInLayout = true;
    layout(0, false);
    this.mInLayout = false;
  }
  
  protected void onMeasure(int paramInt1, int paramInt2)
  {
    super.onMeasure(paramInt1, paramInt2);
    if ((this.mPopup != null) && (View.MeasureSpec.getMode(paramInt1) == Integer.MIN_VALUE)) {
      setMeasuredDimension(Math.min(Math.max(getMeasuredWidth(), measureContentWidth(getAdapter(), getBackground())), View.MeasureSpec.getSize(paramInt1)), getMeasuredHeight());
    }
  }
  
  public boolean performClick()
  {
    boolean bool1 = super.performClick();
    boolean bool2 = bool1;
    if (!bool1)
    {
      bool1 = true;
      bool2 = bool1;
      if (!this.mPopup.isShowing())
      {
        this.mPopup.show();
        bool2 = bool1;
      }
    }
    return bool2;
  }
  
  public void setAdapter(SpinnerAdapter paramSpinnerAdapter)
  {
    super.setAdapter(paramSpinnerAdapter);
    if (this.mPopup != null) {
      this.mPopup.setAdapter(new DropDownAdapter(paramSpinnerAdapter));
    }
    for (;;)
    {
      return;
      this.mTempAdapter = new DropDownAdapter(paramSpinnerAdapter);
    }
  }
  
  public void setGravity(int paramInt)
  {
    if (this.mGravity != paramInt)
    {
      int i = paramInt;
      if ((paramInt & 0x7) == 0) {
        i = paramInt | 0x3;
      }
      this.mGravity = i;
      requestLayout();
    }
  }
  
  public void setOnItemClickListener(AdapterViewICS.OnItemClickListener paramOnItemClickListener)
  {
    throw new RuntimeException("setOnItemClickListener cannot be used with a spinner.");
  }
  
  void setOnItemClickListenerInt(AdapterViewICS.OnItemClickListener paramOnItemClickListener)
  {
    super.setOnItemClickListener(paramOnItemClickListener);
  }
  
  public void setPrompt(CharSequence paramCharSequence)
  {
    this.mPopup.setPromptText(paramCharSequence);
  }
  
  public void setPromptId(int paramInt)
  {
    setPrompt(getContext().getText(paramInt));
  }
  
  private class DialogPopup
    implements SpinnerICS.SpinnerPopup, DialogInterface.OnClickListener
  {
    private ListAdapter mListAdapter;
    private AlertDialog mPopup;
    private CharSequence mPrompt;
    
    private DialogPopup() {}
    
    public void dismiss()
    {
      this.mPopup.dismiss();
      this.mPopup = null;
    }
    
    public CharSequence getHintText()
    {
      return this.mPrompt;
    }
    
    public boolean isShowing()
    {
      if (this.mPopup != null) {}
      for (boolean bool = this.mPopup.isShowing();; bool = false) {
        return bool;
      }
    }
    
    public void onClick(DialogInterface paramDialogInterface, int paramInt)
    {
      SpinnerICS.this.setSelection(paramInt);
      if (SpinnerICS.this.mOnItemClickListener != null) {
        SpinnerICS.this.performItemClick(null, paramInt, this.mListAdapter.getItemId(paramInt));
      }
      dismiss();
    }
    
    public void setAdapter(ListAdapter paramListAdapter)
    {
      this.mListAdapter = paramListAdapter;
    }
    
    public void setPromptText(CharSequence paramCharSequence)
    {
      this.mPrompt = paramCharSequence;
    }
    
    public void show()
    {
      AlertDialog.Builder localBuilder = new AlertDialog.Builder(SpinnerICS.this.getContext());
      if (this.mPrompt != null) {
        localBuilder.setTitle(this.mPrompt);
      }
      this.mPopup = localBuilder.setSingleChoiceItems(this.mListAdapter, SpinnerICS.this.getSelectedItemPosition(), this).show();
    }
  }
  
  private static class DropDownAdapter
    implements ListAdapter, SpinnerAdapter
  {
    private SpinnerAdapter mAdapter;
    private ListAdapter mListAdapter;
    
    public DropDownAdapter(SpinnerAdapter paramSpinnerAdapter)
    {
      this.mAdapter = paramSpinnerAdapter;
      if ((paramSpinnerAdapter instanceof ListAdapter)) {
        this.mListAdapter = ((ListAdapter)paramSpinnerAdapter);
      }
    }
    
    public boolean areAllItemsEnabled()
    {
      ListAdapter localListAdapter = this.mListAdapter;
      if (localListAdapter != null) {}
      for (boolean bool = localListAdapter.areAllItemsEnabled();; bool = true) {
        return bool;
      }
    }
    
    public int getCount()
    {
      if (this.mAdapter == null) {}
      for (int i = 0;; i = this.mAdapter.getCount()) {
        return i;
      }
    }
    
    public View getDropDownView(int paramInt, View paramView, ViewGroup paramViewGroup)
    {
      if (this.mAdapter == null) {}
      for (paramView = null;; paramView = this.mAdapter.getDropDownView(paramInt, paramView, paramViewGroup)) {
        return paramView;
      }
    }
    
    public Object getItem(int paramInt)
    {
      if (this.mAdapter == null) {}
      for (Object localObject = null;; localObject = this.mAdapter.getItem(paramInt)) {
        return localObject;
      }
    }
    
    public long getItemId(int paramInt)
    {
      if (this.mAdapter == null) {}
      for (long l = -1L;; l = this.mAdapter.getItemId(paramInt)) {
        return l;
      }
    }
    
    public int getItemViewType(int paramInt)
    {
      return 0;
    }
    
    public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
    {
      return getDropDownView(paramInt, paramView, paramViewGroup);
    }
    
    public int getViewTypeCount()
    {
      return 1;
    }
    
    public boolean hasStableIds()
    {
      if ((this.mAdapter != null) && (this.mAdapter.hasStableIds())) {}
      for (boolean bool = true;; bool = false) {
        return bool;
      }
    }
    
    public boolean isEmpty()
    {
      if (getCount() == 0) {}
      for (boolean bool = true;; bool = false) {
        return bool;
      }
    }
    
    public boolean isEnabled(int paramInt)
    {
      ListAdapter localListAdapter = this.mListAdapter;
      if (localListAdapter != null) {}
      for (boolean bool = localListAdapter.isEnabled(paramInt);; bool = true) {
        return bool;
      }
    }
    
    public void registerDataSetObserver(DataSetObserver paramDataSetObserver)
    {
      if (this.mAdapter != null) {
        this.mAdapter.registerDataSetObserver(paramDataSetObserver);
      }
    }
    
    public void unregisterDataSetObserver(DataSetObserver paramDataSetObserver)
    {
      if (this.mAdapter != null) {
        this.mAdapter.unregisterDataSetObserver(paramDataSetObserver);
      }
    }
  }
  
  private class DropdownPopup
    extends ListPopupWindow
    implements SpinnerICS.SpinnerPopup
  {
    private ListAdapter mAdapter;
    private CharSequence mHintText;
    
    public DropdownPopup(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
    {
      super(paramAttributeSet, paramInt);
      setAnchorView(SpinnerICS.this);
      setModal(true);
      setPromptPosition(0);
      setOnItemClickListener(new AdapterViewICS.OnItemClickListenerWrapper(SpinnerICS.this, new AdapterViewICS.OnItemClickListener()
      {
        public void onItemClick(AdapterViewICS paramAnonymousAdapterViewICS, View paramAnonymousView, int paramAnonymousInt, long paramAnonymousLong)
        {
          SpinnerICS.this.setSelection(paramAnonymousInt);
          if (SpinnerICS.this.mOnItemClickListener != null) {
            SpinnerICS.this.performItemClick(paramAnonymousView, paramAnonymousInt, SpinnerICS.DropdownPopup.this.mAdapter.getItemId(paramAnonymousInt));
          }
          SpinnerICS.DropdownPopup.this.dismiss();
        }
      }));
    }
    
    public CharSequence getHintText()
    {
      return this.mHintText;
    }
    
    public void setAdapter(ListAdapter paramListAdapter)
    {
      super.setAdapter(paramListAdapter);
      this.mAdapter = paramListAdapter;
    }
    
    public void setPromptText(CharSequence paramCharSequence)
    {
      this.mHintText = paramCharSequence;
    }
    
    public void show()
    {
      int i = SpinnerICS.this.getPaddingLeft();
      int k;
      if (SpinnerICS.this.mDropDownWidth == -2)
      {
        int j = SpinnerICS.this.getWidth();
        k = SpinnerICS.this.getPaddingRight();
        setContentWidth(Math.max(SpinnerICS.this.measureContentWidth((SpinnerAdapter)this.mAdapter, getBackground()), j - i - k));
      }
      for (;;)
      {
        Drawable localDrawable = getBackground();
        k = 0;
        if (localDrawable != null)
        {
          localDrawable.getPadding(SpinnerICS.this.mTempRect);
          k = -SpinnerICS.this.mTempRect.left;
        }
        setHorizontalOffset(k + i);
        setInputMethodMode(2);
        super.show();
        getListView().setChoiceMode(1);
        setSelection(SpinnerICS.this.getSelectedItemPosition());
        return;
        if (SpinnerICS.this.mDropDownWidth == -1) {
          setContentWidth(SpinnerICS.this.getWidth() - i - SpinnerICS.this.getPaddingRight());
        } else {
          setContentWidth(SpinnerICS.this.mDropDownWidth);
        }
      }
    }
  }
  
  private static abstract interface SpinnerPopup
  {
    public abstract void dismiss();
    
    public abstract CharSequence getHintText();
    
    public abstract boolean isShowing();
    
    public abstract void setAdapter(ListAdapter paramListAdapter);
    
    public abstract void setPromptText(CharSequence paramCharSequence);
    
    public abstract void show();
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/android/support/v7/internal/widget/SpinnerICS.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */