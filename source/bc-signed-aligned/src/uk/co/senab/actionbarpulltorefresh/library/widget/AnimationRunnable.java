package uk.co.senab.actionbarpulltorefresh.library.widget;

import android.content.res.Resources;
import android.view.View;
import android.view.animation.AnimationUtils;
import android.view.animation.Interpolator;
import android.view.animation.LinearInterpolator;
import uk.co.senab.actionbarpulltorefresh.library.sdk.Compat;

class AnimationRunnable
  implements Runnable
{
  public static final int INFINITE = -1;
  private float mAnimationValue;
  private int mDuration;
  private Interpolator mInterpolator;
  private int mRepeatCount;
  private int mRunCount;
  private long mStartTime;
  private boolean mStarted;
  private AnimatorUpdateListener mUpdateListener;
  private final View mView;
  
  public AnimationRunnable(View paramView)
  {
    this.mView = paramView;
  }
  
  private void checkState()
  {
    if (this.mInterpolator == null) {
      this.mInterpolator = new LinearInterpolator();
    }
    if (this.mDuration == 0) {
      this.mDuration = this.mView.getResources().getInteger(17694720);
    }
  }
  
  private void restart()
  {
    this.mStartTime = AnimationUtils.currentAnimationTimeMillis();
    Compat.postOnAnimation(this.mView, this);
  }
  
  public void cancel()
  {
    this.mStarted = false;
    this.mView.removeCallbacks(this);
  }
  
  public float getAnimatedValue()
  {
    return this.mAnimationValue;
  }
  
  public boolean isStarted()
  {
    return this.mStarted;
  }
  
  public final void run()
  {
    if ((!this.mStarted) || (this.mUpdateListener == null)) {}
    for (;;)
    {
      return;
      long l = AnimationUtils.currentAnimationTimeMillis() - this.mStartTime;
      this.mAnimationValue = this.mInterpolator.getInterpolation((float)l / this.mDuration);
      this.mUpdateListener.onAnimationUpdate(this);
      if (l < this.mDuration)
      {
        Compat.postOnAnimation(this.mView, this);
      }
      else
      {
        int i = this.mRunCount + 1;
        this.mRunCount = i;
        if ((i < this.mRepeatCount) || (this.mRepeatCount == -1)) {
          restart();
        }
      }
    }
  }
  
  public void setDuration(int paramInt)
  {
    this.mDuration = paramInt;
  }
  
  public void setInterpolator(Interpolator paramInterpolator)
  {
    this.mInterpolator = paramInterpolator;
  }
  
  public void setRepeatCount(int paramInt)
  {
    this.mRepeatCount = paramInt;
  }
  
  public void setUpdateListener(AnimatorUpdateListener paramAnimatorUpdateListener)
  {
    this.mUpdateListener = paramAnimatorUpdateListener;
  }
  
  public void start()
  {
    if (this.mStarted) {}
    for (;;)
    {
      return;
      checkState();
      this.mRunCount = 0;
      this.mStarted = true;
      this.mStartTime = AnimationUtils.currentAnimationTimeMillis();
      Compat.postOnAnimation(this.mView, this);
    }
  }
  
  static abstract interface AnimatorUpdateListener
  {
    public abstract void onAnimationUpdate(AnimationRunnable paramAnimationRunnable);
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/uk/co/senab/actionbarpulltorefresh/library/widget/AnimationRunnable.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */