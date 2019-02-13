package com.nineoldandroids.animation;

import android.util.Log;
import com.nineoldandroids.util.FloatProperty;
import com.nineoldandroids.util.IntProperty;
import com.nineoldandroids.util.Property;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.concurrent.locks.ReentrantReadWriteLock;
import java.util.concurrent.locks.ReentrantReadWriteLock.WriteLock;

public class PropertyValuesHolder
  implements Cloneable
{
  private static Class[] DOUBLE_VARIANTS;
  private static Class[] FLOAT_VARIANTS;
  private static Class[] INTEGER_VARIANTS;
  private static final TypeEvaluator sFloatEvaluator;
  private static final HashMap<Class, HashMap<String, Method>> sGetterPropertyMap = new HashMap();
  private static final TypeEvaluator sIntEvaluator = new IntEvaluator();
  private static final HashMap<Class, HashMap<String, Method>> sSetterPropertyMap;
  private Object mAnimatedValue;
  private TypeEvaluator mEvaluator;
  private Method mGetter = null;
  KeyframeSet mKeyframeSet = null;
  protected Property mProperty;
  final ReentrantReadWriteLock mPropertyMapLock = new ReentrantReadWriteLock();
  String mPropertyName;
  Method mSetter = null;
  final Object[] mTmpValueArray = new Object[1];
  Class mValueType;
  
  static
  {
    sFloatEvaluator = new FloatEvaluator();
    FLOAT_VARIANTS = new Class[] { Float.TYPE, Float.class, Double.TYPE, Integer.TYPE, Double.class, Integer.class };
    INTEGER_VARIANTS = new Class[] { Integer.TYPE, Integer.class, Float.TYPE, Double.TYPE, Float.class, Double.class };
    DOUBLE_VARIANTS = new Class[] { Double.TYPE, Double.class, Float.TYPE, Integer.TYPE, Float.class, Integer.class };
    sSetterPropertyMap = new HashMap();
  }
  
  private PropertyValuesHolder(Property paramProperty)
  {
    this.mProperty = paramProperty;
    if (paramProperty != null) {
      this.mPropertyName = paramProperty.getName();
    }
  }
  
  private PropertyValuesHolder(String paramString)
  {
    this.mPropertyName = paramString;
  }
  
  static String getMethodName(String paramString1, String paramString2)
  {
    String str = paramString1;
    if (paramString2 != null) {
      if (paramString2.length() != 0) {
        break label17;
      }
    }
    label17:
    char c;
    for (str = paramString1;; str = paramString1 + c + paramString2)
    {
      return str;
      c = Character.toUpperCase(paramString2.charAt(0));
      paramString2 = paramString2.substring(1);
    }
  }
  
  private Method getPropertyFunction(Class paramClass1, String paramString, Class paramClass2)
  {
    Method localMethod1 = null;
    Class[] arrayOfClass = null;
    String str = getMethodName(paramString, this.mPropertyName);
    if (paramClass2 == null) {}
    for (;;)
    {
      try
      {
        paramString = paramClass1.getMethod(str, null);
        paramClass1 = paramString;
      }
      catch (NoSuchMethodException paramClass2)
      {
        paramString = arrayOfClass;
        try
        {
          paramClass1 = paramClass1.getDeclaredMethod(str, null);
          paramString = paramClass1;
          paramClass1.setAccessible(true);
        }
        catch (NoSuchMethodException paramClass1)
        {
          Log.e("PropertyValuesHolder", "Couldn't find no-arg method for property " + this.mPropertyName + ": " + paramClass2);
          paramClass1 = paramString;
        }
        continue;
      }
      return paramClass1;
      arrayOfClass = new Class[1];
      label119:
      int i;
      int j;
      if (this.mValueType.equals(Float.class))
      {
        paramString = FLOAT_VARIANTS;
        i = paramString.length;
        j = 0;
        paramClass2 = localMethod1;
      }
      for (;;)
      {
        if (j >= i) {
          break label270;
        }
        Class localClass = paramString[j];
        arrayOfClass[0] = localClass;
        try
        {
          localMethod1 = paramClass1.getMethod(str, arrayOfClass);
          paramClass2 = localMethod1;
          this.mValueType = localClass;
          paramClass1 = localMethod1;
          break;
          if (this.mValueType.equals(Integer.class))
          {
            paramString = INTEGER_VARIANTS;
            break label119;
          }
          if (this.mValueType.equals(Double.class))
          {
            paramString = DOUBLE_VARIANTS;
            break label119;
          }
          paramString = new Class[1];
          paramString[0] = this.mValueType;
        }
        catch (NoSuchMethodException localNoSuchMethodException1)
        {
          try
          {
            Method localMethod2 = paramClass1.getDeclaredMethod(str, arrayOfClass);
            paramClass2 = localMethod2;
            localMethod2.setAccessible(true);
            paramClass2 = localMethod2;
            this.mValueType = localClass;
            paramClass1 = localMethod2;
          }
          catch (NoSuchMethodException localNoSuchMethodException2)
          {
            j++;
          }
        }
      }
      label270:
      Log.e("PropertyValuesHolder", "Couldn't find setter/getter for property " + this.mPropertyName + " with value type " + this.mValueType);
      paramClass1 = paramClass2;
    }
  }
  
  public static PropertyValuesHolder ofFloat(Property<?, Float> paramProperty, float... paramVarArgs)
  {
    return new FloatPropertyValuesHolder(paramProperty, paramVarArgs);
  }
  
  public static PropertyValuesHolder ofFloat(String paramString, float... paramVarArgs)
  {
    return new FloatPropertyValuesHolder(paramString, paramVarArgs);
  }
  
  public static PropertyValuesHolder ofInt(Property<?, Integer> paramProperty, int... paramVarArgs)
  {
    return new IntPropertyValuesHolder(paramProperty, paramVarArgs);
  }
  
  public static PropertyValuesHolder ofInt(String paramString, int... paramVarArgs)
  {
    return new IntPropertyValuesHolder(paramString, paramVarArgs);
  }
  
  public static PropertyValuesHolder ofKeyframe(Property paramProperty, Keyframe... paramVarArgs)
  {
    KeyframeSet localKeyframeSet = KeyframeSet.ofKeyframe(paramVarArgs);
    if ((localKeyframeSet instanceof IntKeyframeSet)) {
      paramProperty = new IntPropertyValuesHolder(paramProperty, (IntKeyframeSet)localKeyframeSet);
    }
    for (;;)
    {
      return paramProperty;
      if ((localKeyframeSet instanceof FloatKeyframeSet))
      {
        paramProperty = new FloatPropertyValuesHolder(paramProperty, (FloatKeyframeSet)localKeyframeSet);
      }
      else
      {
        paramProperty = new PropertyValuesHolder(paramProperty);
        paramProperty.mKeyframeSet = localKeyframeSet;
        paramProperty.mValueType = paramVarArgs[0].getType();
      }
    }
  }
  
  public static PropertyValuesHolder ofKeyframe(String paramString, Keyframe... paramVarArgs)
  {
    KeyframeSet localKeyframeSet = KeyframeSet.ofKeyframe(paramVarArgs);
    if ((localKeyframeSet instanceof IntKeyframeSet)) {
      paramString = new IntPropertyValuesHolder(paramString, (IntKeyframeSet)localKeyframeSet);
    }
    for (;;)
    {
      return paramString;
      if ((localKeyframeSet instanceof FloatKeyframeSet))
      {
        paramString = new FloatPropertyValuesHolder(paramString, (FloatKeyframeSet)localKeyframeSet);
      }
      else
      {
        paramString = new PropertyValuesHolder(paramString);
        paramString.mKeyframeSet = localKeyframeSet;
        paramString.mValueType = paramVarArgs[0].getType();
      }
    }
  }
  
  public static <V> PropertyValuesHolder ofObject(Property paramProperty, TypeEvaluator<V> paramTypeEvaluator, V... paramVarArgs)
  {
    paramProperty = new PropertyValuesHolder(paramProperty);
    paramProperty.setObjectValues(paramVarArgs);
    paramProperty.setEvaluator(paramTypeEvaluator);
    return paramProperty;
  }
  
  public static PropertyValuesHolder ofObject(String paramString, TypeEvaluator paramTypeEvaluator, Object... paramVarArgs)
  {
    paramString = new PropertyValuesHolder(paramString);
    paramString.setObjectValues(paramVarArgs);
    paramString.setEvaluator(paramTypeEvaluator);
    return paramString;
  }
  
  private void setupGetter(Class paramClass)
  {
    this.mGetter = setupSetterOrGetter(paramClass, sGetterPropertyMap, "get", null);
  }
  
  private Method setupSetterOrGetter(Class paramClass1, HashMap<Class, HashMap<String, Method>> paramHashMap, String paramString, Class paramClass2)
  {
    Method localMethod1 = null;
    try
    {
      this.mPropertyMapLock.writeLock().lock();
      HashMap localHashMap = (HashMap)paramHashMap.get(paramClass1);
      if (localHashMap != null) {
        localMethod1 = (Method)localHashMap.get(this.mPropertyName);
      }
      Method localMethod2 = localMethod1;
      if (localMethod1 == null)
      {
        localMethod2 = getPropertyFunction(paramClass1, paramString, paramClass2);
        paramString = localHashMap;
        if (localHashMap == null)
        {
          paramString = new java/util/HashMap;
          paramString.<init>();
          paramHashMap.put(paramClass1, paramString);
        }
        paramString.put(this.mPropertyName, localMethod2);
      }
      return localMethod2;
    }
    finally
    {
      this.mPropertyMapLock.writeLock().unlock();
    }
  }
  
  private void setupValue(Object paramObject, Keyframe paramKeyframe)
  {
    if (this.mProperty != null) {
      paramKeyframe.setValue(this.mProperty.get(paramObject));
    }
    try
    {
      if (this.mGetter == null) {
        setupGetter(paramObject.getClass());
      }
      paramKeyframe.setValue(this.mGetter.invoke(paramObject, new Object[0]));
      return;
    }
    catch (InvocationTargetException paramObject)
    {
      for (;;)
      {
        Log.e("PropertyValuesHolder", ((InvocationTargetException)paramObject).toString());
      }
    }
    catch (IllegalAccessException paramObject)
    {
      for (;;)
      {
        Log.e("PropertyValuesHolder", ((IllegalAccessException)paramObject).toString());
      }
    }
  }
  
  void calculateValue(float paramFloat)
  {
    this.mAnimatedValue = this.mKeyframeSet.getValue(paramFloat);
  }
  
  public PropertyValuesHolder clone()
  {
    try
    {
      PropertyValuesHolder localPropertyValuesHolder = (PropertyValuesHolder)super.clone();
      localPropertyValuesHolder.mPropertyName = this.mPropertyName;
      localPropertyValuesHolder.mProperty = this.mProperty;
      localPropertyValuesHolder.mKeyframeSet = this.mKeyframeSet.clone();
      localPropertyValuesHolder.mEvaluator = this.mEvaluator;
      return localPropertyValuesHolder;
    }
    catch (CloneNotSupportedException localCloneNotSupportedException)
    {
      for (;;)
      {
        Object localObject = null;
      }
    }
  }
  
  Object getAnimatedValue()
  {
    return this.mAnimatedValue;
  }
  
  public String getPropertyName()
  {
    return this.mPropertyName;
  }
  
  void init()
  {
    TypeEvaluator localTypeEvaluator;
    if (this.mEvaluator == null)
    {
      if (this.mValueType != Integer.class) {
        break label44;
      }
      localTypeEvaluator = sIntEvaluator;
    }
    for (;;)
    {
      this.mEvaluator = localTypeEvaluator;
      if (this.mEvaluator != null) {
        this.mKeyframeSet.setEvaluator(this.mEvaluator);
      }
      return;
      label44:
      if (this.mValueType == Float.class) {
        localTypeEvaluator = sFloatEvaluator;
      } else {
        localTypeEvaluator = null;
      }
    }
  }
  
  void setAnimatedValue(Object paramObject)
  {
    if (this.mProperty != null) {
      this.mProperty.set(paramObject, getAnimatedValue());
    }
    if (this.mSetter != null) {}
    try
    {
      this.mTmpValueArray[0] = getAnimatedValue();
      this.mSetter.invoke(paramObject, this.mTmpValueArray);
      return;
    }
    catch (InvocationTargetException paramObject)
    {
      for (;;)
      {
        Log.e("PropertyValuesHolder", ((InvocationTargetException)paramObject).toString());
      }
    }
    catch (IllegalAccessException paramObject)
    {
      for (;;)
      {
        Log.e("PropertyValuesHolder", ((IllegalAccessException)paramObject).toString());
      }
    }
  }
  
  public void setEvaluator(TypeEvaluator paramTypeEvaluator)
  {
    this.mEvaluator = paramTypeEvaluator;
    this.mKeyframeSet.setEvaluator(paramTypeEvaluator);
  }
  
  public void setFloatValues(float... paramVarArgs)
  {
    this.mValueType = Float.TYPE;
    this.mKeyframeSet = KeyframeSet.ofFloat(paramVarArgs);
  }
  
  public void setIntValues(int... paramVarArgs)
  {
    this.mValueType = Integer.TYPE;
    this.mKeyframeSet = KeyframeSet.ofInt(paramVarArgs);
  }
  
  public void setKeyframes(Keyframe... paramVarArgs)
  {
    int i = paramVarArgs.length;
    Keyframe[] arrayOfKeyframe = new Keyframe[Math.max(i, 2)];
    this.mValueType = paramVarArgs[0].getType();
    for (int j = 0; j < i; j++) {
      arrayOfKeyframe[j] = paramVarArgs[j];
    }
    this.mKeyframeSet = new KeyframeSet(arrayOfKeyframe);
  }
  
  public void setObjectValues(Object... paramVarArgs)
  {
    this.mValueType = paramVarArgs[0].getClass();
    this.mKeyframeSet = KeyframeSet.ofObject(paramVarArgs);
  }
  
  public void setProperty(Property paramProperty)
  {
    this.mProperty = paramProperty;
  }
  
  public void setPropertyName(String paramString)
  {
    this.mPropertyName = paramString;
  }
  
  void setupEndValue(Object paramObject)
  {
    setupValue(paramObject, (Keyframe)this.mKeyframeSet.mKeyframes.get(this.mKeyframeSet.mKeyframes.size() - 1));
  }
  
  void setupSetter(Class paramClass)
  {
    this.mSetter = setupSetterOrGetter(paramClass, sSetterPropertyMap, "set", this.mValueType);
  }
  
  void setupSetterAndGetter(Object paramObject)
  {
    Object localObject;
    if (this.mProperty != null)
    {
      try
      {
        this.mProperty.get(paramObject);
        localObject = this.mKeyframeSet.mKeyframes.iterator();
        while (((Iterator)localObject).hasNext())
        {
          Keyframe localKeyframe1 = (Keyframe)((Iterator)localObject).next();
          if (!localKeyframe1.hasValue()) {
            localKeyframe1.setValue(this.mProperty.get(paramObject));
          }
        }
        localObject = paramObject.getClass();
      }
      catch (ClassCastException localClassCastException)
      {
        Log.e("PropertyValuesHolder", "No such property (" + this.mProperty.getName() + ") on target object " + paramObject + ". Trying reflection instead");
        this.mProperty = null;
      }
    }
    else
    {
      if (this.mSetter == null) {
        setupSetter((Class)localObject);
      }
      Iterator localIterator = this.mKeyframeSet.mKeyframes.iterator();
      while (localIterator.hasNext())
      {
        Keyframe localKeyframe2 = (Keyframe)localIterator.next();
        if (!localKeyframe2.hasValue())
        {
          if (this.mGetter == null) {
            setupGetter((Class)localObject);
          }
          try
          {
            localKeyframe2.setValue(this.mGetter.invoke(paramObject, new Object[0]));
          }
          catch (InvocationTargetException localInvocationTargetException)
          {
            Log.e("PropertyValuesHolder", localInvocationTargetException.toString());
          }
          catch (IllegalAccessException localIllegalAccessException)
          {
            Log.e("PropertyValuesHolder", localIllegalAccessException.toString());
          }
        }
      }
    }
  }
  
  void setupStartValue(Object paramObject)
  {
    setupValue(paramObject, (Keyframe)this.mKeyframeSet.mKeyframes.get(0));
  }
  
  public String toString()
  {
    return this.mPropertyName + ": " + this.mKeyframeSet.toString();
  }
  
  static class FloatPropertyValuesHolder
    extends PropertyValuesHolder
  {
    float mFloatAnimatedValue;
    FloatKeyframeSet mFloatKeyframeSet;
    private FloatProperty mFloatProperty;
    
    public FloatPropertyValuesHolder(Property paramProperty, FloatKeyframeSet paramFloatKeyframeSet)
    {
      super(null);
      this.mValueType = Float.TYPE;
      this.mKeyframeSet = paramFloatKeyframeSet;
      this.mFloatKeyframeSet = ((FloatKeyframeSet)this.mKeyframeSet);
      if ((paramProperty instanceof FloatProperty)) {
        this.mFloatProperty = ((FloatProperty)this.mProperty);
      }
    }
    
    public FloatPropertyValuesHolder(Property paramProperty, float... paramVarArgs)
    {
      super(null);
      setFloatValues(paramVarArgs);
      if ((paramProperty instanceof FloatProperty)) {
        this.mFloatProperty = ((FloatProperty)this.mProperty);
      }
    }
    
    public FloatPropertyValuesHolder(String paramString, FloatKeyframeSet paramFloatKeyframeSet)
    {
      super(null);
      this.mValueType = Float.TYPE;
      this.mKeyframeSet = paramFloatKeyframeSet;
      this.mFloatKeyframeSet = ((FloatKeyframeSet)this.mKeyframeSet);
    }
    
    public FloatPropertyValuesHolder(String paramString, float... paramVarArgs)
    {
      super(null);
      setFloatValues(paramVarArgs);
    }
    
    void calculateValue(float paramFloat)
    {
      this.mFloatAnimatedValue = this.mFloatKeyframeSet.getFloatValue(paramFloat);
    }
    
    public FloatPropertyValuesHolder clone()
    {
      FloatPropertyValuesHolder localFloatPropertyValuesHolder = (FloatPropertyValuesHolder)super.clone();
      localFloatPropertyValuesHolder.mFloatKeyframeSet = ((FloatKeyframeSet)localFloatPropertyValuesHolder.mKeyframeSet);
      return localFloatPropertyValuesHolder;
    }
    
    Object getAnimatedValue()
    {
      return Float.valueOf(this.mFloatAnimatedValue);
    }
    
    void setAnimatedValue(Object paramObject)
    {
      if (this.mFloatProperty != null) {
        this.mFloatProperty.setValue(paramObject, this.mFloatAnimatedValue);
      }
      for (;;)
      {
        return;
        if (this.mProperty != null) {
          this.mProperty.set(paramObject, Float.valueOf(this.mFloatAnimatedValue));
        } else if (this.mSetter != null) {
          try
          {
            this.mTmpValueArray[0] = Float.valueOf(this.mFloatAnimatedValue);
            this.mSetter.invoke(paramObject, this.mTmpValueArray);
          }
          catch (InvocationTargetException paramObject)
          {
            Log.e("PropertyValuesHolder", ((InvocationTargetException)paramObject).toString());
          }
          catch (IllegalAccessException paramObject)
          {
            Log.e("PropertyValuesHolder", ((IllegalAccessException)paramObject).toString());
          }
        }
      }
    }
    
    public void setFloatValues(float... paramVarArgs)
    {
      super.setFloatValues(paramVarArgs);
      this.mFloatKeyframeSet = ((FloatKeyframeSet)this.mKeyframeSet);
    }
    
    void setupSetter(Class paramClass)
    {
      if (this.mProperty != null) {}
      for (;;)
      {
        return;
        super.setupSetter(paramClass);
      }
    }
  }
  
  static class IntPropertyValuesHolder
    extends PropertyValuesHolder
  {
    int mIntAnimatedValue;
    IntKeyframeSet mIntKeyframeSet;
    private IntProperty mIntProperty;
    
    public IntPropertyValuesHolder(Property paramProperty, IntKeyframeSet paramIntKeyframeSet)
    {
      super(null);
      this.mValueType = Integer.TYPE;
      this.mKeyframeSet = paramIntKeyframeSet;
      this.mIntKeyframeSet = ((IntKeyframeSet)this.mKeyframeSet);
      if ((paramProperty instanceof IntProperty)) {
        this.mIntProperty = ((IntProperty)this.mProperty);
      }
    }
    
    public IntPropertyValuesHolder(Property paramProperty, int... paramVarArgs)
    {
      super(null);
      setIntValues(paramVarArgs);
      if ((paramProperty instanceof IntProperty)) {
        this.mIntProperty = ((IntProperty)this.mProperty);
      }
    }
    
    public IntPropertyValuesHolder(String paramString, IntKeyframeSet paramIntKeyframeSet)
    {
      super(null);
      this.mValueType = Integer.TYPE;
      this.mKeyframeSet = paramIntKeyframeSet;
      this.mIntKeyframeSet = ((IntKeyframeSet)this.mKeyframeSet);
    }
    
    public IntPropertyValuesHolder(String paramString, int... paramVarArgs)
    {
      super(null);
      setIntValues(paramVarArgs);
    }
    
    void calculateValue(float paramFloat)
    {
      this.mIntAnimatedValue = this.mIntKeyframeSet.getIntValue(paramFloat);
    }
    
    public IntPropertyValuesHolder clone()
    {
      IntPropertyValuesHolder localIntPropertyValuesHolder = (IntPropertyValuesHolder)super.clone();
      localIntPropertyValuesHolder.mIntKeyframeSet = ((IntKeyframeSet)localIntPropertyValuesHolder.mKeyframeSet);
      return localIntPropertyValuesHolder;
    }
    
    Object getAnimatedValue()
    {
      return Integer.valueOf(this.mIntAnimatedValue);
    }
    
    void setAnimatedValue(Object paramObject)
    {
      if (this.mIntProperty != null) {
        this.mIntProperty.setValue(paramObject, this.mIntAnimatedValue);
      }
      for (;;)
      {
        return;
        if (this.mProperty != null) {
          this.mProperty.set(paramObject, Integer.valueOf(this.mIntAnimatedValue));
        } else if (this.mSetter != null) {
          try
          {
            this.mTmpValueArray[0] = Integer.valueOf(this.mIntAnimatedValue);
            this.mSetter.invoke(paramObject, this.mTmpValueArray);
          }
          catch (InvocationTargetException paramObject)
          {
            Log.e("PropertyValuesHolder", ((InvocationTargetException)paramObject).toString());
          }
          catch (IllegalAccessException paramObject)
          {
            Log.e("PropertyValuesHolder", ((IllegalAccessException)paramObject).toString());
          }
        }
      }
    }
    
    public void setIntValues(int... paramVarArgs)
    {
      super.setIntValues(paramVarArgs);
      this.mIntKeyframeSet = ((IntKeyframeSet)this.mKeyframeSet);
    }
    
    void setupSetter(Class paramClass)
    {
      if (this.mProperty != null) {}
      for (;;)
      {
        return;
        super.setupSetter(paramClass);
      }
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/nineoldandroids/animation/PropertyValuesHolder.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */