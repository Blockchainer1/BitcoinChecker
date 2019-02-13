package uk.co.senab.actionbarpulltorefresh.library.widget;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.RectF;
import android.util.AttributeSet;
import android.util.DisplayMetrics;
import android.view.View;
import android.view.View.MeasureSpec;
import uk.co.senab.actionbarpulltorefresh.library.R.color;

public class PullToRefreshProgressBar
  extends View
  implements AnimationRunnable.AnimatorUpdateListener
{
  private static final int BASE_DURATION_MS = 450;
  private static final int BASE_SEGMENT_COUNT = 3;
  private static final int BASE_WIDTH_DP = 300;
  private static final int DEFAULT_BAR_HEIGHT_DP = 4;
  private static final int DEFAULT_INDETERMINATE_BAR_SPACING_DP = 5;
  private static final int DEFAULT_PROGRESS_MAX = 10000;
  private final float mDensity = getResources().getDisplayMetrics().density;
  private final RectF mDrawRect = new RectF();
  private boolean mIndeterminate;
  private final AnimationRunnable mIndeterminateAnimator = new AnimationRunnable(this);
  private final int mIndeterminateBarSpacing = Math.round(5.0F * this.mDensity);
  private final Paint mPaint = new Paint();
  private int mProgress;
  private int mProgressBarColor;
  private float mProgressBarRadiusPx;
  private int mProgressMax = 10000;
  private int mSegmentCount;
  
  public PullToRefreshProgressBar(Context paramContext)
  {
    this(paramContext, null);
  }
  
  public PullToRefreshProgressBar(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    this.mIndeterminateAnimator.setRepeatCount(-1);
    this.mIndeterminateAnimator.setUpdateListener(this);
    this.mPaint.setAntiAlias(true);
    this.mPaint.setColor(getResources().getColor(R.color.default_progress_bar_color));
  }
  
  void drawIndeterminate(Canvas paramCanvas)
  {
    if (!this.mIndeterminateAnimator.isStarted()) {}
    for (;;)
    {
      return;
      this.mPaint.setColor(this.mProgressBarColor);
      float f1 = this.mIndeterminateAnimator.getAnimatedValue();
      float f2 = paramCanvas.getWidth() / this.mSegmentCount;
      for (int i = -1; i < this.mSegmentCount; i++)
      {
        float f3 = (i + f1) * f2;
        float f4 = this.mIndeterminateBarSpacing;
        this.mDrawRect.set(f3, 0.0F, f3 + f2 - f4, paramCanvas.getHeight());
        paramCanvas.drawRect(this.mDrawRect, this.mPaint);
      }
    }
  }
  
  void drawProgress(Canvas paramCanvas)
  {
    this.mPaint.setColor(this.mProgressBarColor);
    float f1 = Math.max(Math.min(this.mProgress / this.mProgressMax, 1.0F), 0.0F) * paramCanvas.getWidth();
    float f2 = (paramCanvas.getWidth() - f1) / 2.0F;
    this.mDrawRect.set(f2, 0.0F, f2 + f1, paramCanvas.getHeight());
    paramCanvas.drawRoundRect(this.mDrawRect, this.mProgressBarRadiusPx, this.mProgressBarRadiusPx, this.mPaint);
  }
  
  public int getMax()
  {
    try
    {
      int i = this.mProgressMax;
      return i;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public boolean isIndeterminate()
  {
    try
    {
      boolean bool = this.mIndeterminate;
      return bool;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public void onAnimationUpdate(AnimationRunnable paramAnimationRunnable)
  {
    invalidate();
  }
  
  protected void onDraw(Canvas paramCanvas)
  {
    if (this.mIndeterminate) {
      drawIndeterminate(paramCanvas);
    }
    for (;;)
    {
      return;
      drawProgress(paramCanvas);
    }
  }
  
  protected void onLayout(boolean paramBoolean, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    if (paramBoolean)
    {
      float f = getWidth() / this.mDensity / 300.0F;
      this.mIndeterminateAnimator.setDuration((int)(450.0F * (0.3F * (f - 1.0F) + 1.0F)));
      this.mSegmentCount = ((int)(3.0F * (0.1F * (f - 1.0F) + 1.0F)));
    }
  }
  
  protected void onMeasure(int paramInt1, int paramInt2)
  {
    int i = View.MeasureSpec.getSize(paramInt1);
    paramInt1 = View.MeasureSpec.getSize(paramInt2);
    switch (View.MeasureSpec.getMode(paramInt2))
    {
    default: 
      paramInt1 = Math.round(this.mDensity * 4.0F);
    }
    for (;;)
    {
      setMeasuredDimension(i, paramInt1);
      return;
      continue;
      paramInt1 = Math.min(paramInt1, Math.round(this.mDensity * 4.0F));
    }
  }
  
  protected void onVisibilityChanged(View paramView, int paramInt)
  {
    super.onVisibilityChanged(paramView, paramInt);
    if (this.mIndeterminate)
    {
      if (paramInt != 0) {
        break label25;
      }
      this.mIndeterminateAnimator.start();
    }
    for (;;)
    {
      return;
      label25:
      this.mIndeterminateAnimator.cancel();
    }
  }
  
  public void setIndeterminate(boolean paramBoolean)
  {
    try
    {
      setProgressState(this.mProgress, this.mProgressMax, paramBoolean);
      return;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public void setMax(int paramInt)
  {
    try
    {
      setProgressState(this.mProgress, paramInt, this.mIndeterminate);
      return;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public void setProgress(int paramInt)
  {
    try
    {
      setProgressState(paramInt, this.mProgressMax, this.mIndeterminate);
      return;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public void setProgressBarColor(int paramInt)
  {
    try
    {
      this.mProgressBarColor = paramInt;
      invalidate();
      return;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public void setProgressBarCornerRadius(float paramFloat)
  {
    try
    {
      this.mProgressBarRadiusPx = paramFloat;
      invalidate();
      return;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  void setProgressState(int paramInt1, int paramInt2, boolean paramBoolean)
  {
    int i = 0;
    if (this.mIndeterminate != paramBoolean)
    {
      this.mIndeterminate = paramBoolean;
      if (paramBoolean != this.mIndeterminateAnimator.isStarted())
      {
        if (!this.mIndeterminate) {
          break label112;
        }
        this.mIndeterminateAnimator.start();
      }
    }
    for (;;)
    {
      i = 1;
      int j = i;
      if (paramInt1 != this.mProgress)
      {
        this.mProgress = paramInt1;
        j = i;
        if (!this.mIndeterminate) {
          j = 1;
        }
      }
      paramInt1 = j;
      if (paramInt2 != this.mProgressMax)
      {
        this.mProgressMax = paramInt2;
        paramInt1 = j;
        if (!this.mIndeterminate) {
          paramInt1 = 1;
        }
      }
      if (paramInt1 != 0) {
        invalidate();
      }
      return;
      label112:
      this.mIndeterminateAnimator.cancel();
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/uk/co/senab/actionbarpulltorefresh/library/widget/PullToRefreshProgressBar.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */