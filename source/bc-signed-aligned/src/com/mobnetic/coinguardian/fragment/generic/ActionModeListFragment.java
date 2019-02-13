package com.mobnetic.coinguardian.fragment.generic;

import android.annotation.TargetApi;
import android.os.Build.VERSION;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.ListFragment;
import android.util.SparseBooleanArray;
import android.view.ActionMode;
import android.view.ContextMenu;
import android.view.ContextMenu.ContextMenuInfo;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.widget.AbsListView.MultiChoiceModeListener;
import android.widget.AdapterView.AdapterContextMenuInfo;
import android.widget.ListAdapter;
import android.widget.ListView;

public class ActionModeListFragment<T>
  extends ListFragment
{
  private ListAdapter adapter;
  private int contextMenuSelectenItemPosition = -1;
  private ActionMode currentActionMode;
  
  @TargetApi(11)
  public void cancelActionModeOrContextMenu()
  {
    if (Build.VERSION.SDK_INT >= 11) {
      if (this.currentActionMode != null) {
        this.currentActionMode.finish();
      }
    }
    for (;;)
    {
      return;
      getActivity().closeContextMenu();
    }
  }
  
  @TargetApi(11)
  protected void enableActionModeOrContextMenu()
  {
    if (Build.VERSION.SDK_INT >= 11)
    {
      getListView().setChoiceMode(3);
      getListView().setMultiChoiceModeListener(new MyMultiChoiceModeListener());
    }
    for (;;)
    {
      return;
      registerForContextMenu(getListView());
    }
  }
  
  protected int getActionModeOrContextMenuResId()
  {
    return 0;
  }
  
  protected void onActionModeActive(boolean paramBoolean) {}
  
  @TargetApi(11)
  protected void onActionModeItemsCheckedCountChanged(ActionMode paramActionMode, int paramInt) {}
  
  protected boolean onActionModeOrContextMenuItemClicked(int paramInt1, T paramT, int paramInt2, int paramInt3, boolean paramBoolean)
  {
    return false;
  }
  
  public boolean onContextItemSelected(MenuItem paramMenuItem)
  {
    if (this.contextMenuSelectenItemPosition > -1) {}
    for (;;)
    {
      try
      {
        bool = onActionModeOrContextMenuItemClicked(paramMenuItem.getItemId(), this.adapter.getItem(this.contextMenuSelectenItemPosition), this.contextMenuSelectenItemPosition, 1, true);
        return bool;
      }
      catch (Exception paramMenuItem)
      {
        paramMenuItem.printStackTrace();
        this.contextMenuSelectenItemPosition = -1;
      }
      boolean bool = false;
    }
  }
  
  public void onCreateContextMenu(ContextMenu paramContextMenu, View paramView, ContextMenu.ContextMenuInfo paramContextMenuInfo)
  {
    AdapterView.AdapterContextMenuInfo localAdapterContextMenuInfo = (AdapterView.AdapterContextMenuInfo)paramContextMenuInfo;
    int i = getActionModeOrContextMenuResId();
    if (i > 0)
    {
      this.contextMenuSelectenItemPosition = localAdapterContextMenuInfo.position;
      getActivity().getMenuInflater().inflate(i, paramContextMenu);
      super.onCreateContextMenu(paramContextMenu, paramView, paramContextMenuInfo);
    }
    for (;;)
    {
      return;
      this.contextMenuSelectenItemPosition = -1;
    }
  }
  
  public void onListItemClick(ListView paramListView, View paramView, int paramInt, long paramLong)
  {
    try
    {
      onListItemClick(paramListView, paramView, paramInt, this.adapter.getItem(paramInt));
      return;
    }
    catch (Exception paramListView)
    {
      for (;;) {}
    }
  }
  
  public void onListItemClick(ListView paramListView, View paramView, int paramInt, T paramT) {}
  
  public void setListAdapter(ListAdapter paramListAdapter)
  {
    this.adapter = paramListAdapter;
    super.setListAdapter(paramListAdapter);
  }
  
  @TargetApi(11)
  protected class MyMultiChoiceModeListener
    implements AbsListView.MultiChoiceModeListener
  {
    protected MyMultiChoiceModeListener() {}
    
    private void refreshIconsAndTitle(ActionMode paramActionMode)
    {
      int i = ActionModeListFragment.this.getListView().getCheckedItemCount();
      paramActionMode.setTitle(String.valueOf(i));
      ActionModeListFragment.this.onActionModeItemsCheckedCountChanged(paramActionMode, i);
    }
    
    public boolean onActionItemClicked(ActionMode paramActionMode, MenuItem paramMenuItem)
    {
      boolean bool1 = false;
      boolean bool2 = false;
      SparseBooleanArray localSparseBooleanArray = ActionModeListFragment.this.getListView().getCheckedItemPositions();
      if (localSparseBooleanArray != null)
      {
        int i = localSparseBooleanArray.size();
        int j = 0;
        bool1 = bool2;
        if (j < i) {
          for (bool1 = bool2;; bool1 = false)
          {
            try
            {
              if (localSparseBooleanArray.valueAt(j))
              {
                ActionModeListFragment localActionModeListFragment = ActionModeListFragment.this;
                int k = paramMenuItem.getItemId();
                Object localObject = ActionModeListFragment.this.adapter.getItem(localSparseBooleanArray.keyAt(j));
                int m = localSparseBooleanArray.keyAt(j);
                if (j != i - 1) {
                  continue;
                }
                bool1 = true;
                boolean bool3 = localActionModeListFragment.onActionModeOrContextMenuItemClicked(k, localObject, m, i, bool1);
                bool1 = bool2;
                if (bool3) {
                  bool1 = true;
                }
              }
              j++;
            }
            catch (Exception localException)
            {
              for (;;)
              {
                localException.printStackTrace();
                bool1 = bool2;
              }
            }
            bool2 = bool1;
            break;
          }
        }
      }
      if (bool1) {
        paramActionMode.finish();
      }
      return bool1;
    }
    
    public boolean onCreateActionMode(ActionMode paramActionMode, Menu paramMenu)
    {
      boolean bool = true;
      ActionModeListFragment.this.onActionModeActive(true);
      ActionModeListFragment.access$002(ActionModeListFragment.this, paramActionMode);
      int i = ActionModeListFragment.this.getActionModeOrContextMenuResId();
      if (i > 0)
      {
        paramActionMode.getMenuInflater().inflate(i, paramMenu);
        refreshIconsAndTitle(paramActionMode);
      }
      for (;;)
      {
        return bool;
        bool = false;
      }
    }
    
    public void onDestroyActionMode(ActionMode paramActionMode)
    {
      ActionModeListFragment.this.onActionModeActive(false);
      ActionModeListFragment.access$002(ActionModeListFragment.this, null);
    }
    
    public void onItemCheckedStateChanged(ActionMode paramActionMode, int paramInt, long paramLong, boolean paramBoolean)
    {
      refreshIconsAndTitle(paramActionMode);
    }
    
    public boolean onPrepareActionMode(ActionMode paramActionMode, Menu paramMenu)
    {
      return false;
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/fragment/generic/ActionModeListFragment.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */