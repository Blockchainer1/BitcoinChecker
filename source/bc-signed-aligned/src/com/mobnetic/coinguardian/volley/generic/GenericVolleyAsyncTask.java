package com.mobnetic.coinguardian.volley.generic;

import android.os.AsyncTask;
import com.android.volley.RequestQueue;
import com.android.volley.Response.ErrorListener;
import com.android.volley.Response.Listener;
import com.android.volley.VolleyError;
import com.mobnetic.coinguardian.volley.UnknownVolleyError;
import java.util.concurrent.ExecutionException;

public abstract class GenericVolleyAsyncTask<T>
  extends AsyncTask<Void, Void, Object>
{
  private final Response.ErrorListener errorListener;
  private final Response.Listener<T> listener;
  protected final RequestQueue requestQueue;
  
  public GenericVolleyAsyncTask(RequestQueue paramRequestQueue, Response.Listener<T> paramListener, Response.ErrorListener paramErrorListener)
  {
    this.requestQueue = paramRequestQueue;
    this.listener = paramListener;
    this.errorListener = paramErrorListener;
  }
  
  protected final Object doInBackground(Void... paramVarArgs)
  {
    try
    {
      paramVarArgs = doNetworkInBackground();
      return paramVarArgs;
    }
    catch (ExecutionException localExecutionException)
    {
      for (;;)
      {
        paramVarArgs = localExecutionException;
        if (localExecutionException.getCause() != null) {
          paramVarArgs = localExecutionException.getCause();
        }
      }
    }
    catch (Throwable paramVarArgs)
    {
      for (;;) {}
    }
  }
  
  protected abstract Object doNetworkInBackground()
    throws Exception;
  
  protected void onPostExecute(Object paramObject)
  {
    super.onPostExecute(paramObject);
    if (isCancelled()) {}
    for (;;)
    {
      return;
      if (paramObject != null) {
        if ((paramObject instanceof Throwable))
        {
          if ((paramObject instanceof VolleyError)) {
            this.errorListener.onErrorResponse((VolleyError)paramObject);
          } else {
            this.errorListener.onErrorResponse(new UnknownVolleyError((Throwable)paramObject));
          }
        }
        else {
          try
          {
            this.listener.onResponse(paramObject);
          }
          catch (Throwable paramObject)
          {
            ((Throwable)paramObject).printStackTrace();
          }
        }
      }
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/volley/generic/GenericVolleyAsyncTask.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */