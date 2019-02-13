package com.mobeta.android.dslv;

import android.content.Context;
import android.database.Cursor;
import android.support.v4.widget.CursorAdapter;
import android.util.SparseIntArray;
import android.view.View;
import android.view.ViewGroup;
import java.util.ArrayList;

public abstract class DragSortCursorAdapter
  extends CursorAdapter
  implements DragSortListView.DragSortListener
{
  public static final int REMOVED = -1;
  private SparseIntArray mListMapping = new SparseIntArray();
  private ArrayList<Integer> mRemovedCursorPositions = new ArrayList();
  
  public DragSortCursorAdapter(Context paramContext, Cursor paramCursor)
  {
    super(paramContext, paramCursor);
  }
  
  public DragSortCursorAdapter(Context paramContext, Cursor paramCursor, int paramInt)
  {
    super(paramContext, paramCursor, paramInt);
  }
  
  public DragSortCursorAdapter(Context paramContext, Cursor paramCursor, boolean paramBoolean)
  {
    super(paramContext, paramCursor, paramBoolean);
  }
  
  private void cleanMapping()
  {
    ArrayList localArrayList = new ArrayList();
    int i = this.mListMapping.size();
    for (int j = 0; j < i; j++) {
      if (this.mListMapping.keyAt(j) == this.mListMapping.valueAt(j)) {
        localArrayList.add(Integer.valueOf(this.mListMapping.keyAt(j)));
      }
    }
    i = localArrayList.size();
    for (j = 0; j < i; j++) {
      this.mListMapping.delete(((Integer)localArrayList.get(j)).intValue());
    }
  }
  
  private void resetMappings()
  {
    this.mListMapping.clear();
    this.mRemovedCursorPositions.clear();
  }
  
  public void changeCursor(Cursor paramCursor)
  {
    super.changeCursor(paramCursor);
    resetMappings();
  }
  
  public void drag(int paramInt1, int paramInt2) {}
  
  public void drop(int paramInt1, int paramInt2)
  {
    if (paramInt1 != paramInt2)
    {
      int i = this.mListMapping.get(paramInt1, paramInt1);
      if (paramInt1 > paramInt2) {
        while (paramInt1 > paramInt2)
        {
          this.mListMapping.put(paramInt1, this.mListMapping.get(paramInt1 - 1, paramInt1 - 1));
          paramInt1--;
        }
      }
      while (paramInt1 < paramInt2)
      {
        this.mListMapping.put(paramInt1, this.mListMapping.get(paramInt1 + 1, paramInt1 + 1));
        paramInt1++;
      }
      this.mListMapping.put(paramInt2, i);
      cleanMapping();
      notifyDataSetChanged();
    }
  }
  
  public int getCount()
  {
    return super.getCount() - this.mRemovedCursorPositions.size();
  }
  
  public int getCursorPosition(int paramInt)
  {
    return this.mListMapping.get(paramInt, paramInt);
  }
  
  public ArrayList<Integer> getCursorPositions()
  {
    ArrayList localArrayList = new ArrayList();
    for (int i = 0; i < getCount(); i++) {
      localArrayList.add(Integer.valueOf(this.mListMapping.get(i, i)));
    }
    return localArrayList;
  }
  
  public View getDropDownView(int paramInt, View paramView, ViewGroup paramViewGroup)
  {
    return super.getDropDownView(this.mListMapping.get(paramInt, paramInt), paramView, paramViewGroup);
  }
  
  public Object getItem(int paramInt)
  {
    return super.getItem(this.mListMapping.get(paramInt, paramInt));
  }
  
  public long getItemId(int paramInt)
  {
    return super.getItemId(this.mListMapping.get(paramInt, paramInt));
  }
  
  public int getListPosition(int paramInt)
  {
    if (this.mRemovedCursorPositions.contains(Integer.valueOf(paramInt))) {
      paramInt = -1;
    }
    for (;;)
    {
      return paramInt;
      int i = this.mListMapping.indexOfValue(paramInt);
      if (i >= 0) {
        paramInt = this.mListMapping.keyAt(i);
      }
    }
  }
  
  public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
  {
    return super.getView(this.mListMapping.get(paramInt, paramInt), paramView, paramViewGroup);
  }
  
  public void remove(int paramInt)
  {
    int i = this.mListMapping.get(paramInt, paramInt);
    if (!this.mRemovedCursorPositions.contains(Integer.valueOf(i))) {
      this.mRemovedCursorPositions.add(Integer.valueOf(i));
    }
    i = getCount();
    while (paramInt < i)
    {
      this.mListMapping.put(paramInt, this.mListMapping.get(paramInt + 1, paramInt + 1));
      paramInt++;
    }
    this.mListMapping.delete(i);
    cleanMapping();
    notifyDataSetChanged();
  }
  
  public void reset()
  {
    resetMappings();
    notifyDataSetChanged();
  }
  
  public Cursor swapCursor(Cursor paramCursor)
  {
    paramCursor = super.swapCursor(paramCursor);
    resetMappings();
    return paramCursor;
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobeta/android/dslv/DragSortCursorAdapter.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */