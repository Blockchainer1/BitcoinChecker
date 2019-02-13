package com.robotoworks.mechanoid.ops;

import android.content.Intent;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;

public class OperationResult
  implements Parcelable
{
  public static final Parcelable.Creator<OperationResult> CREATOR = new Parcelable.Creator()
  {
    public OperationResult createFromParcel(Parcel paramAnonymousParcel)
    {
      return new OperationResult(paramAnonymousParcel, null);
    }
    
    public OperationResult[] newArray(int paramAnonymousInt)
    {
      return new OperationResult[paramAnonymousInt];
    }
  };
  public static final int RESULT_ERROR = 1;
  public static final int RESULT_OK = 0;
  private Throwable mError = null;
  private Intent mRequest = null;
  private int mResultCode = 0;
  private Bundle mResultData = null;
  
  public OperationResult(int paramInt)
  {
    this.mResultCode = paramInt;
  }
  
  private OperationResult(Parcel paramParcel)
  {
    this.mResultCode = paramParcel.readInt();
    this.mError = ((Throwable)paramParcel.readSerializable());
    this.mResultData = paramParcel.readBundle();
    this.mRequest = ((Intent)paramParcel.readParcelable(null));
  }
  
  public static OperationResult error(Throwable paramThrowable)
  {
    OperationResult localOperationResult = new OperationResult(1);
    localOperationResult.setError(paramThrowable);
    return localOperationResult;
  }
  
  public static OperationResult fromBundle(Bundle paramBundle)
  {
    paramBundle.setClassLoader(OperationResult.class.getClassLoader());
    return (OperationResult)paramBundle.getParcelable(OperationResult.class.getName());
  }
  
  public static OperationResult ok()
  {
    return new OperationResult(0);
  }
  
  public static OperationResult ok(Bundle paramBundle)
  {
    if (paramBundle == null) {
      throw new RuntimeException("bundle cannot be null");
    }
    OperationResult localOperationResult = new OperationResult(0);
    localOperationResult.setData(paramBundle);
    return localOperationResult;
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public int getCode()
  {
    return this.mResultCode;
  }
  
  public Bundle getData()
  {
    return this.mResultData;
  }
  
  public Throwable getError()
  {
    return this.mError;
  }
  
  public Intent getRequest()
  {
    return this.mRequest;
  }
  
  public boolean isOk()
  {
    if (this.mResultCode == 0) {}
    for (boolean bool = true;; bool = false) {
      return bool;
    }
  }
  
  public void setCode(int paramInt)
  {
    this.mResultCode = paramInt;
  }
  
  public void setData(Bundle paramBundle)
  {
    this.mResultData = paramBundle;
  }
  
  public void setError(Throwable paramThrowable)
  {
    this.mError = paramThrowable;
  }
  
  public void setRequest(Intent paramIntent)
  {
    this.mRequest = paramIntent;
  }
  
  public Bundle toBundle()
  {
    Bundle localBundle = new Bundle();
    localBundle.putParcelable(OperationResult.class.getName(), this);
    return localBundle;
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    paramParcel.writeInt(this.mResultCode);
    paramParcel.writeSerializable(this.mError);
    paramParcel.writeBundle(this.mResultData);
    paramParcel.writeParcelable(this.mRequest, 0);
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/robotoworks/mechanoid/ops/OperationResult.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */