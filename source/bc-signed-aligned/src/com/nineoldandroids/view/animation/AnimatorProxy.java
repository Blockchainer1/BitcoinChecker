package com.nineoldandroids.view.animation;

import android.graphics.Camera;
import android.graphics.Matrix;
import android.graphics.RectF;
import android.os.Build.VERSION;
import android.view.View;
import android.view.animation.Animation;
import android.view.animation.Transformation;
import java.lang.ref.WeakReference;
import java.util.WeakHashMap;

public final class AnimatorProxy
  extends Animation
{
  public static final boolean NEEDS_PROXY;
  private static final WeakHashMap<View, AnimatorProxy> PROXIES;
  private final RectF mAfter = new RectF();
  private float mAlpha = 1.0F;
  private final RectF mBefore = new RectF();
  private final Camera mCamera = new Camera();
  private boolean mHasPivot;
  private float mPivotX;
  private float mPivotY;
  private float mRotationX;
  private float mRotationY;
  private float mRotationZ;
  private float mScaleX = 1.0F;
  private float mScaleY = 1.0F;
  private final Matrix mTempMatrix = new Matrix();
  private float mTranslationX;
  private float mTranslationY;
  private final WeakReference<View> mView;
  
  static
  {
    if (Integer.valueOf(Build.VERSION.SDK).intValue() < 11) {}
    for (boolean bool = true;; bool = false)
    {
      NEEDS_PROXY = bool;
      PROXIES = new WeakHashMap();
      return;
    }
  }
  
  private AnimatorProxy(View paramView)
  {
    setDuration(0L);
    setFillAfter(true);
    paramView.setAnimation(this);
    this.mView = new WeakReference(paramView);
  }
  
  private void computeRect(RectF paramRectF, View paramView)
  {
    paramRectF.set(0.0F, 0.0F, paramView.getWidth(), paramView.getHeight());
    Matrix localMatrix = this.mTempMatrix;
    localMatrix.reset();
    transformMatrix(localMatrix, paramView);
    this.mTempMatrix.mapRect(paramRectF);
    paramRectF.offset(paramView.getLeft(), paramView.getTop());
    float f;
    if (paramRectF.right < paramRectF.left)
    {
      f = paramRectF.right;
      paramRectF.right = paramRectF.left;
      paramRectF.left = f;
    }
    if (paramRectF.bottom < paramRectF.top)
    {
      f = paramRectF.top;
      paramRectF.top = paramRectF.bottom;
      paramRectF.bottom = f;
    }
  }
  
  private void invalidateAfterUpdate()
  {
    View localView = (View)this.mView.get();
    if ((localView == null) || (localView.getParent() == null)) {}
    for (;;)
    {
      return;
      RectF localRectF = this.mAfter;
      computeRect(localRectF, localView);
      localRectF.union(this.mBefore);
      ((View)localView.getParent()).invalidate((int)Math.floor(localRectF.left), (int)Math.floor(localRectF.top), (int)Math.ceil(localRectF.right), (int)Math.ceil(localRectF.bottom));
    }
  }
  
  private void prepareForUpdate()
  {
    View localView = (View)this.mView.get();
    if (localView != null) {
      computeRect(this.mBefore, localView);
    }
  }
  
  private void transformMatrix(Matrix paramMatrix, View paramView)
  {
    float f1 = paramView.getWidth();
    float f2 = paramView.getHeight();
    boolean bool = this.mHasPivot;
    float f3;
    if (bool)
    {
      f3 = this.mPivotX;
      if (!bool) {
        break label226;
      }
    }
    label226:
    for (float f4 = this.mPivotY;; f4 = f2 / 2.0F)
    {
      float f5 = this.mRotationX;
      float f6 = this.mRotationY;
      float f7 = this.mRotationZ;
      if ((f5 != 0.0F) || (f6 != 0.0F) || (f7 != 0.0F))
      {
        paramView = this.mCamera;
        paramView.save();
        paramView.rotateX(f5);
        paramView.rotateY(f6);
        paramView.rotateZ(-f7);
        paramView.getMatrix(paramMatrix);
        paramView.restore();
        paramMatrix.preTranslate(-f3, -f4);
        paramMatrix.postTranslate(f3, f4);
      }
      f6 = this.mScaleX;
      f7 = this.mScaleY;
      if ((f6 != 1.0F) || (f7 != 1.0F))
      {
        paramMatrix.postScale(f6, f7);
        paramMatrix.postTranslate(-(f3 / f1) * (f6 * f1 - f1), -(f4 / f2) * (f7 * f2 - f2));
      }
      paramMatrix.postTranslate(this.mTranslationX, this.mTranslationY);
      return;
      f3 = f1 / 2.0F;
      break;
    }
  }
  
  public static AnimatorProxy wrap(View paramView)
  {
    AnimatorProxy localAnimatorProxy1 = (AnimatorProxy)PROXIES.get(paramView);
    AnimatorProxy localAnimatorProxy2;
    if (localAnimatorProxy1 != null)
    {
      localAnimatorProxy2 = localAnimatorProxy1;
      if (localAnimatorProxy1 == paramView.getAnimation()) {}
    }
    else
    {
      localAnimatorProxy2 = new AnimatorProxy(paramView);
      PROXIES.put(paramView, localAnimatorProxy2);
    }
    return localAnimatorProxy2;
  }
  
  protected void applyTransformation(float paramFloat, Transformation paramTransformation)
  {
    View localView = (View)this.mView.get();
    if (localView != null)
    {
      paramTransformation.setAlpha(this.mAlpha);
      transformMatrix(paramTransformation.getMatrix(), localView);
    }
  }
  
  public float getAlpha()
  {
    return this.mAlpha;
  }
  
  public float getPivotX()
  {
    return this.mPivotX;
  }
  
  public float getPivotY()
  {
    return this.mPivotY;
  }
  
  public float getRotation()
  {
    return this.mRotationZ;
  }
  
  public float getRotationX()
  {
    return this.mRotationX;
  }
  
  public float getRotationY()
  {
    return this.mRotationY;
  }
  
  public float getScaleX()
  {
    return this.mScaleX;
  }
  
  public float getScaleY()
  {
    return this.mScaleY;
  }
  
  public int getScrollX()
  {
    View localView = (View)this.mView.get();
    if (localView == null) {}
    for (int i = 0;; i = localView.getScrollX()) {
      return i;
    }
  }
  
  public int getScrollY()
  {
    View localView = (View)this.mView.get();
    if (localView == null) {}
    for (int i = 0;; i = localView.getScrollY()) {
      return i;
    }
  }
  
  public float getTranslationX()
  {
    return this.mTranslationX;
  }
  
  public float getTranslationY()
  {
    return this.mTranslationY;
  }
  
  public float getX()
  {
    View localView = (View)this.mView.get();
    if (localView == null) {}
    for (float f = 0.0F;; f = localView.getLeft() + this.mTranslationX) {
      return f;
    }
  }
  
  public float getY()
  {
    View localView = (View)this.mView.get();
    if (localView == null) {}
    for (float f = 0.0F;; f = localView.getTop() + this.mTranslationY) {
      return f;
    }
  }
  
  public void setAlpha(float paramFloat)
  {
    if (this.mAlpha != paramFloat)
    {
      this.mAlpha = paramFloat;
      View localView = (View)this.mView.get();
      if (localView != null) {
        localView.invalidate();
      }
    }
  }
  
  public void setPivotX(float paramFloat)
  {
    if ((!this.mHasPivot) || (this.mPivotX != paramFloat))
    {
      prepareForUpdate();
      this.mHasPivot = true;
      this.mPivotX = paramFloat;
      invalidateAfterUpdate();
    }
  }
  
  public void setPivotY(float paramFloat)
  {
    if ((!this.mHasPivot) || (this.mPivotY != paramFloat))
    {
      prepareForUpdate();
      this.mHasPivot = true;
      this.mPivotY = paramFloat;
      invalidateAfterUpdate();
    }
  }
  
  public void setRotation(float paramFloat)
  {
    if (this.mRotationZ != paramFloat)
    {
      prepareForUpdate();
      this.mRotationZ = paramFloat;
      invalidateAfterUpdate();
    }
  }
  
  public void setRotationX(float paramFloat)
  {
    if (this.mRotationX != paramFloat)
    {
      prepareForUpdate();
      this.mRotationX = paramFloat;
      invalidateAfterUpdate();
    }
  }
  
  public void setRotationY(float paramFloat)
  {
    if (this.mRotationY != paramFloat)
    {
      prepareForUpdate();
      this.mRotationY = paramFloat;
      invalidateAfterUpdate();
    }
  }
  
  public void setScaleX(float paramFloat)
  {
    if (this.mScaleX != paramFloat)
    {
      prepareForUpdate();
      this.mScaleX = paramFloat;
      invalidateAfterUpdate();
    }
  }
  
  public void setScaleY(float paramFloat)
  {
    if (this.mScaleY != paramFloat)
    {
      prepareForUpdate();
      this.mScaleY = paramFloat;
      invalidateAfterUpdate();
    }
  }
  
  public void setScrollX(int paramInt)
  {
    View localView = (View)this.mView.get();
    if (localView != null) {
      localView.scrollTo(paramInt, localView.getScrollY());
    }
  }
  
  public void setScrollY(int paramInt)
  {
    View localView = (View)this.mView.get();
    if (localView != null) {
      localView.scrollTo(localView.getScrollX(), paramInt);
    }
  }
  
  public void setTranslationX(float paramFloat)
  {
    if (this.mTranslationX != paramFloat)
    {
      prepareForUpdate();
      this.mTranslationX = paramFloat;
      invalidateAfterUpdate();
    }
  }
  
  public void setTranslationY(float paramFloat)
  {
    if (this.mTranslationY != paramFloat)
    {
      prepareForUpdate();
      this.mTranslationY = paramFloat;
      invalidateAfterUpdate();
    }
  }
  
  public void setX(float paramFloat)
  {
    View localView = (View)this.mView.get();
    if (localView != null) {
      setTranslationX(paramFloat - localView.getLeft());
    }
  }
  
  public void setY(float paramFloat)
  {
    View localView = (View)this.mView.get();
    if (localView != null) {
      setTranslationY(paramFloat - localView.getTop());
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/nineoldandroids/view/animation/AnimatorProxy.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */