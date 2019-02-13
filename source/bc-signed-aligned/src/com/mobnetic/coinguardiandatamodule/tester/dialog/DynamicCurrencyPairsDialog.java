package com.mobnetic.coinguardiandatamodule.tester.dialog;

import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.DialogInterface.OnDismissListener;
import android.text.SpannableStringBuilder;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.TextView;
import com.android.volley.NetworkResponse;
import com.android.volley.RequestQueue;
import com.android.volley.VolleyError;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.util.CurrencyPairsMapHelper;
import com.mobnetic.coinguardian.util.FormatUtilsBase;
import com.mobnetic.coinguardiandatamodule.tester.util.CheckErrorsUtils;
import com.mobnetic.coinguardiandatamodule.tester.util.HttpsHelper;
import com.mobnetic.coinguardiandatamodule.tester.volley.DynamicCurrencyPairsVolleyMainRequest;
import com.mobnetic.coinguardiandatamodule.tester.volley.generic.ResponseErrorListener;
import com.mobnetic.coinguardiandatamodule.tester.volley.generic.ResponseListener;
import java.util.Map;

public abstract class DynamicCurrencyPairsDialog
  extends AlertDialog
  implements DialogInterface.OnDismissListener
{
  private CurrencyPairsMapHelper currencyPairsMapHelper;
  private TextView errorView;
  private final Market market;
  private View refreshImageView;
  private final RequestQueue requestQueue;
  private TextView statusView;
  
  protected DynamicCurrencyPairsDialog(Context paramContext, Market paramMarket, CurrencyPairsMapHelper paramCurrencyPairsMapHelper)
  {
    super(paramContext);
    setInverseBackgroundForced(true);
    this.requestQueue = HttpsHelper.newRequestQueue(paramContext);
    this.market = paramMarket;
    this.currencyPairsMapHelper = paramCurrencyPairsMapHelper;
    setTitle(2131034125);
    setOnDismissListener(this);
    setButton(-3, paramContext.getString(17039370), (DialogInterface.OnClickListener)null);
    paramContext = LayoutInflater.from(paramContext).inflate(2130903040, null);
    this.refreshImageView = paramContext.findViewById(2131099648);
    this.statusView = ((TextView)paramContext.findViewById(2131099649));
    this.errorView = ((TextView)paramContext.findViewById(2131099650));
    this.refreshImageView.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        DynamicCurrencyPairsDialog.this.startRefreshing();
      }
    });
    refreshStatusView(null, null, null, null, null, null);
    setView(paramContext);
  }
  
  private void refreshStatusView(String paramString1, Map<String, String> paramMap, NetworkResponse paramNetworkResponse, String paramString2, String paramString3, VolleyError paramVolleyError)
  {
    if ((this.currencyPairsMapHelper != null) && (this.currencyPairsMapHelper.getDate() > 0L)) {}
    for (Object localObject = FormatUtilsBase.formatSameDayTimeOrDate(getContext(), this.currencyPairsMapHelper.getDate());; localObject = getContext().getString(2131034122))
    {
      this.statusView.setText(getContext().getString(2131034121, new Object[] { localObject }));
      if ((this.currencyPairsMapHelper != null) && (this.currencyPairsMapHelper.getPairsCount() > 0)) {
        this.statusView.append("\n" + getContext().getString(2131034123, new Object[] { Integer.valueOf(this.currencyPairsMapHelper.getPairsCount()) }));
      }
      localObject = new SpannableStringBuilder();
      if (paramString3 != null)
      {
        ((SpannableStringBuilder)localObject).append("\n");
        ((SpannableStringBuilder)localObject).append(getContext().getString(2131034113, new Object[] { paramString3 }));
      }
      CheckErrorsUtils.formatResponseDebug(getContext(), (SpannableStringBuilder)localObject, paramString1, paramMap, paramNetworkResponse, paramString2, paramVolleyError);
      this.errorView.setText((CharSequence)localObject);
      return;
    }
  }
  
  private void startRefreshing()
  {
    setCancelable(false);
    startRefreshingAnim();
    DynamicCurrencyPairsVolleyMainRequest localDynamicCurrencyPairsVolleyMainRequest = new DynamicCurrencyPairsVolleyMainRequest(getContext(), this.market, new ResponseListener()new ResponseErrorListener
    {
      public void onResponse(String paramAnonymousString1, Map<String, String> paramAnonymousMap, NetworkResponse paramAnonymousNetworkResponse, String paramAnonymousString2, CurrencyPairsMapHelper paramAnonymousCurrencyPairsMapHelper)
      {
        DynamicCurrencyPairsDialog.access$102(DynamicCurrencyPairsDialog.this, paramAnonymousCurrencyPairsMapHelper);
        DynamicCurrencyPairsDialog.this.refreshStatusView(paramAnonymousString1, paramAnonymousMap, paramAnonymousNetworkResponse, paramAnonymousString2, null, null);
        DynamicCurrencyPairsDialog.this.stopRefreshingAnim();
        DynamicCurrencyPairsDialog.this.onPairsUpdated(DynamicCurrencyPairsDialog.this.market, paramAnonymousCurrencyPairsMapHelper);
      }
    }, new ResponseErrorListener()
    {
      public void onErrorResponse(String paramAnonymousString1, Map<String, String> paramAnonymousMap, NetworkResponse paramAnonymousNetworkResponse, String paramAnonymousString2, VolleyError paramAnonymousVolleyError)
      {
        paramAnonymousVolleyError.printStackTrace();
        DynamicCurrencyPairsDialog.this.refreshStatusView(paramAnonymousString1, paramAnonymousMap, paramAnonymousNetworkResponse, paramAnonymousString2, CheckErrorsUtils.parseVolleyErrorMsg(DynamicCurrencyPairsDialog.this.getContext(), paramAnonymousVolleyError), paramAnonymousVolleyError);
        DynamicCurrencyPairsDialog.this.stopRefreshingAnim();
      }
    });
    localDynamicCurrencyPairsVolleyMainRequest.setTag(this);
    this.requestQueue.add(localDynamicCurrencyPairsVolleyMainRequest);
  }
  
  public void onDismiss(DialogInterface paramDialogInterface)
  {
    this.requestQueue.cancelAll(this);
    this.currencyPairsMapHelper = null;
  }
  
  public abstract void onPairsUpdated(Market paramMarket, CurrencyPairsMapHelper paramCurrencyPairsMapHelper);
  
  public void startRefreshingAnim()
  {
    setCancelable(false);
    this.refreshImageView.setEnabled(false);
  }
  
  public void stopRefreshingAnim()
  {
    setCancelable(true);
    this.refreshImageView.setEnabled(true);
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */