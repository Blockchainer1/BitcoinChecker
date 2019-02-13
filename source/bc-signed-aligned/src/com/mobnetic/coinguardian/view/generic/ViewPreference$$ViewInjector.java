package com.mobnetic.coinguardian.view.generic;

import android.view.ViewGroup;
import android.widget.TextView;
import butterknife.ButterKnife.Finder;

public class ViewPreference$$ViewInjector
{
  public static void inject(ButterKnife.Finder paramFinder, ViewPreference paramViewPreference, Object paramObject)
  {
    paramViewPreference.titleAndSummaryContainer = ((ViewGroup)paramFinder.findById(paramObject, 2131624086));
    paramViewPreference.titleView = ((TextView)paramFinder.findById(paramObject, 2131623948));
    paramViewPreference.summaryView = ((TextView)paramFinder.findById(paramObject, 2131623947));
    paramViewPreference.widgetFrame = ((ViewGroup)paramFinder.findById(paramObject, 2131624087));
  }
  
  public static void reset(ViewPreference paramViewPreference)
  {
    paramViewPreference.titleAndSummaryContainer = null;
    paramViewPreference.titleView = null;
    paramViewPreference.summaryView = null;
    paramViewPreference.widgetFrame = null;
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/view/generic/ViewPreference$$ViewInjector.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */