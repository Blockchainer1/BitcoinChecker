package android.support.v7.internal.view.menu;

import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.support.v4.internal.view.SupportMenuItem;
import android.support.v4.view.ActionProvider.VisibilityListener;
import android.support.v4.view.MenuItemCompat.OnActionExpandListener;
import android.util.Log;
import android.view.ContextMenu.ContextMenuInfo;
import android.view.LayoutInflater;
import android.view.MenuItem;
import android.view.MenuItem.OnActionExpandListener;
import android.view.MenuItem.OnMenuItemClickListener;
import android.view.SubMenu;
import android.view.View;
import android.view.ViewDebug.CapturedViewProperty;
import android.widget.LinearLayout;

public final class MenuItemImpl
  implements SupportMenuItem
{
  private static final int CHECKABLE = 1;
  private static final int CHECKED = 2;
  private static final int ENABLED = 16;
  private static final int EXCLUSIVE = 4;
  private static final int HIDDEN = 8;
  private static final int IS_ACTION = 32;
  static final int NO_ICON = 0;
  private static final int SHOW_AS_ACTION_MASK = 3;
  private static final String TAG = "MenuItemImpl";
  private static String sDeleteShortcutLabel;
  private static String sEnterShortcutLabel;
  private static String sPrependShortcutLabel;
  private static String sSpaceShortcutLabel;
  private android.support.v4.view.ActionProvider mActionProvider;
  private View mActionView;
  private final int mCategoryOrder;
  private MenuItem.OnMenuItemClickListener mClickListener;
  private int mFlags = 16;
  private final int mGroup;
  private Drawable mIconDrawable;
  private int mIconResId = 0;
  private final int mId;
  private Intent mIntent;
  private boolean mIsActionViewExpanded = false;
  private Runnable mItemCallback;
  private MenuBuilder mMenu;
  private ContextMenu.ContextMenuInfo mMenuInfo;
  private MenuItemCompat.OnActionExpandListener mOnActionExpandListener;
  private final int mOrdering;
  private char mShortcutAlphabeticChar;
  private char mShortcutNumericChar;
  private int mShowAsAction = 0;
  private SubMenuBuilder mSubMenu;
  private CharSequence mTitle;
  private CharSequence mTitleCondensed;
  
  MenuItemImpl(MenuBuilder paramMenuBuilder, int paramInt1, int paramInt2, int paramInt3, int paramInt4, CharSequence paramCharSequence, int paramInt5)
  {
    this.mMenu = paramMenuBuilder;
    this.mId = paramInt2;
    this.mGroup = paramInt1;
    this.mCategoryOrder = paramInt3;
    this.mOrdering = paramInt4;
    this.mTitle = paramCharSequence;
    this.mShowAsAction = paramInt5;
  }
  
  public void actionFormatChanged()
  {
    this.mMenu.onItemActionRequestChanged(this);
  }
  
  public boolean collapseActionView()
  {
    boolean bool = false;
    if ((this.mShowAsAction & 0x8) == 0) {}
    for (;;)
    {
      return bool;
      if (this.mActionView == null) {
        bool = true;
      } else if ((this.mOnActionExpandListener == null) || (this.mOnActionExpandListener.onMenuItemActionCollapse(this))) {
        bool = this.mMenu.collapseItemActionView(this);
      }
    }
  }
  
  public boolean expandActionView()
  {
    boolean bool1 = false;
    boolean bool2 = bool1;
    if ((this.mShowAsAction & 0x8) != 0)
    {
      if (this.mActionView != null) {
        break label25;
      }
      bool2 = bool1;
    }
    for (;;)
    {
      return bool2;
      label25:
      if (this.mOnActionExpandListener != null)
      {
        bool2 = bool1;
        if (!this.mOnActionExpandListener.onMenuItemActionExpand(this)) {}
      }
      else
      {
        bool2 = this.mMenu.expandItemActionView(this);
      }
    }
  }
  
  public android.view.ActionProvider getActionProvider()
  {
    throw new UnsupportedOperationException("Implementation should use getSupportActionProvider!");
  }
  
  public View getActionView()
  {
    View localView;
    if (this.mActionView != null) {
      localView = this.mActionView;
    }
    for (;;)
    {
      return localView;
      if (this.mActionProvider != null)
      {
        this.mActionView = this.mActionProvider.onCreateActionView(this);
        localView = this.mActionView;
      }
      else
      {
        localView = null;
      }
    }
  }
  
  public char getAlphabeticShortcut()
  {
    return this.mShortcutAlphabeticChar;
  }
  
  Runnable getCallback()
  {
    return this.mItemCallback;
  }
  
  public int getGroupId()
  {
    return this.mGroup;
  }
  
  public Drawable getIcon()
  {
    Drawable localDrawable;
    if (this.mIconDrawable != null) {
      localDrawable = this.mIconDrawable;
    }
    for (;;)
    {
      return localDrawable;
      if (this.mIconResId != 0)
      {
        localDrawable = this.mMenu.getResources().getDrawable(this.mIconResId);
        this.mIconResId = 0;
        this.mIconDrawable = localDrawable;
      }
      else
      {
        localDrawable = null;
      }
    }
  }
  
  public Intent getIntent()
  {
    return this.mIntent;
  }
  
  @ViewDebug.CapturedViewProperty
  public int getItemId()
  {
    return this.mId;
  }
  
  public ContextMenu.ContextMenuInfo getMenuInfo()
  {
    return this.mMenuInfo;
  }
  
  public char getNumericShortcut()
  {
    return this.mShortcutNumericChar;
  }
  
  public int getOrder()
  {
    return this.mCategoryOrder;
  }
  
  public int getOrdering()
  {
    return this.mOrdering;
  }
  
  char getShortcut()
  {
    return this.mShortcutAlphabeticChar;
  }
  
  String getShortcutLabel()
  {
    char c = getShortcut();
    if (c == 0)
    {
      localObject = "";
      return (String)localObject;
    }
    Object localObject = new StringBuilder(sPrependShortcutLabel);
    switch (c)
    {
    default: 
      ((StringBuilder)localObject).append(c);
    }
    for (;;)
    {
      localObject = ((StringBuilder)localObject).toString();
      break;
      ((StringBuilder)localObject).append(sEnterShortcutLabel);
      continue;
      ((StringBuilder)localObject).append(sDeleteShortcutLabel);
      continue;
      ((StringBuilder)localObject).append(sSpaceShortcutLabel);
    }
  }
  
  public SubMenu getSubMenu()
  {
    return this.mSubMenu;
  }
  
  public android.support.v4.view.ActionProvider getSupportActionProvider()
  {
    return this.mActionProvider;
  }
  
  @ViewDebug.CapturedViewProperty
  public CharSequence getTitle()
  {
    return this.mTitle;
  }
  
  public CharSequence getTitleCondensed()
  {
    if (this.mTitleCondensed != null) {}
    for (CharSequence localCharSequence = this.mTitleCondensed;; localCharSequence = this.mTitle) {
      return localCharSequence;
    }
  }
  
  CharSequence getTitleForItemView(MenuView.ItemView paramItemView)
  {
    if ((paramItemView != null) && (paramItemView.prefersCondensedTitle())) {}
    for (paramItemView = getTitleCondensed();; paramItemView = getTitle()) {
      return paramItemView;
    }
  }
  
  public boolean hasCollapsibleActionView()
  {
    if (((this.mShowAsAction & 0x8) != 0) && (this.mActionView != null)) {}
    for (boolean bool = true;; bool = false) {
      return bool;
    }
  }
  
  public boolean hasSubMenu()
  {
    if (this.mSubMenu != null) {}
    for (boolean bool = true;; bool = false) {
      return bool;
    }
  }
  
  public boolean invoke()
  {
    boolean bool1 = true;
    boolean bool2;
    if ((this.mClickListener != null) && (this.mClickListener.onMenuItemClick(this))) {
      bool2 = bool1;
    }
    for (;;)
    {
      return bool2;
      bool2 = bool1;
      if (!this.mMenu.dispatchMenuItemSelected(this.mMenu.getRootMenu(), this)) {
        if (this.mItemCallback != null)
        {
          this.mItemCallback.run();
          bool2 = bool1;
        }
        else if (this.mIntent != null)
        {
          try
          {
            this.mMenu.getContext().startActivity(this.mIntent);
            bool2 = bool1;
          }
          catch (ActivityNotFoundException localActivityNotFoundException)
          {
            Log.e("MenuItemImpl", "Can't find activity to handle intent; ignoring", localActivityNotFoundException);
          }
        }
        else if (this.mActionProvider != null)
        {
          bool2 = bool1;
          if (this.mActionProvider.onPerformDefaultAction()) {}
        }
        else
        {
          bool2 = false;
        }
      }
    }
  }
  
  public boolean isActionButton()
  {
    if ((this.mFlags & 0x20) == 32) {}
    for (boolean bool = true;; bool = false) {
      return bool;
    }
  }
  
  public boolean isActionViewExpanded()
  {
    return this.mIsActionViewExpanded;
  }
  
  public boolean isCheckable()
  {
    boolean bool = true;
    if ((this.mFlags & 0x1) == 1) {}
    for (;;)
    {
      return bool;
      bool = false;
    }
  }
  
  public boolean isChecked()
  {
    if ((this.mFlags & 0x2) == 2) {}
    for (boolean bool = true;; bool = false) {
      return bool;
    }
  }
  
  public boolean isEnabled()
  {
    if ((this.mFlags & 0x10) != 0) {}
    for (boolean bool = true;; bool = false) {
      return bool;
    }
  }
  
  public boolean isExclusiveCheckable()
  {
    if ((this.mFlags & 0x4) != 0) {}
    for (boolean bool = true;; bool = false) {
      return bool;
    }
  }
  
  public boolean isVisible()
  {
    boolean bool = true;
    if ((this.mActionProvider != null) && (this.mActionProvider.overridesItemVisibility())) {
      if (((this.mFlags & 0x8) != 0) || (!this.mActionProvider.isVisible())) {}
    }
    for (;;)
    {
      return bool;
      bool = false;
      continue;
      if ((this.mFlags & 0x8) != 0) {
        bool = false;
      }
    }
  }
  
  public boolean requestsActionButton()
  {
    boolean bool = true;
    if ((this.mShowAsAction & 0x1) == 1) {}
    for (;;)
    {
      return bool;
      bool = false;
    }
  }
  
  public boolean requiresActionButton()
  {
    if ((this.mShowAsAction & 0x2) == 2) {}
    for (boolean bool = true;; bool = false) {
      return bool;
    }
  }
  
  public MenuItem setActionProvider(android.view.ActionProvider paramActionProvider)
  {
    throw new UnsupportedOperationException("Implementation should use setSupportActionProvider!");
  }
  
  public SupportMenuItem setActionView(int paramInt)
  {
    Context localContext = this.mMenu.getContext();
    setActionView(LayoutInflater.from(localContext).inflate(paramInt, new LinearLayout(localContext), false));
    return this;
  }
  
  public SupportMenuItem setActionView(View paramView)
  {
    this.mActionView = paramView;
    this.mActionProvider = null;
    if ((paramView != null) && (paramView.getId() == -1) && (this.mId > 0)) {
      paramView.setId(this.mId);
    }
    this.mMenu.onItemActionRequestChanged(this);
    return this;
  }
  
  public void setActionViewExpanded(boolean paramBoolean)
  {
    this.mIsActionViewExpanded = paramBoolean;
    this.mMenu.onItemsChanged(false);
  }
  
  public MenuItem setAlphabeticShortcut(char paramChar)
  {
    if (this.mShortcutAlphabeticChar == paramChar) {}
    for (;;)
    {
      return this;
      this.mShortcutAlphabeticChar = Character.toLowerCase(paramChar);
      this.mMenu.onItemsChanged(false);
    }
  }
  
  public MenuItem setCallback(Runnable paramRunnable)
  {
    this.mItemCallback = paramRunnable;
    return this;
  }
  
  public MenuItem setCheckable(boolean paramBoolean)
  {
    int i = this.mFlags;
    int j = this.mFlags;
    if (paramBoolean) {}
    for (int k = 1;; k = 0)
    {
      this.mFlags = (k | j & 0xFFFFFFFE);
      if (i != this.mFlags) {
        this.mMenu.onItemsChanged(false);
      }
      return this;
    }
  }
  
  public MenuItem setChecked(boolean paramBoolean)
  {
    if ((this.mFlags & 0x4) != 0) {
      this.mMenu.setExclusiveItemChecked(this);
    }
    for (;;)
    {
      return this;
      setCheckedInt(paramBoolean);
    }
  }
  
  void setCheckedInt(boolean paramBoolean)
  {
    int i = this.mFlags;
    int j = this.mFlags;
    if (paramBoolean) {}
    for (int k = 2;; k = 0)
    {
      this.mFlags = (k | j & 0xFFFFFFFD);
      if (i != this.mFlags) {
        this.mMenu.onItemsChanged(false);
      }
      return;
    }
  }
  
  public MenuItem setEnabled(boolean paramBoolean)
  {
    if (paramBoolean) {}
    for (this.mFlags |= 0x10;; this.mFlags &= 0xFFFFFFEF)
    {
      this.mMenu.onItemsChanged(false);
      return this;
    }
  }
  
  public void setExclusiveCheckable(boolean paramBoolean)
  {
    int i = this.mFlags;
    if (paramBoolean) {}
    for (int j = 4;; j = 0)
    {
      this.mFlags = (j | i & 0xFFFFFFFB);
      return;
    }
  }
  
  public MenuItem setIcon(int paramInt)
  {
    this.mIconDrawable = null;
    this.mIconResId = paramInt;
    this.mMenu.onItemsChanged(false);
    return this;
  }
  
  public MenuItem setIcon(Drawable paramDrawable)
  {
    this.mIconResId = 0;
    this.mIconDrawable = paramDrawable;
    this.mMenu.onItemsChanged(false);
    return this;
  }
  
  public MenuItem setIntent(Intent paramIntent)
  {
    this.mIntent = paramIntent;
    return this;
  }
  
  public void setIsActionButton(boolean paramBoolean)
  {
    if (paramBoolean) {}
    for (this.mFlags |= 0x20;; this.mFlags &= 0xFFFFFFDF) {
      return;
    }
  }
  
  void setMenuInfo(ContextMenu.ContextMenuInfo paramContextMenuInfo)
  {
    this.mMenuInfo = paramContextMenuInfo;
  }
  
  public MenuItem setNumericShortcut(char paramChar)
  {
    if (this.mShortcutNumericChar == paramChar) {}
    for (;;)
    {
      return this;
      this.mShortcutNumericChar = ((char)paramChar);
      this.mMenu.onItemsChanged(false);
    }
  }
  
  public MenuItem setOnActionExpandListener(MenuItem.OnActionExpandListener paramOnActionExpandListener)
  {
    throw new UnsupportedOperationException("Implementation should use setSupportOnActionExpandListener!");
  }
  
  public MenuItem setOnMenuItemClickListener(MenuItem.OnMenuItemClickListener paramOnMenuItemClickListener)
  {
    this.mClickListener = paramOnMenuItemClickListener;
    return this;
  }
  
  public MenuItem setShortcut(char paramChar1, char paramChar2)
  {
    this.mShortcutNumericChar = ((char)paramChar1);
    this.mShortcutAlphabeticChar = Character.toLowerCase(paramChar2);
    this.mMenu.onItemsChanged(false);
    return this;
  }
  
  public void setShowAsAction(int paramInt)
  {
    switch (paramInt & 0x3)
    {
    default: 
      throw new IllegalArgumentException("SHOW_AS_ACTION_ALWAYS, SHOW_AS_ACTION_IF_ROOM, and SHOW_AS_ACTION_NEVER are mutually exclusive.");
    }
    this.mShowAsAction = paramInt;
    this.mMenu.onItemActionRequestChanged(this);
  }
  
  public SupportMenuItem setShowAsActionFlags(int paramInt)
  {
    setShowAsAction(paramInt);
    return this;
  }
  
  void setSubMenu(SubMenuBuilder paramSubMenuBuilder)
  {
    this.mSubMenu = paramSubMenuBuilder;
    paramSubMenuBuilder.setHeaderTitle(getTitle());
  }
  
  public SupportMenuItem setSupportActionProvider(android.support.v4.view.ActionProvider paramActionProvider)
  {
    if (this.mActionProvider == paramActionProvider) {}
    for (;;)
    {
      return this;
      this.mActionView = null;
      if (this.mActionProvider != null) {
        this.mActionProvider.setVisibilityListener(null);
      }
      this.mActionProvider = paramActionProvider;
      this.mMenu.onItemsChanged(true);
      if (paramActionProvider != null) {
        paramActionProvider.setVisibilityListener(new ActionProvider.VisibilityListener()
        {
          public void onActionProviderVisibilityChanged(boolean paramAnonymousBoolean)
          {
            MenuItemImpl.this.mMenu.onItemVisibleChanged(MenuItemImpl.this);
          }
        });
      }
    }
  }
  
  public SupportMenuItem setSupportOnActionExpandListener(MenuItemCompat.OnActionExpandListener paramOnActionExpandListener)
  {
    this.mOnActionExpandListener = paramOnActionExpandListener;
    return this;
  }
  
  public MenuItem setTitle(int paramInt)
  {
    return setTitle(this.mMenu.getContext().getString(paramInt));
  }
  
  public MenuItem setTitle(CharSequence paramCharSequence)
  {
    this.mTitle = paramCharSequence;
    this.mMenu.onItemsChanged(false);
    if (this.mSubMenu != null) {
      this.mSubMenu.setHeaderTitle(paramCharSequence);
    }
    return this;
  }
  
  public MenuItem setTitleCondensed(CharSequence paramCharSequence)
  {
    this.mTitleCondensed = paramCharSequence;
    if (paramCharSequence == null) {
      paramCharSequence = this.mTitle;
    }
    this.mMenu.onItemsChanged(false);
    return this;
  }
  
  public MenuItem setVisible(boolean paramBoolean)
  {
    if (setVisibleInt(paramBoolean)) {
      this.mMenu.onItemVisibleChanged(this);
    }
    return this;
  }
  
  boolean setVisibleInt(boolean paramBoolean)
  {
    boolean bool = false;
    int i = this.mFlags;
    int j = this.mFlags;
    if (paramBoolean) {}
    for (int k = 0;; k = 8)
    {
      this.mFlags = (k | j & 0xFFFFFFF7);
      paramBoolean = bool;
      if (i != this.mFlags) {
        paramBoolean = true;
      }
      return paramBoolean;
    }
  }
  
  public boolean shouldShowIcon()
  {
    return this.mMenu.getOptionalIconsVisible();
  }
  
  boolean shouldShowShortcut()
  {
    if ((this.mMenu.isShortcutsVisible()) && (getShortcut() != 0)) {}
    for (boolean bool = true;; bool = false) {
      return bool;
    }
  }
  
  public boolean showsTextAsAction()
  {
    if ((this.mShowAsAction & 0x4) == 4) {}
    for (boolean bool = true;; bool = false) {
      return bool;
    }
  }
  
  public String toString()
  {
    return this.mTitle.toString();
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/android/support/v7/internal/view/menu/MenuItemImpl.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */