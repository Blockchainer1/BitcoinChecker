package android.support.v4.app;

import android.app.ActivityManager;
import android.os.Build.VERSION;
import android.support.annotation.NonNull;

public final class ActivityManagerCompat
{
  public static boolean isLowRamDevice(@NonNull ActivityManager paramActivityManager)
  {
    if (Build.VERSION.SDK_INT >= 19) {}
    for (boolean bool = ActivityManagerCompatKitKat.isLowRamDevice(paramActivityManager);; bool = false) {
      return bool;
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/android/support/v4/app/ActivityManagerCompat.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */