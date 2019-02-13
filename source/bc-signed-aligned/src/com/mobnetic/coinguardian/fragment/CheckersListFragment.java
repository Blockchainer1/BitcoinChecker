package com.mobnetic.coinguardian.fragment;

import android.annotation.TargetApi;
import android.content.ContentProviderOperation;
import android.content.ContentProviderOperation.Builder;
import android.content.ContentResolver;
import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.net.Uri.Builder;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.ListFragmentLayout;
import android.support.v4.app.LoaderManager;
import android.support.v4.app.LoaderManager.LoaderCallbacks;
import android.support.v4.content.CursorLoader;
import android.support.v4.content.Loader;
import android.view.ActionMode;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ListView;
import com.mobnetic.coinguardian.activity.CheckerAddActivity;
import com.mobnetic.coinguardian.adapter.CheckersListAdapter;
import com.mobnetic.coinguardian.appwidget.WidgetProvider;
import com.mobnetic.coinguardian.db.content.CheckerRecord;
import com.mobnetic.coinguardian.db.content.MaindbContract;
import com.mobnetic.coinguardian.db.content.MaindbContract.Checker;
import com.mobnetic.coinguardian.fragment.generic.ActionModeListFragment;
import com.mobnetic.coinguardian.receiver.MarketChecker;
import com.mobnetic.coinguardian.util.AsyncTaskCompat;
import com.mobnetic.coinguardian.util.CheckerRecordHelper;
import com.mobnetic.coinguardian.util.PreferencesUtils;
import com.robotoworks.mechanoid.Mechanoid;
import java.util.ArrayList;
import uk.co.senab.actionbarpulltorefresh.extras.actionbarcompat.PullToRefreshLayout;
import uk.co.senab.actionbarpulltorefresh.library.ActionBarPullToRefresh;
import uk.co.senab.actionbarpulltorefresh.library.ActionBarPullToRefresh.SetupWizard;
import uk.co.senab.actionbarpulltorefresh.library.Options;
import uk.co.senab.actionbarpulltorefresh.library.Options.Builder;
import uk.co.senab.actionbarpulltorefresh.library.listeners.OnRefreshListener;

public class CheckersListFragment
  extends ActionModeListFragment<Cursor>
  implements LoaderManager.LoaderCallbacks<Cursor>, OnRefreshListener
{
  private static final int REFRESH_ALL_HINT_DURATION = 2000;
  public static final int SORT_MODE_CURRENCY = 1;
  public static final int SORT_MODE_EXCHANGE = 2;
  public static final int SORT_MODE_MANUALLY = 0;
  private CheckersListAdapter adapter;
  private AsyncTask<ArrayList<ContentProviderOperation>, Void, Void> dragAndDropUpateTask;
  private PullToRefreshLayout mPullToRefreshLayout;
  private Runnable refreshAllCompleteRunnable = new Runnable()
  {
    public void run()
    {
      if ((CheckersListFragment.this.getActivity() == null) || (CheckersListFragment.this.mPullToRefreshLayout == null)) {}
      for (;;)
      {
        return;
        CheckersListFragment.this.mPullToRefreshLayout.setRefreshComplete();
      }
    }
  };
  private MenuItem sortByManuallyItem;
  
  private void deleteCheckerRecord(Cursor paramCursor, boolean paramBoolean)
  {
    CheckerRecord localCheckerRecord = CheckerRecord.fromCursor(paramCursor);
    CheckerRecordHelper.doBeforeDelete(getActivity(), localCheckerRecord);
    CheckerRecord.fromCursor(paramCursor).delete(paramBoolean);
    CheckerRecordHelper.doAfterDelete(getActivity(), localCheckerRecord);
  }
  
  private void editCheckerRecord(Cursor paramCursor)
  {
    CheckerAddActivity.startCheckerAddActivity(getActivity(), CheckerRecord.fromCursor(paramCursor));
  }
  
  public static String getSortOrderString(Context paramContext)
  {
    switch (PreferencesUtils.getCheckersListSortMode(paramContext))
    {
    default: 
      paramContext = "sortOrder ASC";
    }
    for (;;)
    {
      return paramContext;
      paramContext = "currencySrc ASC, currencyDst ASC, marketKey ASC";
      continue;
      paramContext = "marketKey ASC, currencySrc ASC, currencyDst ASC";
    }
  }
  
  private void onDrop(int paramInt1, int paramInt2)
  {
    if (paramInt1 == paramInt2) {}
    for (;;)
    {
      return;
      final Context localContext = getActivity().getApplicationContext();
      ArrayList localArrayList = new ArrayList();
      Cursor localCursor = this.adapter.getCursor();
      if (localCursor != null)
      {
        localCursor.moveToFirst();
        while (!localCursor.isAfterLast())
        {
          paramInt1 = localCursor.getPosition();
          long l1 = this.adapter.getListPosition(paramInt1);
          long l2 = localCursor.getLong(0);
          localArrayList.add(ContentProviderOperation.newUpdate(MaindbContract.Checker.CONTENT_URI.buildUpon().appendPath(String.valueOf(l2)).appendQueryParameter("mechdb_notify", String.valueOf(false)).build()).withValue("sortOrder", Long.valueOf(l1)).build());
          localCursor.moveToNext();
        }
      }
      if (this.dragAndDropUpateTask != null) {
        this.dragAndDropUpateTask.cancel(true);
      }
      this.dragAndDropUpateTask = new AsyncTask()
      {
        protected Void doInBackground(ArrayList<ContentProviderOperation>... paramAnonymousVarArgs)
        {
          try
          {
            Mechanoid.getContentResolver().applyBatch(MaindbContract.CONTENT_AUTHORITY, paramAnonymousVarArgs[0]);
            PreferencesUtils.setCheckersListSortMode(CheckersListFragment.this.getActivity(), 0);
            if (CheckersListFragment.this.sortByManuallyItem != null) {
              CheckersListFragment.this.sortByManuallyItem.setChecked(true);
            }
            WidgetProvider.refreshWidget(localContext);
          }
          catch (Exception paramAnonymousVarArgs)
          {
            for (;;)
            {
              paramAnonymousVarArgs.printStackTrace();
            }
          }
          return null;
        }
      };
      try
      {
        AsyncTaskCompat.execute(this.dragAndDropUpateTask, new ArrayList[] { localArrayList });
      }
      catch (Exception localException)
      {
        localException.printStackTrace();
      }
    }
  }
  
  private void setNewList(Cursor paramCursor)
  {
    if ((getView() == null) || (getActivity() == null)) {}
    for (;;)
    {
      return;
      if (paramCursor != null) {
        this.adapter.swapCursor(paramCursor);
      }
      setListShown(true);
    }
  }
  
  protected int getActionModeOrContextMenuResId()
  {
    return 2131755012;
  }
  
  protected void onActionModeActive(boolean paramBoolean)
  {
    super.onActionModeActive(paramBoolean);
    this.adapter.setActionModeActive(paramBoolean);
  }
  
  @TargetApi(11)
  protected void onActionModeItemsCheckedCountChanged(ActionMode paramActionMode, int paramInt)
  {
    boolean bool = true;
    MenuItem localMenuItem = paramActionMode.getMenu().findItem(2131624107);
    if (paramInt == 1) {}
    for (;;)
    {
      localMenuItem.setVisible(bool);
      super.onActionModeItemsCheckedCountChanged(paramActionMode, paramInt);
      return;
      bool = false;
    }
  }
  
  protected boolean onActionModeOrContextMenuItemClicked(int paramInt1, Cursor paramCursor, int paramInt2, int paramInt3, boolean paramBoolean)
  {
    boolean bool = true;
    switch (paramInt1)
    {
    default: 
      paramBoolean = super.onActionModeOrContextMenuItemClicked(paramInt1, paramCursor, paramInt2, paramInt3, paramBoolean);
    }
    for (;;)
    {
      return paramBoolean;
      editCheckerRecord(paramCursor);
      paramBoolean = bool;
      continue;
      deleteCheckerRecord(paramCursor, paramBoolean);
      paramBoolean = bool;
    }
  }
  
  public Loader<Cursor> onCreateLoader(int paramInt, Bundle paramBundle)
  {
    return new CursorLoader(getActivity(), MaindbContract.Checker.CONTENT_URI, CheckerRecord.PROJECTION, null, null, getSortOrderString(getActivity()));
  }
  
  public void onCreateOptionsMenu(Menu paramMenu, MenuInflater paramMenuInflater)
  {
    paramMenuInflater.inflate(2131755011, paramMenu);
    this.sortByManuallyItem = paramMenu.findItem(2131624103);
    int i;
    switch (PreferencesUtils.getCheckersListSortMode(getActivity()))
    {
    default: 
      i = 2131624103;
    }
    for (;;)
    {
      paramMenu.findItem(i).setChecked(true);
      super.onCreateOptionsMenu(paramMenu, paramMenuInflater);
      return;
      i = 2131624104;
      continue;
      i = 2131624105;
    }
  }
  
  public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
  {
    paramLayoutInflater = paramLayoutInflater.inflate(2130903072, paramViewGroup, false);
    ListFragmentLayout.setupIds(paramLayoutInflater);
    return paramLayoutInflater;
  }
  
  public void onDestroyView()
  {
    this.mPullToRefreshLayout.removeCallbacks(this.refreshAllCompleteRunnable);
    this.mPullToRefreshLayout = null;
    super.onDestroyView();
  }
  
  public void onListItemClick(ListView paramListView, View paramView, int paramInt, long paramLong)
  {
    editCheckerRecord((Cursor)this.adapter.getItem(paramInt));
  }
  
  public void onLoadFinished(Loader<Cursor> paramLoader, Cursor paramCursor)
  {
    setNewList(paramCursor);
  }
  
  public void onLoaderReset(Loader<Cursor> paramLoader)
  {
    setNewList(null);
  }
  
  public boolean onOptionsItemSelected(MenuItem paramMenuItem)
  {
    boolean bool = true;
    if (paramMenuItem.getItemId() == 2131624101) {
      CheckerAddActivity.startCheckerAddActivity(getActivity(), null);
    }
    for (;;)
    {
      return bool;
      if (paramMenuItem.getItemId() == 2131624103)
      {
        PreferencesUtils.setCheckersListSortMode(getActivity(), 0);
        paramMenuItem.setChecked(true);
        getLoaderManager().restartLoader(0, null, this);
        WidgetProvider.refreshWidget(getActivity());
      }
      label177:
      do
      {
        for (;;)
        {
          bool = super.onOptionsItemSelected(paramMenuItem);
          break;
          if (paramMenuItem.getItemId() == 2131624104)
          {
            PreferencesUtils.setCheckersListSortMode(getActivity(), 1);
            paramMenuItem.setChecked(true);
            getLoaderManager().restartLoader(0, null, this);
            WidgetProvider.refreshWidget(getActivity());
          }
          else
          {
            if (paramMenuItem.getItemId() != 2131624105) {
              break label177;
            }
            PreferencesUtils.setCheckersListSortMode(getActivity(), 2);
            paramMenuItem.setChecked(true);
            getLoaderManager().restartLoader(0, null, this);
            WidgetProvider.refreshWidget(getActivity());
          }
        }
      } while (paramMenuItem.getItemId() != 2131624106);
      this.mPullToRefreshLayout.setRefreshing(true);
      onRefreshStarted(null);
    }
  }
  
  public void onRefreshStarted(View paramView)
  {
    if ((this.mPullToRefreshLayout == null) || (getActivity() == null)) {}
    for (;;)
    {
      return;
      MarketChecker.refreshAllEnabledCheckerRecords(getActivity());
      this.mPullToRefreshLayout.postDelayed(this.refreshAllCompleteRunnable, 2000L);
    }
  }
  
  public void onViewCreated(View paramView, Bundle paramBundle)
  {
    super.onViewCreated(paramView, paramBundle);
    setHasOptionsMenu(true);
    paramView = (ViewGroup)paramView;
    this.mPullToRefreshLayout = new PullToRefreshLayout(paramView.getContext());
    ActionBarPullToRefresh.from(getActivity()).insertLayoutInto(paramView).theseChildrenArePullable(new int[] { getListView().getId() }).listener(this).options(Options.create().minimize(2000).build()).setup(this.mPullToRefreshLayout);
    this.adapter = new CheckersListAdapter(getActivity())
    {
      public void drop(int paramAnonymousInt1, int paramAnonymousInt2)
      {
        super.drop(paramAnonymousInt1, paramAnonymousInt2);
        CheckersListFragment.this.onDrop(paramAnonymousInt1, paramAnonymousInt2);
      }
    };
    setListAdapter(this.adapter);
    setListShownNoAnimation(false);
    setEmptyText(getString(2131165274));
    getListView().setDividerHeight(0);
    getListView().setDivider(null);
    getListView().setSelector(17170445);
    enableActionModeOrContextMenu();
    getLoaderManager().restartLoader(0, null, this);
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/fragment/CheckersListFragment.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */