package com.android.volley;

public class DefaultRetryPolicy
  implements RetryPolicy
{
  public static final float DEFAULT_BACKOFF_MULT = 1.0F;
  public static final int DEFAULT_MAX_RETRIES = 1;
  public static final int DEFAULT_TIMEOUT_MS = 2500;
  private final float mBackoffMultiplier;
  private int mCurrentRetryCount;
  private int mCurrentTimeoutMs;
  private final int mMaxNumRetries;
  
  public DefaultRetryPolicy()
  {
    this(2500, 1, 1.0F);
  }
  
  public DefaultRetryPolicy(int paramInt1, int paramInt2, float paramFloat)
  {
    this.mCurrentTimeoutMs = paramInt1;
    this.mMaxNumRetries = paramInt2;
    this.mBackoffMultiplier = paramFloat;
  }
  
  public int getCurrentRetryCount()
  {
    return this.mCurrentRetryCount;
  }
  
  public int getCurrentTimeout()
  {
    return this.mCurrentTimeoutMs;
  }
  
  protected boolean hasAttemptRemaining()
  {
    if (this.mCurrentRetryCount <= this.mMaxNumRetries) {}
    for (boolean bool = true;; bool = false) {
      return bool;
    }
  }
  
  public void retry(VolleyError paramVolleyError)
    throws VolleyError
  {
    this.mCurrentRetryCount += 1;
    this.mCurrentTimeoutMs = ((int)(this.mCurrentTimeoutMs + this.mCurrentTimeoutMs * this.mBackoffMultiplier));
    if (!hasAttemptRemaining()) {
      throw paramVolleyError;
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/android/volley/DefaultRetryPolicy.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */