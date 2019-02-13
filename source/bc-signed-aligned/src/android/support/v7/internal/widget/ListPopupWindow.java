package android.support.v7.internal.widget;

import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.database.DataSetObserver;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.support.v7.appcompat.R.attr;
import android.util.AttributeSet;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.MeasureSpec;
import android.view.View.OnTouchListener;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.view.ViewParent;
import android.widget.AbsListView;
import android.widget.AbsListView.OnScrollListener;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.AdapterView.OnItemSelectedListener;
import android.widget.LinearLayout;
import android.widget.LinearLayout.LayoutParams;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.PopupWindow;
import android.widget.PopupWindow.OnDismissListener;

public class ListPopupWindow
{
  private static final boolean DEBUG = false;
  private static final int EXPAND_LIST_TIMEOUT = 250;
  public static final int FILL_PARENT = -1;
  public static final int INPUT_METHOD_FROM_FOCUSABLE = 0;
  public static final int INPUT_METHOD_NEEDED = 1;
  public static final int INPUT_METHOD_NOT_NEEDED = 2;
  public static final int POSITION_PROMPT_ABOVE = 0;
  public static final int POSITION_PROMPT_BELOW = 1;
  private static final String TAG = "ListPopupWindow";
  public static final int WRAP_CONTENT = -2;
  private ListAdapter mAdapter;
  private Context mContext;
  private boolean mDropDownAlwaysVisible = false;
  private View mDropDownAnchorView;
  private int mDropDownHeight = -2;
  private int mDropDownHorizontalOffset;
  private DropDownListView mDropDownList;
  private Drawable mDropDownListHighlight;
  private int mDropDownVerticalOffset;
  private boolean mDropDownVerticalOffsetSet;
  private int mDropDownWidth = -2;
  private boolean mForceIgnoreOutsideTouch = false;
  private Handler mHandler = new Handler();
  private final ListSelectorHider mHideSelector = new ListSelectorHider(null);
  private AdapterView.OnItemClickListener mItemClickListener;
  private AdapterView.OnItemSelectedListener mItemSelectedListener;
  private int mLayoutDirection;
  int mListItemExpandMaximum = Integer.MAX_VALUE;
  private boolean mModal;
  private DataSetObserver mObserver;
  private PopupWindow mPopup;
  private int mPromptPosition = 0;
  private View mPromptView;
  private final ResizePopupRunnable mResizePopupRunnable = new ResizePopupRunnable(null);
  private final PopupScrollListener mScrollListener = new PopupScrollListener(null);
  private Runnable mShowDropDownRunnable;
  private Rect mTempRect = new Rect();
  private final PopupTouchInterceptor mTouchInterceptor = new PopupTouchInterceptor(null);
  
  public ListPopupWindow(Context paramContext)
  {
    this(paramContext, null, R.attr.listPopupWindowStyle);
  }
  
  public ListPopupWindow(Context paramContext, AttributeSet paramAttributeSet)
  {
    this(paramContext, paramAttributeSet, R.attr.listPopupWindowStyle);
  }
  
  public ListPopupWindow(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    this.mContext = paramContext;
    this.mPopup = new PopupWindow(paramContext, paramAttributeSet, paramInt);
    this.mPopup.setInputMethodMode(1);
    paramContext = this.mContext.getResources().getConfiguration().locale;
  }
  
  private int buildDropDown()
  {
    int i = 0;
    int j = 0;
    Object localObject1;
    Object localObject2;
    View localView;
    Object localObject3;
    label256:
    label309:
    int k;
    if (this.mDropDownList == null)
    {
      localObject1 = this.mContext;
      this.mShowDropDownRunnable = new Runnable()
      {
        public void run()
        {
          View localView = ListPopupWindow.this.getAnchorView();
          if ((localView != null) && (localView.getWindowToken() != null)) {
            ListPopupWindow.this.show();
          }
        }
      };
      if (!this.mModal)
      {
        bool = true;
        this.mDropDownList = new DropDownListView((Context)localObject1, bool);
        if (this.mDropDownListHighlight != null) {
          this.mDropDownList.setSelector(this.mDropDownListHighlight);
        }
        this.mDropDownList.setAdapter(this.mAdapter);
        this.mDropDownList.setOnItemClickListener(this.mItemClickListener);
        this.mDropDownList.setFocusable(true);
        this.mDropDownList.setFocusableInTouchMode(true);
        this.mDropDownList.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener()
        {
          public void onItemSelected(AdapterView<?> paramAnonymousAdapterView, View paramAnonymousView, int paramAnonymousInt, long paramAnonymousLong)
          {
            if (paramAnonymousInt != -1)
            {
              paramAnonymousAdapterView = ListPopupWindow.this.mDropDownList;
              if (paramAnonymousAdapterView != null) {
                ListPopupWindow.DropDownListView.access$502(paramAnonymousAdapterView, false);
              }
            }
          }
          
          public void onNothingSelected(AdapterView<?> paramAnonymousAdapterView) {}
        });
        this.mDropDownList.setOnScrollListener(this.mScrollListener);
        if (this.mItemSelectedListener != null) {
          this.mDropDownList.setOnItemSelectedListener(this.mItemSelectedListener);
        }
        localObject2 = this.mDropDownList;
        localView = this.mPromptView;
        localObject3 = localObject2;
        if (localView != null)
        {
          localObject3 = new LinearLayout((Context)localObject1);
          ((LinearLayout)localObject3).setOrientation(1);
          localObject1 = new LinearLayout.LayoutParams(-1, 0, 1.0F);
        }
        switch (this.mPromptPosition)
        {
        default: 
          Log.e("ListPopupWindow", "Invalid hint position " + this.mPromptPosition);
          localView.measure(View.MeasureSpec.makeMeasureSpec(this.mDropDownWidth, Integer.MIN_VALUE), 0);
          localObject2 = (LinearLayout.LayoutParams)localView.getLayoutParams();
          j = localView.getMeasuredHeight() + ((LinearLayout.LayoutParams)localObject2).topMargin + ((LinearLayout.LayoutParams)localObject2).bottomMargin;
          this.mPopup.setContentView((View)localObject3);
          k = 0;
          localObject3 = this.mPopup.getBackground();
          if (localObject3 != null)
          {
            ((Drawable)localObject3).getPadding(this.mTempRect);
            i = this.mTempRect.top + this.mTempRect.bottom;
            k = i;
            if (!this.mDropDownVerticalOffsetSet)
            {
              this.mDropDownVerticalOffset = (-this.mTempRect.top);
              k = i;
            }
            label377:
            if (this.mPopup.getInputMethodMode() != 2) {
              break label538;
            }
          }
          break;
        }
      }
    }
    int m;
    label538:
    for (boolean bool = true;; bool = false)
    {
      m = getMaxAvailableHeight(getAnchorView(), this.mDropDownVerticalOffset, bool);
      if ((!this.mDropDownAlwaysVisible) && (this.mDropDownHeight != -1)) {
        break label544;
      }
      j = m + k;
      return j;
      bool = false;
      break;
      ((LinearLayout)localObject3).addView((View)localObject2, (ViewGroup.LayoutParams)localObject1);
      ((LinearLayout)localObject3).addView(localView);
      break label256;
      ((LinearLayout)localObject3).addView(localView);
      ((LinearLayout)localObject3).addView((View)localObject2, (ViewGroup.LayoutParams)localObject1);
      break label256;
      localObject3 = (ViewGroup)this.mPopup.getContentView();
      localObject2 = this.mPromptView;
      j = i;
      if (localObject2 == null) {
        break label309;
      }
      localObject3 = (LinearLayout.LayoutParams)((View)localObject2).getLayoutParams();
      j = ((View)localObject2).getMeasuredHeight() + ((LinearLayout.LayoutParams)localObject3).topMargin + ((LinearLayout.LayoutParams)localObject3).bottomMargin;
      break label309;
      this.mTempRect.setEmpty();
      break label377;
    }
    label544:
    switch (this.mDropDownWidth)
    {
    default: 
      i = View.MeasureSpec.makeMeasureSpec(this.mDropDownWidth, 1073741824);
    }
    for (;;)
    {
      m = this.mDropDownList.measureHeightOfChildrenCompat(i, 0, -1, m - j, -1);
      i = j;
      if (m > 0) {
        i = j + k;
      }
      j = m + i;
      break;
      i = View.MeasureSpec.makeMeasureSpec(this.mContext.getResources().getDisplayMetrics().widthPixels - (this.mTempRect.left + this.mTempRect.right), Integer.MIN_VALUE);
      continue;
      i = View.MeasureSpec.makeMeasureSpec(this.mContext.getResources().getDisplayMetrics().widthPixels - (this.mTempRect.left + this.mTempRect.right), 1073741824);
    }
  }
  
  private void removePromptView()
  {
    if (this.mPromptView != null)
    {
      ViewParent localViewParent = this.mPromptView.getParent();
      if ((localViewParent instanceof ViewGroup)) {
        ((ViewGroup)localViewParent).removeView(this.mPromptView);
      }
    }
  }
  
  public void clearListSelection()
  {
    DropDownListView localDropDownListView = this.mDropDownList;
    if (localDropDownListView != null)
    {
      DropDownListView.access$502(localDropDownListView, true);
      localDropDownListView.requestLayout();
    }
  }
  
  public void dismiss()
  {
    this.mPopup.dismiss();
    removePromptView();
    this.mPopup.setContentView(null);
    this.mDropDownList = null;
    this.mHandler.removeCallbacks(this.mResizePopupRunnable);
  }
  
  public View getAnchorView()
  {
    return this.mDropDownAnchorView;
  }
  
  public int getAnimationStyle()
  {
    return this.mPopup.getAnimationStyle();
  }
  
  public Drawable getBackground()
  {
    return this.mPopup.getBackground();
  }
  
  public int getHeight()
  {
    return this.mDropDownHeight;
  }
  
  public int getHorizontalOffset()
  {
    return this.mDropDownHorizontalOffset;
  }
  
  public int getInputMethodMode()
  {
    return this.mPopup.getInputMethodMode();
  }
  
  public ListView getListView()
  {
    return this.mDropDownList;
  }
  
  public int getMaxAvailableHeight(View paramView, int paramInt, boolean paramBoolean)
  {
    Rect localRect = new Rect();
    paramView.getWindowVisibleDisplayFrame(localRect);
    int[] arrayOfInt = new int[2];
    paramView.getLocationOnScreen(arrayOfInt);
    int i = localRect.bottom;
    if (paramBoolean) {
      i = paramView.getContext().getResources().getDisplayMetrics().heightPixels;
    }
    i = Math.max(i - (arrayOfInt[1] + paramView.getHeight()) - paramInt, arrayOfInt[1] - localRect.top + paramInt);
    paramInt = i;
    if (this.mPopup.getBackground() != null)
    {
      this.mPopup.getBackground().getPadding(this.mTempRect);
      paramInt = i - (this.mTempRect.top + this.mTempRect.bottom);
    }
    return paramInt;
  }
  
  public int getPromptPosition()
  {
    return this.mPromptPosition;
  }
  
  public Object getSelectedItem()
  {
    if (!isShowing()) {}
    for (Object localObject = null;; localObject = this.mDropDownList.getSelectedItem()) {
      return localObject;
    }
  }
  
  public long getSelectedItemId()
  {
    if (!isShowing()) {}
    for (long l = Long.MIN_VALUE;; l = this.mDropDownList.getSelectedItemId()) {
      return l;
    }
  }
  
  public int getSelectedItemPosition()
  {
    if (!isShowing()) {}
    for (int i = -1;; i = this.mDropDownList.getSelectedItemPosition()) {
      return i;
    }
  }
  
  public View getSelectedView()
  {
    if (!isShowing()) {}
    for (View localView = null;; localView = this.mDropDownList.getSelectedView()) {
      return localView;
    }
  }
  
  public int getSoftInputMode()
  {
    return this.mPopup.getSoftInputMode();
  }
  
  public int getVerticalOffset()
  {
    if (!this.mDropDownVerticalOffsetSet) {}
    for (int i = 0;; i = this.mDropDownVerticalOffset) {
      return i;
    }
  }
  
  public int getWidth()
  {
    return this.mDropDownWidth;
  }
  
  public boolean isDropDownAlwaysVisible()
  {
    return this.mDropDownAlwaysVisible;
  }
  
  public boolean isInputMethodNotNeeded()
  {
    if (this.mPopup.getInputMethodMode() == 2) {}
    for (boolean bool = true;; bool = false) {
      return bool;
    }
  }
  
  public boolean isModal()
  {
    return this.mModal;
  }
  
  public boolean isShowing()
  {
    return this.mPopup.isShowing();
  }
  
  public boolean onKeyDown(int paramInt, KeyEvent paramKeyEvent)
  {
    boolean bool1 = true;
    int i;
    int j;
    ListAdapter localListAdapter;
    int k;
    int m;
    if ((isShowing()) && (paramInt != 62) && ((this.mDropDownList.getSelectedItemPosition() >= 0) || ((paramInt != 66) && (paramInt != 23))))
    {
      i = this.mDropDownList.getSelectedItemPosition();
      if (!this.mPopup.isAboveAnchor())
      {
        j = 1;
        localListAdapter = this.mAdapter;
        k = Integer.MAX_VALUE;
        m = Integer.MIN_VALUE;
        if (localListAdapter != null)
        {
          boolean bool2 = localListAdapter.areAllItemsEnabled();
          if (!bool2) {
            break label172;
          }
          k = 0;
          label96:
          if (!bool2) {
            break label186;
          }
          m = localListAdapter.getCount() - 1;
        }
        label112:
        if (((j == 0) || (paramInt != 19) || (i > k)) && ((j != 0) || (paramInt != 20) || (i < m))) {
          break label208;
        }
        clearListSelection();
        this.mPopup.setInputMethodMode(1);
        show();
      }
    }
    for (;;)
    {
      return bool1;
      j = 0;
      break;
      label172:
      k = this.mDropDownList.lookForSelectablePosition(0, true);
      break label96;
      label186:
      m = this.mDropDownList.lookForSelectablePosition(localListAdapter.getCount() - 1, false);
      break label112;
      label208:
      DropDownListView.access$502(this.mDropDownList, false);
      if (this.mDropDownList.onKeyDown(paramInt, paramKeyEvent))
      {
        this.mPopup.setInputMethodMode(2);
        this.mDropDownList.requestFocusFromTouch();
        show();
        switch (paramInt)
        {
        }
      }
      label318:
      do
      {
        do
        {
          bool1 = false;
          break;
          if ((j == 0) || (paramInt != 20)) {
            break label318;
          }
        } while (i != m);
        break;
      } while ((j != 0) || (paramInt != 19) || (i != k));
    }
  }
  
  public boolean onKeyUp(int paramInt, KeyEvent paramKeyEvent)
  {
    boolean bool1;
    boolean bool2;
    if ((isShowing()) && (this.mDropDownList.getSelectedItemPosition() >= 0))
    {
      bool1 = this.mDropDownList.onKeyUp(paramInt, paramKeyEvent);
      bool2 = bool1;
      if (bool1) {
        switch (paramInt)
        {
        default: 
          bool2 = bool1;
        }
      }
    }
    for (;;)
    {
      return bool2;
      dismiss();
      bool2 = bool1;
      continue;
      bool2 = false;
    }
  }
  
  public boolean performItemClick(int paramInt)
  {
    if (isShowing()) {
      if (this.mItemClickListener != null)
      {
        DropDownListView localDropDownListView = this.mDropDownList;
        View localView = localDropDownListView.getChildAt(paramInt - localDropDownListView.getFirstVisiblePosition());
        ListAdapter localListAdapter = localDropDownListView.getAdapter();
        this.mItemClickListener.onItemClick(localDropDownListView, localView, paramInt, localListAdapter.getItemId(paramInt));
      }
    }
    for (boolean bool = true;; bool = false) {
      return bool;
    }
  }
  
  public void postShow()
  {
    this.mHandler.post(this.mShowDropDownRunnable);
  }
  
  public void setAdapter(ListAdapter paramListAdapter)
  {
    if (this.mObserver == null) {
      this.mObserver = new PopupDataSetObserver(null);
    }
    for (;;)
    {
      this.mAdapter = paramListAdapter;
      if (this.mAdapter != null) {
        paramListAdapter.registerDataSetObserver(this.mObserver);
      }
      if (this.mDropDownList != null) {
        this.mDropDownList.setAdapter(this.mAdapter);
      }
      return;
      if (this.mAdapter != null) {
        this.mAdapter.unregisterDataSetObserver(this.mObserver);
      }
    }
  }
  
  public void setAnchorView(View paramView)
  {
    this.mDropDownAnchorView = paramView;
  }
  
  public void setAnimationStyle(int paramInt)
  {
    this.mPopup.setAnimationStyle(paramInt);
  }
  
  public void setBackgroundDrawable(Drawable paramDrawable)
  {
    this.mPopup.setBackgroundDrawable(paramDrawable);
  }
  
  public void setContentWidth(int paramInt)
  {
    Drawable localDrawable = this.mPopup.getBackground();
    if (localDrawable != null)
    {
      localDrawable.getPadding(this.mTempRect);
      this.mDropDownWidth = (this.mTempRect.left + this.mTempRect.right + paramInt);
    }
    for (;;)
    {
      return;
      setWidth(paramInt);
    }
  }
  
  public void setDropDownAlwaysVisible(boolean paramBoolean)
  {
    this.mDropDownAlwaysVisible = paramBoolean;
  }
  
  public void setForceIgnoreOutsideTouch(boolean paramBoolean)
  {
    this.mForceIgnoreOutsideTouch = paramBoolean;
  }
  
  public void setHeight(int paramInt)
  {
    this.mDropDownHeight = paramInt;
  }
  
  public void setHorizontalOffset(int paramInt)
  {
    this.mDropDownHorizontalOffset = paramInt;
  }
  
  public void setInputMethodMode(int paramInt)
  {
    this.mPopup.setInputMethodMode(paramInt);
  }
  
  void setListItemExpandMax(int paramInt)
  {
    this.mListItemExpandMaximum = paramInt;
  }
  
  public void setListSelector(Drawable paramDrawable)
  {
    this.mDropDownListHighlight = paramDrawable;
  }
  
  public void setModal(boolean paramBoolean)
  {
    this.mModal = true;
    this.mPopup.setFocusable(paramBoolean);
  }
  
  public void setOnDismissListener(PopupWindow.OnDismissListener paramOnDismissListener)
  {
    this.mPopup.setOnDismissListener(paramOnDismissListener);
  }
  
  public void setOnItemClickListener(AdapterView.OnItemClickListener paramOnItemClickListener)
  {
    this.mItemClickListener = paramOnItemClickListener;
  }
  
  public void setOnItemSelectedListener(AdapterView.OnItemSelectedListener paramOnItemSelectedListener)
  {
    this.mItemSelectedListener = paramOnItemSelectedListener;
  }
  
  public void setPromptPosition(int paramInt)
  {
    this.mPromptPosition = paramInt;
  }
  
  public void setPromptView(View paramView)
  {
    boolean bool = isShowing();
    if (bool) {
      removePromptView();
    }
    this.mPromptView = paramView;
    if (bool) {
      show();
    }
  }
  
  public void setSelection(int paramInt)
  {
    DropDownListView localDropDownListView = this.mDropDownList;
    if ((isShowing()) && (localDropDownListView != null))
    {
      DropDownListView.access$502(localDropDownListView, false);
      localDropDownListView.setSelection(paramInt);
      if (localDropDownListView.getChoiceMode() != 0) {
        localDropDownListView.setItemChecked(paramInt, true);
      }
    }
  }
  
  public void setSoftInputMode(int paramInt)
  {
    this.mPopup.setSoftInputMode(paramInt);
  }
  
  public void setVerticalOffset(int paramInt)
  {
    this.mDropDownVerticalOffset = paramInt;
    this.mDropDownVerticalOffsetSet = true;
  }
  
  public void setWidth(int paramInt)
  {
    this.mDropDownWidth = paramInt;
  }
  
  public void show()
  {
    boolean bool1 = true;
    boolean bool2 = false;
    int i = -1;
    int j = buildDropDown();
    int k = 0;
    int m = 0;
    boolean bool3 = isInputMethodNotNeeded();
    label58:
    PopupWindow localPopupWindow;
    if (this.mPopup.isShowing())
    {
      if (this.mDropDownWidth == -1)
      {
        k = -1;
        if (this.mDropDownHeight != -1) {
          break label212;
        }
        if (!bool3) {
          break label170;
        }
        if (!bool3) {
          break label181;
        }
        localPopupWindow = this.mPopup;
        if (this.mDropDownWidth != -1) {
          break label176;
        }
        label77:
        localPopupWindow.setWindowLayoutMode(i, 0);
      }
      for (;;)
      {
        localPopupWindow = this.mPopup;
        bool1 = bool2;
        if (!this.mForceIgnoreOutsideTouch)
        {
          bool1 = bool2;
          if (!this.mDropDownAlwaysVisible) {
            bool1 = true;
          }
        }
        localPopupWindow.setOutsideTouchable(bool1);
        this.mPopup.update(getAnchorView(), this.mDropDownHorizontalOffset, this.mDropDownVerticalOffset, k, j);
        return;
        if (this.mDropDownWidth == -2)
        {
          k = getAnchorView().getWidth();
          break;
        }
        k = this.mDropDownWidth;
        break;
        label170:
        j = -1;
        break label58;
        label176:
        i = 0;
        break label77;
        label181:
        localPopupWindow = this.mPopup;
        if (this.mDropDownWidth == -1) {}
        for (i = -1;; i = 0)
        {
          localPopupWindow.setWindowLayoutMode(i, -1);
          break;
        }
        label212:
        if (this.mDropDownHeight != -2) {
          j = this.mDropDownHeight;
        }
      }
    }
    if (this.mDropDownWidth == -1)
    {
      k = -1;
      label244:
      if (this.mDropDownHeight != -1) {
        break label413;
      }
      j = -1;
      label255:
      this.mPopup.setWindowLayoutMode(k, j);
      localPopupWindow = this.mPopup;
      if ((this.mForceIgnoreOutsideTouch) || (this.mDropDownAlwaysVisible)) {
        break label456;
      }
    }
    for (;;)
    {
      localPopupWindow.setOutsideTouchable(bool1);
      this.mPopup.setTouchInterceptor(this.mTouchInterceptor);
      this.mPopup.showAsDropDown(getAnchorView(), this.mDropDownHorizontalOffset, this.mDropDownVerticalOffset);
      this.mDropDownList.setSelection(-1);
      if ((!this.mModal) || (this.mDropDownList.isInTouchMode())) {
        clearListSelection();
      }
      if (this.mModal) {
        break;
      }
      this.mHandler.post(this.mHideSelector);
      break;
      if (this.mDropDownWidth == -2)
      {
        this.mPopup.setWidth(getAnchorView().getWidth());
        break label244;
      }
      this.mPopup.setWidth(this.mDropDownWidth);
      break label244;
      label413:
      if (this.mDropDownHeight == -2)
      {
        this.mPopup.setHeight(j);
        j = m;
        break label255;
      }
      this.mPopup.setHeight(this.mDropDownHeight);
      j = m;
      break label255;
      label456:
      bool1 = false;
    }
  }
  
  private static class DropDownListView
    extends ListView
  {
    public static final int INVALID_POSITION = -1;
    static final int NO_POSITION = -1;
    private static final String TAG = "ListPopupWindow.DropDownListView";
    private boolean mHijackFocus;
    private boolean mListSelectionHidden;
    
    public DropDownListView(Context paramContext, boolean paramBoolean)
    {
      super(null, R.attr.dropDownListViewStyle);
      this.mHijackFocus = paramBoolean;
      setCacheColorHint(0);
    }
    
    private int lookForSelectablePosition(int paramInt, boolean paramBoolean)
    {
      int i = -1;
      ListAdapter localListAdapter = getAdapter();
      int j = i;
      if (localListAdapter != null)
      {
        if (!isInTouchMode()) {
          break label29;
        }
        j = i;
      }
      for (;;)
      {
        return j;
        label29:
        int k = localListAdapter.getCount();
        if (!getAdapter().areAllItemsEnabled())
        {
          if (paramBoolean) {
            for (j = Math.max(0, paramInt);; j++)
            {
              paramInt = j;
              if (j >= k) {
                break;
              }
              paramInt = j;
              if (localListAdapter.isEnabled(j)) {
                break;
              }
            }
          }
          for (j = Math.min(paramInt, k - 1);; j--)
          {
            paramInt = j;
            if (j < 0) {
              break;
            }
            paramInt = j;
            if (localListAdapter.isEnabled(j)) {
              break;
            }
          }
          j = i;
          if (paramInt >= 0)
          {
            j = i;
            if (paramInt < k) {
              j = paramInt;
            }
          }
        }
        else
        {
          j = i;
          if (paramInt >= 0)
          {
            j = i;
            if (paramInt < k) {
              j = paramInt;
            }
          }
        }
      }
    }
    
    public boolean hasFocus()
    {
      if ((this.mHijackFocus) || (super.hasFocus())) {}
      for (boolean bool = true;; bool = false) {
        return bool;
      }
    }
    
    public boolean hasWindowFocus()
    {
      if ((this.mHijackFocus) || (super.hasWindowFocus())) {}
      for (boolean bool = true;; bool = false) {
        return bool;
      }
    }
    
    public boolean isFocused()
    {
      if ((this.mHijackFocus) || (super.isFocused())) {}
      for (boolean bool = true;; bool = false) {
        return bool;
      }
    }
    
    public boolean isInTouchMode()
    {
      if (((this.mHijackFocus) && (this.mListSelectionHidden)) || (super.isInTouchMode())) {}
      for (boolean bool = true;; bool = false) {
        return bool;
      }
    }
    
    final int measureHeightOfChildrenCompat(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5)
    {
      paramInt2 = getListPaddingTop();
      paramInt3 = getListPaddingBottom();
      getListPaddingLeft();
      getListPaddingRight();
      int i = getDividerHeight();
      Object localObject = getDivider();
      ListAdapter localListAdapter = getAdapter();
      if (localListAdapter == null) {
        paramInt1 = paramInt2 + paramInt3;
      }
      for (;;)
      {
        return paramInt1;
        paramInt2 += paramInt3;
        label63:
        int j;
        int k;
        int m;
        if ((i > 0) && (localObject != null))
        {
          paramInt3 = 0;
          localObject = null;
          j = 0;
          k = localListAdapter.getCount();
          m = 0;
        }
        for (;;)
        {
          if (m >= k) {
            break label282;
          }
          int n = localListAdapter.getItemViewType(m);
          int i1 = j;
          if (n != j)
          {
            localObject = null;
            i1 = n;
          }
          localObject = localListAdapter.getView(m, (View)localObject, this);
          ViewGroup.LayoutParams localLayoutParams = ((View)localObject).getLayoutParams();
          if ((localLayoutParams != null) && (localLayoutParams.height > 0)) {}
          for (j = View.MeasureSpec.makeMeasureSpec(localLayoutParams.height, 1073741824);; j = View.MeasureSpec.makeMeasureSpec(0, 0))
          {
            ((View)localObject).measure(paramInt1, j);
            j = paramInt2;
            if (m > 0) {
              j = paramInt2 + i;
            }
            paramInt2 = j + ((View)localObject).getMeasuredHeight();
            if (paramInt2 < paramInt4) {
              break label248;
            }
            if ((paramInt5 >= 0) && (m > paramInt5) && (paramInt3 > 0))
            {
              paramInt1 = paramInt3;
              if (paramInt2 != paramInt4) {
                break;
              }
            }
            paramInt1 = paramInt4;
            break;
            i = 0;
            break label63;
          }
          label248:
          j = paramInt3;
          if (paramInt5 >= 0)
          {
            j = paramInt3;
            if (m >= paramInt5) {
              j = paramInt2;
            }
          }
          m++;
          paramInt3 = j;
          j = i1;
        }
        label282:
        paramInt1 = paramInt2;
      }
    }
  }
  
  private class ListSelectorHider
    implements Runnable
  {
    private ListSelectorHider() {}
    
    public void run()
    {
      ListPopupWindow.this.clearListSelection();
    }
  }
  
  private class PopupDataSetObserver
    extends DataSetObserver
  {
    private PopupDataSetObserver() {}
    
    public void onChanged()
    {
      if (ListPopupWindow.this.isShowing()) {
        ListPopupWindow.this.show();
      }
    }
    
    public void onInvalidated()
    {
      ListPopupWindow.this.dismiss();
    }
  }
  
  private class PopupScrollListener
    implements AbsListView.OnScrollListener
  {
    private PopupScrollListener() {}
    
    public void onScroll(AbsListView paramAbsListView, int paramInt1, int paramInt2, int paramInt3) {}
    
    public void onScrollStateChanged(AbsListView paramAbsListView, int paramInt)
    {
      if ((paramInt == 1) && (!ListPopupWindow.this.isInputMethodNotNeeded()) && (ListPopupWindow.this.mPopup.getContentView() != null))
      {
        ListPopupWindow.this.mHandler.removeCallbacks(ListPopupWindow.this.mResizePopupRunnable);
        ListPopupWindow.this.mResizePopupRunnable.run();
      }
    }
  }
  
  private class PopupTouchInterceptor
    implements View.OnTouchListener
  {
    private PopupTouchInterceptor() {}
    
    public boolean onTouch(View paramView, MotionEvent paramMotionEvent)
    {
      int i = paramMotionEvent.getAction();
      int j = (int)paramMotionEvent.getX();
      int k = (int)paramMotionEvent.getY();
      if ((i == 0) && (ListPopupWindow.this.mPopup != null) && (ListPopupWindow.this.mPopup.isShowing()) && (j >= 0) && (j < ListPopupWindow.this.mPopup.getWidth()) && (k >= 0) && (k < ListPopupWindow.this.mPopup.getHeight())) {
        ListPopupWindow.this.mHandler.postDelayed(ListPopupWindow.this.mResizePopupRunnable, 250L);
      }
      for (;;)
      {
        return false;
        if (i == 1) {
          ListPopupWindow.this.mHandler.removeCallbacks(ListPopupWindow.this.mResizePopupRunnable);
        }
      }
    }
  }
  
  private class ResizePopupRunnable
    implements Runnable
  {
    private ResizePopupRunnable() {}
    
    public void run()
    {
      if ((ListPopupWindow.this.mDropDownList != null) && (ListPopupWindow.this.mDropDownList.getCount() > ListPopupWindow.this.mDropDownList.getChildCount()) && (ListPopupWindow.this.mDropDownList.getChildCount() <= ListPopupWindow.this.mListItemExpandMaximum))
      {
        ListPopupWindow.this.mPopup.setInputMethodMode(2);
        ListPopupWindow.this.show();
      }
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/android/support/v7/internal/widget/ListPopupWindow.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */