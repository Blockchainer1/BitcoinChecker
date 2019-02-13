package com.android.volley;

import android.os.Process;
import java.util.concurrent.BlockingQueue;

public class CacheDispatcher
  extends Thread
{
  private static final boolean DEBUG = VolleyLog.DEBUG;
  private final Cache mCache;
  private final BlockingQueue<Request<?>> mCacheQueue;
  private final ResponseDelivery mDelivery;
  private final BlockingQueue<Request<?>> mNetworkQueue;
  private volatile boolean mQuit = false;
  
  public CacheDispatcher(BlockingQueue<Request<?>> paramBlockingQueue1, BlockingQueue<Request<?>> paramBlockingQueue2, Cache paramCache, ResponseDelivery paramResponseDelivery)
  {
    this.mCacheQueue = paramBlockingQueue1;
    this.mNetworkQueue = paramBlockingQueue2;
    this.mCache = paramCache;
    this.mDelivery = paramResponseDelivery;
  }
  
  public void quit()
  {
    this.mQuit = true;
    interrupt();
  }
  
  public void run()
  {
    if (DEBUG) {
      VolleyLog.v("start new dispatcher", new Object[0]);
    }
    Process.setThreadPriority(10);
    this.mCache.initialize();
    for (;;)
    {
      try
      {
        Request localRequest = (Request)this.mCacheQueue.take();
        localRequest.addMarker("cache-queue-take");
        if (!localRequest.isCanceled()) {
          break label73;
        }
        localRequest.finish("cache-discard-canceled");
        continue;
        if (!this.mQuit) {
          continue;
        }
      }
      catch (InterruptedException localInterruptedException) {}
      return;
      label73:
      Object localObject1 = this.mCache.get(localInterruptedException.getCacheKey());
      if (localObject1 == null)
      {
        localInterruptedException.addMarker("cache-miss");
        this.mNetworkQueue.put(localInterruptedException);
      }
      else if (((Cache.Entry)localObject1).isExpired())
      {
        localInterruptedException.addMarker("cache-hit-expired");
        localInterruptedException.setCacheEntry((Cache.Entry)localObject1);
        this.mNetworkQueue.put(localInterruptedException);
      }
      else
      {
        localInterruptedException.addMarker("cache-hit");
        Object localObject2 = new com/android/volley/NetworkResponse;
        ((NetworkResponse)localObject2).<init>(((Cache.Entry)localObject1).data, ((Cache.Entry)localObject1).responseHeaders);
        localObject2 = localInterruptedException.parseNetworkResponse((NetworkResponse)localObject2);
        localInterruptedException.addMarker("cache-hit-parsed");
        if (!((Cache.Entry)localObject1).refreshNeeded())
        {
          this.mDelivery.postResponse(localInterruptedException, (Response)localObject2);
        }
        else
        {
          localInterruptedException.addMarker("cache-hit-refresh-needed");
          localInterruptedException.setCacheEntry((Cache.Entry)localObject1);
          ((Response)localObject2).intermediate = true;
          ResponseDelivery localResponseDelivery = this.mDelivery;
          localObject1 = new com/android/volley/CacheDispatcher$1;
          ((1)localObject1).<init>(this, localInterruptedException);
          localResponseDelivery.postResponse(localInterruptedException, (Response)localObject2, (Runnable)localObject1);
        }
      }
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/android/volley/CacheDispatcher.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */