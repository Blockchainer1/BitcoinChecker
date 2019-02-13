package com.android.volley;

import android.content.Intent;

public class AuthFailureError
  extends VolleyError
{
  private Intent mResolutionIntent;
  
  public AuthFailureError() {}
  
  public AuthFailureError(Intent paramIntent)
  {
    this.mResolutionIntent = paramIntent;
  }
  
  public AuthFailureError(NetworkResponse paramNetworkResponse)
  {
    super(paramNetworkResponse);
  }
  
  public AuthFailureError(String paramString)
  {
    super(paramString);
  }
  
  public AuthFailureError(String paramString, Exception paramException)
  {
    super(paramString, paramException);
  }
  
  public String getMessage()
  {
    if (this.mResolutionIntent != null) {}
    for (String str = "User needs to (re)enter credentials.";; str = super.getMessage()) {
      return str;
    }
  }
  
  public Intent getResolutionIntent()
  {
    return this.mResolutionIntent;
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/android/volley/AuthFailureError.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */