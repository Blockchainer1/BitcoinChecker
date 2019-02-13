package com.tjeannin.apprate;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;

public class ExceptionHandler
  implements Thread.UncaughtExceptionHandler
{
  private Thread.UncaughtExceptionHandler defaultExceptionHandler;
  SharedPreferences preferences;
  
  public ExceptionHandler(Thread.UncaughtExceptionHandler paramUncaughtExceptionHandler, Context paramContext)
  {
    this.preferences = paramContext.getSharedPreferences("apprate_prefs", 0);
    this.defaultExceptionHandler = paramUncaughtExceptionHandler;
  }
  
  public void uncaughtException(Thread paramThread, Throwable paramThrowable)
  {
    this.preferences.edit().putBoolean("pref_app_has_crashed", true).commit();
    this.defaultExceptionHandler.uncaughtException(paramThread, paramThrowable);
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/tjeannin/apprate/ExceptionHandler.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */