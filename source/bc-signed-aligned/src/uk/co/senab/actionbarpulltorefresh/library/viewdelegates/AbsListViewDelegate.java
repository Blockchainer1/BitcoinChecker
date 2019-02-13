package uk.co.senab.actionbarpulltorefresh.library.viewdelegates;

import android.annotation.TargetApi;
import android.os.Build.VERSION;
import android.view.View;
import android.widget.AbsListView;

public class AbsListViewDelegate
  implements ViewDelegate
{
  public static final Class[] SUPPORTED_VIEW_CLASSES = { AbsListView.class };
  
  int getVerticalScrollbarPosition(AbsListView paramAbsListView)
  {
    if (Build.VERSION.SDK_INT >= 11) {}
    for (int i = CompatV11.getVerticalScrollbarPosition(paramAbsListView);; i = Compat.getVerticalScrollbarPosition(paramAbsListView)) {
      return i;
    }
  }
  
  boolean isFastScrollAlwaysVisible(AbsListView paramAbsListView)
  {
    if (Build.VERSION.SDK_INT >= 11) {}
    for (boolean bool = CompatV11.isFastScrollAlwaysVisible(paramAbsListView);; bool = Compat.isFastScrollAlwaysVisible(paramAbsListView)) {
      return bool;
    }
  }
  
  public boolean isReadyForPull(View paramView, float paramFloat1, float paramFloat2)
  {
    boolean bool1 = false;
    paramView = (AbsListView)paramView;
    if (paramView.getCount() == 0) {
      bool1 = true;
    }
    while (paramView.getFirstVisiblePosition() != 0)
    {
      bool2 = bool1;
      if (bool1)
      {
        bool2 = bool1;
        if (paramView.isFastScrollEnabled())
        {
          bool2 = bool1;
          if (!isFastScrollAlwaysVisible(paramView)) {}
        }
      }
      switch (getVerticalScrollbarPosition(paramView))
      {
      default: 
        bool2 = bool1;
        return bool2;
      }
    }
    View localView = paramView.getChildAt(0);
    if ((localView != null) && (localView.getTop() >= 0)) {}
    for (bool1 = true;; bool1 = false) {
      break;
    }
    if (paramFloat1 < paramView.getRight() - paramView.getVerticalScrollbarWidth()) {}
    for (boolean bool2 = true;; bool2 = false) {
      break;
    }
    if (paramFloat1 > paramView.getVerticalScrollbarWidth()) {}
    for (bool2 = true;; bool2 = false) {
      break;
    }
  }
  
  static class Compat
  {
    static int getVerticalScrollbarPosition(AbsListView paramAbsListView)
    {
      return 2;
    }
    
    static boolean isFastScrollAlwaysVisible(AbsListView paramAbsListView)
    {
      return false;
    }
  }
  
  @TargetApi(11)
  static class CompatV11
  {
    static int getVerticalScrollbarPosition(AbsListView paramAbsListView)
    {
      return paramAbsListView.getVerticalScrollbarPosition();
    }
    
    static boolean isFastScrollAlwaysVisible(AbsListView paramAbsListView)
    {
      return paramAbsListView.isFastScrollAlwaysVisible();
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/uk/co/senab/actionbarpulltorefresh/library/viewdelegates/AbsListViewDelegate.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */