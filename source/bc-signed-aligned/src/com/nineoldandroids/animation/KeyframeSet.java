package com.nineoldandroids.animation;

import android.view.animation.Interpolator;
import java.util.ArrayList;
import java.util.Arrays;

class KeyframeSet
{
  TypeEvaluator mEvaluator;
  Keyframe mFirstKeyframe;
  Interpolator mInterpolator;
  ArrayList<Keyframe> mKeyframes;
  Keyframe mLastKeyframe;
  int mNumKeyframes;
  
  public KeyframeSet(Keyframe... paramVarArgs)
  {
    this.mNumKeyframes = paramVarArgs.length;
    this.mKeyframes = new ArrayList();
    this.mKeyframes.addAll(Arrays.asList(paramVarArgs));
    this.mFirstKeyframe = ((Keyframe)this.mKeyframes.get(0));
    this.mLastKeyframe = ((Keyframe)this.mKeyframes.get(this.mNumKeyframes - 1));
    this.mInterpolator = this.mLastKeyframe.getInterpolator();
  }
  
  public static KeyframeSet ofFloat(float... paramVarArgs)
  {
    int i = paramVarArgs.length;
    Keyframe.FloatKeyframe[] arrayOfFloatKeyframe = new Keyframe.FloatKeyframe[Math.max(i, 2)];
    if (i == 1)
    {
      arrayOfFloatKeyframe[0] = ((Keyframe.FloatKeyframe)Keyframe.ofFloat(0.0F));
      arrayOfFloatKeyframe[1] = ((Keyframe.FloatKeyframe)Keyframe.ofFloat(1.0F, paramVarArgs[0]));
    }
    for (;;)
    {
      return new FloatKeyframeSet(arrayOfFloatKeyframe);
      arrayOfFloatKeyframe[0] = ((Keyframe.FloatKeyframe)Keyframe.ofFloat(0.0F, paramVarArgs[0]));
      for (int j = 1; j < i; j++) {
        arrayOfFloatKeyframe[j] = ((Keyframe.FloatKeyframe)Keyframe.ofFloat(j / (i - 1), paramVarArgs[j]));
      }
    }
  }
  
  public static KeyframeSet ofInt(int... paramVarArgs)
  {
    int i = paramVarArgs.length;
    Keyframe.IntKeyframe[] arrayOfIntKeyframe = new Keyframe.IntKeyframe[Math.max(i, 2)];
    if (i == 1)
    {
      arrayOfIntKeyframe[0] = ((Keyframe.IntKeyframe)Keyframe.ofInt(0.0F));
      arrayOfIntKeyframe[1] = ((Keyframe.IntKeyframe)Keyframe.ofInt(1.0F, paramVarArgs[0]));
    }
    for (;;)
    {
      return new IntKeyframeSet(arrayOfIntKeyframe);
      arrayOfIntKeyframe[0] = ((Keyframe.IntKeyframe)Keyframe.ofInt(0.0F, paramVarArgs[0]));
      for (int j = 1; j < i; j++) {
        arrayOfIntKeyframe[j] = ((Keyframe.IntKeyframe)Keyframe.ofInt(j / (i - 1), paramVarArgs[j]));
      }
    }
  }
  
  public static KeyframeSet ofKeyframe(Keyframe... paramVarArgs)
  {
    int i = paramVarArgs.length;
    int j = 0;
    int k = 0;
    int m = 0;
    int n = 0;
    if (n < i)
    {
      if ((paramVarArgs[n] instanceof Keyframe.FloatKeyframe)) {
        j = 1;
      }
      for (;;)
      {
        n++;
        break;
        if ((paramVarArgs[n] instanceof Keyframe.IntKeyframe)) {
          k = 1;
        } else {
          m = 1;
        }
      }
    }
    Object localObject;
    if ((j != 0) && (k == 0) && (m == 0))
    {
      localObject = new Keyframe.FloatKeyframe[i];
      for (n = 0; n < i; n++) {
        localObject[n] = ((Keyframe.FloatKeyframe)paramVarArgs[n]);
      }
      paramVarArgs = new FloatKeyframeSet((Keyframe.FloatKeyframe[])localObject);
    }
    for (;;)
    {
      return paramVarArgs;
      if ((k != 0) && (j == 0) && (m == 0))
      {
        localObject = new Keyframe.IntKeyframe[i];
        for (n = 0; n < i; n++) {
          localObject[n] = ((Keyframe.IntKeyframe)paramVarArgs[n]);
        }
        paramVarArgs = new IntKeyframeSet((Keyframe.IntKeyframe[])localObject);
      }
      else
      {
        paramVarArgs = new KeyframeSet(paramVarArgs);
      }
    }
  }
  
  public static KeyframeSet ofObject(Object... paramVarArgs)
  {
    int i = paramVarArgs.length;
    Keyframe.ObjectKeyframe[] arrayOfObjectKeyframe = new Keyframe.ObjectKeyframe[Math.max(i, 2)];
    if (i == 1)
    {
      arrayOfObjectKeyframe[0] = ((Keyframe.ObjectKeyframe)Keyframe.ofObject(0.0F));
      arrayOfObjectKeyframe[1] = ((Keyframe.ObjectKeyframe)Keyframe.ofObject(1.0F, paramVarArgs[0]));
    }
    for (;;)
    {
      return new KeyframeSet(arrayOfObjectKeyframe);
      arrayOfObjectKeyframe[0] = ((Keyframe.ObjectKeyframe)Keyframe.ofObject(0.0F, paramVarArgs[0]));
      for (int j = 1; j < i; j++) {
        arrayOfObjectKeyframe[j] = ((Keyframe.ObjectKeyframe)Keyframe.ofObject(j / (i - 1), paramVarArgs[j]));
      }
    }
  }
  
  public KeyframeSet clone()
  {
    ArrayList localArrayList = this.mKeyframes;
    int i = this.mKeyframes.size();
    Keyframe[] arrayOfKeyframe = new Keyframe[i];
    for (int j = 0; j < i; j++) {
      arrayOfKeyframe[j] = ((Keyframe)localArrayList.get(j)).clone();
    }
    return new KeyframeSet(arrayOfKeyframe);
  }
  
  public Object getValue(float paramFloat)
  {
    float f;
    Object localObject1;
    if (this.mNumKeyframes == 2)
    {
      f = paramFloat;
      if (this.mInterpolator != null) {
        f = this.mInterpolator.getInterpolation(paramFloat);
      }
      localObject1 = this.mEvaluator.evaluate(f, this.mFirstKeyframe.getValue(), this.mLastKeyframe.getValue());
    }
    for (;;)
    {
      return localObject1;
      Object localObject2;
      if (paramFloat <= 0.0F)
      {
        localObject1 = (Keyframe)this.mKeyframes.get(1);
        localObject2 = ((Keyframe)localObject1).getInterpolator();
        f = paramFloat;
        if (localObject2 != null) {
          f = ((Interpolator)localObject2).getInterpolation(paramFloat);
        }
        paramFloat = this.mFirstKeyframe.getFraction();
        paramFloat = (f - paramFloat) / (((Keyframe)localObject1).getFraction() - paramFloat);
        localObject1 = this.mEvaluator.evaluate(paramFloat, this.mFirstKeyframe.getValue(), ((Keyframe)localObject1).getValue());
      }
      else if (paramFloat >= 1.0F)
      {
        localObject1 = (Keyframe)this.mKeyframes.get(this.mNumKeyframes - 2);
        localObject2 = this.mLastKeyframe.getInterpolator();
        f = paramFloat;
        if (localObject2 != null) {
          f = ((Interpolator)localObject2).getInterpolation(paramFloat);
        }
        paramFloat = ((Keyframe)localObject1).getFraction();
        paramFloat = (f - paramFloat) / (this.mLastKeyframe.getFraction() - paramFloat);
        localObject1 = this.mEvaluator.evaluate(paramFloat, ((Keyframe)localObject1).getValue(), this.mLastKeyframe.getValue());
      }
      else
      {
        localObject1 = this.mFirstKeyframe;
        for (int i = 1;; i++)
        {
          if (i >= this.mNumKeyframes) {
            break label344;
          }
          localObject2 = (Keyframe)this.mKeyframes.get(i);
          if (paramFloat < ((Keyframe)localObject2).getFraction())
          {
            Interpolator localInterpolator = ((Keyframe)localObject2).getInterpolator();
            f = paramFloat;
            if (localInterpolator != null) {
              f = localInterpolator.getInterpolation(paramFloat);
            }
            paramFloat = ((Keyframe)localObject1).getFraction();
            paramFloat = (f - paramFloat) / (((Keyframe)localObject2).getFraction() - paramFloat);
            localObject1 = this.mEvaluator.evaluate(paramFloat, ((Keyframe)localObject1).getValue(), ((Keyframe)localObject2).getValue());
            break;
          }
          localObject1 = localObject2;
        }
        label344:
        localObject1 = this.mLastKeyframe.getValue();
      }
    }
  }
  
  public void setEvaluator(TypeEvaluator paramTypeEvaluator)
  {
    this.mEvaluator = paramTypeEvaluator;
  }
  
  public String toString()
  {
    String str = " ";
    for (int i = 0; i < this.mNumKeyframes; i++) {
      str = str + ((Keyframe)this.mKeyframes.get(i)).getValue() + "  ";
    }
    return str;
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/nineoldandroids/animation/KeyframeSet.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */