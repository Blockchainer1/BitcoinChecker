package uk.co.senab.actionbarpulltorefresh.library.sdk;

import android.animation.ValueAnimator;
import android.view.View;

class CompatV11
{
  static void postOnAnimation(View paramView, Runnable paramRunnable)
  {
    paramView.postDelayed(paramRunnable, ValueAnimator.getFrameDelay());
  }
  
  static void setAlpha(View paramView, float paramFloat)
  {
    paramView.setAlpha(paramFloat);
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/uk/co/senab/actionbarpulltorefresh/library/sdk/CompatV11.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */