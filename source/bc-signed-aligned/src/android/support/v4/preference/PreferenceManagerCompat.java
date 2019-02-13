package android.support.v4.preference;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.preference.Preference;
import android.preference.PreferenceManager;
import android.preference.PreferenceScreen;
import android.util.Log;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

public class PreferenceManagerCompat
{
  private static final String TAG = PreferenceManagerCompat.class.getSimpleName();
  
  static void dispatchActivityDestroy(PreferenceManager paramPreferenceManager)
  {
    try
    {
      Method localMethod = PreferenceManager.class.getDeclaredMethod("dispatchActivityDestroy", new Class[0]);
      localMethod.setAccessible(true);
      localMethod.invoke(paramPreferenceManager, new Object[0]);
      return;
    }
    catch (Exception paramPreferenceManager)
    {
      for (;;)
      {
        Log.w(TAG, "Couldn't call PreferenceManager.dispatchActivityDestroy by reflection", paramPreferenceManager);
      }
    }
  }
  
  static void dispatchActivityResult(PreferenceManager paramPreferenceManager, int paramInt1, int paramInt2, Intent paramIntent)
  {
    try
    {
      Method localMethod = PreferenceManager.class.getDeclaredMethod("dispatchActivityResult", new Class[] { Integer.TYPE, Integer.TYPE, Intent.class });
      localMethod.setAccessible(true);
      localMethod.invoke(paramPreferenceManager, new Object[] { Integer.valueOf(paramInt1), Integer.valueOf(paramInt2), paramIntent });
      return;
    }
    catch (Exception paramPreferenceManager)
    {
      for (;;)
      {
        Log.w(TAG, "Couldn't call PreferenceManager.dispatchActivityResult by reflection", paramPreferenceManager);
      }
    }
  }
  
  static void dispatchActivityStop(PreferenceManager paramPreferenceManager)
  {
    try
    {
      Method localMethod = PreferenceManager.class.getDeclaredMethod("dispatchActivityStop", new Class[0]);
      localMethod.setAccessible(true);
      localMethod.invoke(paramPreferenceManager, new Object[0]);
      return;
    }
    catch (Exception paramPreferenceManager)
    {
      for (;;)
      {
        Log.w(TAG, "Couldn't call PreferenceManager.dispatchActivityStop by reflection", paramPreferenceManager);
      }
    }
  }
  
  static PreferenceScreen getPreferenceScreen(PreferenceManager paramPreferenceManager)
  {
    try
    {
      Method localMethod = PreferenceManager.class.getDeclaredMethod("getPreferenceScreen", new Class[0]);
      localMethod.setAccessible(true);
      paramPreferenceManager = (PreferenceScreen)localMethod.invoke(paramPreferenceManager, new Object[0]);
      return paramPreferenceManager;
    }
    catch (Exception paramPreferenceManager)
    {
      for (;;)
      {
        Log.w(TAG, "Couldn't call PreferenceManager.getPreferenceScreen by reflection", paramPreferenceManager);
        paramPreferenceManager = null;
      }
    }
  }
  
  static PreferenceScreen inflateFromIntent(PreferenceManager paramPreferenceManager, Intent paramIntent, PreferenceScreen paramPreferenceScreen)
  {
    try
    {
      Method localMethod = PreferenceManager.class.getDeclaredMethod("inflateFromIntent", new Class[] { Intent.class, PreferenceScreen.class });
      localMethod.setAccessible(true);
      paramPreferenceManager = (PreferenceScreen)localMethod.invoke(paramPreferenceManager, new Object[] { paramIntent, paramPreferenceScreen });
      return paramPreferenceManager;
    }
    catch (Exception paramPreferenceManager)
    {
      for (;;)
      {
        Log.w(TAG, "Couldn't call PreferenceManager.inflateFromIntent by reflection", paramPreferenceManager);
        paramPreferenceManager = null;
      }
    }
  }
  
  static PreferenceScreen inflateFromResource(PreferenceManager paramPreferenceManager, Activity paramActivity, int paramInt, PreferenceScreen paramPreferenceScreen)
  {
    try
    {
      Method localMethod = PreferenceManager.class.getDeclaredMethod("inflateFromResource", new Class[] { Context.class, Integer.TYPE, PreferenceScreen.class });
      localMethod.setAccessible(true);
      paramPreferenceManager = (PreferenceScreen)localMethod.invoke(paramPreferenceManager, new Object[] { paramActivity, Integer.valueOf(paramInt), paramPreferenceScreen });
      return paramPreferenceManager;
    }
    catch (Exception paramPreferenceManager)
    {
      for (;;)
      {
        Log.w(TAG, "Couldn't call PreferenceManager.inflateFromResource by reflection", paramPreferenceManager);
        paramPreferenceManager = null;
      }
    }
  }
  
  static PreferenceManager newInstance(Activity paramActivity, int paramInt)
  {
    try
    {
      Constructor localConstructor = PreferenceManager.class.getDeclaredConstructor(new Class[] { Activity.class, Integer.TYPE });
      localConstructor.setAccessible(true);
      paramActivity = (PreferenceManager)localConstructor.newInstance(new Object[] { paramActivity, Integer.valueOf(paramInt) });
      return paramActivity;
    }
    catch (Exception paramActivity)
    {
      for (;;)
      {
        Log.w(TAG, "Couldn't call constructor PreferenceManager by reflection", paramActivity);
        paramActivity = null;
      }
    }
  }
  
  static void setFragment(PreferenceManager paramPreferenceManager, PreferenceFragment paramPreferenceFragment) {}
  
  static void setOnPreferenceTreeClickListener(PreferenceManager paramPreferenceManager, OnPreferenceTreeClickListener paramOnPreferenceTreeClickListener)
  {
    for (;;)
    {
      try
      {
        localField = PreferenceManager.class.getDeclaredField("mOnPreferenceTreeClickListener");
        localField.setAccessible(true);
        if (paramOnPreferenceTreeClickListener != null)
        {
          ClassLoader localClassLoader = localField.getType().getClassLoader();
          Class localClass = localField.getType();
          InvocationHandler local1 = new android/support/v4/preference/PreferenceManagerCompat$1;
          local1.<init>(paramOnPreferenceTreeClickListener);
          localField.set(paramPreferenceManager, Proxy.newProxyInstance(localClassLoader, new Class[] { localClass }, local1));
          return;
        }
      }
      catch (Exception paramPreferenceManager)
      {
        Field localField;
        Log.w(TAG, "Couldn't set PreferenceManager.mOnPreferenceTreeClickListener by reflection", paramPreferenceManager);
        continue;
      }
      localField.set(paramPreferenceManager, null);
    }
  }
  
  static boolean setPreferences(PreferenceManager paramPreferenceManager, PreferenceScreen paramPreferenceScreen)
  {
    try
    {
      Method localMethod = PreferenceManager.class.getDeclaredMethod("setPreferences", new Class[] { PreferenceScreen.class });
      localMethod.setAccessible(true);
      bool = ((Boolean)localMethod.invoke(paramPreferenceManager, new Object[] { paramPreferenceScreen })).booleanValue();
      return bool;
    }
    catch (Exception paramPreferenceManager)
    {
      for (;;)
      {
        Log.w(TAG, "Couldn't call PreferenceManager.setPreferences by reflection", paramPreferenceManager);
        boolean bool = false;
      }
    }
  }
  
  static abstract interface OnPreferenceTreeClickListener
  {
    public abstract boolean onPreferenceTreeClick(PreferenceScreen paramPreferenceScreen, Preference paramPreference);
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/android/support/v4/preference/PreferenceManagerCompat.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */