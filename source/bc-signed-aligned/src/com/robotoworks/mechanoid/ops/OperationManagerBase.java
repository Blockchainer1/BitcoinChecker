package com.robotoworks.mechanoid.ops;

import android.content.Intent;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.util.Log;
import android.util.SparseArray;
import java.util.LinkedList;
import java.util.Queue;

@Deprecated
public abstract class OperationManagerBase
{
  private static final String TAG = "OperationManager";
  OperationManagerCallbacks mCallbacks;
  private boolean mEnableLogging;
  private SparseArray<OpInfo> mOperations = new SparseArray();
  private Queue<Runnable> mPendingOperations = new LinkedList();
  private OperationServiceListener mServiceListener = new OperationServiceListener()
  {
    public void onOperationComplete(int paramAnonymousInt, OperationResult paramAnonymousOperationResult)
    {
      OperationManagerBase.OpInfo localOpInfo = OperationManagerBase.this.findOperationInfoByRequestId(paramAnonymousInt);
      if (localOpInfo == null) {}
      for (;;)
      {
        return;
        localOpInfo.mResult = paramAnonymousOperationResult;
        if (OperationManagerBase.this.invokeOnOperationComplete(localOpInfo.mUserCode, paramAnonymousOperationResult, false))
        {
          localOpInfo.mCallbackInvoked = true;
          if (OperationManagerBase.this.mEnableLogging) {
            Log.d("OperationManager", String.format("[Operation Complete] request id:%s, user code:%s", new Object[] { Integer.valueOf(paramAnonymousInt), Integer.valueOf(localOpInfo.mUserCode) }));
          }
        }
      }
    }
  };
  private boolean mStarted = false;
  private String mStateKey;
  
  protected OperationManagerBase(OperationManagerCallbacks paramOperationManagerCallbacks, boolean paramBoolean)
  {
    this.mCallbacks = paramOperationManagerCallbacks;
    this.mEnableLogging = paramBoolean;
    this.mStateKey = "com.robotoworks.mechanoid.ops.OperationManager.State";
  }
  
  private void ensureCallbacks()
  {
    int i = 0;
    if (i < this.mOperations.size())
    {
      OpInfo localOpInfo = (OpInfo)this.mOperations.valueAt(i);
      if (Ops.isOperationPending(localOpInfo.mId))
      {
        if (this.mEnableLogging) {
          Log.d("OperationManager", String.format("[Operation Pending] request id: %s, user code:%s", new Object[] { Integer.valueOf(localOpInfo.mId), Integer.valueOf(localOpInfo.mUserCode) }));
        }
        invokeOnOperationPending(localOpInfo.mUserCode);
      }
      for (;;)
      {
        i++;
        break;
        OperationResult localOperationResult = (OperationResult)Ops.getLog().get(Integer.valueOf(localOpInfo.mId));
        if (localOperationResult != null)
        {
          localOpInfo.mResult = localOperationResult;
          if ((!localOpInfo.mCallbackInvoked) && (invokeOnOperationComplete(localOpInfo.mUserCode, localOpInfo.mResult, false)))
          {
            localOpInfo.mCallbackInvoked = true;
            if (this.mEnableLogging) {
              Log.d("OperationManager", String.format("[Operation Complete] request id: %s, user code:%s", new Object[] { Integer.valueOf(localOpInfo.mId), Integer.valueOf(localOpInfo.mUserCode) }));
            }
          }
        }
      }
    }
  }
  
  private void executePendingOperations()
  {
    while (this.mPendingOperations.peek() != null) {
      ((Runnable)this.mPendingOperations.poll()).run();
    }
  }
  
  private OpInfo findOperationInfoByRequestId(int paramInt)
  {
    int i = 0;
    OpInfo localOpInfo;
    if (i < this.mOperations.size())
    {
      localOpInfo = (OpInfo)this.mOperations.valueAt(i);
      if (localOpInfo.mId != paramInt) {}
    }
    for (;;)
    {
      return localOpInfo;
      i++;
      break;
      localOpInfo = null;
    }
  }
  
  private void queuePendingOperation(final Intent paramIntent, final int paramInt, final boolean paramBoolean)
  {
    this.mPendingOperations.add(new Runnable()
    {
      public void run()
      {
        OperationManagerBase.this.execute(paramIntent, paramInt, paramBoolean);
      }
    });
  }
  
  public void execute(Intent paramIntent, int paramInt, boolean paramBoolean)
  {
    if (paramIntent == null) {
      Log.d("OperationManager", String.format("[Operation Null] operationintent argument was null, code:%s", new Object[] { Integer.valueOf(paramInt) }));
    }
    for (;;)
    {
      return;
      if (!this.mStarted)
      {
        if (this.mEnableLogging) {
          Log.d("OperationManager", String.format("[Queue Operation] manager not started, queueing, user code:%s", new Object[] { Integer.valueOf(paramInt) }));
        }
        queuePendingOperation(paramIntent, paramInt, paramBoolean);
      }
      else
      {
        OpInfo localOpInfo = (OpInfo)this.mOperations.get(paramInt);
        if ((paramBoolean) || (localOpInfo == null))
        {
          this.mOperations.delete(paramInt);
          if (this.mEnableLogging) {
            Log.d("OperationManager", String.format("[Operation Pending] user code:%s", new Object[] { Integer.valueOf(paramInt) }));
          }
          invokeOnOperationPending(paramInt);
          if (this.mEnableLogging) {
            Log.d("OperationManager", String.format("[Execute Operation] user code:%s", new Object[] { Integer.valueOf(paramInt) }));
          }
          localOpInfo = new OpInfo();
          localOpInfo.mUserCode = paramInt;
          localOpInfo.mIntent = paramIntent;
          this.mOperations.put(paramInt, localOpInfo);
          localOpInfo.mId = Ops.execute(paramIntent);
        }
        else if (localOpInfo.mResult != null)
        {
          if (this.mEnableLogging) {
            Log.d("OperationManager", String.format("[Operation Complete] request id: %s, user code:%s, from cache:%s", new Object[] { Integer.valueOf(localOpInfo.mId), Integer.valueOf(localOpInfo.mUserCode), Boolean.valueOf(localOpInfo.mCallbackInvoked) }));
          }
          if (invokeOnOperationComplete(localOpInfo.mUserCode, localOpInfo.mResult, localOpInfo.mCallbackInvoked)) {
            localOpInfo.mCallbackInvoked = true;
          }
        }
      }
    }
  }
  
  protected boolean invokeOnOperationComplete(int paramInt, OperationResult paramOperationResult, boolean paramBoolean)
  {
    if (this.mCallbacks == null) {}
    for (paramBoolean = false;; paramBoolean = true)
    {
      return paramBoolean;
      this.mCallbacks.onOperationComplete(paramInt, paramOperationResult, paramBoolean);
    }
  }
  
  protected boolean invokeOnOperationPending(int paramInt)
  {
    if (this.mCallbacks == null) {}
    for (boolean bool = false;; bool = true)
    {
      return bool;
      this.mCallbacks.onOperationPending(paramInt);
    }
  }
  
  public void removeCallbacks()
  {
    this.mCallbacks = null;
  }
  
  void restoreState(Bundle paramBundle)
  {
    if ((paramBundle != null) && (paramBundle.getBundle(this.mStateKey) != null))
    {
      this.mOperations = paramBundle.getSparseParcelableArray("operations");
      if (this.mEnableLogging) {
        Log.d("OperationManager", String.format("[Restoring State]", new Object[0]));
      }
    }
  }
  
  void saveState(Bundle paramBundle)
  {
    if (this.mEnableLogging) {
      Log.d("OperationManager", String.format("[Saving State]", new Object[0]));
    }
    Bundle localBundle = new Bundle();
    paramBundle.putSparseParcelableArray("operations", this.mOperations);
    paramBundle.putBundle(this.mStateKey, localBundle);
  }
  
  public void setCallbacks(OperationManagerCallbacks paramOperationManagerCallbacks)
  {
    this.mCallbacks = paramOperationManagerCallbacks;
  }
  
  void start()
  {
    if (this.mStarted) {}
    for (;;)
    {
      return;
      if (this.mEnableLogging) {
        Log.d("OperationManager", String.format("[Starting]", new Object[0]));
      }
      Ops.bindListener(this.mServiceListener);
      this.mStarted = true;
      ensureCallbacks();
      executePendingOperations();
    }
  }
  
  void stop()
  {
    if (!this.mStarted) {}
    for (;;)
    {
      return;
      this.mStarted = false;
      if (this.mEnableLogging) {
        Log.d("OperationManager", String.format("[Stopping]", new Object[0]));
      }
      Ops.unbindListener(this.mServiceListener);
    }
  }
  
  static class OpInfo
    implements Parcelable
  {
    public static final Parcelable.Creator<OpInfo> CREATOR = new Parcelable.Creator()
    {
      public OperationManagerBase.OpInfo createFromParcel(Parcel paramAnonymousParcel)
      {
        return new OperationManagerBase.OpInfo(paramAnonymousParcel);
      }
      
      public OperationManagerBase.OpInfo[] newArray(int paramAnonymousInt)
      {
        return new OperationManagerBase.OpInfo[paramAnonymousInt];
      }
    };
    boolean mCallbackInvoked = false;
    int mId = 0;
    public Intent mIntent;
    OperationResult mResult = null;
    int mUserCode = 0;
    
    OpInfo() {}
    
    OpInfo(Parcel paramParcel)
    {
      this.mUserCode = paramParcel.readInt();
      this.mId = paramParcel.readInt();
      if (paramParcel.readInt() > 0) {
        bool = true;
      }
      this.mCallbackInvoked = bool;
      this.mResult = ((OperationResult)paramParcel.readParcelable(OperationResult.class.getClassLoader()));
      this.mIntent = ((Intent)paramParcel.readParcelable(Intent.class.getClassLoader()));
    }
    
    public int describeContents()
    {
      return 0;
    }
    
    public void writeToParcel(Parcel paramParcel, int paramInt)
    {
      paramParcel.writeInt(this.mUserCode);
      paramParcel.writeInt(this.mId);
      if (this.mCallbackInvoked) {}
      for (paramInt = 1;; paramInt = 0)
      {
        paramParcel.writeInt(paramInt);
        paramParcel.writeParcelable(this.mResult, 0);
        paramParcel.writeParcelable(this.mIntent, 0);
        return;
      }
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/robotoworks/mechanoid/ops/OperationManagerBase.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */