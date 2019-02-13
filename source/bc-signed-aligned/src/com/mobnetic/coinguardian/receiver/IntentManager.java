package com.mobnetic.coinguardian.receiver;

import android.content.Context;
import android.content.Intent;
import android.support.v4.content.LocalBroadcastManager;

public class IntentManager
{
  public static final String ACTION_CHECKPOINT_REFRESH = "com.mobnetic.coinguardian.receiver.action.checkpoint_refresh";
  
  public static void sendLocalBroadcast(Context paramContext, String paramString)
  {
    LocalBroadcastManager.getInstance(paramContext).sendBroadcast(new Intent(paramString));
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/receiver/IntentManager.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */