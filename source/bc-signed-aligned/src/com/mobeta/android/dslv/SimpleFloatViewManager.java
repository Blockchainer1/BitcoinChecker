package com.mobeta.android.dslv;

import android.graphics.Bitmap;
import android.graphics.Point;
import android.view.View;
import android.view.ViewGroup.LayoutParams;
import android.widget.ImageView;
import android.widget.ListView;

public class SimpleFloatViewManager
  implements DragSortListView.FloatViewManager
{
  private int mFloatBGColor = -16777216;
  private Bitmap mFloatBitmap;
  private ImageView mImageView;
  private ListView mListView;
  
  public SimpleFloatViewManager(ListView paramListView)
  {
    this.mListView = paramListView;
  }
  
  public View onCreateFloatView(int paramInt)
  {
    Object localObject = this.mListView.getChildAt(this.mListView.getHeaderViewsCount() + paramInt - this.mListView.getFirstVisiblePosition());
    if (localObject == null) {}
    for (localObject = null;; localObject = this.mImageView)
    {
      return (View)localObject;
      ((View)localObject).setPressed(false);
      ((View)localObject).setDrawingCacheEnabled(true);
      this.mFloatBitmap = Bitmap.createBitmap(((View)localObject).getDrawingCache());
      ((View)localObject).setDrawingCacheEnabled(false);
      if (this.mImageView == null) {
        this.mImageView = new ImageView(this.mListView.getContext());
      }
      this.mImageView.setBackgroundColor(this.mFloatBGColor);
      this.mImageView.setPadding(0, 0, 0, 0);
      this.mImageView.setImageBitmap(this.mFloatBitmap);
      this.mImageView.setLayoutParams(new ViewGroup.LayoutParams(((View)localObject).getWidth(), ((View)localObject).getHeight()));
    }
  }
  
  public void onDestroyFloatView(View paramView)
  {
    ((ImageView)paramView).setImageDrawable(null);
    this.mFloatBitmap.recycle();
    this.mFloatBitmap = null;
  }
  
  public void onDragFloatView(View paramView, Point paramPoint1, Point paramPoint2) {}
  
  public void setBackgroundColor(int paramInt)
  {
    this.mFloatBGColor = paramInt;
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/mobeta/android/dslv/SimpleFloatViewManager.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */