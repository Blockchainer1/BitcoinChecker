package com.mobnetic.coinguardian.volley;

import android.text.TextUtils;
import com.android.volley.DefaultRetryPolicy;
import com.android.volley.ParseError;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response.ErrorListener;
import com.android.volley.Response.Listener;
import com.android.volley.toolbox.RequestFuture;
import com.mobnetic.coinguardian.db.content.CheckerRecord;
import com.mobnetic.coinguardian.model.CheckerInfo;
import com.mobnetic.coinguardian.model.Market;
import com.mobnetic.coinguardian.model.Ticker;
import com.mobnetic.coinguardian.util.CheckerRecordHelper;
import com.mobnetic.coinguardian.util.MarketsConfigUtils;
import com.mobnetic.coinguardian.volley.generic.GenericVolleyAsyncTask;
import com.mobnetic.coinguardian.volley.generic.GzipVolleyStringRequest;
import java.util.ArrayList;
import java.util.Iterator;

public class CheckerVolleyAsyncTask
  extends GenericVolleyAsyncTask<Ticker>
  implements CheckerRecordRequestIfc
{
  private static final ArrayList<CheckerVolleyAsyncTask> CHECKERS_TASKS = new ArrayList();
  protected final CheckerInfo checkerInfo;
  private final CheckerRecord checkerRecord;
  
  public CheckerVolleyAsyncTask(RequestQueue paramRequestQueue, CheckerRecord paramCheckerRecord, Response.Listener<Ticker> paramListener, Response.ErrorListener paramErrorListener)
  {
    super(paramRequestQueue, paramListener, paramErrorListener);
    this.checkerRecord = paramCheckerRecord;
    this.checkerInfo = CheckerRecordHelper.createCheckerInfo(paramCheckerRecord);
  }
  
  public static void cancelCheckingForCheckerRecord(long paramLong)
  {
    if ((CHECKERS_TASKS != null) && (paramLong > 0L))
    {
      Iterator localIterator = CHECKERS_TASKS.iterator();
      while (localIterator.hasNext())
      {
        CheckerVolleyAsyncTask localCheckerVolleyAsyncTask = (CheckerVolleyAsyncTask)localIterator.next();
        if ((localCheckerVolleyAsyncTask != null) && (localCheckerVolleyAsyncTask.getCheckerRecordId() == paramLong)) {
          localCheckerVolleyAsyncTask.cancel(true);
        }
      }
    }
  }
  
  protected Object doNetworkInBackground()
    throws Exception
  {
    Market localMarket = MarketsConfigUtils.getMarketByKey(this.checkerRecord.getMarketKey());
    Object localObject1 = null;
    Object localObject2 = null;
    Object localObject3 = RequestFuture.newFuture();
    String str = localMarket.getUrl(0, this.checkerInfo);
    Object localObject4 = localObject1;
    if (!isCancelled())
    {
      localObject4 = localObject1;
      if (!TextUtils.isEmpty(str))
      {
        localObject4 = new GzipVolleyStringRequest(str, (Response.Listener)localObject3, (Response.ErrorListener)localObject3);
        ((GzipVolleyStringRequest)localObject4).setRetryPolicy(new DefaultRetryPolicy(8000, 1, 1.0F));
        this.requestQueue.add((Request)localObject4);
        localObject4 = (String)((RequestFuture)localObject3).get();
      }
    }
    try
    {
      localObject1 = new com/mobnetic/coinguardian/model/Ticker;
      ((Ticker)localObject1).<init>();
      localObject1 = localMarket.parseTickerMain(0, (String)localObject4, (Ticker)localObject1, this.checkerInfo);
      localObject2 = localObject1;
    }
    catch (Throwable localThrowable1)
    {
      int i;
      int j;
      for (;;) {}
    }
    if ((localObject2 == null) || (((Ticker)localObject2).last <= -1.0D)) {}
    do
    {
      do
      {
        try
        {
          localObject2 = localMarket.parseErrorMain(0, (String)localObject4, this.checkerInfo);
          localObject4 = new CheckerErrorParsedError((String)localObject2);
        }
        catch (Exception localException)
        {
          for (;;)
          {
            localObject4 = new ParseError(localException);
          }
        }
        return localObject4;
        i = localMarket.getNumOfRequests(this.checkerInfo);
        localObject4 = localException;
      } while (isCancelled());
      localObject4 = localException;
    } while (i <= 1);
    j = 1;
    for (;;)
    {
      localObject4 = localException;
      if (j >= i) {
        break;
      }
      try
      {
        localObject1 = localMarket.getUrl(j, this.checkerInfo);
        if ((!isCancelled()) && (!TextUtils.isEmpty((CharSequence)localObject1)))
        {
          localObject4 = RequestFuture.newFuture();
          localObject3 = new com/mobnetic/coinguardian/volley/generic/GzipVolleyStringRequest;
          ((GzipVolleyStringRequest)localObject3).<init>((String)localObject1, (Response.Listener)localObject4, (Response.ErrorListener)localObject4);
          this.requestQueue.add((Request)localObject3);
          localMarket.parseTickerMain(j, (String)((RequestFuture)localObject4).get(), localException, this.checkerInfo);
        }
        j++;
      }
      catch (Throwable localThrowable2)
      {
        for (;;)
        {
          localThrowable2.printStackTrace();
        }
      }
    }
  }
  
  public long getCheckerRecordId()
  {
    if (this.checkerRecord != null) {}
    for (long l = this.checkerRecord.getId();; l = -1L) {
      return l;
    }
  }
  
  protected void onCancelled()
  {
    if (CHECKERS_TASKS != null) {
      CHECKERS_TASKS.remove(this);
    }
    super.onCancelled();
  }
  
  protected void onPostExecute(Object paramObject)
  {
    if (CHECKERS_TASKS != null) {
      CHECKERS_TASKS.remove(this);
    }
    super.onPostExecute(paramObject);
  }
  
  protected void onPreExecute()
  {
    super.onPreExecute();
    if (CHECKERS_TASKS != null) {
      CHECKERS_TASKS.add(this);
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/volley/CheckerVolleyAsyncTask.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */