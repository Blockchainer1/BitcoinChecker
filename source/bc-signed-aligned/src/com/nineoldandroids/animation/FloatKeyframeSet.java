package com.nineoldandroids.animation;

import android.view.animation.Interpolator;
import java.util.ArrayList;

class FloatKeyframeSet
  extends KeyframeSet
{
  private float deltaValue;
  private boolean firstTime = true;
  private float firstValue;
  private float lastValue;
  
  public FloatKeyframeSet(Keyframe.FloatKeyframe... paramVarArgs)
  {
    super(paramVarArgs);
  }
  
  public FloatKeyframeSet clone()
  {
    ArrayList localArrayList = this.mKeyframes;
    int i = this.mKeyframes.size();
    Keyframe.FloatKeyframe[] arrayOfFloatKeyframe = new Keyframe.FloatKeyframe[i];
    for (int j = 0; j < i; j++) {
      arrayOfFloatKeyframe[j] = ((Keyframe.FloatKeyframe)((Keyframe)localArrayList.get(j)).clone());
    }
    return new FloatKeyframeSet(arrayOfFloatKeyframe);
  }
  
  public float getFloatValue(float paramFloat)
  {
    float f1;
    if (this.mNumKeyframes == 2)
    {
      if (this.firstTime)
      {
        this.firstTime = false;
        this.firstValue = ((Keyframe.FloatKeyframe)this.mKeyframes.get(0)).getFloatValue();
        this.lastValue = ((Keyframe.FloatKeyframe)this.mKeyframes.get(1)).getFloatValue();
        this.deltaValue = (this.lastValue - this.firstValue);
      }
      f1 = paramFloat;
      if (this.mInterpolator != null) {
        f1 = this.mInterpolator.getInterpolation(paramFloat);
      }
      if (this.mEvaluator == null) {
        paramFloat = this.firstValue + this.deltaValue * f1;
      }
    }
    for (;;)
    {
      return paramFloat;
      paramFloat = ((Number)this.mEvaluator.evaluate(f1, Float.valueOf(this.firstValue), Float.valueOf(this.lastValue))).floatValue();
      continue;
      Keyframe.FloatKeyframe localFloatKeyframe;
      Object localObject;
      float f2;
      float f3;
      float f4;
      float f5;
      if (paramFloat <= 0.0F)
      {
        localFloatKeyframe = (Keyframe.FloatKeyframe)this.mKeyframes.get(0);
        localObject = (Keyframe.FloatKeyframe)this.mKeyframes.get(1);
        f2 = localFloatKeyframe.getFloatValue();
        f3 = ((Keyframe.FloatKeyframe)localObject).getFloatValue();
        f4 = localFloatKeyframe.getFraction();
        f5 = ((Keyframe.FloatKeyframe)localObject).getFraction();
        localObject = ((Keyframe.FloatKeyframe)localObject).getInterpolator();
        f1 = paramFloat;
        if (localObject != null) {
          f1 = ((Interpolator)localObject).getInterpolation(paramFloat);
        }
        paramFloat = (f1 - f4) / (f5 - f4);
        if (this.mEvaluator == null) {
          paramFloat = (f3 - f2) * paramFloat + f2;
        } else {
          paramFloat = ((Number)this.mEvaluator.evaluate(paramFloat, Float.valueOf(f2), Float.valueOf(f3))).floatValue();
        }
      }
      else if (paramFloat >= 1.0F)
      {
        localObject = (Keyframe.FloatKeyframe)this.mKeyframes.get(this.mNumKeyframes - 2);
        localFloatKeyframe = (Keyframe.FloatKeyframe)this.mKeyframes.get(this.mNumKeyframes - 1);
        f2 = ((Keyframe.FloatKeyframe)localObject).getFloatValue();
        f3 = localFloatKeyframe.getFloatValue();
        f4 = ((Keyframe.FloatKeyframe)localObject).getFraction();
        f5 = localFloatKeyframe.getFraction();
        localObject = localFloatKeyframe.getInterpolator();
        f1 = paramFloat;
        if (localObject != null) {
          f1 = ((Interpolator)localObject).getInterpolation(paramFloat);
        }
        paramFloat = (f1 - f4) / (f5 - f4);
        if (this.mEvaluator == null) {
          paramFloat = (f3 - f2) * paramFloat + f2;
        } else {
          paramFloat = ((Number)this.mEvaluator.evaluate(paramFloat, Float.valueOf(f2), Float.valueOf(f3))).floatValue();
        }
      }
      else
      {
        localObject = (Keyframe.FloatKeyframe)this.mKeyframes.get(0);
        for (int i = 1;; i++)
        {
          if (i >= this.mNumKeyframes) {
            break label595;
          }
          localFloatKeyframe = (Keyframe.FloatKeyframe)this.mKeyframes.get(i);
          if (paramFloat < localFloatKeyframe.getFraction())
          {
            Interpolator localInterpolator = localFloatKeyframe.getInterpolator();
            f1 = paramFloat;
            if (localInterpolator != null) {
              f1 = localInterpolator.getInterpolation(paramFloat);
            }
            f1 = (f1 - ((Keyframe.FloatKeyframe)localObject).getFraction()) / (localFloatKeyframe.getFraction() - ((Keyframe.FloatKeyframe)localObject).getFraction());
            f3 = ((Keyframe.FloatKeyframe)localObject).getFloatValue();
            paramFloat = localFloatKeyframe.getFloatValue();
            if (this.mEvaluator == null)
            {
              paramFloat = (paramFloat - f3) * f1 + f3;
              break;
            }
            paramFloat = ((Number)this.mEvaluator.evaluate(f1, Float.valueOf(f3), Float.valueOf(paramFloat))).floatValue();
            break;
          }
          localObject = localFloatKeyframe;
        }
        label595:
        paramFloat = ((Number)((Keyframe)this.mKeyframes.get(this.mNumKeyframes - 1)).getValue()).floatValue();
      }
    }
  }
  
  public Object getValue(float paramFloat)
  {
    return Float.valueOf(getFloatValue(paramFloat));
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/nineoldandroids/animation/FloatKeyframeSet.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */