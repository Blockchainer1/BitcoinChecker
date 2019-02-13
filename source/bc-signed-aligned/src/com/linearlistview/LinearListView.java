package com.linearlistview;

import android.content.Context;
import android.content.res.TypedArray;
import android.database.DataSetObserver;
import android.util.AttributeSet;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.ArrayAdapter;
import android.widget.ListAdapter;
import com.linearlistview.internal.IcsLinearLayout;

public class LinearListView
  extends IcsLinearLayout
{
  private static final int LinearListView_dividerThickness = 1;
  private static final int LinearListView_entries = 0;
  private static final int[] R_styleable_LinearListView = { 16842930, R.attr.dividerThickness };
  private ListAdapter mAdapter;
  private boolean mAreAllItemsSelectable;
  private DataSetObserver mDataObserver = new DataSetObserver()
  {
    public void onChanged()
    {
      LinearListView.this.setupChildren();
    }
    
    public void onInvalidated()
    {
      LinearListView.this.setupChildren();
    }
  };
  private View mEmptyView;
  private OnItemClickListener mOnItemClickListener;
  
  public LinearListView(Context paramContext)
  {
    this(paramContext, null);
  }
  
  public LinearListView(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    TypedArray localTypedArray = paramContext.obtainStyledAttributes(paramAttributeSet, R_styleable_LinearListView);
    int i = localTypedArray.getDimensionPixelSize(1, 0);
    if (i != 0) {
      setDividerThickness(i);
    }
    paramAttributeSet = localTypedArray.getTextArray(0);
    if (paramAttributeSet != null) {
      setAdapter(new ArrayAdapter(paramContext, 17367043, paramAttributeSet));
    }
    localTypedArray.recycle();
  }
  
  private void setupChildren()
  {
    removeAllViews();
    boolean bool;
    if ((this.mAdapter == null) || (this.mAdapter.isEmpty()))
    {
      bool = true;
      updateEmptyStatus(bool);
      if (this.mAdapter != null) {
        break label43;
      }
    }
    for (;;)
    {
      return;
      bool = false;
      break;
      label43:
      for (int i = 0; i < this.mAdapter.getCount(); i++)
      {
        View localView = this.mAdapter.getView(i, null, this);
        if ((this.mAreAllItemsSelectable) || (this.mAdapter.isEnabled(i))) {
          localView.setOnClickListener(new InternalOnClickListener(i));
        }
        addViewInLayout(localView, -1, localView.getLayoutParams(), true);
      }
    }
  }
  
  private void updateEmptyStatus(boolean paramBoolean)
  {
    if (paramBoolean) {
      if (this.mEmptyView != null)
      {
        this.mEmptyView.setVisibility(0);
        setVisibility(8);
      }
    }
    for (;;)
    {
      return;
      setVisibility(0);
      continue;
      if (this.mEmptyView != null) {
        this.mEmptyView.setVisibility(8);
      }
      setVisibility(0);
    }
  }
  
  public ListAdapter getAdapter()
  {
    return this.mAdapter;
  }
  
  public View getEmptyView()
  {
    return this.mEmptyView;
  }
  
  public final OnItemClickListener getOnItemClickListener()
  {
    return this.mOnItemClickListener;
  }
  
  public boolean performItemClick(View paramView, int paramInt, long paramLong)
  {
    boolean bool = false;
    if (this.mOnItemClickListener != null)
    {
      playSoundEffect(0);
      this.mOnItemClickListener.onItemClick(this, paramView, paramInt, paramLong);
      bool = true;
    }
    return bool;
  }
  
  public void setAdapter(ListAdapter paramListAdapter)
  {
    if (this.mAdapter != null) {
      this.mAdapter.unregisterDataSetObserver(this.mDataObserver);
    }
    this.mAdapter = paramListAdapter;
    if (this.mAdapter != null)
    {
      this.mAdapter.registerDataSetObserver(this.mDataObserver);
      this.mAreAllItemsSelectable = this.mAdapter.areAllItemsEnabled();
    }
    setupChildren();
  }
  
  public void setDividerThickness(int paramInt)
  {
    if (getOrientation() == 1) {
      this.mDividerHeight = paramInt;
    }
    for (;;)
    {
      requestLayout();
      return;
      this.mDividerWidth = paramInt;
    }
  }
  
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
  
  public void setOnItemClickListener(OnItemClickListener paramOnItemClickListener)
  {
    this.mOnItemClickListener = paramOnItemClickListener;
  }
  
  public void setOrientation(int paramInt)
  {
    if (paramInt != getOrientation())
    {
      int i = this.mDividerHeight;
      this.mDividerHeight = this.mDividerWidth;
      this.mDividerWidth = i;
    }
    super.setOrientation(paramInt);
  }
  
  private class InternalOnClickListener
    implements View.OnClickListener
  {
    int mPosition;
    
    public InternalOnClickListener(int paramInt)
    {
      this.mPosition = paramInt;
    }
    
    public void onClick(View paramView)
    {
      if ((LinearListView.this.mOnItemClickListener != null) && (LinearListView.this.mAdapter != null)) {
        LinearListView.this.mOnItemClickListener.onItemClick(LinearListView.this, paramView, this.mPosition, LinearListView.this.mAdapter.getItemId(this.mPosition));
      }
    }
  }
  
  public static abstract interface OnItemClickListener
  {
    public abstract void onItemClick(LinearListView paramLinearListView, View paramView, int paramInt, long paramLong);
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/linearlistview/LinearListView.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */