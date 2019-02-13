package com.mobnetic.coinguardian.activity;

import android.content.Intent;
import android.support.v4.app.Fragment;
import com.mobnetic.coinguardian.activity.generic.SimpleFragmentSubActivity;
import com.mobnetic.coinguardian.fragment.MarketPickerListFragment;

public class MarketPickerListActivity
  extends SimpleFragmentSubActivity<MarketPickerListFragment>
{
  public static final String EXTRA_MARKET_KEY = "market_key";
  
  public static void startActivityForResult(Fragment paramFragment, int paramInt, String paramString)
  {
    Intent localIntent = new Intent(paramFragment.getActivity(), MarketPickerListActivity.class);
    localIntent.putExtra("market_key", paramString);
    paramFragment.startActivityForResult(localIntent, paramInt);
  }
  
  protected MarketPickerListFragment createChildFragment()
  {
    return new MarketPickerListFragment();
  }
  
  public void onBackPressed()
  {
    if (((MarketPickerListFragment)getChildFragment()).onBackPressed()) {}
    for (;;)
    {
      return;
      super.onBackPressed();
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/activity/MarketPickerListActivity.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */