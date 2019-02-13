package com.robotoworks.mechanoid;

import android.content.ComponentName;
import android.content.ContentResolver;
import android.content.Context;
import android.content.Intent;
import com.robotoworks.mechanoid.ops.OpsInitializer;

public class Mechanoid
{
  private static Mechanoid sInstance;
  Context mApplicationContext;
  
  private Mechanoid(Context paramContext)
  {
    this.mApplicationContext = paramContext.getApplicationContext();
  }
  
  public static Mechanoid get()
  {
    if (sInstance == null) {
      throw new MechanoidNotInitializedException();
    }
    return sInstance;
  }
  
  public static Context getApplicationContext()
  {
    return get().mApplicationContext;
  }
  
  public static ContentResolver getContentResolver()
  {
    return get().mApplicationContext.getContentResolver();
  }
  
  public static void init(Context paramContext)
  {
    if (sInstance == null)
    {
      sInstance = new Mechanoid(paramContext);
      OpsInitializer.init();
    }
  }
  
  public static ComponentName startService(Intent paramIntent)
  {
    return get().mApplicationContext.startService(paramIntent);
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/robotoworks/mechanoid/Mechanoid.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */