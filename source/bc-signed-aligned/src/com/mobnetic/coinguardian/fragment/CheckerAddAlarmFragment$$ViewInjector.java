package com.mobnetic.coinguardian.fragment;

import android.view.View;
import butterknife.ButterKnife.Finder;
import com.mobnetic.coinguardian.view.ViewAlarmCheckPointPreference;
import com.mobnetic.coinguardian.view.ViewAlarmTypeSpinnerPreference;
import com.mobnetic.coinguardian.view.ViewAlarmValuePickerPreference;
import com.mobnetic.coinguardian.view.generic.ViewTwoStatePreference;

public class CheckerAddAlarmFragment$$ViewInjector
{
  public static void inject(ButterKnife.Finder paramFinder, CheckerAddAlarmFragment paramCheckerAddAlarmFragment, Object paramObject)
  {
    View localView = paramFinder.findById(paramObject, 2131624016);
    if (localView == null) {
      throw new IllegalStateException("Required view with id '2131624016' for field 'alarmEnabledView' was not found. If this view is optional add '@Optional' annotation.");
    }
    paramCheckerAddAlarmFragment.alarmEnabledView = ((ViewTwoStatePreference)localView);
    localView = paramFinder.findById(paramObject, 2131624017);
    if (localView == null) {
      throw new IllegalStateException("Required view with id '2131624017' for field 'alarmTypeView' was not found. If this view is optional add '@Optional' annotation.");
    }
    paramCheckerAddAlarmFragment.alarmTypeView = ((ViewAlarmTypeSpinnerPreference)localView);
    localView = paramFinder.findById(paramObject, 2131624018);
    if (localView == null) {
      throw new IllegalStateException("Required view with id '2131624018' for field 'alarmValueView' was not found. If this view is optional add '@Optional' annotation.");
    }
    paramCheckerAddAlarmFragment.alarmValueView = ((ViewAlarmValuePickerPreference)localView);
    localView = paramFinder.findById(paramObject, 2131624019);
    if (localView == null) {
      throw new IllegalStateException("Required view with id '2131624019' for field 'alarmCheckPointView' was not found. If this view is optional add '@Optional' annotation.");
    }
    paramCheckerAddAlarmFragment.alarmCheckPointView = ((ViewAlarmCheckPointPreference)localView);
    localView = paramFinder.findById(paramObject, 2131624020);
    if (localView == null) {
      throw new IllegalStateException("Required view with id '2131624020' for field 'alarmSoundView' was not found. If this view is optional add '@Optional' annotation.");
    }
    paramCheckerAddAlarmFragment.alarmSoundView = ((ViewTwoStatePreference)localView);
    localView = paramFinder.findById(paramObject, 2131624021);
    if (localView == null) {
      throw new IllegalStateException("Required view with id '2131624021' for field 'alarmVibrateView' was not found. If this view is optional add '@Optional' annotation.");
    }
    paramCheckerAddAlarmFragment.alarmVibrateView = ((ViewTwoStatePreference)localView);
    localView = paramFinder.findById(paramObject, 2131624022);
    if (localView == null) {
      throw new IllegalStateException("Required view with id '2131624022' for field 'alarmLedView' was not found. If this view is optional add '@Optional' annotation.");
    }
    paramCheckerAddAlarmFragment.alarmLedView = ((ViewTwoStatePreference)localView);
    paramFinder = paramFinder.findById(paramObject, 2131624023);
    if (paramFinder == null) {
      throw new IllegalStateException("Required view with id '2131624023' for field 'alarmTTSView' was not found. If this view is optional add '@Optional' annotation.");
    }
    paramCheckerAddAlarmFragment.alarmTTSView = ((ViewTwoStatePreference)paramFinder);
  }
  
  public static void reset(CheckerAddAlarmFragment paramCheckerAddAlarmFragment)
  {
    paramCheckerAddAlarmFragment.alarmEnabledView = null;
    paramCheckerAddAlarmFragment.alarmTypeView = null;
    paramCheckerAddAlarmFragment.alarmValueView = null;
    paramCheckerAddAlarmFragment.alarmCheckPointView = null;
    paramCheckerAddAlarmFragment.alarmSoundView = null;
    paramCheckerAddAlarmFragment.alarmVibrateView = null;
    paramCheckerAddAlarmFragment.alarmLedView = null;
    paramCheckerAddAlarmFragment.alarmTTSView = null;
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment$$ViewInjector.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */