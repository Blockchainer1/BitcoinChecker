package android.support.v4.widget;

import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.PorterDuff.Mode;
import android.graphics.PorterDuffColorFilter;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Build.VERSION;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.support.v4.view.AccessibilityDelegateCompat;
import android.support.v4.view.MotionEventCompat;
import android.support.v4.view.ViewCompat;
import android.support.v4.view.accessibility.AccessibilityNodeInfoCompat;
import android.util.AttributeSet;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.BaseSavedState;
import android.view.View.MeasureSpec;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.view.ViewGroup.MarginLayoutParams;
import android.view.accessibility.AccessibilityEvent;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;

public class SlidingPaneLayout
  extends ViewGroup
{
  private static final int DEFAULT_FADE_COLOR = -858993460;
  private static final int DEFAULT_OVERHANG_SIZE = 32;
  static final SlidingPanelLayoutImpl IMPL;
  private static final int MIN_FLING_VELOCITY = 400;
  private static final String TAG = "SlidingPaneLayout";
  private boolean mCanSlide;
  private int mCoveredFadeColor;
  private final ViewDragHelper mDragHelper;
  private boolean mFirstLayout = true;
  private float mInitialMotionX;
  private float mInitialMotionY;
  private boolean mIsUnableToDrag;
  private final int mOverhangSize;
  private PanelSlideListener mPanelSlideListener;
  private int mParallaxBy;
  private float mParallaxOffset;
  private final ArrayList<DisableLayerRunnable> mPostedRunnables = new ArrayList();
  private boolean mPreservedOpenState;
  private Drawable mShadowDrawableLeft;
  private Drawable mShadowDrawableRight;
  private float mSlideOffset;
  private int mSlideRange;
  private View mSlideableView;
  private int mSliderFadeColor = -858993460;
  private final Rect mTmpRect = new Rect();
  
  static
  {
    int i = Build.VERSION.SDK_INT;
    if (i >= 17) {
      IMPL = new SlidingPanelLayoutImplJBMR1();
    }
    for (;;)
    {
      return;
      if (i >= 16) {
        IMPL = new SlidingPanelLayoutImplJB();
      } else {
        IMPL = new SlidingPanelLayoutImplBase();
      }
    }
  }
  
  public SlidingPaneLayout(Context paramContext)
  {
    this(paramContext, null);
  }
  
  public SlidingPaneLayout(Context paramContext, AttributeSet paramAttributeSet)
  {
    this(paramContext, paramAttributeSet, 0);
  }
  
  public SlidingPaneLayout(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    float f = paramContext.getResources().getDisplayMetrics().density;
    this.mOverhangSize = ((int)(32.0F * f + 0.5F));
    ViewConfiguration.get(paramContext);
    setWillNotDraw(false);
    ViewCompat.setAccessibilityDelegate(this, new AccessibilityDelegate());
    ViewCompat.setImportantForAccessibility(this, 1);
    this.mDragHelper = ViewDragHelper.create(this, 0.5F, new DragHelperCallback(null));
    this.mDragHelper.setMinVelocity(400.0F * f);
  }
  
  private boolean closePane(View paramView, int paramInt)
  {
    boolean bool = false;
    if ((this.mFirstLayout) || (smoothSlideTo(0.0F, paramInt)))
    {
      this.mPreservedOpenState = false;
      bool = true;
    }
    return bool;
  }
  
  private void dimChildView(View paramView, float paramFloat, int paramInt)
  {
    LayoutParams localLayoutParams = (LayoutParams)paramView.getLayoutParams();
    if ((paramFloat > 0.0F) && (paramInt != 0))
    {
      int i = (int)(((0xFF000000 & paramInt) >>> 24) * paramFloat);
      if (localLayoutParams.dimPaint == null) {
        localLayoutParams.dimPaint = new Paint();
      }
      localLayoutParams.dimPaint.setColorFilter(new PorterDuffColorFilter(i << 24 | 0xFFFFFF & paramInt, PorterDuff.Mode.SRC_OVER));
      if (ViewCompat.getLayerType(paramView) != 2) {
        ViewCompat.setLayerType(paramView, 2, localLayoutParams.dimPaint);
      }
      invalidateChildRegion(paramView);
    }
    for (;;)
    {
      return;
      if (ViewCompat.getLayerType(paramView) != 0)
      {
        if (localLayoutParams.dimPaint != null) {
          localLayoutParams.dimPaint.setColorFilter(null);
        }
        paramView = new DisableLayerRunnable(paramView);
        this.mPostedRunnables.add(paramView);
        ViewCompat.postOnAnimation(this, paramView);
      }
    }
  }
  
  private void invalidateChildRegion(View paramView)
  {
    IMPL.invalidateChildRegion(this, paramView);
  }
  
  private boolean isLayoutRtlSupport()
  {
    boolean bool = true;
    if (ViewCompat.getLayoutDirection(this) == 1) {}
    for (;;)
    {
      return bool;
      bool = false;
    }
  }
  
  private void onPanelDragged(int paramInt)
  {
    if (this.mSlideableView == null)
    {
      this.mSlideOffset = 0.0F;
      return;
    }
    boolean bool = isLayoutRtlSupport();
    LayoutParams localLayoutParams = (LayoutParams)this.mSlideableView.getLayoutParams();
    int i = this.mSlideableView.getWidth();
    if (bool)
    {
      paramInt = getWidth() - paramInt - i;
      label52:
      if (!bool) {
        break label142;
      }
      i = getPaddingRight();
      label62:
      if (!bool) {
        break label151;
      }
    }
    label142:
    label151:
    for (int j = localLayoutParams.rightMargin;; j = localLayoutParams.leftMargin)
    {
      this.mSlideOffset = ((paramInt - (i + j)) / this.mSlideRange);
      if (this.mParallaxBy != 0) {
        parallaxOtherViews(this.mSlideOffset);
      }
      if (localLayoutParams.dimWhenOffset) {
        dimChildView(this.mSlideableView, this.mSlideOffset, this.mSliderFadeColor);
      }
      dispatchOnPanelSlide(this.mSlideableView);
      break;
      break label52;
      i = getPaddingLeft();
      break label62;
    }
  }
  
  private boolean openPane(View paramView, int paramInt)
  {
    boolean bool = true;
    if ((this.mFirstLayout) || (smoothSlideTo(1.0F, paramInt))) {
      this.mPreservedOpenState = true;
    }
    for (;;)
    {
      return bool;
      bool = false;
    }
  }
  
  private void parallaxOtherViews(float paramFloat)
  {
    boolean bool = isLayoutRtlSupport();
    Object localObject = (LayoutParams)this.mSlideableView.getLayoutParams();
    int i;
    label41:
    int k;
    if (((LayoutParams)localObject).dimWhenOffset) {
      if (bool)
      {
        i = ((LayoutParams)localObject).rightMargin;
        if (i > 0) {
          break label87;
        }
        i = 1;
        int j = getChildCount();
        k = 0;
        label50:
        if (k >= j) {
          return;
        }
        localObject = getChildAt(k);
        if (localObject != this.mSlideableView) {
          break label93;
        }
      }
    }
    label87:
    label93:
    do
    {
      k++;
      break label50;
      i = ((LayoutParams)localObject).leftMargin;
      break;
      i = 0;
      break label41;
      int m = (int)((1.0F - this.mParallaxOffset) * this.mParallaxBy);
      this.mParallaxOffset = paramFloat;
      int n = m - (int)((1.0F - paramFloat) * this.mParallaxBy);
      m = n;
      if (bool) {
        m = -n;
      }
      ((View)localObject).offsetLeftAndRight(m);
    } while (i == 0);
    if (bool) {}
    for (float f = this.mParallaxOffset - 1.0F;; f = 1.0F - this.mParallaxOffset)
    {
      dimChildView((View)localObject, f, this.mCoveredFadeColor);
      break;
    }
  }
  
  private static boolean viewIsOpaque(View paramView)
  {
    boolean bool = true;
    if (ViewCompat.isOpaque(paramView)) {}
    for (;;)
    {
      return bool;
      if (Build.VERSION.SDK_INT >= 18)
      {
        bool = false;
      }
      else
      {
        paramView = paramView.getBackground();
        if (paramView != null)
        {
          if (paramView.getOpacity() != -1) {
            bool = false;
          }
        }
        else {
          bool = false;
        }
      }
    }
  }
  
  protected boolean canScroll(View paramView, boolean paramBoolean, int paramInt1, int paramInt2, int paramInt3)
  {
    int k;
    if ((paramView instanceof ViewGroup))
    {
      ViewGroup localViewGroup = (ViewGroup)paramView;
      int i = paramView.getScrollX();
      int j = paramView.getScrollY();
      k = localViewGroup.getChildCount() - 1;
      if (k >= 0)
      {
        View localView = localViewGroup.getChildAt(k);
        if ((paramInt2 + i >= localView.getLeft()) && (paramInt2 + i < localView.getRight()) && (paramInt3 + j >= localView.getTop()) && (paramInt3 + j < localView.getBottom()) && (canScroll(localView, true, paramInt1, paramInt2 + i - localView.getLeft(), paramInt3 + j - localView.getTop()))) {
          paramBoolean = true;
        }
      }
    }
    for (;;)
    {
      return paramBoolean;
      k--;
      break;
      if (paramBoolean)
      {
        if (isLayoutRtlSupport()) {}
        for (;;)
        {
          if (!ViewCompat.canScrollHorizontally(paramView, paramInt1)) {
            break label173;
          }
          paramBoolean = true;
          break;
          paramInt1 = -paramInt1;
        }
      }
      label173:
      paramBoolean = false;
    }
  }
  
  @Deprecated
  public boolean canSlide()
  {
    return this.mCanSlide;
  }
  
  protected boolean checkLayoutParams(ViewGroup.LayoutParams paramLayoutParams)
  {
    if (((paramLayoutParams instanceof LayoutParams)) && (super.checkLayoutParams(paramLayoutParams))) {}
    for (boolean bool = true;; bool = false) {
      return bool;
    }
  }
  
  public boolean closePane()
  {
    return closePane(this.mSlideableView, 0);
  }
  
  public void computeScroll()
  {
    if (this.mDragHelper.continueSettling(true))
    {
      if (this.mCanSlide) {
        break label26;
      }
      this.mDragHelper.abort();
    }
    for (;;)
    {
      return;
      label26:
      ViewCompat.postInvalidateOnAnimation(this);
    }
  }
  
  void dispatchOnPanelClosed(View paramView)
  {
    if (this.mPanelSlideListener != null) {
      this.mPanelSlideListener.onPanelClosed(paramView);
    }
    sendAccessibilityEvent(32);
  }
  
  void dispatchOnPanelOpened(View paramView)
  {
    if (this.mPanelSlideListener != null) {
      this.mPanelSlideListener.onPanelOpened(paramView);
    }
    sendAccessibilityEvent(32);
  }
  
  void dispatchOnPanelSlide(View paramView)
  {
    if (this.mPanelSlideListener != null) {
      this.mPanelSlideListener.onPanelSlide(paramView, this.mSlideOffset);
    }
  }
  
  public void draw(Canvas paramCanvas)
  {
    super.draw(paramCanvas);
    Drawable localDrawable;
    if (isLayoutRtlSupport())
    {
      localDrawable = this.mShadowDrawableRight;
      if (getChildCount() <= 1) {
        break label48;
      }
    }
    label48:
    for (View localView = getChildAt(1);; localView = null)
    {
      if ((localView != null) && (localDrawable != null)) {
        break label53;
      }
      return;
      localDrawable = this.mShadowDrawableLeft;
      break;
    }
    label53:
    int i = localView.getTop();
    int j = localView.getBottom();
    int k = localDrawable.getIntrinsicWidth();
    int m;
    int n;
    if (isLayoutRtlSupport())
    {
      m = localView.getRight();
      n = m + k;
    }
    for (;;)
    {
      localDrawable.setBounds(m, i, n, j);
      localDrawable.draw(paramCanvas);
      break;
      n = localView.getLeft();
      m = n - k;
    }
  }
  
  protected boolean drawChild(Canvas paramCanvas, View paramView, long paramLong)
  {
    LayoutParams localLayoutParams = (LayoutParams)paramView.getLayoutParams();
    int i = paramCanvas.save(2);
    boolean bool;
    if ((this.mCanSlide) && (!localLayoutParams.slideable) && (this.mSlideableView != null))
    {
      paramCanvas.getClipBounds(this.mTmpRect);
      if (isLayoutRtlSupport())
      {
        this.mTmpRect.left = Math.max(this.mTmpRect.left, this.mSlideableView.getRight());
        paramCanvas.clipRect(this.mTmpRect);
      }
    }
    else
    {
      if (Build.VERSION.SDK_INT < 11) {
        break label140;
      }
      bool = super.drawChild(paramCanvas, paramView, paramLong);
    }
    for (;;)
    {
      paramCanvas.restoreToCount(i);
      return bool;
      this.mTmpRect.right = Math.min(this.mTmpRect.right, this.mSlideableView.getLeft());
      break;
      label140:
      if ((localLayoutParams.dimWhenOffset) && (this.mSlideOffset > 0.0F))
      {
        if (!paramView.isDrawingCacheEnabled()) {
          paramView.setDrawingCacheEnabled(true);
        }
        Bitmap localBitmap = paramView.getDrawingCache();
        if (localBitmap != null)
        {
          paramCanvas.drawBitmap(localBitmap, paramView.getLeft(), paramView.getTop(), localLayoutParams.dimPaint);
          bool = false;
        }
        else
        {
          Log.e("SlidingPaneLayout", "drawChild: child view " + paramView + " returned null drawing cache");
          bool = super.drawChild(paramCanvas, paramView, paramLong);
        }
      }
      else
      {
        if (paramView.isDrawingCacheEnabled()) {
          paramView.setDrawingCacheEnabled(false);
        }
        bool = super.drawChild(paramCanvas, paramView, paramLong);
      }
    }
  }
  
  protected ViewGroup.LayoutParams generateDefaultLayoutParams()
  {
    return new LayoutParams();
  }
  
  public ViewGroup.LayoutParams generateLayoutParams(AttributeSet paramAttributeSet)
  {
    return new LayoutParams(getContext(), paramAttributeSet);
  }
  
  protected ViewGroup.LayoutParams generateLayoutParams(ViewGroup.LayoutParams paramLayoutParams)
  {
    if ((paramLayoutParams instanceof ViewGroup.MarginLayoutParams)) {}
    for (paramLayoutParams = new LayoutParams((ViewGroup.MarginLayoutParams)paramLayoutParams);; paramLayoutParams = new LayoutParams(paramLayoutParams)) {
      return paramLayoutParams;
    }
  }
  
  public int getCoveredFadeColor()
  {
    return this.mCoveredFadeColor;
  }
  
  public int getParallaxDistance()
  {
    return this.mParallaxBy;
  }
  
  public int getSliderFadeColor()
  {
    return this.mSliderFadeColor;
  }
  
  boolean isDimmed(View paramView)
  {
    boolean bool1 = false;
    boolean bool2;
    if (paramView == null) {
      bool2 = bool1;
    }
    for (;;)
    {
      return bool2;
      paramView = (LayoutParams)paramView.getLayoutParams();
      bool2 = bool1;
      if (this.mCanSlide)
      {
        bool2 = bool1;
        if (paramView.dimWhenOffset)
        {
          bool2 = bool1;
          if (this.mSlideOffset > 0.0F) {
            bool2 = true;
          }
        }
      }
    }
  }
  
  public boolean isOpen()
  {
    if ((!this.mCanSlide) || (this.mSlideOffset == 1.0F)) {}
    for (boolean bool = true;; bool = false) {
      return bool;
    }
  }
  
  public boolean isSlideable()
  {
    return this.mCanSlide;
  }
  
  protected void onAttachedToWindow()
  {
    super.onAttachedToWindow();
    this.mFirstLayout = true;
  }
  
  protected void onDetachedFromWindow()
  {
    super.onDetachedFromWindow();
    this.mFirstLayout = true;
    int i = 0;
    int j = this.mPostedRunnables.size();
    while (i < j)
    {
      ((DisableLayerRunnable)this.mPostedRunnables.get(i)).run();
      i++;
    }
    this.mPostedRunnables.clear();
  }
  
  public boolean onInterceptTouchEvent(MotionEvent paramMotionEvent)
  {
    int i = MotionEventCompat.getActionMasked(paramMotionEvent);
    boolean bool;
    if ((!this.mCanSlide) && (i == 0) && (getChildCount() > 1))
    {
      View localView = getChildAt(1);
      if (localView != null)
      {
        if (this.mDragHelper.isViewUnder(localView, (int)paramMotionEvent.getX(), (int)paramMotionEvent.getY())) {
          break label99;
        }
        bool = true;
        this.mPreservedOpenState = bool;
      }
    }
    if ((!this.mCanSlide) || ((this.mIsUnableToDrag) && (i != 0)))
    {
      this.mDragHelper.cancel();
      bool = super.onInterceptTouchEvent(paramMotionEvent);
    }
    for (;;)
    {
      return bool;
      label99:
      bool = false;
      break;
      if ((i == 3) || (i == 1))
      {
        this.mDragHelper.cancel();
        bool = false;
      }
      else
      {
        int j = 0;
        int k = j;
        switch (i)
        {
        default: 
          k = j;
        }
        for (;;)
        {
          if ((this.mDragHelper.shouldInterceptTouchEvent(paramMotionEvent)) || (k != 0))
          {
            bool = true;
            break;
            this.mIsUnableToDrag = false;
            float f1 = paramMotionEvent.getX();
            float f2 = paramMotionEvent.getY();
            this.mInitialMotionX = f1;
            this.mInitialMotionY = f2;
            k = j;
            if (this.mDragHelper.isViewUnder(this.mSlideableView, (int)f1, (int)f2))
            {
              k = j;
              if (isDimmed(this.mSlideableView))
              {
                k = 1;
                continue;
                f1 = paramMotionEvent.getX();
                f2 = paramMotionEvent.getY();
                f1 = Math.abs(f1 - this.mInitialMotionX);
                f2 = Math.abs(f2 - this.mInitialMotionY);
                k = j;
                if (f1 > this.mDragHelper.getTouchSlop())
                {
                  k = j;
                  if (f2 > f1)
                  {
                    this.mDragHelper.cancel();
                    this.mIsUnableToDrag = true;
                    bool = false;
                    break;
                  }
                }
              }
            }
          }
        }
        bool = false;
      }
    }
  }
  
  protected void onLayout(boolean paramBoolean, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    boolean bool = isLayoutRtlSupport();
    int i;
    label35:
    label46:
    int j;
    int k;
    if (bool)
    {
      this.mDragHelper.setEdgeTrackingEnabled(2);
      i = paramInt3 - paramInt1;
      if (!bool) {
        break label145;
      }
      paramInt1 = getPaddingRight();
      if (!bool) {
        break label153;
      }
      paramInt3 = getPaddingLeft();
      j = getPaddingTop();
      k = getChildCount();
      paramInt4 = paramInt1;
      if (this.mFirstLayout) {
        if ((!this.mCanSlide) || (!this.mPreservedOpenState)) {
          break label162;
        }
      }
    }
    int m;
    View localView;
    label145:
    label153:
    label162:
    for (float f = 1.0F;; f = 0.0F)
    {
      this.mSlideOffset = f;
      m = 0;
      paramInt2 = paramInt1;
      paramInt1 = paramInt4;
      for (paramInt4 = m;; paramInt4++)
      {
        if (paramInt4 >= k) {
          break label441;
        }
        localView = getChildAt(paramInt4);
        if (localView.getVisibility() != 8) {
          break;
        }
      }
      this.mDragHelper.setEdgeTrackingEnabled(1);
      break;
      paramInt1 = getPaddingLeft();
      break label35;
      paramInt3 = getPaddingRight();
      break label46;
    }
    LayoutParams localLayoutParams = (LayoutParams)localView.getLayoutParams();
    int n = localView.getMeasuredWidth();
    int i1 = 0;
    if (localLayoutParams.slideable)
    {
      int i2 = localLayoutParams.leftMargin;
      m = localLayoutParams.rightMargin;
      i2 = Math.min(paramInt1, i - paramInt3 - this.mOverhangSize) - paramInt2 - (i2 + m);
      this.mSlideRange = i2;
      if (bool)
      {
        m = localLayoutParams.rightMargin;
        label252:
        if (paramInt2 + m + i2 + n / 2 <= i - paramInt3) {
          break label377;
        }
        paramBoolean = true;
        label274:
        localLayoutParams.dimWhenOffset = paramBoolean;
        i2 = (int)(i2 * this.mSlideOffset);
        paramInt2 += i2 + m;
        this.mSlideOffset = (i2 / this.mSlideRange);
        m = i1;
        label316:
        if (!bool) {
          break label425;
        }
        m = i - paramInt2 + m;
        i1 = m - n;
      }
    }
    for (;;)
    {
      localView.layout(i1, j, m, j + localView.getMeasuredHeight());
      paramInt1 += localView.getWidth();
      break;
      m = localLayoutParams.leftMargin;
      break label252;
      label377:
      paramBoolean = false;
      break label274;
      if ((this.mCanSlide) && (this.mParallaxBy != 0))
      {
        m = (int)((1.0F - this.mSlideOffset) * this.mParallaxBy);
        paramInt2 = paramInt1;
        break label316;
      }
      paramInt2 = paramInt1;
      m = i1;
      break label316;
      label425:
      i1 = paramInt2 - m;
      m = i1 + n;
    }
    label441:
    if (this.mFirstLayout)
    {
      if (!this.mCanSlide) {
        break label516;
      }
      if (this.mParallaxBy != 0) {
        parallaxOtherViews(this.mSlideOffset);
      }
      if (((LayoutParams)this.mSlideableView.getLayoutParams()).dimWhenOffset) {
        dimChildView(this.mSlideableView, this.mSlideOffset, this.mSliderFadeColor);
      }
    }
    for (;;)
    {
      updateObscuredViewsVisibility(this.mSlideableView);
      this.mFirstLayout = false;
      return;
      label516:
      for (paramInt1 = 0; paramInt1 < k; paramInt1++) {
        dimChildView(getChildAt(paramInt1), 0.0F, this.mSliderFadeColor);
      }
    }
  }
  
  protected void onMeasure(int paramInt1, int paramInt2)
  {
    int i = View.MeasureSpec.getMode(paramInt1);
    int j = View.MeasureSpec.getSize(paramInt1);
    int k = View.MeasureSpec.getMode(paramInt2);
    paramInt2 = View.MeasureSpec.getSize(paramInt2);
    int m;
    int n;
    label88:
    float f1;
    boolean bool1;
    int i1;
    int i2;
    int i3;
    label140:
    View localView;
    LayoutParams localLayoutParams;
    int i4;
    if (i != 1073741824) {
      if (isInEditMode()) {
        if (i == Integer.MIN_VALUE)
        {
          m = j;
          paramInt1 = paramInt2;
          n = k;
          j = 0;
          paramInt2 = -1;
          switch (n)
          {
          default: 
            f1 = 0.0F;
            bool1 = false;
            i1 = m - getPaddingLeft() - getPaddingRight();
            i = i1;
            i2 = getChildCount();
            if (i2 > 2) {
              Log.e("SlidingPaneLayout", "onMeasure: More than two child views are not supported.");
            }
            this.mSlideableView = null;
            i3 = 0;
            if (i3 >= i2) {
              break label650;
            }
            localView = getChildAt(i3);
            localLayoutParams = (LayoutParams)localView.getLayoutParams();
            if (localView.getVisibility() == 8)
            {
              localLayoutParams.dimWhenOffset = false;
              i4 = i;
              k = j;
              bool2 = bool1;
            }
            break;
          }
        }
      }
    }
    float f2;
    do
    {
      i3++;
      bool1 = bool2;
      j = k;
      i = i4;
      break label140;
      n = k;
      paramInt1 = paramInt2;
      m = j;
      if (i != 0) {
        break;
      }
      m = 300;
      n = k;
      paramInt1 = paramInt2;
      break;
      throw new IllegalStateException("Width must have an exact value or MATCH_PARENT");
      n = k;
      paramInt1 = paramInt2;
      m = j;
      if (k != 0) {
        break;
      }
      if (isInEditMode())
      {
        n = k;
        paramInt1 = paramInt2;
        m = j;
        if (k != 0) {
          break;
        }
        n = Integer.MIN_VALUE;
        paramInt1 = 300;
        m = j;
        break;
      }
      throw new IllegalStateException("Height must not be UNSPECIFIED");
      paramInt2 = paramInt1 - getPaddingTop() - getPaddingBottom();
      j = paramInt2;
      break label88;
      paramInt2 = paramInt1 - getPaddingTop() - getPaddingBottom();
      break label88;
      f2 = f1;
      if (localLayoutParams.weight <= 0.0F) {
        break label392;
      }
      f2 = f1 + localLayoutParams.weight;
      bool2 = bool1;
      k = j;
      f1 = f2;
      i4 = i;
    } while (localLayoutParams.width == 0);
    label392:
    paramInt1 = localLayoutParams.leftMargin + localLayoutParams.rightMargin;
    if (localLayoutParams.width == -2)
    {
      paramInt1 = View.MeasureSpec.makeMeasureSpec(i1 - paramInt1, Integer.MIN_VALUE);
      label425:
      if (localLayoutParams.height != -2) {
        break label607;
      }
      k = View.MeasureSpec.makeMeasureSpec(paramInt2, Integer.MIN_VALUE);
      label444:
      localView.measure(paramInt1, k);
      k = localView.getMeasuredWidth();
      i4 = localView.getMeasuredHeight();
      paramInt1 = j;
      if (n == Integer.MIN_VALUE)
      {
        paramInt1 = j;
        if (i4 > j) {
          paramInt1 = Math.min(i4, paramInt2);
        }
      }
      j = i - k;
      if (j >= 0) {
        break label644;
      }
    }
    label607:
    label644:
    for (boolean bool2 = true;; bool2 = false)
    {
      localLayoutParams.slideable = bool2;
      bool1 |= bool2;
      bool2 = bool1;
      k = paramInt1;
      f1 = f2;
      i4 = j;
      if (!localLayoutParams.slideable) {
        break;
      }
      this.mSlideableView = localView;
      bool2 = bool1;
      k = paramInt1;
      f1 = f2;
      i4 = j;
      break;
      if (localLayoutParams.width == -1)
      {
        paramInt1 = View.MeasureSpec.makeMeasureSpec(i1 - paramInt1, 1073741824);
        break label425;
      }
      paramInt1 = View.MeasureSpec.makeMeasureSpec(localLayoutParams.width, 1073741824);
      break label425;
      if (localLayoutParams.height == -1)
      {
        k = View.MeasureSpec.makeMeasureSpec(paramInt2, 1073741824);
        break label444;
      }
      k = View.MeasureSpec.makeMeasureSpec(localLayoutParams.height, 1073741824);
      break label444;
    }
    label650:
    if ((bool1) || (f1 > 0.0F))
    {
      i3 = i1 - this.mOverhangSize;
      k = 0;
      if (k < i2)
      {
        localView = getChildAt(k);
        if (localView.getVisibility() == 8) {}
        for (;;)
        {
          k++;
          break;
          localLayoutParams = (LayoutParams)localView.getLayoutParams();
          if (localView.getVisibility() != 8)
          {
            if ((localLayoutParams.width == 0) && (localLayoutParams.weight > 0.0F))
            {
              paramInt1 = 1;
              label745:
              if (paramInt1 == 0) {
                break label835;
              }
              n = 0;
              label752:
              if ((!bool1) || (localView == this.mSlideableView)) {
                break label895;
              }
              if ((localLayoutParams.width >= 0) || ((n <= i3) && (localLayoutParams.weight <= 0.0F))) {
                continue;
              }
              if (paramInt1 == 0) {
                break label880;
              }
              if (localLayoutParams.height != -2) {
                break label845;
              }
              paramInt1 = View.MeasureSpec.makeMeasureSpec(paramInt2, Integer.MIN_VALUE);
            }
            for (;;)
            {
              localView.measure(View.MeasureSpec.makeMeasureSpec(i3, 1073741824), paramInt1);
              break;
              paramInt1 = 0;
              break label745;
              label835:
              n = localView.getMeasuredWidth();
              break label752;
              label845:
              if (localLayoutParams.height == -1)
              {
                paramInt1 = View.MeasureSpec.makeMeasureSpec(paramInt2, 1073741824);
              }
              else
              {
                paramInt1 = View.MeasureSpec.makeMeasureSpec(localLayoutParams.height, 1073741824);
                continue;
                label880:
                paramInt1 = View.MeasureSpec.makeMeasureSpec(localView.getMeasuredHeight(), 1073741824);
              }
            }
            label895:
            if (localLayoutParams.weight > 0.0F)
            {
              if (localLayoutParams.width == 0) {
                if (localLayoutParams.height == -2) {
                  paramInt1 = View.MeasureSpec.makeMeasureSpec(paramInt2, Integer.MIN_VALUE);
                }
              }
              for (;;)
              {
                if (!bool1) {
                  break label1030;
                }
                i4 = i1 - (localLayoutParams.leftMargin + localLayoutParams.rightMargin);
                int i5 = View.MeasureSpec.makeMeasureSpec(i4, 1073741824);
                if (n == i4) {
                  break;
                }
                localView.measure(i5, paramInt1);
                break;
                if (localLayoutParams.height == -1)
                {
                  paramInt1 = View.MeasureSpec.makeMeasureSpec(paramInt2, 1073741824);
                }
                else
                {
                  paramInt1 = View.MeasureSpec.makeMeasureSpec(localLayoutParams.height, 1073741824);
                  continue;
                  paramInt1 = View.MeasureSpec.makeMeasureSpec(localView.getMeasuredHeight(), 1073741824);
                }
              }
              label1030:
              i4 = Math.max(0, i);
              localView.measure(View.MeasureSpec.makeMeasureSpec(n + (int)(localLayoutParams.weight * i4 / f1), 1073741824), paramInt1);
            }
          }
        }
      }
    }
    setMeasuredDimension(m, getPaddingTop() + j + getPaddingBottom());
    this.mCanSlide = bool1;
    if ((this.mDragHelper.getViewDragState() != 0) && (!bool1)) {
      this.mDragHelper.abort();
    }
  }
  
  protected void onRestoreInstanceState(Parcelable paramParcelable)
  {
    paramParcelable = (SavedState)paramParcelable;
    super.onRestoreInstanceState(paramParcelable.getSuperState());
    if (paramParcelable.isOpen) {
      openPane();
    }
    for (;;)
    {
      this.mPreservedOpenState = paramParcelable.isOpen;
      return;
      closePane();
    }
  }
  
  protected Parcelable onSaveInstanceState()
  {
    SavedState localSavedState = new SavedState(super.onSaveInstanceState());
    if (isSlideable()) {}
    for (boolean bool = isOpen();; bool = this.mPreservedOpenState)
    {
      localSavedState.isOpen = bool;
      return localSavedState;
    }
  }
  
  protected void onSizeChanged(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    super.onSizeChanged(paramInt1, paramInt2, paramInt3, paramInt4);
    if (paramInt1 != paramInt3) {
      this.mFirstLayout = true;
    }
  }
  
  public boolean onTouchEvent(MotionEvent paramMotionEvent)
  {
    boolean bool1;
    if (!this.mCanSlide) {
      bool1 = super.onTouchEvent(paramMotionEvent);
    }
    for (;;)
    {
      return bool1;
      this.mDragHelper.processTouchEvent(paramMotionEvent);
      int i = paramMotionEvent.getAction();
      boolean bool2 = true;
      float f1;
      float f2;
      switch (i & 0xFF)
      {
      default: 
        bool1 = bool2;
        break;
      case 0: 
        f1 = paramMotionEvent.getX();
        f2 = paramMotionEvent.getY();
        this.mInitialMotionX = f1;
        this.mInitialMotionY = f2;
        bool1 = bool2;
        break;
      case 1: 
        bool1 = bool2;
        if (isDimmed(this.mSlideableView))
        {
          f1 = paramMotionEvent.getX();
          f2 = paramMotionEvent.getY();
          float f3 = f1 - this.mInitialMotionX;
          float f4 = f2 - this.mInitialMotionY;
          i = this.mDragHelper.getTouchSlop();
          bool1 = bool2;
          if (f3 * f3 + f4 * f4 < i * i)
          {
            bool1 = bool2;
            if (this.mDragHelper.isViewUnder(this.mSlideableView, (int)f1, (int)f2))
            {
              closePane(this.mSlideableView, 0);
              bool1 = bool2;
            }
          }
        }
        break;
      }
    }
  }
  
  public boolean openPane()
  {
    return openPane(this.mSlideableView, 0);
  }
  
  public void requestChildFocus(View paramView1, View paramView2)
  {
    super.requestChildFocus(paramView1, paramView2);
    if ((!isInTouchMode()) && (!this.mCanSlide)) {
      if (paramView1 != this.mSlideableView) {
        break label36;
      }
    }
    label36:
    for (boolean bool = true;; bool = false)
    {
      this.mPreservedOpenState = bool;
      return;
    }
  }
  
  void setAllChildrenVisible()
  {
    int i = 0;
    int j = getChildCount();
    while (i < j)
    {
      View localView = getChildAt(i);
      if (localView.getVisibility() == 4) {
        localView.setVisibility(0);
      }
      i++;
    }
  }
  
  public void setCoveredFadeColor(int paramInt)
  {
    this.mCoveredFadeColor = paramInt;
  }
  
  public void setPanelSlideListener(PanelSlideListener paramPanelSlideListener)
  {
    this.mPanelSlideListener = paramPanelSlideListener;
  }
  
  public void setParallaxDistance(int paramInt)
  {
    this.mParallaxBy = paramInt;
    requestLayout();
  }
  
  @Deprecated
  public void setShadowDrawable(Drawable paramDrawable)
  {
    setShadowDrawableLeft(paramDrawable);
  }
  
  public void setShadowDrawableLeft(Drawable paramDrawable)
  {
    this.mShadowDrawableLeft = paramDrawable;
  }
  
  public void setShadowDrawableRight(Drawable paramDrawable)
  {
    this.mShadowDrawableRight = paramDrawable;
  }
  
  @Deprecated
  public void setShadowResource(int paramInt)
  {
    setShadowDrawable(getResources().getDrawable(paramInt));
  }
  
  public void setShadowResourceLeft(int paramInt)
  {
    setShadowDrawableLeft(getResources().getDrawable(paramInt));
  }
  
  public void setShadowResourceRight(int paramInt)
  {
    setShadowDrawableRight(getResources().getDrawable(paramInt));
  }
  
  public void setSliderFadeColor(int paramInt)
  {
    this.mSliderFadeColor = paramInt;
  }
  
  @Deprecated
  public void smoothSlideClosed()
  {
    closePane();
  }
  
  @Deprecated
  public void smoothSlideOpen()
  {
    openPane();
  }
  
  boolean smoothSlideTo(float paramFloat, int paramInt)
  {
    boolean bool1 = false;
    if (!this.mCanSlide) {}
    label137:
    for (;;)
    {
      return bool1;
      boolean bool2 = isLayoutRtlSupport();
      LayoutParams localLayoutParams = (LayoutParams)this.mSlideableView.getLayoutParams();
      int i;
      int j;
      if (bool2)
      {
        paramInt = getPaddingRight();
        i = localLayoutParams.rightMargin;
        j = this.mSlideableView.getWidth();
      }
      for (paramInt = (int)(getWidth() - (paramInt + i + this.mSlideRange * paramFloat + j));; paramInt = (int)(getPaddingLeft() + localLayoutParams.leftMargin + this.mSlideRange * paramFloat))
      {
        if (!this.mDragHelper.smoothSlideViewTo(this.mSlideableView, paramInt, this.mSlideableView.getTop())) {
          break label137;
        }
        setAllChildrenVisible();
        ViewCompat.postInvalidateOnAnimation(this);
        bool1 = true;
        break;
      }
    }
  }
  
  void updateObscuredViewsVisibility(View paramView)
  {
    boolean bool = isLayoutRtlSupport();
    int i;
    int j;
    label29:
    int k;
    int m;
    int n;
    int i1;
    int i2;
    int i3;
    int i4;
    if (bool)
    {
      i = getWidth() - getPaddingRight();
      if (!bool) {
        break label121;
      }
      j = getPaddingLeft();
      k = getPaddingTop();
      m = getHeight();
      n = getPaddingBottom();
      if ((paramView == null) || (!viewIsOpaque(paramView))) {
        break label135;
      }
      i1 = paramView.getLeft();
      i2 = paramView.getRight();
      i3 = paramView.getTop();
      i4 = paramView.getBottom();
    }
    int i5;
    View localView;
    for (;;)
    {
      i5 = 0;
      int i6 = getChildCount();
      if (i5 < i6)
      {
        localView = getChildAt(i5);
        if (localView != paramView) {
          break label150;
        }
      }
      return;
      i = getPaddingLeft();
      break;
      label121:
      j = getWidth() - getPaddingRight();
      break label29;
      label135:
      i4 = 0;
      i3 = 0;
      i2 = 0;
      i1 = 0;
    }
    label150:
    if (bool)
    {
      i7 = j;
      label158:
      int i8 = Math.max(i7, localView.getLeft());
      int i9 = Math.max(k, localView.getTop());
      if (!bool) {
        break label266;
      }
      i7 = i;
      label189:
      int i10 = Math.min(i7, localView.getRight());
      i7 = Math.min(m - n, localView.getBottom());
      if ((i8 < i1) || (i9 < i3) || (i10 > i2) || (i7 > i4)) {
        break label273;
      }
    }
    label266:
    label273:
    for (int i7 = 4;; i7 = 0)
    {
      localView.setVisibility(i7);
      i5++;
      break;
      i7 = i;
      break label158;
      i7 = j;
      break label189;
    }
  }
  
  class AccessibilityDelegate
    extends AccessibilityDelegateCompat
  {
    private final Rect mTmpRect = new Rect();
    
    AccessibilityDelegate() {}
    
    private void copyNodeInfoNoChildren(AccessibilityNodeInfoCompat paramAccessibilityNodeInfoCompat1, AccessibilityNodeInfoCompat paramAccessibilityNodeInfoCompat2)
    {
      Rect localRect = this.mTmpRect;
      paramAccessibilityNodeInfoCompat2.getBoundsInParent(localRect);
      paramAccessibilityNodeInfoCompat1.setBoundsInParent(localRect);
      paramAccessibilityNodeInfoCompat2.getBoundsInScreen(localRect);
      paramAccessibilityNodeInfoCompat1.setBoundsInScreen(localRect);
      paramAccessibilityNodeInfoCompat1.setVisibleToUser(paramAccessibilityNodeInfoCompat2.isVisibleToUser());
      paramAccessibilityNodeInfoCompat1.setPackageName(paramAccessibilityNodeInfoCompat2.getPackageName());
      paramAccessibilityNodeInfoCompat1.setClassName(paramAccessibilityNodeInfoCompat2.getClassName());
      paramAccessibilityNodeInfoCompat1.setContentDescription(paramAccessibilityNodeInfoCompat2.getContentDescription());
      paramAccessibilityNodeInfoCompat1.setEnabled(paramAccessibilityNodeInfoCompat2.isEnabled());
      paramAccessibilityNodeInfoCompat1.setClickable(paramAccessibilityNodeInfoCompat2.isClickable());
      paramAccessibilityNodeInfoCompat1.setFocusable(paramAccessibilityNodeInfoCompat2.isFocusable());
      paramAccessibilityNodeInfoCompat1.setFocused(paramAccessibilityNodeInfoCompat2.isFocused());
      paramAccessibilityNodeInfoCompat1.setAccessibilityFocused(paramAccessibilityNodeInfoCompat2.isAccessibilityFocused());
      paramAccessibilityNodeInfoCompat1.setSelected(paramAccessibilityNodeInfoCompat2.isSelected());
      paramAccessibilityNodeInfoCompat1.setLongClickable(paramAccessibilityNodeInfoCompat2.isLongClickable());
      paramAccessibilityNodeInfoCompat1.addAction(paramAccessibilityNodeInfoCompat2.getActions());
      paramAccessibilityNodeInfoCompat1.setMovementGranularities(paramAccessibilityNodeInfoCompat2.getMovementGranularities());
    }
    
    public boolean filter(View paramView)
    {
      return SlidingPaneLayout.this.isDimmed(paramView);
    }
    
    public void onInitializeAccessibilityEvent(View paramView, AccessibilityEvent paramAccessibilityEvent)
    {
      super.onInitializeAccessibilityEvent(paramView, paramAccessibilityEvent);
      paramAccessibilityEvent.setClassName(SlidingPaneLayout.class.getName());
    }
    
    public void onInitializeAccessibilityNodeInfo(View paramView, AccessibilityNodeInfoCompat paramAccessibilityNodeInfoCompat)
    {
      AccessibilityNodeInfoCompat localAccessibilityNodeInfoCompat = AccessibilityNodeInfoCompat.obtain(paramAccessibilityNodeInfoCompat);
      super.onInitializeAccessibilityNodeInfo(paramView, localAccessibilityNodeInfoCompat);
      copyNodeInfoNoChildren(paramAccessibilityNodeInfoCompat, localAccessibilityNodeInfoCompat);
      localAccessibilityNodeInfoCompat.recycle();
      paramAccessibilityNodeInfoCompat.setClassName(SlidingPaneLayout.class.getName());
      paramAccessibilityNodeInfoCompat.setSource(paramView);
      paramView = ViewCompat.getParentForAccessibility(paramView);
      if ((paramView instanceof View)) {
        paramAccessibilityNodeInfoCompat.setParent((View)paramView);
      }
      int i = SlidingPaneLayout.this.getChildCount();
      for (int j = 0; j < i; j++)
      {
        paramView = SlidingPaneLayout.this.getChildAt(j);
        if ((!filter(paramView)) && (paramView.getVisibility() == 0))
        {
          ViewCompat.setImportantForAccessibility(paramView, 1);
          paramAccessibilityNodeInfoCompat.addChild(paramView);
        }
      }
    }
    
    public boolean onRequestSendAccessibilityEvent(ViewGroup paramViewGroup, View paramView, AccessibilityEvent paramAccessibilityEvent)
    {
      if (!filter(paramView)) {}
      for (boolean bool = super.onRequestSendAccessibilityEvent(paramViewGroup, paramView, paramAccessibilityEvent);; bool = false) {
        return bool;
      }
    }
  }
  
  private class DisableLayerRunnable
    implements Runnable
  {
    final View mChildView;
    
    DisableLayerRunnable(View paramView)
    {
      this.mChildView = paramView;
    }
    
    public void run()
    {
      if (this.mChildView.getParent() == SlidingPaneLayout.this)
      {
        ViewCompat.setLayerType(this.mChildView, 0, null);
        SlidingPaneLayout.this.invalidateChildRegion(this.mChildView);
      }
      SlidingPaneLayout.this.mPostedRunnables.remove(this);
    }
  }
  
  private class DragHelperCallback
    extends ViewDragHelper.Callback
  {
    private DragHelperCallback() {}
    
    public int clampViewPositionHorizontal(View paramView, int paramInt1, int paramInt2)
    {
      paramView = (SlidingPaneLayout.LayoutParams)SlidingPaneLayout.this.mSlideableView.getLayoutParams();
      int i;
      if (SlidingPaneLayout.this.isLayoutRtlSupport())
      {
        paramInt2 = SlidingPaneLayout.this.getWidth() - (SlidingPaneLayout.this.getPaddingRight() + paramView.rightMargin + SlidingPaneLayout.this.mSlideableView.getWidth());
        i = SlidingPaneLayout.this.mSlideRange;
      }
      for (paramInt1 = Math.max(Math.min(paramInt1, paramInt2), paramInt2 - i);; paramInt1 = Math.min(Math.max(paramInt1, i), i + paramInt2))
      {
        return paramInt1;
        i = SlidingPaneLayout.this.getPaddingLeft() + paramView.leftMargin;
        paramInt2 = SlidingPaneLayout.this.mSlideRange;
      }
    }
    
    public int clampViewPositionVertical(View paramView, int paramInt1, int paramInt2)
    {
      return paramView.getTop();
    }
    
    public int getViewHorizontalDragRange(View paramView)
    {
      return SlidingPaneLayout.this.mSlideRange;
    }
    
    public void onEdgeDragStarted(int paramInt1, int paramInt2)
    {
      SlidingPaneLayout.this.mDragHelper.captureChildView(SlidingPaneLayout.this.mSlideableView, paramInt2);
    }
    
    public void onViewCaptured(View paramView, int paramInt)
    {
      SlidingPaneLayout.this.setAllChildrenVisible();
    }
    
    public void onViewDragStateChanged(int paramInt)
    {
      if (SlidingPaneLayout.this.mDragHelper.getViewDragState() == 0)
      {
        if (SlidingPaneLayout.this.mSlideOffset != 0.0F) {
          break label63;
        }
        SlidingPaneLayout.this.updateObscuredViewsVisibility(SlidingPaneLayout.this.mSlideableView);
        SlidingPaneLayout.this.dispatchOnPanelClosed(SlidingPaneLayout.this.mSlideableView);
        SlidingPaneLayout.access$502(SlidingPaneLayout.this, false);
      }
      for (;;)
      {
        return;
        label63:
        SlidingPaneLayout.this.dispatchOnPanelOpened(SlidingPaneLayout.this.mSlideableView);
        SlidingPaneLayout.access$502(SlidingPaneLayout.this, true);
      }
    }
    
    public void onViewPositionChanged(View paramView, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
    {
      SlidingPaneLayout.this.onPanelDragged(paramInt1);
      SlidingPaneLayout.this.invalidate();
    }
    
    public void onViewReleased(View paramView, float paramFloat1, float paramFloat2)
    {
      SlidingPaneLayout.LayoutParams localLayoutParams = (SlidingPaneLayout.LayoutParams)paramView.getLayoutParams();
      int i;
      int j;
      if (SlidingPaneLayout.this.isLayoutRtlSupport())
      {
        i = SlidingPaneLayout.this.getPaddingRight() + localLayoutParams.rightMargin;
        if (paramFloat1 >= 0.0F)
        {
          j = i;
          if (paramFloat1 == 0.0F)
          {
            j = i;
            if (SlidingPaneLayout.this.mSlideOffset <= 0.5F) {}
          }
        }
        else
        {
          j = i + SlidingPaneLayout.this.mSlideRange;
        }
        i = SlidingPaneLayout.this.mSlideableView.getWidth();
        j = SlidingPaneLayout.this.getWidth() - j - i;
      }
      for (;;)
      {
        SlidingPaneLayout.this.mDragHelper.settleCapturedViewAt(j, paramView.getTop());
        SlidingPaneLayout.this.invalidate();
        return;
        i = SlidingPaneLayout.this.getPaddingLeft() + localLayoutParams.leftMargin;
        if (paramFloat1 <= 0.0F)
        {
          j = i;
          if (paramFloat1 == 0.0F)
          {
            j = i;
            if (SlidingPaneLayout.this.mSlideOffset <= 0.5F) {}
          }
        }
        else
        {
          j = i + SlidingPaneLayout.this.mSlideRange;
        }
      }
    }
    
    public boolean tryCaptureView(View paramView, int paramInt)
    {
      if (SlidingPaneLayout.this.mIsUnableToDrag) {}
      for (boolean bool = false;; bool = ((SlidingPaneLayout.LayoutParams)paramView.getLayoutParams()).slideable) {
        return bool;
      }
    }
  }
  
  public static class LayoutParams
    extends ViewGroup.MarginLayoutParams
  {
    private static final int[] ATTRS = { 16843137 };
    Paint dimPaint;
    boolean dimWhenOffset;
    boolean slideable;
    public float weight = 0.0F;
    
    public LayoutParams()
    {
      super(-1);
    }
    
    public LayoutParams(int paramInt1, int paramInt2)
    {
      super(paramInt2);
    }
    
    public LayoutParams(Context paramContext, AttributeSet paramAttributeSet)
    {
      super(paramAttributeSet);
      paramContext = paramContext.obtainStyledAttributes(paramAttributeSet, ATTRS);
      this.weight = paramContext.getFloat(0, 0.0F);
      paramContext.recycle();
    }
    
    public LayoutParams(LayoutParams paramLayoutParams)
    {
      super();
      this.weight = paramLayoutParams.weight;
    }
    
    public LayoutParams(ViewGroup.LayoutParams paramLayoutParams)
    {
      super();
    }
    
    public LayoutParams(ViewGroup.MarginLayoutParams paramMarginLayoutParams)
    {
      super();
    }
  }
  
  public static abstract interface PanelSlideListener
  {
    public abstract void onPanelClosed(View paramView);
    
    public abstract void onPanelOpened(View paramView);
    
    public abstract void onPanelSlide(View paramView, float paramFloat);
  }
  
  static class SavedState
    extends View.BaseSavedState
  {
    public static final Parcelable.Creator<SavedState> CREATOR = new Parcelable.Creator()
    {
      public SlidingPaneLayout.SavedState createFromParcel(Parcel paramAnonymousParcel)
      {
        return new SlidingPaneLayout.SavedState(paramAnonymousParcel, null);
      }
      
      public SlidingPaneLayout.SavedState[] newArray(int paramAnonymousInt)
      {
        return new SlidingPaneLayout.SavedState[paramAnonymousInt];
      }
    };
    boolean isOpen;
    
    private SavedState(Parcel paramParcel)
    {
      super();
      if (paramParcel.readInt() != 0) {}
      for (boolean bool = true;; bool = false)
      {
        this.isOpen = bool;
        return;
      }
    }
    
    SavedState(Parcelable paramParcelable)
    {
      super();
    }
    
    public void writeToParcel(Parcel paramParcel, int paramInt)
    {
      super.writeToParcel(paramParcel, paramInt);
      if (this.isOpen) {}
      for (paramInt = 1;; paramInt = 0)
      {
        paramParcel.writeInt(paramInt);
        return;
      }
    }
  }
  
  public static class SimplePanelSlideListener
    implements SlidingPaneLayout.PanelSlideListener
  {
    public void onPanelClosed(View paramView) {}
    
    public void onPanelOpened(View paramView) {}
    
    public void onPanelSlide(View paramView, float paramFloat) {}
  }
  
  static abstract interface SlidingPanelLayoutImpl
  {
    public abstract void invalidateChildRegion(SlidingPaneLayout paramSlidingPaneLayout, View paramView);
  }
  
  static class SlidingPanelLayoutImplBase
    implements SlidingPaneLayout.SlidingPanelLayoutImpl
  {
    public void invalidateChildRegion(SlidingPaneLayout paramSlidingPaneLayout, View paramView)
    {
      ViewCompat.postInvalidateOnAnimation(paramSlidingPaneLayout, paramView.getLeft(), paramView.getTop(), paramView.getRight(), paramView.getBottom());
    }
  }
  
  static class SlidingPanelLayoutImplJB
    extends SlidingPaneLayout.SlidingPanelLayoutImplBase
  {
    private Method mGetDisplayList;
    private Field mRecreateDisplayList;
    
    SlidingPanelLayoutImplJB()
    {
      try
      {
        this.mGetDisplayList = View.class.getDeclaredMethod("getDisplayList", (Class[])null);
      }
      catch (NoSuchMethodException localNoSuchMethodException)
      {
        try
        {
          for (;;)
          {
            this.mRecreateDisplayList = View.class.getDeclaredField("mRecreateDisplayList");
            this.mRecreateDisplayList.setAccessible(true);
            return;
            localNoSuchMethodException = localNoSuchMethodException;
            Log.e("SlidingPaneLayout", "Couldn't fetch getDisplayList method; dimming won't work right.", localNoSuchMethodException);
          }
        }
        catch (NoSuchFieldException localNoSuchFieldException)
        {
          for (;;)
          {
            Log.e("SlidingPaneLayout", "Couldn't fetch mRecreateDisplayList field; dimming will be slow.", localNoSuchFieldException);
          }
        }
      }
    }
    
    public void invalidateChildRegion(SlidingPaneLayout paramSlidingPaneLayout, View paramView)
    {
      if ((this.mGetDisplayList != null) && (this.mRecreateDisplayList != null)) {}
      for (;;)
      {
        try
        {
          this.mRecreateDisplayList.setBoolean(paramView, true);
          this.mGetDisplayList.invoke(paramView, (Object[])null);
          super.invalidateChildRegion(paramSlidingPaneLayout, paramView);
          return;
        }
        catch (Exception localException)
        {
          Log.e("SlidingPaneLayout", "Error refreshing display list state", localException);
          continue;
        }
        paramView.invalidate();
      }
    }
  }
  
  static class SlidingPanelLayoutImplJBMR1
    extends SlidingPaneLayout.SlidingPanelLayoutImplBase
  {
    public void invalidateChildRegion(SlidingPaneLayout paramSlidingPaneLayout, View paramView)
    {
      ViewCompat.setLayerPaint(paramView, ((SlidingPaneLayout.LayoutParams)paramView.getLayoutParams()).dimPaint);
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/android/support/v4/widget/SlidingPaneLayout.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */