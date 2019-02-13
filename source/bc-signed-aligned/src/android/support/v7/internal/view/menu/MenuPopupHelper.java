package android.support.v7.internal.view.menu;

import android.content.Context;
import android.content.res.Resources;
import android.os.Parcelable;
import android.support.v7.appcompat.R.attr;
import android.support.v7.appcompat.R.dimen;
import android.support.v7.appcompat.R.layout;
import android.support.v7.internal.widget.ListPopupWindow;
import android.util.DisplayMetrics;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.View.MeasureSpec;
import android.view.View.OnKeyListener;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.ViewTreeObserver.OnGlobalLayoutListener;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.BaseAdapter;
import android.widget.FrameLayout;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.PopupWindow.OnDismissListener;
import java.util.ArrayList;

public class MenuPopupHelper
  implements AdapterView.OnItemClickListener, View.OnKeyListener, ViewTreeObserver.OnGlobalLayoutListener, PopupWindow.OnDismissListener, MenuPresenter
{
  static final int ITEM_LAYOUT = R.layout.abc_popup_menu_item_layout;
  private static final String TAG = "MenuPopupHelper";
  private MenuAdapter mAdapter;
  private View mAnchorView;
  private Context mContext;
  boolean mForceShowIcon;
  private LayoutInflater mInflater;
  private ViewGroup mMeasureParent;
  private MenuBuilder mMenu;
  private boolean mOverflowOnly;
  private ListPopupWindow mPopup;
  private int mPopupMaxWidth;
  private MenuPresenter.Callback mPresenterCallback;
  private ViewTreeObserver mTreeObserver;
  
  public MenuPopupHelper(Context paramContext, MenuBuilder paramMenuBuilder)
  {
    this(paramContext, paramMenuBuilder, null, false);
  }
  
  public MenuPopupHelper(Context paramContext, MenuBuilder paramMenuBuilder, View paramView)
  {
    this(paramContext, paramMenuBuilder, paramView, false);
  }
  
  public MenuPopupHelper(Context paramContext, MenuBuilder paramMenuBuilder, View paramView, boolean paramBoolean)
  {
    this.mContext = paramContext;
    this.mInflater = LayoutInflater.from(paramContext);
    this.mMenu = paramMenuBuilder;
    this.mOverflowOnly = paramBoolean;
    paramContext = paramContext.getResources();
    this.mPopupMaxWidth = Math.max(paramContext.getDisplayMetrics().widthPixels / 2, paramContext.getDimensionPixelSize(R.dimen.abc_config_prefDialogWidth));
    this.mAnchorView = paramView;
    paramMenuBuilder.addMenuPresenter(this);
  }
  
  private int measureContentWidth(ListAdapter paramListAdapter)
  {
    int i = 0;
    View localView = null;
    int j = 0;
    int k = View.MeasureSpec.makeMeasureSpec(0, 0);
    int m = View.MeasureSpec.makeMeasureSpec(0, 0);
    int n = paramListAdapter.getCount();
    int i1 = 0;
    while (i1 < n)
    {
      int i2 = paramListAdapter.getItemViewType(i1);
      int i3 = j;
      if (i2 != j)
      {
        i3 = i2;
        localView = null;
      }
      if (this.mMeasureParent == null) {
        this.mMeasureParent = new FrameLayout(this.mContext);
      }
      localView = paramListAdapter.getView(i1, localView, this.mMeasureParent);
      localView.measure(k, m);
      i = Math.max(i, localView.getMeasuredWidth());
      i1++;
      j = i3;
    }
    return i;
  }
  
  public boolean collapseItemActionView(MenuBuilder paramMenuBuilder, MenuItemImpl paramMenuItemImpl)
  {
    return false;
  }
  
  public void dismiss()
  {
    if (isShowing()) {
      this.mPopup.dismiss();
    }
  }
  
  public boolean expandItemActionView(MenuBuilder paramMenuBuilder, MenuItemImpl paramMenuItemImpl)
  {
    return false;
  }
  
  public boolean flagActionItems()
  {
    return false;
  }
  
  public int getId()
  {
    return 0;
  }
  
  public MenuView getMenuView(ViewGroup paramViewGroup)
  {
    throw new UnsupportedOperationException("MenuPopupHelpers manage their own views");
  }
  
  public void initForMenu(Context paramContext, MenuBuilder paramMenuBuilder) {}
  
  public boolean isShowing()
  {
    if ((this.mPopup != null) && (this.mPopup.isShowing())) {}
    for (boolean bool = true;; bool = false) {
      return bool;
    }
  }
  
  public void onCloseMenu(MenuBuilder paramMenuBuilder, boolean paramBoolean)
  {
    if (paramMenuBuilder != this.mMenu) {}
    for (;;)
    {
      return;
      dismiss();
      if (this.mPresenterCallback != null) {
        this.mPresenterCallback.onCloseMenu(paramMenuBuilder, paramBoolean);
      }
    }
  }
  
  public void onDismiss()
  {
    this.mPopup = null;
    this.mMenu.close();
    if (this.mTreeObserver != null)
    {
      if (!this.mTreeObserver.isAlive()) {
        this.mTreeObserver = this.mAnchorView.getViewTreeObserver();
      }
      this.mTreeObserver.removeGlobalOnLayoutListener(this);
      this.mTreeObserver = null;
    }
  }
  
  public void onGlobalLayout()
  {
    if (isShowing())
    {
      View localView = this.mAnchorView;
      if ((localView != null) && (localView.isShown())) {
        break label28;
      }
      dismiss();
    }
    for (;;)
    {
      return;
      label28:
      if (isShowing()) {
        this.mPopup.show();
      }
    }
  }
  
  public void onItemClick(AdapterView<?> paramAdapterView, View paramView, int paramInt, long paramLong)
  {
    paramAdapterView = this.mAdapter;
    paramAdapterView.mAdapterMenu.performItemAction(paramAdapterView.getItem(paramInt), 0);
  }
  
  public boolean onKey(View paramView, int paramInt, KeyEvent paramKeyEvent)
  {
    boolean bool = true;
    if ((paramKeyEvent.getAction() == 1) && (paramInt == 82)) {
      dismiss();
    }
    for (;;)
    {
      return bool;
      bool = false;
    }
  }
  
  public void onRestoreInstanceState(Parcelable paramParcelable) {}
  
  public Parcelable onSaveInstanceState()
  {
    return null;
  }
  
  public boolean onSubMenuSelected(SubMenuBuilder paramSubMenuBuilder)
  {
    boolean bool1 = false;
    boolean bool2 = bool1;
    MenuPopupHelper localMenuPopupHelper;
    boolean bool3;
    int i;
    if (paramSubMenuBuilder.hasVisibleItems())
    {
      localMenuPopupHelper = new MenuPopupHelper(this.mContext, paramSubMenuBuilder, this.mAnchorView, false);
      localMenuPopupHelper.setCallback(this.mPresenterCallback);
      bool3 = false;
      i = paramSubMenuBuilder.size();
    }
    for (int j = 0;; j++)
    {
      bool2 = bool3;
      if (j < i)
      {
        MenuItem localMenuItem = paramSubMenuBuilder.getItem(j);
        if ((localMenuItem.isVisible()) && (localMenuItem.getIcon() != null)) {
          bool2 = true;
        }
      }
      else
      {
        localMenuPopupHelper.setForceShowIcon(bool2);
        bool2 = bool1;
        if (localMenuPopupHelper.tryShow())
        {
          if (this.mPresenterCallback != null) {
            this.mPresenterCallback.onOpenSubMenu(paramSubMenuBuilder);
          }
          bool2 = true;
        }
        return bool2;
      }
    }
  }
  
  public void setAnchorView(View paramView)
  {
    this.mAnchorView = paramView;
  }
  
  public void setCallback(MenuPresenter.Callback paramCallback)
  {
    this.mPresenterCallback = paramCallback;
  }
  
  public void setForceShowIcon(boolean paramBoolean)
  {
    this.mForceShowIcon = paramBoolean;
  }
  
  public void show()
  {
    if (!tryShow()) {
      throw new IllegalStateException("MenuPopupHelper cannot be used without an anchor");
    }
  }
  
  public boolean tryShow()
  {
    int i = 0;
    boolean bool = true;
    this.mPopup = new ListPopupWindow(this.mContext, null, R.attr.popupMenuStyle);
    this.mPopup.setOnDismissListener(this);
    this.mPopup.setOnItemClickListener(this);
    this.mAdapter = new MenuAdapter(this.mMenu);
    this.mPopup.setAdapter(this.mAdapter);
    this.mPopup.setModal(true);
    View localView = this.mAnchorView;
    if (localView != null)
    {
      if (this.mTreeObserver == null) {
        i = 1;
      }
      this.mTreeObserver = localView.getViewTreeObserver();
      if (i != 0) {
        this.mTreeObserver.addOnGlobalLayoutListener(this);
      }
      this.mPopup.setAnchorView(localView);
      this.mPopup.setContentWidth(Math.min(measureContentWidth(this.mAdapter), this.mPopupMaxWidth));
      this.mPopup.setInputMethodMode(2);
      this.mPopup.show();
      this.mPopup.getListView().setOnKeyListener(this);
    }
    for (;;)
    {
      return bool;
      bool = false;
    }
  }
  
  public void updateMenuView(boolean paramBoolean)
  {
    if (this.mAdapter != null) {
      this.mAdapter.notifyDataSetChanged();
    }
  }
  
  private class MenuAdapter
    extends BaseAdapter
  {
    private MenuBuilder mAdapterMenu;
    private int mExpandedIndex = -1;
    
    public MenuAdapter(MenuBuilder paramMenuBuilder)
    {
      this.mAdapterMenu = paramMenuBuilder;
      findExpandedIndex();
    }
    
    void findExpandedIndex()
    {
      MenuItemImpl localMenuItemImpl = MenuPopupHelper.this.mMenu.getExpandedItem();
      int j;
      if (localMenuItemImpl != null)
      {
        ArrayList localArrayList = MenuPopupHelper.this.mMenu.getNonActionItems();
        int i = localArrayList.size();
        j = 0;
        if (j < i) {
          if ((MenuItemImpl)localArrayList.get(j) != localMenuItemImpl) {}
        }
      }
      for (this.mExpandedIndex = j;; this.mExpandedIndex = -1)
      {
        return;
        j++;
        break;
      }
    }
    
    public int getCount()
    {
      ArrayList localArrayList;
      if (MenuPopupHelper.this.mOverflowOnly)
      {
        localArrayList = this.mAdapterMenu.getNonActionItems();
        if (this.mExpandedIndex >= 0) {
          break label43;
        }
      }
      label43:
      for (int i = localArrayList.size();; i = localArrayList.size() - 1)
      {
        return i;
        localArrayList = this.mAdapterMenu.getVisibleItems();
        break;
      }
    }
    
    public MenuItemImpl getItem(int paramInt)
    {
      if (MenuPopupHelper.this.mOverflowOnly) {}
      for (ArrayList localArrayList = this.mAdapterMenu.getNonActionItems();; localArrayList = this.mAdapterMenu.getVisibleItems())
      {
        int i = paramInt;
        if (this.mExpandedIndex >= 0)
        {
          i = paramInt;
          if (paramInt >= this.mExpandedIndex) {
            i = paramInt + 1;
          }
        }
        return (MenuItemImpl)localArrayList.get(i);
      }
    }
    
    public long getItemId(int paramInt)
    {
      return paramInt;
    }
    
    public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
    {
      View localView = paramView;
      if (paramView == null) {
        localView = MenuPopupHelper.this.mInflater.inflate(MenuPopupHelper.ITEM_LAYOUT, paramViewGroup, false);
      }
      paramView = (MenuView.ItemView)localView;
      if (MenuPopupHelper.this.mForceShowIcon) {
        ((ListMenuItemView)localView).setForceShowIcon(true);
      }
      paramView.initialize(getItem(paramInt), 0);
      return localView;
    }
    
    public void notifyDataSetChanged()
    {
      findExpandedIndex();
      super.notifyDataSetChanged();
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/android/support/v7/internal/view/menu/MenuPopupHelper.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */