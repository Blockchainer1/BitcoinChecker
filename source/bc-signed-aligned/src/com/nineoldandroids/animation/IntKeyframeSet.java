package com.nineoldandroids.animation;

import android.view.animation.Interpolator;
import java.util.ArrayList;

class IntKeyframeSet
  extends KeyframeSet
{
  private int deltaValue;
  private boolean firstTime = true;
  private int firstValue;
  private int lastValue;
  
  public IntKeyframeSet(Keyframe.IntKeyframe... paramVarArgs)
  {
    super(paramVarArgs);
  }
  
  public IntKeyframeSet clone()
  {
    ArrayList localArrayList = this.mKeyframes;
    int i = this.mKeyframes.size();
    Keyframe.IntKeyframe[] arrayOfIntKeyframe = new Keyframe.IntKeyframe[i];
    for (int j = 0; j < i; j++) {
      arrayOfIntKeyframe[j] = ((Keyframe.IntKeyframe)((Keyframe)localArrayList.get(j)).clone());
    }
    return new IntKeyframeSet(arrayOfIntKeyframe);
  }
  
  public int getIntValue(float paramFloat)
  {
    float f1;
    int i;
    if (this.mNumKeyframes == 2)
    {
      if (this.firstTime)
      {
        this.firstTime = false;
        this.firstValue = ((Keyframe.IntKeyframe)this.mKeyframes.get(0)).getIntValue();
        this.lastValue = ((Keyframe.IntKeyframe)this.mKeyframes.get(1)).getIntValue();
        this.deltaValue = (this.lastValue - this.firstValue);
      }
      f1 = paramFloat;
      if (this.mInterpolator != null) {
        f1 = this.mInterpolator.getInterpolation(paramFloat);
      }
      if (this.mEvaluator == null) {
        i = this.firstValue + (int)(this.deltaValue * f1);
      }
    }
    for (;;)
    {
      return i;
      i = ((Number)this.mEvaluator.evaluate(f1, Integer.valueOf(this.firstValue), Integer.valueOf(this.lastValue))).intValue();
      continue;
      Keyframe.IntKeyframe localIntKeyframe;
      Object localObject;
      int j;
      float f2;
      float f3;
      if (paramFloat <= 0.0F)
      {
        localIntKeyframe = (Keyframe.IntKeyframe)this.mKeyframes.get(0);
        localObject = (Keyframe.IntKeyframe)this.mKeyframes.get(1);
        i = localIntKeyframe.getIntValue();
        j = ((Keyframe.IntKeyframe)localObject).getIntValue();
        f2 = localIntKeyframe.getFraction();
        f3 = ((Keyframe.IntKeyframe)localObject).getFraction();
        localObject = ((Keyframe.IntKeyframe)localObject).getInterpolator();
        f1 = paramFloat;
        if (localObject != null) {
          f1 = ((Interpolator)localObject).getInterpolation(paramFloat);
        }
        paramFloat = (f1 - f2) / (f3 - f2);
        if (this.mEvaluator == null) {
          i = (int)((j - i) * paramFloat) + i;
        } else {
          i = ((Number)this.mEvaluator.evaluate(paramFloat, Integer.valueOf(i), Integer.valueOf(j))).intValue();
        }
      }
      else if (paramFloat >= 1.0F)
      {
        localIntKeyframe = (Keyframe.IntKeyframe)this.mKeyframes.get(this.mNumKeyframes - 2);
        localObject = (Keyframe.IntKeyframe)this.mKeyframes.get(this.mNumKeyframes - 1);
        i = localIntKeyframe.getIntValue();
        j = ((Keyframe.IntKeyframe)localObject).getIntValue();
        f3 = localIntKeyframe.getFraction();
        f2 = ((Keyframe.IntKeyframe)localObject).getFraction();
        localObject = ((Keyframe.IntKeyframe)localObject).getInterpolator();
        f1 = paramFloat;
        if (localObject != null) {
          f1 = ((Interpolator)localObject).getInterpolation(paramFloat);
        }
        paramFloat = (f1 - f3) / (f2 - f3);
        if (this.mEvaluator == null) {
          i = (int)((j - i) * paramFloat) + i;
        } else {
          i = ((Number)this.mEvaluator.evaluate(paramFloat, Integer.valueOf(i), Integer.valueOf(j))).intValue();
        }
      }
      else
      {
        localObject = (Keyframe.IntKeyframe)this.mKeyframes.get(0);
        for (i = 1;; i++)
        {
          if (i >= this.mNumKeyframes) {
            break label605;
          }
          localIntKeyframe = (Keyframe.IntKeyframe)this.mKeyframes.get(i);
          if (paramFloat < localIntKeyframe.getFraction())
          {
            Interpolator localInterpolator = localIntKeyframe.getInterpolator();
            f1 = paramFloat;
            if (localInterpolator != null) {
              f1 = localInterpolator.getInterpolation(paramFloat);
            }
            paramFloat = (f1 - ((Keyframe.IntKeyframe)localObject).getFraction()) / (localIntKeyframe.getFraction() - ((Keyframe.IntKeyframe)localObject).getFraction());
            j = ((Keyframe.IntKeyframe)localObject).getIntValue();
            i = localIntKeyframe.getIntValue();
            if (this.mEvaluator == null)
            {
              i = (int)((i - j) * paramFloat) + j;
              break;
            }
            i = ((Number)this.mEvaluator.evaluate(paramFloat, Integer.valueOf(j), Integer.valueOf(i))).intValue();
            break;
          }
          localObject = localIntKeyframe;
        }
        label605:
        i = ((Number)((Keyframe)this.mKeyframes.get(this.mNumKeyframes - 1)).getValue()).intValue();
      }
    }
  }
  
  public Object getValue(float paramFloat)
  {
    return Integer.valueOf(getIntValue(paramFloat));
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/nineoldandroids/animation/IntKeyframeSet.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */