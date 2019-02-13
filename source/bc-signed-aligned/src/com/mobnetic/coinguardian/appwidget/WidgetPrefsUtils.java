package com.mobnetic.coinguardian.appwidget;

import android.content.Context;
import android.content.SharedPreferences;

public class WidgetPrefsUtils
{
  private static final String PREFS_NAME = "widget_prefs_";
  
  public static int getAlphaPercent(Context paramContext, int paramInt)
  {
    return getSharedPreferencesForWidget(paramContext, paramInt).getInt(paramContext.getString(2131165462), 100);
  }
  
  public static boolean getCompactMode(Context paramContext, int paramInt)
  {
    return getSharedPreferencesForWidget(paramContext, paramInt).getBoolean(paramContext.getString(2131165464), false);
  }
  
  public static boolean getDarkTheme(Context paramContext, int paramInt)
  {
    return getSharedPreferencesForWidget(paramContext, paramInt).getBoolean(paramContext.getString(2131165467), false);
  }
  
  private static SharedPreferences getSharedPreferencesForWidget(Context paramContext, int paramInt)
  {
    return paramContext.getApplicationContext().getSharedPreferences(getSharedPreferencesName(paramInt), 0);
  }
  
  public static String getSharedPreferencesName(int paramInt)
  {
    return "widget_prefs_" + paramInt;
  }
  
  public static boolean getShowActionBar(Context paramContext, int paramInt)
  {
    return getSharedPreferencesForWidget(paramContext, paramInt).getBoolean(paramContext.getString(2131165471), true);
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/appwidget/WidgetPrefsUtils.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */