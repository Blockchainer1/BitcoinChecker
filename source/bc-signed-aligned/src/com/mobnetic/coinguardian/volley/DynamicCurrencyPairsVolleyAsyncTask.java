package com.mobnetic.coinguardian.volley;

import android.content.Context;
import android.text.TextUtils;
import com.android.volley.DefaultRetryPolicy;
import com.android.volley.ParseError;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response.ErrorListener;
import com.android.volley.Response.Listener;
import com.android.volley.RetryPolicy;
import com.android.volley.toolbox.RequestFuture;
import com.mobnetic.coinguardian.model.CurrencyPairsListWithDate;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.util.CurrencyPairsMapHelper;
import com.mobnetic.coinguardian.util.MarketCurrencyPairsStore;
import com.mobnetic.coinguardian.volley.generic.GenericVolleyAsyncTask;
import com.mobnetic.coinguardian.volley.generic.GzipVolleyStringRequest;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class DynamicCurrencyPairsVolleyAsyncTask
  extends GenericVolleyAsyncTask<CurrencyPairsMapHelper>
{
  private final Context context;
  private final Market market;
  
  public DynamicCurrencyPairsVolleyAsyncTask(RequestQueue paramRequestQueue, Context paramContext, Market paramMarket, Response.Listener<CurrencyPairsMapHelper> paramListener, Response.ErrorListener paramErrorListener)
  {
    super(paramRequestQueue, paramListener, paramErrorListener);
    this.context = paramContext;
    this.market = paramMarket;
  }
  
  protected Object doNetworkInBackground()
    throws Exception
  {
    ArrayList localArrayList1 = new ArrayList();
    int i = this.market.getCurrencyPairsNumOfRequests();
    int j;
    if (!isCancelled())
    {
      ArrayList localArrayList2 = new ArrayList();
      j = 0;
      for (;;)
      {
        if (j < i) {
          for (;;)
          {
            try
            {
              Object localObject1 = this.market.getCurrencyPairsUrl(j);
              if ((!isCancelled()) && (!TextUtils.isEmpty((CharSequence)localObject1)))
              {
                RequestFuture localRequestFuture = RequestFuture.newFuture();
                localObject2 = new com/mobnetic/coinguardian/volley/generic/GzipVolleyStringRequest;
                ((GzipVolleyStringRequest)localObject2).<init>((String)localObject1, localRequestFuture, localRequestFuture);
                if (j == 0)
                {
                  localObject1 = new com/android/volley/DefaultRetryPolicy;
                  ((DefaultRetryPolicy)localObject1).<init>(8000, 1, 1.0F);
                  ((GzipVolleyStringRequest)localObject2).setRetryPolicy((RetryPolicy)localObject1);
                }
                this.requestQueue.add((Request)localObject2);
                localObject2 = (String)localRequestFuture.get();
                localArrayList2.clear();
              }
            }
            catch (Exception localException2)
            {
              Object localObject2;
              ParseError localParseError;
              if (j != 0) {
                continue;
              }
              throw localException2;
            }
            try
            {
              this.market.parseCurrencyPairsMain(j, (String)localObject2, localArrayList2);
              localArrayList1.addAll(localArrayList2);
              j++;
            }
            catch (Exception localException1)
            {
              if (j == 0) {
                localParseError = new ParseError(localException1);
              }
            }
          }
        }
      }
    }
    for (;;)
    {
      return localParseError;
      Collections.sort(localArrayList1);
      Object localObject3 = new CurrencyPairsListWithDate();
      ((CurrencyPairsListWithDate)localObject3).date = System.currentTimeMillis();
      ((CurrencyPairsListWithDate)localObject3).pairs = localArrayList1;
      if ((localArrayList1 != null) && (localArrayList1.size() > 0)) {
        MarketCurrencyPairsStore.savePairsForMarket(this.context, this.market.key, (CurrencyPairsListWithDate)localObject3);
      }
      localObject3 = new CurrencyPairsMapHelper((CurrencyPairsListWithDate)localObject3);
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/volley/DynamicCurrencyPairsVolleyAsyncTask.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */