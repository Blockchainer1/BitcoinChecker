package android.support.v7.internal.view.menu;

import android.support.v4.internal.view.SupportMenuItem;
import android.view.MenuItem;
import android.view.SubMenu;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;

abstract class BaseMenuWrapper<T>
  extends BaseWrapper<T>
{
  private HashMap<MenuItem, SupportMenuItem> mMenuItems;
  private HashMap<SubMenu, SubMenu> mSubMenus;
  
  BaseMenuWrapper(T paramT)
  {
    super(paramT);
  }
  
  final SupportMenuItem getMenuItemWrapper(MenuItem paramMenuItem)
  {
    SupportMenuItem localSupportMenuItem2;
    if (paramMenuItem != null)
    {
      if (this.mMenuItems == null) {
        this.mMenuItems = new HashMap();
      }
      SupportMenuItem localSupportMenuItem1 = (SupportMenuItem)this.mMenuItems.get(paramMenuItem);
      localSupportMenuItem2 = localSupportMenuItem1;
      if (localSupportMenuItem1 == null)
      {
        localSupportMenuItem2 = MenuWrapperFactory.createSupportMenuItemWrapper(paramMenuItem);
        this.mMenuItems.put(paramMenuItem, localSupportMenuItem2);
      }
    }
    for (;;)
    {
      return localSupportMenuItem2;
      localSupportMenuItem2 = null;
    }
  }
  
  final SubMenu getSubMenuWrapper(SubMenu paramSubMenu)
  {
    Object localObject;
    if (paramSubMenu != null)
    {
      if (this.mSubMenus == null) {
        this.mSubMenus = new HashMap();
      }
      SubMenu localSubMenu = (SubMenu)this.mSubMenus.get(paramSubMenu);
      localObject = localSubMenu;
      if (localSubMenu == null)
      {
        localObject = MenuWrapperFactory.createSupportSubMenuWrapper(paramSubMenu);
        this.mSubMenus.put(paramSubMenu, localObject);
      }
    }
    for (;;)
    {
      return (SubMenu)localObject;
      localObject = null;
    }
  }
  
  final void internalClear()
  {
    if (this.mMenuItems != null) {
      this.mMenuItems.clear();
    }
    if (this.mSubMenus != null) {
      this.mSubMenus.clear();
    }
  }
  
  final void internalRemoveGroup(int paramInt)
  {
    if (this.mMenuItems == null) {}
    for (;;)
    {
      return;
      Iterator localIterator = this.mMenuItems.keySet().iterator();
      while (localIterator.hasNext()) {
        if (paramInt == ((MenuItem)localIterator.next()).getGroupId()) {
          localIterator.remove();
        }
      }
    }
  }
  
  final void internalRemoveItem(int paramInt)
  {
    if (this.mMenuItems == null) {
      return;
    }
    for (;;)
    {
      Iterator localIterator = this.mMenuItems.keySet().iterator();
      if (localIterator.hasNext())
      {
        if (paramInt != ((MenuItem)localIterator.next()).getItemId()) {
          break;
        }
        localIterator.remove();
      }
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/android/support/v7/internal/view/menu/BaseMenuWrapper.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */