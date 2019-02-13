package com.mobnetic.coinguardian.adapter;

import android.app.Activity;
import android.content.Context;
import android.content.res.Resources.Theme;
import android.text.Html;
import android.text.TextUtils;
import android.util.TypedValue;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemLongClickListener;
import android.widget.BaseAdapter;
import android.widget.CheckedTextView;
import android.widget.Filter;
import android.widget.Filter.FilterResults;
import android.widget.Filterable;
import android.widget.TextView;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.util.PreferencesUtils;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.regex.Pattern;

public class MarketPickerListAdapter
  extends BaseAdapter
  implements Filterable, AdapterView.OnItemLongClickListener
{
  private final int checkMarkDrawableResId;
  private final Context context;
  private List<Market> filteredItems = null;
  private List<Market> items = null;
  private String marketDefault;
  private String searchQuery;
  private final String selectedMarketKey;
  
  public MarketPickerListAdapter(Activity paramActivity, String paramString)
  {
    this.context = paramActivity;
    this.selectedMarketKey = paramString;
    this.marketDefault = PreferencesUtils.getMarketDefault(paramActivity);
    paramString = new TypedValue();
    paramActivity.getTheme().resolveAttribute(16843289, paramString, true);
    this.checkMarkDrawableResId = paramString.resourceId;
  }
  
  public int getCount()
  {
    if (this.filteredItems != null) {}
    for (int i = this.filteredItems.size() + 1;; i = 0) {
      return i;
    }
  }
  
  public Filter getFilter()
  {
    new Filter()
    {
      protected Filter.FilterResults performFiltering(CharSequence paramAnonymousCharSequence)
      {
        MarketPickerListAdapter.access$002(MarketPickerListAdapter.this, (String)paramAnonymousCharSequence);
        Filter.FilterResults localFilterResults = new Filter.FilterResults();
        ArrayList localArrayList = new ArrayList();
        if (TextUtils.isEmpty(MarketPickerListAdapter.this.searchQuery)) {
          localArrayList.addAll(MarketPickerListAdapter.this.items);
        }
        for (;;)
        {
          localFilterResults.values = localArrayList;
          return localFilterResults;
          if (!MarketPickerListAdapter.this.isEmpty())
          {
            Iterator localIterator = MarketPickerListAdapter.this.items.iterator();
            while (localIterator.hasNext())
            {
              paramAnonymousCharSequence = (Market)localIterator.next();
              if (paramAnonymousCharSequence.name.toLowerCase(Locale.US).contains(MarketPickerListAdapter.this.searchQuery.toLowerCase(Locale.US))) {
                localArrayList.add(paramAnonymousCharSequence);
              }
            }
          }
        }
      }
      
      protected void publishResults(CharSequence paramAnonymousCharSequence, Filter.FilterResults paramAnonymousFilterResults)
      {
        MarketPickerListAdapter.access$202(MarketPickerListAdapter.this, (ArrayList)paramAnonymousFilterResults.values);
        MarketPickerListAdapter.this.notifyDataSetChanged();
      }
    };
  }
  
  public Market getItem(int paramInt)
  {
    if (paramInt < this.filteredItems.size()) {}
    for (Market localMarket = (Market)this.filteredItems.get(paramInt);; localMarket = null) {
      return localMarket;
    }
  }
  
  public long getItemId(int paramInt)
  {
    return paramInt;
  }
  
  public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
  {
    boolean bool1 = false;
    View localView = paramView;
    if (paramView == null) {
      localView = LayoutInflater.from(this.context).inflate(2130903078, paramViewGroup, false);
    }
    paramViewGroup = (TextView)localView.findViewById(2131624071);
    TextView localTextView = (TextView)localView.findViewById(2131624072);
    CheckedTextView localCheckedTextView = (CheckedTextView)localView.findViewById(2131624073);
    Market localMarket = getItem(paramInt);
    if (localMarket != null) {
      if (!TextUtils.isEmpty(this.searchQuery))
      {
        paramView = Html.fromHtml(localMarket.name.replaceAll("(?i)(" + Pattern.quote(this.searchQuery) + ")", "<b>$1</b>"));
        paramViewGroup.setText(paramView);
        if (!localMarket.key.equals(this.marketDefault)) {
          break label215;
        }
        localTextView.setVisibility(0);
        label153:
        boolean bool2 = bool1;
        if (localMarket.key != null)
        {
          bool2 = bool1;
          if (localMarket.key.equals(this.selectedMarketKey)) {
            bool2 = true;
          }
        }
        localCheckedTextView.setChecked(bool2);
        localCheckedTextView.setCheckMarkDrawable(this.checkMarkDrawableResId);
      }
    }
    for (;;)
    {
      return localView;
      paramView = localMarket.name;
      break;
      label215:
      localTextView.setVisibility(8);
      break label153;
      paramViewGroup.setText(2131165248);
      localTextView.setVisibility(8);
      localCheckedTextView.setChecked(false);
      localCheckedTextView.setCheckMarkDrawable(0);
    }
  }
  
  public boolean onItemLongClick(AdapterView<?> paramAdapterView, View paramView, int paramInt, long paramLong)
  {
    if (getItem(paramInt) != null)
    {
      this.marketDefault = getItem(paramInt).key;
      PreferencesUtils.setMarketDefault(this.context, this.marketDefault);
      notifyDataSetChanged();
    }
    for (boolean bool = true;; bool = false) {
      return bool;
    }
  }
  
  public void swapItems(List<Market> paramList)
  {
    this.items = paramList;
    this.filteredItems = paramList;
    notifyDataSetChanged();
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/adapter/MarketPickerListAdapter.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */