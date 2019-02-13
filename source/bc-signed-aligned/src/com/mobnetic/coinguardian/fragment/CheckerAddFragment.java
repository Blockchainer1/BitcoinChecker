package com.mobnetic.coinguardian.fragment;

import android.app.Activity;
import android.app.AlertDialog.Builder;
import android.content.ContentResolver;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.Intent;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.FragmentManager;
import android.support.v7.app.ActionBar;
import android.support.v7.app.ActionBarActivity;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.ScrollView;
import android.widget.TextView;
import butterknife.ButterKnife;
import butterknife.InjectView;
import com.linearlistview.LinearListView;
import com.linearlistview.LinearListView.OnItemClickListener;
import com.mobnetic.coinguardian.activity.CheckerAddAlarmActivity;
import com.mobnetic.coinguardian.activity.MarketPickerListActivity;
import com.mobnetic.coinguardian.adapter.CheckerAlarmsListAdapter;
import com.mobnetic.coinguardian.db.content.AlarmRecord;
import com.mobnetic.coinguardian.db.content.CheckerRecord;
import com.mobnetic.coinguardian.db.content.MaindbContract.Alarm;
import com.mobnetic.coinguardian.db.content.MaindbContract.Checker;
import com.mobnetic.coinguardian.dialog.DynamicCurrencyPairsDialog;
import com.mobnetic.coinguardian.model.CurrencySubunit;
import com.mobnetic.coinguardian.model.FuturesMarket;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.currency.CurrenciesSubunits;
import com.mobnetic.coinguardian.model.market.Unknown;
import com.mobnetic.coinguardian.util.AlarmRecordHelper;
import com.mobnetic.coinguardian.util.CheckerRecordHelper;
import com.mobnetic.coinguardian.util.CurrencyPairsMapHelper;
import com.mobnetic.coinguardian.util.FormatUtils;
import com.mobnetic.coinguardian.util.MarketCurrencyPairsStore;
import com.mobnetic.coinguardian.util.MarketsConfigUtils;
import com.mobnetic.coinguardian.util.NotificationUtils;
import com.mobnetic.coinguardian.util.PreferencesUtils;
import com.mobnetic.coinguardian.util.Utils;
import com.mobnetic.coinguardian.view.ViewCurrencySpinnerPreference;
import com.mobnetic.coinguardian.view.generic.ViewFrequencyPickerPreference;
import com.mobnetic.coinguardian.view.generic.ViewFrequencyPickerPreference.OnFrequencySelectedListener;
import com.mobnetic.coinguardian.view.generic.ViewPreference;
import com.mobnetic.coinguardian.view.generic.ViewSpinnerPreference;
import com.mobnetic.coinguardian.view.generic.ViewSpinnerPreference.OnItemSelectedListener;
import com.mobnetic.coinguardian.view.generic.ViewTwoStatePreference;
import com.mobnetic.coinguardian.view.generic.ViewTwoStatePreference.OnCheckChangedListener;
import com.robotoworks.mechanoid.Mechanoid;
import com.robotoworks.mechanoid.db.SQuery;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Set;

public class CheckerAddFragment
  extends Fragment
{
  private static final String EXTRA_ALARM_RECORDS = "alarm_records";
  private static final String EXTRA_REMOVED_ALARM_RECORD_IDS = "removed_alarm_record_ids";
  private static final String EXTRA_UNSAVED_CHANGES = "unsaved_changes";
  private static final int REQ_EDIT_ALARM = 200;
  private static final int REQ_MARKET_PICKER = 199;
  private ArrayList<AlarmRecord> alarmRecords;
  @InjectView(2131624047)
  TextView alarmSectionHeader;
  @InjectView(2131624046)
  View alarmSectionWrapper;
  private CheckerAlarmsListAdapter alarmsAdapter;
  @InjectView(2131624050)
  LinearListView alarmsListView;
  @InjectView(2131624039)
  View checkSectionWrapper;
  @InjectView(2131624045)
  ViewTwoStatePreference checkTTSView;
  private CheckerAddAlarmFragment checkerAddAlarmFragment;
  @InjectView(2131624048)
  View checkerAddAlarmFragmentWrapper;
  private CheckerRecord checkerRecord;
  @InjectView(2131624035)
  ViewCurrencySpinnerPreference currencyDstSpinner;
  @InjectView(2131624042)
  ViewSpinnerPreference currencyDstSubunitSpinner;
  private CurrencyPairsMapHelper currencyPairsMapHelper;
  @InjectView(2131624032)
  View currencySpinnersAndDynamicPairsWrapper;
  @InjectView(2131624033)
  View currencySpinnersWrapper;
  @InjectView(2131624034)
  ViewCurrencySpinnerPreference currencySrcSpinner;
  @InjectView(2131624041)
  ViewSpinnerPreference currencySrcSubunitSpinner;
  @InjectView(2131624037)
  View dynamicCurrencyPairsInfoView;
  @InjectView(2131624038)
  View dynamicCurrencyPairsNoSyncYetView;
  @InjectView(2131624036)
  View dynamicCurrencyPairsWarningView;
  @InjectView(2131624029)
  ViewTwoStatePreference enabledView;
  @InjectView(2131624043)
  ViewFrequencyPickerPreference frequencySpinner;
  @InjectView(2131624040)
  ViewSpinnerPreference futuresContractTypeSpinner;
  @InjectView(2131624031)
  TextView marketCautionView;
  @InjectView(2131624030)
  ViewPreference marketSpinner;
  @InjectView(2131624044)
  ViewTwoStatePreference notificationPriorityView;
  private ArrayList<Long> removedAlarmRecordIds;
  @InjectView(2131624028)
  ScrollView scrollView;
  private boolean unsavedChanges = false;
  
  private void clearAlarmsLastCheckPoint()
  {
    Iterator localIterator = this.alarmRecords.iterator();
    while (localIterator.hasNext())
    {
      AlarmRecord localAlarmRecord = (AlarmRecord)localIterator.next();
      if (!TextUtils.isEmpty(localAlarmRecord.getLastCheckPointTicker())) {
        this.unsavedChanges = true;
      }
      localAlarmRecord.setLastCheckPointTicker(null);
    }
  }
  
  private void clearLastAndPreviousCheck()
  {
    if ((!TextUtils.isEmpty(this.checkerRecord.getLastCheckTicker())) || (!TextUtils.isEmpty(this.checkerRecord.getPreviousCheckTicker()))) {
      this.unsavedChanges = true;
    }
    this.checkerRecord.setLastCheckTicker(null);
    this.checkerRecord.setPreviousCheckTicker(null);
  }
  
  private void delete()
  {
    if (this.checkerRecord.getId() > 0L) {
      CheckerRecordHelper.doBeforeDelete(getActivity(), this.checkerRecord);
    }
    try
    {
      this.checkerRecord.delete(true);
      CheckerRecordHelper.doAfterDelete(getActivity(), this.checkerRecord);
      getActivity().setResult(-1);
      getActivity().finish();
      return;
    }
    catch (IllegalArgumentException localIllegalArgumentException)
    {
      for (;;)
      {
        localIllegalArgumentException.printStackTrace();
      }
    }
  }
  
  private HashMap<String, CharSequence[]> getProperCurrencyPairs(Market paramMarket)
  {
    if ((this.currencyPairsMapHelper != null) && (this.currencyPairsMapHelper.getCurrencyPairs() != null) && (this.currencyPairsMapHelper.getCurrencyPairs().size() > 0)) {}
    for (paramMarket = this.currencyPairsMapHelper.getCurrencyPairs();; paramMarket = paramMarket.currencyPairs) {
      return paramMarket;
    }
  }
  
  private Market getSelectedMarket()
  {
    return MarketsConfigUtils.getMarketByKey(this.checkerRecord.getMarketKey());
  }
  
  public static final CheckerAddFragment newInstance(CheckerRecord paramCheckerRecord, long paramLong)
  {
    CheckerAddFragment localCheckerAddFragment = new CheckerAddFragment();
    Bundle localBundle = new Bundle();
    localBundle.putParcelable("checker_record", paramCheckerRecord);
    localBundle.putLong("alarm_record_id", paramLong);
    localCheckerAddFragment.setArguments(localBundle);
    return localCheckerAddFragment;
  }
  
  private void onMarketChanged(Market paramMarket)
  {
    if (paramMarket == null) {}
    for (;;)
    {
      return;
      this.marketSpinner.setSummary(paramMarket.name);
      refreshMarketCautionView(paramMarket);
      this.currencyPairsMapHelper = new CurrencyPairsMapHelper(MarketCurrencyPairsStore.getPairsForMarket(getActivity(), paramMarket.key));
      this.checkerRecord.setMarketKey(paramMarket.key);
      this.checkerRecord.setContractType(0L);
      this.unsavedChanges = true;
      clearLastAndPreviousCheck();
      clearAlarmsLastCheckPoint();
      refreshDynamicCurrencyPairsView(paramMarket);
      refreshCurrencySpinnersForMarket(paramMarket, true);
      refreshFuturesContractTypes(paramMarket);
    }
  }
  
  private void refreshAlarms()
  {
    if (this.alarmRecords.size() == 1)
    {
      this.checkerAddAlarmFragment.setCheckerAndAlarmRecord(this.checkerRecord, (AlarmRecord)this.alarmRecords.get(0));
      this.checkerAddAlarmFragmentWrapper.setVisibility(0);
    }
    for (;;)
    {
      this.alarmsAdapter.notifyDataSetChanged();
      return;
      this.checkerAddAlarmFragmentWrapper.setVisibility(8);
    }
  }
  
  private void refreshCurrencyDstSpinnerForMarket(Market paramMarket, boolean paramBoolean)
  {
    int i = 0;
    Object localObject1 = getProperCurrencyPairs(paramMarket);
    String str = this.checkerRecord.getCurrencyDst();
    paramMarket = null;
    if ((localObject1 != null) && (((HashMap)localObject1).size() > 0) && (this.checkerRecord.getCurrencySrc() != null))
    {
      int j = 0;
      Object localObject2 = new CharSequence[((CharSequence[])((HashMap)localObject1).get(this.checkerRecord.getCurrencySrc())).length];
      int k = 0;
      localObject1 = (CharSequence[])((HashMap)localObject1).get(this.checkerRecord.getCurrencySrc());
      int m = localObject1.length;
      while (i < m)
      {
        Object localObject3 = localObject1[i];
        localObject2[k] = localObject3;
        if (localObject3.equals(str)) {
          j = k;
        }
        k++;
        i++;
      }
      this.currencyDstSpinner.setEntriesAndSelection((CharSequence[])localObject2, j);
      if (this.currencyDstSpinner.getEntry() != null)
      {
        localObject2 = String.valueOf(this.currencyDstSpinner.getEntry());
        paramMarket = (Market)localObject2;
        if (!((String)localObject2).equals(this.checkerRecord.getCurrencyDst()))
        {
          this.checkerRecord.setCurrencySubunitDst(1L);
          paramMarket = (Market)localObject2;
          if (this.checkerRecord.getCurrencyDst() != null)
          {
            this.unsavedChanges = true;
            paramMarket = (Market)localObject2;
          }
        }
      }
    }
    for (;;)
    {
      this.checkerRecord.setCurrencyDst(paramMarket);
      refreshCurrencyDstSubunits();
      refreshAlarms();
      return;
      this.currencyDstSpinner.setEntriesAndSelection(null, 0);
    }
  }
  
  private void refreshCurrencyDstSubunits()
  {
    if (!refreshCurrencySubunits(this.checkerRecord.getCurrencyDst(), this.currencyDstSubunitSpinner, this.checkerRecord.getCurrencySubunitDst()))
    {
      if (this.checkerRecord.getCurrencySubunitDst() != 1L) {
        this.unsavedChanges = true;
      }
      this.checkerRecord.setCurrencySubunitDst(1L);
    }
  }
  
  private void refreshCurrencySpinnersForMarket(Market paramMarket, boolean paramBoolean)
  {
    int i = 8;
    refreshCurrencySrcSpinnerForMarket(paramMarket, paramBoolean);
    refreshCurrencyDstSpinnerForMarket(paramMarket, paramBoolean);
    if ((this.checkerRecord.getCurrencySrc() == null) || (this.checkerRecord.getCurrencyDst() == null))
    {
      paramBoolean = true;
      paramMarket = this.dynamicCurrencyPairsWarningView;
      if (!paramBoolean) {
        break label133;
      }
      j = 0;
      label49:
      paramMarket.setVisibility(j);
      this.currencySpinnersAndDynamicPairsWrapper.setClickable(paramBoolean);
      this.currencySpinnersAndDynamicPairsWrapper.setFocusable(paramBoolean);
      paramMarket = this.currencySpinnersWrapper;
      if (!paramBoolean) {
        break label140;
      }
      j = 8;
      label84:
      paramMarket.setVisibility(j);
      paramMarket = this.checkSectionWrapper;
      if (!paramBoolean) {
        break label146;
      }
      j = 8;
      label103:
      paramMarket.setVisibility(j);
      paramMarket = this.alarmSectionWrapper;
      if (!paramBoolean) {
        break label152;
      }
    }
    label133:
    label140:
    label146:
    label152:
    for (int j = i;; j = 0)
    {
      paramMarket.setVisibility(j);
      return;
      paramBoolean = false;
      break;
      j = 8;
      break label49;
      j = 0;
      break label84;
      j = 0;
      break label103;
    }
  }
  
  private void refreshCurrencySrcSpinnerForMarket(Market paramMarket, boolean paramBoolean)
  {
    Object localObject1 = getProperCurrencyPairs(paramMarket);
    String str = this.checkerRecord.getCurrencySrc();
    paramMarket = null;
    if ((localObject1 != null) && (((HashMap)localObject1).size() > 0))
    {
      int i = 0;
      Object localObject2 = new CharSequence[((HashMap)localObject1).size()];
      int j = 0;
      Iterator localIterator = ((HashMap)localObject1).keySet().iterator();
      while (localIterator.hasNext())
      {
        localObject1 = (String)localIterator.next();
        localObject2[j] = localObject1;
        if (((String)localObject1).equals(str)) {
          i = j;
        }
        j++;
      }
      this.currencySrcSpinner.setEntriesAndSelection((CharSequence[])localObject2, i);
      if (this.currencySrcSpinner.getEntry() != null)
      {
        localObject2 = String.valueOf(this.currencySrcSpinner.getEntry());
        paramMarket = (Market)localObject2;
        if (!((String)localObject2).equals(this.checkerRecord.getCurrencySrc()))
        {
          this.checkerRecord.setCurrencySubunitSrc(1L);
          paramMarket = (Market)localObject2;
          if (this.checkerRecord.getCurrencySrc() != null)
          {
            this.unsavedChanges = true;
            paramMarket = (Market)localObject2;
          }
        }
      }
    }
    for (;;)
    {
      this.checkerRecord.setCurrencySrc(paramMarket);
      refreshCurrencySrcSubunits();
      refreshAlarms();
      return;
      this.currencySrcSpinner.setEntriesAndSelection(null, 0);
    }
  }
  
  private void refreshCurrencySrcSubunits()
  {
    this.currencySrcSubunitSpinner.setVisibility(8);
  }
  
  private boolean refreshCurrencySubunits(String paramString, ViewSpinnerPreference paramViewSpinnerPreference, long paramLong)
  {
    boolean bool = true;
    int i = 0;
    int j = 0;
    CharSequence[] arrayOfCharSequence;
    if (CurrenciesSubunits.CURRENCIES_SUBUNITS.containsKey(paramString))
    {
      Object localObject = (LinkedHashMap)CurrenciesSubunits.CURRENCIES_SUBUNITS.get(paramString);
      arrayOfCharSequence = new CharSequence[((LinkedHashMap)localObject).size()];
      k = 0;
      localObject = ((LinkedHashMap)localObject).values().iterator();
      while (((Iterator)localObject).hasNext())
      {
        CurrencySubunit localCurrencySubunit = (CurrencySubunit)((Iterator)localObject).next();
        arrayOfCharSequence[k] = localCurrencySubunit.name;
        if (localCurrencySubunit.subunitToUnit == paramLong) {
          j = k;
        }
        k++;
      }
      if ((arrayOfCharSequence != null) && (arrayOfCharSequence.length > 0))
      {
        paramViewSpinnerPreference.setEntriesAndSelection(arrayOfCharSequence, j);
        if (paramString == null) {
          break label176;
        }
      }
    }
    label176:
    for (int k = i;; k = 8)
    {
      paramViewSpinnerPreference.setVisibility(k);
      paramViewSpinnerPreference.setEnabled(bool);
      return bool;
      bool = false;
      break;
      arrayOfCharSequence = new CharSequence[1];
      arrayOfCharSequence[0] = paramString;
      j = 0;
      bool = false;
      break;
    }
  }
  
  private void refreshDynamicCurrencyPairsView(Market paramMarket)
  {
    int i = 0;
    boolean bool;
    View localView;
    if (paramMarket.getCurrencyPairsUrl(0) != null)
    {
      bool = true;
      this.dynamicCurrencyPairsInfoView.setEnabled(bool);
      localView = this.dynamicCurrencyPairsNoSyncYetView;
      if ((!bool) || (paramMarket.currencyPairs == null) || (paramMarket.currencyPairs.isEmpty())) {
        break label101;
      }
      j = i;
      if (this.currencyPairsMapHelper != null) {
        if (this.currencyPairsMapHelper.getDate() > 0L) {
          break label101;
        }
      }
    }
    label101:
    for (int j = i;; j = 8)
    {
      localView.setVisibility(j);
      this.currencySrcSpinner.setShowSyncButton(bool);
      this.currencyDstSpinner.setShowSyncButton(bool);
      return;
      bool = false;
      break;
    }
  }
  
  private void refreshFuturesContractTypes(Market paramMarket)
  {
    Market localMarket = null;
    int i = 0;
    int j = 0;
    if ((paramMarket instanceof FuturesMarket))
    {
      int k = (int)this.checkerRecord.getContractType();
      FuturesMarket localFuturesMarket = (FuturesMarket)paramMarket;
      paramMarket = new CharSequence[localFuturesMarket.contractTypes.length];
      for (m = 0;; m++)
      {
        localMarket = paramMarket;
        i = j;
        if (m >= localFuturesMarket.contractTypes.length) {
          break;
        }
        i = localFuturesMarket.contractTypes[m];
        paramMarket[m] = FormatUtils.getContractTypeName(getActivity(), i);
        if (k == i) {
          j = m;
        }
      }
    }
    this.futuresContractTypeSpinner.setEntriesAndSelection(localMarket, i);
    paramMarket = this.futuresContractTypeSpinner;
    if (localMarket != null) {}
    for (int m = 0;; m = 8)
    {
      paramMarket.setVisibility(m);
      return;
    }
  }
  
  private void refreshMarketCautionView(Market paramMarket)
  {
    int i = 0;
    int j;
    if (paramMarket != null)
    {
      j = paramMarket.getCautionResId();
      if (j <= 0) {
        break label59;
      }
    }
    label59:
    for (paramMarket = getString(j);; paramMarket = "")
    {
      this.marketCautionView.setText(paramMarket);
      TextView localTextView = this.marketCautionView;
      j = i;
      if (TextUtils.isEmpty(paramMarket)) {
        j = 8;
      }
      localTextView.setVisibility(j);
      return;
      j = 0;
      break;
    }
  }
  
  private void save()
  {
    if ((this.checkerRecord.getCurrencySrc() == null) || (this.checkerRecord.getCurrencyDst() == null)) {
      Utils.showToast(getActivity(), 2131165267, true);
    }
    for (;;)
    {
      return;
      Object localObject1 = this.checkerRecord;
      Object localObject2;
      if (this.currencyPairsMapHelper != null) {
        localObject2 = this.currencyPairsMapHelper.getCurrencyPairId(this.checkerRecord.getCurrencySrc(), this.checkerRecord.getCurrencyDst());
      }
      for (;;)
      {
        ((CheckerRecord)localObject1).setCurrencyPairId((String)localObject2);
        try
        {
          this.checkerRecord.save(false);
          if (this.checkerRecord.getId() > 0L)
          {
            localObject2 = this.removedAlarmRecordIds.iterator();
            while (((Iterator)localObject2).hasNext())
            {
              long l = ((Long)((Iterator)localObject2).next()).longValue();
              SQuery.newQuery().expr("_id", " = ", l).delete(MaindbContract.Alarm.CONTENT_URI, false);
              continue;
              localObject2 = null;
            }
          }
        }
        catch (IllegalArgumentException localIllegalArgumentException)
        {
          for (;;)
          {
            localIllegalArgumentException.printStackTrace();
          }
          localObject1 = this.alarmRecords.iterator();
          while (((Iterator)localObject1).hasNext())
          {
            AlarmRecord localAlarmRecord = (AlarmRecord)((Iterator)localObject1).next();
            localAlarmRecord.setCheckerId(this.checkerRecord.getId());
            localAlarmRecord.setEnabled(localAlarmRecord.getEnabled());
            localAlarmRecord.save(false);
          }
          Mechanoid.getContentResolver().notifyChange(MaindbContract.Checker.CONTENT_URI, null);
          Mechanoid.getContentResolver().notifyChange(MaindbContract.Alarm.CONTENT_URI, null);
          CheckerRecordHelper.doAfterEdit(getActivity(), this.checkerRecord, true);
          getActivity().setResult(-1);
          getActivity().finish();
        }
      }
    }
  }
  
  public void makeUnsavedChanges()
  {
    this.unsavedChanges = true;
  }
  
  public void onActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    int i;
    AlarmRecord localAlarmRecord;
    if (paramInt2 == -1)
    {
      if (paramInt1 != 200) {
        break label116;
      }
      i = paramIntent.getIntExtra("alarm_record_index", -1);
      localAlarmRecord = (AlarmRecord)paramIntent.getParcelableExtra("alarm_record");
      if ((i >= 0) && (i < this.alarmRecords.size())) {
        break label83;
      }
      if (localAlarmRecord != null) {
        this.alarmRecords.add(localAlarmRecord);
      }
      this.unsavedChanges = true;
      refreshAlarms();
    }
    for (;;)
    {
      super.onActivityResult(paramInt1, paramInt2, paramIntent);
      return;
      label83:
      if (localAlarmRecord != null)
      {
        this.alarmRecords.set(i, localAlarmRecord);
        break;
      }
      this.alarmRecords.remove(i);
      break;
      label116:
      if (paramInt1 == 199) {
        onMarketChanged(MarketsConfigUtils.getMarketByKey(paramIntent.getStringExtra("market_key")));
      }
    }
  }
  
  public void onAttach(Activity paramActivity)
  {
    super.onAttach(paramActivity);
    setHasOptionsMenu(true);
  }
  
  public boolean onBackPressed()
  {
    if ((this.unsavedChanges) || ((this.checkerAddAlarmFragment != null) && (this.checkerAddAlarmFragment.getUnsavedChanges()))) {
      new AlertDialog.Builder(getActivity()).setTitle(2131165271).setMessage(2131165270).setNegativeButton(2131165299, new DialogInterface.OnClickListener()
      {
        public void onClick(DialogInterface paramAnonymousDialogInterface, int paramAnonymousInt)
        {
          CheckerAddFragment.this.getActivity().finish();
        }
      }).setNeutralButton(17039360, null).setPositiveButton(2131165303, new DialogInterface.OnClickListener()
      {
        public void onClick(DialogInterface paramAnonymousDialogInterface, int paramAnonymousInt)
        {
          CheckerAddFragment.this.save();
        }
      }).show();
    }
    for (boolean bool = true;; bool = false) {
      return bool;
    }
  }
  
  public void onCreateOptionsMenu(Menu paramMenu, MenuInflater paramMenuInflater)
  {
    paramMenuInflater.inflate(2131755008, paramMenu);
    super.onCreateOptionsMenu(paramMenu, paramMenuInflater);
  }
  
  public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
  {
    paramLayoutInflater = paramLayoutInflater.inflate(2130903070, null);
    ButterKnife.inject(this, paramLayoutInflater);
    return paramLayoutInflater;
  }
  
  public void onDestroyView()
  {
    super.onDestroyView();
    ButterKnife.reset(this);
  }
  
  public boolean onOptionsItemSelected(MenuItem paramMenuItem)
  {
    boolean bool = true;
    if (paramMenuItem.getItemId() == 2131624098) {
      save();
    }
    for (;;)
    {
      return bool;
      if (paramMenuItem.getItemId() == 2131624099) {
        delete();
      } else {
        bool = super.onOptionsItemSelected(paramMenuItem);
      }
    }
  }
  
  public void onSaveInstanceState(Bundle paramBundle)
  {
    paramBundle.putParcelable("checker_record", this.checkerRecord);
    paramBundle.putSerializable("alarm_records", this.alarmRecords);
    paramBundle.putSerializable("removed_alarm_record_ids", this.removedAlarmRecordIds);
    paramBundle.putBoolean("unsaved_changes", this.unsavedChanges);
    super.onSaveInstanceState(paramBundle);
  }
  
  public void onViewCreated(View paramView, Bundle paramBundle)
  {
    super.onViewCreated(paramView, paramBundle);
    label190:
    label246:
    Object localObject;
    label433:
    boolean bool;
    label698:
    long l;
    if (paramBundle != null)
    {
      this.checkerRecord = ((CheckerRecord)paramBundle.getParcelable("checker_record"));
      paramView = (List)paramBundle.getSerializable("alarm_records");
      if (paramView != null) {
        this.alarmRecords = new ArrayList(paramView);
      }
      this.removedAlarmRecordIds = ((ArrayList)paramBundle.getSerializable("removed_alarm_record_ids"));
      this.unsavedChanges = paramBundle.getBoolean("unsaved_changes");
      if (this.checkerRecord != null) {
        break label902;
      }
      this.checkerRecord = new CheckerRecord();
      this.checkerRecord.setEnabled(true);
      this.checkerRecord.setMarketKey(PreferencesUtils.getMarketDefault(getActivity()));
      this.checkerRecord.setCurrencySubunitSrc(1L);
      this.checkerRecord.setCurrencySubunitDst(1L);
      this.checkerRecord.setFrequency(-1L);
      this.checkerRecord.setNotificationPriority(-2L);
      this.checkerRecord.setTtsEnabled(false);
      this.checkerRecord.setSortOrder(Long.MAX_VALUE);
      this.alarmRecords = new ArrayList();
      this.alarmRecords.add(AlarmRecordHelper.generateDefaultAlarmRecord(false));
      NotificationUtils.clearAlarmNotificationForCheckerRecord(getActivity(), this.checkerRecord);
      if (this.removedAlarmRecordIds == null) {
        this.removedAlarmRecordIds = new ArrayList();
      }
      paramView = ((ActionBarActivity)getActivity()).getSupportActionBar();
      if (this.checkerRecord.getId() <= 0L) {
        break label931;
      }
      i = 2131165268;
      paramView.setTitle(i);
      this.checkerAddAlarmFragment = ((CheckerAddAlarmFragment)getChildFragmentManager().findFragmentById(2131624049));
      this.alarmsAdapter = new CheckerAlarmsListAdapter(getActivity(), this, this.checkerRecord, this.alarmRecords)
      {
        public void onItemLongClick(AlarmRecord paramAnonymousAlarmRecord, final int paramAnonymousInt)
        {
          new AlertDialog.Builder(CheckerAddFragment.this.getActivity()).setItems(2131492864, new DialogInterface.OnClickListener()
          {
            public void onClick(DialogInterface paramAnonymous2DialogInterface, int paramAnonymous2Int)
            {
              if (paramAnonymous2Int == 0)
              {
                paramAnonymous2DialogInterface = (AlarmRecord)CheckerAddFragment.this.alarmRecords.remove(paramAnonymousInt);
                if ((paramAnonymous2DialogInterface != null) && (paramAnonymous2DialogInterface.getId() > 0L)) {
                  CheckerAddFragment.this.removedAlarmRecordIds.add(Long.valueOf(paramAnonymous2DialogInterface.getId()));
                }
                CheckerAddFragment.access$202(CheckerAddFragment.this, true);
                CheckerAddFragment.this.refreshAlarms();
              }
            }
          }).show();
        }
      };
      this.alarmsListView.setAdapter(this.alarmsAdapter);
      this.alarmsListView.setOnItemClickListener(new LinearListView.OnItemClickListener()
      {
        public void onItemClick(LinearListView paramAnonymousLinearListView, View paramAnonymousView, int paramAnonymousInt, long paramAnonymousLong)
        {
          if (paramAnonymousInt >= CheckerAddFragment.this.alarmsAdapter.getCount() - 1)
          {
            paramAnonymousLinearListView = AlarmRecordHelper.generateDefaultAlarmRecord(true);
            CheckerAddFragment.this.alarmRecords.add(paramAnonymousLinearListView);
            CheckerAddFragment.access$202(CheckerAddFragment.this, true);
            CheckerAddFragment.this.refreshAlarms();
            CheckerAddAlarmActivity.startCheckerAddAlarmActivity(CheckerAddFragment.this, 200, CheckerAddFragment.this.checkerRecord, paramAnonymousLinearListView, CheckerAddFragment.this.alarmRecords.indexOf(paramAnonymousLinearListView));
          }
          for (;;)
          {
            return;
            CheckerAddAlarmActivity.startCheckerAddAlarmActivity(CheckerAddFragment.this, 200, CheckerAddFragment.this.checkerRecord, (AlarmRecord)CheckerAddFragment.this.alarmRecords.get(paramAnonymousInt), paramAnonymousInt);
          }
        }
      });
      this.enabledView.setChecked(this.checkerRecord.getEnabled());
      this.enabledView.setOnCheckChangedListener(new ViewTwoStatePreference.OnCheckChangedListener()
      {
        public boolean onCheckChanged(ViewTwoStatePreference paramAnonymousViewTwoStatePreference, boolean paramAnonymousBoolean)
        {
          CheckerAddFragment.this.checkerRecord.setEnabled(paramAnonymousBoolean);
          CheckerAddFragment.access$202(CheckerAddFragment.this, true);
          return true;
        }
      });
      localObject = MarketsConfigUtils.getMarketByKey(this.checkerRecord.getMarketKey());
      if (!(localObject instanceof Unknown)) {
        break label938;
      }
      paramView = MarketsConfigUtils.getMarketById(0);
      PreferencesUtils.setMarketDefault(getActivity(), paramView.key);
      this.checkerRecord.setMarketKey(paramView.key);
      new AlertDialog.Builder(getActivity()).setCancelable(false).setTitle(2131165266).setMessage(2131165265).setPositiveButton(17039370, null).show();
      this.currencyPairsMapHelper = new CurrencyPairsMapHelper(MarketCurrencyPairsStore.getPairsForMarket(getActivity(), paramView.key));
      this.marketSpinner.setSummary(paramView.name);
      refreshMarketCautionView(paramView);
      this.marketSpinner.setOnClickListener(new View.OnClickListener()
      {
        public void onClick(View paramAnonymousView)
        {
          MarketPickerListActivity.startActivityForResult(CheckerAddFragment.this, 199, CheckerAddFragment.this.checkerRecord.getMarketKey());
        }
      });
      refreshDynamicCurrencyPairsView(paramView);
      localObject = new View.OnClickListener()
      {
        public void onClick(View paramAnonymousView)
        {
          new DynamicCurrencyPairsDialog(CheckerAddFragment.this.getActivity(), CheckerAddFragment.this.getSelectedMarket(), CheckerAddFragment.this.currencyPairsMapHelper)
          {
            public void onPairsUpdated(Market paramAnonymous2Market, CurrencyPairsMapHelper paramAnonymous2CurrencyPairsMapHelper)
            {
              CheckerAddFragment.access$702(CheckerAddFragment.this, paramAnonymous2CurrencyPairsMapHelper);
              if ((CheckerAddFragment.this.getView() != null) && (CheckerAddFragment.this.getActivity() != null))
              {
                CheckerAddFragment.this.refreshDynamicCurrencyPairsView(paramAnonymous2Market);
                CheckerAddFragment.this.refreshCurrencySpinnersForMarket(paramAnonymous2Market, true);
              }
            }
          }.show();
        }
      };
      this.currencySpinnersAndDynamicPairsWrapper.setOnClickListener((View.OnClickListener)localObject);
      this.currencySpinnersAndDynamicPairsWrapper.setClickable(false);
      this.currencySpinnersAndDynamicPairsWrapper.setFocusable(false);
      this.dynamicCurrencyPairsInfoView.setOnClickListener((View.OnClickListener)localObject);
      refreshCurrencySpinnersForMarket(paramView, false);
      this.currencySrcSpinner.setOnItemSelectedListener(new ViewSpinnerPreference.OnItemSelectedListener()
      {
        public boolean onItemSelected(ViewSpinnerPreference paramAnonymousViewSpinnerPreference, int paramAnonymousInt)
        {
          if (paramAnonymousViewSpinnerPreference.getEntries() != null) {}
          for (paramAnonymousViewSpinnerPreference = String.valueOf(paramAnonymousViewSpinnerPreference.getEntries()[paramAnonymousInt]);; paramAnonymousViewSpinnerPreference = null)
          {
            if ((paramAnonymousViewSpinnerPreference == null) || (!paramAnonymousViewSpinnerPreference.equals(CheckerAddFragment.this.checkerRecord.getCurrencySrc())))
            {
              CheckerAddFragment.this.checkerRecord.setCurrencySrc(paramAnonymousViewSpinnerPreference);
              CheckerAddFragment.this.checkerRecord.setCurrencySubunitSrc(1L);
              CheckerAddFragment.access$202(CheckerAddFragment.this, true);
              CheckerAddFragment.this.clearLastAndPreviousCheck();
              CheckerAddFragment.this.clearAlarmsLastCheckPoint();
              CheckerAddFragment.this.refreshCurrencySrcSubunits();
              CheckerAddFragment.this.refreshCurrencyDstSpinnerForMarket(CheckerAddFragment.access$600(CheckerAddFragment.this), true);
            }
            return true;
          }
        }
      });
      this.currencyDstSpinner.setOnItemSelectedListener(new ViewSpinnerPreference.OnItemSelectedListener()
      {
        public boolean onItemSelected(ViewSpinnerPreference paramAnonymousViewSpinnerPreference, int paramAnonymousInt)
        {
          if (paramAnonymousViewSpinnerPreference.getEntries() != null) {}
          for (paramAnonymousViewSpinnerPreference = String.valueOf(paramAnonymousViewSpinnerPreference.getEntries()[paramAnonymousInt]);; paramAnonymousViewSpinnerPreference = null)
          {
            if ((paramAnonymousViewSpinnerPreference == null) || (!paramAnonymousViewSpinnerPreference.equals(CheckerAddFragment.this.checkerRecord.getCurrencyDst())))
            {
              CheckerAddFragment.this.checkerRecord.setCurrencyDst(paramAnonymousViewSpinnerPreference);
              CheckerAddFragment.this.checkerRecord.setCurrencySubunitDst(1L);
              CheckerAddFragment.access$202(CheckerAddFragment.this, true);
              CheckerAddFragment.this.clearLastAndPreviousCheck();
              CheckerAddFragment.this.clearAlarmsLastCheckPoint();
              CheckerAddFragment.this.refreshCurrencyDstSubunits();
              CheckerAddFragment.this.refreshAlarms();
            }
            return true;
          }
        }
      });
      this.currencySrcSpinner.setOnSyncClickedListener((View.OnClickListener)localObject);
      this.currencyDstSpinner.setOnSyncClickedListener((View.OnClickListener)localObject);
      refreshFuturesContractTypes(paramView);
      this.futuresContractTypeSpinner.setOnItemSelectedListener(new ViewSpinnerPreference.OnItemSelectedListener()
      {
        public boolean onItemSelected(ViewSpinnerPreference paramAnonymousViewSpinnerPreference, int paramAnonymousInt)
        {
          paramAnonymousViewSpinnerPreference = CheckerAddFragment.this.getSelectedMarket();
          if ((paramAnonymousViewSpinnerPreference instanceof FuturesMarket))
          {
            paramAnonymousViewSpinnerPreference = (FuturesMarket)paramAnonymousViewSpinnerPreference;
            if ((paramAnonymousInt >= 0) && (paramAnonymousInt < paramAnonymousViewSpinnerPreference.contractTypes.length))
            {
              CheckerAddFragment.this.checkerRecord.setContractType(paramAnonymousViewSpinnerPreference.contractTypes[paramAnonymousInt]);
              CheckerAddFragment.access$202(CheckerAddFragment.this, true);
              CheckerAddFragment.this.clearLastAndPreviousCheck();
              CheckerAddFragment.this.clearAlarmsLastCheckPoint();
            }
          }
          return true;
        }
      });
      refreshCurrencySrcSubunits();
      this.currencySrcSubunitSpinner.setOnItemSelectedListener(new ViewSpinnerPreference.OnItemSelectedListener()
      {
        public boolean onItemSelected(ViewSpinnerPreference paramAnonymousViewSpinnerPreference, int paramAnonymousInt)
        {
          try
          {
            if (CurrenciesSubunits.CURRENCIES_SUBUNITS.containsKey(CheckerAddFragment.this.checkerRecord.getCurrencySrc()))
            {
              paramAnonymousViewSpinnerPreference = (CurrencySubunit)((com.mobnetic.coinguardian.model.CurrencySubunitsMap)CurrenciesSubunits.CURRENCIES_SUBUNITS.get(CheckerAddFragment.this.checkerRecord.getCurrencySrc())).values().toArray()[paramAnonymousInt];
              CheckerAddFragment.this.checkerRecord.setCurrencySubunitSrc(paramAnonymousViewSpinnerPreference.subunitToUnit);
            }
            for (;;)
            {
              CheckerAddFragment.access$202(CheckerAddFragment.this, true);
              CheckerAddFragment.this.refreshAlarms();
              return true;
              CheckerAddFragment.this.checkerRecord.setCurrencySubunitSrc(1L);
            }
          }
          catch (Exception paramAnonymousViewSpinnerPreference)
          {
            for (;;)
            {
              CheckerAddFragment.this.checkerRecord.setCurrencySubunitSrc(1L);
              paramAnonymousViewSpinnerPreference.printStackTrace();
            }
          }
        }
      });
      refreshCurrencyDstSubunits();
      this.currencyDstSubunitSpinner.setOnItemSelectedListener(new ViewSpinnerPreference.OnItemSelectedListener()
      {
        public boolean onItemSelected(ViewSpinnerPreference paramAnonymousViewSpinnerPreference, int paramAnonymousInt)
        {
          try
          {
            if (CurrenciesSubunits.CURRENCIES_SUBUNITS.containsKey(CheckerAddFragment.this.checkerRecord.getCurrencyDst()))
            {
              paramAnonymousViewSpinnerPreference = (CurrencySubunit)((com.mobnetic.coinguardian.model.CurrencySubunitsMap)CurrenciesSubunits.CURRENCIES_SUBUNITS.get(CheckerAddFragment.this.checkerRecord.getCurrencyDst())).values().toArray()[paramAnonymousInt];
              CheckerAddFragment.this.checkerRecord.setCurrencySubunitDst(paramAnonymousViewSpinnerPreference.subunitToUnit);
            }
            for (;;)
            {
              CheckerAddFragment.access$202(CheckerAddFragment.this, true);
              CheckerAddFragment.this.refreshAlarms();
              return true;
              CheckerAddFragment.this.checkerRecord.setCurrencySubunitDst(1L);
            }
          }
          catch (Exception paramAnonymousViewSpinnerPreference)
          {
            for (;;)
            {
              CheckerAddFragment.this.checkerRecord.setCurrencySubunitDst(1L);
              paramAnonymousViewSpinnerPreference.printStackTrace();
            }
          }
        }
      });
      this.frequencySpinner.setFrequency(this.checkerRecord.getFrequency());
      this.frequencySpinner.setOnFrequencySelectedListener(new ViewFrequencyPickerPreference.OnFrequencySelectedListener()
      {
        public boolean onFrequencySelected(ViewFrequencyPickerPreference paramAnonymousViewFrequencyPickerPreference, long paramAnonymousLong)
        {
          CheckerAddFragment.this.checkerRecord.setFrequency(paramAnonymousLong);
          CheckerAddFragment.access$202(CheckerAddFragment.this, true);
          return true;
        }
      });
      paramView = this.notificationPriorityView;
      if (this.checkerRecord.getNotificationPriority() < -2L) {
        break label1017;
      }
      bool = true;
      paramView.setChecked(bool);
      this.notificationPriorityView.setOnCheckChangedListener(new ViewTwoStatePreference.OnCheckChangedListener()
      {
        public boolean onCheckChanged(ViewTwoStatePreference paramAnonymousViewTwoStatePreference, boolean paramAnonymousBoolean)
        {
          paramAnonymousViewTwoStatePreference = CheckerAddFragment.this.checkerRecord;
          if (paramAnonymousBoolean) {}
          for (long l = -2L;; l = -100L)
          {
            paramAnonymousViewTwoStatePreference.setNotificationPriority(l);
            CheckerAddFragment.access$202(CheckerAddFragment.this, true);
            return true;
          }
        }
      });
      this.checkTTSView.setChecked(this.checkerRecord.getTtsEnabled());
      this.checkTTSView.setOnCheckChangedListener(new ViewTwoStatePreference.OnCheckChangedListener()
      {
        public boolean onCheckChanged(ViewTwoStatePreference paramAnonymousViewTwoStatePreference, boolean paramAnonymousBoolean)
        {
          CheckerAddFragment.this.checkerRecord.setTtsEnabled(paramAnonymousBoolean);
          CheckerAddFragment.access$202(CheckerAddFragment.this, true);
          return true;
        }
      });
      this.alarmSectionHeader.setText(2131165206);
      if ((getArguments() != null) && (paramBundle == null))
      {
        l = getArguments().getLong("alarm_record_id", -1L);
        if ((l <= 0L) || (this.alarmRecords == null)) {}
      }
    }
    for (int i = 0;; i++)
    {
      if (i < this.alarmRecords.size())
      {
        paramView = (AlarmRecord)this.alarmRecords.get(i);
        if ((paramView == null) || (paramView.getId() != l)) {
          continue;
        }
        getArguments().remove("alarm_record_id");
        if (this.alarmRecords.size() != 1) {
          break label1023;
        }
        this.scrollView.post(new Runnable()
        {
          public void run()
          {
            CheckerAddFragment.this.scrollView.scrollTo(0, CheckerAddFragment.this.alarmSectionHeader.getBottom());
          }
        });
      }
      for (;;)
      {
        return;
        if (getArguments() == null) {
          break label1037;
        }
        this.checkerRecord = ((CheckerRecord)getArguments().getParcelable("checker_record"));
        break;
        label902:
        if (this.alarmRecords != null) {
          break label190;
        }
        this.alarmRecords = new ArrayList(CheckerRecordHelper.getAlarmsForCheckerRecord(this.checkerRecord, false));
        break label190;
        label931:
        i = 2131165269;
        break label246;
        label938:
        paramView = (View)localObject;
        if (PreferencesUtils.isExchangeTutorialDone(getActivity())) {
          break label433;
        }
        paramView = (View)localObject;
        if (SQuery.newQuery().count(MaindbContract.Checker.CONTENT_URI) != 0) {
          break label433;
        }
        new AlertDialog.Builder(getActivity()).setCancelable(false).setTitle(2131165264).setMessage(2131165263).setPositiveButton(17039370, new DialogInterface.OnClickListener()
        {
          public void onClick(DialogInterface paramAnonymousDialogInterface, int paramAnonymousInt)
          {
            PreferencesUtils.setExchangeTutorialDone(CheckerAddFragment.this.getActivity());
          }
        }).show();
        paramView = (View)localObject;
        break label433;
        label1017:
        bool = false;
        break label698;
        label1023:
        CheckerAddAlarmActivity.startCheckerAddAlarmActivity(this, 200, this.checkerRecord, paramView, i);
      }
      label1037:
      break;
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/fragment/CheckerAddFragment.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */