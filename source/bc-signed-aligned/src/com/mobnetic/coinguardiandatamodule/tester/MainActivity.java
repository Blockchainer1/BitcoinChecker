package com.mobnetic.coinguardiandatamodule.tester;

import android.app.Activity;
import android.content.Context;
import android.os.Bundle;
import android.text.SpannableStringBuilder;
import android.text.TextUtils;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemSelectedListener;
import android.widget.ArrayAdapter;
import android.widget.ProgressBar;
import android.widget.Spinner;
import android.widget.SpinnerAdapter;
import android.widget.TextView;
import com.android.volley.NetworkResponse;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.VolleyError;
import com.mobnetic.coinguardian.config.MarketsConfig;
import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.Futures;
import com.mobnetic.coinguardian.model.FuturesMarket;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import com.mobnetic.coinguardian.util.CurrencyPairsMapHelper;
import com.mobnetic.coinguardian.util.FormatUtilsBase;
import com.mobnetic.coinguardian.util.MarketsConfigUtils;
import com.mobnetic.coinguardiandatamodule.tester.dialog.DynamicCurrencyPairsDialog;
import com.mobnetic.coinguardiandatamodule.tester.util.CheckErrorsUtils;
import com.mobnetic.coinguardiandatamodule.tester.util.HttpsHelper;
import com.mobnetic.coinguardiandatamodule.tester.util.MarketCurrencyPairsStore;
import com.mobnetic.coinguardiandatamodule.tester.volley.CheckerErrorParsedError;
import com.mobnetic.coinguardiandatamodule.tester.volley.CheckerVolleyMainRequest;
import com.mobnetic.coinguardiandatamodule.tester.volley.CheckerVolleyMainRequest.TickerWrapper;
import com.mobnetic.coinguardiandatamodule.tester.volley.generic.ResponseErrorListener;
import com.mobnetic.coinguardiandatamodule.tester.volley.generic.ResponseListener;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;

public class MainActivity
  extends Activity
{
  private Spinner currencyBaseSpinner;
  private Spinner currencyCounterSpinner;
  private CurrencyPairsMapHelper currencyPairsMapHelper;
  private View currencySpinnersWrapper;
  private View dynamicCurrencyPairsInfoView;
  private View dynamicCurrencyPairsWarningView;
  private Spinner futuresContractTypeSpinner;
  private View getResultButton;
  private Spinner marketSpinner;
  private ProgressBar progressBar;
  private RequestQueue requestQueue;
  private TextView resultView;
  
  private String createNewPriceLineIfNeeded(int paramInt, double paramDouble, String paramString)
  {
    if (paramDouble <= -1.0D) {}
    for (paramString = "";; paramString = "\n" + getString(paramInt, new Object[] { FormatUtilsBase.formatPriceWithCurrency(paramDouble, paramString) })) {
      return paramString;
    }
  }
  
  private void getNewResult()
  {
    Market localMarket = getSelectedMarket();
    String str1 = getSelectedCurrencyBase();
    String str2 = getSelectedCurrencyCounter();
    if (this.currencyPairsMapHelper != null) {}
    for (final Object localObject = this.currencyPairsMapHelper.getCurrencyPairId(str1, str2);; localObject = null)
    {
      localObject = new CheckerInfo(str1, str2, (String)localObject, getSelectedContractType(localMarket));
      localObject = new CheckerVolleyMainRequest(localMarket, (CheckerInfo)localObject, new ResponseListener()new ResponseErrorListener
      {
        public void onResponse(String paramAnonymousString1, Map<String, String> paramAnonymousMap, NetworkResponse paramAnonymousNetworkResponse, String paramAnonymousString2, CheckerVolleyMainRequest.TickerWrapper paramAnonymousTickerWrapper)
        {
          MainActivity.this.handleNewResult(localObject, paramAnonymousTickerWrapper.ticker, paramAnonymousString1, paramAnonymousMap, paramAnonymousNetworkResponse, paramAnonymousString2, null, null);
        }
      }, new ResponseErrorListener()
      {
        public void onErrorResponse(String paramAnonymousString1, Map<String, String> paramAnonymousMap, NetworkResponse paramAnonymousNetworkResponse, String paramAnonymousString2, VolleyError paramAnonymousVolleyError)
        {
          paramAnonymousVolleyError.printStackTrace();
          String str1 = null;
          if ((paramAnonymousVolleyError instanceof CheckerErrorParsedError)) {
            str1 = ((CheckerErrorParsedError)paramAnonymousVolleyError).getErrorMsg();
          }
          String str2 = str1;
          if (TextUtils.isEmpty(str1)) {
            str2 = CheckErrorsUtils.parseVolleyErrorMsg(MainActivity.this, paramAnonymousVolleyError);
          }
          MainActivity.this.handleNewResult(localObject, null, paramAnonymousString1, paramAnonymousMap, paramAnonymousNetworkResponse, paramAnonymousString2, str2, paramAnonymousVolleyError);
        }
      });
      this.requestQueue.add((Request)localObject);
      showResultView(false);
      return;
    }
  }
  
  private HashMap<String, CharSequence[]> getProperCurrencyPairs(Market paramMarket)
  {
    if ((this.currencyPairsMapHelper != null) && (this.currencyPairsMapHelper.getCurrencyPairs() != null) && (this.currencyPairsMapHelper.getCurrencyPairs().size() > 0)) {}
    for (paramMarket = this.currencyPairsMapHelper.getCurrencyPairs();; paramMarket = paramMarket.currencyPairs) {
      return paramMarket;
    }
  }
  
  private int getSelectedContractType(Market paramMarket)
  {
    if ((paramMarket instanceof FuturesMarket))
    {
      paramMarket = (FuturesMarket)paramMarket;
      i = this.futuresContractTypeSpinner.getSelectedItemPosition();
    }
    for (int i = paramMarket.contractTypes[i];; i = 0) {
      return i;
    }
  }
  
  private String getSelectedCurrencyBase()
  {
    if (this.currencyBaseSpinner.getAdapter() == null) {}
    for (String str = null;; str = String.valueOf(this.currencyBaseSpinner.getSelectedItem())) {
      return str;
    }
  }
  
  private String getSelectedCurrencyCounter()
  {
    if (this.currencyCounterSpinner.getAdapter() == null) {}
    for (String str = null;; str = String.valueOf(this.currencyCounterSpinner.getSelectedItem())) {
      return str;
    }
  }
  
  private Market getSelectedMarket()
  {
    return MarketsConfigUtils.getMarketById(MarketsConfig.MARKETS.size() - 1 - this.marketSpinner.getSelectedItemPosition());
  }
  
  private void handleNewResult(CheckerInfo paramCheckerInfo, Ticker paramTicker, String paramString1, Map<String, String> paramMap, NetworkResponse paramNetworkResponse, String paramString2, String paramString3, VolleyError paramVolleyError)
  {
    showResultView(true);
    SpannableStringBuilder localSpannableStringBuilder = new SpannableStringBuilder();
    if (paramTicker != null)
    {
      localSpannableStringBuilder.append(getString(2131034133, new Object[] { FormatUtilsBase.formatPriceWithCurrency(paramTicker.last, paramCheckerInfo.getCurrencyCounter()) }));
      localSpannableStringBuilder.append(createNewPriceLineIfNeeded(2131034132, paramTicker.high, paramCheckerInfo.getCurrencyCounter()));
      localSpannableStringBuilder.append(createNewPriceLineIfNeeded(2131034134, paramTicker.low, paramCheckerInfo.getCurrencyCounter()));
      localSpannableStringBuilder.append(createNewPriceLineIfNeeded(2131034131, paramTicker.bid, paramCheckerInfo.getCurrencyCounter()));
      localSpannableStringBuilder.append(createNewPriceLineIfNeeded(2131034130, paramTicker.ask, paramCheckerInfo.getCurrencyCounter()));
      localSpannableStringBuilder.append(createNewPriceLineIfNeeded(2131034142, paramTicker.vol, paramCheckerInfo.getCurrencyBase()));
      localSpannableStringBuilder.append("\n" + getString(2131034141, new Object[] { FormatUtilsBase.formatSameDayTimeOrDate(this, paramTicker.timestamp) }));
      CheckErrorsUtils.formatResponseDebug(this, localSpannableStringBuilder, paramString1, paramMap, paramNetworkResponse, paramString2, paramVolleyError);
      this.resultView.setText(localSpannableStringBuilder);
      return;
    }
    if (paramString3 != null) {}
    for (;;)
    {
      localSpannableStringBuilder.append(getString(2131034113, new Object[] { paramString3 }));
      break;
      paramString3 = "UNKNOWN";
    }
  }
  
  private void refreshCurrencyBaseSpinner(Market paramMarket)
  {
    Object localObject = getProperCurrencyPairs(paramMarket);
    if ((localObject != null) && (((HashMap)localObject).size() > 0))
    {
      paramMarket = new CharSequence[((HashMap)localObject).size()];
      int i = 0;
      localObject = ((HashMap)localObject).keySet().iterator();
      while (((Iterator)localObject).hasNext())
      {
        paramMarket[i] = ((String)((Iterator)localObject).next());
        i++;
      }
      this.currencyBaseSpinner.setAdapter(new ArrayAdapter(this, 17367049, paramMarket));
    }
    for (;;)
    {
      return;
      this.currencyBaseSpinner.setAdapter(null);
    }
  }
  
  private void refreshCurrencyCounterSpinner(Market paramMarket)
  {
    paramMarket = getProperCurrencyPairs(paramMarket);
    if ((paramMarket != null) && (paramMarket.size() > 0))
    {
      paramMarket = (CharSequence[])((CharSequence[])paramMarket.get(getSelectedCurrencyBase())).clone();
      this.currencyCounterSpinner.setAdapter(new ArrayAdapter(this, 17367049, paramMarket));
    }
    for (;;)
    {
      return;
      this.currencyCounterSpinner.setAdapter(null);
    }
  }
  
  private void refreshCurrencySpinners(Market paramMarket)
  {
    int i = 8;
    refreshCurrencyBaseSpinner(paramMarket);
    refreshCurrencyCounterSpinner(paramMarket);
    refreshDynamicCurrencyPairsView(paramMarket);
    int k;
    if ((getSelectedCurrencyBase() == null) || (getSelectedCurrencyCounter() == null))
    {
      j = 1;
      paramMarket = this.currencySpinnersWrapper;
      if (j == 0) {
        break label93;
      }
      k = 8;
      label47:
      paramMarket.setVisibility(k);
      paramMarket = this.dynamicCurrencyPairsWarningView;
      if (j == 0) {
        break label99;
      }
      k = 0;
      label65:
      paramMarket.setVisibility(k);
      paramMarket = this.getResultButton;
      if (j == 0) {
        break label106;
      }
    }
    label93:
    label99:
    label106:
    for (int j = i;; j = 0)
    {
      paramMarket.setVisibility(j);
      return;
      j = 0;
      break;
      k = 0;
      break label47;
      k = 8;
      break label65;
    }
  }
  
  private void refreshDynamicCurrencyPairsView(Market paramMarket)
  {
    int i = 0;
    View localView = this.dynamicCurrencyPairsInfoView;
    if (paramMarket.getCurrencyPairsUrl(0) != null) {}
    for (;;)
    {
      localView.setVisibility(i);
      return;
      i = 8;
    }
  }
  
  private void refreshFuturesContractTypeSpinner(Market paramMarket)
  {
    Object localObject = null;
    if ((paramMarket instanceof FuturesMarket))
    {
      paramMarket = (FuturesMarket)paramMarket;
      localObject = new CharSequence[paramMarket.contractTypes.length];
      for (i = 0; i < paramMarket.contractTypes.length; i++) {
        localObject[i] = Futures.getContractTypeShortName(paramMarket.contractTypes[i]);
      }
      localObject = new ArrayAdapter(this, 17367049, (Object[])localObject);
    }
    this.futuresContractTypeSpinner.setAdapter((SpinnerAdapter)localObject);
    paramMarket = this.futuresContractTypeSpinner;
    if (localObject != null) {}
    for (int i = 0;; i = 8)
    {
      paramMarket.setVisibility(i);
      return;
    }
  }
  
  private void refreshMarketSpinner()
  {
    String[] arrayOfString = new String[MarketsConfig.MARKETS.size()];
    int i = arrayOfString.length - 1;
    Iterator localIterator = MarketsConfig.MARKETS.values().iterator();
    while (localIterator.hasNext())
    {
      arrayOfString[i] = ((Market)localIterator.next()).name;
      i--;
    }
    this.marketSpinner.setAdapter(new ArrayAdapter(this, 17367049, arrayOfString));
  }
  
  private void showResultView(boolean paramBoolean)
  {
    int i = 0;
    this.getResultButton.setEnabled(paramBoolean);
    Object localObject = this.progressBar;
    if (paramBoolean)
    {
      j = 8;
      ((ProgressBar)localObject).setVisibility(j);
      localObject = this.resultView;
      if (!paramBoolean) {
        break label54;
      }
    }
    label54:
    for (int j = i;; j = 8)
    {
      ((TextView)localObject).setVisibility(j);
      return;
      j = 0;
      break;
    }
  }
  
  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    this.requestQueue = HttpsHelper.newRequestQueue(this);
    setContentView(2130903041);
    this.marketSpinner = ((Spinner)findViewById(2131099651));
    this.currencySpinnersWrapper = findViewById(2131099652);
    this.dynamicCurrencyPairsWarningView = findViewById(2131099655);
    this.dynamicCurrencyPairsInfoView = findViewById(2131099656);
    this.currencyBaseSpinner = ((Spinner)findViewById(2131099653));
    this.currencyCounterSpinner = ((Spinner)findViewById(2131099654));
    this.futuresContractTypeSpinner = ((Spinner)findViewById(2131099657));
    this.getResultButton = findViewById(2131099658);
    this.progressBar = ((ProgressBar)findViewById(2131099659));
    this.resultView = ((TextView)findViewById(2131099660));
    refreshMarketSpinner();
    paramBundle = getSelectedMarket();
    this.currencyPairsMapHelper = new CurrencyPairsMapHelper(MarketCurrencyPairsStore.getPairsForMarket(this, getSelectedMarket().key));
    refreshCurrencySpinners(paramBundle);
    refreshFuturesContractTypeSpinner(paramBundle);
    showResultView(true);
    this.marketSpinner.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener()
    {
      public void onItemSelected(AdapterView<?> paramAnonymousAdapterView, View paramAnonymousView, int paramAnonymousInt, long paramAnonymousLong)
      {
        paramAnonymousAdapterView = MainActivity.this.getSelectedMarket();
        MainActivity.access$102(MainActivity.this, new CurrencyPairsMapHelper(MarketCurrencyPairsStore.getPairsForMarket(MainActivity.this, paramAnonymousAdapterView.key)));
        MainActivity.this.refreshCurrencySpinners(paramAnonymousAdapterView);
        MainActivity.this.refreshFuturesContractTypeSpinner(paramAnonymousAdapterView);
      }
      
      public void onNothingSelected(AdapterView<?> paramAnonymousAdapterView) {}
    });
    this.dynamicCurrencyPairsInfoView.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        new DynamicCurrencyPairsDialog(MainActivity.this, MainActivity.this.getSelectedMarket(), MainActivity.this.currencyPairsMapHelper)
        {
          public void onPairsUpdated(Market paramAnonymous2Market, CurrencyPairsMapHelper paramAnonymous2CurrencyPairsMapHelper)
          {
            MainActivity.access$102(MainActivity.this, paramAnonymous2CurrencyPairsMapHelper);
            MainActivity.this.refreshCurrencySpinners(paramAnonymous2Market);
          }
        }.show();
      }
    });
    this.currencyBaseSpinner.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener()
    {
      public void onItemSelected(AdapterView<?> paramAnonymousAdapterView, View paramAnonymousView, int paramAnonymousInt, long paramAnonymousLong)
      {
        MainActivity.this.refreshCurrencyCounterSpinner(MainActivity.access$000(MainActivity.this));
      }
      
      public void onNothingSelected(AdapterView<?> paramAnonymousAdapterView) {}
    });
    this.getResultButton.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        MainActivity.this.getNewResult();
      }
    });
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardiandatamodule/tester/MainActivity.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */