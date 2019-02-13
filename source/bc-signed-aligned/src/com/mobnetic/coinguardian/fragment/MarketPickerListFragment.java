package com.mobnetic.coinguardian.fragment;

import android.content.Intent;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.ListFragment;
import android.support.v4.view.MenuItemCompat;
import android.support.v7.widget.SearchView;
import android.support.v7.widget.SearchView.OnQueryTextListener;
import android.text.TextUtils;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.widget.Filter;
import android.widget.ListView;
import com.mobnetic.coinguardian.activity.SuggestNewExchangeActivity;
import com.mobnetic.coinguardian.adapter.MarketPickerListAdapter;
import com.mobnetic.coinguardian.config.MarketsConfig;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.util.PreferencesUtils;
import com.mobnetic.coinguardian.util.Utils;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;

public class MarketPickerListFragment
  extends ListFragment
  implements SearchView.OnQueryTextListener
{
  public static final int SORT_MODE_ALPHABETICALLY = 0;
  public static final int SORT_MODE_NEWEST_FIRST = 1;
  private MarketPickerListAdapter adapter;
  private String searchQuery;
  private SearchView searchView;
  
  private void getNewList()
  {
    boolean bool = true;
    if (PreferencesUtils.getMarketPickerListSortMode(getActivity()) == 1) {}
    for (;;)
    {
      getNewList(bool);
      return;
      bool = false;
    }
  }
  
  private void getNewList(boolean paramBoolean)
  {
    ArrayList localArrayList = new ArrayList();
    Object localObject = MarketsConfig.MARKETS.values();
    if (paramBoolean)
    {
      localObject = ((Collection)localObject).iterator();
      while (((Iterator)localObject).hasNext()) {
        localArrayList.add(0, (Market)((Iterator)localObject).next());
      }
    }
    localArrayList.addAll((Collection)localObject);
    Collections.sort(localArrayList, new Comparator()
    {
      public int compare(Market paramAnonymousMarket1, Market paramAnonymousMarket2)
      {
        if ((paramAnonymousMarket1.name == null) || (paramAnonymousMarket2 == null)) {}
        for (int i = 0;; i = paramAnonymousMarket1.name.compareToIgnoreCase(paramAnonymousMarket2.name)) {
          return i;
        }
      }
    });
    setNewList(localArrayList);
  }
  
  private void onSuggestMoreExchangesClicked()
  {
    SuggestNewExchangeActivity.startSettingsMainActivity(getActivity());
  }
  
  private void setNewList(List<Market> paramList)
  {
    this.adapter.swapItems(paramList);
    this.adapter.getFilter().filter(this.searchQuery);
    setListAdapter(this.adapter);
  }
  
  public boolean onBackPressed()
  {
    boolean bool = true;
    if ((this.searchView != null) && (!this.searchView.isIconified()))
    {
      this.searchView.setQuery("", true);
      this.searchView.setIconified(true);
    }
    for (;;)
    {
      return bool;
      bool = false;
    }
  }
  
  public void onCreateOptionsMenu(Menu paramMenu, MenuInflater paramMenuInflater)
  {
    paramMenuInflater.inflate(2131755013, paramMenu);
    switch (PreferencesUtils.getMarketPickerListSortMode(getActivity()))
    {
    }
    for (int i = 2131624109;; i = 2131624110)
    {
      paramMenu.findItem(i).setChecked(true);
      this.searchView = ((SearchView)MenuItemCompat.getActionView(paramMenu.findItem(2131624108)));
      this.searchView.setOnQueryTextListener(this);
      this.searchView.setQuery(this.searchQuery, false);
      if (!TextUtils.isEmpty(this.searchQuery)) {
        this.searchView.setIconified(false);
      }
      super.onCreateOptionsMenu(paramMenu, paramMenuInflater);
      return;
    }
  }
  
  public void onDestroyView()
  {
    super.onDestroyView();
    this.adapter = null;
  }
  
  public void onListItemClick(ListView paramListView, View paramView, int paramInt, long paramLong)
  {
    if (this.adapter != null)
    {
      paramView = this.adapter.getItem(paramInt);
      if (paramView != null) {
        break label25;
      }
      onSuggestMoreExchangesClicked();
    }
    for (;;)
    {
      return;
      label25:
      paramListView = new Intent();
      paramListView.putExtra("market_key", paramView.key);
      getActivity().setResult(-1, paramListView);
      getActivity().finish();
    }
  }
  
  public boolean onOptionsItemSelected(MenuItem paramMenuItem)
  {
    boolean bool = true;
    if (paramMenuItem.getItemId() == 2131624109)
    {
      PreferencesUtils.setMarketPickerListSortMode(getActivity(), 0);
      paramMenuItem.setChecked(true);
      getNewList(false);
    }
    for (;;)
    {
      return bool;
      if (paramMenuItem.getItemId() == 2131624110)
      {
        PreferencesUtils.setMarketPickerListSortMode(getActivity(), 1);
        paramMenuItem.setChecked(true);
        getNewList(true);
      }
      else
      {
        bool = super.onOptionsItemSelected(paramMenuItem);
      }
    }
  }
  
  public boolean onQueryTextChange(String paramString)
  {
    this.searchQuery = paramString;
    this.adapter.getFilter().filter(paramString);
    return true;
  }
  
  public boolean onQueryTextSubmit(String paramString)
  {
    Utils.hideKeyboard(getActivity(), this.searchView);
    return true;
  }
  
  public void onSaveInstanceState(Bundle paramBundle)
  {
    paramBundle.putString("searchQuery", this.searchQuery);
    super.onSaveInstanceState(paramBundle);
  }
  
  public void onViewCreated(View paramView, Bundle paramBundle)
  {
    super.onViewCreated(paramView, paramBundle);
    paramView = getActivity().getIntent().getStringExtra("market_key");
    this.adapter = new MarketPickerListAdapter(getActivity(), paramView);
    getListView().setOnItemLongClickListener(this.adapter);
    if (paramBundle != null) {}
    for (paramView = paramBundle.getString("searchQuery");; paramView = null)
    {
      this.searchQuery = paramView;
      setHasOptionsMenu(true);
      getNewList();
      return;
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/fragment/MarketPickerListFragment.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */