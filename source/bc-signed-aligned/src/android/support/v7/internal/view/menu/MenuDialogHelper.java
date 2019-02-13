package android.support.v7.internal.view.menu;

import android.app.AlertDialog;
import android.app.AlertDialog.Builder;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.DialogInterface.OnDismissListener;
import android.content.DialogInterface.OnKeyListener;
import android.os.IBinder;
import android.support.v7.appcompat.R.layout;
import android.support.v7.appcompat.R.style;
import android.view.KeyEvent;
import android.view.KeyEvent.DispatcherState;
import android.view.View;
import android.view.Window;
import android.view.WindowManager.LayoutParams;
import android.widget.ListAdapter;

public class MenuDialogHelper
  implements DialogInterface.OnKeyListener, DialogInterface.OnClickListener, DialogInterface.OnDismissListener, MenuPresenter.Callback
{
  private AlertDialog mDialog;
  private MenuBuilder mMenu;
  ListMenuPresenter mPresenter;
  private MenuPresenter.Callback mPresenterCallback;
  
  public MenuDialogHelper(MenuBuilder paramMenuBuilder)
  {
    this.mMenu = paramMenuBuilder;
  }
  
  public void dismiss()
  {
    if (this.mDialog != null) {
      this.mDialog.dismiss();
    }
  }
  
  public void onClick(DialogInterface paramDialogInterface, int paramInt)
  {
    this.mMenu.performItemAction((MenuItemImpl)this.mPresenter.getAdapter().getItem(paramInt), 0);
  }
  
  public void onCloseMenu(MenuBuilder paramMenuBuilder, boolean paramBoolean)
  {
    if ((paramBoolean) || (paramMenuBuilder == this.mMenu)) {
      dismiss();
    }
    if (this.mPresenterCallback != null) {
      this.mPresenterCallback.onCloseMenu(paramMenuBuilder, paramBoolean);
    }
  }
  
  public void onDismiss(DialogInterface paramDialogInterface)
  {
    this.mPresenter.onCloseMenu(this.mMenu, true);
  }
  
  public boolean onKey(DialogInterface paramDialogInterface, int paramInt, KeyEvent paramKeyEvent)
  {
    boolean bool = true;
    if ((paramInt == 82) || (paramInt == 4)) {
      if ((paramKeyEvent.getAction() == 0) && (paramKeyEvent.getRepeatCount() == 0))
      {
        paramDialogInterface = this.mDialog.getWindow();
        if (paramDialogInterface == null) {
          break label146;
        }
        paramDialogInterface = paramDialogInterface.getDecorView();
        if (paramDialogInterface == null) {
          break label146;
        }
        paramDialogInterface = paramDialogInterface.getKeyDispatcherState();
        if (paramDialogInterface == null) {
          break label146;
        }
        paramDialogInterface.startTracking(paramKeyEvent, this);
      }
    }
    for (;;)
    {
      return bool;
      if ((paramKeyEvent.getAction() == 1) && (!paramKeyEvent.isCanceled()))
      {
        Object localObject = this.mDialog.getWindow();
        if (localObject != null)
        {
          localObject = ((Window)localObject).getDecorView();
          if (localObject != null)
          {
            localObject = ((View)localObject).getKeyDispatcherState();
            if ((localObject != null) && (((KeyEvent.DispatcherState)localObject).isTracking(paramKeyEvent)))
            {
              this.mMenu.close(true);
              paramDialogInterface.dismiss();
              continue;
            }
          }
        }
      }
      label146:
      bool = this.mMenu.performShortcut(paramInt, paramKeyEvent, 0);
    }
  }
  
  public boolean onOpenSubMenu(MenuBuilder paramMenuBuilder)
  {
    if (this.mPresenterCallback != null) {}
    for (boolean bool = this.mPresenterCallback.onOpenSubMenu(paramMenuBuilder);; bool = false) {
      return bool;
    }
  }
  
  public void setPresenterCallback(MenuPresenter.Callback paramCallback)
  {
    this.mPresenterCallback = paramCallback;
  }
  
  public void show(IBinder paramIBinder)
  {
    MenuBuilder localMenuBuilder = this.mMenu;
    AlertDialog.Builder localBuilder = new AlertDialog.Builder(localMenuBuilder.getContext());
    this.mPresenter = new ListMenuPresenter(R.layout.abc_list_menu_item_layout, R.style.Theme_AppCompat_CompactMenu_Dialog);
    this.mPresenter.setCallback(this);
    this.mMenu.addMenuPresenter(this.mPresenter);
    localBuilder.setAdapter(this.mPresenter.getAdapter(), this);
    Object localObject = localMenuBuilder.getHeaderView();
    if (localObject != null) {
      localBuilder.setCustomTitle((View)localObject);
    }
    for (;;)
    {
      localBuilder.setOnKeyListener(this);
      this.mDialog = localBuilder.create();
      this.mDialog.setOnDismissListener(this);
      localObject = this.mDialog.getWindow().getAttributes();
      ((WindowManager.LayoutParams)localObject).type = 1003;
      if (paramIBinder != null) {
        ((WindowManager.LayoutParams)localObject).token = paramIBinder;
      }
      ((WindowManager.LayoutParams)localObject).flags |= 0x20000;
      this.mDialog.show();
      return;
      localBuilder.setIcon(localMenuBuilder.getHeaderIcon()).setTitle(localMenuBuilder.getHeaderTitle());
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/android/support/v7/internal/view/menu/MenuDialogHelper.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */