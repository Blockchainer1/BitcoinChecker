package com.nineoldandroids.animation;

import android.view.animation.Interpolator;
import java.util.ArrayList;

public abstract class Animator
  implements Cloneable
{
  ArrayList<AnimatorListener> mListeners = null;
  
  public void addListener(AnimatorListener paramAnimatorListener)
  {
    if (this.mListeners == null) {
      this.mListeners = new ArrayList();
    }
    this.mListeners.add(paramAnimatorListener);
  }
  
  public void cancel() {}
  
  public Animator clone()
  {
    try
    {
      Animator localAnimator = (Animator)super.clone();
      if (this.mListeners != null)
      {
        ArrayList localArrayList1 = this.mListeners;
        ArrayList localArrayList2 = new java/util/ArrayList;
        localArrayList2.<init>();
        localAnimator.mListeners = localArrayList2;
        int i = localArrayList1.size();
        for (int j = 0; j < i; j++) {
          localAnimator.mListeners.add(localArrayList1.get(j));
        }
      }
      return localCloneNotSupportedException;
    }
    catch (CloneNotSupportedException localCloneNotSupportedException)
    {
      throw new AssertionError();
    }
  }
  
  public void end() {}
  
  public abstract long getDuration();
  
  public ArrayList<AnimatorListener> getListeners()
  {
    return this.mListeners;
  }
  
  public abstract long getStartDelay();
  
  public abstract boolean isRunning();
  
  public boolean isStarted()
  {
    return isRunning();
  }
  
  public void removeAllListeners()
  {
    if (this.mListeners != null)
    {
      this.mListeners.clear();
      this.mListeners = null;
    }
  }
  
  public void removeListener(AnimatorListener paramAnimatorListener)
  {
    if (this.mListeners == null) {}
    for (;;)
    {
      return;
      this.mListeners.remove(paramAnimatorListener);
      if (this.mListeners.size() == 0) {
        this.mListeners = null;
      }
    }
  }
  
  public abstract Animator setDuration(long paramLong);
  
  public abstract void setInterpolator(Interpolator paramInterpolator);
  
  public abstract void setStartDelay(long paramLong);
  
  public void setTarget(Object paramObject) {}
  
  public void setupEndValues() {}
  
  public void setupStartValues() {}
  
  public void start() {}
  
  public static abstract interface AnimatorListener
  {
    public abstract void onAnimationCancel(Animator paramAnimator);
    
    public abstract void onAnimationEnd(Animator paramAnimator);
    
    public abstract void onAnimationRepeat(Animator paramAnimator);
    
    public abstract void onAnimationStart(Animator paramAnimator);
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/nineoldandroids/animation/Animator.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */