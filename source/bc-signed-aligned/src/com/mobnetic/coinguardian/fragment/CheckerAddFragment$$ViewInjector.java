package com.mobnetic.coinguardian.fragment;

import android.view.View;
import android.widget.ScrollView;
import android.widget.TextView;
import butterknife.ButterKnife.Finder;
import com.linearlistview.LinearListView;
import com.mobnetic.coinguardian.view.ViewCurrencySpinnerPreference;
import com.mobnetic.coinguardian.view.generic.ViewFrequencyPickerPreference;
import com.mobnetic.coinguardian.view.generic.ViewPreference;
import com.mobnetic.coinguardian.view.generic.ViewSpinnerPreference;
import com.mobnetic.coinguardian.view.generic.ViewTwoStatePreference;

public class CheckerAddFragment$$ViewInjector
{
  public static void inject(ButterKnife.Finder paramFinder, CheckerAddFragment paramCheckerAddFragment, Object paramObject)
  {
    View localView = paramFinder.findById(paramObject, 2131624028);
    if (localView == null) {
      throw new IllegalStateException("Required view with id '2131624028' for field 'scrollView' was not found. If this view is optional add '@Optional' annotation.");
    }
    paramCheckerAddFragment.scrollView = ((ScrollView)localView);
    localView = paramFinder.findById(paramObject, 2131624029);
    if (localView == null) {
      throw new IllegalStateException("Required view with id '2131624029' for field 'enabledView' was not found. If this view is optional add '@Optional' annotation.");
    }
    paramCheckerAddFragment.enabledView = ((ViewTwoStatePreference)localView);
    localView = paramFinder.findById(paramObject, 2131624030);
    if (localView == null) {
      throw new IllegalStateException("Required view with id '2131624030' for field 'marketSpinner' was not found. If this view is optional add '@Optional' annotation.");
    }
    paramCheckerAddFragment.marketSpinner = ((ViewPreference)localView);
    localView = paramFinder.findById(paramObject, 2131624031);
    if (localView == null) {
      throw new IllegalStateException("Required view with id '2131624031' for field 'marketCautionView' was not found. If this view is optional add '@Optional' annotation.");
    }
    paramCheckerAddFragment.marketCautionView = ((TextView)localView);
    localView = paramFinder.findById(paramObject, 2131624032);
    if (localView == null) {
      throw new IllegalStateException("Required view with id '2131624032' for field 'currencySpinnersAndDynamicPairsWrapper' was not found. If this view is optional add '@Optional' annotation.");
    }
    paramCheckerAddFragment.currencySpinnersAndDynamicPairsWrapper = localView;
    localView = paramFinder.findById(paramObject, 2131624036);
    if (localView == null) {
      throw new IllegalStateException("Required view with id '2131624036' for field 'dynamicCurrencyPairsWarningView' was not found. If this view is optional add '@Optional' annotation.");
    }
    paramCheckerAddFragment.dynamicCurrencyPairsWarningView = localView;
    localView = paramFinder.findById(paramObject, 2131624037);
    if (localView == null) {
      throw new IllegalStateException("Required view with id '2131624037' for field 'dynamicCurrencyPairsInfoView' was not found. If this view is optional add '@Optional' annotation.");
    }
    paramCheckerAddFragment.dynamicCurrencyPairsInfoView = localView;
    localView = paramFinder.findById(paramObject, 2131624038);
    if (localView == null) {
      throw new IllegalStateException("Required view with id '2131624038' for field 'dynamicCurrencyPairsNoSyncYetView' was not found. If this view is optional add '@Optional' annotation.");
    }
    paramCheckerAddFragment.dynamicCurrencyPairsNoSyncYetView = localView;
    localView = paramFinder.findById(paramObject, 2131624033);
    if (localView == null) {
      throw new IllegalStateException("Required view with id '2131624033' for field 'currencySpinnersWrapper' was not found. If this view is optional add '@Optional' annotation.");
    }
    paramCheckerAddFragment.currencySpinnersWrapper = localView;
    localView = paramFinder.findById(paramObject, 2131624039);
    if (localView == null) {
      throw new IllegalStateException("Required view with id '2131624039' for field 'checkSectionWrapper' was not found. If this view is optional add '@Optional' annotation.");
    }
    paramCheckerAddFragment.checkSectionWrapper = localView;
    localView = paramFinder.findById(paramObject, 2131624034);
    if (localView == null) {
      throw new IllegalStateException("Required view with id '2131624034' for field 'currencySrcSpinner' was not found. If this view is optional add '@Optional' annotation.");
    }
    paramCheckerAddFragment.currencySrcSpinner = ((ViewCurrencySpinnerPreference)localView);
    localView = paramFinder.findById(paramObject, 2131624035);
    if (localView == null) {
      throw new IllegalStateException("Required view with id '2131624035' for field 'currencyDstSpinner' was not found. If this view is optional add '@Optional' annotation.");
    }
    paramCheckerAddFragment.currencyDstSpinner = ((ViewCurrencySpinnerPreference)localView);
    localView = paramFinder.findById(paramObject, 2131624040);
    if (localView == null) {
      throw new IllegalStateException("Required view with id '2131624040' for field 'futuresContractTypeSpinner' was not found. If this view is optional add '@Optional' annotation.");
    }
    paramCheckerAddFragment.futuresContractTypeSpinner = ((ViewSpinnerPreference)localView);
    localView = paramFinder.findById(paramObject, 2131624041);
    if (localView == null) {
      throw new IllegalStateException("Required view with id '2131624041' for field 'currencySrcSubunitSpinner' was not found. If this view is optional add '@Optional' annotation.");
    }
    paramCheckerAddFragment.currencySrcSubunitSpinner = ((ViewSpinnerPreference)localView);
    localView = paramFinder.findById(paramObject, 2131624042);
    if (localView == null) {
      throw new IllegalStateException("Required view with id '2131624042' for field 'currencyDstSubunitSpinner' was not found. If this view is optional add '@Optional' annotation.");
    }
    paramCheckerAddFragment.currencyDstSubunitSpinner = ((ViewSpinnerPreference)localView);
    localView = paramFinder.findById(paramObject, 2131624043);
    if (localView == null) {
      throw new IllegalStateException("Required view with id '2131624043' for field 'frequencySpinner' was not found. If this view is optional add '@Optional' annotation.");
    }
    paramCheckerAddFragment.frequencySpinner = ((ViewFrequencyPickerPreference)localView);
    localView = paramFinder.findById(paramObject, 2131624044);
    if (localView == null) {
      throw new IllegalStateException("Required view with id '2131624044' for field 'notificationPriorityView' was not found. If this view is optional add '@Optional' annotation.");
    }
    paramCheckerAddFragment.notificationPriorityView = ((ViewTwoStatePreference)localView);
    localView = paramFinder.findById(paramObject, 2131624045);
    if (localView == null) {
      throw new IllegalStateException("Required view with id '2131624045' for field 'checkTTSView' was not found. If this view is optional add '@Optional' annotation.");
    }
    paramCheckerAddFragment.checkTTSView = ((ViewTwoStatePreference)localView);
    localView = paramFinder.findById(paramObject, 2131624046);
    if (localView == null) {
      throw new IllegalStateException("Required view with id '2131624046' for field 'alarmSectionWrapper' was not found. If this view is optional add '@Optional' annotation.");
    }
    paramCheckerAddFragment.alarmSectionWrapper = localView;
    localView = paramFinder.findById(paramObject, 2131624047);
    if (localView == null) {
      throw new IllegalStateException("Required view with id '2131624047' for field 'alarmSectionHeader' was not found. If this view is optional add '@Optional' annotation.");
    }
    paramCheckerAddFragment.alarmSectionHeader = ((TextView)localView);
    localView = paramFinder.findById(paramObject, 2131624048);
    if (localView == null) {
      throw new IllegalStateException("Required view with id '2131624048' for field 'checkerAddAlarmFragmentWrapper' was not found. If this view is optional add '@Optional' annotation.");
    }
    paramCheckerAddFragment.checkerAddAlarmFragmentWrapper = localView;
    paramFinder = paramFinder.findById(paramObject, 2131624050);
    if (paramFinder == null) {
      throw new IllegalStateException("Required view with id '2131624050' for field 'alarmsListView' was not found. If this view is optional add '@Optional' annotation.");
    }
    paramCheckerAddFragment.alarmsListView = ((LinearListView)paramFinder);
  }
  
  public static void reset(CheckerAddFragment paramCheckerAddFragment)
  {
    paramCheckerAddFragment.scrollView = null;
    paramCheckerAddFragment.enabledView = null;
    paramCheckerAddFragment.marketSpinner = null;
    paramCheckerAddFragment.marketCautionView = null;
    paramCheckerAddFragment.currencySpinnersAndDynamicPairsWrapper = null;
    paramCheckerAddFragment.dynamicCurrencyPairsWarningView = null;
    paramCheckerAddFragment.dynamicCurrencyPairsInfoView = null;
    paramCheckerAddFragment.dynamicCurrencyPairsNoSyncYetView = null;
    paramCheckerAddFragment.currencySpinnersWrapper = null;
    paramCheckerAddFragment.checkSectionWrapper = null;
    paramCheckerAddFragment.currencySrcSpinner = null;
    paramCheckerAddFragment.currencyDstSpinner = null;
    paramCheckerAddFragment.futuresContractTypeSpinner = null;
    paramCheckerAddFragment.currencySrcSubunitSpinner = null;
    paramCheckerAddFragment.currencyDstSubunitSpinner = null;
    paramCheckerAddFragment.frequencySpinner = null;
    paramCheckerAddFragment.notificationPriorityView = null;
    paramCheckerAddFragment.checkTTSView = null;
    paramCheckerAddFragment.alarmSectionWrapper = null;
    paramCheckerAddFragment.alarmSectionHeader = null;
    paramCheckerAddFragment.checkerAddAlarmFragmentWrapper = null;
    paramCheckerAddFragment.alarmsListView = null;
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/fragment/CheckerAddFragment$$ViewInjector.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */