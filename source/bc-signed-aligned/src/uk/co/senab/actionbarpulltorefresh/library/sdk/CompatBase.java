package uk.co.senab.actionbarpulltorefresh.library.sdk;

import android.view.View;

class CompatBase
{
  static void postOnAnimation(View paramView, Runnable paramRunnable)
  {
    paramView.postDelayed(paramRunnable, 10L);
  }
  
  static void setAlpha(View paramView, float paramFloat) {}
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/uk/co/senab/actionbarpulltorefresh/library/sdk/CompatBase.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */