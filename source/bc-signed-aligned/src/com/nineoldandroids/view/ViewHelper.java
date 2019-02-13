package com.nineoldandroids.view;

import android.view.View;
import com.nineoldandroids.view.animation.AnimatorProxy;

public final class ViewHelper
{
  public static float getAlpha(View paramView)
  {
    if (AnimatorProxy.NEEDS_PROXY) {}
    for (float f = AnimatorProxy.wrap(paramView).getAlpha();; f = Honeycomb.getAlpha(paramView)) {
      return f;
    }
  }
  
  public static float getPivotX(View paramView)
  {
    if (AnimatorProxy.NEEDS_PROXY) {}
    for (float f = AnimatorProxy.wrap(paramView).getPivotX();; f = Honeycomb.getPivotX(paramView)) {
      return f;
    }
  }
  
  public static float getPivotY(View paramView)
  {
    if (AnimatorProxy.NEEDS_PROXY) {}
    for (float f = AnimatorProxy.wrap(paramView).getPivotY();; f = Honeycomb.getPivotY(paramView)) {
      return f;
    }
  }
  
  public static float getRotation(View paramView)
  {
    if (AnimatorProxy.NEEDS_PROXY) {}
    for (float f = AnimatorProxy.wrap(paramView).getRotation();; f = Honeycomb.getRotation(paramView)) {
      return f;
    }
  }
  
  public static float getRotationX(View paramView)
  {
    if (AnimatorProxy.NEEDS_PROXY) {}
    for (float f = AnimatorProxy.wrap(paramView).getRotationX();; f = Honeycomb.getRotationX(paramView)) {
      return f;
    }
  }
  
  public static float getRotationY(View paramView)
  {
    if (AnimatorProxy.NEEDS_PROXY) {}
    for (float f = AnimatorProxy.wrap(paramView).getRotationY();; f = Honeycomb.getRotationY(paramView)) {
      return f;
    }
  }
  
  public static float getScaleX(View paramView)
  {
    if (AnimatorProxy.NEEDS_PROXY) {}
    for (float f = AnimatorProxy.wrap(paramView).getScaleX();; f = Honeycomb.getScaleX(paramView)) {
      return f;
    }
  }
  
  public static float getScaleY(View paramView)
  {
    if (AnimatorProxy.NEEDS_PROXY) {}
    for (float f = AnimatorProxy.wrap(paramView).getScaleY();; f = Honeycomb.getScaleY(paramView)) {
      return f;
    }
  }
  
  public static float getScrollX(View paramView)
  {
    if (AnimatorProxy.NEEDS_PROXY) {}
    for (float f = AnimatorProxy.wrap(paramView).getScrollX();; f = Honeycomb.getScrollX(paramView)) {
      return f;
    }
  }
  
  public static float getScrollY(View paramView)
  {
    if (AnimatorProxy.NEEDS_PROXY) {}
    for (float f = AnimatorProxy.wrap(paramView).getScrollY();; f = Honeycomb.getScrollY(paramView)) {
      return f;
    }
  }
  
  public static float getTranslationX(View paramView)
  {
    if (AnimatorProxy.NEEDS_PROXY) {}
    for (float f = AnimatorProxy.wrap(paramView).getTranslationX();; f = Honeycomb.getTranslationX(paramView)) {
      return f;
    }
  }
  
  public static float getTranslationY(View paramView)
  {
    if (AnimatorProxy.NEEDS_PROXY) {}
    for (float f = AnimatorProxy.wrap(paramView).getTranslationY();; f = Honeycomb.getTranslationY(paramView)) {
      return f;
    }
  }
  
  public static float getX(View paramView)
  {
    if (AnimatorProxy.NEEDS_PROXY) {}
    for (float f = AnimatorProxy.wrap(paramView).getX();; f = Honeycomb.getX(paramView)) {
      return f;
    }
  }
  
  public static float getY(View paramView)
  {
    if (AnimatorProxy.NEEDS_PROXY) {}
    for (float f = AnimatorProxy.wrap(paramView).getY();; f = Honeycomb.getY(paramView)) {
      return f;
    }
  }
  
  public static void setAlpha(View paramView, float paramFloat)
  {
    if (AnimatorProxy.NEEDS_PROXY) {
      AnimatorProxy.wrap(paramView).setAlpha(paramFloat);
    }
    for (;;)
    {
      return;
      Honeycomb.setAlpha(paramView, paramFloat);
    }
  }
  
  public static void setPivotX(View paramView, float paramFloat)
  {
    if (AnimatorProxy.NEEDS_PROXY) {
      AnimatorProxy.wrap(paramView).setPivotX(paramFloat);
    }
    for (;;)
    {
      return;
      Honeycomb.setPivotX(paramView, paramFloat);
    }
  }
  
  public static void setPivotY(View paramView, float paramFloat)
  {
    if (AnimatorProxy.NEEDS_PROXY) {
      AnimatorProxy.wrap(paramView).setPivotY(paramFloat);
    }
    for (;;)
    {
      return;
      Honeycomb.setPivotY(paramView, paramFloat);
    }
  }
  
  public static void setRotation(View paramView, float paramFloat)
  {
    if (AnimatorProxy.NEEDS_PROXY) {
      AnimatorProxy.wrap(paramView).setRotation(paramFloat);
    }
    for (;;)
    {
      return;
      Honeycomb.setRotation(paramView, paramFloat);
    }
  }
  
  public static void setRotationX(View paramView, float paramFloat)
  {
    if (AnimatorProxy.NEEDS_PROXY) {
      AnimatorProxy.wrap(paramView).setRotationX(paramFloat);
    }
    for (;;)
    {
      return;
      Honeycomb.setRotationX(paramView, paramFloat);
    }
  }
  
  public static void setRotationY(View paramView, float paramFloat)
  {
    if (AnimatorProxy.NEEDS_PROXY) {
      AnimatorProxy.wrap(paramView).setRotationY(paramFloat);
    }
    for (;;)
    {
      return;
      Honeycomb.setRotationY(paramView, paramFloat);
    }
  }
  
  public static void setScaleX(View paramView, float paramFloat)
  {
    if (AnimatorProxy.NEEDS_PROXY) {
      AnimatorProxy.wrap(paramView).setScaleX(paramFloat);
    }
    for (;;)
    {
      return;
      Honeycomb.setScaleX(paramView, paramFloat);
    }
  }
  
  public static void setScaleY(View paramView, float paramFloat)
  {
    if (AnimatorProxy.NEEDS_PROXY) {
      AnimatorProxy.wrap(paramView).setScaleY(paramFloat);
    }
    for (;;)
    {
      return;
      Honeycomb.setScaleY(paramView, paramFloat);
    }
  }
  
  public static void setScrollX(View paramView, int paramInt)
  {
    if (AnimatorProxy.NEEDS_PROXY) {
      AnimatorProxy.wrap(paramView).setScrollX(paramInt);
    }
    for (;;)
    {
      return;
      Honeycomb.setScrollX(paramView, paramInt);
    }
  }
  
  public static void setScrollY(View paramView, int paramInt)
  {
    if (AnimatorProxy.NEEDS_PROXY) {
      AnimatorProxy.wrap(paramView).setScrollY(paramInt);
    }
    for (;;)
    {
      return;
      Honeycomb.setScrollY(paramView, paramInt);
    }
  }
  
  public static void setTranslationX(View paramView, float paramFloat)
  {
    if (AnimatorProxy.NEEDS_PROXY) {
      AnimatorProxy.wrap(paramView).setTranslationX(paramFloat);
    }
    for (;;)
    {
      return;
      Honeycomb.setTranslationX(paramView, paramFloat);
    }
  }
  
  public static void setTranslationY(View paramView, float paramFloat)
  {
    if (AnimatorProxy.NEEDS_PROXY) {
      AnimatorProxy.wrap(paramView).setTranslationY(paramFloat);
    }
    for (;;)
    {
      return;
      Honeycomb.setTranslationY(paramView, paramFloat);
    }
  }
  
  public static void setX(View paramView, float paramFloat)
  {
    if (AnimatorProxy.NEEDS_PROXY) {
      AnimatorProxy.wrap(paramView).setX(paramFloat);
    }
    for (;;)
    {
      return;
      Honeycomb.setX(paramView, paramFloat);
    }
  }
  
  public static void setY(View paramView, float paramFloat)
  {
    if (AnimatorProxy.NEEDS_PROXY) {
      AnimatorProxy.wrap(paramView).setY(paramFloat);
    }
    for (;;)
    {
      return;
      Honeycomb.setY(paramView, paramFloat);
    }
  }
  
  private static final class Honeycomb
  {
    static float getAlpha(View paramView)
    {
      return paramView.getAlpha();
    }
    
    static float getPivotX(View paramView)
    {
      return paramView.getPivotX();
    }
    
    static float getPivotY(View paramView)
    {
      return paramView.getPivotY();
    }
    
    static float getRotation(View paramView)
    {
      return paramView.getRotation();
    }
    
    static float getRotationX(View paramView)
    {
      return paramView.getRotationX();
    }
    
    static float getRotationY(View paramView)
    {
      return paramView.getRotationY();
    }
    
    static float getScaleX(View paramView)
    {
      return paramView.getScaleX();
    }
    
    static float getScaleY(View paramView)
    {
      return paramView.getScaleY();
    }
    
    static float getScrollX(View paramView)
    {
      return paramView.getScrollX();
    }
    
    static float getScrollY(View paramView)
    {
      return paramView.getScrollY();
    }
    
    static float getTranslationX(View paramView)
    {
      return paramView.getTranslationX();
    }
    
    static float getTranslationY(View paramView)
    {
      return paramView.getTranslationY();
    }
    
    static float getX(View paramView)
    {
      return paramView.getX();
    }
    
    static float getY(View paramView)
    {
      return paramView.getY();
    }
    
    static void setAlpha(View paramView, float paramFloat)
    {
      paramView.setAlpha(paramFloat);
    }
    
    static void setPivotX(View paramView, float paramFloat)
    {
      paramView.setPivotX(paramFloat);
    }
    
    static void setPivotY(View paramView, float paramFloat)
    {
      paramView.setPivotY(paramFloat);
    }
    
    static void setRotation(View paramView, float paramFloat)
    {
      paramView.setRotation(paramFloat);
    }
    
    static void setRotationX(View paramView, float paramFloat)
    {
      paramView.setRotationX(paramFloat);
    }
    
    static void setRotationY(View paramView, float paramFloat)
    {
      paramView.setRotationY(paramFloat);
    }
    
    static void setScaleX(View paramView, float paramFloat)
    {
      paramView.setScaleX(paramFloat);
    }
    
    static void setScaleY(View paramView, float paramFloat)
    {
      paramView.setScaleY(paramFloat);
    }
    
    static void setScrollX(View paramView, int paramInt)
    {
      paramView.setScrollX(paramInt);
    }
    
    static void setScrollY(View paramView, int paramInt)
    {
      paramView.setScrollY(paramInt);
    }
    
    static void setTranslationX(View paramView, float paramFloat)
    {
      paramView.setTranslationX(paramFloat);
    }
    
    static void setTranslationY(View paramView, float paramFloat)
    {
      paramView.setTranslationY(paramFloat);
    }
    
    static void setX(View paramView, float paramFloat)
    {
      paramView.setX(paramFloat);
    }
    
    static void setY(View paramView, float paramFloat)
    {
      paramView.setY(paramFloat);
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/com/nineoldandroids/view/ViewHelper.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */