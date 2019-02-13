package com.tjeannin.apprate;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.AlertDialog.Builder;
import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnCancelListener;
import android.content.DialogInterface.OnClickListener;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.net.Uri;
import android.util.Log;
import android.widget.Button;
import android.widget.Toast;

public class AppRate
  implements DialogInterface.OnClickListener, DialogInterface.OnCancelListener
{
  private static final String TAG = "AppRater";
  private DialogInterface.OnClickListener clickListener;
  private AlertDialog.Builder dialogBuilder = null;
  private Activity hostActivity;
  private long minDaysUntilPrompt = 0L;
  private long minLaunchesUntilPrompt = 0L;
  private SharedPreferences preferences;
  private boolean showIfHasCrashed = true;
  
  public AppRate(Activity paramActivity)
  {
    this.hostActivity = paramActivity;
    this.preferences = paramActivity.getSharedPreferences("apprate_prefs", 0);
  }
  
  private static final String getApplicationName(Context paramContext)
  {
    PackageManager localPackageManager = paramContext.getPackageManager();
    try
    {
      paramContext = localPackageManager.getApplicationInfo(paramContext.getPackageName(), 0);
      if (paramContext != null)
      {
        paramContext = localPackageManager.getApplicationLabel(paramContext);
        return (String)paramContext;
      }
    }
    catch (PackageManager.NameNotFoundException paramContext)
    {
      for (;;)
      {
        paramContext = null;
        continue;
        paramContext = "(unknown)";
      }
    }
  }
  
  private void initExceptionHandler()
  {
    Log.d("AppRater", "Init AppRate ExceptionHandler");
    Thread.UncaughtExceptionHandler localUncaughtExceptionHandler = Thread.getDefaultUncaughtExceptionHandler();
    if (!(localUncaughtExceptionHandler instanceof ExceptionHandler)) {
      Thread.setDefaultUncaughtExceptionHandler(new ExceptionHandler(localUncaughtExceptionHandler, this.hostActivity));
    }
  }
  
  public static void reset(Context paramContext)
  {
    paramContext.getSharedPreferences("apprate_prefs", 0).edit().clear().commit();
    Log.d("AppRater", "Cleared AppRate shared preferences.");
  }
  
  private void showDefaultDialog()
  {
    Log.d("AppRater", "Create default dialog.");
    String str1 = "Rate " + getApplicationName(this.hostActivity.getApplicationContext());
    String str2 = "If you enjoy using " + getApplicationName(this.hostActivity.getApplicationContext()) + ", please take a moment to rate it. Thanks for your support!";
    new AlertDialog.Builder(this.hostActivity).setTitle(str1).setMessage(str2).setPositiveButton("Rate it !", this).setNegativeButton("No thanks", this).setNeutralButton("Remind me later", this).setOnCancelListener(this).create().show();
  }
  
  private void showDialog(AlertDialog.Builder paramBuilder)
  {
    Log.d("AppRater", "Create custom dialog.");
    paramBuilder = paramBuilder.create();
    paramBuilder.show();
    String str1 = (String)paramBuilder.getButton(-1).getText();
    String str2 = (String)paramBuilder.getButton(-3).getText();
    String str3 = (String)paramBuilder.getButton(-2).getText();
    paramBuilder.setButton(-1, str1, this);
    paramBuilder.setButton(-3, str2, this);
    paramBuilder.setButton(-2, str3, this);
    paramBuilder.setOnCancelListener(this);
  }
  
  public void init()
  {
    Log.d("AppRater", "Init AppRate");
    if ((this.preferences.getBoolean("dont_show_again", false)) || ((this.preferences.getBoolean("pref_app_has_crashed", false)) && (!this.showIfHasCrashed))) {
      return;
    }
    if (!this.showIfHasCrashed) {
      initExceptionHandler();
    }
    SharedPreferences.Editor localEditor = this.preferences.edit();
    long l = this.preferences.getLong("launch_count", 0L) + 1L;
    localEditor.putLong("launch_count", l);
    Long localLong1 = Long.valueOf(this.preferences.getLong("date_firstlaunch", 0L));
    Long localLong2 = localLong1;
    if (localLong1.longValue() == 0L)
    {
      localLong2 = Long.valueOf(System.currentTimeMillis());
      localEditor.putLong("date_firstlaunch", localLong2.longValue());
    }
    if ((l >= this.minLaunchesUntilPrompt) && (System.currentTimeMillis() >= localLong2.longValue() + this.minDaysUntilPrompt * 86400000L))
    {
      if (this.dialogBuilder == null) {
        break label200;
      }
      showDialog(this.dialogBuilder);
    }
    for (;;)
    {
      localEditor.commit();
      break;
      label200:
      showDefaultDialog();
    }
  }
  
  public void onCancel(DialogInterface paramDialogInterface)
  {
    paramDialogInterface = this.preferences.edit();
    paramDialogInterface.putLong("date_firstlaunch", System.currentTimeMillis());
    paramDialogInterface.putLong("launch_count", 0L);
    paramDialogInterface.commit();
  }
  
  public void onClick(DialogInterface paramDialogInterface, int paramInt)
  {
    SharedPreferences.Editor localEditor = this.preferences.edit();
    switch (paramInt)
    {
    }
    for (;;)
    {
      localEditor.commit();
      paramDialogInterface.dismiss();
      if (this.clickListener != null) {
        this.clickListener.onClick(paramDialogInterface, paramInt);
      }
      return;
      try
      {
        Activity localActivity = this.hostActivity;
        Intent localIntent = new android/content/Intent;
        StringBuilder localStringBuilder = new java/lang/StringBuilder;
        localStringBuilder.<init>();
        localIntent.<init>("android.intent.action.VIEW", Uri.parse("market://details?id=" + this.hostActivity.getPackageName()));
        localActivity.startActivity(localIntent);
        localEditor.putBoolean("dont_show_again", true);
      }
      catch (ActivityNotFoundException localActivityNotFoundException)
      {
        for (;;)
        {
          Toast.makeText(this.hostActivity, "No Play Store installed on device", 0).show();
        }
      }
      localEditor.putBoolean("dont_show_again", true);
      continue;
      localEditor.putLong("date_firstlaunch", System.currentTimeMillis());
      localEditor.putLong("launch_count", 0L);
    }
  }
  
  public AppRate setCustomDialog(AlertDialog.Builder paramBuilder)
  {
    this.dialogBuilder = paramBuilder;
    return this;
  }
  
  public AppRate setMinDaysUntilPrompt(long paramLong)
  {
    this.minDaysUntilPrompt = paramLong;
    return this;
  }
  
  public AppRate setMinLaunchesUntilPrompt(long paramLong)
  {
    this.minLaunchesUntilPrompt = paramLong;
    return this;
  }
  
  public AppRate setOnClickListener(DialogInterface.OnClickListener paramOnClickListener)
  {
    this.clickListener = paramOnClickListener;
    return this;
  }
  
  public AppRate setShowIfAppHasCrashed(boolean paramBoolean)
  {
    this.showIfHasCrashed = paramBoolean;
    return this;
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/tjeannin/apprate/AppRate.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */