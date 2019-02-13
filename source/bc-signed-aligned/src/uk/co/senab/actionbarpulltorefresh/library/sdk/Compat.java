package uk.co.senab.actionbarpulltorefresh.library.sdk;

import android.os.Build.VERSION;
import android.view.View;

public class Compat
{
  public static void postOnAnimation(View paramView, Runnable paramRunnable)
  {
    if (Build.VERSION.SDK_INT >= 16) {
      CompatV16.postOnAnimation(paramView, paramRunnable);
    }
    for (;;)
    {
      return;
      if (Build.VERSION.SDK_INT >= 11) {
        CompatV11.postOnAnimation(paramView, paramRunnable);
      } else {
        CompatBase.postOnAnimation(paramView, paramRunnable);
      }
    }
  }
  
  public static void setAlpha(View paramView, float paramFloat)
  {
    if (Build.VERSION.SDK_INT >= 11) {
      CompatV11.setAlpha(paramView, paramFloat);
    }
    for (;;)
    {
      return;
      CompatBase.setAlpha(paramView, paramFloat);
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/uk/co/senab/actionbarpulltorefresh/library/sdk/Compat.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */