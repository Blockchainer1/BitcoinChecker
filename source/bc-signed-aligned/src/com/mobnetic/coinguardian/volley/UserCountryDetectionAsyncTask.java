package com.mobnetic.coinguardian.volley;

import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.os.AsyncTask;
import android.telephony.TelephonyManager;
import android.text.TextUtils;
import com.android.volley.DefaultRetryPolicy;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.RetryPolicy;
import com.android.volley.toolbox.RequestFuture;
import com.mobnetic.coinguardian.util.AsyncTaskCompat;
import com.mobnetic.coinguardian.util.HttpsHelper;
import com.mobnetic.coinguardian.util.PreferencesUtils;
import com.mobnetic.coinguardian.volley.generic.GzipVolleyStringRequest;
import java.util.Locale;
import org.json.JSONObject;

public class UserCountryDetectionAsyncTask
  extends AsyncTask<Void, Void, Void>
{
  private final Context appContext;
  private final RequestQueue requestQueue;
  
  private UserCountryDetectionAsyncTask(Context paramContext)
  {
    this.appContext = paramContext.getApplicationContext();
    this.requestQueue = HttpsHelper.newRequestQueue(paramContext);
  }
  
  private String getCountryCodeFromInternet()
  {
    try
    {
      RequestFuture localRequestFuture = RequestFuture.newFuture();
      Object localObject1 = new com/mobnetic/coinguardian/volley/generic/GzipVolleyStringRequest;
      ((GzipVolleyStringRequest)localObject1).<init>("http://ip-api.com/json", localRequestFuture, localRequestFuture);
      localObject2 = new com/android/volley/DefaultRetryPolicy;
      ((DefaultRetryPolicy)localObject2).<init>(8000, 1, 1.0F);
      ((GzipVolleyStringRequest)localObject1).setRetryPolicy((RetryPolicy)localObject2);
      this.requestQueue.add((Request)localObject1);
      localObject2 = (String)localRequestFuture.get();
      if (localObject2 == null) {
        break label79;
      }
      localObject1 = new org/json/JSONObject;
      ((JSONObject)localObject1).<init>((String)localObject2);
      localObject2 = ((JSONObject)localObject1).getString("countryCode");
    }
    catch (Exception localException)
    {
      for (;;)
      {
        Object localObject2;
        localException.printStackTrace();
        label79:
        Object localObject3 = null;
      }
    }
    return (String)localObject2;
  }
  
  private String getCountryCodeFromTelephonyNetwork()
  {
    localObject1 = null;
    try
    {
      Object localObject2 = (TelephonyManager)this.appContext.getSystemService("phone");
      localObject3 = localObject1;
      if (localObject2 != null)
      {
        localObject2 = ((TelephonyManager)localObject2).getNetworkCountryIso();
        localObject3 = localObject1;
        if (localObject2 != null) {
          localObject3 = ((String)localObject2).toUpperCase(Locale.ENGLISH);
        }
      }
    }
    catch (Exception localException)
    {
      for (;;)
      {
        Object localObject3;
        localException.printStackTrace();
        Object localObject4 = localObject1;
      }
    }
    return (String)localObject3;
  }
  
  private String getCountryCodeSystemLocale()
  {
    for (;;)
    {
      try
      {
        localObject1 = this.appContext.getResources().getConfiguration().locale;
        if (localObject1 == null) {
          continue;
        }
        str = ((Locale)localObject1).getCountry();
        localObject1 = str;
        if (TextUtils.isEmpty(str)) {
          localObject1 = Locale.getDefault().getCountry();
        }
        boolean bool = TextUtils.isEmpty((CharSequence)localObject1);
        if (bool) {
          localObject1 = null;
        }
      }
      catch (Exception localException)
      {
        Object localObject1;
        String str;
        localException.printStackTrace();
        Object localObject2 = null;
        continue;
      }
      return (String)localObject1;
      str = null;
    }
  }
  
  public static void setupUserCountry(Context paramContext)
  {
    if (!TextUtils.isEmpty(PreferencesUtils.getUserCountry(paramContext))) {}
    for (;;)
    {
      return;
      AsyncTaskCompat.execute(new UserCountryDetectionAsyncTask(paramContext), new Void[0]);
    }
  }
  
  protected Void doInBackground(Void... paramVarArgs)
  {
    updateUserRegion();
    return null;
  }
  
  public boolean updateUserRegion()
  {
    Object localObject1 = getCountryCodeFromTelephonyNetwork();
    Object localObject2 = localObject1;
    if (TextUtils.isEmpty((CharSequence)localObject1)) {
      localObject2 = getCountryCodeFromInternet();
    }
    localObject1 = localObject2;
    if (TextUtils.isEmpty((CharSequence)localObject2)) {
      localObject1 = getCountryCodeSystemLocale();
    }
    if (!TextUtils.isEmpty((CharSequence)localObject1)) {
      PreferencesUtils.setUserCountry(this.appContext, (String)localObject1);
    }
    for (boolean bool = true;; bool = false) {
      return bool;
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/volley/UserCountryDetectionAsyncTask.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */