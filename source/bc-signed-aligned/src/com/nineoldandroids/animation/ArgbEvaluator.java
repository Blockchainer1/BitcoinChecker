package com.nineoldandroids.animation;

public class ArgbEvaluator
  implements TypeEvaluator
{
  public Object evaluate(float paramFloat, Object paramObject1, Object paramObject2)
  {
    int i = ((Integer)paramObject1).intValue();
    int j = i >> 24;
    int k = i >> 16 & 0xFF;
    int m = i >> 8 & 0xFF;
    int n = i & 0xFF;
    i = ((Integer)paramObject2).intValue();
    return Integer.valueOf((int)(((i >> 24) - j) * paramFloat) + j << 24 | (int)(((i >> 16 & 0xFF) - k) * paramFloat) + k << 16 | (int)(((i >> 8 & 0xFF) - m) * paramFloat) + m << 8 | (int)(((i & 0xFF) - n) * paramFloat) + n);
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/nineoldandroids/animation/ArgbEvaluator.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */