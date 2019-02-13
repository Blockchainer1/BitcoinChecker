package com.mobnetic.coinguardian.util;

import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.res.Resources;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.net.Uri;
import android.preference.ListPreference;
import android.text.Editable;
import android.util.DisplayMetrics;
import android.util.TypedValue;
import android.view.View;
import android.view.inputmethod.InputMethodManager;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;
import java.util.List;

public class Utils
{
  private static final String GITHUB_URL = "https://github.com/mobnetic/BitcoinChecker/";
  
  public static int getPixels(Context paramContext, int paramInt)
  {
    return (int)(getPixelsF(paramContext, paramInt) + 0.5F);
  }
  
  public static float getPixelsF(Context paramContext, float paramFloat)
  {
    return paramContext.getResources().getDisplayMetrics().density * paramFloat;
  }
  
  public static int getSpPixels(Context paramContext, int paramInt)
  {
    return (int)(TypedValue.applyDimension(2, paramInt, paramContext.getResources().getDisplayMetrics()) + 0.5F);
  }
  
  public static boolean goToGitHub(Context paramContext)
  {
    return goToWebPage(paramContext, "https://github.com/mobnetic/BitcoinChecker/");
  }
  
  public static boolean goToGitHubIssues(Context paramContext)
  {
    return goToWebPage(paramContext, "https://github.com/mobnetic/BitcoinChecker/issues");
  }
  
  public static boolean goToGooglePlay(Context paramContext, String paramString)
  {
    return goToWebPage(paramContext, "market://details?id=" + paramString);
  }
  
  public static boolean goToWebPage(Context paramContext, String paramString)
  {
    try
    {
      Intent localIntent = new android/content/Intent;
      localIntent.<init>("android.intent.action.VIEW", Uri.parse(paramString));
      paramContext.startActivity(localIntent);
      bool = true;
    }
    catch (Throwable paramContext)
    {
      for (;;)
      {
        boolean bool = false;
      }
    }
    return bool;
  }
  
  public static boolean handleIntListOnPreferenceChange(ListPreference paramListPreference, Object paramObject)
  {
    try
    {
      CharSequence[] arrayOfCharSequence = paramListPreference.getEntries();
      int i = paramListPreference.findIndexOfValue((String)paramObject);
      int j;
      if (i >= 0)
      {
        j = i;
        if (i < arrayOfCharSequence.length) {}
      }
      else
      {
        j = 0;
      }
      paramListPreference.setSummary(paramListPreference.getEntries()[j]);
      bool = true;
    }
    catch (Exception paramListPreference)
    {
      for (;;)
      {
        paramListPreference.printStackTrace();
        boolean bool = false;
      }
    }
    return bool;
  }
  
  public static void hideKeyboard(Context paramContext, View paramView)
  {
    paramContext = (InputMethodManager)paramContext.getSystemService("input_method");
    try
    {
      paramContext.hideSoftInputFromWindow(paramView.getWindowToken(), 0);
      return;
    }
    catch (Throwable paramContext)
    {
      for (;;)
      {
        paramContext.printStackTrace();
      }
    }
  }
  
  public static boolean isIntentAvailable(Context paramContext, Intent paramIntent)
  {
    if (paramContext.getPackageManager().queryIntentActivities(paramIntent, 65536).size() > 0) {}
    for (boolean bool = true;; bool = false) {
      return bool;
    }
  }
  
  public static boolean isNetworkConnectionAvailable(Context paramContext)
  {
    paramContext = ((ConnectivityManager)paramContext.getSystemService("connectivity")).getActiveNetworkInfo();
    if ((paramContext != null) && (paramContext.isConnectedOrConnecting())) {}
    for (boolean bool = true;; bool = false) {
      return bool;
    }
  }
  
  public static void sendEmail(Context paramContext, String paramString1, String paramString2)
  {
    try
    {
      Intent localIntent = new android/content/Intent;
      localIntent.<init>("android.intent.action.SENDTO", Uri.fromParts("mailto", paramString1, null));
      localIntent.putExtra("android.intent.extra.SUBJECT", paramString2);
      paramContext.startActivity(Intent.createChooser(localIntent, paramContext.getString(2131165305)));
      return;
    }
    catch (Exception paramContext)
    {
      for (;;)
      {
        paramContext.printStackTrace();
      }
    }
  }
  
  public static void setSelectionAfterLastLetter(EditText paramEditText)
  {
    paramEditText.setSelection(paramEditText.getText().length());
  }
  
  public static void setViewError(TextView paramTextView, int paramInt)
  {
    setViewError(paramTextView, paramTextView.getContext().getString(paramInt));
  }
  
  public static void setViewError(TextView paramTextView, CharSequence paramCharSequence)
  {
    paramTextView.setFocusableInTouchMode(true);
    paramTextView.requestFocus();
    paramTextView.setError(paramCharSequence);
  }
  
  public static void showKeyboard(Context paramContext, View paramView)
  {
    paramView.requestFocus();
    paramContext = (InputMethodManager)paramContext.getSystemService("input_method");
    paramContext.showSoftInput(paramView, 1);
    paramContext.restartInput(paramView);
  }
  
  public static void showToast(Context paramContext, int paramInt)
  {
    showToast(paramContext, paramInt, false);
  }
  
  public static void showToast(Context paramContext, int paramInt, boolean paramBoolean)
  {
    showToast(paramContext, paramContext.getString(paramInt), paramBoolean);
  }
  
  public static void showToast(Context paramContext, String paramString)
  {
    showToast(paramContext, paramString, false);
  }
  
  public static void showToast(Context paramContext, String paramString, boolean paramBoolean)
  {
    paramContext = paramContext.getApplicationContext();
    if (paramBoolean) {}
    for (int i = 1;; i = 0)
    {
      Toast.makeText(paramContext, paramString, i).show();
      return;
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/util/Utils.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */