package com.mobnetic.coinguardiandatamodule.tester.volley;

import android.text.TextUtils;
import com.android.volley.DefaultRetryPolicy;
import com.android.volley.RequestQueue;
import com.android.volley.Response.ErrorListener;
import com.android.volley.Response.Listener;
import com.android.volley.toolbox.RequestFuture;
import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import com.mobnetic.coinguardiandatamodule.tester.volley.generic.GenericCheckerVolleyRequest;
import java.util.Map;

public class CheckerVolleyMainRequest
  extends GenericCheckerVolleyRequest<TickerWrapper>
{
  private final Market market;
  
  public CheckerVolleyMainRequest(Market paramMarket, CheckerInfo paramCheckerInfo, Response.Listener<TickerWrapper> paramListener, Response.ErrorListener paramErrorListener)
  {
    super(paramMarket.getUrl(0, paramCheckerInfo), paramCheckerInfo, paramListener, paramErrorListener);
    setRetryPolicy(new DefaultRetryPolicy(5000, 3, 1.5F));
    this.market = paramMarket;
  }
  
  protected TickerWrapper parseNetworkResponse(Map<String, String> paramMap, String paramString)
    throws Exception
  {
    paramMap = new TickerWrapper();
    try
    {
      Market localMarket = this.market;
      localObject = new com/mobnetic/coinguardian/model/Ticker;
      ((Ticker)localObject).<init>();
      paramMap.ticker = localMarket.parseTickerMain(0, paramString, (Ticker)localObject, this.checkerInfo);
      if (paramMap.ticker != null) {
        if (paramMap.ticker.last > -1.0D) {
          break label103;
        }
      }
    }
    catch (Exception localException)
    {
      Object localObject;
      try
      {
        paramMap = this.market.parseErrorMain(0, paramString, this.checkerInfo);
        throw new CheckerErrorParsedError(paramMap);
        localException = localException;
        localException.printStackTrace();
        paramMap.ticker = null;
      }
      catch (Exception paramMap)
      {
        for (;;)
        {
          paramMap = null;
        }
      }
      label103:
      int i = this.market.getNumOfRequests(this.checkerInfo);
      if (i > 1)
      {
        int j = 1;
        for (;;)
        {
          if (j < i) {
            try
            {
              localObject = RequestFuture.newFuture();
              String str = this.market.getUrl(j, this.checkerInfo);
              if (!TextUtils.isEmpty(str))
              {
                paramString = new com/mobnetic/coinguardiandatamodule/tester/volley/CheckerVolleyNextRequest;
                paramString.<init>(str, this.checkerInfo, (RequestFuture)localObject);
                getRequestQueue().add(paramString);
                paramString = (String)((RequestFuture)localObject).get();
                this.market.parseTickerMain(j, paramString, paramMap.ticker, this.checkerInfo);
              }
              j++;
            }
            catch (Exception paramString)
            {
              for (;;)
              {
                paramString.printStackTrace();
              }
            }
          }
        }
      }
    }
    return paramMap;
  }
  
  public class TickerWrapper
  {
    public Ticker ticker;
    
    public TickerWrapper() {}
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardiandatamodule/tester/volley/CheckerVolleyMainRequest.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */