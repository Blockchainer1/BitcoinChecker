package com.mobnetic.coinguardian;

import android.app.Application;
import com.mobnetic.coinguardian.util.SoundFilesManager;
import com.mobnetic.coinguardian.volley.UserCountryDetectionAsyncTask;
import com.robotoworks.mechanoid.Mechanoid;

public class MyApplication
  extends Application
{
  public void onCreate()
  {
    super.onCreate();
    com.mobnetic.coinguardian.model.market.SwissCex.API_KEY = "8grbc7eab79imc2r9co6fb0q5";
    Mechanoid.init(this);
    SoundFilesManager.installRingtonesIfNeeded(this);
    UserCountryDetectionAsyncTask.setupUserCountry(this);
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/MyApplication.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */