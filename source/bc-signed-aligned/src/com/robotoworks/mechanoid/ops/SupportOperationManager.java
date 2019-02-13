package com.robotoworks.mechanoid.ops;

import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;
import android.util.Log;

@Deprecated
public class SupportOperationManager
  extends OperationManagerBase
{
  private static final String TAG = "OperationManager";
  
  private SupportOperationManager(OperationManagerCallbacks paramOperationManagerCallbacks, boolean paramBoolean)
  {
    super(paramOperationManagerCallbacks, paramBoolean);
  }
  
  public static SupportOperationManager create(FragmentActivity paramFragmentActivity, OperationManagerCallbacks paramOperationManagerCallbacks)
  {
    return create(paramFragmentActivity, paramOperationManagerCallbacks, false);
  }
  
  public static SupportOperationManager create(FragmentActivity paramFragmentActivity, OperationManagerCallbacks paramOperationManagerCallbacks, boolean paramBoolean)
  {
    String str = "Tags." + paramOperationManagerCallbacks.getClass().getName();
    FragmentManager localFragmentManager = paramFragmentActivity.getSupportFragmentManager();
    PersistenceFragment localPersistenceFragment = (PersistenceFragment)localFragmentManager.findFragmentByTag(str);
    if (localPersistenceFragment == null)
    {
      if (paramBoolean) {
        Log.d("OperationManager", String.format("[Create Fragment] tag:%s", new Object[] { str }));
      }
      localPersistenceFragment = new PersistenceFragment();
      paramFragmentActivity = new SupportOperationManager(paramOperationManagerCallbacks, paramBoolean);
      localPersistenceFragment.setOperationManager(paramFragmentActivity);
      localFragmentManager.beginTransaction().add(localPersistenceFragment, str).commit();
    }
    for (;;)
    {
      return paramFragmentActivity;
      if (paramBoolean) {
        Log.d("OperationManager", String.format("[Recover Fragment] tag:%s", new Object[] { str }));
      }
      paramFragmentActivity = (SupportOperationManager)localPersistenceFragment.getOperationManager();
      if (paramFragmentActivity == null)
      {
        if (paramBoolean) {
          Log.d("OperationManager", String.format("[Create Manager] tag:%s", new Object[] { str }));
        }
        paramFragmentActivity = new SupportOperationManager(paramOperationManagerCallbacks, paramBoolean);
        localPersistenceFragment.setOperationManager(paramFragmentActivity);
      }
      else
      {
        if (paramBoolean) {
          Log.d("OperationManager", String.format("[Recover Manager] tag:%s", new Object[] { str }));
        }
        paramFragmentActivity.mCallbacks = paramOperationManagerCallbacks;
      }
    }
  }
  
  public static class PersistenceFragment
    extends Fragment
  {
    private OperationManagerBase mOperationManager;
    private Bundle mSavedState;
    
    private void removeSelf()
    {
      getFragmentManager().beginTransaction().remove(this).commitAllowingStateLoss();
    }
    
    public OperationManagerBase getOperationManager()
    {
      return this.mOperationManager;
    }
    
    public void onActivityCreated(Bundle paramBundle)
    {
      super.onActivityCreated(paramBundle);
      OperationManagerBase localOperationManagerBase = getOperationManager();
      if (localOperationManagerBase == null) {
        this.mSavedState = paramBundle;
      }
      for (;;)
      {
        return;
        localOperationManagerBase.restoreState(paramBundle);
      }
    }
    
    public void onSaveInstanceState(Bundle paramBundle)
    {
      super.onSaveInstanceState(paramBundle);
      OperationManagerBase localOperationManagerBase = getOperationManager();
      if (localOperationManagerBase != null) {
        localOperationManagerBase.saveState(paramBundle);
      }
      for (;;)
      {
        return;
        removeSelf();
      }
    }
    
    public void onStart()
    {
      super.onStart();
      OperationManagerBase localOperationManagerBase = getOperationManager();
      if (localOperationManagerBase != null) {
        localOperationManagerBase.start();
      }
      for (;;)
      {
        return;
        removeSelf();
      }
    }
    
    public void onStop()
    {
      super.onStop();
      OperationManagerBase localOperationManagerBase = getOperationManager();
      if (localOperationManagerBase != null) {
        localOperationManagerBase.stop();
      }
      for (;;)
      {
        return;
        removeSelf();
      }
    }
    
    public void setOperationManager(OperationManagerBase paramOperationManagerBase)
    {
      this.mOperationManager = paramOperationManagerBase;
      if (this.mSavedState != null)
      {
        this.mOperationManager.restoreState(this.mSavedState);
        this.mOperationManager.start();
      }
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/robotoworks/mechanoid/ops/SupportOperationManager.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */