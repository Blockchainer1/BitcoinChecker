package uk.co.senab.actionbarpulltorefresh.library.viewdelegates;

import android.view.View;
import android.webkit.WebView;

public class WebViewDelegate
  implements ViewDelegate
{
  public static final Class[] SUPPORTED_VIEW_CLASSES = { WebView.class };
  
  public boolean isReadyForPull(View paramView, float paramFloat1, float paramFloat2)
  {
    if (paramView.getScrollY() <= 0) {}
    for (boolean bool = true;; bool = false) {
      return bool;
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/uk/co/senab/actionbarpulltorefresh/library/viewdelegates/WebViewDelegate.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */