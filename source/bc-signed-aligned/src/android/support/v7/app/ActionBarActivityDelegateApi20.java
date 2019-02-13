package android.support.v7.app;

import android.view.Window.Callback;

class ActionBarActivityDelegateApi20
  extends ActionBarActivityDelegateJBMR2
{
  ActionBarActivityDelegateApi20(ActionBarActivity paramActionBarActivity)
  {
    super(paramActionBarActivity);
  }
  
  Window.Callback createWindowCallbackWrapper(Window.Callback paramCallback)
  {
    return new WindowCallbackWrapperApi20(paramCallback);
  }
  
  class WindowCallbackWrapperApi20
    extends ActionBarActivityDelegateICS.WindowCallbackWrapper
  {
    WindowCallbackWrapperApi20(Window.Callback paramCallback)
    {
      super(paramCallback);
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/android/support/v7/app/ActionBarActivityDelegateApi20.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */