package android.support.v7.internal.view.menu;

import android.content.Context;
import android.content.DialogInterface;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.support.v4.view.ActionProvider;
import android.support.v4.view.ActionProvider.SubUiVisibilityListener;
import android.support.v7.appcompat.R.attr;
import android.support.v7.appcompat.R.integer;
import android.support.v7.appcompat.R.layout;
import android.support.v7.internal.view.ActionBarPolicy;
import android.util.DisplayMetrics;
import android.util.SparseBooleanArray;
import android.view.MenuItem;
import android.view.View;
import android.view.View.MeasureSpec;
import android.view.ViewGroup;
import android.widget.ImageButton;
import java.util.ArrayList;

public class ActionMenuPresenter
  extends BaseMenuPresenter
  implements ActionProvider.SubUiVisibilityListener
{
  private static final String TAG = "ActionMenuPresenter";
  private final SparseBooleanArray mActionButtonGroups = new SparseBooleanArray();
  private ActionButtonSubmenu mActionButtonPopup;
  private int mActionItemWidthLimit;
  private boolean mExpandedActionViewsExclusive;
  private int mMaxItems;
  private boolean mMaxItemsSet;
  private int mMinCellSize;
  int mOpenSubMenuId;
  private View mOverflowButton;
  private OverflowPopup mOverflowPopup;
  final PopupPresenterCallback mPopupPresenterCallback = new PopupPresenterCallback(null);
  private OpenOverflowRunnable mPostedOpenRunnable;
  private boolean mReserveOverflow;
  private boolean mReserveOverflowSet;
  private View mScrapActionButtonView;
  private boolean mStrictWidthLimit;
  private int mWidthLimit;
  private boolean mWidthLimitSet;
  
  public ActionMenuPresenter(Context paramContext)
  {
    super(paramContext, R.layout.abc_action_menu_layout, R.layout.abc_action_menu_item_layout);
  }
  
  private View findViewForItem(MenuItem paramMenuItem)
  {
    ViewGroup localViewGroup = (ViewGroup)this.mMenuView;
    Object localObject;
    if (localViewGroup == null) {
      localObject = null;
    }
    for (;;)
    {
      return (View)localObject;
      int i = localViewGroup.getChildCount();
      for (int j = 0;; j++)
      {
        if (j >= i) {
          break label71;
        }
        View localView = localViewGroup.getChildAt(j);
        if ((localView instanceof MenuView.ItemView))
        {
          localObject = localView;
          if (((MenuView.ItemView)localView).getItemData() == paramMenuItem) {
            break;
          }
        }
      }
      label71:
      localObject = null;
    }
  }
  
  public void bindItemView(MenuItemImpl paramMenuItemImpl, MenuView.ItemView paramItemView)
  {
    paramItemView.initialize(paramMenuItemImpl, 0);
    paramMenuItemImpl = (ActionMenuView)this.mMenuView;
    ((ActionMenuItemView)paramItemView).setItemInvoker(paramMenuItemImpl);
  }
  
  public boolean dismissPopupMenus()
  {
    return hideOverflowMenu() | hideSubMenus();
  }
  
  public boolean filterLeftoverView(ViewGroup paramViewGroup, int paramInt)
  {
    if (paramViewGroup.getChildAt(paramInt) == this.mOverflowButton) {}
    for (boolean bool = false;; bool = super.filterLeftoverView(paramViewGroup, paramInt)) {
      return bool;
    }
  }
  
  public boolean flagActionItems()
  {
    ArrayList localArrayList = this.mMenu.getVisibleItems();
    int i = localArrayList.size();
    int j = this.mMaxItems;
    int k = this.mActionItemWidthLimit;
    int m = View.MeasureSpec.makeMeasureSpec(0, 0);
    ViewGroup localViewGroup = (ViewGroup)this.mMenuView;
    int n = 0;
    int i1 = 0;
    int i2 = 0;
    int i3 = 0;
    int i4 = 0;
    MenuItemImpl localMenuItemImpl;
    int i5;
    if (i4 < i)
    {
      localMenuItemImpl = (MenuItemImpl)localArrayList.get(i4);
      if (localMenuItemImpl.requiresActionButton()) {
        n++;
      }
      for (;;)
      {
        i5 = j;
        if (this.mExpandedActionViewsExclusive)
        {
          i5 = j;
          if (localMenuItemImpl.isActionViewExpanded()) {
            i5 = 0;
          }
        }
        i4++;
        j = i5;
        break;
        if (localMenuItemImpl.requestsActionButton()) {
          i1++;
        } else {
          i3 = 1;
        }
      }
    }
    i4 = j;
    if (this.mReserveOverflow) {
      if (i3 == 0)
      {
        i4 = j;
        if (n + i1 <= j) {}
      }
      else
      {
        i4 = j - 1;
      }
    }
    i4 -= n;
    SparseBooleanArray localSparseBooleanArray = this.mActionButtonGroups;
    localSparseBooleanArray.clear();
    int i6 = 0;
    n = 0;
    if (this.mStrictWidthLimit)
    {
      n = k / this.mMinCellSize;
      j = this.mMinCellSize;
      i6 = this.mMinCellSize + k % j / n;
    }
    j = 0;
    i3 = k;
    k = j;
    j = i2;
    if (k < i)
    {
      localMenuItemImpl = (MenuItemImpl)localArrayList.get(k);
      Object localObject;
      if (localMenuItemImpl.requiresActionButton())
      {
        localObject = getItemView(localMenuItemImpl, this.mScrapActionButtonView, localViewGroup);
        if (this.mScrapActionButtonView == null) {
          this.mScrapActionButtonView = ((View)localObject);
        }
        if (this.mStrictWidthLimit)
        {
          n -= ActionMenuView.measureChildForCells((View)localObject, i6, n, m, 0);
          label315:
          i2 = ((View)localObject).getMeasuredWidth();
          i1 = i3 - i2;
          i5 = j;
          if (j == 0) {
            i5 = i2;
          }
          j = localMenuItemImpl.getGroupId();
          if (j != 0) {
            localSparseBooleanArray.put(j, true);
          }
          localMenuItemImpl.setIsActionButton(true);
          i7 = i4;
          i2 = n;
        }
      }
      do
      {
        k++;
        n = i2;
        j = i5;
        i4 = i7;
        i3 = i1;
        break;
        ((View)localObject).measure(m, m);
        break label315;
        i2 = n;
        i5 = j;
        i7 = i4;
        i1 = i3;
      } while (!localMenuItemImpl.requestsActionButton());
      int i7 = localMenuItemImpl.getGroupId();
      boolean bool = localSparseBooleanArray.get(i7);
      int i8;
      label473:
      int i9;
      if (((i4 > 0) || (bool)) && (i3 > 0) && ((!this.mStrictWidthLimit) || (n > 0)))
      {
        i8 = 1;
        i2 = n;
        i5 = j;
        i9 = i8;
        i1 = i3;
        if (i8 != 0)
        {
          localObject = getItemView(localMenuItemImpl, this.mScrapActionButtonView, localViewGroup);
          if (this.mScrapActionButtonView == null) {
            this.mScrapActionButtonView = ((View)localObject);
          }
          if (!this.mStrictWidthLimit) {
            break label667;
          }
          i5 = ActionMenuView.measureChildForCells((View)localObject, i6, n, m, 0);
          i1 = n - i5;
          n = i1;
          if (i5 == 0)
          {
            i8 = 0;
            n = i1;
          }
          label564:
          i2 = ((View)localObject).getMeasuredWidth();
          i1 = i3 - i2;
          i5 = j;
          if (j == 0) {
            i5 = i2;
          }
          if (!this.mStrictWidthLimit) {
            break label684;
          }
          if (i1 < 0) {
            break label679;
          }
          j = 1;
          label603:
          i9 = i8 & j;
          i2 = n;
        }
        if ((i9 == 0) || (i7 == 0)) {
          break label712;
        }
        localSparseBooleanArray.put(i7, true);
        j = i4;
      }
      label667:
      label679:
      label684:
      label712:
      do
      {
        n = j;
        if (i9 != 0) {
          n = j - 1;
        }
        localMenuItemImpl.setIsActionButton(i9);
        i7 = n;
        break;
        i8 = 0;
        break label473;
        ((View)localObject).measure(m, m);
        break label564;
        j = 0;
        break label603;
        if (i1 + i5 > 0) {}
        for (j = 1;; j = 0)
        {
          i9 = i8 & j;
          i2 = n;
          break;
        }
        j = i4;
      } while (!bool);
      localSparseBooleanArray.put(i7, false);
      n = 0;
      for (;;)
      {
        j = i4;
        if (n >= k) {
          break;
        }
        localObject = (MenuItemImpl)localArrayList.get(n);
        j = i4;
        if (((MenuItemImpl)localObject).getGroupId() == i7)
        {
          j = i4;
          if (((MenuItemImpl)localObject).isActionButton()) {
            j = i4 + 1;
          }
          ((MenuItemImpl)localObject).setIsActionButton(false);
        }
        n++;
        i4 = j;
      }
    }
    return true;
  }
  
  public View getItemView(MenuItemImpl paramMenuItemImpl, View paramView, ViewGroup paramViewGroup)
  {
    View localView = paramMenuItemImpl.getActionView();
    if ((localView == null) || (paramMenuItemImpl.hasCollapsibleActionView()))
    {
      localView = paramView;
      if (!(paramView instanceof ActionMenuItemView)) {
        localView = null;
      }
      localView = super.getItemView(paramMenuItemImpl, localView, paramViewGroup);
    }
    if (paramMenuItemImpl.isActionViewExpanded()) {}
    for (int i = 8;; i = 0)
    {
      localView.setVisibility(i);
      paramMenuItemImpl = (ActionMenuView)paramViewGroup;
      paramView = localView.getLayoutParams();
      if (!paramMenuItemImpl.checkLayoutParams(paramView)) {
        localView.setLayoutParams(paramMenuItemImpl.generateLayoutParams(paramView));
      }
      return localView;
    }
  }
  
  public MenuView getMenuView(ViewGroup paramViewGroup)
  {
    paramViewGroup = super.getMenuView(paramViewGroup);
    ((ActionMenuView)paramViewGroup).setPresenter(this);
    return paramViewGroup;
  }
  
  public boolean hideOverflowMenu()
  {
    boolean bool;
    if ((this.mPostedOpenRunnable != null) && (this.mMenuView != null))
    {
      ((View)this.mMenuView).removeCallbacks(this.mPostedOpenRunnable);
      this.mPostedOpenRunnable = null;
      bool = true;
    }
    for (;;)
    {
      return bool;
      OverflowPopup localOverflowPopup = this.mOverflowPopup;
      if (localOverflowPopup != null)
      {
        localOverflowPopup.dismiss();
        bool = true;
      }
      else
      {
        bool = false;
      }
    }
  }
  
  public boolean hideSubMenus()
  {
    if (this.mActionButtonPopup != null) {
      this.mActionButtonPopup.dismiss();
    }
    for (boolean bool = true;; bool = false) {
      return bool;
    }
  }
  
  public void initForMenu(Context paramContext, MenuBuilder paramMenuBuilder)
  {
    super.initForMenu(paramContext, paramMenuBuilder);
    paramMenuBuilder = paramContext.getResources();
    paramContext = ActionBarPolicy.get(paramContext);
    if (!this.mReserveOverflowSet) {
      this.mReserveOverflow = paramContext.showsOverflowMenuButton();
    }
    if (!this.mWidthLimitSet) {
      this.mWidthLimit = paramContext.getEmbeddedMenuWidthLimit();
    }
    if (!this.mMaxItemsSet) {
      this.mMaxItems = paramContext.getMaxActionButtons();
    }
    int i = this.mWidthLimit;
    if (this.mReserveOverflow)
    {
      if (this.mOverflowButton == null)
      {
        this.mOverflowButton = new OverflowMenuButton(this.mSystemContext);
        int j = View.MeasureSpec.makeMeasureSpec(0, 0);
        this.mOverflowButton.measure(j, j);
      }
      i -= this.mOverflowButton.getMeasuredWidth();
    }
    for (;;)
    {
      this.mActionItemWidthLimit = i;
      this.mMinCellSize = ((int)(56.0F * paramMenuBuilder.getDisplayMetrics().density));
      this.mScrapActionButtonView = null;
      return;
      this.mOverflowButton = null;
    }
  }
  
  public boolean isOverflowMenuShowing()
  {
    if ((this.mOverflowPopup != null) && (this.mOverflowPopup.isShowing())) {}
    for (boolean bool = true;; bool = false) {
      return bool;
    }
  }
  
  public boolean isOverflowReserved()
  {
    return this.mReserveOverflow;
  }
  
  public void onCloseMenu(MenuBuilder paramMenuBuilder, boolean paramBoolean)
  {
    dismissPopupMenus();
    super.onCloseMenu(paramMenuBuilder, paramBoolean);
  }
  
  public void onConfigurationChanged(Configuration paramConfiguration)
  {
    if (!this.mMaxItemsSet) {
      this.mMaxItems = this.mContext.getResources().getInteger(R.integer.abc_max_action_buttons);
    }
    if (this.mMenu != null) {
      this.mMenu.onItemsChanged(true);
    }
  }
  
  public void onRestoreInstanceState(Parcelable paramParcelable)
  {
    paramParcelable = (SavedState)paramParcelable;
    if (paramParcelable.openSubMenuId > 0)
    {
      paramParcelable = this.mMenu.findItem(paramParcelable.openSubMenuId);
      if (paramParcelable != null) {
        onSubMenuSelected((SubMenuBuilder)paramParcelable.getSubMenu());
      }
    }
  }
  
  public Parcelable onSaveInstanceState()
  {
    SavedState localSavedState = new SavedState();
    localSavedState.openSubMenuId = this.mOpenSubMenuId;
    return localSavedState;
  }
  
  public boolean onSubMenuSelected(SubMenuBuilder paramSubMenuBuilder)
  {
    boolean bool = false;
    if (!paramSubMenuBuilder.hasVisibleItems()) {}
    for (;;)
    {
      return bool;
      for (Object localObject = paramSubMenuBuilder; ((SubMenuBuilder)localObject).getParentMenu() != this.mMenu; localObject = (SubMenuBuilder)((SubMenuBuilder)localObject).getParentMenu()) {}
      if (findViewForItem(((SubMenuBuilder)localObject).getItem()) == null)
      {
        if (this.mOverflowButton != null) {
          localObject = this.mOverflowButton;
        }
      }
      else
      {
        this.mOpenSubMenuId = paramSubMenuBuilder.getItem().getItemId();
        this.mActionButtonPopup = new ActionButtonSubmenu(paramSubMenuBuilder);
        this.mActionButtonPopup.show(null);
        super.onSubMenuSelected(paramSubMenuBuilder);
        bool = true;
      }
    }
  }
  
  public void onSubUiVisibilityChanged(boolean paramBoolean)
  {
    if (paramBoolean) {
      super.onSubMenuSelected(null);
    }
    for (;;)
    {
      return;
      this.mMenu.close(false);
    }
  }
  
  public void setExpandedActionViewsExclusive(boolean paramBoolean)
  {
    this.mExpandedActionViewsExclusive = paramBoolean;
  }
  
  public void setItemLimit(int paramInt)
  {
    this.mMaxItems = paramInt;
    this.mMaxItemsSet = true;
  }
  
  public void setReserveOverflow(boolean paramBoolean)
  {
    this.mReserveOverflow = paramBoolean;
    this.mReserveOverflowSet = true;
  }
  
  public void setWidthLimit(int paramInt, boolean paramBoolean)
  {
    this.mWidthLimit = paramInt;
    this.mStrictWidthLimit = paramBoolean;
    this.mWidthLimitSet = true;
  }
  
  public boolean shouldIncludeItem(int paramInt, MenuItemImpl paramMenuItemImpl)
  {
    return paramMenuItemImpl.isActionButton();
  }
  
  public boolean showOverflowMenu()
  {
    boolean bool = true;
    if ((this.mReserveOverflow) && (!isOverflowMenuShowing()) && (this.mMenu != null) && (this.mMenuView != null) && (this.mPostedOpenRunnable == null))
    {
      this.mPostedOpenRunnable = new OpenOverflowRunnable(new OverflowPopup(this.mContext, this.mMenu, this.mOverflowButton, true));
      ((View)this.mMenuView).post(this.mPostedOpenRunnable);
      super.onSubMenuSelected(null);
    }
    for (;;)
    {
      return bool;
      bool = false;
    }
  }
  
  public void updateMenuView(boolean paramBoolean)
  {
    super.updateMenuView(paramBoolean);
    if (this.mMenuView == null) {
      return;
    }
    int i;
    int j;
    Object localObject;
    if (this.mMenu != null)
    {
      ArrayList localArrayList = this.mMenu.getActionItems();
      i = localArrayList.size();
      for (j = 0; j < i; j++)
      {
        localObject = ((MenuItemImpl)localArrayList.get(j)).getSupportActionProvider();
        if (localObject != null) {
          ((ActionProvider)localObject).setSubUiVisibilityListener(this);
        }
      }
    }
    if (this.mMenu != null)
    {
      localObject = this.mMenu.getNonActionItems();
      label89:
      i = 0;
      j = i;
      if (this.mReserveOverflow)
      {
        j = i;
        if (localObject != null)
        {
          j = ((ArrayList)localObject).size();
          if (j != 1) {
            break label255;
          }
          if (((MenuItemImpl)((ArrayList)localObject).get(0)).isActionViewExpanded()) {
            break label249;
          }
          j = 1;
        }
      }
      label140:
      if (j == 0) {
        break label272;
      }
      if (this.mOverflowButton == null) {
        this.mOverflowButton = new OverflowMenuButton(this.mSystemContext);
      }
      localObject = (ViewGroup)this.mOverflowButton.getParent();
      if (localObject != this.mMenuView)
      {
        if (localObject != null) {
          ((ViewGroup)localObject).removeView(this.mOverflowButton);
        }
        localObject = (ActionMenuView)this.mMenuView;
        ((ActionMenuView)localObject).addView(this.mOverflowButton, ((ActionMenuView)localObject).generateOverflowButtonLayoutParams());
      }
    }
    for (;;)
    {
      ((ActionMenuView)this.mMenuView).setOverflowReserved(this.mReserveOverflow);
      break;
      localObject = null;
      break label89;
      label249:
      j = 0;
      break label140;
      label255:
      if (j > 0) {}
      for (j = 1;; j = 0) {
        break;
      }
      label272:
      if ((this.mOverflowButton != null) && (this.mOverflowButton.getParent() == this.mMenuView)) {
        ((ViewGroup)this.mMenuView).removeView(this.mOverflowButton);
      }
    }
  }
  
  private class ActionButtonSubmenu
    extends MenuDialogHelper
  {
    public ActionButtonSubmenu(SubMenuBuilder paramSubMenuBuilder)
    {
      super();
      ActionMenuPresenter.this.setCallback(ActionMenuPresenter.this.mPopupPresenterCallback);
    }
    
    public void onDismiss(DialogInterface paramDialogInterface)
    {
      super.onDismiss(paramDialogInterface);
      ActionMenuPresenter.access$202(ActionMenuPresenter.this, null);
      ActionMenuPresenter.this.mOpenSubMenuId = 0;
    }
  }
  
  private class OpenOverflowRunnable
    implements Runnable
  {
    private ActionMenuPresenter.OverflowPopup mPopup;
    
    public OpenOverflowRunnable(ActionMenuPresenter.OverflowPopup paramOverflowPopup)
    {
      this.mPopup = paramOverflowPopup;
    }
    
    public void run()
    {
      ActionMenuPresenter.this.mMenu.changeMenuMode();
      View localView = (View)ActionMenuPresenter.this.mMenuView;
      if ((localView != null) && (localView.getWindowToken() != null) && (this.mPopup.tryShow())) {
        ActionMenuPresenter.access$102(ActionMenuPresenter.this, this.mPopup);
      }
      ActionMenuPresenter.access$302(ActionMenuPresenter.this, null);
    }
  }
  
  private class OverflowMenuButton
    extends ImageButton
    implements ActionMenuView.ActionMenuChildView
  {
    public OverflowMenuButton(Context paramContext)
    {
      super(null, R.attr.actionOverflowButtonStyle);
      setClickable(true);
      setFocusable(true);
      setVisibility(0);
      setEnabled(true);
    }
    
    public boolean needsDividerAfter()
    {
      return false;
    }
    
    public boolean needsDividerBefore()
    {
      return false;
    }
    
    public boolean performClick()
    {
      if (super.performClick()) {}
      for (;;)
      {
        return true;
        playSoundEffect(0);
        ActionMenuPresenter.this.showOverflowMenu();
      }
    }
  }
  
  private class OverflowPopup
    extends MenuPopupHelper
  {
    public OverflowPopup(Context paramContext, MenuBuilder paramMenuBuilder, View paramView, boolean paramBoolean)
    {
      super(paramMenuBuilder, paramView, paramBoolean);
      setCallback(ActionMenuPresenter.this.mPopupPresenterCallback);
    }
    
    public void onDismiss()
    {
      super.onDismiss();
      ActionMenuPresenter.this.mMenu.close();
      ActionMenuPresenter.access$102(ActionMenuPresenter.this, null);
    }
  }
  
  private class PopupPresenterCallback
    implements MenuPresenter.Callback
  {
    private PopupPresenterCallback() {}
    
    public void onCloseMenu(MenuBuilder paramMenuBuilder, boolean paramBoolean)
    {
      if ((paramMenuBuilder instanceof SubMenuBuilder)) {
        ((SubMenuBuilder)paramMenuBuilder).getRootMenu().close(false);
      }
    }
    
    public boolean onOpenSubMenu(MenuBuilder paramMenuBuilder)
    {
      if (paramMenuBuilder == null) {}
      for (;;)
      {
        return false;
        ActionMenuPresenter.this.mOpenSubMenuId = ((SubMenuBuilder)paramMenuBuilder).getItem().getItemId();
      }
    }
  }
  
  private static class SavedState
    implements Parcelable
  {
    public static final Parcelable.Creator<SavedState> CREATOR = new Parcelable.Creator()
    {
      public ActionMenuPresenter.SavedState createFromParcel(Parcel paramAnonymousParcel)
      {
        return new ActionMenuPresenter.SavedState(paramAnonymousParcel);
      }
      
      public ActionMenuPresenter.SavedState[] newArray(int paramAnonymousInt)
      {
        return new ActionMenuPresenter.SavedState[paramAnonymousInt];
      }
    };
    public int openSubMenuId;
    
    SavedState() {}
    
    SavedState(Parcel paramParcel)
    {
      this.openSubMenuId = paramParcel.readInt();
    }
    
    public int describeContents()
    {
      return 0;
    }
    
    public void writeToParcel(Parcel paramParcel, int paramInt)
    {
      paramParcel.writeInt(this.openSubMenuId);
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/android/support/v7/internal/view/menu/ActionMenuPresenter.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */