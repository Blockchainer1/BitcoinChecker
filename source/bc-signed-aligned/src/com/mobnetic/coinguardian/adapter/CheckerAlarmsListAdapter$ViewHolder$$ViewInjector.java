package com.mobnetic.coinguardian.adapter;

import android.view.View;
import android.widget.CompoundButton;
import android.widget.FrameLayout;
import android.widget.TextView;
import butterknife.ButterKnife.Finder;

public class CheckerAlarmsListAdapter$ViewHolder$$ViewInjector
{
  public static void inject(ButterKnife.Finder paramFinder, CheckerAlarmsListAdapter.ViewHolder paramViewHolder, Object paramObject)
  {
    View localView = paramFinder.findById(paramObject, 2131624024);
    if (localView == null) {
      throw new IllegalStateException("Required view with id '2131624024' for field 'alarmView' was not found. If this view is optional add '@Optional' annotation.");
    }
    paramViewHolder.alarmView = ((TextView)localView);
    localView = paramFinder.findById(paramObject, 2131624026);
    if (localView == null) {
      throw new IllegalStateException("Required view with id '2131624026' for field 'checkBoxWrapper' was not found. If this view is optional add '@Optional' annotation.");
    }
    paramViewHolder.checkBoxWrapper = ((FrameLayout)localView);
    localView = paramFinder.findById(paramObject, 2131624020);
    if (localView == null) {
      throw new IllegalStateException("Required view with id '2131624020' for field 'alarmSoundView' was not found. If this view is optional add '@Optional' annotation.");
    }
    paramViewHolder.alarmSoundView = localView;
    localView = paramFinder.findById(paramObject, 2131624021);
    if (localView == null) {
      throw new IllegalStateException("Required view with id '2131624021' for field 'alarmVibrateView' was not found. If this view is optional add '@Optional' annotation.");
    }
    paramViewHolder.alarmVibrateView = localView;
    localView = paramFinder.findById(paramObject, 2131624022);
    if (localView == null) {
      throw new IllegalStateException("Required view with id '2131624022' for field 'alarmLedView' was not found. If this view is optional add '@Optional' annotation.");
    }
    paramViewHolder.alarmLedView = localView;
    localView = paramFinder.findById(paramObject, 2131624025);
    if (localView == null) {
      throw new IllegalStateException("Required view with id '2131624025' for field 'alarmTtsView' was not found. If this view is optional add '@Optional' annotation.");
    }
    paramViewHolder.alarmTtsView = localView;
    paramFinder = paramFinder.findById(paramObject, 2131624027);
    if (paramFinder == null) {
      throw new IllegalStateException("Required view with id '2131624027' for field 'checkBox' was not found. If this view is optional add '@Optional' annotation.");
    }
    paramViewHolder.checkBox = ((CompoundButton)paramFinder);
  }
  
  public static void reset(CheckerAlarmsListAdapter.ViewHolder paramViewHolder)
  {
    paramViewHolder.alarmView = null;
    paramViewHolder.checkBoxWrapper = null;
    paramViewHolder.alarmSoundView = null;
    paramViewHolder.alarmVibrateView = null;
    paramViewHolder.alarmLedView = null;
    paramViewHolder.alarmTtsView = null;
    paramViewHolder.checkBox = null;
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter$ViewHolder$$ViewInjector.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */