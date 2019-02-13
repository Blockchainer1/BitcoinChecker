package com.mobnetic.coinguardian.db.content;

import android.content.ContentResolver;
import android.content.ContentValues;
import android.net.Uri;
import android.net.Uri.Builder;
import android.provider.BaseColumns;
import com.robotoworks.mechanoid.Mechanoid;
import com.robotoworks.mechanoid.db.AbstractValuesBuilder;
import java.lang.reflect.Field;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

public class MaindbContract
{
  private static final Uri BASE_CONTENT_URI;
  public static final String CONTENT_AUTHORITY = ;
  static Map<Uri, Set<Uri>> REFERENCING_VIEWS;
  
  static
  {
    BASE_CONTENT_URI = Uri.parse("content://" + CONTENT_AUTHORITY);
    HashMap localHashMap = new HashMap();
    localHashMap.put(Alarm.CONTENT_URI, Alarm.VIEW_URIS);
    localHashMap.put(Checker.CONTENT_URI, Checker.VIEW_URIS);
    REFERENCING_VIEWS = Collections.unmodifiableMap(localHashMap);
  }
  
  public static void deleteAll()
  {
    Alarm.delete();
    Checker.delete();
  }
  
  private static String initAuthority()
  {
    Object localObject = "com.mobnetic.coinguardian.db.content.maindb";
    try
    {
      String str = MaindbContract.class.getClassLoader().loadClass("com.mobnetic.coinguardian.db.content.MaindbContentProviderAuthority").getDeclaredField("CONTENT_AUTHORITY").get(null).toString();
      localObject = str;
    }
    catch (IllegalAccessException localIllegalAccessException)
    {
      for (;;) {}
    }
    catch (IllegalArgumentException localIllegalArgumentException)
    {
      for (;;) {}
    }
    catch (NoSuchFieldException localNoSuchFieldException)
    {
      for (;;) {}
    }
    catch (ClassNotFoundException localClassNotFoundException)
    {
      for (;;) {}
    }
    return (String)localObject;
  }
  
  public static class Alarm
    implements MaindbContract.AlarmColumns, BaseColumns
  {
    public static final String CONTENT_TYPE = "vnd.android.cursor.dir/vnd.maindb.alarm";
    public static final Uri CONTENT_URI = MaindbContract.BASE_CONTENT_URI.buildUpon().appendPath("alarm").build();
    public static final String ITEM_CONTENT_TYPE = "vnd.android.cursor.item/vnd.maindb.alarm";
    static final Set<Uri> VIEW_URIS = Collections.unmodifiableSet(new HashSet());
    
    public static Uri buildUriWithId(long paramLong)
    {
      return CONTENT_URI.buildUpon().appendPath(String.valueOf(paramLong)).build();
    }
    
    public static int delete()
    {
      return Mechanoid.getContentResolver().delete(CONTENT_URI, null, null);
    }
    
    public static int delete(String paramString, String[] paramArrayOfString)
    {
      return Mechanoid.getContentResolver().delete(CONTENT_URI, paramString, paramArrayOfString);
    }
    
    public static Builder newBuilder()
    {
      return new Builder(null);
    }
    
    public static class Builder
      extends AbstractValuesBuilder
    {
      private Builder()
      {
        super(MaindbContract.Alarm.CONTENT_URI);
      }
      
      public Builder setCheckerId(long paramLong)
      {
        this.mValues.put("checkerId", Long.valueOf(paramLong));
        return this;
      }
      
      public Builder setEnabled(boolean paramBoolean)
      {
        this.mValues.put("enabled", Boolean.valueOf(paramBoolean));
        return this;
      }
      
      public Builder setLastCheckPointTicker(String paramString)
      {
        this.mValues.put("lastCheckPointTicker", paramString);
        return this;
      }
      
      public Builder setLed(boolean paramBoolean)
      {
        this.mValues.put("led", Boolean.valueOf(paramBoolean));
        return this;
      }
      
      public Builder setSound(boolean paramBoolean)
      {
        this.mValues.put("sound", Boolean.valueOf(paramBoolean));
        return this;
      }
      
      public Builder setSoundUri(String paramString)
      {
        this.mValues.put("soundUri", paramString);
        return this;
      }
      
      public Builder setTtsEnabled(boolean paramBoolean)
      {
        this.mValues.put("ttsEnabled", Boolean.valueOf(paramBoolean));
        return this;
      }
      
      public Builder setType(long paramLong)
      {
        this.mValues.put("type", Long.valueOf(paramLong));
        return this;
      }
      
      public Builder setValue(double paramDouble)
      {
        this.mValues.put("value", Double.valueOf(paramDouble));
        return this;
      }
      
      public Builder setVibrate(boolean paramBoolean)
      {
        this.mValues.put("vibrate", Boolean.valueOf(paramBoolean));
        return this;
      }
    }
  }
  
  static abstract interface AlarmColumns
  {
    public static final String CHECKER_ID = "checkerId";
    public static final String ENABLED = "enabled";
    public static final String LAST_CHECK_POINT_TICKER = "lastCheckPointTicker";
    public static final String LED = "led";
    public static final String SOUND = "sound";
    public static final String SOUND_URI = "soundUri";
    public static final String TTS_ENABLED = "ttsEnabled";
    public static final String TYPE = "type";
    public static final String VALUE = "value";
    public static final String VIBRATE = "vibrate";
  }
  
  public static class Checker
    implements MaindbContract.CheckerColumns, BaseColumns
  {
    public static final String CONTENT_TYPE = "vnd.android.cursor.dir/vnd.maindb.checker";
    public static final Uri CONTENT_URI = MaindbContract.BASE_CONTENT_URI.buildUpon().appendPath("checker").build();
    public static final String ITEM_CONTENT_TYPE = "vnd.android.cursor.item/vnd.maindb.checker";
    static final Set<Uri> VIEW_URIS = Collections.unmodifiableSet(new HashSet());
    
    public static Uri buildUriWithId(long paramLong)
    {
      return CONTENT_URI.buildUpon().appendPath(String.valueOf(paramLong)).build();
    }
    
    public static int delete()
    {
      return Mechanoid.getContentResolver().delete(CONTENT_URI, null, null);
    }
    
    public static int delete(String paramString, String[] paramArrayOfString)
    {
      return Mechanoid.getContentResolver().delete(CONTENT_URI, paramString, paramArrayOfString);
    }
    
    public static Builder newBuilder()
    {
      return new Builder(null);
    }
    
    public static class Builder
      extends AbstractValuesBuilder
    {
      private Builder()
      {
        super(MaindbContract.Checker.CONTENT_URI);
      }
      
      public Builder setContractType(long paramLong)
      {
        this.mValues.put("contractType", Long.valueOf(paramLong));
        return this;
      }
      
      public Builder setCurrencyDst(String paramString)
      {
        this.mValues.put("currencyDst", paramString);
        return this;
      }
      
      public Builder setCurrencyPairId(String paramString)
      {
        this.mValues.put("currencyPairId", paramString);
        return this;
      }
      
      public Builder setCurrencySrc(String paramString)
      {
        this.mValues.put("currencySrc", paramString);
        return this;
      }
      
      public Builder setCurrencySubunitDst(long paramLong)
      {
        this.mValues.put("currencySubunitDst", Long.valueOf(paramLong));
        return this;
      }
      
      public Builder setCurrencySubunitSrc(long paramLong)
      {
        this.mValues.put("currencySubunitSrc", Long.valueOf(paramLong));
        return this;
      }
      
      public Builder setEnabled(boolean paramBoolean)
      {
        this.mValues.put("enabled", Boolean.valueOf(paramBoolean));
        return this;
      }
      
      public Builder setErrorMsg(String paramString)
      {
        this.mValues.put("errorMsg", paramString);
        return this;
      }
      
      public Builder setFrequency(long paramLong)
      {
        this.mValues.put("frequency", Long.valueOf(paramLong));
        return this;
      }
      
      public Builder setLastCheckDate(long paramLong)
      {
        this.mValues.put("lastCheckDate", Long.valueOf(paramLong));
        return this;
      }
      
      public Builder setLastCheckPointTicker(String paramString)
      {
        this.mValues.put("lastCheckPointTicker", paramString);
        return this;
      }
      
      public Builder setLastCheckTicker(String paramString)
      {
        this.mValues.put("lastCheckTicker", paramString);
        return this;
      }
      
      public Builder setMarketKey(String paramString)
      {
        this.mValues.put("marketKey", paramString);
        return this;
      }
      
      public Builder setNotificationPriority(long paramLong)
      {
        this.mValues.put("notificationPriority", Long.valueOf(paramLong));
        return this;
      }
      
      public Builder setPreviousCheckTicker(String paramString)
      {
        this.mValues.put("previousCheckTicker", paramString);
        return this;
      }
      
      public Builder setSortOrder(long paramLong)
      {
        this.mValues.put("sortOrder", Long.valueOf(paramLong));
        return this;
      }
      
      public Builder setTtsEnabled(boolean paramBoolean)
      {
        this.mValues.put("ttsEnabled", Boolean.valueOf(paramBoolean));
        return this;
      }
    }
  }
  
  static abstract interface CheckerColumns
  {
    public static final String CONTRACT_TYPE = "contractType";
    public static final String CURRENCY_DST = "currencyDst";
    public static final String CURRENCY_PAIR_ID = "currencyPairId";
    public static final String CURRENCY_SRC = "currencySrc";
    public static final String CURRENCY_SUBUNIT_DST = "currencySubunitDst";
    public static final String CURRENCY_SUBUNIT_SRC = "currencySubunitSrc";
    public static final String ENABLED = "enabled";
    public static final String ERROR_MSG = "errorMsg";
    public static final String FREQUENCY = "frequency";
    public static final String LAST_CHECK_DATE = "lastCheckDate";
    public static final String LAST_CHECK_POINT_TICKER = "lastCheckPointTicker";
    public static final String LAST_CHECK_TICKER = "lastCheckTicker";
    public static final String MARKET_KEY = "marketKey";
    public static final String NOTIFICATION_PRIORITY = "notificationPriority";
    public static final String PREVIOUS_CHECK_TICKER = "previousCheckTicker";
    public static final String SORT_ORDER = "sortOrder";
    public static final String TTS_ENABLED = "ttsEnabled";
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/db/content/MaindbContract.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */