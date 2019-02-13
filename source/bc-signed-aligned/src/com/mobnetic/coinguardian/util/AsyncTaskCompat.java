package com.mobnetic.coinguardian.util;

import android.annotation.TargetApi;
import android.os.AsyncTask;
import android.os.Build.VERSION;

public class AsyncTaskCompat
{
  @TargetApi(11)
  public static <T> void execute(AsyncTask<T, ?, ?> paramAsyncTask, T... paramVarArgs)
  {
    if (Build.VERSION.SDK_INT >= 11) {
      paramAsyncTask.executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR, paramVarArgs);
    }
    for (;;)
    {
      return;
      paramAsyncTask.execute(paramVarArgs);
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/util/AsyncTaskCompat.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */