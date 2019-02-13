package com.mobnetic.coinguardian.alarm;

import android.annotation.SuppressLint;
import android.content.Context;
import android.os.PowerManager;
import android.os.PowerManager.WakeLock;

class AlarmAlertWakeLock
{
  private static final String TAG = "AlarmAlertWakeLock";
  private static PowerManager.WakeLock sCpuWakeLock;
  
  static void acquireCpuWakeLock(Context paramContext)
  {
    if (sCpuWakeLock != null) {}
    for (;;)
    {
      return;
      sCpuWakeLock = createPartialWakeLock(paramContext);
      sCpuWakeLock.acquire();
    }
  }
  
  @SuppressLint({"Wakelock"})
  static void acquireScreenCpuWakeLock(Context paramContext)
  {
    if (sCpuWakeLock != null) {}
    for (;;)
    {
      return;
      sCpuWakeLock = ((PowerManager)paramContext.getSystemService("power")).newWakeLock(805306369, "AlarmAlertWakeLock");
      sCpuWakeLock.acquire();
    }
  }
  
  static PowerManager.WakeLock createPartialWakeLock(Context paramContext)
  {
    return ((PowerManager)paramContext.getSystemService("power")).newWakeLock(1, "AlarmAlertWakeLock");
  }
  
  static void releaseCpuLock()
  {
    if (sCpuWakeLock != null)
    {
      sCpuWakeLock.release();
      sCpuWakeLock = null;
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/alarm/AlarmAlertWakeLock.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */