package com.nineoldandroids.animation;

import android.content.Context;
import android.content.res.Resources.NotFoundException;
import android.content.res.TypedArray;
import android.util.AttributeSet;
import android.util.TypedValue;
import android.util.Xml;
import android.view.animation.AnimationUtils;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

public class AnimatorInflater
{
  private static final int[] Animator = { 16843073, 16843160, 16843198, 16843199, 16843200, 16843486, 16843487, 16843488 };
  private static final int[] AnimatorSet = { 16843490 };
  private static final int AnimatorSet_ordering = 0;
  private static final int Animator_duration = 1;
  private static final int Animator_interpolator = 0;
  private static final int Animator_repeatCount = 3;
  private static final int Animator_repeatMode = 4;
  private static final int Animator_startOffset = 2;
  private static final int Animator_valueFrom = 5;
  private static final int Animator_valueTo = 6;
  private static final int Animator_valueType = 7;
  private static final int[] PropertyAnimator = { 16843489 };
  private static final int PropertyAnimator_propertyName = 0;
  private static final int TOGETHER = 0;
  private static final int VALUE_TYPE_FLOAT = 0;
  
  private static Animator createAnimatorFromXml(Context paramContext, XmlPullParser paramXmlPullParser)
    throws XmlPullParserException, IOException
  {
    return createAnimatorFromXml(paramContext, paramXmlPullParser, Xml.asAttributeSet(paramXmlPullParser), null, 0);
  }
  
  private static Animator createAnimatorFromXml(Context paramContext, XmlPullParser paramXmlPullParser, AttributeSet paramAttributeSet, AnimatorSet paramAnimatorSet, int paramInt)
    throws XmlPullParserException, IOException
  {
    Object localObject1 = null;
    Object localObject2 = null;
    int i = paramXmlPullParser.getDepth();
    int j;
    do
    {
      j = paramXmlPullParser.next();
      if (((j == 3) && (paramXmlPullParser.getDepth() <= i)) || (j == 1)) {
        break;
      }
    } while (j != 2);
    Object localObject3 = paramXmlPullParser.getName();
    if (((String)localObject3).equals("objectAnimator")) {}
    Object localObject4;
    for (localObject3 = loadObjectAnimator(paramContext, paramAttributeSet);; localObject3 = loadAnimator(paramContext, paramAttributeSet, null))
    {
      localObject1 = localObject3;
      if (paramAnimatorSet == null) {
        break;
      }
      localObject4 = localObject2;
      if (localObject2 == null) {
        localObject4 = new ArrayList();
      }
      ((ArrayList)localObject4).add(localObject3);
      localObject1 = localObject3;
      localObject2 = localObject4;
      break;
      if (!((String)localObject3).equals("animator")) {
        break label142;
      }
    }
    label142:
    if (((String)localObject3).equals("set"))
    {
      localObject3 = new AnimatorSet();
      localObject1 = paramContext.obtainStyledAttributes(paramAttributeSet, AnimatorSet);
      localObject4 = new TypedValue();
      ((TypedArray)localObject1).getValue(0, (TypedValue)localObject4);
      if (((TypedValue)localObject4).type == 16) {}
      for (j = ((TypedValue)localObject4).data;; j = 0)
      {
        createAnimatorFromXml(paramContext, paramXmlPullParser, paramAttributeSet, (AnimatorSet)localObject3, j);
        ((TypedArray)localObject1).recycle();
        break;
      }
    }
    throw new RuntimeException("Unknown animator name: " + paramXmlPullParser.getName());
    if ((paramAnimatorSet != null) && (localObject2 != null))
    {
      paramContext = new Animator[((ArrayList)localObject2).size()];
      j = 0;
      paramXmlPullParser = ((ArrayList)localObject2).iterator();
      while (paramXmlPullParser.hasNext())
      {
        paramContext[j] = ((Animator)paramXmlPullParser.next());
        j++;
      }
      if (paramInt != 0) {
        break label334;
      }
      paramAnimatorSet.playTogether(paramContext);
    }
    for (;;)
    {
      return (Animator)localObject1;
      label334:
      paramAnimatorSet.playSequentially(paramContext);
    }
  }
  
  /* Error */
  public static Animator loadAnimator(Context paramContext, int paramInt)
    throws Resources.NotFoundException
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore_2
    //   2: aconst_null
    //   3: astore_3
    //   4: aconst_null
    //   5: astore 4
    //   7: aload_0
    //   8: invokevirtual 182	android/content/Context:getResources	()Landroid/content/res/Resources;
    //   11: iload_1
    //   12: invokevirtual 188	android/content/res/Resources:getAnimation	(I)Landroid/content/res/XmlResourceParser;
    //   15: astore 5
    //   17: aload 5
    //   19: astore 4
    //   21: aload 5
    //   23: astore_2
    //   24: aload 5
    //   26: astore_3
    //   27: aload_0
    //   28: aload 5
    //   30: invokestatic 190	com/nineoldandroids/animation/AnimatorInflater:createAnimatorFromXml	(Landroid/content/Context;Lorg/xmlpull/v1/XmlPullParser;)Lcom/nineoldandroids/animation/Animator;
    //   33: astore_0
    //   34: aload 5
    //   36: ifnull +10 -> 46
    //   39: aload 5
    //   41: invokeinterface 195 1 0
    //   46: aload_0
    //   47: areturn
    //   48: astore 5
    //   50: aload 4
    //   52: astore_2
    //   53: new 178	android/content/res/Resources$NotFoundException
    //   56: astore_3
    //   57: aload 4
    //   59: astore_2
    //   60: new 137	java/lang/StringBuilder
    //   63: astore_0
    //   64: aload 4
    //   66: astore_2
    //   67: aload_0
    //   68: invokespecial 138	java/lang/StringBuilder:<init>	()V
    //   71: aload 4
    //   73: astore_2
    //   74: aload_3
    //   75: aload_0
    //   76: ldc -59
    //   78: invokevirtual 144	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   81: iload_1
    //   82: invokestatic 203	java/lang/Integer:toHexString	(I)Ljava/lang/String;
    //   85: invokevirtual 144	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   88: invokevirtual 147	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   91: invokespecial 204	android/content/res/Resources$NotFoundException:<init>	(Ljava/lang/String;)V
    //   94: aload 4
    //   96: astore_2
    //   97: aload_3
    //   98: aload 5
    //   100: invokevirtual 208	android/content/res/Resources$NotFoundException:initCause	(Ljava/lang/Throwable;)Ljava/lang/Throwable;
    //   103: pop
    //   104: aload 4
    //   106: astore_2
    //   107: aload_3
    //   108: athrow
    //   109: astore_0
    //   110: aload_2
    //   111: ifnull +9 -> 120
    //   114: aload_2
    //   115: invokeinterface 195 1 0
    //   120: aload_0
    //   121: athrow
    //   122: astore 5
    //   124: aload_3
    //   125: astore_2
    //   126: new 178	android/content/res/Resources$NotFoundException
    //   129: astore_0
    //   130: aload_3
    //   131: astore_2
    //   132: new 137	java/lang/StringBuilder
    //   135: astore 4
    //   137: aload_3
    //   138: astore_2
    //   139: aload 4
    //   141: invokespecial 138	java/lang/StringBuilder:<init>	()V
    //   144: aload_3
    //   145: astore_2
    //   146: aload_0
    //   147: aload 4
    //   149: ldc -59
    //   151: invokevirtual 144	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   154: iload_1
    //   155: invokestatic 203	java/lang/Integer:toHexString	(I)Ljava/lang/String;
    //   158: invokevirtual 144	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   161: invokevirtual 147	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   164: invokespecial 204	android/content/res/Resources$NotFoundException:<init>	(Ljava/lang/String;)V
    //   167: aload_3
    //   168: astore_2
    //   169: aload_0
    //   170: aload 5
    //   172: invokevirtual 208	android/content/res/Resources$NotFoundException:initCause	(Ljava/lang/Throwable;)Ljava/lang/Throwable;
    //   175: pop
    //   176: aload_3
    //   177: astore_2
    //   178: aload_0
    //   179: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	180	0	paramContext	Context
    //   0	180	1	paramInt	int
    //   1	177	2	localObject1	Object
    //   3	174	3	localObject2	Object
    //   5	143	4	localObject3	Object
    //   15	25	5	localXmlResourceParser	android.content.res.XmlResourceParser
    //   48	51	5	localXmlPullParserException	XmlPullParserException
    //   122	49	5	localIOException	IOException
    // Exception table:
    //   from	to	target	type
    //   7	17	48	org/xmlpull/v1/XmlPullParserException
    //   27	34	48	org/xmlpull/v1/XmlPullParserException
    //   7	17	109	finally
    //   27	34	109	finally
    //   53	57	109	finally
    //   60	64	109	finally
    //   67	71	109	finally
    //   74	94	109	finally
    //   97	104	109	finally
    //   107	109	109	finally
    //   126	130	109	finally
    //   132	137	109	finally
    //   139	144	109	finally
    //   146	167	109	finally
    //   169	176	109	finally
    //   178	180	109	finally
    //   7	17	122	java/io/IOException
    //   27	34	122	java/io/IOException
  }
  
  private static ValueAnimator loadAnimator(Context paramContext, AttributeSet paramAttributeSet, ValueAnimator paramValueAnimator)
    throws Resources.NotFoundException
  {
    TypedArray localTypedArray = paramContext.obtainStyledAttributes(paramAttributeSet, Animator);
    long l1 = localTypedArray.getInt(1, 0);
    long l2 = localTypedArray.getInt(2, 0);
    int i = localTypedArray.getInt(7, 0);
    paramAttributeSet = paramValueAnimator;
    if (paramValueAnimator == null) {
      paramAttributeSet = new ValueAnimator();
    }
    int j;
    label71:
    int k;
    label82:
    int m;
    label96:
    int n;
    label107:
    float f1;
    label195:
    float f2;
    if (i == 0)
    {
      i = 1;
      paramValueAnimator = localTypedArray.peekValue(5);
      if (paramValueAnimator == null) {
        break label316;
      }
      j = 1;
      if (j == 0) {
        break label322;
      }
      k = paramValueAnimator.type;
      paramValueAnimator = localTypedArray.peekValue(6);
      if (paramValueAnimator == null) {
        break label328;
      }
      m = 1;
      if (m == 0) {
        break label334;
      }
      n = paramValueAnimator.type;
      int i1;
      if ((j == 0) || (k < 28) || (k > 31))
      {
        i1 = i;
        if (m != 0)
        {
          i1 = i;
          if (n >= 28)
          {
            i1 = i;
            if (n > 31) {}
          }
        }
      }
      else
      {
        i1 = 0;
        paramAttributeSet.setEvaluator(new ArgbEvaluator());
      }
      if (i1 == 0) {
        break label420;
      }
      if (j == 0) {
        break label378;
      }
      if (k != 5) {
        break label340;
      }
      f1 = localTypedArray.getDimension(5, 0.0F);
      if (m == 0) {
        break label363;
      }
      if (n != 5) {
        break label351;
      }
      f2 = localTypedArray.getDimension(6, 0.0F);
      label215:
      paramAttributeSet.setFloatValues(new float[] { f1, f2 });
    }
    label316:
    label322:
    label328:
    label334:
    label340:
    label351:
    label363:
    label378:
    label420:
    label440:
    label517:
    label555:
    label570:
    do
    {
      for (;;)
      {
        paramAttributeSet.setDuration(l1);
        paramAttributeSet.setStartDelay(l2);
        if (localTypedArray.hasValue(3)) {
          paramAttributeSet.setRepeatCount(localTypedArray.getInt(3, 0));
        }
        if (localTypedArray.hasValue(4)) {
          paramAttributeSet.setRepeatMode(localTypedArray.getInt(4, 1));
        }
        i = localTypedArray.getResourceId(0, 0);
        if (i > 0) {
          paramAttributeSet.setInterpolator(AnimationUtils.loadInterpolator(paramContext, i));
        }
        localTypedArray.recycle();
        return paramAttributeSet;
        i = 0;
        break;
        j = 0;
        break label71;
        k = 0;
        break label82;
        m = 0;
        break label96;
        n = 0;
        break label107;
        f1 = localTypedArray.getFloat(5, 0.0F);
        break label195;
        f2 = localTypedArray.getFloat(6, 0.0F);
        break label215;
        paramAttributeSet.setFloatValues(new float[] { f1 });
        continue;
        if (n == 5) {}
        for (f1 = localTypedArray.getDimension(6, 0.0F);; f1 = localTypedArray.getFloat(6, 0.0F))
        {
          paramAttributeSet.setFloatValues(new float[] { f1 });
          break;
        }
        if (j == 0) {
          break label570;
        }
        if (k == 5)
        {
          i = (int)localTypedArray.getDimension(5, 0.0F);
          if (m == 0) {
            break label555;
          }
          if (n != 5) {
            break label517;
          }
          j = (int)localTypedArray.getDimension(6, 0.0F);
        }
        for (;;)
        {
          paramAttributeSet.setIntValues(new int[] { i, j });
          break;
          if ((k >= 28) && (k <= 31))
          {
            i = localTypedArray.getColor(5, 0);
            break label440;
          }
          i = localTypedArray.getInt(5, 0);
          break label440;
          if ((n >= 28) && (n <= 31)) {
            j = localTypedArray.getColor(6, 0);
          } else {
            j = localTypedArray.getInt(6, 0);
          }
        }
        paramAttributeSet.setIntValues(new int[] { i });
      }
    } while (m == 0);
    if (n == 5) {
      i = (int)localTypedArray.getDimension(6, 0.0F);
    }
    for (;;)
    {
      paramAttributeSet.setIntValues(new int[] { i });
      break;
      if ((n >= 28) && (n <= 31)) {
        i = localTypedArray.getColor(6, 0);
      } else {
        i = localTypedArray.getInt(6, 0);
      }
    }
  }
  
  private static ObjectAnimator loadObjectAnimator(Context paramContext, AttributeSet paramAttributeSet)
    throws Resources.NotFoundException
  {
    ObjectAnimator localObjectAnimator = new ObjectAnimator();
    loadAnimator(paramContext, paramAttributeSet, localObjectAnimator);
    paramContext = paramContext.obtainStyledAttributes(paramAttributeSet, PropertyAnimator);
    localObjectAnimator.setPropertyName(paramContext.getString(0));
    paramContext.recycle();
    return localObjectAnimator;
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/nineoldandroids/animation/AnimatorInflater.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */