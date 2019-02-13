package com.mobnetic.coinguardian.adapter;

import android.view.View;
import android.widget.CompoundButton;
import android.widget.TextView;
import butterknife.ButterKnife.Finder;

public class CheckersListAdapter$ViewHolder$$ViewInjector
{
  public static void inject(ButterKnife.Finder paramFinder, CheckersListAdapter.ViewHolder paramViewHolder, Object paramObject)
  {
    View localView = paramFinder.findById(paramObject, 2131624058);
    if (localView == null) {
      throw new IllegalStateException("Required view with id '2131624058' for field 'marketView' was not found. If this view is optional add '@Optional' annotation.");
    }
    paramViewHolder.marketView = ((TextView)localView);
    localView = paramFinder.findById(paramObject, 2131624056);
    if (localView == null) {
      throw new IllegalStateException("Required view with id '2131624056' for field 'currencyView' was not found. If this view is optional add '@Optional' annotation.");
    }
    paramViewHolder.currencyView = ((TextView)localView);
    localView = paramFinder.findById(paramObject, 2131624024);
    if (localView == null) {
      throw new IllegalStateException("Required view with id '2131624024' for field 'alarmView' was not found. If this view is optional add '@Optional' annotation.");
    }
    paramViewHolder.alarmView = ((TextView)localView);
    localView = paramFinder.findById(paramObject, 2131624060);
    if (localView == null) {
      throw new IllegalStateException("Required view with id '2131624060' for field 'separator' was not found. If this view is optional add '@Optional' annotation.");
    }
    paramViewHolder.separator = localView;
    localView = paramFinder.findById(paramObject, 2131624061);
    if (localView == null) {
      throw new IllegalStateException("Required view with id '2131624061' for field 'lastCheckView' was not found. If this view is optional add '@Optional' annotation.");
    }
    paramViewHolder.lastCheckView = ((TextView)localView);
    localView = paramFinder.findById(paramObject, 2131624062);
    if (localView == null) {
      throw new IllegalStateException("Required view with id '2131624062' for field 'lastCheckValueView' was not found. If this view is optional add '@Optional' annotation.");
    }
    paramViewHolder.lastCheckValueView = ((TextView)localView);
    localView = paramFinder.findById(paramObject, 2131624063);
    if (localView == null) {
      throw new IllegalStateException("Required view with id '2131624063' for field 'lastCheckTimeView' was not found. If this view is optional add '@Optional' annotation.");
    }
    paramViewHolder.lastCheckTimeView = ((TextView)localView);
    localView = paramFinder.findById(paramObject, 2131624055);
    if (localView == null) {
      throw new IllegalStateException("Required view with id '2131624055' for field 'dragHandle' was not found. If this view is optional add '@Optional' annotation.");
    }
    paramViewHolder.dragHandle = localView;
    paramFinder = paramFinder.findById(paramObject, 2131624064);
    if (paramFinder == null) {
      throw new IllegalStateException("Required view with id '2131624064' for field 'switchView' was not found. If this view is optional add '@Optional' annotation.");
    }
    paramViewHolder.switchView = ((CompoundButton)paramFinder);
  }
  
  public static void reset(CheckersListAdapter.ViewHolder paramViewHolder)
  {
    paramViewHolder.marketView = null;
    paramViewHolder.currencyView = null;
    paramViewHolder.alarmView = null;
    paramViewHolder.separator = null;
    paramViewHolder.lastCheckView = null;
    paramViewHolder.lastCheckValueView = null;
    paramViewHolder.lastCheckTimeView = null;
    paramViewHolder.dragHandle = null;
    paramViewHolder.switchView = null;
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/adapter/CheckersListAdapter$ViewHolder$$ViewInjector.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */