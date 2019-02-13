package net.simonvt.numberpicker;

import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Paint.Align;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.text.InputFilter;
import android.text.Spanned;
import android.text.TextUtils;
import android.text.method.NumberKeyListener;
import android.util.AttributeSet;
import android.util.SparseArray;
import android.util.TypedValue;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.VelocityTracker;
import android.view.View;
import android.view.View.MeasureSpec;
import android.view.View.OnClickListener;
import android.view.View.OnFocusChangeListener;
import android.view.View.OnLongClickListener;
import android.view.ViewConfiguration;
import android.view.ViewParent;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityManager;
import android.view.accessibility.AccessibilityNodeInfo;
import android.view.accessibility.AccessibilityNodeProvider;
import android.view.animation.DecelerateInterpolator;
import android.view.inputmethod.InputMethodManager;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.LinearLayout;
import android.widget.TextView;
import java.text.DecimalFormatSymbols;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Formatter;
import java.util.List;
import java.util.Locale;

public class NumberPicker
  extends LinearLayout
{
  private static final int DEFAULT_LAYOUT_RESOURCE_ID = 0;
  private static final long DEFAULT_LONG_PRESS_UPDATE_INTERVAL = 300L;
  private static final char[] DIGIT_CHARACTERS = { 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 1632, 1633, 1634, 1635, 1636, 1637, 1638, 1639, 1640, 1641, 1776, 1777, 1778, 1779, 1780, 1781, 1782, 1783, 1784, 1785 };
  private static final int SELECTOR_ADJUSTMENT_DURATION_MILLIS = 800;
  private static final int SELECTOR_MAX_FLING_VELOCITY_ADJUSTMENT = 8;
  private static final int SELECTOR_MIDDLE_ITEM_INDEX = 1;
  private static final int SELECTOR_WHEEL_ITEM_COUNT = 3;
  private static final int SIZE_UNSPECIFIED = -1;
  private static final int SNAP_SCROLL_DURATION = 300;
  private static final float TOP_AND_BOTTOM_FADING_EDGE_STRENGTH = 0.9F;
  private static final int UNSCALED_DEFAULT_SELECTION_DIVIDERS_DISTANCE = 48;
  private static final int UNSCALED_DEFAULT_SELECTION_DIVIDER_HEIGHT = 2;
  private static final TwoDigitFormatter sTwoDigitFormatter = new TwoDigitFormatter();
  private SupportAccessibilityNodeProvider mAccessibilityNodeProvider;
  private final Scroller mAdjustScroller;
  private BeginSoftInputOnLongPressCommand mBeginSoftInputOnLongPressCommand;
  private int mBottomSelectionDividerBottom;
  private ChangeCurrentByOneFromLongPressCommand mChangeCurrentByOneFromLongPressCommand;
  private final boolean mComputeMaxWidth;
  private int mCurrentScrollOffset;
  private final ImageButton mDecrementButton;
  private boolean mDecrementVirtualButtonPressed;
  private String[] mDisplayedValues;
  private final Scroller mFlingScroller;
  private Formatter mFormatter;
  private final boolean mHasSelectorWheel;
  private final ImageButton mIncrementButton;
  private boolean mIncrementVirtualButtonPressed;
  private boolean mIngonreMoveEvents;
  private int mInitialScrollOffset = Integer.MIN_VALUE;
  private final EditText mInputText;
  private long mLastDownEventTime;
  private float mLastDownEventY;
  private float mLastDownOrMoveEventY;
  private int mLastHandledDownDpadKeyCode = -1;
  private int mLastHoveredChildVirtualViewId;
  private long mLongPressUpdateInterval = 300L;
  private final int mMaxHeight;
  private int mMaxValue;
  private int mMaxWidth;
  private int mMaximumFlingVelocity;
  private final int mMinHeight;
  private int mMinValue;
  private final int mMinWidth;
  private int mMinimumFlingVelocity;
  private OnScrollListener mOnScrollListener;
  private OnValueChangeListener mOnValueChangeListener;
  private final PressedStateHelper mPressedStateHelper;
  private int mPreviousScrollerY;
  private int mScrollState = 0;
  private final Drawable mSelectionDivider;
  private final int mSelectionDividerHeight;
  private final int mSelectionDividersDistance;
  private int mSelectorElementHeight;
  private final SparseArray<String> mSelectorIndexToStringCache = new SparseArray();
  private final int[] mSelectorIndices = new int[3];
  private int mSelectorTextGapHeight;
  private final Paint mSelectorWheelPaint;
  private SetSelectionCommand mSetSelectionCommand;
  private boolean mShowSoftInputOnTap;
  private final int mSolidColor;
  private final int mTextSize;
  private int mTopSelectionDividerTop;
  private int mTouchSlop;
  private int mValue;
  private VelocityTracker mVelocityTracker;
  private final Drawable mVirtualButtonPressedDrawable;
  private boolean mWrapSelectorWheel;
  
  public NumberPicker(Context paramContext)
  {
    this(paramContext, null);
  }
  
  public NumberPicker(Context paramContext, AttributeSet paramAttributeSet)
  {
    this(paramContext, paramAttributeSet, R.attr.numberPickerStyle);
  }
  
  public NumberPicker(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet);
    paramAttributeSet = paramContext.obtainStyledAttributes(paramAttributeSet, R.styleable.NumberPicker, paramInt, 0);
    paramInt = paramAttributeSet.getResourceId(R.styleable.NumberPicker_internalLayout, 0);
    if (paramInt != 0) {}
    for (boolean bool = true;; bool = false)
    {
      this.mHasSelectorWheel = bool;
      this.mSolidColor = paramAttributeSet.getColor(R.styleable.NumberPicker_solidColor, 0);
      this.mSelectionDivider = paramAttributeSet.getDrawable(R.styleable.NumberPicker_selectionDivider);
      int i = (int)TypedValue.applyDimension(1, 2.0F, getResources().getDisplayMetrics());
      this.mSelectionDividerHeight = paramAttributeSet.getDimensionPixelSize(R.styleable.NumberPicker_selectionDividerHeight, i);
      i = (int)TypedValue.applyDimension(1, 48.0F, getResources().getDisplayMetrics());
      this.mSelectionDividersDistance = paramAttributeSet.getDimensionPixelSize(R.styleable.NumberPicker_selectionDividersDistance, i);
      this.mMinHeight = paramAttributeSet.getDimensionPixelSize(R.styleable.NumberPicker_internalMinHeight, -1);
      this.mMaxHeight = paramAttributeSet.getDimensionPixelSize(R.styleable.NumberPicker_internalMaxHeight, -1);
      if ((this.mMinHeight == -1) || (this.mMaxHeight == -1) || (this.mMinHeight <= this.mMaxHeight)) {
        break;
      }
      throw new IllegalArgumentException("minHeight > maxHeight");
    }
    this.mMinWidth = paramAttributeSet.getDimensionPixelSize(R.styleable.NumberPicker_internalMinWidth, -1);
    this.mMaxWidth = paramAttributeSet.getDimensionPixelSize(R.styleable.NumberPicker_internalMaxWidth, -1);
    if ((this.mMinWidth != -1) && (this.mMaxWidth != -1) && (this.mMinWidth > this.mMaxWidth)) {
      throw new IllegalArgumentException("minWidth > maxWidth");
    }
    if (this.mMaxWidth == -1)
    {
      bool = true;
      this.mComputeMaxWidth = bool;
      this.mVirtualButtonPressedDrawable = paramAttributeSet.getDrawable(R.styleable.NumberPicker_virtualButtonPressedDrawable);
      paramAttributeSet.recycle();
      this.mPressedStateHelper = new PressedStateHelper();
      if (this.mHasSelectorWheel) {
        break label716;
      }
      bool = true;
      label345:
      setWillNotDraw(bool);
      ((LayoutInflater)getContext().getSystemService("layout_inflater")).inflate(paramInt, this, true);
      paramAttributeSet = new View.OnClickListener()
      {
        public void onClick(View paramAnonymousView)
        {
          NumberPicker.this.hideSoftInput();
          NumberPicker.this.mInputText.clearFocus();
          if (paramAnonymousView.getId() == R.id.np__increment) {
            NumberPicker.this.changeValueByOne(true);
          }
          for (;;)
          {
            return;
            NumberPicker.this.changeValueByOne(false);
          }
        }
      };
      View.OnLongClickListener local2 = new View.OnLongClickListener()
      {
        public boolean onLongClick(View paramAnonymousView)
        {
          NumberPicker.this.hideSoftInput();
          NumberPicker.this.mInputText.clearFocus();
          if (paramAnonymousView.getId() == R.id.np__increment) {
            NumberPicker.this.postChangeCurrentByOneFromLongPress(true, 0L);
          }
          for (;;)
          {
            return true;
            NumberPicker.this.postChangeCurrentByOneFromLongPress(false, 0L);
          }
        }
      };
      if (this.mHasSelectorWheel) {
        break label722;
      }
      this.mIncrementButton = ((ImageButton)findViewById(R.id.np__increment));
      this.mIncrementButton.setOnClickListener(paramAttributeSet);
      this.mIncrementButton.setOnLongClickListener(local2);
      label428:
      if (this.mHasSelectorWheel) {
        break label730;
      }
      this.mDecrementButton = ((ImageButton)findViewById(R.id.np__decrement));
      this.mDecrementButton.setOnClickListener(paramAttributeSet);
      this.mDecrementButton.setOnLongClickListener(local2);
    }
    for (;;)
    {
      this.mInputText = ((EditText)findViewById(R.id.np__numberpicker_input));
      this.mInputText.setOnFocusChangeListener(new View.OnFocusChangeListener()
      {
        public void onFocusChange(View paramAnonymousView, boolean paramAnonymousBoolean)
        {
          if (paramAnonymousBoolean) {
            NumberPicker.this.mInputText.selectAll();
          }
          for (;;)
          {
            return;
            NumberPicker.this.mInputText.setSelection(0, 0);
            NumberPicker.this.validateInputTextView(paramAnonymousView);
          }
        }
      });
      this.mInputText.setFilters(new InputFilter[] { new InputTextFilter() });
      this.mInputText.setRawInputType(2);
      this.mInputText.setImeOptions(6);
      paramContext = ViewConfiguration.get(paramContext);
      this.mTouchSlop = paramContext.getScaledTouchSlop();
      this.mMinimumFlingVelocity = paramContext.getScaledMinimumFlingVelocity();
      this.mMaximumFlingVelocity = (paramContext.getScaledMaximumFlingVelocity() / 8);
      this.mTextSize = ((int)this.mInputText.getTextSize());
      paramContext = new Paint();
      paramContext.setAntiAlias(true);
      paramContext.setTextAlign(Paint.Align.CENTER);
      paramContext.setTextSize(this.mTextSize);
      paramContext.setTypeface(this.mInputText.getTypeface());
      paramContext.setColor(this.mInputText.getTextColors().getColorForState(ENABLED_STATE_SET, -1));
      this.mSelectorWheelPaint = paramContext;
      this.mFlingScroller = new Scroller(getContext(), null, true);
      this.mAdjustScroller = new Scroller(getContext(), new DecelerateInterpolator(2.5F));
      updateInputTextView();
      if ((Build.VERSION.SDK_INT >= 16) && (getImportantForAccessibility() == 0)) {
        setImportantForAccessibility(1);
      }
      return;
      bool = false;
      break;
      label716:
      bool = false;
      break label345;
      label722:
      this.mIncrementButton = null;
      break label428;
      label730:
      this.mDecrementButton = null;
    }
  }
  
  private void changeValueByOne(boolean paramBoolean)
  {
    if (this.mHasSelectorWheel)
    {
      this.mInputText.setVisibility(4);
      if (!moveToFinalScrollerPosition(this.mFlingScroller)) {
        moveToFinalScrollerPosition(this.mAdjustScroller);
      }
      this.mPreviousScrollerY = 0;
      if (paramBoolean)
      {
        this.mFlingScroller.startScroll(0, 0, 0, -this.mSelectorElementHeight, 300);
        invalidate();
      }
    }
    for (;;)
    {
      return;
      this.mFlingScroller.startScroll(0, 0, 0, this.mSelectorElementHeight, 300);
      break;
      if (paramBoolean) {
        setValueInternal(this.mValue + 1, true);
      } else {
        setValueInternal(this.mValue - 1, true);
      }
    }
  }
  
  private void decrementSelectorIndices(int[] paramArrayOfInt)
  {
    for (int i = paramArrayOfInt.length - 1; i > 0; i--) {
      paramArrayOfInt[i] = paramArrayOfInt[(i - 1)];
    }
    int j = paramArrayOfInt[1] - 1;
    i = j;
    if (this.mWrapSelectorWheel)
    {
      i = j;
      if (j < this.mMinValue) {
        i = this.mMaxValue;
      }
    }
    paramArrayOfInt[0] = i;
    ensureCachedScrollSelectorValue(i);
  }
  
  private void ensureCachedScrollSelectorValue(int paramInt)
  {
    SparseArray localSparseArray = this.mSelectorIndexToStringCache;
    if ((String)localSparseArray.get(paramInt) != null) {
      return;
    }
    String str;
    if ((paramInt < this.mMinValue) || (paramInt > this.mMaxValue)) {
      str = "";
    }
    for (;;)
    {
      localSparseArray.put(paramInt, str);
      break;
      if (this.mDisplayedValues != null)
      {
        int i = this.mMinValue;
        str = this.mDisplayedValues[(paramInt - i)];
      }
      else
      {
        str = formatNumber(paramInt);
      }
    }
  }
  
  private boolean ensureScrollWheelAdjusted()
  {
    boolean bool = false;
    int i = this.mInitialScrollOffset - this.mCurrentScrollOffset;
    if (i != 0)
    {
      this.mPreviousScrollerY = 0;
      j = i;
      if (Math.abs(i) > this.mSelectorElementHeight / 2) {
        if (i <= 0) {
          break label72;
        }
      }
    }
    label72:
    for (int j = -this.mSelectorElementHeight;; j = this.mSelectorElementHeight)
    {
      j = i + j;
      this.mAdjustScroller.startScroll(0, 0, 0, j, 800);
      invalidate();
      bool = true;
      return bool;
    }
  }
  
  private void fling(int paramInt)
  {
    this.mPreviousScrollerY = 0;
    if (paramInt > 0) {
      this.mFlingScroller.fling(0, 0, 0, paramInt, 0, 0, 0, Integer.MAX_VALUE);
    }
    for (;;)
    {
      invalidate();
      return;
      this.mFlingScroller.fling(0, Integer.MAX_VALUE, 0, paramInt, 0, 0, 0, Integer.MAX_VALUE);
    }
  }
  
  private String formatNumber(int paramInt)
  {
    if (this.mFormatter != null) {}
    for (String str = this.mFormatter.format(paramInt);; str = formatNumberWithLocale(paramInt)) {
      return str;
    }
  }
  
  private static String formatNumberWithLocale(int paramInt)
  {
    return String.format(Locale.getDefault(), "%d", new Object[] { Integer.valueOf(paramInt) });
  }
  
  /* Error */
  private int getSelectedPos(String paramString)
  {
    // Byte code:
    //   0: aload_0
    //   1: getfield 521	net/simonvt/numberpicker/NumberPicker:mDisplayedValues	[Ljava/lang/String;
    //   4: ifnonnull +10 -> 14
    //   7: aload_1
    //   8: invokestatic 686	java/lang/Integer:parseInt	(Ljava/lang/String;)I
    //   11: istore_2
    //   12: iload_2
    //   13: ireturn
    //   14: iconst_0
    //   15: istore_2
    //   16: iload_2
    //   17: aload_0
    //   18: getfield 521	net/simonvt/numberpicker/NumberPicker:mDisplayedValues	[Ljava/lang/String;
    //   21: arraylength
    //   22: if_icmpge +40 -> 62
    //   25: aload_1
    //   26: invokevirtual 690	java/lang/String:toLowerCase	()Ljava/lang/String;
    //   29: astore_1
    //   30: aload_0
    //   31: getfield 521	net/simonvt/numberpicker/NumberPicker:mDisplayedValues	[Ljava/lang/String;
    //   34: iload_2
    //   35: aaload
    //   36: invokevirtual 690	java/lang/String:toLowerCase	()Ljava/lang/String;
    //   39: aload_1
    //   40: invokevirtual 694	java/lang/String:startsWith	(Ljava/lang/String;)Z
    //   43: ifeq +13 -> 56
    //   46: aload_0
    //   47: getfield 583	net/simonvt/numberpicker/NumberPicker:mMinValue	I
    //   50: iload_2
    //   51: iadd
    //   52: istore_2
    //   53: goto -41 -> 12
    //   56: iinc 2 1
    //   59: goto -43 -> 16
    //   62: aload_1
    //   63: invokestatic 686	java/lang/Integer:parseInt	(Ljava/lang/String;)I
    //   66: istore_2
    //   67: goto -55 -> 12
    //   70: astore_1
    //   71: aload_0
    //   72: getfield 583	net/simonvt/numberpicker/NumberPicker:mMinValue	I
    //   75: istore_2
    //   76: goto -64 -> 12
    //   79: astore_1
    //   80: goto -9 -> 71
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	83	0	this	NumberPicker
    //   0	83	1	paramString	String
    //   11	65	2	i	int
    // Exception table:
    //   from	to	target	type
    //   7	12	70	java/lang/NumberFormatException
    //   62	67	79	java/lang/NumberFormatException
  }
  
  private SupportAccessibilityNodeProvider getSupportAccessibilityNodeProvider()
  {
    return new SupportAccessibilityNodeProvider(null);
  }
  
  public static final Formatter getTwoDigitFormatter()
  {
    return sTwoDigitFormatter;
  }
  
  private int getWrappedSelectorIndex(int paramInt)
  {
    int i;
    if (paramInt > this.mMaxValue) {
      i = this.mMinValue + (paramInt - this.mMaxValue) % (this.mMaxValue - this.mMinValue) - 1;
    }
    for (;;)
    {
      return i;
      i = paramInt;
      if (paramInt < this.mMinValue) {
        i = this.mMaxValue - (this.mMinValue - paramInt) % (this.mMaxValue - this.mMinValue) + 1;
      }
    }
  }
  
  private void hideSoftInput()
  {
    InputMethodManager localInputMethodManager = (InputMethodManager)getContext().getSystemService("input_method");
    if ((localInputMethodManager != null) && (localInputMethodManager.isActive(this.mInputText)))
    {
      localInputMethodManager.hideSoftInputFromWindow(getWindowToken(), 0);
      if (this.mHasSelectorWheel) {
        this.mInputText.setVisibility(4);
      }
    }
  }
  
  private void incrementSelectorIndices(int[] paramArrayOfInt)
  {
    for (int i = 0; i < paramArrayOfInt.length - 1; i++) {
      paramArrayOfInt[i] = paramArrayOfInt[(i + 1)];
    }
    int j = paramArrayOfInt[(paramArrayOfInt.length - 2)] + 1;
    i = j;
    if (this.mWrapSelectorWheel)
    {
      i = j;
      if (j > this.mMaxValue) {
        i = this.mMinValue;
      }
    }
    paramArrayOfInt[(paramArrayOfInt.length - 1)] = i;
    ensureCachedScrollSelectorValue(i);
  }
  
  private void initializeFadingEdges()
  {
    setVerticalFadingEdgeEnabled(true);
    setFadingEdgeLength((getBottom() - getTop() - this.mTextSize) / 2);
  }
  
  private void initializeSelectorWheel()
  {
    initializeSelectorWheelIndices();
    int[] arrayOfInt = this.mSelectorIndices;
    int i = arrayOfInt.length;
    int j = this.mTextSize;
    this.mSelectorTextGapHeight = ((int)((getBottom() - getTop() - i * j) / arrayOfInt.length + 0.5F));
    this.mSelectorElementHeight = (this.mTextSize + this.mSelectorTextGapHeight);
    this.mInitialScrollOffset = (this.mInputText.getBaseline() + this.mInputText.getTop() - this.mSelectorElementHeight * 1);
    this.mCurrentScrollOffset = this.mInitialScrollOffset;
    updateInputTextView();
  }
  
  private void initializeSelectorWheelIndices()
  {
    this.mSelectorIndexToStringCache.clear();
    int[] arrayOfInt = this.mSelectorIndices;
    int i = getValue();
    for (int j = 0; j < this.mSelectorIndices.length; j++)
    {
      int k = i + (j - 1);
      int m = k;
      if (this.mWrapSelectorWheel) {
        m = getWrappedSelectorIndex(k);
      }
      arrayOfInt[j] = m;
      ensureCachedScrollSelectorValue(arrayOfInt[j]);
    }
  }
  
  private int makeMeasureSpec(int paramInt1, int paramInt2)
  {
    if (paramInt2 == -1) {}
    for (;;)
    {
      return paramInt1;
      int i = View.MeasureSpec.getSize(paramInt1);
      int j = View.MeasureSpec.getMode(paramInt1);
      switch (j)
      {
      case 1073741824: 
      default: 
        throw new IllegalArgumentException("Unknown measure mode: " + j);
      case -2147483648: 
        paramInt1 = View.MeasureSpec.makeMeasureSpec(Math.min(i, paramInt2), 1073741824);
        break;
      case 0: 
        paramInt1 = View.MeasureSpec.makeMeasureSpec(paramInt2, 1073741824);
      }
    }
  }
  
  private boolean moveToFinalScrollerPosition(Scroller paramScroller)
  {
    boolean bool = true;
    paramScroller.forceFinished(true);
    int i = paramScroller.getFinalY() - paramScroller.getCurrY();
    int j = this.mCurrentScrollOffset;
    int k = this.mSelectorElementHeight;
    j = this.mInitialScrollOffset - (j + i) % k;
    if (j != 0)
    {
      k = j;
      if (Math.abs(j) > this.mSelectorElementHeight / 2)
      {
        if (j > 0) {
          k = j - this.mSelectorElementHeight;
        }
      }
      else {
        scrollBy(0, i + k);
      }
    }
    for (;;)
    {
      return bool;
      k = j + this.mSelectorElementHeight;
      break;
      bool = false;
    }
  }
  
  private void notifyChange(int paramInt1, int paramInt2)
  {
    if (this.mOnValueChangeListener != null) {
      this.mOnValueChangeListener.onValueChange(this, paramInt1, this.mValue);
    }
  }
  
  private void onScrollStateChange(int paramInt)
  {
    if (this.mScrollState == paramInt) {}
    for (;;)
    {
      return;
      this.mScrollState = paramInt;
      if (this.mOnScrollListener != null) {
        this.mOnScrollListener.onScrollStateChange(this, paramInt);
      }
    }
  }
  
  private void onScrollerFinished(Scroller paramScroller)
  {
    if (paramScroller == this.mFlingScroller)
    {
      if (!ensureScrollWheelAdjusted()) {
        updateInputTextView();
      }
      onScrollStateChange(0);
    }
    for (;;)
    {
      return;
      if (this.mScrollState != 1) {
        updateInputTextView();
      }
    }
  }
  
  private void postBeginSoftInputOnLongPressCommand()
  {
    if (this.mBeginSoftInputOnLongPressCommand == null) {
      this.mBeginSoftInputOnLongPressCommand = new BeginSoftInputOnLongPressCommand();
    }
    for (;;)
    {
      postDelayed(this.mBeginSoftInputOnLongPressCommand, ViewConfiguration.getLongPressTimeout());
      return;
      removeCallbacks(this.mBeginSoftInputOnLongPressCommand);
    }
  }
  
  private void postChangeCurrentByOneFromLongPress(boolean paramBoolean, long paramLong)
  {
    if (this.mChangeCurrentByOneFromLongPressCommand == null) {
      this.mChangeCurrentByOneFromLongPressCommand = new ChangeCurrentByOneFromLongPressCommand();
    }
    for (;;)
    {
      this.mChangeCurrentByOneFromLongPressCommand.setStep(paramBoolean);
      postDelayed(this.mChangeCurrentByOneFromLongPressCommand, paramLong);
      return;
      removeCallbacks(this.mChangeCurrentByOneFromLongPressCommand);
    }
  }
  
  private void postSetSelectionCommand(int paramInt1, int paramInt2)
  {
    if (this.mSetSelectionCommand == null) {
      this.mSetSelectionCommand = new SetSelectionCommand();
    }
    for (;;)
    {
      SetSelectionCommand.access$702(this.mSetSelectionCommand, paramInt1);
      SetSelectionCommand.access$802(this.mSetSelectionCommand, paramInt2);
      post(this.mSetSelectionCommand);
      return;
      removeCallbacks(this.mSetSelectionCommand);
    }
  }
  
  private void removeAllCallbacks()
  {
    if (this.mChangeCurrentByOneFromLongPressCommand != null) {
      removeCallbacks(this.mChangeCurrentByOneFromLongPressCommand);
    }
    if (this.mSetSelectionCommand != null) {
      removeCallbacks(this.mSetSelectionCommand);
    }
    if (this.mBeginSoftInputOnLongPressCommand != null) {
      removeCallbacks(this.mBeginSoftInputOnLongPressCommand);
    }
    this.mPressedStateHelper.cancel();
  }
  
  private void removeBeginSoftInputCommand()
  {
    if (this.mBeginSoftInputOnLongPressCommand != null) {
      removeCallbacks(this.mBeginSoftInputOnLongPressCommand);
    }
  }
  
  private void removeChangeCurrentByOneFromLongPress()
  {
    if (this.mChangeCurrentByOneFromLongPressCommand != null) {
      removeCallbacks(this.mChangeCurrentByOneFromLongPressCommand);
    }
  }
  
  public static int resolveSizeAndState(int paramInt1, int paramInt2, int paramInt3)
  {
    int i = paramInt1;
    int j = View.MeasureSpec.getMode(paramInt2);
    paramInt2 = View.MeasureSpec.getSize(paramInt2);
    switch (j)
    {
    default: 
      paramInt1 = i;
    }
    for (;;)
    {
      return 0xFF000000 & paramInt3 | paramInt1;
      continue;
      if (paramInt2 < paramInt1)
      {
        paramInt1 = paramInt2 | 0x1000000;
      }
      else
      {
        continue;
        paramInt1 = paramInt2;
      }
    }
  }
  
  private int resolveSizeAndStateRespectingMinSize(int paramInt1, int paramInt2, int paramInt3)
  {
    int i = paramInt2;
    if (paramInt1 != -1) {
      i = resolveSizeAndState(Math.max(paramInt1, paramInt2), paramInt3, 0);
    }
    return i;
  }
  
  private void setValueInternal(int paramInt, boolean paramBoolean)
  {
    if (this.mValue == paramInt) {
      return;
    }
    if (this.mWrapSelectorWheel) {}
    for (paramInt = getWrappedSelectorIndex(paramInt);; paramInt = Math.min(Math.max(paramInt, this.mMinValue), this.mMaxValue))
    {
      int i = this.mValue;
      this.mValue = paramInt;
      updateInputTextView();
      if (paramBoolean) {
        notifyChange(i, paramInt);
      }
      initializeSelectorWheelIndices();
      invalidate();
      break;
    }
  }
  
  private void showSoftInput()
  {
    InputMethodManager localInputMethodManager = (InputMethodManager)getContext().getSystemService("input_method");
    if (localInputMethodManager != null)
    {
      if (this.mHasSelectorWheel) {
        this.mInputText.setVisibility(0);
      }
      this.mInputText.requestFocus();
      localInputMethodManager.showSoftInput(this.mInputText, 0);
    }
  }
  
  private void tryComputeMaxWidth()
  {
    if (!this.mComputeMaxWidth) {}
    int i;
    float f3;
    int j;
    int k;
    do
    {
      return;
      i = 0;
      if (this.mDisplayedValues != null) {
        break;
      }
      float f1 = 0.0F;
      i = 0;
      while (i <= 9)
      {
        float f2 = this.mSelectorWheelPaint.measureText(formatNumberWithLocale(i));
        f3 = f1;
        if (f2 > f1) {
          f3 = f2;
        }
        i++;
        f1 = f3;
      }
      j = 0;
      i = this.mMaxValue;
      while (i > 0)
      {
        j++;
        i /= 10;
      }
      k = (int)(j * f1);
      i = k + (this.mInputText.getPaddingLeft() + this.mInputText.getPaddingRight());
    } while (this.mMaxWidth == i);
    if (i > this.mMinWidth) {}
    for (this.mMaxWidth = i;; this.mMaxWidth = this.mMinWidth)
    {
      invalidate();
      break;
      int m = this.mDisplayedValues.length;
      j = 0;
      for (;;)
      {
        k = i;
        if (j >= m) {
          break;
        }
        f3 = this.mSelectorWheelPaint.measureText(this.mDisplayedValues[j]);
        k = i;
        if (f3 > i) {
          k = (int)f3;
        }
        j++;
        i = k;
      }
    }
  }
  
  private boolean updateInputTextView()
  {
    String str;
    if (this.mDisplayedValues == null)
    {
      str = formatNumber(this.mValue);
      if ((TextUtils.isEmpty(str)) || (str.equals(this.mInputText.getText().toString()))) {
        break label70;
      }
      this.mInputText.setText(str);
    }
    label70:
    for (boolean bool = true;; bool = false)
    {
      return bool;
      str = this.mDisplayedValues[(this.mValue - this.mMinValue)];
      break;
    }
  }
  
  private void validateInputTextView(View paramView)
  {
    paramView = String.valueOf(((TextView)paramView).getText());
    if (TextUtils.isEmpty(paramView)) {
      updateInputTextView();
    }
    for (;;)
    {
      return;
      setValueInternal(getSelectedPos(paramView.toString()), true);
    }
  }
  
  public void computeScroll()
  {
    Scroller localScroller1 = this.mFlingScroller;
    Scroller localScroller2 = localScroller1;
    if (localScroller1.isFinished())
    {
      localScroller1 = this.mAdjustScroller;
      localScroller2 = localScroller1;
      if (!localScroller1.isFinished()) {}
    }
    for (;;)
    {
      return;
      localScroller2.computeScrollOffset();
      int i = localScroller2.getCurrY();
      if (this.mPreviousScrollerY == 0) {
        this.mPreviousScrollerY = localScroller2.getStartY();
      }
      scrollBy(0, i - this.mPreviousScrollerY);
      this.mPreviousScrollerY = i;
      if (localScroller2.isFinished()) {
        onScrollerFinished(localScroller2);
      } else {
        invalidate();
      }
    }
  }
  
  protected boolean dispatchHoverEvent(MotionEvent paramMotionEvent)
  {
    boolean bool;
    if (!this.mHasSelectorWheel)
    {
      bool = super.dispatchHoverEvent(paramMotionEvent);
      return bool;
    }
    int i;
    if (((AccessibilityManager)getContext().getSystemService("accessibility")).isEnabled())
    {
      i = (int)paramMotionEvent.getY();
      if (i >= this.mTopSelectionDividerTop) {
        break label101;
      }
      i = 3;
      label50:
      int j = paramMotionEvent.getAction();
      paramMotionEvent = getSupportAccessibilityNodeProvider();
      switch (j & 0xFF)
      {
      }
    }
    for (;;)
    {
      bool = false;
      break;
      label101:
      if (i > this.mBottomSelectionDividerBottom)
      {
        i = 1;
        break label50;
      }
      i = 2;
      break label50;
      paramMotionEvent.sendAccessibilityEventForVirtualView(i, 128);
      this.mLastHoveredChildVirtualViewId = i;
      paramMotionEvent.performAction(i, 64, null);
      continue;
      if ((this.mLastHoveredChildVirtualViewId != i) && (this.mLastHoveredChildVirtualViewId != -1))
      {
        paramMotionEvent.sendAccessibilityEventForVirtualView(this.mLastHoveredChildVirtualViewId, 256);
        paramMotionEvent.sendAccessibilityEventForVirtualView(i, 128);
        this.mLastHoveredChildVirtualViewId = i;
        paramMotionEvent.performAction(i, 64, null);
        continue;
        paramMotionEvent.sendAccessibilityEventForVirtualView(i, 256);
        this.mLastHoveredChildVirtualViewId = -1;
      }
    }
  }
  
  public boolean dispatchKeyEvent(KeyEvent paramKeyEvent)
  {
    boolean bool1 = true;
    int i = paramKeyEvent.getKeyCode();
    boolean bool2;
    switch (i)
    {
    default: 
      bool2 = super.dispatchKeyEvent(paramKeyEvent);
    }
    for (;;)
    {
      label59:
      return bool2;
      removeAllCallbacks();
      break;
      if (!this.mHasSelectorWheel) {
        break;
      }
      switch (paramKeyEvent.getAction())
      {
      default: 
        break;
      case 0: 
        if ((this.mWrapSelectorWheel) || (i == 20))
        {
          if (getValue() >= getMaxValue()) {
            break;
          }
          requestFocus();
          this.mLastHandledDownDpadKeyCode = i;
          removeAllCallbacks();
          bool2 = bool1;
          if (!this.mFlingScroller.isFinished()) {
            continue;
          }
          if (i != 20) {
            break label193;
          }
        }
        for (bool2 = true;; bool2 = false)
        {
          changeValueByOne(bool2);
          bool2 = bool1;
          break label59;
          if (getValue() <= getMinValue()) {
            break;
          }
          break label131;
        }
      case 1: 
        label131:
        label193:
        if (this.mLastHandledDownDpadKeyCode != i) {
          break;
        }
        this.mLastHandledDownDpadKeyCode = -1;
        bool2 = bool1;
      }
    }
  }
  
  public boolean dispatchTouchEvent(MotionEvent paramMotionEvent)
  {
    switch (paramMotionEvent.getAction() & 0xFF)
    {
    }
    for (;;)
    {
      return super.dispatchTouchEvent(paramMotionEvent);
      removeAllCallbacks();
    }
  }
  
  public boolean dispatchTrackballEvent(MotionEvent paramMotionEvent)
  {
    switch (paramMotionEvent.getAction() & 0xFF)
    {
    }
    for (;;)
    {
      return super.dispatchTrackballEvent(paramMotionEvent);
      removeAllCallbacks();
    }
  }
  
  public AccessibilityNodeProvider getAccessibilityNodeProvider()
  {
    if (!this.mHasSelectorWheel) {}
    for (Object localObject = super.getAccessibilityNodeProvider();; localObject = this.mAccessibilityNodeProvider.mProvider)
    {
      return (AccessibilityNodeProvider)localObject;
      if (this.mAccessibilityNodeProvider == null) {
        this.mAccessibilityNodeProvider = new SupportAccessibilityNodeProvider(null);
      }
    }
  }
  
  protected float getBottomFadingEdgeStrength()
  {
    return 0.9F;
  }
  
  public String[] getDisplayedValues()
  {
    return this.mDisplayedValues;
  }
  
  public int getMaxValue()
  {
    return this.mMaxValue;
  }
  
  public int getMinValue()
  {
    return this.mMinValue;
  }
  
  public int getSolidColor()
  {
    return this.mSolidColor;
  }
  
  protected float getTopFadingEdgeStrength()
  {
    return 0.9F;
  }
  
  public int getValue()
  {
    return this.mValue;
  }
  
  public boolean getWrapSelectorWheel()
  {
    return this.mWrapSelectorWheel;
  }
  
  protected void onDetachedFromWindow()
  {
    removeAllCallbacks();
  }
  
  protected void onDraw(Canvas paramCanvas)
  {
    if (!this.mHasSelectorWheel) {
      super.onDraw(paramCanvas);
    }
    for (;;)
    {
      return;
      float f1 = (getRight() - getLeft()) / 2;
      float f2 = this.mCurrentScrollOffset;
      if ((this.mVirtualButtonPressedDrawable != null) && (this.mScrollState == 0))
      {
        if (this.mDecrementVirtualButtonPressed)
        {
          this.mVirtualButtonPressedDrawable.setState(PRESSED_ENABLED_STATE_SET);
          this.mVirtualButtonPressedDrawable.setBounds(0, 0, getRight(), this.mTopSelectionDividerTop);
          this.mVirtualButtonPressedDrawable.draw(paramCanvas);
        }
        if (this.mIncrementVirtualButtonPressed)
        {
          this.mVirtualButtonPressedDrawable.setState(PRESSED_ENABLED_STATE_SET);
          this.mVirtualButtonPressedDrawable.setBounds(0, this.mBottomSelectionDividerBottom, getRight(), getBottom());
          this.mVirtualButtonPressedDrawable.draw(paramCanvas);
        }
      }
      int[] arrayOfInt = this.mSelectorIndices;
      int j;
      for (int i = 0; i < arrayOfInt.length; i++)
      {
        j = arrayOfInt[i];
        String str = (String)this.mSelectorIndexToStringCache.get(j);
        if ((i != 1) || (this.mInputText.getVisibility() != 0)) {
          paramCanvas.drawText(str, f1, f2, this.mSelectorWheelPaint);
        }
        f2 += this.mSelectorElementHeight;
      }
      if (this.mSelectionDivider != null)
      {
        j = this.mTopSelectionDividerTop;
        i = this.mSelectionDividerHeight;
        this.mSelectionDivider.setBounds(0, j, getRight(), j + i);
        this.mSelectionDivider.draw(paramCanvas);
        j = this.mBottomSelectionDividerBottom;
        i = this.mSelectionDividerHeight;
        this.mSelectionDivider.setBounds(0, j - i, getRight(), j);
        this.mSelectionDivider.draw(paramCanvas);
      }
    }
  }
  
  public void onInitializeAccessibilityEvent(AccessibilityEvent paramAccessibilityEvent)
  {
    super.onInitializeAccessibilityEvent(paramAccessibilityEvent);
    paramAccessibilityEvent.setClassName(NumberPicker.class.getName());
    paramAccessibilityEvent.setScrollable(true);
    paramAccessibilityEvent.setScrollY((this.mMinValue + this.mValue) * this.mSelectorElementHeight);
    paramAccessibilityEvent.setMaxScrollY((this.mMaxValue - this.mMinValue) * this.mSelectorElementHeight);
  }
  
  public boolean onInterceptTouchEvent(MotionEvent paramMotionEvent)
  {
    boolean bool = true;
    if ((!this.mHasSelectorWheel) || (!isEnabled())) {
      bool = false;
    }
    for (;;)
    {
      return bool;
      switch (paramMotionEvent.getAction() & 0xFF)
      {
      default: 
        bool = false;
        break;
      case 0: 
        removeAllCallbacks();
        this.mInputText.setVisibility(4);
        float f = paramMotionEvent.getY();
        this.mLastDownEventY = f;
        this.mLastDownOrMoveEventY = f;
        this.mLastDownEventTime = paramMotionEvent.getEventTime();
        this.mIngonreMoveEvents = false;
        this.mShowSoftInputOnTap = false;
        if (this.mLastDownEventY < this.mTopSelectionDividerTop) {
          if (this.mScrollState == 0) {
            this.mPressedStateHelper.buttonPressDelayed(2);
          }
        }
        for (;;)
        {
          getParent().requestDisallowInterceptTouchEvent(true);
          if (this.mFlingScroller.isFinished()) {
            break label201;
          }
          this.mFlingScroller.forceFinished(true);
          this.mAdjustScroller.forceFinished(true);
          onScrollStateChange(0);
          break;
          if ((this.mLastDownEventY > this.mBottomSelectionDividerBottom) && (this.mScrollState == 0)) {
            this.mPressedStateHelper.buttonPressDelayed(1);
          }
        }
        label201:
        if (!this.mAdjustScroller.isFinished())
        {
          this.mFlingScroller.forceFinished(true);
          this.mAdjustScroller.forceFinished(true);
        }
        else if (this.mLastDownEventY < this.mTopSelectionDividerTop)
        {
          hideSoftInput();
          postChangeCurrentByOneFromLongPress(false, ViewConfiguration.getLongPressTimeout());
        }
        else if (this.mLastDownEventY > this.mBottomSelectionDividerBottom)
        {
          hideSoftInput();
          postChangeCurrentByOneFromLongPress(true, ViewConfiguration.getLongPressTimeout());
        }
        else
        {
          this.mShowSoftInputOnTap = true;
          postBeginSoftInputOnLongPressCommand();
        }
        break;
      }
    }
  }
  
  protected void onLayout(boolean paramBoolean, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    if (!this.mHasSelectorWheel) {
      super.onLayout(paramBoolean, paramInt1, paramInt2, paramInt3, paramInt4);
    }
    for (;;)
    {
      return;
      paramInt3 = getMeasuredWidth();
      paramInt4 = getMeasuredHeight();
      paramInt2 = this.mInputText.getMeasuredWidth();
      paramInt1 = this.mInputText.getMeasuredHeight();
      paramInt3 = (paramInt3 - paramInt2) / 2;
      paramInt4 = (paramInt4 - paramInt1) / 2;
      this.mInputText.layout(paramInt3, paramInt4, paramInt3 + paramInt2, paramInt4 + paramInt1);
      if (paramBoolean)
      {
        initializeSelectorWheel();
        initializeFadingEdges();
        this.mTopSelectionDividerTop = ((getHeight() - this.mSelectionDividersDistance) / 2 - this.mSelectionDividerHeight);
        this.mBottomSelectionDividerBottom = (this.mTopSelectionDividerTop + this.mSelectionDividerHeight * 2 + this.mSelectionDividersDistance);
      }
    }
  }
  
  protected void onMeasure(int paramInt1, int paramInt2)
  {
    if (!this.mHasSelectorWheel) {
      super.onMeasure(paramInt1, paramInt2);
    }
    for (;;)
    {
      return;
      super.onMeasure(makeMeasureSpec(paramInt1, this.mMaxWidth), makeMeasureSpec(paramInt2, this.mMaxHeight));
      setMeasuredDimension(resolveSizeAndStateRespectingMinSize(this.mMinWidth, getMeasuredWidth(), paramInt1), resolveSizeAndStateRespectingMinSize(this.mMinHeight, getMeasuredHeight(), paramInt2));
    }
  }
  
  public boolean onTouchEvent(MotionEvent paramMotionEvent)
  {
    boolean bool;
    if ((!isEnabled()) || (!this.mHasSelectorWheel))
    {
      bool = false;
      return bool;
    }
    if (this.mVelocityTracker == null) {
      this.mVelocityTracker = VelocityTracker.obtain();
    }
    this.mVelocityTracker.addMovement(paramMotionEvent);
    switch (paramMotionEvent.getAction() & 0xFF)
    {
    }
    for (;;)
    {
      bool = true;
      break;
      if (!this.mIngonreMoveEvents)
      {
        float f = paramMotionEvent.getY();
        if (this.mScrollState != 1) {
          if ((int)Math.abs(f - this.mLastDownEventY) > this.mTouchSlop)
          {
            removeAllCallbacks();
            onScrollStateChange(1);
          }
        }
        for (;;)
        {
          this.mLastDownOrMoveEventY = f;
          break;
          scrollBy(0, (int)(f - this.mLastDownOrMoveEventY));
          invalidate();
        }
        removeBeginSoftInputCommand();
        removeChangeCurrentByOneFromLongPress();
        this.mPressedStateHelper.cancel();
        VelocityTracker localVelocityTracker = this.mVelocityTracker;
        localVelocityTracker.computeCurrentVelocity(1000, this.mMaximumFlingVelocity);
        i = (int)localVelocityTracker.getYVelocity();
        if (Math.abs(i) <= this.mMinimumFlingVelocity) {
          break label230;
        }
        fling(i);
        onScrollStateChange(2);
        this.mVelocityTracker.recycle();
        this.mVelocityTracker = null;
      }
    }
    label230:
    int j = (int)paramMotionEvent.getY();
    int i = (int)Math.abs(j - this.mLastDownEventY);
    paramMotionEvent.getEventTime();
    long l = this.mLastDownEventTime;
    l = ViewConfiguration.getTapTimeout();
    if (i <= this.mTouchSlop) {
      if (this.mShowSoftInputOnTap)
      {
        this.mShowSoftInputOnTap = false;
        showSoftInput();
      }
    }
    for (;;)
    {
      onScrollStateChange(0);
      break;
      i = j / this.mSelectorElementHeight - 1;
      if (i > 0)
      {
        changeValueByOne(true);
        this.mPressedStateHelper.buttonTapped(1);
      }
      else if (i < 0)
      {
        changeValueByOne(false);
        this.mPressedStateHelper.buttonTapped(2);
        continue;
        ensureScrollWheelAdjusted();
      }
    }
  }
  
  public void scrollBy(int paramInt1, int paramInt2)
  {
    int[] arrayOfInt = this.mSelectorIndices;
    if ((!this.mWrapSelectorWheel) && (paramInt2 > 0) && (arrayOfInt[1] <= this.mMinValue)) {
      this.mCurrentScrollOffset = this.mInitialScrollOffset;
    }
    for (;;)
    {
      return;
      if ((!this.mWrapSelectorWheel) && (paramInt2 < 0) && (arrayOfInt[1] >= this.mMaxValue))
      {
        this.mCurrentScrollOffset = this.mInitialScrollOffset;
      }
      else
      {
        for (this.mCurrentScrollOffset += paramInt2; this.mCurrentScrollOffset - this.mInitialScrollOffset > this.mSelectorTextGapHeight; this.mCurrentScrollOffset = this.mInitialScrollOffset)
        {
          label77:
          this.mCurrentScrollOffset -= this.mSelectorElementHeight;
          decrementSelectorIndices(arrayOfInt);
          setValueInternal(arrayOfInt[1], true);
          if ((this.mWrapSelectorWheel) || (arrayOfInt[1] > this.mMinValue)) {
            break label77;
          }
        }
        while (this.mCurrentScrollOffset - this.mInitialScrollOffset < -this.mSelectorTextGapHeight)
        {
          this.mCurrentScrollOffset += this.mSelectorElementHeight;
          incrementSelectorIndices(arrayOfInt);
          setValueInternal(arrayOfInt[1], true);
          if ((!this.mWrapSelectorWheel) && (arrayOfInt[1] >= this.mMaxValue)) {
            this.mCurrentScrollOffset = this.mInitialScrollOffset;
          }
        }
      }
    }
  }
  
  public void setDisplayedValues(String[] paramArrayOfString)
  {
    if (this.mDisplayedValues == paramArrayOfString) {
      return;
    }
    this.mDisplayedValues = paramArrayOfString;
    if (this.mDisplayedValues != null) {
      this.mInputText.setRawInputType(524289);
    }
    for (;;)
    {
      updateInputTextView();
      initializeSelectorWheelIndices();
      tryComputeMaxWidth();
      break;
      this.mInputText.setRawInputType(2);
    }
  }
  
  public void setEnabled(boolean paramBoolean)
  {
    super.setEnabled(paramBoolean);
    if (!this.mHasSelectorWheel) {
      this.mIncrementButton.setEnabled(paramBoolean);
    }
    if (!this.mHasSelectorWheel) {
      this.mDecrementButton.setEnabled(paramBoolean);
    }
    this.mInputText.setEnabled(paramBoolean);
  }
  
  public void setFormatter(Formatter paramFormatter)
  {
    if (paramFormatter == this.mFormatter) {}
    for (;;)
    {
      return;
      this.mFormatter = paramFormatter;
      initializeSelectorWheelIndices();
      updateInputTextView();
    }
  }
  
  public void setMaxValue(int paramInt)
  {
    if (this.mMaxValue == paramInt) {
      return;
    }
    if (paramInt < 0) {
      throw new IllegalArgumentException("maxValue must be >= 0");
    }
    this.mMaxValue = paramInt;
    if (this.mMaxValue < this.mValue) {
      this.mValue = this.mMaxValue;
    }
    if (this.mMaxValue - this.mMinValue > this.mSelectorIndices.length) {}
    for (boolean bool = true;; bool = false)
    {
      setWrapSelectorWheel(bool);
      initializeSelectorWheelIndices();
      updateInputTextView();
      tryComputeMaxWidth();
      invalidate();
      break;
    }
  }
  
  public void setMinValue(int paramInt)
  {
    if (this.mMinValue == paramInt) {
      return;
    }
    if (paramInt < 0) {
      throw new IllegalArgumentException("minValue must be >= 0");
    }
    this.mMinValue = paramInt;
    if (this.mMinValue > this.mValue) {
      this.mValue = this.mMinValue;
    }
    if (this.mMaxValue - this.mMinValue > this.mSelectorIndices.length) {}
    for (boolean bool = true;; bool = false)
    {
      setWrapSelectorWheel(bool);
      initializeSelectorWheelIndices();
      updateInputTextView();
      tryComputeMaxWidth();
      invalidate();
      break;
    }
  }
  
  public void setOnLongPressUpdateInterval(long paramLong)
  {
    this.mLongPressUpdateInterval = paramLong;
  }
  
  public void setOnScrollListener(OnScrollListener paramOnScrollListener)
  {
    this.mOnScrollListener = paramOnScrollListener;
  }
  
  public void setOnValueChangedListener(OnValueChangeListener paramOnValueChangeListener)
  {
    this.mOnValueChangeListener = paramOnValueChangeListener;
  }
  
  public void setValue(int paramInt)
  {
    setValueInternal(paramInt, false);
  }
  
  public void setWrapSelectorWheel(boolean paramBoolean)
  {
    if (this.mMaxValue - this.mMinValue >= this.mSelectorIndices.length) {}
    for (int i = 1;; i = 0)
    {
      if (((!paramBoolean) || (i != 0)) && (paramBoolean != this.mWrapSelectorWheel)) {
        this.mWrapSelectorWheel = paramBoolean;
      }
      return;
    }
  }
  
  class AccessibilityNodeProviderImpl
    extends AccessibilityNodeProvider
  {
    private static final int UNDEFINED = Integer.MIN_VALUE;
    private static final int VIRTUAL_VIEW_ID_DECREMENT = 3;
    private static final int VIRTUAL_VIEW_ID_INCREMENT = 1;
    private static final int VIRTUAL_VIEW_ID_INPUT = 2;
    private int mAccessibilityFocusedView = Integer.MIN_VALUE;
    private final int[] mTempArray = new int[2];
    private final Rect mTempRect = new Rect();
    
    AccessibilityNodeProviderImpl() {}
    
    private AccessibilityNodeInfo createAccessibilityNodeInfoForNumberPicker(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
    {
      AccessibilityNodeInfo localAccessibilityNodeInfo = AccessibilityNodeInfo.obtain();
      localAccessibilityNodeInfo.setClassName(NumberPicker.class.getName());
      localAccessibilityNodeInfo.setPackageName(NumberPicker.this.getContext().getPackageName());
      localAccessibilityNodeInfo.setSource(NumberPicker.this);
      if (hasVirtualDecrementButton()) {
        localAccessibilityNodeInfo.addChild(NumberPicker.this, 3);
      }
      localAccessibilityNodeInfo.addChild(NumberPicker.this, 2);
      if (hasVirtualIncrementButton()) {
        localAccessibilityNodeInfo.addChild(NumberPicker.this, 1);
      }
      localAccessibilityNodeInfo.setParent((View)NumberPicker.this.getParentForAccessibility());
      localAccessibilityNodeInfo.setEnabled(NumberPicker.this.isEnabled());
      localAccessibilityNodeInfo.setScrollable(true);
      if (this.mAccessibilityFocusedView != -1) {
        localAccessibilityNodeInfo.addAction(64);
      }
      if (this.mAccessibilityFocusedView == -1) {
        localAccessibilityNodeInfo.addAction(128);
      }
      if (NumberPicker.this.isEnabled())
      {
        if ((NumberPicker.this.getWrapSelectorWheel()) || (NumberPicker.this.getValue() < NumberPicker.this.getMaxValue())) {
          localAccessibilityNodeInfo.addAction(4096);
        }
        if ((NumberPicker.this.getWrapSelectorWheel()) || (NumberPicker.this.getValue() > NumberPicker.this.getMinValue())) {
          localAccessibilityNodeInfo.addAction(8192);
        }
      }
      return localAccessibilityNodeInfo;
    }
    
    private AccessibilityNodeInfo createAccessibilityNodeInfoForVirtualButton(int paramInt1, String paramString, int paramInt2, int paramInt3, int paramInt4, int paramInt5)
    {
      AccessibilityNodeInfo localAccessibilityNodeInfo = AccessibilityNodeInfo.obtain();
      localAccessibilityNodeInfo.setClassName(Button.class.getName());
      localAccessibilityNodeInfo.setPackageName(NumberPicker.this.getContext().getPackageName());
      localAccessibilityNodeInfo.setSource(NumberPicker.this, paramInt1);
      localAccessibilityNodeInfo.setParent(NumberPicker.this);
      localAccessibilityNodeInfo.setText(paramString);
      localAccessibilityNodeInfo.setClickable(true);
      localAccessibilityNodeInfo.setLongClickable(true);
      localAccessibilityNodeInfo.setEnabled(NumberPicker.this.isEnabled());
      paramString = this.mTempRect;
      paramString.set(paramInt2, paramInt3, paramInt4, paramInt5);
      localAccessibilityNodeInfo.setBoundsInParent(paramString);
      int[] arrayOfInt = this.mTempArray;
      NumberPicker.this.getLocationOnScreen(arrayOfInt);
      paramString.offset(arrayOfInt[0], arrayOfInt[1]);
      localAccessibilityNodeInfo.setBoundsInScreen(paramString);
      if (this.mAccessibilityFocusedView != paramInt1) {
        localAccessibilityNodeInfo.addAction(64);
      }
      if (this.mAccessibilityFocusedView == paramInt1) {
        localAccessibilityNodeInfo.addAction(128);
      }
      if (NumberPicker.this.isEnabled()) {
        localAccessibilityNodeInfo.addAction(16);
      }
      return localAccessibilityNodeInfo;
    }
    
    private AccessibilityNodeInfo createAccessibiltyNodeInfoForInputText()
    {
      AccessibilityNodeInfo localAccessibilityNodeInfo = NumberPicker.this.mInputText.createAccessibilityNodeInfo();
      localAccessibilityNodeInfo.setSource(NumberPicker.this, 2);
      if (this.mAccessibilityFocusedView != 2) {
        localAccessibilityNodeInfo.addAction(64);
      }
      if (this.mAccessibilityFocusedView == 2) {
        localAccessibilityNodeInfo.addAction(128);
      }
      return localAccessibilityNodeInfo;
    }
    
    private void findAccessibilityNodeInfosByTextInChild(String paramString, int paramInt, List<AccessibilityNodeInfo> paramList)
    {
      switch (paramInt)
      {
      }
      for (;;)
      {
        return;
        Object localObject = getVirtualDecrementButtonText();
        if ((!TextUtils.isEmpty((CharSequence)localObject)) && (((String)localObject).toString().toLowerCase().contains(paramString)))
        {
          paramList.add(createAccessibilityNodeInfo(3));
          continue;
          localObject = NumberPicker.this.mInputText.getText();
          if ((!TextUtils.isEmpty((CharSequence)localObject)) && (((CharSequence)localObject).toString().toLowerCase().contains(paramString)))
          {
            paramList.add(createAccessibilityNodeInfo(2));
          }
          else
          {
            localObject = NumberPicker.this.mInputText.getText();
            if ((!TextUtils.isEmpty((CharSequence)localObject)) && (((CharSequence)localObject).toString().toLowerCase().contains(paramString)))
            {
              paramList.add(createAccessibilityNodeInfo(2));
              continue;
              localObject = getVirtualIncrementButtonText();
              if ((!TextUtils.isEmpty((CharSequence)localObject)) && (((String)localObject).toString().toLowerCase().contains(paramString))) {
                paramList.add(createAccessibilityNodeInfo(1));
              }
            }
          }
        }
      }
    }
    
    private String getVirtualDecrementButtonText()
    {
      int i = NumberPicker.this.mValue - 1;
      int j = i;
      if (NumberPicker.this.mWrapSelectorWheel) {
        j = NumberPicker.this.getWrappedSelectorIndex(i);
      }
      String str;
      if (j >= NumberPicker.this.mMinValue) {
        if (NumberPicker.this.mDisplayedValues == null) {
          str = NumberPicker.this.formatNumber(j);
        }
      }
      for (;;)
      {
        return str;
        str = NumberPicker.this.mDisplayedValues[(j - NumberPicker.this.mMinValue)];
        continue;
        str = null;
      }
    }
    
    private String getVirtualIncrementButtonText()
    {
      int i = NumberPicker.this.mValue + 1;
      int j = i;
      if (NumberPicker.this.mWrapSelectorWheel) {
        j = NumberPicker.this.getWrappedSelectorIndex(i);
      }
      String str;
      if (j <= NumberPicker.this.mMaxValue) {
        if (NumberPicker.this.mDisplayedValues == null) {
          str = NumberPicker.this.formatNumber(j);
        }
      }
      for (;;)
      {
        return str;
        str = NumberPicker.this.mDisplayedValues[(j - NumberPicker.this.mMinValue)];
        continue;
        str = null;
      }
    }
    
    private boolean hasVirtualDecrementButton()
    {
      if ((NumberPicker.this.getWrapSelectorWheel()) || (NumberPicker.this.getValue() > NumberPicker.this.getMinValue())) {}
      for (boolean bool = true;; bool = false) {
        return bool;
      }
    }
    
    private boolean hasVirtualIncrementButton()
    {
      if ((NumberPicker.this.getWrapSelectorWheel()) || (NumberPicker.this.getValue() < NumberPicker.this.getMaxValue())) {}
      for (boolean bool = true;; bool = false) {
        return bool;
      }
    }
    
    private void sendAccessibilityEventForVirtualButton(int paramInt1, int paramInt2, String paramString)
    {
      if (((AccessibilityManager)NumberPicker.this.getContext().getSystemService("accessibility")).isEnabled())
      {
        AccessibilityEvent localAccessibilityEvent = AccessibilityEvent.obtain(paramInt2);
        localAccessibilityEvent.setClassName(Button.class.getName());
        localAccessibilityEvent.setPackageName(NumberPicker.this.getContext().getPackageName());
        localAccessibilityEvent.getText().add(paramString);
        localAccessibilityEvent.setEnabled(NumberPicker.this.isEnabled());
        localAccessibilityEvent.setSource(NumberPicker.this, paramInt1);
        NumberPicker.this.requestSendAccessibilityEvent(NumberPicker.this, localAccessibilityEvent);
      }
    }
    
    private void sendAccessibilityEventForVirtualText(int paramInt)
    {
      if (((AccessibilityManager)NumberPicker.this.getContext().getSystemService("accessibility")).isEnabled())
      {
        AccessibilityEvent localAccessibilityEvent = AccessibilityEvent.obtain(paramInt);
        NumberPicker.this.mInputText.onInitializeAccessibilityEvent(localAccessibilityEvent);
        NumberPicker.this.mInputText.onPopulateAccessibilityEvent(localAccessibilityEvent);
        localAccessibilityEvent.setSource(NumberPicker.this, 2);
        NumberPicker.this.requestSendAccessibilityEvent(NumberPicker.this, localAccessibilityEvent);
      }
    }
    
    public AccessibilityNodeInfo createAccessibilityNodeInfo(int paramInt)
    {
      Object localObject;
      switch (paramInt)
      {
      case 0: 
      default: 
        localObject = super.createAccessibilityNodeInfo(paramInt);
      }
      for (;;)
      {
        return (AccessibilityNodeInfo)localObject;
        localObject = createAccessibilityNodeInfoForNumberPicker(NumberPicker.this.getScrollX(), NumberPicker.this.getScrollY(), NumberPicker.this.getScrollX() + (NumberPicker.this.getRight() - NumberPicker.this.getLeft()), NumberPicker.this.getScrollY() + (NumberPicker.this.getBottom() - NumberPicker.this.getTop()));
        continue;
        localObject = getVirtualDecrementButtonText();
        int i = NumberPicker.this.getScrollX();
        int j = NumberPicker.this.getScrollY();
        int k = NumberPicker.this.getScrollX();
        int m = NumberPicker.this.getRight();
        int n = NumberPicker.this.getLeft();
        paramInt = NumberPicker.this.mTopSelectionDividerTop;
        localObject = createAccessibilityNodeInfoForVirtualButton(3, (String)localObject, i, j, m - n + k, NumberPicker.this.mSelectionDividerHeight + paramInt);
        continue;
        localObject = createAccessibiltyNodeInfoForInputText();
        continue;
        localObject = getVirtualIncrementButtonText();
        int i1 = NumberPicker.this.getScrollX();
        j = NumberPicker.this.mBottomSelectionDividerBottom;
        n = NumberPicker.this.mSelectionDividerHeight;
        paramInt = NumberPicker.this.getScrollX();
        m = NumberPicker.this.getRight();
        k = NumberPicker.this.getLeft();
        i = NumberPicker.this.getScrollY();
        localObject = createAccessibilityNodeInfoForVirtualButton(1, (String)localObject, i1, j - n, m - k + paramInt, NumberPicker.this.getBottom() - NumberPicker.this.getTop() + i);
      }
    }
    
    public List<AccessibilityNodeInfo> findAccessibilityNodeInfosByText(String paramString, int paramInt)
    {
      if (TextUtils.isEmpty(paramString)) {
        paramString = Collections.emptyList();
      }
      for (;;)
      {
        return paramString;
        String str = paramString.toLowerCase();
        ArrayList localArrayList = new ArrayList();
        switch (paramInt)
        {
        case 0: 
        default: 
          paramString = super.findAccessibilityNodeInfosByText(paramString, paramInt);
          break;
        case -1: 
          findAccessibilityNodeInfosByTextInChild(str, 3, localArrayList);
          findAccessibilityNodeInfosByTextInChild(str, 2, localArrayList);
          findAccessibilityNodeInfosByTextInChild(str, 1, localArrayList);
          paramString = localArrayList;
          break;
        case 1: 
        case 2: 
        case 3: 
          findAccessibilityNodeInfosByTextInChild(str, paramInt, localArrayList);
          paramString = localArrayList;
        }
      }
    }
    
    public boolean performAction(int paramInt1, int paramInt2, Bundle paramBundle)
    {
      boolean bool1 = false;
      boolean bool2 = false;
      boolean bool3;
      switch (paramInt1)
      {
      case 0: 
      default: 
        bool3 = super.performAction(paramInt1, paramInt2, paramBundle);
      }
      for (;;)
      {
        return bool3;
        switch (paramInt2)
        {
        default: 
          break;
        case 64: 
          bool3 = bool2;
          if (this.mAccessibilityFocusedView != paramInt1)
          {
            this.mAccessibilityFocusedView = paramInt1;
            NumberPicker.this.performAccessibilityAction(64, null);
            bool3 = true;
          }
          break;
        case 128: 
          bool3 = bool2;
          if (this.mAccessibilityFocusedView == paramInt1)
          {
            this.mAccessibilityFocusedView = Integer.MIN_VALUE;
            NumberPicker.this.performAccessibilityAction(128, null);
            bool3 = true;
          }
          break;
        case 4096: 
          bool3 = bool2;
          if (NumberPicker.this.isEnabled()) {
            if (!NumberPicker.this.getWrapSelectorWheel())
            {
              bool3 = bool2;
              if (NumberPicker.this.getValue() >= NumberPicker.this.getMaxValue()) {}
            }
            else
            {
              NumberPicker.this.changeValueByOne(true);
              bool3 = true;
            }
          }
          break;
        case 8192: 
          bool3 = bool2;
          if (NumberPicker.this.isEnabled()) {
            if (!NumberPicker.this.getWrapSelectorWheel())
            {
              bool3 = bool2;
              if (NumberPicker.this.getValue() <= NumberPicker.this.getMinValue()) {}
            }
            else
            {
              NumberPicker.this.changeValueByOne(false);
              bool3 = true;
              continue;
              switch (paramInt2)
              {
              default: 
                bool3 = NumberPicker.this.mInputText.performAccessibilityAction(paramInt2, paramBundle);
                break;
              case 1: 
                bool3 = bool2;
                if (NumberPicker.this.isEnabled())
                {
                  bool3 = bool2;
                  if (!NumberPicker.this.mInputText.isFocused()) {
                    bool3 = NumberPicker.this.mInputText.requestFocus();
                  }
                }
                break;
              case 2: 
                bool3 = bool2;
                if (NumberPicker.this.isEnabled())
                {
                  bool3 = bool2;
                  if (NumberPicker.this.mInputText.isFocused())
                  {
                    NumberPicker.this.mInputText.clearFocus();
                    bool3 = true;
                  }
                }
                break;
              case 16: 
                bool3 = bool2;
                if (NumberPicker.this.isEnabled())
                {
                  NumberPicker.this.showSoftInput();
                  bool3 = true;
                }
                break;
              case 64: 
                bool3 = bool2;
                if (this.mAccessibilityFocusedView != paramInt1)
                {
                  this.mAccessibilityFocusedView = paramInt1;
                  sendAccessibilityEventForVirtualView(paramInt1, 32768);
                  NumberPicker.this.mInputText.invalidate();
                  bool3 = true;
                }
                break;
              case 128: 
                bool3 = bool2;
                if (this.mAccessibilityFocusedView == paramInt1)
                {
                  this.mAccessibilityFocusedView = Integer.MIN_VALUE;
                  sendAccessibilityEventForVirtualView(paramInt1, 65536);
                  NumberPicker.this.mInputText.invalidate();
                  bool3 = true;
                  continue;
                  switch (paramInt2)
                  {
                  default: 
                    bool3 = bool2;
                    break;
                  case 16: 
                    bool3 = bool2;
                    if (NumberPicker.this.isEnabled())
                    {
                      NumberPicker.this.changeValueByOne(true);
                      sendAccessibilityEventForVirtualView(paramInt1, 1);
                      bool3 = true;
                    }
                    break;
                  case 64: 
                    bool3 = bool2;
                    if (this.mAccessibilityFocusedView != paramInt1)
                    {
                      this.mAccessibilityFocusedView = paramInt1;
                      sendAccessibilityEventForVirtualView(paramInt1, 32768);
                      NumberPicker.this.invalidate(0, NumberPicker.this.mBottomSelectionDividerBottom, NumberPicker.this.getRight(), NumberPicker.this.getBottom());
                      bool3 = true;
                    }
                    break;
                  case 128: 
                    bool3 = bool2;
                    if (this.mAccessibilityFocusedView == paramInt1)
                    {
                      this.mAccessibilityFocusedView = Integer.MIN_VALUE;
                      sendAccessibilityEventForVirtualView(paramInt1, 65536);
                      NumberPicker.this.invalidate(0, NumberPicker.this.mBottomSelectionDividerBottom, NumberPicker.this.getRight(), NumberPicker.this.getBottom());
                      bool3 = true;
                      continue;
                      switch (paramInt2)
                      {
                      default: 
                        bool3 = bool2;
                        break;
                      case 16: 
                        bool3 = bool2;
                        if (NumberPicker.this.isEnabled())
                        {
                          bool3 = bool1;
                          if (paramInt1 == 1) {
                            bool3 = true;
                          }
                          NumberPicker.this.changeValueByOne(bool3);
                          sendAccessibilityEventForVirtualView(paramInt1, 1);
                          bool3 = true;
                        }
                        break;
                      case 64: 
                        bool3 = bool2;
                        if (this.mAccessibilityFocusedView != paramInt1)
                        {
                          this.mAccessibilityFocusedView = paramInt1;
                          sendAccessibilityEventForVirtualView(paramInt1, 32768);
                          NumberPicker.this.invalidate(0, 0, NumberPicker.this.getRight(), NumberPicker.this.mTopSelectionDividerTop);
                          bool3 = true;
                        }
                        break;
                      case 128: 
                        bool3 = bool2;
                        if (this.mAccessibilityFocusedView == paramInt1)
                        {
                          this.mAccessibilityFocusedView = Integer.MIN_VALUE;
                          sendAccessibilityEventForVirtualView(paramInt1, 65536);
                          NumberPicker.this.invalidate(0, 0, NumberPicker.this.getRight(), NumberPicker.this.mTopSelectionDividerTop);
                          bool3 = true;
                        }
                        break;
                      }
                    }
                    break;
                  }
                }
                break;
              }
            }
          }
          break;
        }
      }
    }
    
    public void sendAccessibilityEventForVirtualView(int paramInt1, int paramInt2)
    {
      switch (paramInt1)
      {
      }
      for (;;)
      {
        return;
        if (hasVirtualDecrementButton())
        {
          sendAccessibilityEventForVirtualButton(paramInt1, paramInt2, getVirtualDecrementButtonText());
          continue;
          sendAccessibilityEventForVirtualText(paramInt2);
          continue;
          if (hasVirtualIncrementButton()) {
            sendAccessibilityEventForVirtualButton(paramInt1, paramInt2, getVirtualIncrementButtonText());
          }
        }
      }
    }
  }
  
  class BeginSoftInputOnLongPressCommand
    implements Runnable
  {
    BeginSoftInputOnLongPressCommand() {}
    
    public void run()
    {
      NumberPicker.this.showSoftInput();
      NumberPicker.access$2002(NumberPicker.this, true);
    }
  }
  
  class ChangeCurrentByOneFromLongPressCommand
    implements Runnable
  {
    private boolean mIncrement;
    
    ChangeCurrentByOneFromLongPressCommand() {}
    
    private void setStep(boolean paramBoolean)
    {
      this.mIncrement = paramBoolean;
    }
    
    public void run()
    {
      NumberPicker.this.changeValueByOne(this.mIncrement);
      NumberPicker.this.postDelayed(this, NumberPicker.this.mLongPressUpdateInterval);
    }
  }
  
  public static class CustomEditText
    extends EditText
  {
    public CustomEditText(Context paramContext, AttributeSet paramAttributeSet)
    {
      super(paramAttributeSet);
    }
    
    public void onEditorAction(int paramInt)
    {
      super.onEditorAction(paramInt);
      if (paramInt == 6) {
        clearFocus();
      }
    }
  }
  
  public static abstract interface Formatter
  {
    public abstract String format(int paramInt);
  }
  
  class InputTextFilter
    extends NumberKeyListener
  {
    InputTextFilter() {}
    
    public CharSequence filter(CharSequence paramCharSequence, int paramInt1, int paramInt2, Spanned paramSpanned, int paramInt3, int paramInt4)
    {
      int i = 0;
      Object localObject1;
      Object localObject2;
      if (NumberPicker.this.mDisplayedValues == null)
      {
        localObject1 = super.filter(paramCharSequence, paramInt1, paramInt2, paramSpanned, paramInt3, paramInt4);
        localObject2 = localObject1;
        if (localObject1 == null) {
          localObject2 = paramCharSequence.subSequence(paramInt1, paramInt2);
        }
        paramCharSequence = String.valueOf(paramSpanned.subSequence(0, paramInt3)) + localObject2 + paramSpanned.subSequence(paramInt4, paramSpanned.length());
        if (!"".equals(paramCharSequence)) {}
      }
      for (;;)
      {
        return paramCharSequence;
        if (NumberPicker.this.getSelectedPos(paramCharSequence) > NumberPicker.this.mMaxValue)
        {
          paramCharSequence = "";
        }
        else
        {
          paramCharSequence = (CharSequence)localObject2;
          continue;
          paramCharSequence = String.valueOf(paramCharSequence.subSequence(paramInt1, paramInt2));
          if (TextUtils.isEmpty(paramCharSequence))
          {
            paramCharSequence = "";
          }
          else
          {
            paramCharSequence = String.valueOf(paramSpanned.subSequence(0, paramInt3)) + paramCharSequence + paramSpanned.subSequence(paramInt4, paramSpanned.length());
            localObject1 = String.valueOf(paramCharSequence).toLowerCase();
            localObject2 = NumberPicker.this.mDisplayedValues;
            paramInt2 = localObject2.length;
            for (paramInt1 = i;; paramInt1++)
            {
              if (paramInt1 >= paramInt2) {
                break label301;
              }
              paramSpanned = localObject2[paramInt1];
              if (paramSpanned.toLowerCase().startsWith((String)localObject1))
              {
                NumberPicker.this.postSetSelectionCommand(paramCharSequence.length(), paramSpanned.length());
                paramCharSequence = paramSpanned.subSequence(paramInt3, paramSpanned.length());
                break;
              }
            }
            label301:
            paramCharSequence = "";
          }
        }
      }
    }
    
    protected char[] getAcceptedChars()
    {
      return NumberPicker.DIGIT_CHARACTERS;
    }
    
    public int getInputType()
    {
      return 1;
    }
  }
  
  public static abstract interface OnScrollListener
  {
    public static final int SCROLL_STATE_FLING = 2;
    public static final int SCROLL_STATE_IDLE = 0;
    public static final int SCROLL_STATE_TOUCH_SCROLL = 1;
    
    public abstract void onScrollStateChange(NumberPicker paramNumberPicker, int paramInt);
  }
  
  public static abstract interface OnValueChangeListener
  {
    public abstract void onValueChange(NumberPicker paramNumberPicker, int paramInt1, int paramInt2);
  }
  
  class PressedStateHelper
    implements Runnable
  {
    public static final int BUTTON_DECREMENT = 2;
    public static final int BUTTON_INCREMENT = 1;
    private final int MODE_PRESS = 1;
    private final int MODE_TAPPED = 2;
    private int mManagedButton;
    private int mMode;
    
    PressedStateHelper() {}
    
    public void buttonPressDelayed(int paramInt)
    {
      cancel();
      this.mMode = 1;
      this.mManagedButton = paramInt;
      NumberPicker.this.postDelayed(this, ViewConfiguration.getTapTimeout());
    }
    
    public void buttonTapped(int paramInt)
    {
      cancel();
      this.mMode = 2;
      this.mManagedButton = paramInt;
      NumberPicker.this.post(this);
    }
    
    public void cancel()
    {
      this.mMode = 0;
      this.mManagedButton = 0;
      NumberPicker.this.removeCallbacks(this);
      if (NumberPicker.this.mIncrementVirtualButtonPressed)
      {
        NumberPicker.access$1402(NumberPicker.this, false);
        NumberPicker.this.invalidate(0, NumberPicker.this.mBottomSelectionDividerBottom, NumberPicker.this.getRight(), NumberPicker.this.getBottom());
      }
      NumberPicker.access$1602(NumberPicker.this, false);
      if (NumberPicker.this.mDecrementVirtualButtonPressed) {
        NumberPicker.this.invalidate(0, 0, NumberPicker.this.getRight(), NumberPicker.this.mTopSelectionDividerTop);
      }
    }
    
    public void run()
    {
      switch (this.mMode)
      {
      }
      for (;;)
      {
        return;
        switch (this.mManagedButton)
        {
        default: 
          break;
        case 1: 
          NumberPicker.access$1402(NumberPicker.this, true);
          NumberPicker.this.invalidate(0, NumberPicker.this.mBottomSelectionDividerBottom, NumberPicker.this.getRight(), NumberPicker.this.getBottom());
          break;
        case 2: 
          NumberPicker.access$1602(NumberPicker.this, true);
          NumberPicker.this.invalidate(0, 0, NumberPicker.this.getRight(), NumberPicker.this.mTopSelectionDividerTop);
          continue;
          switch (this.mManagedButton)
          {
          default: 
            break;
          case 1: 
            if (!NumberPicker.this.mIncrementVirtualButtonPressed) {
              NumberPicker.this.postDelayed(this, ViewConfiguration.getPressedStateDuration());
            }
            NumberPicker.access$1402(NumberPicker.this, NumberPicker.this.mIncrementVirtualButtonPressed ^ true);
            NumberPicker.this.invalidate(0, NumberPicker.this.mBottomSelectionDividerBottom, NumberPicker.this.getRight(), NumberPicker.this.getBottom());
            break;
          case 2: 
            if (!NumberPicker.this.mDecrementVirtualButtonPressed) {
              NumberPicker.this.postDelayed(this, ViewConfiguration.getPressedStateDuration());
            }
            NumberPicker.access$1602(NumberPicker.this, NumberPicker.this.mDecrementVirtualButtonPressed ^ true);
            NumberPicker.this.invalidate(0, 0, NumberPicker.this.getRight(), NumberPicker.this.mTopSelectionDividerTop);
          }
          break;
        }
      }
    }
  }
  
  class SetSelectionCommand
    implements Runnable
  {
    private int mSelectionEnd;
    private int mSelectionStart;
    
    SetSelectionCommand() {}
    
    public void run()
    {
      NumberPicker.this.mInputText.setSelection(this.mSelectionStart, this.mSelectionEnd);
    }
  }
  
  class SupportAccessibilityNodeProvider
  {
    NumberPicker.AccessibilityNodeProviderImpl mProvider;
    
    private SupportAccessibilityNodeProvider()
    {
      if (Build.VERSION.SDK_INT >= 16) {
        this.mProvider = new NumberPicker.AccessibilityNodeProviderImpl(NumberPicker.this);
      }
    }
    
    public boolean performAction(int paramInt1, int paramInt2, Bundle paramBundle)
    {
      if (this.mProvider != null) {}
      for (boolean bool = this.mProvider.performAction(paramInt1, paramInt2, paramBundle);; bool = false) {
        return bool;
      }
    }
    
    public void sendAccessibilityEventForVirtualView(int paramInt1, int paramInt2)
    {
      if (this.mProvider != null) {
        this.mProvider.sendAccessibilityEventForVirtualView(paramInt1, paramInt2);
      }
    }
  }
  
  private static class TwoDigitFormatter
    implements NumberPicker.Formatter
  {
    final Object[] mArgs = new Object[1];
    final StringBuilder mBuilder = new StringBuilder();
    Formatter mFmt;
    char mZeroDigit;
    
    TwoDigitFormatter()
    {
      init(Locale.getDefault());
    }
    
    private Formatter createFormatter(Locale paramLocale)
    {
      return new Formatter(this.mBuilder, paramLocale);
    }
    
    private static char getZeroDigit(Locale paramLocale)
    {
      return new DecimalFormatSymbols(paramLocale).getZeroDigit();
    }
    
    private void init(Locale paramLocale)
    {
      this.mFmt = createFormatter(paramLocale);
      this.mZeroDigit = getZeroDigit(paramLocale);
    }
    
    public String format(int paramInt)
    {
      Locale localLocale = Locale.getDefault();
      if (this.mZeroDigit != getZeroDigit(localLocale)) {
        init(localLocale);
      }
      this.mArgs[0] = Integer.valueOf(paramInt);
      this.mBuilder.delete(0, this.mBuilder.length());
      this.mFmt.format("%02d", this.mArgs);
      return this.mFmt.toString();
    }
  }
}


/* Location:              /prj/BitcoinChecker/tools/dex-tools-2.1-SNAPSHOT/bc-signed-aligned-dex2jar.jar!/net/simonvt/numberpicker/NumberPicker.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */