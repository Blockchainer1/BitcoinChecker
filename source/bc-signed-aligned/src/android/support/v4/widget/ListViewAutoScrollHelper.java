package android.support.v4.widget;

import android.view.View;
import android.widget.ListView;

public class ListViewAutoScrollHelper
  extends AutoScrollHelper
{
  private final ListView mTarget;
  
  public ListViewAutoScrollHelper(ListView paramListView)
  {
    super(paramListView);
    this.mTarget = paramListView;
  }
  
  public boolean canTargetScrollHorizontally(int paramInt)
  {
    return false;
  }
  
  public boolean canTargetScrollVertically(int paramInt)
  {
    boolean bool1 = false;
    ListView localListView = this.mTarget;
    int i = localListView.getCount();
    boolean bool2;
    if (i == 0) {
      bool2 = bool1;
    }
    for (;;)
    {
      return bool2;
      int j = localListView.getChildCount();
      int k = localListView.getFirstVisiblePosition();
      if (paramInt > 0) {
        if (k + j >= i)
        {
          bool2 = bool1;
          if (localListView.getChildAt(j - 1).getBottom() <= localListView.getHeight()) {
            continue;
          }
        }
      }
      do
      {
        bool2 = true;
        break;
        bool2 = bool1;
        if (paramInt >= 0) {
          break;
        }
      } while ((k > 0) || (localListView.getChildAt(0).getTop() < 0));
      bool2 = bool1;
    }
  }
  
  public void scrollTargetBy(int paramInt1, int paramInt2)
  {
    ListView localListView = this.mTarget;
    paramInt1 = localListView.getFirstVisiblePosition();
    if (paramInt1 == -1) {}
    for (;;)
    {
      return;
      View localView = localListView.getChildAt(0);
      if (localView != null) {
        localListView.setSelectionFromTop(paramInt1, localView.getTop() - paramInt2);
      }
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/android/support/v4/widget/ListViewAutoScrollHelper.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */