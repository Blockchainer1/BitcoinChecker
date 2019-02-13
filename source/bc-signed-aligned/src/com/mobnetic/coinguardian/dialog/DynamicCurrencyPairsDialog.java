package com.mobnetic.coinguardian.dialog;

import android.annotation.SuppressLint;
import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.DialogInterface.OnDismissListener;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.animation.AccelerateDecelerateInterpolator;
import android.widget.TextView;
import butterknife.ButterKnife;
import butterknife.InjectView;
import com.android.volley.RequestQueue;
import com.android.volley.Response.ErrorListener;
import com.android.volley.Response.Listener;
import com.android.volley.VolleyError;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.util.AsyncTaskCompat;
import com.mobnetic.coinguardian.util.CheckErrorsUtils;
import com.mobnetic.coinguardian.util.CurrencyPairsMapHelper;
import com.mobnetic.coinguardian.util.FormatUtils;
import com.mobnetic.coinguardian.util.HttpsHelper;
import com.mobnetic.coinguardian.volley.DynamicCurrencyPairsVolleyAsyncTask;
import com.nineoldandroids.animation.ObjectAnimator;
import com.nineoldandroids.animation.ValueAnimator;
import com.nineoldandroids.view.ViewHelper;

public abstract class DynamicCurrencyPairsDialog
  extends AlertDialog
  implements DialogInterface.OnDismissListener
{
  private CurrencyPairsMapHelper currencyPairsMapHelper;
  private DynamicCurrencyPairsVolleyAsyncTask dynamicCurrencyPairsVolleyAsyncTask;
  private final Market market;
  @InjectView(2131624066)
  View refreshImageView;
  @InjectView(2131624065)
  View refreshImageWrapper;
  private final RequestQueue requestQueue;
  private ValueAnimator rotateAnim;
  @InjectView(2131624067)
  TextView statusView;
  
  @SuppressLint({"InflateParams"})
  protected DynamicCurrencyPairsDialog(Context paramContext, Market paramMarket, CurrencyPairsMapHelper paramCurrencyPairsMapHelper)
  {
    super(paramContext);
    setInverseBackgroundForced(true);
    this.requestQueue = HttpsHelper.newRequestQueue(paramContext);
    this.market = paramMarket;
    this.currencyPairsMapHelper = paramCurrencyPairsMapHelper;
    setTitle(2131165258);
    setOnDismissListener(this);
    setButton(-3, paramContext.getString(17039370), (DialogInterface.OnClickListener)null);
    paramContext = LayoutInflater.from(paramContext).inflate(2130903075, null);
    ButterKnife.inject(this, paramContext);
    this.refreshImageWrapper.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        DynamicCurrencyPairsDialog.this.startRefreshing();
      }
    });
    refreshStatusView(null);
    setView(paramContext);
  }
  
  private void refreshStatusView(String paramString)
  {
    if ((this.currencyPairsMapHelper != null) && (this.currencyPairsMapHelper.getDate() > 0L)) {}
    for (String str = FormatUtils.formatSameDayTimeOrDate(getContext(), this.currencyPairsMapHelper.getDate());; str = getContext().getString(2131165256))
    {
      this.statusView.setText(getContext().getString(2131165255, new Object[] { str }));
      if ((this.currencyPairsMapHelper != null) && (this.currencyPairsMapHelper.getPairsCount() > 0)) {
        this.statusView.append("\n" + getContext().getString(2131165257, new Object[] { Integer.valueOf(this.currencyPairsMapHelper.getPairsCount()) }));
      }
      if (paramString != null) {
        this.statusView.append("\n" + CheckErrorsUtils.formatError(getContext(), paramString));
      }
      return;
    }
  }
  
  private void startRefreshing()
  {
    setCancelable(false);
    startRefreshingAnim();
    this.dynamicCurrencyPairsVolleyAsyncTask = new DynamicCurrencyPairsVolleyAsyncTask(this.requestQueue, getContext(), this.market, new Response.Listener()new Response.ErrorListener
    {
      public void onResponse(CurrencyPairsMapHelper paramAnonymousCurrencyPairsMapHelper)
      {
        DynamicCurrencyPairsDialog.access$102(DynamicCurrencyPairsDialog.this, null);
        DynamicCurrencyPairsDialog.access$202(DynamicCurrencyPairsDialog.this, paramAnonymousCurrencyPairsMapHelper);
        DynamicCurrencyPairsDialog.this.refreshStatusView(null);
        DynamicCurrencyPairsDialog.this.stopRefreshingAnim();
        DynamicCurrencyPairsDialog.this.onPairsUpdated(DynamicCurrencyPairsDialog.this.market, paramAnonymousCurrencyPairsMapHelper);
      }
    }, new Response.ErrorListener()
    {
      public void onErrorResponse(VolleyError paramAnonymousVolleyError)
      {
        DynamicCurrencyPairsDialog.access$102(DynamicCurrencyPairsDialog.this, null);
        paramAnonymousVolleyError.printStackTrace();
        DynamicCurrencyPairsDialog.this.refreshStatusView(CheckErrorsUtils.parseErrorMsg(DynamicCurrencyPairsDialog.this.getContext(), paramAnonymousVolleyError));
        DynamicCurrencyPairsDialog.this.stopRefreshingAnim();
      }
    });
    AsyncTaskCompat.execute(this.dynamicCurrencyPairsVolleyAsyncTask, new Void[0]);
  }
  
  public void onDismiss(DialogInterface paramDialogInterface)
  {
    this.requestQueue.cancelAll(this);
    if (this.dynamicCurrencyPairsVolleyAsyncTask != null) {
      this.dynamicCurrencyPairsVolleyAsyncTask.cancel(true);
    }
    this.currencyPairsMapHelper = null;
  }
  
  public abstract void onPairsUpdated(Market paramMarket, CurrencyPairsMapHelper paramCurrencyPairsMapHelper);
  
  public void startRefreshingAnim()
  {
    setCancelable(false);
    this.refreshImageWrapper.setEnabled(false);
    this.rotateAnim = ObjectAnimator.ofFloat(this.refreshImageView, "rotation", new float[] { 0.0F, 360.0F });
    this.rotateAnim.setDuration(750L);
    this.rotateAnim.setInterpolator(new AccelerateDecelerateInterpolator());
    this.rotateAnim.setRepeatCount(-1);
    this.rotateAnim.setRepeatMode(1);
    this.rotateAnim.start();
  }
  
  public void stopRefreshingAnim()
  {
    setCancelable(true);
    this.refreshImageWrapper.setEnabled(true);
    if (this.rotateAnim != null)
    {
      this.rotateAnim.cancel();
      this.rotateAnim = null;
      ViewHelper.setRotation(this.refreshImageView, 0.0F);
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */