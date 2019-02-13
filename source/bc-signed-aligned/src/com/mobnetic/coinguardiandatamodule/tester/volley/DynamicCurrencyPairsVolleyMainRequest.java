package com.mobnetic.coinguardiandatamodule.tester.volley;

import android.content.Context;
import android.text.TextUtils;
import com.android.volley.RequestQueue;
import com.android.volley.Response.ErrorListener;
import com.android.volley.Response.Listener;
import com.android.volley.toolbox.RequestFuture;
import com.mobnetic.coinguardian.model.CurrencyPairsListWithDate;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.util.CurrencyPairsMapHelper;
import com.mobnetic.coinguardiandatamodule.tester.util.MarketCurrencyPairsStore;
import com.mobnetic.coinguardiandatamodule.tester.volley.generic.GzipVolleyRequest;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

public class DynamicCurrencyPairsVolleyMainRequest
  extends GzipVolleyRequest<CurrencyPairsMapHelper>
{
  private final Context context;
  private final Market market;
  
  public DynamicCurrencyPairsVolleyMainRequest(Context paramContext, Market paramMarket, Response.Listener<CurrencyPairsMapHelper> paramListener, Response.ErrorListener paramErrorListener)
  {
    super(paramMarket.getCurrencyPairsUrl(0), paramListener, paramErrorListener);
    this.context = paramContext;
    this.market = paramMarket;
  }
  
  protected CurrencyPairsMapHelper parseNetworkResponse(Map<String, String> paramMap, String paramString)
    throws Exception
  {
    paramMap = new ArrayList();
    this.market.parseCurrencyPairsMain(0, paramString, paramMap);
    int i = this.market.getCurrencyPairsNumOfRequests();
    if (i > 1)
    {
      paramString = new ArrayList();
      int j = 1;
      for (;;)
      {
        if (j < i) {
          try
          {
            Object localObject = RequestFuture.newFuture();
            String str = this.market.getCurrencyPairsUrl(j);
            if (!TextUtils.isEmpty(str))
            {
              DynamicCurrencyPairsVolleyNextRequest localDynamicCurrencyPairsVolleyNextRequest = new com/mobnetic/coinguardiandatamodule/tester/volley/DynamicCurrencyPairsVolleyNextRequest;
              localDynamicCurrencyPairsVolleyNextRequest.<init>(str, (RequestFuture)localObject);
              getRequestQueue().add(localDynamicCurrencyPairsVolleyNextRequest);
              localObject = (String)((RequestFuture)localObject).get();
              paramString.clear();
              this.market.parseCurrencyPairsMain(j, (String)localObject, paramString);
              paramMap.addAll(paramString);
            }
            j++;
          }
          catch (Exception localException)
          {
            for (;;)
            {
              localException.printStackTrace();
            }
          }
        }
      }
    }
    Collections.sort(paramMap);
    paramString = new CurrencyPairsListWithDate();
    paramString.date = System.currentTimeMillis();
    paramString.pairs = paramMap;
    if ((paramMap != null) && (paramMap.size() > 0)) {
      MarketCurrencyPairsStore.savePairsForMarket(this.context, this.market.key, paramString);
    }
    return new CurrencyPairsMapHelper(paramString);
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardiandatamodule/tester/volley/DynamicCurrencyPairsVolleyMainRequest.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */