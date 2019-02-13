package android.support.v7.app;

import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.os.Bundle;
import android.support.v7.appcompat.R.attr;
import android.support.v7.appcompat.R.bool;
import android.support.v7.appcompat.R.id;
import android.support.v7.appcompat.R.layout;
import android.support.v7.appcompat.R.style;
import android.support.v7.appcompat.R.styleable;
import android.support.v7.internal.view.menu.ListMenuPresenter;
import android.support.v7.internal.view.menu.MenuBuilder;
import android.support.v7.internal.view.menu.MenuBuilder.Callback;
import android.support.v7.internal.view.menu.MenuPresenter.Callback;
import android.support.v7.internal.view.menu.MenuView;
import android.support.v7.internal.view.menu.MenuWrapperFactory;
import android.support.v7.internal.widget.ActionBarContainer;
import android.support.v7.internal.widget.ActionBarContextView;
import android.support.v7.internal.widget.ActionBarView;
import android.support.v7.internal.widget.ProgressBarICS;
import android.support.v7.view.ActionMode;
import android.support.v7.view.ActionMode.Callback;
import android.util.DisplayMetrics;
import android.util.TypedValue;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.view.Window;
import android.widget.FrameLayout;

class ActionBarActivityDelegateBase
  extends ActionBarActivityDelegate
  implements MenuPresenter.Callback, MenuBuilder.Callback
{
  private static final int[] ACTION_BAR_DRAWABLE_TOGGLE_ATTRS = { R.attr.homeAsUpIndicator };
  private static final String TAG = "ActionBarActivityDelegateBase";
  private ActionBarView mActionBarView;
  private ActionMode mActionMode;
  private boolean mClosingActionMenu;
  private boolean mFeatureIndeterminateProgress;
  private boolean mFeatureProgress;
  private ListMenuPresenter mListMenuPresenter;
  private MenuBuilder mMenu;
  private Bundle mPanelFrozenActionViewState;
  private boolean mPanelIsPrepared;
  private boolean mPanelRefreshContent;
  private boolean mSubDecorInstalled;
  private CharSequence mTitleToSet;
  
  ActionBarActivityDelegateBase(ActionBarActivity paramActionBarActivity)
  {
    super(paramActionBarActivity);
  }
  
  private void applyFixedSizeWindow()
  {
    TypedArray localTypedArray = this.mActivity.obtainStyledAttributes(R.styleable.ActionBarWindow);
    Object localObject1 = null;
    Object localObject2 = null;
    Object localObject3 = null;
    Object localObject4 = null;
    Object localObject5 = null;
    Object localObject6 = null;
    Object localObject7 = null;
    DisplayMetrics localDisplayMetrics = null;
    if (localTypedArray.hasValue(3))
    {
      localObject1 = localObject2;
      if (0 == 0) {
        localObject1 = new TypedValue();
      }
      localTypedArray.getValue(3, (TypedValue)localObject1);
    }
    if (localTypedArray.hasValue(5))
    {
      localObject3 = localObject4;
      if (0 == 0) {
        localObject3 = new TypedValue();
      }
      localTypedArray.getValue(5, (TypedValue)localObject3);
    }
    if (localTypedArray.hasValue(6))
    {
      localObject5 = localObject6;
      if (0 == 0) {
        localObject5 = new TypedValue();
      }
      localTypedArray.getValue(6, (TypedValue)localObject5);
    }
    if (localTypedArray.hasValue(4))
    {
      localObject7 = localDisplayMetrics;
      if (0 == 0) {
        localObject7 = new TypedValue();
      }
      localTypedArray.getValue(4, (TypedValue)localObject7);
    }
    localDisplayMetrics = this.mActivity.getResources().getDisplayMetrics();
    int i;
    int j;
    int k;
    label205:
    int m;
    if (localDisplayMetrics.widthPixels < localDisplayMetrics.heightPixels)
    {
      i = 1;
      j = -1;
      k = -1;
      if (i == 0) {
        break label323;
      }
      localObject1 = localObject3;
      m = j;
      if (localObject1 != null)
      {
        m = j;
        if (((TypedValue)localObject1).type != 0)
        {
          if (((TypedValue)localObject1).type != 5) {
            break label326;
          }
          m = (int)((TypedValue)localObject1).getDimension(localDisplayMetrics);
        }
      }
      label241:
      if (i == 0) {
        break label361;
      }
      label246:
      i = k;
      if (localObject5 != null)
      {
        i = k;
        if (((TypedValue)localObject5).type != 0)
        {
          if (((TypedValue)localObject5).type != 5) {
            break label368;
          }
          i = (int)((TypedValue)localObject5).getDimension(localDisplayMetrics);
        }
      }
    }
    for (;;)
    {
      if ((m != -1) || (i != -1)) {
        this.mActivity.getWindow().setLayout(m, i);
      }
      localTypedArray.recycle();
      return;
      i = 0;
      break;
      label323:
      break label205;
      label326:
      m = j;
      if (((TypedValue)localObject1).type != 6) {
        break label241;
      }
      m = (int)((TypedValue)localObject1).getFraction(localDisplayMetrics.widthPixels, localDisplayMetrics.widthPixels);
      break label241;
      label361:
      localObject5 = localObject7;
      break label246;
      label368:
      i = k;
      if (((TypedValue)localObject5).type == 6) {
        i = (int)((TypedValue)localObject5).getFraction(localDisplayMetrics.heightPixels, localDisplayMetrics.heightPixels);
      }
    }
  }
  
  private ProgressBarICS getCircularProgressBar()
  {
    ProgressBarICS localProgressBarICS = (ProgressBarICS)this.mActionBarView.findViewById(R.id.progress_circular);
    if (localProgressBarICS != null) {
      localProgressBarICS.setVisibility(4);
    }
    return localProgressBarICS;
  }
  
  private ProgressBarICS getHorizontalProgressBar()
  {
    ProgressBarICS localProgressBarICS = (ProgressBarICS)this.mActionBarView.findViewById(R.id.progress_horizontal);
    if (localProgressBarICS != null) {
      localProgressBarICS.setVisibility(4);
    }
    return localProgressBarICS;
  }
  
  private MenuView getListMenuView(Context paramContext, MenuPresenter.Callback paramCallback)
  {
    if (this.mMenu == null)
    {
      paramContext = null;
      return paramContext;
    }
    if (this.mListMenuPresenter == null)
    {
      TypedArray localTypedArray = paramContext.obtainStyledAttributes(R.styleable.Theme);
      int i = localTypedArray.getResourceId(4, R.style.Theme_AppCompat_CompactMenu);
      localTypedArray.recycle();
      this.mListMenuPresenter = new ListMenuPresenter(R.layout.abc_list_menu_item_layout, i);
      this.mListMenuPresenter.setCallback(paramCallback);
      this.mMenu.addMenuPresenter(this.mListMenuPresenter);
    }
    for (;;)
    {
      paramContext = this.mListMenuPresenter.getMenuView(new FrameLayout(paramContext));
      break;
      this.mListMenuPresenter.updateMenuView(false);
    }
  }
  
  private void hideProgressBars(ProgressBarICS paramProgressBarICS1, ProgressBarICS paramProgressBarICS2)
  {
    if ((this.mFeatureIndeterminateProgress) && (paramProgressBarICS2.getVisibility() == 0)) {
      paramProgressBarICS2.setVisibility(4);
    }
    if ((this.mFeatureProgress) && (paramProgressBarICS1.getVisibility() == 0)) {
      paramProgressBarICS1.setVisibility(4);
    }
  }
  
  private boolean initializePanelMenu()
  {
    this.mMenu = new MenuBuilder(getActionBarThemedContext());
    this.mMenu.setCallback(this);
    return true;
  }
  
  private boolean preparePanel()
  {
    boolean bool = true;
    if (this.mPanelIsPrepared) {}
    for (;;)
    {
      return bool;
      if ((this.mMenu == null) || (this.mPanelRefreshContent))
      {
        if ((this.mMenu == null) && ((!initializePanelMenu()) || (this.mMenu == null)))
        {
          bool = false;
        }
        else
        {
          if (this.mActionBarView != null) {
            this.mActionBarView.setMenu(this.mMenu, this);
          }
          this.mMenu.stopDispatchingItemsChanged();
          if (!this.mActivity.superOnCreatePanelMenu(0, this.mMenu))
          {
            this.mMenu = null;
            if (this.mActionBarView != null) {
              this.mActionBarView.setMenu(null, this);
            }
            bool = false;
          }
          else
          {
            this.mPanelRefreshContent = false;
          }
        }
      }
      else
      {
        this.mMenu.stopDispatchingItemsChanged();
        if (this.mPanelFrozenActionViewState != null)
        {
          this.mMenu.restoreActionViewStates(this.mPanelFrozenActionViewState);
          this.mPanelFrozenActionViewState = null;
        }
        if (!this.mActivity.superOnPreparePanel(0, null, this.mMenu))
        {
          if (this.mActionBarView != null) {
            this.mActionBarView.setMenu(null, this);
          }
          this.mMenu.startDispatchingItemsChanged();
          bool = false;
        }
        else
        {
          this.mMenu.startDispatchingItemsChanged();
          this.mPanelIsPrepared = true;
        }
      }
    }
  }
  
  private void reopenMenu(MenuBuilder paramMenuBuilder, boolean paramBoolean)
  {
    if ((this.mActionBarView != null) && (this.mActionBarView.isOverflowReserved())) {
      if ((!this.mActionBarView.isOverflowMenuShowing()) || (!paramBoolean)) {
        if (this.mActionBarView.getVisibility() == 0) {
          this.mActionBarView.showOverflowMenu();
        }
      }
    }
    for (;;)
    {
      return;
      this.mActionBarView.hideOverflowMenu();
      continue;
      paramMenuBuilder.close();
    }
  }
  
  private void showProgressBars(ProgressBarICS paramProgressBarICS1, ProgressBarICS paramProgressBarICS2)
  {
    if ((this.mFeatureIndeterminateProgress) && (paramProgressBarICS2.getVisibility() == 4)) {
      paramProgressBarICS2.setVisibility(0);
    }
    if ((this.mFeatureProgress) && (paramProgressBarICS1.getProgress() < 10000)) {
      paramProgressBarICS1.setVisibility(0);
    }
  }
  
  private void updateProgressBars(int paramInt)
  {
    ProgressBarICS localProgressBarICS1 = getCircularProgressBar();
    ProgressBarICS localProgressBarICS2 = getHorizontalProgressBar();
    if (paramInt == -1) {
      if (this.mFeatureProgress)
      {
        paramInt = localProgressBarICS2.getProgress();
        if ((localProgressBarICS2.isIndeterminate()) || (paramInt < 10000))
        {
          paramInt = 0;
          localProgressBarICS2.setVisibility(paramInt);
        }
      }
      else if (this.mFeatureIndeterminateProgress)
      {
        localProgressBarICS1.setVisibility(0);
      }
    }
    for (;;)
    {
      return;
      paramInt = 4;
      break;
      if (paramInt == -2)
      {
        if (this.mFeatureProgress) {
          localProgressBarICS2.setVisibility(8);
        }
        if (this.mFeatureIndeterminateProgress) {
          localProgressBarICS1.setVisibility(8);
        }
      }
      else if (paramInt == -3)
      {
        localProgressBarICS2.setIndeterminate(true);
      }
      else if (paramInt == -4)
      {
        localProgressBarICS2.setIndeterminate(false);
      }
      else if ((paramInt >= 0) && (paramInt <= 10000))
      {
        localProgressBarICS2.setProgress(paramInt + 0);
        if (paramInt < 10000) {
          showProgressBars(localProgressBarICS2, localProgressBarICS1);
        } else {
          hideProgressBars(localProgressBarICS2, localProgressBarICS1);
        }
      }
    }
  }
  
  public void addContentView(View paramView, ViewGroup.LayoutParams paramLayoutParams)
  {
    ensureSubDecor();
    ((ViewGroup)this.mActivity.findViewById(16908290)).addView(paramView, paramLayoutParams);
    this.mActivity.onSupportContentChanged();
  }
  
  public ActionBar createSupportActionBar()
  {
    ensureSubDecor();
    return new ActionBarImplBase(this.mActivity, this.mActivity);
  }
  
  final void ensureSubDecor()
  {
    boolean bool2;
    label116:
    Object localObject;
    if (!this.mSubDecorInstalled)
    {
      if (!this.mHasActionBar) {
        break label314;
      }
      if (!this.mOverlayActionBar) {
        break label276;
      }
      this.mActivity.superSetContentView(R.layout.abc_action_bar_decor_overlay);
      this.mActionBarView = ((ActionBarView)this.mActivity.findViewById(R.id.action_bar));
      this.mActionBarView.setWindowCallback(this.mActivity);
      if (this.mFeatureProgress) {
        this.mActionBarView.initProgress();
      }
      if (this.mFeatureIndeterminateProgress) {
        this.mActionBarView.initIndeterminateProgress();
      }
      boolean bool1 = "splitActionBarWhenNarrow".equals(getUiOptionsFromMetadata());
      if (!bool1) {
        break label289;
      }
      bool2 = this.mActivity.getResources().getBoolean(R.bool.abc_split_action_bar_is_narrow);
      localObject = (ActionBarContainer)this.mActivity.findViewById(R.id.split_action_bar);
      if (localObject != null)
      {
        this.mActionBarView.setSplitView((ActionBarContainer)localObject);
        this.mActionBarView.setSplitActionBar(bool2);
        this.mActionBarView.setSplitWhenNarrow(bool1);
        ActionBarContextView localActionBarContextView = (ActionBarContextView)this.mActivity.findViewById(R.id.action_context_bar);
        localActionBarContextView.setSplitView((ActionBarContainer)localObject);
        localActionBarContextView.setSplitActionBar(bool2);
        localActionBarContextView.setSplitWhenNarrow(bool1);
      }
    }
    for (;;)
    {
      this.mActivity.findViewById(16908290).setId(-1);
      this.mActivity.findViewById(R.id.action_bar_activity_content).setId(16908290);
      if (this.mTitleToSet != null)
      {
        this.mActionBarView.setWindowTitle(this.mTitleToSet);
        this.mTitleToSet = null;
      }
      applyFixedSizeWindow();
      this.mSubDecorInstalled = true;
      this.mActivity.getWindow().getDecorView().post(new Runnable()
      {
        public void run()
        {
          ActionBarActivityDelegateBase.this.supportInvalidateOptionsMenu();
        }
      });
      return;
      label276:
      this.mActivity.superSetContentView(R.layout.abc_action_bar_decor);
      break;
      label289:
      localObject = this.mActivity.obtainStyledAttributes(R.styleable.ActionBarWindow);
      bool2 = ((TypedArray)localObject).getBoolean(2, false);
      ((TypedArray)localObject).recycle();
      break label116;
      label314:
      this.mActivity.superSetContentView(R.layout.abc_simple_decor);
    }
  }
  
  int getHomeAsUpIndicatorAttrId()
  {
    return R.attr.homeAsUpIndicator;
  }
  
  public boolean onBackPressed()
  {
    boolean bool = true;
    if (this.mActionMode != null) {
      this.mActionMode.finish();
    }
    for (;;)
    {
      return bool;
      if ((this.mActionBarView != null) && (this.mActionBarView.hasExpandedActionView())) {
        this.mActionBarView.collapseActionView();
      } else {
        bool = false;
      }
    }
  }
  
  public void onCloseMenu(MenuBuilder paramMenuBuilder, boolean paramBoolean)
  {
    if (this.mClosingActionMenu) {}
    for (;;)
    {
      return;
      this.mClosingActionMenu = true;
      this.mActivity.closeOptionsMenu();
      this.mActionBarView.dismissPopupMenus();
      this.mClosingActionMenu = false;
    }
  }
  
  public void onConfigurationChanged(Configuration paramConfiguration)
  {
    if ((this.mHasActionBar) && (this.mSubDecorInstalled)) {
      ((ActionBarImplBase)getSupportActionBar()).onConfigurationChanged(paramConfiguration);
    }
  }
  
  public void onContentChanged() {}
  
  public boolean onCreatePanelMenu(int paramInt, Menu paramMenu)
  {
    if (paramInt != 0) {}
    for (boolean bool = this.mActivity.superOnCreatePanelMenu(paramInt, paramMenu);; bool = false) {
      return bool;
    }
  }
  
  public View onCreatePanelView(int paramInt)
  {
    Object localObject1 = null;
    Object localObject2 = localObject1;
    if (paramInt == 0)
    {
      localObject2 = localObject1;
      if (preparePanel()) {
        localObject2 = (View)getListMenuView(this.mActivity, this);
      }
    }
    return (View)localObject2;
  }
  
  public boolean onMenuItemSelected(int paramInt, MenuItem paramMenuItem)
  {
    MenuItem localMenuItem = paramMenuItem;
    if (paramInt == 0) {
      localMenuItem = MenuWrapperFactory.createMenuItemWrapper(paramMenuItem);
    }
    return this.mActivity.superOnMenuItemSelected(paramInt, localMenuItem);
  }
  
  public boolean onMenuItemSelected(MenuBuilder paramMenuBuilder, MenuItem paramMenuItem)
  {
    return this.mActivity.onMenuItemSelected(0, paramMenuItem);
  }
  
  public void onMenuModeChange(MenuBuilder paramMenuBuilder)
  {
    reopenMenu(paramMenuBuilder, true);
  }
  
  public boolean onOpenSubMenu(MenuBuilder paramMenuBuilder)
  {
    return false;
  }
  
  public void onPostResume()
  {
    ActionBarImplBase localActionBarImplBase = (ActionBarImplBase)getSupportActionBar();
    if (localActionBarImplBase != null) {
      localActionBarImplBase.setShowHideAnimationEnabled(true);
    }
  }
  
  public boolean onPreparePanel(int paramInt, View paramView, Menu paramMenu)
  {
    if (paramInt != 0) {}
    for (boolean bool = this.mActivity.superOnPreparePanel(paramInt, paramView, paramMenu);; bool = false) {
      return bool;
    }
  }
  
  public void onStop()
  {
    ActionBarImplBase localActionBarImplBase = (ActionBarImplBase)getSupportActionBar();
    if (localActionBarImplBase != null) {
      localActionBarImplBase.setShowHideAnimationEnabled(false);
    }
  }
  
  public void onTitleChanged(CharSequence paramCharSequence)
  {
    if (this.mActionBarView != null) {
      this.mActionBarView.setWindowTitle(paramCharSequence);
    }
    for (;;)
    {
      return;
      this.mTitleToSet = paramCharSequence;
    }
  }
  
  public void setContentView(int paramInt)
  {
    ensureSubDecor();
    ViewGroup localViewGroup = (ViewGroup)this.mActivity.findViewById(16908290);
    localViewGroup.removeAllViews();
    this.mActivity.getLayoutInflater().inflate(paramInt, localViewGroup);
    this.mActivity.onSupportContentChanged();
  }
  
  public void setContentView(View paramView)
  {
    ensureSubDecor();
    ViewGroup localViewGroup = (ViewGroup)this.mActivity.findViewById(16908290);
    localViewGroup.removeAllViews();
    localViewGroup.addView(paramView);
    this.mActivity.onSupportContentChanged();
  }
  
  public void setContentView(View paramView, ViewGroup.LayoutParams paramLayoutParams)
  {
    ensureSubDecor();
    ViewGroup localViewGroup = (ViewGroup)this.mActivity.findViewById(16908290);
    localViewGroup.removeAllViews();
    localViewGroup.addView(paramView, paramLayoutParams);
    this.mActivity.onSupportContentChanged();
  }
  
  void setSupportProgress(int paramInt)
  {
    updateProgressBars(paramInt + 0);
  }
  
  void setSupportProgressBarIndeterminate(boolean paramBoolean)
  {
    if (paramBoolean) {}
    for (int i = -3;; i = -4)
    {
      updateProgressBars(i);
      return;
    }
  }
  
  void setSupportProgressBarIndeterminateVisibility(boolean paramBoolean)
  {
    if (paramBoolean) {}
    for (int i = -1;; i = -2)
    {
      updateProgressBars(i);
      return;
    }
  }
  
  void setSupportProgressBarVisibility(boolean paramBoolean)
  {
    if (paramBoolean) {}
    for (int i = -1;; i = -2)
    {
      updateProgressBars(i);
      return;
    }
  }
  
  public ActionMode startSupportActionMode(ActionMode.Callback paramCallback)
  {
    if (paramCallback == null) {
      throw new IllegalArgumentException("ActionMode callback can not be null.");
    }
    if (this.mActionMode != null) {
      this.mActionMode.finish();
    }
    paramCallback = new ActionModeCallbackWrapper(paramCallback);
    ActionBarImplBase localActionBarImplBase = (ActionBarImplBase)getSupportActionBar();
    if (localActionBarImplBase != null) {
      this.mActionMode = localActionBarImplBase.startActionMode(paramCallback);
    }
    if (this.mActionMode != null) {
      this.mActivity.onSupportActionModeStarted(this.mActionMode);
    }
    return this.mActionMode;
  }
  
  public void supportInvalidateOptionsMenu()
  {
    if (this.mMenu != null)
    {
      Bundle localBundle = new Bundle();
      this.mMenu.saveActionViewStates(localBundle);
      if (localBundle.size() > 0) {
        this.mPanelFrozenActionViewState = localBundle;
      }
      this.mMenu.stopDispatchingItemsChanged();
      this.mMenu.clear();
    }
    this.mPanelRefreshContent = true;
    if (this.mActionBarView != null)
    {
      this.mPanelIsPrepared = false;
      preparePanel();
    }
  }
  
  public boolean supportRequestWindowFeature(int paramInt)
  {
    boolean bool = true;
    switch (paramInt)
    {
    case 3: 
    case 4: 
    case 6: 
    case 7: 
    default: 
      bool = this.mActivity.requestWindowFeature(paramInt);
    }
    for (;;)
    {
      return bool;
      this.mHasActionBar = true;
      continue;
      this.mOverlayActionBar = true;
      continue;
      this.mFeatureProgress = true;
      continue;
      this.mFeatureIndeterminateProgress = true;
    }
  }
  
  private class ActionModeCallbackWrapper
    implements ActionMode.Callback
  {
    private ActionMode.Callback mWrapped;
    
    public ActionModeCallbackWrapper(ActionMode.Callback paramCallback)
    {
      this.mWrapped = paramCallback;
    }
    
    public boolean onActionItemClicked(ActionMode paramActionMode, MenuItem paramMenuItem)
    {
      return this.mWrapped.onActionItemClicked(paramActionMode, paramMenuItem);
    }
    
    public boolean onCreateActionMode(ActionMode paramActionMode, Menu paramMenu)
    {
      return this.mWrapped.onCreateActionMode(paramActionMode, paramMenu);
    }
    
    public void onDestroyActionMode(ActionMode paramActionMode)
    {
      this.mWrapped.onDestroyActionMode(paramActionMode);
      ActionBarActivityDelegateBase.this.mActivity.onSupportActionModeFinished(paramActionMode);
      ActionBarActivityDelegateBase.access$002(ActionBarActivityDelegateBase.this, null);
    }
    
    public boolean onPrepareActionMode(ActionMode paramActionMode, Menu paramMenu)
    {
      return this.mWrapped.onPrepareActionMode(paramActionMode, paramMenu);
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/android/support/v7/app/ActionBarActivityDelegateBase.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */