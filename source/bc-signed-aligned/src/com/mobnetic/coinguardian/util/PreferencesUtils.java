package com.mobnetic.coinguardian.util;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.net.Uri;
import android.preference.PreferenceManager;
import com.google.gson.Gson;
import com.mobnetic.coinguardian.config.Settings;
import com.mobnetic.coinguardian.model.market.Bitstamp;
import com.robotoworks.mechanoid.Mechanoid;

public class PreferencesUtils
{
  private static final String CHECKERS_LIST_SORT_MODE_KEY = "checkers_list_sort_mode";
  private static final String DEFAULT_ITEM_ADDED_KEY = "default_item_added";
  private static final String DONATION_MADE_KEY = "donation_made";
  private static final String EXCHANGE_TUTORIAL_DONE_KEY = "exchange_tutorial_done";
  private static final String MARKET_DEFAULT_KEY = "market_default";
  private static final String MARKET_PICKER_LIST_SORT_MODE_KEY = "market_picker_list_sort_mode";
  private static final String NEWS_SHOWN_KEY = "news_shown";
  private static final String USER_COUNTRY_KEY = "user_country";
  
  public static long getCheckGlobalFrequency(Context paramContext)
  {
    return getSharedPreferences(paramContext).getLong(paramContext.getString(2131165380), 600000L);
  }
  
  public static boolean getCheckNotificationCustomLayout(Context paramContext)
  {
    return getSharedPreferences(paramContext).getBoolean(paramContext.getString(2131165384), true);
  }
  
  public static boolean getCheckNotificationExpandable(Context paramContext)
  {
    return getSharedPreferences(paramContext).getBoolean(paramContext.getString(2131165387), true);
  }
  
  public static boolean getCheckNotificationTicker(Context paramContext)
  {
    return getSharedPreferences(paramContext).getBoolean(paramContext.getString(2131165390), true);
  }
  
  public static int getCheckersListSortMode(Context paramContext)
  {
    return getSharedPreferences(paramContext).getInt("checkers_list_sort_mode", 0);
  }
  
  public static boolean getDonationMade(Context paramContext)
  {
    return getSharedPreferences(paramContext).getBoolean("donation_made", false);
  }
  
  private static double getDouble(SharedPreferences paramSharedPreferences, String paramString, double paramDouble)
  {
    return Double.longBitsToDouble(paramSharedPreferences.getLong(paramString, Double.doubleToLongBits(paramDouble)));
  }
  
  public static String getMarketDefault(Context paramContext)
  {
    return getSharedPreferences(paramContext).getString("market_default", Bitstamp.class.getSimpleName());
  }
  
  public static int getMarketPickerListSortMode(Context paramContext)
  {
    return getSharedPreferences(paramContext).getInt("market_picker_list_sort_mode", 0);
  }
  
  private static final <T> T getObject(Context paramContext, String paramString, Class<T> paramClass)
  {
    Object localObject = null;
    try
    {
      Gson localGson = new com/google/gson/Gson;
      localGson.<init>();
      paramContext = localGson.fromJson(getSharedPreferences(paramContext).getString(paramString, null), paramClass);
      return paramContext;
    }
    catch (Exception paramContext)
    {
      for (;;)
      {
        paramContext.printStackTrace();
        paramContext = (Context)localObject;
      }
    }
  }
  
  private static SharedPreferences getSharedPreferences(Context paramContext)
  {
    if (paramContext != null) {}
    for (paramContext = paramContext.getApplicationContext();; paramContext = Mechanoid.getApplicationContext()) {
      return PreferenceManager.getDefaultSharedPreferences(paramContext);
    }
  }
  
  public static String getSoundAlarmNotificationDown(Context paramContext)
  {
    Uri localUri = SoundFilesManager.getUriForRingtone(paramContext, "bitcoin_checker_down_alert");
    Object localObject = getSharedPreferences(paramContext);
    String str = paramContext.getString(2131165400);
    if (localUri != null) {}
    for (paramContext = localUri.toString();; paramContext = null)
    {
      localObject = ((SharedPreferences)localObject).getString(str, paramContext);
      paramContext = (Context)localObject;
      if (localObject == null) {
        paramContext = "android.resource://com.mobnetic.coinguardian/raw/bitcoin_checker_down_alert";
      }
      return paramContext;
    }
  }
  
  public static String getSoundAlarmNotificationUp(Context paramContext)
  {
    Uri localUri = SoundFilesManager.getUriForRingtone(paramContext, "bitcoin_checker_up_cheers");
    Object localObject = getSharedPreferences(paramContext);
    String str = paramContext.getString(2131165402);
    if (localUri != null) {}
    for (paramContext = localUri.toString();; paramContext = null)
    {
      localObject = ((SharedPreferences)localObject).getString(str, paramContext);
      paramContext = (Context)localObject;
      if (localObject == null) {
        paramContext = "android.resource://com.mobnetic.coinguardian/raw/bitcoin_checker_up_cheers";
      }
      return paramContext;
    }
  }
  
  public static int getSoundsAdvancedAlarmStream(Context paramContext)
  {
    return getSharedPreferences(paramContext).getInt(paramContext.getString(2131165395), 5);
  }
  
  public static int getTTSAdvancedStream(Context paramContext)
  {
    return getSharedPreferences(paramContext).getInt(paramContext.getString(2131165408), 5);
  }
  
  public static boolean getTTSDisplayOffOnly(Context paramContext)
  {
    return getSharedPreferences(paramContext).getBoolean(paramContext.getString(2131165433), false);
  }
  
  public static boolean getTTSFormatIntegerOnly(Context paramContext)
  {
    return getSharedPreferences(paramContext).getBoolean(paramContext.getString(2131165420), true);
  }
  
  public static boolean getTTSFormatSpeakBaseCurrency(Context paramContext)
  {
    return getSharedPreferences(paramContext).getBoolean(paramContext.getString(2131165423), true);
  }
  
  public static boolean getTTSFormatSpeakCounterCurrency(Context paramContext)
  {
    return getSharedPreferences(paramContext).getBoolean(paramContext.getString(2131165426), false);
  }
  
  public static boolean getTTSFormatSpeakExchange(Context paramContext)
  {
    return getSharedPreferences(paramContext).getBoolean(paramContext.getString(2131165429), false);
  }
  
  public static boolean getTTSHeadphonesOnly(Context paramContext)
  {
    return getSharedPreferences(paramContext).getBoolean(paramContext.getString(2131165431), false);
  }
  
  public static String getUserCountry(Context paramContext)
  {
    Settings.userCountry = getSharedPreferences(paramContext).getString("user_country", null);
    return Settings.userCountry;
  }
  
  public static boolean isDefaultItemAdded(Context paramContext)
  {
    return getSharedPreferences(paramContext).getBoolean("default_item_added", false);
  }
  
  public static boolean isExchangeTutorialDone(Context paramContext)
  {
    return getSharedPreferences(paramContext).getBoolean("exchange_tutorial_done", false);
  }
  
  private static SharedPreferences.Editor putDouble(SharedPreferences.Editor paramEditor, String paramString, double paramDouble)
  {
    return paramEditor.putLong(paramString, Double.doubleToRawLongBits(paramDouble));
  }
  
  private static final void putObject(Context paramContext, String paramString, Object paramObject)
  {
    Object localObject1 = null;
    Object localObject2 = localObject1;
    if (paramObject != null) {}
    try
    {
      localObject2 = new com/google/gson/Gson;
      ((Gson)localObject2).<init>();
      localObject2 = ((Gson)localObject2).toJson(paramObject);
      getSharedPreferences(paramContext).edit().putString(paramString, (String)localObject2).commit();
      return;
    }
    catch (Exception paramObject)
    {
      for (;;)
      {
        ((Exception)paramObject).printStackTrace();
        localObject2 = localObject1;
      }
    }
  }
  
  public static void setCheckGlobalFrequency(Context paramContext, long paramLong)
  {
    getSharedPreferences(paramContext).edit().putLong(paramContext.getString(2131165380), paramLong).commit();
  }
  
  public static void setCheckNotificationCustomLayout(Context paramContext, boolean paramBoolean)
  {
    getSharedPreferences(paramContext).edit().putBoolean(paramContext.getString(2131165384), paramBoolean).commit();
  }
  
  public static void setCheckNotificationExpandable(Context paramContext, boolean paramBoolean)
  {
    getSharedPreferences(paramContext).edit().putBoolean(paramContext.getString(2131165387), paramBoolean).commit();
  }
  
  public static void setCheckersListSortMode(Context paramContext, int paramInt)
  {
    getSharedPreferences(paramContext).edit().putInt("checkers_list_sort_mode", paramInt).commit();
  }
  
  public static void setDefaultItemAdded(Context paramContext)
  {
    getSharedPreferences(paramContext).edit().putBoolean("default_item_added", true).commit();
  }
  
  public static void setDonationMade(Context paramContext)
  {
    getSharedPreferences(paramContext).edit().putBoolean("donation_made", true).commit();
  }
  
  public static void setExchangeTutorialDone(Context paramContext)
  {
    getSharedPreferences(paramContext).edit().putBoolean("exchange_tutorial_done", true).commit();
  }
  
  public static void setMarketDefault(Context paramContext, String paramString)
  {
    getSharedPreferences(paramContext).edit().putString("market_default", paramString).commit();
  }
  
  public static void setMarketPickerListSortMode(Context paramContext, int paramInt)
  {
    getSharedPreferences(paramContext).edit().putInt("market_picker_list_sort_mode", paramInt).commit();
  }
  
  public static void setNewsShown(Context paramContext, int paramInt)
  {
    getSharedPreferences(paramContext).edit().putInt("news_shown", paramInt).commit();
  }
  
  public static void setUserCountry(Context paramContext, String paramString)
  {
    Settings.userCountry = paramString;
    getSharedPreferences(paramContext).edit().putString("user_country", paramString).commit();
  }
  
  public static boolean wasNewsShown(Context paramContext, int paramInt)
  {
    if (getSharedPreferences(paramContext).getInt("news_shown", -1) >= paramInt) {}
    for (boolean bool = true;; bool = false) {
      return bool;
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/util/PreferencesUtils.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */