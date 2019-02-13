package com.robotoworks.mechanoid.ops;

import android.app.Activity;
import android.app.Fragment;
import android.app.FragmentManager;
import android.app.FragmentTransaction;
import android.os.Bundle;
import android.util.Log;

@Deprecated
public class OperationManager
  extends OperationManagerBase
{
  private static final String TAG = "OperationManager";
  
  private OperationManager(OperationManagerCallbacks paramOperationManagerCallbacks, boolean paramBoolean)
  {
    super(paramOperationManagerCallbacks, paramBoolean);
  }
  
  public static OperationManager create(Activity paramActivity, OperationManagerCallbacks paramOperationManagerCallbacks)
  {
    return create(paramActivity, paramOperationManagerCallbacks, false);
  }
  
  public static OperationManager create(Activity paramActivity, OperationManagerCallbacks paramOperationManagerCallbacks, boolean paramBoolean)
  {
    String str = "Tags." + paramOperationManagerCallbacks.getClass().getName();
    FragmentManager localFragmentManager = paramActivity.getFragmentManager();
    PersistenceFragment localPersistenceFragment = (PersistenceFragment)localFragmentManager.findFragmentByTag(str);
    if (localPersistenceFragment == null)
    {
      if (paramBoolean) {
        Log.d("OperationManager", String.format("[Create Fragment] tag:%s", new Object[] { str }));
      }
      localPersistenceFragment = new PersistenceFragment();
      paramActivity = new OperationManager(paramOperationManagerCallbacks, paramBoolean);
      localPersistenceFragment.setOperationManager(paramActivity);
      localFragmentManager.beginTransaction().add(localPersistenceFragment, str).commit();
    }
    for (;;)
    {
      return paramActivity;
      if (paramBoolean) {
        Log.d("OperationManager", String.format("[Recover Fragment] tag:%s", new Object[] { str }));
      }
      paramActivity = (OperationManager)localPersistenceFragment.getOperationManager();
      if (paramActivity == null)
      {
        if (paramBoolean) {
          Log.d("OperationManager", String.format("[Create Manager] tag:%s", new Object[] { str }));
        }
        paramActivity = new OperationManager(paramOperationManagerCallbacks, paramBoolean);
        localPersistenceFragment.setOperationManager(paramActivity);
      }
      else
      {
        if (paramBoolean) {
          Log.d("OperationManager", String.format("[Recover Manager] tag:%s", new Object[] { str }));
        }
        paramActivity.mCallbacks = paramOperationManagerCallbacks;
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


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/robotoworks/mechanoid/ops/OperationManager.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */