package com.mobnetic.coinguardian.activity.generic;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;
import android.support.v7.app.ActionBarActivity;
import com.mobnetic.coinguardian.util.TTSHelper;

public abstract class SimpleFragmentActivity<T extends Fragment>
  extends ActionBarActivity
{
  private static final String CHILD_FRAGMENT_TAG = "CHILD_FRAGMENT";
  private static final IntentFilter audioHeadsetChangedFilter = new IntentFilter("android.intent.action.HEADSET_PLUG");
  private final BroadcastReceiver audioHeadsetChangedReceiver = new BroadcastReceiver()
  {
    public void onReceive(Context paramAnonymousContext, Intent paramAnonymousIntent)
    {
      SimpleFragmentActivity.this.setVolumeControlStream(TTSHelper.getProperAudioStream(paramAnonymousContext));
    }
  };
  protected T childFragment;
  
  protected abstract T createChildFragment();
  
  public T getChildFragment()
  {
    return this.childFragment;
  }
  
  protected int getContentViewResId()
  {
    return 2130903076;
  }
  
  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    setContentView(getContentViewResId());
    this.childFragment = getSupportFragmentManager().findFragmentByTag("CHILD_FRAGMENT");
    if (this.childFragment == null)
    {
      this.childFragment = createChildFragment();
      if (this.childFragment != null)
      {
        paramBundle = getSupportFragmentManager().beginTransaction();
        paramBundle.replace(2131624014, this.childFragment, "CHILD_FRAGMENT");
        paramBundle.commit();
      }
    }
  }
  
  protected void onStart()
  {
    super.onStart();
    registerReceiver(this.audioHeadsetChangedReceiver, audioHeadsetChangedFilter);
    setVolumeControlStream(TTSHelper.getProperAudioStream(this));
  }
  
  protected void onStop()
  {
    super.onStop();
    try
    {
      unregisterReceiver(this.audioHeadsetChangedReceiver);
      return;
    }
    catch (Exception localException)
    {
      for (;;) {}
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobnetic/coinguardian/activity/generic/SimpleFragmentActivity.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */