package com.mobnetic.coinguardian.dialog;

import android.view.View;
import android.widget.TextView;
import butterknife.ButterKnife.Finder;

public class DynamicCurrencyPairsDialog$$ViewInjector
{
  public static void inject(ButterKnife.Finder paramFinder, DynamicCurrencyPairsDialog paramDynamicCurrencyPairsDialog, Object paramObject)
  {
    View localView = paramFinder.findById(paramObject, 2131624065);
    if (localView == null) {
      throw new IllegalStateException("Required view with id '2131624065' for field 'refreshImageWrapper' was not found. If this view is optional add '@Optional' annotation.");
    }
    paramDynamicCurrencyPairsDialog.refreshImageWrapper = localView;
    localView = paramFinder.findById(paramObject, 2131624066);
    if (localView == null) {
      throw new IllegalStateException("Required view with id '2131624066' for field 'refreshImageView' was not found. If this view is optional add '@Optional' annotation.");
    }
    paramDynamicCurrencyPairsDialog.refreshImageView = localView;
    paramFinder = paramFinder.findById(paramObject, 2131624067);
    if (paramFinder == null) {
      throw new IllegalStateException("Required view with id '2131624067' for field 'statusView' was not found. If this view is optional add '@Optional' annotation.");
    }
    paramDynamicCurrencyPairsDialog.statusView = ((TextView)paramFinder);
  }
  
  public static void reset(DynamicCurrencyPairsDialog paramDynamicCurrencyPairsDialog)
  {
    paramDynamicCurrencyPairsDialog.refreshImageWrapper = null;
    paramDynamicCurrencyPairsDialog.refreshImageView = null;
    paramDynamicCurrencyPairsDialog.statusView = null;
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog$$ViewInjector.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */