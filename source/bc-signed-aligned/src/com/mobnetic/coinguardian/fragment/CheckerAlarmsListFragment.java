package com.mobnetic.coinguardian.fragment;

import android.database.Cursor;
import android.os.Bundle;
import android.support.v4.app.LoaderManager;
import android.support.v4.app.LoaderManager.LoaderCallbacks;
import android.support.v4.content.CursorLoader;
import android.support.v4.content.Loader;
import android.view.View;
import android.widget.ListView;
import com.mobnetic.coinguardian.adapter.CheckerAlarmsListAdapter;
import com.mobnetic.coinguardian.db.content.AlarmRecord;
import com.mobnetic.coinguardian.db.content.MaindbContract.Alarm;
import com.mobnetic.coinguardian.fragment.generic.ActionModeListFragment;

public class CheckerAlarmsListFragment
  extends ActionModeListFragment<Cursor>
  implements LoaderManager.LoaderCallbacks<Cursor>
{
  private CheckerAlarmsListAdapter adapter;
  
  private void deleteCheckerAlarmRecord(Cursor paramCursor, boolean paramBoolean)
  {
    AlarmRecord.fromCursor(paramCursor).delete(paramBoolean);
  }
  
  private void setNewList(Cursor paramCursor)
  {
    if ((getView() == null) || (getActivity() == null)) {}
    for (;;)
    {
      return;
      setListShown(true);
    }
  }
  
  protected int getActionModeOrContextMenuResId()
  {
    return 2131755009;
  }
  
  protected boolean onActionModeOrContextMenuItemClicked(int paramInt1, Cursor paramCursor, int paramInt2, int paramInt3, boolean paramBoolean)
  {
    switch (paramInt1)
    {
    }
    for (paramBoolean = super.onActionModeOrContextMenuItemClicked(paramInt1, paramCursor, paramInt2, paramInt3, paramBoolean);; paramBoolean = true)
    {
      return paramBoolean;
      deleteCheckerAlarmRecord(paramCursor, paramBoolean);
    }
  }
  
  public Loader<Cursor> onCreateLoader(int paramInt, Bundle paramBundle)
  {
    return new CursorLoader(getActivity(), MaindbContract.Alarm.CONTENT_URI, AlarmRecord.PROJECTION, null, null, null);
  }
  
  public void onListItemClick(ListView paramListView, View paramView, int paramInt, long paramLong) {}
  
  public void onLoadFinished(Loader<Cursor> paramLoader, Cursor paramCursor)
  {
    setNewList(paramCursor);
  }
  
  public void onLoaderReset(Loader<Cursor> paramLoader)
  {
    setNewList(null);
  }
  
  public void onViewCreated(View paramView, Bundle paramBundle)
  {
    super.onViewCreated(paramView, paramBundle);
    setHasOptionsMenu(true);
    setListAdapter(this.adapter);
    setListShownNoAnimation(false);
    setEmptyText(getString(2131165272));
    getListView().setDividerHeight(0);
    getListView().setDivider(null);
    getListView().setSelector(17170445);
    enableActionModeOrContextMenu();
    getLoaderManager().initLoader(0, null, this);
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/fragment/CheckerAlarmsListFragment.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */