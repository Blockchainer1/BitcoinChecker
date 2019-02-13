package com.mobnetic.coinguardian.activity;

import butterknife.ButterKnife.Finder;

public class CheckersListActivity$$ViewInjector
{
  public static void inject(ButterKnife.Finder paramFinder, CheckersListActivity paramCheckersListActivity, Object paramObject)
  {
    paramFinder = paramFinder.findById(paramObject, 2131624051);
    if (paramFinder == null) {
      throw new IllegalStateException("Required view with id '2131624051' for field 'donateBar' was not found. If this view is optional add '@Optional' annotation.");
    }
    paramCheckersListActivity.donateBar = paramFinder;
  }
  
  public static void reset(CheckersListActivity paramCheckersListActivity)
  {
    paramCheckersListActivity.donateBar = null;
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/activity/CheckersListActivity$$ViewInjector.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */