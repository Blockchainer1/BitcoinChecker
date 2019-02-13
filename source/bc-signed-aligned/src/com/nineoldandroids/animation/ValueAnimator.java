package com.nineoldandroids.animation;

import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.util.AndroidRuntimeException;
import android.view.animation.AccelerateDecelerateInterpolator;
import android.view.animation.AnimationUtils;
import android.view.animation.Interpolator;
import android.view.animation.LinearInterpolator;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

public class ValueAnimator
  extends Animator
{
  static final int ANIMATION_FRAME = 1;
  static final int ANIMATION_START = 0;
  private static final long DEFAULT_FRAME_DELAY = 10L;
  public static final int INFINITE = -1;
  public static final int RESTART = 1;
  public static final int REVERSE = 2;
  static final int RUNNING = 1;
  static final int SEEKED = 2;
  static final int STOPPED = 0;
  private static ThreadLocal<AnimationHandler> sAnimationHandler = new ThreadLocal();
  private static final ThreadLocal<ArrayList<ValueAnimator>> sAnimations = new ThreadLocal()
  {
    protected ArrayList<ValueAnimator> initialValue()
    {
      return new ArrayList();
    }
  };
  private static final Interpolator sDefaultInterpolator;
  private static final ThreadLocal<ArrayList<ValueAnimator>> sDelayedAnims;
  private static final ThreadLocal<ArrayList<ValueAnimator>> sEndingAnims;
  private static final TypeEvaluator sFloatEvaluator = new FloatEvaluator();
  private static long sFrameDelay = 10L;
  private static final TypeEvaluator sIntEvaluator;
  private static final ThreadLocal<ArrayList<ValueAnimator>> sPendingAnimations = new ThreadLocal()
  {
    protected ArrayList<ValueAnimator> initialValue()
    {
      return new ArrayList();
    }
  };
  private static final ThreadLocal<ArrayList<ValueAnimator>> sReadyAnims;
  private float mCurrentFraction = 0.0F;
  private int mCurrentIteration = 0;
  private long mDelayStartTime;
  private long mDuration = 300L;
  boolean mInitialized = false;
  private Interpolator mInterpolator = sDefaultInterpolator;
  private boolean mPlayingBackwards = false;
  int mPlayingState = 0;
  private int mRepeatCount = 0;
  private int mRepeatMode = 1;
  private boolean mRunning = false;
  long mSeekTime = -1L;
  private long mStartDelay = 0L;
  long mStartTime;
  private boolean mStarted = false;
  private boolean mStartedDelay = false;
  private ArrayList<AnimatorUpdateListener> mUpdateListeners = null;
  PropertyValuesHolder[] mValues;
  HashMap<String, PropertyValuesHolder> mValuesMap;
  
  static
  {
    sDelayedAnims = new ThreadLocal()
    {
      protected ArrayList<ValueAnimator> initialValue()
      {
        return new ArrayList();
      }
    };
    sEndingAnims = new ThreadLocal()
    {
      protected ArrayList<ValueAnimator> initialValue()
      {
        return new ArrayList();
      }
    };
    sReadyAnims = new ThreadLocal()
    {
      protected ArrayList<ValueAnimator> initialValue()
      {
        return new ArrayList();
      }
    };
    sDefaultInterpolator = new AccelerateDecelerateInterpolator();
    sIntEvaluator = new IntEvaluator();
  }
  
  public static void clearAllAnimations()
  {
    ((ArrayList)sAnimations.get()).clear();
    ((ArrayList)sPendingAnimations.get()).clear();
    ((ArrayList)sDelayedAnims.get()).clear();
  }
  
  private boolean delayedAnimationFrame(long paramLong)
  {
    boolean bool = true;
    if (!this.mStartedDelay)
    {
      this.mStartedDelay = true;
      this.mDelayStartTime = paramLong;
      bool = false;
    }
    for (;;)
    {
      return bool;
      long l = paramLong - this.mDelayStartTime;
      if (l <= this.mStartDelay) {
        break;
      }
      this.mStartTime = (paramLong - (l - this.mStartDelay));
      this.mPlayingState = 1;
    }
  }
  
  private void endAnimation()
  {
    ((ArrayList)sAnimations.get()).remove(this);
    ((ArrayList)sPendingAnimations.get()).remove(this);
    ((ArrayList)sDelayedAnims.get()).remove(this);
    this.mPlayingState = 0;
    if ((this.mRunning) && (this.mListeners != null))
    {
      ArrayList localArrayList = (ArrayList)this.mListeners.clone();
      int i = localArrayList.size();
      for (int j = 0; j < i; j++) {
        ((Animator.AnimatorListener)localArrayList.get(j)).onAnimationEnd(this);
      }
    }
    this.mRunning = false;
    this.mStarted = false;
  }
  
  public static int getCurrentAnimationsCount()
  {
    return ((ArrayList)sAnimations.get()).size();
  }
  
  public static long getFrameDelay()
  {
    return sFrameDelay;
  }
  
  public static ValueAnimator ofFloat(float... paramVarArgs)
  {
    ValueAnimator localValueAnimator = new ValueAnimator();
    localValueAnimator.setFloatValues(paramVarArgs);
    return localValueAnimator;
  }
  
  public static ValueAnimator ofInt(int... paramVarArgs)
  {
    ValueAnimator localValueAnimator = new ValueAnimator();
    localValueAnimator.setIntValues(paramVarArgs);
    return localValueAnimator;
  }
  
  public static ValueAnimator ofObject(TypeEvaluator paramTypeEvaluator, Object... paramVarArgs)
  {
    ValueAnimator localValueAnimator = new ValueAnimator();
    localValueAnimator.setObjectValues(paramVarArgs);
    localValueAnimator.setEvaluator(paramTypeEvaluator);
    return localValueAnimator;
  }
  
  public static ValueAnimator ofPropertyValuesHolder(PropertyValuesHolder... paramVarArgs)
  {
    ValueAnimator localValueAnimator = new ValueAnimator();
    localValueAnimator.setValues(paramVarArgs);
    return localValueAnimator;
  }
  
  public static void setFrameDelay(long paramLong)
  {
    sFrameDelay = paramLong;
  }
  
  private void start(boolean paramBoolean)
  {
    if (Looper.myLooper() == null) {
      throw new AndroidRuntimeException("Animators may only be run on Looper threads");
    }
    this.mPlayingBackwards = paramBoolean;
    this.mCurrentIteration = 0;
    this.mPlayingState = 0;
    this.mStarted = true;
    this.mStartedDelay = false;
    ((ArrayList)sPendingAnimations.get()).add(this);
    if (this.mStartDelay == 0L)
    {
      setCurrentPlayTime(getCurrentPlayTime());
      this.mPlayingState = 0;
      this.mRunning = true;
      if (this.mListeners != null)
      {
        localObject = (ArrayList)this.mListeners.clone();
        int i = ((ArrayList)localObject).size();
        for (int j = 0; j < i; j++) {
          ((Animator.AnimatorListener)((ArrayList)localObject).get(j)).onAnimationStart(this);
        }
      }
    }
    AnimationHandler localAnimationHandler = (AnimationHandler)sAnimationHandler.get();
    Object localObject = localAnimationHandler;
    if (localAnimationHandler == null)
    {
      localObject = new AnimationHandler(null);
      sAnimationHandler.set(localObject);
    }
    ((AnimationHandler)localObject).sendEmptyMessage(0);
  }
  
  private void startAnimation()
  {
    initAnimation();
    ((ArrayList)sAnimations.get()).add(this);
    if ((this.mStartDelay > 0L) && (this.mListeners != null))
    {
      ArrayList localArrayList = (ArrayList)this.mListeners.clone();
      int i = localArrayList.size();
      for (int j = 0; j < i; j++) {
        ((Animator.AnimatorListener)localArrayList.get(j)).onAnimationStart(this);
      }
    }
  }
  
  public void addUpdateListener(AnimatorUpdateListener paramAnimatorUpdateListener)
  {
    if (this.mUpdateListeners == null) {
      this.mUpdateListeners = new ArrayList();
    }
    this.mUpdateListeners.add(paramAnimatorUpdateListener);
  }
  
  void animateValue(float paramFloat)
  {
    paramFloat = this.mInterpolator.getInterpolation(paramFloat);
    this.mCurrentFraction = paramFloat;
    int i = this.mValues.length;
    for (int j = 0; j < i; j++) {
      this.mValues[j].calculateValue(paramFloat);
    }
    if (this.mUpdateListeners != null)
    {
      i = this.mUpdateListeners.size();
      for (j = 0; j < i; j++) {
        ((AnimatorUpdateListener)this.mUpdateListeners.get(j)).onAnimationUpdate(this);
      }
    }
  }
  
  boolean animationFrame(long paramLong)
  {
    boolean bool1 = false;
    boolean bool2 = false;
    if (this.mPlayingState == 0)
    {
      this.mPlayingState = 1;
      if (this.mSeekTime >= 0L) {
        break label59;
      }
      this.mStartTime = paramLong;
    }
    for (;;)
    {
      switch (this.mPlayingState)
      {
      default: 
        return bool2;
        label59:
        this.mStartTime = (paramLong - this.mSeekTime);
        this.mSeekTime = -1L;
      }
    }
    if (this.mDuration > 0L) {}
    float f2;
    for (float f1 = (float)(paramLong - this.mStartTime) / (float)this.mDuration;; f1 = 1.0F)
    {
      bool2 = bool1;
      f2 = f1;
      if (f1 < 1.0F) {
        break label250;
      }
      if ((this.mCurrentIteration >= this.mRepeatCount) && (this.mRepeatCount != -1)) {
        break label282;
      }
      if (this.mListeners == null) {
        break;
      }
      int i = this.mListeners.size();
      for (int j = 0; j < i; j++) {
        ((Animator.AnimatorListener)this.mListeners.get(j)).onAnimationRepeat(this);
      }
    }
    if (this.mRepeatMode == 2)
    {
      if (this.mPlayingBackwards)
      {
        bool2 = false;
        label210:
        this.mPlayingBackwards = bool2;
      }
    }
    else
    {
      this.mCurrentIteration += (int)f1;
      f2 = f1 % 1.0F;
      this.mStartTime += this.mDuration;
      bool2 = bool1;
    }
    for (;;)
    {
      label250:
      f1 = f2;
      if (this.mPlayingBackwards) {
        f1 = 1.0F - f2;
      }
      animateValue(f1);
      break;
      bool2 = true;
      break label210;
      label282:
      bool2 = true;
      f2 = Math.min(f1, 1.0F);
    }
  }
  
  public void cancel()
  {
    if ((this.mPlayingState != 0) || (((ArrayList)sPendingAnimations.get()).contains(this)) || (((ArrayList)sDelayedAnims.get()).contains(this)))
    {
      if ((this.mRunning) && (this.mListeners != null))
      {
        Iterator localIterator = ((ArrayList)this.mListeners.clone()).iterator();
        while (localIterator.hasNext()) {
          ((Animator.AnimatorListener)localIterator.next()).onAnimationCancel(this);
        }
      }
      endAnimation();
    }
  }
  
  public ValueAnimator clone()
  {
    ValueAnimator localValueAnimator = (ValueAnimator)super.clone();
    Object localObject;
    int i;
    int j;
    if (this.mUpdateListeners != null)
    {
      localObject = this.mUpdateListeners;
      localValueAnimator.mUpdateListeners = new ArrayList();
      i = ((ArrayList)localObject).size();
      for (j = 0; j < i; j++) {
        localValueAnimator.mUpdateListeners.add(((ArrayList)localObject).get(j));
      }
    }
    localValueAnimator.mSeekTime = -1L;
    localValueAnimator.mPlayingBackwards = false;
    localValueAnimator.mCurrentIteration = 0;
    localValueAnimator.mInitialized = false;
    localValueAnimator.mPlayingState = 0;
    localValueAnimator.mStartedDelay = false;
    PropertyValuesHolder[] arrayOfPropertyValuesHolder = this.mValues;
    if (arrayOfPropertyValuesHolder != null)
    {
      i = arrayOfPropertyValuesHolder.length;
      localValueAnimator.mValues = new PropertyValuesHolder[i];
      localValueAnimator.mValuesMap = new HashMap(i);
      for (j = 0; j < i; j++)
      {
        localObject = arrayOfPropertyValuesHolder[j].clone();
        localValueAnimator.mValues[j] = localObject;
        localValueAnimator.mValuesMap.put(((PropertyValuesHolder)localObject).getPropertyName(), localObject);
      }
    }
    return localValueAnimator;
  }
  
  public void end()
  {
    if ((!((ArrayList)sAnimations.get()).contains(this)) && (!((ArrayList)sPendingAnimations.get()).contains(this)))
    {
      this.mStartedDelay = false;
      startAnimation();
      if ((this.mRepeatCount <= 0) || ((this.mRepeatCount & 0x1) != 1)) {
        break label82;
      }
      animateValue(0.0F);
    }
    for (;;)
    {
      endAnimation();
      return;
      if (this.mInitialized) {
        break;
      }
      initAnimation();
      break;
      label82:
      animateValue(1.0F);
    }
  }
  
  public float getAnimatedFraction()
  {
    return this.mCurrentFraction;
  }
  
  public Object getAnimatedValue()
  {
    if ((this.mValues != null) && (this.mValues.length > 0)) {}
    for (Object localObject = this.mValues[0].getAnimatedValue();; localObject = null) {
      return localObject;
    }
  }
  
  public Object getAnimatedValue(String paramString)
  {
    paramString = (PropertyValuesHolder)this.mValuesMap.get(paramString);
    if (paramString != null) {}
    for (paramString = paramString.getAnimatedValue();; paramString = null) {
      return paramString;
    }
  }
  
  public long getCurrentPlayTime()
  {
    if ((!this.mInitialized) || (this.mPlayingState == 0)) {}
    for (long l = 0L;; l = AnimationUtils.currentAnimationTimeMillis() - this.mStartTime) {
      return l;
    }
  }
  
  public long getDuration()
  {
    return this.mDuration;
  }
  
  public Interpolator getInterpolator()
  {
    return this.mInterpolator;
  }
  
  public int getRepeatCount()
  {
    return this.mRepeatCount;
  }
  
  public int getRepeatMode()
  {
    return this.mRepeatMode;
  }
  
  public long getStartDelay()
  {
    return this.mStartDelay;
  }
  
  public PropertyValuesHolder[] getValues()
  {
    return this.mValues;
  }
  
  void initAnimation()
  {
    if (!this.mInitialized)
    {
      int i = this.mValues.length;
      for (int j = 0; j < i; j++) {
        this.mValues[j].init();
      }
      this.mInitialized = true;
    }
  }
  
  public boolean isRunning()
  {
    boolean bool1 = true;
    boolean bool2 = bool1;
    if (this.mPlayingState != 1) {
      if (!this.mRunning) {
        break label23;
      }
    }
    label23:
    for (bool2 = bool1;; bool2 = false) {
      return bool2;
    }
  }
  
  public boolean isStarted()
  {
    return this.mStarted;
  }
  
  public void removeAllUpdateListeners()
  {
    if (this.mUpdateListeners == null) {}
    for (;;)
    {
      return;
      this.mUpdateListeners.clear();
      this.mUpdateListeners = null;
    }
  }
  
  public void removeUpdateListener(AnimatorUpdateListener paramAnimatorUpdateListener)
  {
    if (this.mUpdateListeners == null) {}
    for (;;)
    {
      return;
      this.mUpdateListeners.remove(paramAnimatorUpdateListener);
      if (this.mUpdateListeners.size() == 0) {
        this.mUpdateListeners = null;
      }
    }
  }
  
  public void reverse()
  {
    boolean bool;
    if (!this.mPlayingBackwards)
    {
      bool = true;
      this.mPlayingBackwards = bool;
      if (this.mPlayingState != 1) {
        break label53;
      }
      long l1 = AnimationUtils.currentAnimationTimeMillis();
      long l2 = this.mStartTime;
      this.mStartTime = (l1 - (this.mDuration - (l1 - l2)));
    }
    for (;;)
    {
      return;
      bool = false;
      break;
      label53:
      start(true);
    }
  }
  
  public void setCurrentPlayTime(long paramLong)
  {
    initAnimation();
    long l = AnimationUtils.currentAnimationTimeMillis();
    if (this.mPlayingState != 1)
    {
      this.mSeekTime = paramLong;
      this.mPlayingState = 2;
    }
    this.mStartTime = (l - paramLong);
    animationFrame(l);
  }
  
  public ValueAnimator setDuration(long paramLong)
  {
    if (paramLong < 0L) {
      throw new IllegalArgumentException("Animators cannot have negative duration: " + paramLong);
    }
    this.mDuration = paramLong;
    return this;
  }
  
  public void setEvaluator(TypeEvaluator paramTypeEvaluator)
  {
    if ((paramTypeEvaluator != null) && (this.mValues != null) && (this.mValues.length > 0)) {
      this.mValues[0].setEvaluator(paramTypeEvaluator);
    }
  }
  
  public void setFloatValues(float... paramVarArgs)
  {
    if ((paramVarArgs == null) || (paramVarArgs.length == 0)) {
      return;
    }
    if ((this.mValues == null) || (this.mValues.length == 0)) {
      setValues(new PropertyValuesHolder[] { PropertyValuesHolder.ofFloat("", paramVarArgs) });
    }
    for (;;)
    {
      this.mInitialized = false;
      break;
      this.mValues[0].setFloatValues(paramVarArgs);
    }
  }
  
  public void setIntValues(int... paramVarArgs)
  {
    if ((paramVarArgs == null) || (paramVarArgs.length == 0)) {
      return;
    }
    if ((this.mValues == null) || (this.mValues.length == 0)) {
      setValues(new PropertyValuesHolder[] { PropertyValuesHolder.ofInt("", paramVarArgs) });
    }
    for (;;)
    {
      this.mInitialized = false;
      break;
      this.mValues[0].setIntValues(paramVarArgs);
    }
  }
  
  public void setInterpolator(Interpolator paramInterpolator)
  {
    if (paramInterpolator != null) {}
    for (this.mInterpolator = paramInterpolator;; this.mInterpolator = new LinearInterpolator()) {
      return;
    }
  }
  
  public void setObjectValues(Object... paramVarArgs)
  {
    if ((paramVarArgs == null) || (paramVarArgs.length == 0)) {
      return;
    }
    if ((this.mValues == null) || (this.mValues.length == 0)) {
      setValues(new PropertyValuesHolder[] { PropertyValuesHolder.ofObject("", (TypeEvaluator)null, paramVarArgs) });
    }
    for (;;)
    {
      this.mInitialized = false;
      break;
      this.mValues[0].setObjectValues(paramVarArgs);
    }
  }
  
  public void setRepeatCount(int paramInt)
  {
    this.mRepeatCount = paramInt;
  }
  
  public void setRepeatMode(int paramInt)
  {
    this.mRepeatMode = paramInt;
  }
  
  public void setStartDelay(long paramLong)
  {
    this.mStartDelay = paramLong;
  }
  
  public void setValues(PropertyValuesHolder... paramVarArgs)
  {
    int i = paramVarArgs.length;
    this.mValues = paramVarArgs;
    this.mValuesMap = new HashMap(i);
    for (int j = 0; j < i; j++)
    {
      PropertyValuesHolder localPropertyValuesHolder = paramVarArgs[j];
      this.mValuesMap.put(localPropertyValuesHolder.getPropertyName(), localPropertyValuesHolder);
    }
    this.mInitialized = false;
  }
  
  public void start()
  {
    start(false);
  }
  
  public String toString()
  {
    String str1 = "ValueAnimator@" + Integer.toHexString(hashCode());
    String str2 = str1;
    if (this.mValues != null) {
      for (int i = 0;; i++)
      {
        str2 = str1;
        if (i >= this.mValues.length) {
          break;
        }
        str1 = str1 + "\n    " + this.mValues[i].toString();
      }
    }
    return str2;
  }
  
  private static class AnimationHandler
    extends Handler
  {
    public void handleMessage(Message paramMessage)
    {
      int i = 1;
      int j = 1;
      ArrayList localArrayList1 = (ArrayList)ValueAnimator.sAnimations.get();
      ArrayList localArrayList2 = (ArrayList)ValueAnimator.sDelayedAnims.get();
      switch (paramMessage.what)
      {
      }
      for (;;)
      {
        return;
        Object localObject1 = (ArrayList)ValueAnimator.sPendingAnimations.get();
        if ((localArrayList1.size() > 0) || (localArrayList2.size() > 0)) {
          j = 0;
        }
        i = j;
        if (((ArrayList)localObject1).size() > 0)
        {
          paramMessage = (ArrayList)((ArrayList)localObject1).clone();
          ((ArrayList)localObject1).clear();
          k = paramMessage.size();
          i = 0;
          label114:
          if (i < k)
          {
            localObject2 = (ValueAnimator)paramMessage.get(i);
            if (((ValueAnimator)localObject2).mStartDelay != 0L) {
              break label151;
            }
            ((ValueAnimator)localObject2).startAnimation();
          }
          for (;;)
          {
            i++;
            break label114;
            break;
            label151:
            localArrayList2.add(localObject2);
          }
        }
        long l = AnimationUtils.currentAnimationTimeMillis();
        Object localObject2 = (ArrayList)ValueAnimator.sReadyAnims.get();
        paramMessage = (ArrayList)ValueAnimator.sEndingAnims.get();
        int k = localArrayList2.size();
        for (j = 0; j < k; j++)
        {
          localObject1 = (ValueAnimator)localArrayList2.get(j);
          if (((ValueAnimator)localObject1).delayedAnimationFrame(l)) {
            ((ArrayList)localObject2).add(localObject1);
          }
        }
        k = ((ArrayList)localObject2).size();
        if (k > 0)
        {
          for (j = 0; j < k; j++)
          {
            localObject1 = (ValueAnimator)((ArrayList)localObject2).get(j);
            ((ValueAnimator)localObject1).startAnimation();
            ValueAnimator.access$802((ValueAnimator)localObject1, true);
            localArrayList2.remove(localObject1);
          }
          ((ArrayList)localObject2).clear();
        }
        j = localArrayList1.size();
        k = 0;
        while (k < j)
        {
          localObject2 = (ValueAnimator)localArrayList1.get(k);
          if (((ValueAnimator)localObject2).animationFrame(l)) {
            paramMessage.add(localObject2);
          }
          if (localArrayList1.size() == j)
          {
            k++;
          }
          else
          {
            j--;
            paramMessage.remove(localObject2);
          }
        }
        if (paramMessage.size() > 0)
        {
          for (j = 0; j < paramMessage.size(); j++) {
            ((ValueAnimator)paramMessage.get(j)).endAnimation();
          }
          paramMessage.clear();
        }
        if ((i != 0) && ((!localArrayList1.isEmpty()) || (!localArrayList2.isEmpty()))) {
          sendEmptyMessageDelayed(1, Math.max(0L, ValueAnimator.sFrameDelay - (AnimationUtils.currentAnimationTimeMillis() - l)));
        }
      }
    }
  }
  
  public static abstract interface AnimatorUpdateListener
  {
    public abstract void onAnimationUpdate(ValueAnimator paramValueAnimator);
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/nineoldandroids/animation/ValueAnimator.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */