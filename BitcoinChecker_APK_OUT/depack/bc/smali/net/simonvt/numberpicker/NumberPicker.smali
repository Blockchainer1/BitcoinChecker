.class public Lnet/simonvt/numberpicker/NumberPicker;
.super Landroid/widget/LinearLayout;
.source "NumberPicker.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;,
        Lnet/simonvt/numberpicker/NumberPicker$SupportAccessibilityNodeProvider;,
        Lnet/simonvt/numberpicker/NumberPicker$BeginSoftInputOnLongPressCommand;,
        Lnet/simonvt/numberpicker/NumberPicker$CustomEditText;,
        Lnet/simonvt/numberpicker/NumberPicker$ChangeCurrentByOneFromLongPressCommand;,
        Lnet/simonvt/numberpicker/NumberPicker$SetSelectionCommand;,
        Lnet/simonvt/numberpicker/NumberPicker$PressedStateHelper;,
        Lnet/simonvt/numberpicker/NumberPicker$InputTextFilter;,
        Lnet/simonvt/numberpicker/NumberPicker$Formatter;,
        Lnet/simonvt/numberpicker/NumberPicker$OnScrollListener;,
        Lnet/simonvt/numberpicker/NumberPicker$OnValueChangeListener;,
        Lnet/simonvt/numberpicker/NumberPicker$TwoDigitFormatter;
    }
.end annotation


# static fields
.field private static final DEFAULT_LAYOUT_RESOURCE_ID:I = 0x0

.field private static final DEFAULT_LONG_PRESS_UPDATE_INTERVAL:J = 0x12cL

.field private static final DIGIT_CHARACTERS:[C

.field private static final SELECTOR_ADJUSTMENT_DURATION_MILLIS:I = 0x320

.field private static final SELECTOR_MAX_FLING_VELOCITY_ADJUSTMENT:I = 0x8

.field private static final SELECTOR_MIDDLE_ITEM_INDEX:I = 0x1

.field private static final SELECTOR_WHEEL_ITEM_COUNT:I = 0x3

.field private static final SIZE_UNSPECIFIED:I = -0x1

.field private static final SNAP_SCROLL_DURATION:I = 0x12c

.field private static final TOP_AND_BOTTOM_FADING_EDGE_STRENGTH:F = 0.9f

.field private static final UNSCALED_DEFAULT_SELECTION_DIVIDERS_DISTANCE:I = 0x30

.field private static final UNSCALED_DEFAULT_SELECTION_DIVIDER_HEIGHT:I = 0x2

.field private static final sTwoDigitFormatter:Lnet/simonvt/numberpicker/NumberPicker$TwoDigitFormatter;


# instance fields
.field private mAccessibilityNodeProvider:Lnet/simonvt/numberpicker/NumberPicker$SupportAccessibilityNodeProvider;

.field private final mAdjustScroller:Lnet/simonvt/numberpicker/Scroller;

.field private mBeginSoftInputOnLongPressCommand:Lnet/simonvt/numberpicker/NumberPicker$BeginSoftInputOnLongPressCommand;

.field private mBottomSelectionDividerBottom:I

.field private mChangeCurrentByOneFromLongPressCommand:Lnet/simonvt/numberpicker/NumberPicker$ChangeCurrentByOneFromLongPressCommand;

.field private final mComputeMaxWidth:Z

.field private mCurrentScrollOffset:I

.field private final mDecrementButton:Landroid/widget/ImageButton;

.field private mDecrementVirtualButtonPressed:Z

.field private mDisplayedValues:[Ljava/lang/String;

.field private final mFlingScroller:Lnet/simonvt/numberpicker/Scroller;

.field private mFormatter:Lnet/simonvt/numberpicker/NumberPicker$Formatter;

.field private final mHasSelectorWheel:Z

.field private final mIncrementButton:Landroid/widget/ImageButton;

.field private mIncrementVirtualButtonPressed:Z

.field private mIngonreMoveEvents:Z

.field private mInitialScrollOffset:I

.field private final mInputText:Landroid/widget/EditText;

.field private mLastDownEventTime:J

.field private mLastDownEventY:F

.field private mLastDownOrMoveEventY:F

.field private mLastHandledDownDpadKeyCode:I

.field private mLastHoveredChildVirtualViewId:I

.field private mLongPressUpdateInterval:J

.field private final mMaxHeight:I

.field private mMaxValue:I

.field private mMaxWidth:I

.field private mMaximumFlingVelocity:I

.field private final mMinHeight:I

.field private mMinValue:I

.field private final mMinWidth:I

.field private mMinimumFlingVelocity:I

.field private mOnScrollListener:Lnet/simonvt/numberpicker/NumberPicker$OnScrollListener;

.field private mOnValueChangeListener:Lnet/simonvt/numberpicker/NumberPicker$OnValueChangeListener;

.field private final mPressedStateHelper:Lnet/simonvt/numberpicker/NumberPicker$PressedStateHelper;

.field private mPreviousScrollerY:I

.field private mScrollState:I

.field private final mSelectionDivider:Landroid/graphics/drawable/Drawable;

.field private final mSelectionDividerHeight:I

.field private final mSelectionDividersDistance:I

.field private mSelectorElementHeight:I

.field private final mSelectorIndexToStringCache:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final mSelectorIndices:[I

.field private mSelectorTextGapHeight:I

.field private final mSelectorWheelPaint:Landroid/graphics/Paint;

.field private mSetSelectionCommand:Lnet/simonvt/numberpicker/NumberPicker$SetSelectionCommand;

.field private mShowSoftInputOnTap:Z

.field private final mSolidColor:I

.field private final mTextSize:I

.field private mTopSelectionDividerTop:I

.field private mTouchSlop:I

.field private mValue:I

.field private mVelocityTracker:Landroid/view/VelocityTracker;

.field private final mVirtualButtonPressedDrawable:Landroid/graphics/drawable/Drawable;

.field private mWrapSelectorWheel:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 197
    new-instance v0, Lnet/simonvt/numberpicker/NumberPicker$TwoDigitFormatter;

    invoke-direct {v0}, Lnet/simonvt/numberpicker/NumberPicker$TwoDigitFormatter;-><init>()V

    sput-object v0, Lnet/simonvt/numberpicker/NumberPicker;->sTwoDigitFormatter:Lnet/simonvt/numberpicker/NumberPicker$TwoDigitFormatter;

    .line 1970
    const/16 v0, 0x1e

    new-array v0, v0, [C

    fill-array-data v0, :array_0

    sput-object v0, Lnet/simonvt/numberpicker/NumberPicker;->DIGIT_CHARACTERS:[C

    return-void

    nop

    :array_0
    .array-data 2
        0x30s
        0x31s
        0x32s
        0x33s
        0x34s
        0x35s
        0x36s
        0x37s
        0x38s
        0x39s
        0x660s
        0x661s
        0x662s
        0x663s
        0x664s
        0x665s
        0x666s
        0x667s
        0x668s
        0x669s
        0x6f0s
        0x6f1s
        0x6f2s
        0x6f3s
        0x6f4s
        0x6f5s
        0x6f6s
        0x6f7s
        0x6f8s
        0x6f9s
    .end array-data
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 550
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lnet/simonvt/numberpicker/NumberPicker;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 551
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 560
    sget v0, Lnet/simonvt/numberpicker/R$attr;->numberPickerStyle:I

    invoke-direct {p0, p1, p2, v0}, Lnet/simonvt/numberpicker/NumberPicker;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 561
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 19
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 571
    invoke-direct/range {p0 .. p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 299
    const-wide/16 v16, 0x12c

    move-wide/from16 v0, v16

    move-object/from16 v2, p0

    iput-wide v0, v2, Lnet/simonvt/numberpicker/NumberPicker;->mLongPressUpdateInterval:J

    .line 304
    new-instance v15, Landroid/util/SparseArray;

    invoke-direct {v15}, Landroid/util/SparseArray;-><init>()V

    move-object/from16 v0, p0

    iput-object v15, v0, Lnet/simonvt/numberpicker/NumberPicker;->mSelectorIndexToStringCache:Landroid/util/SparseArray;

    .line 309
    const/4 v15, 0x3

    new-array v15, v15, [I

    move-object/from16 v0, p0

    iput-object v15, v0, Lnet/simonvt/numberpicker/NumberPicker;->mSelectorIndices:[I

    .line 329
    const/high16 v15, -0x80000000

    move-object/from16 v0, p0

    iput v15, v0, Lnet/simonvt/numberpicker/NumberPicker;->mInitialScrollOffset:I

    .line 430
    const/4 v15, 0x0

    move-object/from16 v0, p0

    iput v15, v0, Lnet/simonvt/numberpicker/NumberPicker;->mScrollState:I

    .line 481
    const/4 v15, -0x1

    move-object/from16 v0, p0

    iput v15, v0, Lnet/simonvt/numberpicker/NumberPicker;->mLastHandledDownDpadKeyCode:I

    .line 574
    sget-object v15, Lnet/simonvt/numberpicker/R$styleable;->NumberPicker:[I

    const/16 v16, 0x0

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    move/from16 v2, p3

    move/from16 v3, v16

    invoke-virtual {v0, v1, v15, v2, v3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v4

    .line 576
    .local v4, "attributesArray":Landroid/content/res/TypedArray;
    sget v15, Lnet/simonvt/numberpicker/R$styleable;->NumberPicker_internalLayout:I

    const/16 v16, 0x0

    move/from16 v0, v16

    invoke-virtual {v4, v15, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v11

    .line 579
    .local v11, "layoutResId":I
    if-eqz v11, :cond_0

    const/4 v15, 0x1

    :goto_0
    move-object/from16 v0, p0

    iput-boolean v15, v0, Lnet/simonvt/numberpicker/NumberPicker;->mHasSelectorWheel:Z

    .line 581
    sget v15, Lnet/simonvt/numberpicker/R$styleable;->NumberPicker_solidColor:I

    const/16 v16, 0x0

    move/from16 v0, v16

    invoke-virtual {v4, v15, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v15

    move-object/from16 v0, p0

    iput v15, v0, Lnet/simonvt/numberpicker/NumberPicker;->mSolidColor:I

    .line 583
    sget v15, Lnet/simonvt/numberpicker/R$styleable;->NumberPicker_selectionDivider:I

    invoke-virtual {v4, v15}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v15

    move-object/from16 v0, p0

    iput-object v15, v0, Lnet/simonvt/numberpicker/NumberPicker;->mSelectionDivider:Landroid/graphics/drawable/Drawable;

    .line 585
    const/4 v15, 0x1

    const/high16 v16, 0x40000000    # 2.0f

    .line 587
    invoke-virtual/range {p0 .. p0}, Lnet/simonvt/numberpicker/NumberPicker;->getResources()Landroid/content/res/Resources;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v17

    .line 585
    invoke-static/range {v15 .. v17}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v15

    float-to-int v9, v15

    .line 588
    .local v9, "defSelectionDividerHeight":I
    sget v15, Lnet/simonvt/numberpicker/R$styleable;->NumberPicker_selectionDividerHeight:I

    invoke-virtual {v4, v15, v9}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v15

    move-object/from16 v0, p0

    iput v15, v0, Lnet/simonvt/numberpicker/NumberPicker;->mSelectionDividerHeight:I

    .line 591
    const/4 v15, 0x1

    const/high16 v16, 0x42400000    # 48.0f

    .line 593
    invoke-virtual/range {p0 .. p0}, Lnet/simonvt/numberpicker/NumberPicker;->getResources()Landroid/content/res/Resources;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v17

    .line 591
    invoke-static/range {v15 .. v17}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v15

    float-to-int v8, v15

    .line 594
    .local v8, "defSelectionDividerDistance":I
    sget v15, Lnet/simonvt/numberpicker/R$styleable;->NumberPicker_selectionDividersDistance:I

    invoke-virtual {v4, v15, v8}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v15

    move-object/from16 v0, p0

    iput v15, v0, Lnet/simonvt/numberpicker/NumberPicker;->mSelectionDividersDistance:I

    .line 597
    sget v15, Lnet/simonvt/numberpicker/R$styleable;->NumberPicker_internalMinHeight:I

    const/16 v16, -0x1

    move/from16 v0, v16

    invoke-virtual {v4, v15, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v15

    move-object/from16 v0, p0

    iput v15, v0, Lnet/simonvt/numberpicker/NumberPicker;->mMinHeight:I

    .line 600
    sget v15, Lnet/simonvt/numberpicker/R$styleable;->NumberPicker_internalMaxHeight:I

    const/16 v16, -0x1

    move/from16 v0, v16

    invoke-virtual {v4, v15, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v15

    move-object/from16 v0, p0

    iput v15, v0, Lnet/simonvt/numberpicker/NumberPicker;->mMaxHeight:I

    .line 602
    move-object/from16 v0, p0

    iget v15, v0, Lnet/simonvt/numberpicker/NumberPicker;->mMinHeight:I

    const/16 v16, -0x1

    move/from16 v0, v16

    if-eq v15, v0, :cond_1

    move-object/from16 v0, p0

    iget v15, v0, Lnet/simonvt/numberpicker/NumberPicker;->mMaxHeight:I

    const/16 v16, -0x1

    move/from16 v0, v16

    if-eq v15, v0, :cond_1

    move-object/from16 v0, p0

    iget v15, v0, Lnet/simonvt/numberpicker/NumberPicker;->mMinHeight:I

    move-object/from16 v0, p0

    iget v0, v0, Lnet/simonvt/numberpicker/NumberPicker;->mMaxHeight:I

    move/from16 v16, v0

    move/from16 v0, v16

    if-le v15, v0, :cond_1

    .line 604
    new-instance v15, Ljava/lang/IllegalArgumentException;

    const-string v16, "minHeight > maxHeight"

    invoke-direct/range {v15 .. v16}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v15

    .line 579
    .end local v8    # "defSelectionDividerDistance":I
    .end local v9    # "defSelectionDividerHeight":I
    :cond_0
    const/4 v15, 0x0

    goto/16 :goto_0

    .line 607
    .restart local v8    # "defSelectionDividerDistance":I
    .restart local v9    # "defSelectionDividerHeight":I
    :cond_1
    sget v15, Lnet/simonvt/numberpicker/R$styleable;->NumberPicker_internalMinWidth:I

    const/16 v16, -0x1

    move/from16 v0, v16

    invoke-virtual {v4, v15, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v15

    move-object/from16 v0, p0

    iput v15, v0, Lnet/simonvt/numberpicker/NumberPicker;->mMinWidth:I

    .line 610
    sget v15, Lnet/simonvt/numberpicker/R$styleable;->NumberPicker_internalMaxWidth:I

    const/16 v16, -0x1

    move/from16 v0, v16

    invoke-virtual {v4, v15, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v15

    move-object/from16 v0, p0

    iput v15, v0, Lnet/simonvt/numberpicker/NumberPicker;->mMaxWidth:I

    .line 612
    move-object/from16 v0, p0

    iget v15, v0, Lnet/simonvt/numberpicker/NumberPicker;->mMinWidth:I

    const/16 v16, -0x1

    move/from16 v0, v16

    if-eq v15, v0, :cond_2

    move-object/from16 v0, p0

    iget v15, v0, Lnet/simonvt/numberpicker/NumberPicker;->mMaxWidth:I

    const/16 v16, -0x1

    move/from16 v0, v16

    if-eq v15, v0, :cond_2

    move-object/from16 v0, p0

    iget v15, v0, Lnet/simonvt/numberpicker/NumberPicker;->mMinWidth:I

    move-object/from16 v0, p0

    iget v0, v0, Lnet/simonvt/numberpicker/NumberPicker;->mMaxWidth:I

    move/from16 v16, v0

    move/from16 v0, v16

    if-le v15, v0, :cond_2

    .line 614
    new-instance v15, Ljava/lang/IllegalArgumentException;

    const-string v16, "minWidth > maxWidth"

    invoke-direct/range {v15 .. v16}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v15

    .line 617
    :cond_2
    move-object/from16 v0, p0

    iget v15, v0, Lnet/simonvt/numberpicker/NumberPicker;->mMaxWidth:I

    const/16 v16, -0x1

    move/from16 v0, v16

    if-ne v15, v0, :cond_4

    const/4 v15, 0x1

    :goto_1
    move-object/from16 v0, p0

    iput-boolean v15, v0, Lnet/simonvt/numberpicker/NumberPicker;->mComputeMaxWidth:Z

    .line 619
    sget v15, Lnet/simonvt/numberpicker/R$styleable;->NumberPicker_virtualButtonPressedDrawable:I

    invoke-virtual {v4, v15}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v15

    move-object/from16 v0, p0

    iput-object v15, v0, Lnet/simonvt/numberpicker/NumberPicker;->mVirtualButtonPressedDrawable:Landroid/graphics/drawable/Drawable;

    .line 622
    invoke-virtual {v4}, Landroid/content/res/TypedArray;->recycle()V

    .line 624
    new-instance v15, Lnet/simonvt/numberpicker/NumberPicker$PressedStateHelper;

    move-object/from16 v0, p0

    invoke-direct {v15, v0}, Lnet/simonvt/numberpicker/NumberPicker$PressedStateHelper;-><init>(Lnet/simonvt/numberpicker/NumberPicker;)V

    move-object/from16 v0, p0

    iput-object v15, v0, Lnet/simonvt/numberpicker/NumberPicker;->mPressedStateHelper:Lnet/simonvt/numberpicker/NumberPicker$PressedStateHelper;

    .line 631
    move-object/from16 v0, p0

    iget-boolean v15, v0, Lnet/simonvt/numberpicker/NumberPicker;->mHasSelectorWheel:Z

    if-nez v15, :cond_5

    const/4 v15, 0x1

    :goto_2
    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lnet/simonvt/numberpicker/NumberPicker;->setWillNotDraw(Z)V

    .line 633
    invoke-virtual/range {p0 .. p0}, Lnet/simonvt/numberpicker/NumberPicker;->getContext()Landroid/content/Context;

    move-result-object v15

    const-string v16, "layout_inflater"

    invoke-virtual/range {v15 .. v16}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroid/view/LayoutInflater;

    .line 635
    .local v10, "inflater":Landroid/view/LayoutInflater;
    const/4 v15, 0x1

    move-object/from16 v0, p0

    invoke-virtual {v10, v11, v0, v15}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 637
    new-instance v12, Lnet/simonvt/numberpicker/NumberPicker$1;

    move-object/from16 v0, p0

    invoke-direct {v12, v0}, Lnet/simonvt/numberpicker/NumberPicker$1;-><init>(Lnet/simonvt/numberpicker/NumberPicker;)V

    .line 649
    .local v12, "onClickListener":Landroid/view/View$OnClickListener;
    new-instance v13, Lnet/simonvt/numberpicker/NumberPicker$2;

    move-object/from16 v0, p0

    invoke-direct {v13, v0}, Lnet/simonvt/numberpicker/NumberPicker$2;-><init>(Lnet/simonvt/numberpicker/NumberPicker;)V

    .line 663
    .local v13, "onLongClickListener":Landroid/view/View$OnLongClickListener;
    move-object/from16 v0, p0

    iget-boolean v15, v0, Lnet/simonvt/numberpicker/NumberPicker;->mHasSelectorWheel:Z

    if-nez v15, :cond_6

    .line 664
    sget v15, Lnet/simonvt/numberpicker/R$id;->np__increment:I

    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lnet/simonvt/numberpicker/NumberPicker;->findViewById(I)Landroid/view/View;

    move-result-object v15

    check-cast v15, Landroid/widget/ImageButton;

    move-object/from16 v0, p0

    iput-object v15, v0, Lnet/simonvt/numberpicker/NumberPicker;->mIncrementButton:Landroid/widget/ImageButton;

    .line 665
    move-object/from16 v0, p0

    iget-object v15, v0, Lnet/simonvt/numberpicker/NumberPicker;->mIncrementButton:Landroid/widget/ImageButton;

    invoke-virtual {v15, v12}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 666
    move-object/from16 v0, p0

    iget-object v15, v0, Lnet/simonvt/numberpicker/NumberPicker;->mIncrementButton:Landroid/widget/ImageButton;

    invoke-virtual {v15, v13}, Landroid/widget/ImageButton;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 672
    :goto_3
    move-object/from16 v0, p0

    iget-boolean v15, v0, Lnet/simonvt/numberpicker/NumberPicker;->mHasSelectorWheel:Z

    if-nez v15, :cond_7

    .line 673
    sget v15, Lnet/simonvt/numberpicker/R$id;->np__decrement:I

    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lnet/simonvt/numberpicker/NumberPicker;->findViewById(I)Landroid/view/View;

    move-result-object v15

    check-cast v15, Landroid/widget/ImageButton;

    move-object/from16 v0, p0

    iput-object v15, v0, Lnet/simonvt/numberpicker/NumberPicker;->mDecrementButton:Landroid/widget/ImageButton;

    .line 674
    move-object/from16 v0, p0

    iget-object v15, v0, Lnet/simonvt/numberpicker/NumberPicker;->mDecrementButton:Landroid/widget/ImageButton;

    invoke-virtual {v15, v12}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 675
    move-object/from16 v0, p0

    iget-object v15, v0, Lnet/simonvt/numberpicker/NumberPicker;->mDecrementButton:Landroid/widget/ImageButton;

    invoke-virtual {v15, v13}, Landroid/widget/ImageButton;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 681
    :goto_4
    sget v15, Lnet/simonvt/numberpicker/R$id;->np__numberpicker_input:I

    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lnet/simonvt/numberpicker/NumberPicker;->findViewById(I)Landroid/view/View;

    move-result-object v15

    check-cast v15, Landroid/widget/EditText;

    move-object/from16 v0, p0

    iput-object v15, v0, Lnet/simonvt/numberpicker/NumberPicker;->mInputText:Landroid/widget/EditText;

    .line 682
    move-object/from16 v0, p0

    iget-object v15, v0, Lnet/simonvt/numberpicker/NumberPicker;->mInputText:Landroid/widget/EditText;

    new-instance v16, Lnet/simonvt/numberpicker/NumberPicker$3;

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lnet/simonvt/numberpicker/NumberPicker$3;-><init>(Lnet/simonvt/numberpicker/NumberPicker;)V

    invoke-virtual/range {v15 .. v16}, Landroid/widget/EditText;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 692
    move-object/from16 v0, p0

    iget-object v15, v0, Lnet/simonvt/numberpicker/NumberPicker;->mInputText:Landroid/widget/EditText;

    const/16 v16, 0x1

    move/from16 v0, v16

    new-array v0, v0, [Landroid/text/InputFilter;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    new-instance v18, Lnet/simonvt/numberpicker/NumberPicker$InputTextFilter;

    invoke-direct/range {v18 .. v19}, Lnet/simonvt/numberpicker/NumberPicker$InputTextFilter;-><init>(Lnet/simonvt/numberpicker/NumberPicker;)V

    aput-object v18, v16, v17

    invoke-virtual/range {v15 .. v16}, Landroid/widget/EditText;->setFilters([Landroid/text/InputFilter;)V

    .line 696
    move-object/from16 v0, p0

    iget-object v15, v0, Lnet/simonvt/numberpicker/NumberPicker;->mInputText:Landroid/widget/EditText;

    const/16 v16, 0x2

    invoke-virtual/range {v15 .. v16}, Landroid/widget/EditText;->setRawInputType(I)V

    .line 697
    move-object/from16 v0, p0

    iget-object v15, v0, Lnet/simonvt/numberpicker/NumberPicker;->mInputText:Landroid/widget/EditText;

    const/16 v16, 0x6

    invoke-virtual/range {v15 .. v16}, Landroid/widget/EditText;->setImeOptions(I)V

    .line 700
    invoke-static/range {p1 .. p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v7

    .line 701
    .local v7, "configuration":Landroid/view/ViewConfiguration;
    invoke-virtual {v7}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result v15

    move-object/from16 v0, p0

    iput v15, v0, Lnet/simonvt/numberpicker/NumberPicker;->mTouchSlop:I

    .line 702
    invoke-virtual {v7}, Landroid/view/ViewConfiguration;->getScaledMinimumFlingVelocity()I

    move-result v15

    move-object/from16 v0, p0

    iput v15, v0, Lnet/simonvt/numberpicker/NumberPicker;->mMinimumFlingVelocity:I

    .line 703
    invoke-virtual {v7}, Landroid/view/ViewConfiguration;->getScaledMaximumFlingVelocity()I

    move-result v15

    div-int/lit8 v15, v15, 0x8

    move-object/from16 v0, p0

    iput v15, v0, Lnet/simonvt/numberpicker/NumberPicker;->mMaximumFlingVelocity:I

    .line 705
    move-object/from16 v0, p0

    iget-object v15, v0, Lnet/simonvt/numberpicker/NumberPicker;->mInputText:Landroid/widget/EditText;

    invoke-virtual {v15}, Landroid/widget/EditText;->getTextSize()F

    move-result v15

    float-to-int v15, v15

    move-object/from16 v0, p0

    iput v15, v0, Lnet/simonvt/numberpicker/NumberPicker;->mTextSize:I

    .line 708
    new-instance v14, Landroid/graphics/Paint;

    invoke-direct {v14}, Landroid/graphics/Paint;-><init>()V

    .line 709
    .local v14, "paint":Landroid/graphics/Paint;
    const/4 v15, 0x1

    invoke-virtual {v14, v15}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 710
    sget-object v15, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    invoke-virtual {v14, v15}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 711
    move-object/from16 v0, p0

    iget v15, v0, Lnet/simonvt/numberpicker/NumberPicker;->mTextSize:I

    int-to-float v15, v15

    invoke-virtual {v14, v15}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 712
    move-object/from16 v0, p0

    iget-object v15, v0, Lnet/simonvt/numberpicker/NumberPicker;->mInputText:Landroid/widget/EditText;

    invoke-virtual {v15}, Landroid/widget/EditText;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v15

    invoke-virtual {v14, v15}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 713
    move-object/from16 v0, p0

    iget-object v15, v0, Lnet/simonvt/numberpicker/NumberPicker;->mInputText:Landroid/widget/EditText;

    invoke-virtual {v15}, Landroid/widget/EditText;->getTextColors()Landroid/content/res/ColorStateList;

    move-result-object v6

    .line 714
    .local v6, "colors":Landroid/content/res/ColorStateList;
    sget-object v15, Lnet/simonvt/numberpicker/NumberPicker;->ENABLED_STATE_SET:[I

    const/16 v16, -0x1

    move/from16 v0, v16

    invoke-virtual {v6, v15, v0}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v5

    .line 715
    .local v5, "color":I
    invoke-virtual {v14, v5}, Landroid/graphics/Paint;->setColor(I)V

    .line 716
    move-object/from16 v0, p0

    iput-object v14, v0, Lnet/simonvt/numberpicker/NumberPicker;->mSelectorWheelPaint:Landroid/graphics/Paint;

    .line 719
    new-instance v15, Lnet/simonvt/numberpicker/Scroller;

    invoke-virtual/range {p0 .. p0}, Lnet/simonvt/numberpicker/NumberPicker;->getContext()Landroid/content/Context;

    move-result-object v16

    const/16 v17, 0x0

    const/16 v18, 0x1

    invoke-direct/range {v15 .. v18}, Lnet/simonvt/numberpicker/Scroller;-><init>(Landroid/content/Context;Landroid/view/animation/Interpolator;Z)V

    move-object/from16 v0, p0

    iput-object v15, v0, Lnet/simonvt/numberpicker/NumberPicker;->mFlingScroller:Lnet/simonvt/numberpicker/Scroller;

    .line 720
    new-instance v15, Lnet/simonvt/numberpicker/Scroller;

    invoke-virtual/range {p0 .. p0}, Lnet/simonvt/numberpicker/NumberPicker;->getContext()Landroid/content/Context;

    move-result-object v16

    new-instance v17, Landroid/view/animation/DecelerateInterpolator;

    const/high16 v18, 0x40200000    # 2.5f

    invoke-direct/range {v17 .. v18}, Landroid/view/animation/DecelerateInterpolator;-><init>(F)V

    invoke-direct/range {v15 .. v17}, Lnet/simonvt/numberpicker/Scroller;-><init>(Landroid/content/Context;Landroid/view/animation/Interpolator;)V

    move-object/from16 v0, p0

    iput-object v15, v0, Lnet/simonvt/numberpicker/NumberPicker;->mAdjustScroller:Lnet/simonvt/numberpicker/Scroller;

    .line 722
    invoke-direct/range {p0 .. p0}, Lnet/simonvt/numberpicker/NumberPicker;->updateInputTextView()Z

    .line 724
    sget v15, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v16, 0x10

    move/from16 v0, v16

    if-lt v15, v0, :cond_3

    .line 726
    invoke-virtual/range {p0 .. p0}, Lnet/simonvt/numberpicker/NumberPicker;->getImportantForAccessibility()I

    move-result v15

    if-nez v15, :cond_3

    .line 727
    const/4 v15, 0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lnet/simonvt/numberpicker/NumberPicker;->setImportantForAccessibility(I)V

    .line 730
    :cond_3
    return-void

    .line 617
    .end local v5    # "color":I
    .end local v6    # "colors":Landroid/content/res/ColorStateList;
    .end local v7    # "configuration":Landroid/view/ViewConfiguration;
    .end local v10    # "inflater":Landroid/view/LayoutInflater;
    .end local v12    # "onClickListener":Landroid/view/View$OnClickListener;
    .end local v13    # "onLongClickListener":Landroid/view/View$OnLongClickListener;
    .end local v14    # "paint":Landroid/graphics/Paint;
    :cond_4
    const/4 v15, 0x0

    goto/16 :goto_1

    .line 631
    :cond_5
    const/4 v15, 0x0

    goto/16 :goto_2

    .line 668
    .restart local v10    # "inflater":Landroid/view/LayoutInflater;
    .restart local v12    # "onClickListener":Landroid/view/View$OnClickListener;
    .restart local v13    # "onLongClickListener":Landroid/view/View$OnLongClickListener;
    :cond_6
    const/4 v15, 0x0

    move-object/from16 v0, p0

    iput-object v15, v0, Lnet/simonvt/numberpicker/NumberPicker;->mIncrementButton:Landroid/widget/ImageButton;

    goto/16 :goto_3

    .line 677
    :cond_7
    const/4 v15, 0x0

    move-object/from16 v0, p0

    iput-object v15, v0, Lnet/simonvt/numberpicker/NumberPicker;->mDecrementButton:Landroid/widget/ImageButton;

    goto/16 :goto_4
.end method

.method static synthetic access$000(Lnet/simonvt/numberpicker/NumberPicker;)V
    .locals 0
    .param p0, "x0"    # Lnet/simonvt/numberpicker/NumberPicker;

    .prologue
    .line 95
    invoke-direct {p0}, Lnet/simonvt/numberpicker/NumberPicker;->hideSoftInput()V

    return-void
.end method

.method static synthetic access$100(Lnet/simonvt/numberpicker/NumberPicker;)Landroid/widget/EditText;
    .locals 1
    .param p0, "x0"    # Lnet/simonvt/numberpicker/NumberPicker;

    .prologue
    .line 95
    iget-object v0, p0, Lnet/simonvt/numberpicker/NumberPicker;->mInputText:Landroid/widget/EditText;

    return-object v0
.end method

.method static synthetic access$1000(Lnet/simonvt/numberpicker/NumberPicker;)[Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lnet/simonvt/numberpicker/NumberPicker;

    .prologue
    .line 95
    iget-object v0, p0, Lnet/simonvt/numberpicker/NumberPicker;->mDisplayedValues:[Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1100(Lnet/simonvt/numberpicker/NumberPicker;Ljava/lang/String;)I
    .locals 1
    .param p0, "x0"    # Lnet/simonvt/numberpicker/NumberPicker;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 95
    invoke-direct {p0, p1}, Lnet/simonvt/numberpicker/NumberPicker;->getSelectedPos(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method static synthetic access$1200(Lnet/simonvt/numberpicker/NumberPicker;)I
    .locals 1
    .param p0, "x0"    # Lnet/simonvt/numberpicker/NumberPicker;

    .prologue
    .line 95
    iget v0, p0, Lnet/simonvt/numberpicker/NumberPicker;->mMaxValue:I

    return v0
.end method

.method static synthetic access$1300(Lnet/simonvt/numberpicker/NumberPicker;II)V
    .locals 0
    .param p0, "x0"    # Lnet/simonvt/numberpicker/NumberPicker;
    .param p1, "x1"    # I
    .param p2, "x2"    # I

    .prologue
    .line 95
    invoke-direct {p0, p1, p2}, Lnet/simonvt/numberpicker/NumberPicker;->postSetSelectionCommand(II)V

    return-void
.end method

.method static synthetic access$1400(Lnet/simonvt/numberpicker/NumberPicker;)Z
    .locals 1
    .param p0, "x0"    # Lnet/simonvt/numberpicker/NumberPicker;

    .prologue
    .line 95
    iget-boolean v0, p0, Lnet/simonvt/numberpicker/NumberPicker;->mIncrementVirtualButtonPressed:Z

    return v0
.end method

.method static synthetic access$1402(Lnet/simonvt/numberpicker/NumberPicker;Z)Z
    .locals 0
    .param p0, "x0"    # Lnet/simonvt/numberpicker/NumberPicker;
    .param p1, "x1"    # Z

    .prologue
    .line 95
    iput-boolean p1, p0, Lnet/simonvt/numberpicker/NumberPicker;->mIncrementVirtualButtonPressed:Z

    return p1
.end method

.method static synthetic access$1500(Lnet/simonvt/numberpicker/NumberPicker;)I
    .locals 1
    .param p0, "x0"    # Lnet/simonvt/numberpicker/NumberPicker;

    .prologue
    .line 95
    iget v0, p0, Lnet/simonvt/numberpicker/NumberPicker;->mBottomSelectionDividerBottom:I

    return v0
.end method

.method static synthetic access$1600(Lnet/simonvt/numberpicker/NumberPicker;)Z
    .locals 1
    .param p0, "x0"    # Lnet/simonvt/numberpicker/NumberPicker;

    .prologue
    .line 95
    iget-boolean v0, p0, Lnet/simonvt/numberpicker/NumberPicker;->mDecrementVirtualButtonPressed:Z

    return v0
.end method

.method static synthetic access$1602(Lnet/simonvt/numberpicker/NumberPicker;Z)Z
    .locals 0
    .param p0, "x0"    # Lnet/simonvt/numberpicker/NumberPicker;
    .param p1, "x1"    # Z

    .prologue
    .line 95
    iput-boolean p1, p0, Lnet/simonvt/numberpicker/NumberPicker;->mDecrementVirtualButtonPressed:Z

    return p1
.end method

.method static synthetic access$1700(Lnet/simonvt/numberpicker/NumberPicker;)I
    .locals 1
    .param p0, "x0"    # Lnet/simonvt/numberpicker/NumberPicker;

    .prologue
    .line 95
    iget v0, p0, Lnet/simonvt/numberpicker/NumberPicker;->mTopSelectionDividerTop:I

    return v0
.end method

.method static synthetic access$1800(Lnet/simonvt/numberpicker/NumberPicker;)J
    .locals 2
    .param p0, "x0"    # Lnet/simonvt/numberpicker/NumberPicker;

    .prologue
    .line 95
    iget-wide v0, p0, Lnet/simonvt/numberpicker/NumberPicker;->mLongPressUpdateInterval:J

    return-wide v0
.end method

.method static synthetic access$1900(Lnet/simonvt/numberpicker/NumberPicker;)V
    .locals 0
    .param p0, "x0"    # Lnet/simonvt/numberpicker/NumberPicker;

    .prologue
    .line 95
    invoke-direct {p0}, Lnet/simonvt/numberpicker/NumberPicker;->showSoftInput()V

    return-void
.end method

.method static synthetic access$200(Lnet/simonvt/numberpicker/NumberPicker;Z)V
    .locals 0
    .param p0, "x0"    # Lnet/simonvt/numberpicker/NumberPicker;
    .param p1, "x1"    # Z

    .prologue
    .line 95
    invoke-direct {p0, p1}, Lnet/simonvt/numberpicker/NumberPicker;->changeValueByOne(Z)V

    return-void
.end method

.method static synthetic access$2002(Lnet/simonvt/numberpicker/NumberPicker;Z)Z
    .locals 0
    .param p0, "x0"    # Lnet/simonvt/numberpicker/NumberPicker;
    .param p1, "x1"    # Z

    .prologue
    .line 95
    iput-boolean p1, p0, Lnet/simonvt/numberpicker/NumberPicker;->mIngonreMoveEvents:Z

    return p1
.end method

.method static synthetic access$2100(Lnet/simonvt/numberpicker/NumberPicker;)I
    .locals 1
    .param p0, "x0"    # Lnet/simonvt/numberpicker/NumberPicker;

    .prologue
    .line 95
    iget v0, p0, Lnet/simonvt/numberpicker/NumberPicker;->mSelectionDividerHeight:I

    return v0
.end method

.method static synthetic access$2200(Lnet/simonvt/numberpicker/NumberPicker;)I
    .locals 1
    .param p0, "x0"    # Lnet/simonvt/numberpicker/NumberPicker;

    .prologue
    .line 95
    iget v0, p0, Lnet/simonvt/numberpicker/NumberPicker;->mValue:I

    return v0
.end method

.method static synthetic access$2300(Lnet/simonvt/numberpicker/NumberPicker;)Z
    .locals 1
    .param p0, "x0"    # Lnet/simonvt/numberpicker/NumberPicker;

    .prologue
    .line 95
    iget-boolean v0, p0, Lnet/simonvt/numberpicker/NumberPicker;->mWrapSelectorWheel:Z

    return v0
.end method

.method static synthetic access$2400(Lnet/simonvt/numberpicker/NumberPicker;I)I
    .locals 1
    .param p0, "x0"    # Lnet/simonvt/numberpicker/NumberPicker;
    .param p1, "x1"    # I

    .prologue
    .line 95
    invoke-direct {p0, p1}, Lnet/simonvt/numberpicker/NumberPicker;->getWrappedSelectorIndex(I)I

    move-result v0

    return v0
.end method

.method static synthetic access$2500(Lnet/simonvt/numberpicker/NumberPicker;)I
    .locals 1
    .param p0, "x0"    # Lnet/simonvt/numberpicker/NumberPicker;

    .prologue
    .line 95
    iget v0, p0, Lnet/simonvt/numberpicker/NumberPicker;->mMinValue:I

    return v0
.end method

.method static synthetic access$2600(Lnet/simonvt/numberpicker/NumberPicker;I)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lnet/simonvt/numberpicker/NumberPicker;
    .param p1, "x1"    # I

    .prologue
    .line 95
    invoke-direct {p0, p1}, Lnet/simonvt/numberpicker/NumberPicker;->formatNumber(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$300(Lnet/simonvt/numberpicker/NumberPicker;ZJ)V
    .locals 0
    .param p0, "x0"    # Lnet/simonvt/numberpicker/NumberPicker;
    .param p1, "x1"    # Z
    .param p2, "x2"    # J

    .prologue
    .line 95
    invoke-direct {p0, p1, p2, p3}, Lnet/simonvt/numberpicker/NumberPicker;->postChangeCurrentByOneFromLongPress(ZJ)V

    return-void
.end method

.method static synthetic access$400(Lnet/simonvt/numberpicker/NumberPicker;Landroid/view/View;)V
    .locals 0
    .param p0, "x0"    # Lnet/simonvt/numberpicker/NumberPicker;
    .param p1, "x1"    # Landroid/view/View;

    .prologue
    .line 95
    invoke-direct {p0, p1}, Lnet/simonvt/numberpicker/NumberPicker;->validateInputTextView(Landroid/view/View;)V

    return-void
.end method

.method static synthetic access$900()[C
    .locals 1

    .prologue
    .line 95
    sget-object v0, Lnet/simonvt/numberpicker/NumberPicker;->DIGIT_CHARACTERS:[C

    return-object v0
.end method

.method private changeValueByOne(Z)V
    .locals 6
    .param p1, "increment"    # Z

    .prologue
    const/16 v5, 0x12c

    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 1653
    iget-boolean v0, p0, Lnet/simonvt/numberpicker/NumberPicker;->mHasSelectorWheel:Z

    if-eqz v0, :cond_2

    .line 1654
    iget-object v0, p0, Lnet/simonvt/numberpicker/NumberPicker;->mInputText:Landroid/widget/EditText;

    const/4 v2, 0x4

    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setVisibility(I)V

    .line 1655
    iget-object v0, p0, Lnet/simonvt/numberpicker/NumberPicker;->mFlingScroller:Lnet/simonvt/numberpicker/Scroller;

    invoke-direct {p0, v0}, Lnet/simonvt/numberpicker/NumberPicker;->moveToFinalScrollerPosition(Lnet/simonvt/numberpicker/Scroller;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1656
    iget-object v0, p0, Lnet/simonvt/numberpicker/NumberPicker;->mAdjustScroller:Lnet/simonvt/numberpicker/Scroller;

    invoke-direct {p0, v0}, Lnet/simonvt/numberpicker/NumberPicker;->moveToFinalScrollerPosition(Lnet/simonvt/numberpicker/Scroller;)Z

    .line 1658
    :cond_0
    iput v1, p0, Lnet/simonvt/numberpicker/NumberPicker;->mPreviousScrollerY:I

    .line 1659
    if-eqz p1, :cond_1

    .line 1660
    iget-object v0, p0, Lnet/simonvt/numberpicker/NumberPicker;->mFlingScroller:Lnet/simonvt/numberpicker/Scroller;

    iget v2, p0, Lnet/simonvt/numberpicker/NumberPicker;->mSelectorElementHeight:I

    neg-int v4, v2

    move v2, v1

    move v3, v1

    invoke-virtual/range {v0 .. v5}, Lnet/simonvt/numberpicker/Scroller;->startScroll(IIIII)V

    .line 1664
    :goto_0
    invoke-virtual {p0}, Lnet/simonvt/numberpicker/NumberPicker;->invalidate()V

    .line 1672
    :goto_1
    return-void

    .line 1662
    :cond_1
    iget-object v0, p0, Lnet/simonvt/numberpicker/NumberPicker;->mFlingScroller:Lnet/simonvt/numberpicker/Scroller;

    iget v4, p0, Lnet/simonvt/numberpicker/NumberPicker;->mSelectorElementHeight:I

    move v2, v1

    move v3, v1

    invoke-virtual/range {v0 .. v5}, Lnet/simonvt/numberpicker/Scroller;->startScroll(IIIII)V

    goto :goto_0

    .line 1666
    :cond_2
    if-eqz p1, :cond_3

    .line 1667
    iget v0, p0, Lnet/simonvt/numberpicker/NumberPicker;->mValue:I

    add-int/lit8 v0, v0, 0x1

    invoke-direct {p0, v0, v2}, Lnet/simonvt/numberpicker/NumberPicker;->setValueInternal(IZ)V

    goto :goto_1

    .line 1669
    :cond_3
    iget v0, p0, Lnet/simonvt/numberpicker/NumberPicker;->mValue:I

    add-int/lit8 v0, v0, -0x1

    invoke-direct {p0, v0, v2}, Lnet/simonvt/numberpicker/NumberPicker;->setValueInternal(IZ)V

    goto :goto_1
.end method

.method private decrementSelectorIndices([I)V
    .locals 3
    .param p1, "selectorIndices"    # [I

    .prologue
    .line 1773
    array-length v2, p1

    add-int/lit8 v0, v2, -0x1

    .local v0, "i":I
    :goto_0
    if-lez v0, :cond_0

    .line 1774
    add-int/lit8 v2, v0, -0x1

    aget v2, p1, v2

    aput v2, p1, v0

    .line 1773
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 1776
    :cond_0
    const/4 v2, 0x1

    aget v2, p1, v2

    add-int/lit8 v1, v2, -0x1

    .line 1777
    .local v1, "nextScrollSelectorIndex":I
    iget-boolean v2, p0, Lnet/simonvt/numberpicker/NumberPicker;->mWrapSelectorWheel:Z

    if-eqz v2, :cond_1

    iget v2, p0, Lnet/simonvt/numberpicker/NumberPicker;->mMinValue:I

    if-ge v1, v2, :cond_1

    .line 1778
    iget v1, p0, Lnet/simonvt/numberpicker/NumberPicker;->mMaxValue:I

    .line 1780
    :cond_1
    const/4 v2, 0x0

    aput v1, p1, v2

    .line 1781
    invoke-direct {p0, v1}, Lnet/simonvt/numberpicker/NumberPicker;->ensureCachedScrollSelectorValue(I)V

    .line 1782
    return-void
.end method

.method private ensureCachedScrollSelectorValue(I)V
    .locals 4
    .param p1, "selectorIndex"    # I

    .prologue
    .line 1789
    iget-object v0, p0, Lnet/simonvt/numberpicker/NumberPicker;->mSelectorIndexToStringCache:Landroid/util/SparseArray;

    .line 1790
    .local v0, "cache":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 1791
    .local v2, "scrollSelectorValue":Ljava/lang/String;
    if-eqz v2, :cond_0

    .line 1805
    :goto_0
    return-void

    .line 1794
    :cond_0
    iget v3, p0, Lnet/simonvt/numberpicker/NumberPicker;->mMinValue:I

    if-lt p1, v3, :cond_1

    iget v3, p0, Lnet/simonvt/numberpicker/NumberPicker;->mMaxValue:I

    if-le p1, v3, :cond_2

    .line 1795
    :cond_1
    const-string v2, ""

    .line 1804
    :goto_1
    invoke-virtual {v0, p1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto :goto_0

    .line 1797
    :cond_2
    iget-object v3, p0, Lnet/simonvt/numberpicker/NumberPicker;->mDisplayedValues:[Ljava/lang/String;

    if-eqz v3, :cond_3

    .line 1798
    iget v3, p0, Lnet/simonvt/numberpicker/NumberPicker;->mMinValue:I

    sub-int v1, p1, v3

    .line 1799
    .local v1, "displayedValueIndex":I
    iget-object v3, p0, Lnet/simonvt/numberpicker/NumberPicker;->mDisplayedValues:[Ljava/lang/String;

    aget-object v2, v3, v1

    .line 1800
    goto :goto_1

    .line 1801
    .end local v1    # "displayedValueIndex":I
    :cond_3
    invoke-direct {p0, p1}, Lnet/simonvt/numberpicker/NumberPicker;->formatNumber(I)Ljava/lang/String;

    move-result-object v2

    goto :goto_1
.end method

.method private ensureScrollWheelAdjusted()Z
    .locals 6

    .prologue
    const/4 v1, 0x0

    .line 2053
    iget v0, p0, Lnet/simonvt/numberpicker/NumberPicker;->mInitialScrollOffset:I

    iget v2, p0, Lnet/simonvt/numberpicker/NumberPicker;->mCurrentScrollOffset:I

    sub-int v4, v0, v2

    .line 2054
    .local v4, "deltaY":I
    if-eqz v4, :cond_1

    .line 2055
    iput v1, p0, Lnet/simonvt/numberpicker/NumberPicker;->mPreviousScrollerY:I

    .line 2056
    invoke-static {v4}, Ljava/lang/Math;->abs(I)I

    move-result v0

    iget v2, p0, Lnet/simonvt/numberpicker/NumberPicker;->mSelectorElementHeight:I

    div-int/lit8 v2, v2, 0x2

    if-le v0, v2, :cond_0

    .line 2057
    if-lez v4, :cond_2

    iget v0, p0, Lnet/simonvt/numberpicker/NumberPicker;->mSelectorElementHeight:I

    neg-int v0, v0

    :goto_0
    add-int/2addr v4, v0

    .line 2059
    :cond_0
    iget-object v0, p0, Lnet/simonvt/numberpicker/NumberPicker;->mAdjustScroller:Lnet/simonvt/numberpicker/Scroller;

    const/16 v5, 0x320

    move v2, v1

    move v3, v1

    invoke-virtual/range {v0 .. v5}, Lnet/simonvt/numberpicker/Scroller;->startScroll(IIIII)V

    .line 2060
    invoke-virtual {p0}, Lnet/simonvt/numberpicker/NumberPicker;->invalidate()V

    .line 2061
    const/4 v1, 0x1

    .line 2063
    :cond_1
    return v1

    .line 2057
    :cond_2
    iget v0, p0, Lnet/simonvt/numberpicker/NumberPicker;->mSelectorElementHeight:I

    goto :goto_0
.end method

.method private fling(I)V
    .locals 9
    .param p1, "velocityY"    # I

    .prologue
    const v8, 0x7fffffff

    const/4 v1, 0x0

    .line 1729
    iput v1, p0, Lnet/simonvt/numberpicker/NumberPicker;->mPreviousScrollerY:I

    .line 1731
    if-lez p1, :cond_0

    .line 1732
    iget-object v0, p0, Lnet/simonvt/numberpicker/NumberPicker;->mFlingScroller:Lnet/simonvt/numberpicker/Scroller;

    move v2, v1

    move v3, v1

    move v4, p1

    move v5, v1

    move v6, v1

    move v7, v1

    invoke-virtual/range {v0 .. v8}, Lnet/simonvt/numberpicker/Scroller;->fling(IIIIIIII)V

    .line 1737
    :goto_0
    invoke-virtual {p0}, Lnet/simonvt/numberpicker/NumberPicker;->invalidate()V

    .line 1738
    return-void

    .line 1734
    :cond_0
    iget-object v0, p0, Lnet/simonvt/numberpicker/NumberPicker;->mFlingScroller:Lnet/simonvt/numberpicker/Scroller;

    move v2, v8

    move v3, v1

    move v4, p1

    move v5, v1

    move v6, v1

    move v7, v1

    invoke-virtual/range {v0 .. v8}, Lnet/simonvt/numberpicker/Scroller;->fling(IIIIIIII)V

    goto :goto_0
.end method

.method private formatNumber(I)Ljava/lang/String;
    .locals 1
    .param p1, "value"    # I

    .prologue
    .line 1808
    iget-object v0, p0, Lnet/simonvt/numberpicker/NumberPicker;->mFormatter:Lnet/simonvt/numberpicker/NumberPicker$Formatter;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lnet/simonvt/numberpicker/NumberPicker;->mFormatter:Lnet/simonvt/numberpicker/NumberPicker$Formatter;

    invoke-interface {v0, p1}, Lnet/simonvt/numberpicker/NumberPicker$Formatter;->format(I)Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    invoke-static {p1}, Lnet/simonvt/numberpicker/NumberPicker;->formatNumberWithLocale(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private static formatNumberWithLocale(I)Ljava/lang/String;
    .locals 5
    .param p0, "value"    # I

    .prologue
    .line 2659
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    const-string v1, "%d"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getSelectedPos(Ljava/lang/String;)I
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 1923
    iget-object v1, p0, Lnet/simonvt/numberpicker/NumberPicker;->mDisplayedValues:[Ljava/lang/String;

    if-nez v1, :cond_0

    .line 1925
    :try_start_0
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 1949
    :goto_0
    return v1

    .line 1930
    :cond_0
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget-object v1, p0, Lnet/simonvt/numberpicker/NumberPicker;->mDisplayedValues:[Ljava/lang/String;

    array-length v1, v1

    if-ge v0, v1, :cond_2

    .line 1932
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p1

    .line 1933
    iget-object v1, p0, Lnet/simonvt/numberpicker/NumberPicker;->mDisplayedValues:[Ljava/lang/String;

    aget-object v1, v1, v0

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1934
    iget v1, p0, Lnet/simonvt/numberpicker/NumberPicker;->mMinValue:I

    add-int/2addr v1, v0

    goto :goto_0

    .line 1930
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 1943
    :cond_2
    :try_start_1
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_1

    move-result v1

    goto :goto_0

    .line 1926
    .end local v0    # "i":I
    :catch_0
    move-exception v1

    .line 1949
    :goto_2
    iget v1, p0, Lnet/simonvt/numberpicker/NumberPicker;->mMinValue:I

    goto :goto_0

    .line 1944
    .restart local v0    # "i":I
    :catch_1
    move-exception v1

    goto :goto_2
.end method

.method private getSupportAccessibilityNodeProvider()Lnet/simonvt/numberpicker/NumberPicker$SupportAccessibilityNodeProvider;
    .locals 2

    .prologue
    .line 2204
    new-instance v0, Lnet/simonvt/numberpicker/NumberPicker$SupportAccessibilityNodeProvider;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lnet/simonvt/numberpicker/NumberPicker$SupportAccessibilityNodeProvider;-><init>(Lnet/simonvt/numberpicker/NumberPicker;Lnet/simonvt/numberpicker/NumberPicker$1;)V

    return-object v0
.end method

.method public static final getTwoDigitFormatter()Lnet/simonvt/numberpicker/NumberPicker$Formatter;
    .locals 1

    .prologue
    .line 203
    sget-object v0, Lnet/simonvt/numberpicker/NumberPicker;->sTwoDigitFormatter:Lnet/simonvt/numberpicker/NumberPicker$TwoDigitFormatter;

    return-object v0
.end method

.method private getWrappedSelectorIndex(I)I
    .locals 4
    .param p1, "selectorIndex"    # I

    .prologue
    .line 1744
    iget v0, p0, Lnet/simonvt/numberpicker/NumberPicker;->mMaxValue:I

    if-le p1, v0, :cond_1

    .line 1745
    iget v0, p0, Lnet/simonvt/numberpicker/NumberPicker;->mMinValue:I

    iget v1, p0, Lnet/simonvt/numberpicker/NumberPicker;->mMaxValue:I

    sub-int v1, p1, v1

    iget v2, p0, Lnet/simonvt/numberpicker/NumberPicker;->mMaxValue:I

    iget v3, p0, Lnet/simonvt/numberpicker/NumberPicker;->mMinValue:I

    sub-int/2addr v2, v3

    rem-int/2addr v1, v2

    add-int/2addr v0, v1

    add-int/lit8 p1, v0, -0x1

    .line 1749
    .end local p1    # "selectorIndex":I
    :cond_0
    :goto_0
    return p1

    .line 1746
    .restart local p1    # "selectorIndex":I
    :cond_1
    iget v0, p0, Lnet/simonvt/numberpicker/NumberPicker;->mMinValue:I

    if-ge p1, v0, :cond_0

    .line 1747
    iget v0, p0, Lnet/simonvt/numberpicker/NumberPicker;->mMaxValue:I

    iget v1, p0, Lnet/simonvt/numberpicker/NumberPicker;->mMinValue:I

    sub-int/2addr v1, p1

    iget v2, p0, Lnet/simonvt/numberpicker/NumberPicker;->mMaxValue:I

    iget v3, p0, Lnet/simonvt/numberpicker/NumberPicker;->mMinValue:I

    sub-int/2addr v2, v3

    rem-int/2addr v1, v2

    sub-int/2addr v0, v1

    add-int/lit8 p1, v0, 0x1

    goto :goto_0
.end method

.method private hideSoftInput()V
    .locals 3

    .prologue
    .line 1204
    invoke-virtual {p0}, Lnet/simonvt/numberpicker/NumberPicker;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "input_method"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 1205
    .local v0, "inputMethodManager":Landroid/view/inputmethod/InputMethodManager;
    if-eqz v0, :cond_0

    iget-object v1, p0, Lnet/simonvt/numberpicker/NumberPicker;->mInputText:Landroid/widget/EditText;

    invoke-virtual {v0, v1}, Landroid/view/inputmethod/InputMethodManager;->isActive(Landroid/view/View;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1206
    invoke-virtual {p0}, Lnet/simonvt/numberpicker/NumberPicker;->getWindowToken()Landroid/os/IBinder;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 1207
    iget-boolean v1, p0, Lnet/simonvt/numberpicker/NumberPicker;->mHasSelectorWheel:Z

    if-eqz v1, :cond_0

    .line 1208
    iget-object v1, p0, Lnet/simonvt/numberpicker/NumberPicker;->mInputText:Landroid/widget/EditText;

    const/4 v2, 0x4

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setVisibility(I)V

    .line 1211
    :cond_0
    return-void
.end method

.method private incrementSelectorIndices([I)V
    .locals 3
    .param p1, "selectorIndices"    # [I

    .prologue
    .line 1757
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v2, p1

    add-int/lit8 v2, v2, -0x1

    if-ge v0, v2, :cond_0

    .line 1758
    add-int/lit8 v2, v0, 0x1

    aget v2, p1, v2

    aput v2, p1, v0

    .line 1757
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1760
    :cond_0
    array-length v2, p1

    add-int/lit8 v2, v2, -0x2

    aget v2, p1, v2

    add-int/lit8 v1, v2, 0x1

    .line 1761
    .local v1, "nextScrollSelectorIndex":I
    iget-boolean v2, p0, Lnet/simonvt/numberpicker/NumberPicker;->mWrapSelectorWheel:Z

    if-eqz v2, :cond_1

    iget v2, p0, Lnet/simonvt/numberpicker/NumberPicker;->mMaxValue:I

    if-le v1, v2, :cond_1

    .line 1762
    iget v1, p0, Lnet/simonvt/numberpicker/NumberPicker;->mMinValue:I

    .line 1764
    :cond_1
    array-length v2, p1

    add-int/lit8 v2, v2, -0x1

    aput v1, p1, v2

    .line 1765
    invoke-direct {p0, v1}, Lnet/simonvt/numberpicker/NumberPicker;->ensureCachedScrollSelectorValue(I)V

    .line 1766
    return-void
.end method

.method private initializeFadingEdges()V
    .locals 2

    .prologue
    .line 1692
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lnet/simonvt/numberpicker/NumberPicker;->setVerticalFadingEdgeEnabled(Z)V

    .line 1693
    invoke-virtual {p0}, Lnet/simonvt/numberpicker/NumberPicker;->getBottom()I

    move-result v0

    invoke-virtual {p0}, Lnet/simonvt/numberpicker/NumberPicker;->getTop()I

    move-result v1

    sub-int/2addr v0, v1

    iget v1, p0, Lnet/simonvt/numberpicker/NumberPicker;->mTextSize:I

    sub-int/2addr v0, v1

    div-int/lit8 v0, v0, 0x2

    invoke-virtual {p0, v0}, Lnet/simonvt/numberpicker/NumberPicker;->setFadingEdgeLength(I)V

    .line 1694
    return-void
.end method

.method private initializeSelectorWheel()V
    .locals 7

    .prologue
    .line 1675
    invoke-direct {p0}, Lnet/simonvt/numberpicker/NumberPicker;->initializeSelectorWheelIndices()V

    .line 1676
    iget-object v1, p0, Lnet/simonvt/numberpicker/NumberPicker;->mSelectorIndices:[I

    .line 1677
    .local v1, "selectorIndices":[I
    array-length v5, v1

    iget v6, p0, Lnet/simonvt/numberpicker/NumberPicker;->mTextSize:I

    mul-int v4, v5, v6

    .line 1678
    .local v4, "totalTextHeight":I
    invoke-virtual {p0}, Lnet/simonvt/numberpicker/NumberPicker;->getBottom()I

    move-result v5

    invoke-virtual {p0}, Lnet/simonvt/numberpicker/NumberPicker;->getTop()I

    move-result v6

    sub-int/2addr v5, v6

    sub-int/2addr v5, v4

    int-to-float v3, v5

    .line 1679
    .local v3, "totalTextGapHeight":F
    array-length v5, v1

    int-to-float v2, v5

    .line 1680
    .local v2, "textGapCount":F
    div-float v5, v3, v2

    const/high16 v6, 0x3f000000    # 0.5f

    add-float/2addr v5, v6

    float-to-int v5, v5

    iput v5, p0, Lnet/simonvt/numberpicker/NumberPicker;->mSelectorTextGapHeight:I

    .line 1681
    iget v5, p0, Lnet/simonvt/numberpicker/NumberPicker;->mTextSize:I

    iget v6, p0, Lnet/simonvt/numberpicker/NumberPicker;->mSelectorTextGapHeight:I

    add-int/2addr v5, v6

    iput v5, p0, Lnet/simonvt/numberpicker/NumberPicker;->mSelectorElementHeight:I

    .line 1684
    iget-object v5, p0, Lnet/simonvt/numberpicker/NumberPicker;->mInputText:Landroid/widget/EditText;

    invoke-virtual {v5}, Landroid/widget/EditText;->getBaseline()I

    move-result v5

    iget-object v6, p0, Lnet/simonvt/numberpicker/NumberPicker;->mInputText:Landroid/widget/EditText;

    invoke-virtual {v6}, Landroid/widget/EditText;->getTop()I

    move-result v6

    add-int v0, v5, v6

    .line 1685
    .local v0, "editTextTextPosition":I
    iget v5, p0, Lnet/simonvt/numberpicker/NumberPicker;->mSelectorElementHeight:I

    mul-int/lit8 v5, v5, 0x1

    sub-int v5, v0, v5

    iput v5, p0, Lnet/simonvt/numberpicker/NumberPicker;->mInitialScrollOffset:I

    .line 1687
    iget v5, p0, Lnet/simonvt/numberpicker/NumberPicker;->mInitialScrollOffset:I

    iput v5, p0, Lnet/simonvt/numberpicker/NumberPicker;->mCurrentScrollOffset:I

    .line 1688
    invoke-direct {p0}, Lnet/simonvt/numberpicker/NumberPicker;->updateInputTextView()Z

    .line 1689
    return-void
.end method

.method private initializeSelectorWheelIndices()V
    .locals 5

    .prologue
    .line 1605
    iget-object v4, p0, Lnet/simonvt/numberpicker/NumberPicker;->mSelectorIndexToStringCache:Landroid/util/SparseArray;

    invoke-virtual {v4}, Landroid/util/SparseArray;->clear()V

    .line 1606
    iget-object v3, p0, Lnet/simonvt/numberpicker/NumberPicker;->mSelectorIndices:[I

    .line 1607
    .local v3, "selectorIndices":[I
    invoke-virtual {p0}, Lnet/simonvt/numberpicker/NumberPicker;->getValue()I

    move-result v0

    .line 1608
    .local v0, "current":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v4, p0, Lnet/simonvt/numberpicker/NumberPicker;->mSelectorIndices:[I

    array-length v4, v4

    if-ge v1, v4, :cond_1

    .line 1609
    add-int/lit8 v4, v1, -0x1

    add-int v2, v0, v4

    .line 1610
    .local v2, "selectorIndex":I
    iget-boolean v4, p0, Lnet/simonvt/numberpicker/NumberPicker;->mWrapSelectorWheel:Z

    if-eqz v4, :cond_0

    .line 1611
    invoke-direct {p0, v2}, Lnet/simonvt/numberpicker/NumberPicker;->getWrappedSelectorIndex(I)I

    move-result v2

    .line 1613
    :cond_0
    aput v2, v3, v1

    .line 1614
    aget v4, v3, v1

    invoke-direct {p0, v4}, Lnet/simonvt/numberpicker/NumberPicker;->ensureCachedScrollSelectorValue(I)V

    .line 1608
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1616
    .end local v2    # "selectorIndex":I
    :cond_1
    return-void
.end method

.method private makeMeasureSpec(II)I
    .locals 5
    .param p1, "measureSpec"    # I
    .param p2, "maxSize"    # I

    .prologue
    const/high16 v3, 0x40000000    # 2.0f

    .line 1528
    const/4 v2, -0x1

    if-ne p2, v2, :cond_0

    .line 1539
    .end local p1    # "measureSpec":I
    :goto_0
    :sswitch_0
    return p1

    .line 1531
    .restart local p1    # "measureSpec":I
    :cond_0
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v1

    .line 1532
    .local v1, "size":I
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v0

    .line 1533
    .local v0, "mode":I
    sparse-switch v0, :sswitch_data_0

    .line 1541
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unknown measure mode: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1537
    :sswitch_1
    invoke-static {v1, p2}, Ljava/lang/Math;->min(II)I

    move-result v2

    invoke-static {v2, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p1

    goto :goto_0

    .line 1539
    :sswitch_2
    invoke-static {p2, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p1

    goto :goto_0

    .line 1533
    :sswitch_data_0
    .sparse-switch
        -0x80000000 -> :sswitch_1
        0x0 -> :sswitch_2
        0x40000000 -> :sswitch_0
    .end sparse-switch
.end method

.method private moveToFinalScrollerPosition(Lnet/simonvt/numberpicker/Scroller;)Z
    .locals 7
    .param p1, "scroller"    # Lnet/simonvt/numberpicker/Scroller;

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 788
    invoke-virtual {p1, v3}, Lnet/simonvt/numberpicker/Scroller;->forceFinished(Z)V

    .line 789
    invoke-virtual {p1}, Lnet/simonvt/numberpicker/Scroller;->getFinalY()I

    move-result v5

    invoke-virtual {p1}, Lnet/simonvt/numberpicker/Scroller;->getCurrY()I

    move-result v6

    sub-int v0, v5, v6

    .line 790
    .local v0, "amountToScroll":I
    iget v5, p0, Lnet/simonvt/numberpicker/NumberPicker;->mCurrentScrollOffset:I

    add-int/2addr v5, v0

    iget v6, p0, Lnet/simonvt/numberpicker/NumberPicker;->mSelectorElementHeight:I

    rem-int v1, v5, v6

    .line 791
    .local v1, "futureScrollOffset":I
    iget v5, p0, Lnet/simonvt/numberpicker/NumberPicker;->mInitialScrollOffset:I

    sub-int v2, v5, v1

    .line 792
    .local v2, "overshootAdjustment":I
    if-eqz v2, :cond_2

    .line 793
    invoke-static {v2}, Ljava/lang/Math;->abs(I)I

    move-result v5

    iget v6, p0, Lnet/simonvt/numberpicker/NumberPicker;->mSelectorElementHeight:I

    div-int/lit8 v6, v6, 0x2

    if-le v5, v6, :cond_0

    .line 794
    if-lez v2, :cond_1

    .line 795
    iget v5, p0, Lnet/simonvt/numberpicker/NumberPicker;->mSelectorElementHeight:I

    sub-int/2addr v2, v5

    .line 800
    :cond_0
    :goto_0
    add-int/2addr v0, v2

    .line 801
    invoke-virtual {p0, v4, v0}, Lnet/simonvt/numberpicker/NumberPicker;->scrollBy(II)V

    .line 804
    :goto_1
    return v3

    .line 797
    :cond_1
    iget v5, p0, Lnet/simonvt/numberpicker/NumberPicker;->mSelectorElementHeight:I

    add-int/2addr v2, v5

    goto :goto_0

    :cond_2
    move v3, v4

    .line 804
    goto :goto_1
.end method

.method private notifyChange(II)V
    .locals 2
    .param p1, "previous"    # I
    .param p2, "current"    # I

    .prologue
    .line 1852
    iget-object v0, p0, Lnet/simonvt/numberpicker/NumberPicker;->mOnValueChangeListener:Lnet/simonvt/numberpicker/NumberPicker$OnValueChangeListener;

    if-eqz v0, :cond_0

    .line 1853
    iget-object v0, p0, Lnet/simonvt/numberpicker/NumberPicker;->mOnValueChangeListener:Lnet/simonvt/numberpicker/NumberPicker$OnValueChangeListener;

    iget v1, p0, Lnet/simonvt/numberpicker/NumberPicker;->mValue:I

    invoke-interface {v0, p0, p1, v1}, Lnet/simonvt/numberpicker/NumberPicker$OnValueChangeListener;->onValueChange(Lnet/simonvt/numberpicker/NumberPicker;II)V

    .line 1855
    :cond_0
    return-void
.end method

.method private onScrollStateChange(I)V
    .locals 1
    .param p1, "scrollState"    # I

    .prologue
    .line 1716
    iget v0, p0, Lnet/simonvt/numberpicker/NumberPicker;->mScrollState:I

    if-ne v0, p1, :cond_1

    .line 1723
    :cond_0
    :goto_0
    return-void

    .line 1719
    :cond_1
    iput p1, p0, Lnet/simonvt/numberpicker/NumberPicker;->mScrollState:I

    .line 1720
    iget-object v0, p0, Lnet/simonvt/numberpicker/NumberPicker;->mOnScrollListener:Lnet/simonvt/numberpicker/NumberPicker$OnScrollListener;

    if-eqz v0, :cond_0

    .line 1721
    iget-object v0, p0, Lnet/simonvt/numberpicker/NumberPicker;->mOnScrollListener:Lnet/simonvt/numberpicker/NumberPicker$OnScrollListener;

    invoke-interface {v0, p0, p1}, Lnet/simonvt/numberpicker/NumberPicker$OnScrollListener;->onScrollStateChange(Lnet/simonvt/numberpicker/NumberPicker;I)V

    goto :goto_0
.end method

.method private onScrollerFinished(Lnet/simonvt/numberpicker/Scroller;)V
    .locals 2
    .param p1, "scroller"    # Lnet/simonvt/numberpicker/Scroller;

    .prologue
    .line 1700
    iget-object v0, p0, Lnet/simonvt/numberpicker/NumberPicker;->mFlingScroller:Lnet/simonvt/numberpicker/Scroller;

    if-ne p1, v0, :cond_2

    .line 1701
    invoke-direct {p0}, Lnet/simonvt/numberpicker/NumberPicker;->ensureScrollWheelAdjusted()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1702
    invoke-direct {p0}, Lnet/simonvt/numberpicker/NumberPicker;->updateInputTextView()Z

    .line 1704
    :cond_0
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lnet/simonvt/numberpicker/NumberPicker;->onScrollStateChange(I)V

    .line 1710
    :cond_1
    :goto_0
    return-void

    .line 1706
    :cond_2
    iget v0, p0, Lnet/simonvt/numberpicker/NumberPicker;->mScrollState:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    .line 1707
    invoke-direct {p0}, Lnet/simonvt/numberpicker/NumberPicker;->updateInputTextView()Z

    goto :goto_0
.end method

.method private postBeginSoftInputOnLongPressCommand()V
    .locals 4

    .prologue
    .line 1886
    iget-object v0, p0, Lnet/simonvt/numberpicker/NumberPicker;->mBeginSoftInputOnLongPressCommand:Lnet/simonvt/numberpicker/NumberPicker$BeginSoftInputOnLongPressCommand;

    if-nez v0, :cond_0

    .line 1887
    new-instance v0, Lnet/simonvt/numberpicker/NumberPicker$BeginSoftInputOnLongPressCommand;

    invoke-direct {v0, p0}, Lnet/simonvt/numberpicker/NumberPicker$BeginSoftInputOnLongPressCommand;-><init>(Lnet/simonvt/numberpicker/NumberPicker;)V

    iput-object v0, p0, Lnet/simonvt/numberpicker/NumberPicker;->mBeginSoftInputOnLongPressCommand:Lnet/simonvt/numberpicker/NumberPicker$BeginSoftInputOnLongPressCommand;

    .line 1891
    :goto_0
    iget-object v0, p0, Lnet/simonvt/numberpicker/NumberPicker;->mBeginSoftInputOnLongPressCommand:Lnet/simonvt/numberpicker/NumberPicker$BeginSoftInputOnLongPressCommand;

    invoke-static {}, Landroid/view/ViewConfiguration;->getLongPressTimeout()I

    move-result v1

    int-to-long v2, v1

    invoke-virtual {p0, v0, v2, v3}, Lnet/simonvt/numberpicker/NumberPicker;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 1892
    return-void

    .line 1889
    :cond_0
    iget-object v0, p0, Lnet/simonvt/numberpicker/NumberPicker;->mBeginSoftInputOnLongPressCommand:Lnet/simonvt/numberpicker/NumberPicker$BeginSoftInputOnLongPressCommand;

    invoke-virtual {p0, v0}, Lnet/simonvt/numberpicker/NumberPicker;->removeCallbacks(Ljava/lang/Runnable;)Z

    goto :goto_0
.end method

.method private postChangeCurrentByOneFromLongPress(ZJ)V
    .locals 2
    .param p1, "increment"    # Z
    .param p2, "delayMillis"    # J

    .prologue
    .line 1863
    iget-object v0, p0, Lnet/simonvt/numberpicker/NumberPicker;->mChangeCurrentByOneFromLongPressCommand:Lnet/simonvt/numberpicker/NumberPicker$ChangeCurrentByOneFromLongPressCommand;

    if-nez v0, :cond_0

    .line 1864
    new-instance v0, Lnet/simonvt/numberpicker/NumberPicker$ChangeCurrentByOneFromLongPressCommand;

    invoke-direct {v0, p0}, Lnet/simonvt/numberpicker/NumberPicker$ChangeCurrentByOneFromLongPressCommand;-><init>(Lnet/simonvt/numberpicker/NumberPicker;)V

    iput-object v0, p0, Lnet/simonvt/numberpicker/NumberPicker;->mChangeCurrentByOneFromLongPressCommand:Lnet/simonvt/numberpicker/NumberPicker$ChangeCurrentByOneFromLongPressCommand;

    .line 1868
    :goto_0
    iget-object v0, p0, Lnet/simonvt/numberpicker/NumberPicker;->mChangeCurrentByOneFromLongPressCommand:Lnet/simonvt/numberpicker/NumberPicker$ChangeCurrentByOneFromLongPressCommand;

    invoke-static {v0, p1}, Lnet/simonvt/numberpicker/NumberPicker$ChangeCurrentByOneFromLongPressCommand;->access$600(Lnet/simonvt/numberpicker/NumberPicker$ChangeCurrentByOneFromLongPressCommand;Z)V

    .line 1869
    iget-object v0, p0, Lnet/simonvt/numberpicker/NumberPicker;->mChangeCurrentByOneFromLongPressCommand:Lnet/simonvt/numberpicker/NumberPicker$ChangeCurrentByOneFromLongPressCommand;

    invoke-virtual {p0, v0, p2, p3}, Lnet/simonvt/numberpicker/NumberPicker;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 1870
    return-void

    .line 1866
    :cond_0
    iget-object v0, p0, Lnet/simonvt/numberpicker/NumberPicker;->mChangeCurrentByOneFromLongPressCommand:Lnet/simonvt/numberpicker/NumberPicker$ChangeCurrentByOneFromLongPressCommand;

    invoke-virtual {p0, v0}, Lnet/simonvt/numberpicker/NumberPicker;->removeCallbacks(Ljava/lang/Runnable;)Z

    goto :goto_0
.end method

.method private postSetSelectionCommand(II)V
    .locals 1
    .param p1, "selectionStart"    # I
    .param p2, "selectionEnd"    # I

    .prologue
    .line 1957
    iget-object v0, p0, Lnet/simonvt/numberpicker/NumberPicker;->mSetSelectionCommand:Lnet/simonvt/numberpicker/NumberPicker$SetSelectionCommand;

    if-nez v0, :cond_0

    .line 1958
    new-instance v0, Lnet/simonvt/numberpicker/NumberPicker$SetSelectionCommand;

    invoke-direct {v0, p0}, Lnet/simonvt/numberpicker/NumberPicker$SetSelectionCommand;-><init>(Lnet/simonvt/numberpicker/NumberPicker;)V

    iput-object v0, p0, Lnet/simonvt/numberpicker/NumberPicker;->mSetSelectionCommand:Lnet/simonvt/numberpicker/NumberPicker$SetSelectionCommand;

    .line 1962
    :goto_0
    iget-object v0, p0, Lnet/simonvt/numberpicker/NumberPicker;->mSetSelectionCommand:Lnet/simonvt/numberpicker/NumberPicker$SetSelectionCommand;

    invoke-static {v0, p1}, Lnet/simonvt/numberpicker/NumberPicker$SetSelectionCommand;->access$702(Lnet/simonvt/numberpicker/NumberPicker$SetSelectionCommand;I)I

    .line 1963
    iget-object v0, p0, Lnet/simonvt/numberpicker/NumberPicker;->mSetSelectionCommand:Lnet/simonvt/numberpicker/NumberPicker$SetSelectionCommand;

    invoke-static {v0, p2}, Lnet/simonvt/numberpicker/NumberPicker$SetSelectionCommand;->access$802(Lnet/simonvt/numberpicker/NumberPicker$SetSelectionCommand;I)I

    .line 1964
    iget-object v0, p0, Lnet/simonvt/numberpicker/NumberPicker;->mSetSelectionCommand:Lnet/simonvt/numberpicker/NumberPicker$SetSelectionCommand;

    invoke-virtual {p0, v0}, Lnet/simonvt/numberpicker/NumberPicker;->post(Ljava/lang/Runnable;)Z

    .line 1965
    return-void

    .line 1960
    :cond_0
    iget-object v0, p0, Lnet/simonvt/numberpicker/NumberPicker;->mSetSelectionCommand:Lnet/simonvt/numberpicker/NumberPicker$SetSelectionCommand;

    invoke-virtual {p0, v0}, Lnet/simonvt/numberpicker/NumberPicker;->removeCallbacks(Ljava/lang/Runnable;)Z

    goto :goto_0
.end method

.method private removeAllCallbacks()V
    .locals 1

    .prologue
    .line 1907
    iget-object v0, p0, Lnet/simonvt/numberpicker/NumberPicker;->mChangeCurrentByOneFromLongPressCommand:Lnet/simonvt/numberpicker/NumberPicker$ChangeCurrentByOneFromLongPressCommand;

    if-eqz v0, :cond_0

    .line 1908
    iget-object v0, p0, Lnet/simonvt/numberpicker/NumberPicker;->mChangeCurrentByOneFromLongPressCommand:Lnet/simonvt/numberpicker/NumberPicker$ChangeCurrentByOneFromLongPressCommand;

    invoke-virtual {p0, v0}, Lnet/simonvt/numberpicker/NumberPicker;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 1910
    :cond_0
    iget-object v0, p0, Lnet/simonvt/numberpicker/NumberPicker;->mSetSelectionCommand:Lnet/simonvt/numberpicker/NumberPicker$SetSelectionCommand;

    if-eqz v0, :cond_1

    .line 1911
    iget-object v0, p0, Lnet/simonvt/numberpicker/NumberPicker;->mSetSelectionCommand:Lnet/simonvt/numberpicker/NumberPicker$SetSelectionCommand;

    invoke-virtual {p0, v0}, Lnet/simonvt/numberpicker/NumberPicker;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 1913
    :cond_1
    iget-object v0, p0, Lnet/simonvt/numberpicker/NumberPicker;->mBeginSoftInputOnLongPressCommand:Lnet/simonvt/numberpicker/NumberPicker$BeginSoftInputOnLongPressCommand;

    if-eqz v0, :cond_2

    .line 1914
    iget-object v0, p0, Lnet/simonvt/numberpicker/NumberPicker;->mBeginSoftInputOnLongPressCommand:Lnet/simonvt/numberpicker/NumberPicker$BeginSoftInputOnLongPressCommand;

    invoke-virtual {p0, v0}, Lnet/simonvt/numberpicker/NumberPicker;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 1916
    :cond_2
    iget-object v0, p0, Lnet/simonvt/numberpicker/NumberPicker;->mPressedStateHelper:Lnet/simonvt/numberpicker/NumberPicker$PressedStateHelper;

    invoke-virtual {v0}, Lnet/simonvt/numberpicker/NumberPicker$PressedStateHelper;->cancel()V

    .line 1917
    return-void
.end method

.method private removeBeginSoftInputCommand()V
    .locals 1

    .prologue
    .line 1898
    iget-object v0, p0, Lnet/simonvt/numberpicker/NumberPicker;->mBeginSoftInputOnLongPressCommand:Lnet/simonvt/numberpicker/NumberPicker$BeginSoftInputOnLongPressCommand;

    if-eqz v0, :cond_0

    .line 1899
    iget-object v0, p0, Lnet/simonvt/numberpicker/NumberPicker;->mBeginSoftInputOnLongPressCommand:Lnet/simonvt/numberpicker/NumberPicker$BeginSoftInputOnLongPressCommand;

    invoke-virtual {p0, v0}, Lnet/simonvt/numberpicker/NumberPicker;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 1901
    :cond_0
    return-void
.end method

.method private removeChangeCurrentByOneFromLongPress()V
    .locals 1

    .prologue
    .line 1876
    iget-object v0, p0, Lnet/simonvt/numberpicker/NumberPicker;->mChangeCurrentByOneFromLongPressCommand:Lnet/simonvt/numberpicker/NumberPicker$ChangeCurrentByOneFromLongPressCommand;

    if-eqz v0, :cond_0

    .line 1877
    iget-object v0, p0, Lnet/simonvt/numberpicker/NumberPicker;->mChangeCurrentByOneFromLongPressCommand:Lnet/simonvt/numberpicker/NumberPicker$ChangeCurrentByOneFromLongPressCommand;

    invoke-virtual {p0, v0}, Lnet/simonvt/numberpicker/NumberPicker;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 1879
    :cond_0
    return-void
.end method

.method public static resolveSizeAndState(III)I
    .locals 4
    .param p0, "size"    # I
    .param p1, "measureSpec"    # I
    .param p2, "childMeasuredState"    # I

    .prologue
    .line 1579
    move v0, p0

    .line 1580
    .local v0, "result":I
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v1

    .line 1581
    .local v1, "specMode":I
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v2

    .line 1582
    .local v2, "specSize":I
    sparse-switch v1, :sswitch_data_0

    .line 1597
    :goto_0
    const/high16 v3, -0x1000000

    and-int/2addr v3, p2

    or-int/2addr v3, v0

    return v3

    .line 1584
    :sswitch_0
    move v0, p0

    .line 1585
    goto :goto_0

    .line 1587
    :sswitch_1
    if-ge v2, p0, :cond_0

    .line 1588
    const/high16 v3, 0x1000000

    or-int v0, v2, v3

    goto :goto_0

    .line 1590
    :cond_0
    move v0, p0

    .line 1592
    goto :goto_0

    .line 1594
    :sswitch_2
    move v0, v2

    goto :goto_0

    .line 1582
    :sswitch_data_0
    .sparse-switch
        -0x80000000 -> :sswitch_1
        0x0 -> :sswitch_0
        0x40000000 -> :sswitch_2
    .end sparse-switch
.end method

.method private resolveSizeAndStateRespectingMinSize(III)I
    .locals 2
    .param p1, "minSize"    # I
    .param p2, "measuredSize"    # I
    .param p3, "measureSpec"    # I

    .prologue
    .line 1557
    const/4 v1, -0x1

    if-eq p1, v1, :cond_0

    .line 1558
    invoke-static {p1, p2}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 1559
    .local v0, "desiredWidth":I
    const/4 v1, 0x0

    invoke-static {v0, p3, v1}, Lnet/simonvt/numberpicker/NumberPicker;->resolveSizeAndState(III)I

    move-result p2

    .line 1561
    .end local v0    # "desiredWidth":I
    .end local p2    # "measuredSize":I
    :cond_0
    return p2
.end method

.method private setValueInternal(IZ)V
    .locals 2
    .param p1, "current"    # I
    .param p2, "notifyChange"    # Z

    .prologue
    .line 1625
    iget v1, p0, Lnet/simonvt/numberpicker/NumberPicker;->mValue:I

    if-ne v1, p1, :cond_0

    .line 1643
    :goto_0
    return-void

    .line 1629
    :cond_0
    iget-boolean v1, p0, Lnet/simonvt/numberpicker/NumberPicker;->mWrapSelectorWheel:Z

    if-eqz v1, :cond_2

    .line 1630
    invoke-direct {p0, p1}, Lnet/simonvt/numberpicker/NumberPicker;->getWrappedSelectorIndex(I)I

    move-result p1

    .line 1635
    :goto_1
    iget v0, p0, Lnet/simonvt/numberpicker/NumberPicker;->mValue:I

    .line 1636
    .local v0, "previous":I
    iput p1, p0, Lnet/simonvt/numberpicker/NumberPicker;->mValue:I

    .line 1637
    invoke-direct {p0}, Lnet/simonvt/numberpicker/NumberPicker;->updateInputTextView()Z

    .line 1638
    if-eqz p2, :cond_1

    .line 1639
    invoke-direct {p0, v0, p1}, Lnet/simonvt/numberpicker/NumberPicker;->notifyChange(II)V

    .line 1641
    :cond_1
    invoke-direct {p0}, Lnet/simonvt/numberpicker/NumberPicker;->initializeSelectorWheelIndices()V

    .line 1642
    invoke-virtual {p0}, Lnet/simonvt/numberpicker/NumberPicker;->invalidate()V

    goto :goto_0

    .line 1632
    .end local v0    # "previous":I
    :cond_2
    iget v1, p0, Lnet/simonvt/numberpicker/NumberPicker;->mMinValue:I

    invoke-static {p1, v1}, Ljava/lang/Math;->max(II)I

    move-result p1

    .line 1633
    iget v1, p0, Lnet/simonvt/numberpicker/NumberPicker;->mMaxValue:I

    invoke-static {p1, v1}, Ljava/lang/Math;->min(II)I

    move-result p1

    goto :goto_1
.end method

.method private showSoftInput()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1190
    invoke-virtual {p0}, Lnet/simonvt/numberpicker/NumberPicker;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "input_method"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 1191
    .local v0, "inputMethodManager":Landroid/view/inputmethod/InputMethodManager;
    if-eqz v0, :cond_1

    .line 1192
    iget-boolean v1, p0, Lnet/simonvt/numberpicker/NumberPicker;->mHasSelectorWheel:Z

    if-eqz v1, :cond_0

    .line 1193
    iget-object v1, p0, Lnet/simonvt/numberpicker/NumberPicker;->mInputText:Landroid/widget/EditText;

    invoke-virtual {v1, v3}, Landroid/widget/EditText;->setVisibility(I)V

    .line 1195
    :cond_0
    iget-object v1, p0, Lnet/simonvt/numberpicker/NumberPicker;->mInputText:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->requestFocus()Z

    .line 1196
    iget-object v1, p0, Lnet/simonvt/numberpicker/NumberPicker;->mInputText:Landroid/widget/EditText;

    invoke-virtual {v0, v1, v3}, Landroid/view/inputmethod/InputMethodManager;->showSoftInput(Landroid/view/View;I)Z

    .line 1198
    :cond_1
    return-void
.end method

.method private tryComputeMaxWidth()V
    .locals 10

    .prologue
    .line 1217
    iget-boolean v8, p0, Lnet/simonvt/numberpicker/NumberPicker;->mComputeMaxWidth:Z

    if-nez v8, :cond_1

    .line 1254
    :cond_0
    :goto_0
    return-void

    .line 1220
    :cond_1
    const/4 v4, 0x0

    .line 1221
    .local v4, "maxTextWidth":I
    iget-object v8, p0, Lnet/simonvt/numberpicker/NumberPicker;->mDisplayedValues:[Ljava/lang/String;

    if-nez v8, :cond_6

    .line 1222
    const/4 v3, 0x0

    .line 1223
    .local v3, "maxDigitWidth":F
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    const/16 v8, 0x9

    if-gt v2, v8, :cond_3

    .line 1224
    iget-object v8, p0, Lnet/simonvt/numberpicker/NumberPicker;->mSelectorWheelPaint:Landroid/graphics/Paint;

    invoke-static {v2}, Lnet/simonvt/numberpicker/NumberPicker;->formatNumberWithLocale(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result v1

    .line 1225
    .local v1, "digitWidth":F
    cmpl-float v8, v1, v3

    if-lez v8, :cond_2

    .line 1226
    move v3, v1

    .line 1223
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 1229
    .end local v1    # "digitWidth":F
    :cond_3
    const/4 v5, 0x0

    .line 1230
    .local v5, "numberOfDigits":I
    iget v0, p0, Lnet/simonvt/numberpicker/NumberPicker;->mMaxValue:I

    .line 1231
    .local v0, "current":I
    :goto_2
    if-lez v0, :cond_4

    .line 1232
    add-int/lit8 v5, v5, 0x1

    .line 1233
    div-int/lit8 v0, v0, 0xa

    goto :goto_2

    .line 1235
    :cond_4
    int-to-float v8, v5

    mul-float/2addr v8, v3

    float-to-int v4, v8

    .line 1245
    .end local v0    # "current":I
    .end local v3    # "maxDigitWidth":F
    .end local v5    # "numberOfDigits":I
    :cond_5
    iget-object v8, p0, Lnet/simonvt/numberpicker/NumberPicker;->mInputText:Landroid/widget/EditText;

    invoke-virtual {v8}, Landroid/widget/EditText;->getPaddingLeft()I

    move-result v8

    iget-object v9, p0, Lnet/simonvt/numberpicker/NumberPicker;->mInputText:Landroid/widget/EditText;

    invoke-virtual {v9}, Landroid/widget/EditText;->getPaddingRight()I

    move-result v9

    add-int/2addr v8, v9

    add-int/2addr v4, v8

    .line 1246
    iget v8, p0, Lnet/simonvt/numberpicker/NumberPicker;->mMaxWidth:I

    if-eq v8, v4, :cond_0

    .line 1247
    iget v8, p0, Lnet/simonvt/numberpicker/NumberPicker;->mMinWidth:I

    if-le v4, v8, :cond_8

    .line 1248
    iput v4, p0, Lnet/simonvt/numberpicker/NumberPicker;->mMaxWidth:I

    .line 1252
    :goto_3
    invoke-virtual {p0}, Lnet/simonvt/numberpicker/NumberPicker;->invalidate()V

    goto :goto_0

    .line 1237
    .end local v2    # "i":I
    :cond_6
    iget-object v8, p0, Lnet/simonvt/numberpicker/NumberPicker;->mDisplayedValues:[Ljava/lang/String;

    array-length v7, v8

    .line 1238
    .local v7, "valueCount":I
    const/4 v2, 0x0

    .restart local v2    # "i":I
    :goto_4
    if-ge v2, v7, :cond_5

    .line 1239
    iget-object v8, p0, Lnet/simonvt/numberpicker/NumberPicker;->mSelectorWheelPaint:Landroid/graphics/Paint;

    iget-object v9, p0, Lnet/simonvt/numberpicker/NumberPicker;->mDisplayedValues:[Ljava/lang/String;

    aget-object v9, v9, v2

    invoke-virtual {v8, v9}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result v6

    .line 1240
    .local v6, "textWidth":F
    int-to-float v8, v4

    cmpl-float v8, v6, v8

    if-lez v8, :cond_7

    .line 1241
    float-to-int v4, v6

    .line 1238
    :cond_7
    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    .line 1250
    .end local v6    # "textWidth":F
    .end local v7    # "valueCount":I
    :cond_8
    iget v8, p0, Lnet/simonvt/numberpicker/NumberPicker;->mMinWidth:I

    iput v8, p0, Lnet/simonvt/numberpicker/NumberPicker;->mMaxWidth:I

    goto :goto_3
.end method

.method private updateInputTextView()Z
    .locals 4

    .prologue
    .line 1837
    iget-object v1, p0, Lnet/simonvt/numberpicker/NumberPicker;->mDisplayedValues:[Ljava/lang/String;

    if-nez v1, :cond_0

    iget v1, p0, Lnet/simonvt/numberpicker/NumberPicker;->mValue:I

    invoke-direct {p0, v1}, Lnet/simonvt/numberpicker/NumberPicker;->formatNumber(I)Ljava/lang/String;

    move-result-object v0

    .line 1839
    .local v0, "text":Ljava/lang/String;
    :goto_0
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    iget-object v1, p0, Lnet/simonvt/numberpicker/NumberPicker;->mInputText:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 1840
    iget-object v1, p0, Lnet/simonvt/numberpicker/NumberPicker;->mInputText:Landroid/widget/EditText;

    invoke-virtual {v1, v0}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 1841
    const/4 v1, 0x1

    .line 1844
    :goto_1
    return v1

    .line 1837
    .end local v0    # "text":Ljava/lang/String;
    :cond_0
    iget-object v1, p0, Lnet/simonvt/numberpicker/NumberPicker;->mDisplayedValues:[Ljava/lang/String;

    iget v2, p0, Lnet/simonvt/numberpicker/NumberPicker;->mValue:I

    iget v3, p0, Lnet/simonvt/numberpicker/NumberPicker;->mMinValue:I

    sub-int/2addr v2, v3

    aget-object v0, v1, v2

    goto :goto_0

    .line 1844
    .restart local v0    # "text":Ljava/lang/String;
    :cond_1
    const/4 v1, 0x0

    goto :goto_1
.end method

.method private validateInputTextView(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 1812
    check-cast p1, Landroid/widget/TextView;

    .end local p1    # "v":Landroid/view/View;
    invoke-virtual {p1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 1813
    .local v1, "str":Ljava/lang/String;
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1815
    invoke-direct {p0}, Lnet/simonvt/numberpicker/NumberPicker;->updateInputTextView()Z

    .line 1821
    :goto_0
    return-void

    .line 1818
    :cond_0
    invoke-virtual {v1}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lnet/simonvt/numberpicker/NumberPicker;->getSelectedPos(Ljava/lang/String;)I

    move-result v0

    .line 1819
    .local v0, "current":I
    const/4 v2, 0x1

    invoke-direct {p0, v0, v2}, Lnet/simonvt/numberpicker/NumberPicker;->setValueInternal(IZ)V

    goto :goto_0
.end method


# virtual methods
.method public computeScroll()V
    .locals 4

    .prologue
    .line 1046
    iget-object v1, p0, Lnet/simonvt/numberpicker/NumberPicker;->mFlingScroller:Lnet/simonvt/numberpicker/Scroller;

    .line 1047
    .local v1, "scroller":Lnet/simonvt/numberpicker/Scroller;
    invoke-virtual {v1}, Lnet/simonvt/numberpicker/Scroller;->isFinished()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1048
    iget-object v1, p0, Lnet/simonvt/numberpicker/NumberPicker;->mAdjustScroller:Lnet/simonvt/numberpicker/Scroller;

    .line 1049
    invoke-virtual {v1}, Lnet/simonvt/numberpicker/Scroller;->isFinished()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1065
    :goto_0
    return-void

    .line 1053
    :cond_0
    invoke-virtual {v1}, Lnet/simonvt/numberpicker/Scroller;->computeScrollOffset()Z

    .line 1054
    invoke-virtual {v1}, Lnet/simonvt/numberpicker/Scroller;->getCurrY()I

    move-result v0

    .line 1055
    .local v0, "currentScrollerY":I
    iget v2, p0, Lnet/simonvt/numberpicker/NumberPicker;->mPreviousScrollerY:I

    if-nez v2, :cond_1

    .line 1056
    invoke-virtual {v1}, Lnet/simonvt/numberpicker/Scroller;->getStartY()I

    move-result v2

    iput v2, p0, Lnet/simonvt/numberpicker/NumberPicker;->mPreviousScrollerY:I

    .line 1058
    :cond_1
    const/4 v2, 0x0

    iget v3, p0, Lnet/simonvt/numberpicker/NumberPicker;->mPreviousScrollerY:I

    sub-int v3, v0, v3

    invoke-virtual {p0, v2, v3}, Lnet/simonvt/numberpicker/NumberPicker;->scrollBy(II)V

    .line 1059
    iput v0, p0, Lnet/simonvt/numberpicker/NumberPicker;->mPreviousScrollerY:I

    .line 1060
    invoke-virtual {v1}, Lnet/simonvt/numberpicker/Scroller;->isFinished()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 1061
    invoke-direct {p0, v1}, Lnet/simonvt/numberpicker/NumberPicker;->onScrollerFinished(Lnet/simonvt/numberpicker/Scroller;)V

    goto :goto_0

    .line 1063
    :cond_2
    invoke-virtual {p0}, Lnet/simonvt/numberpicker/NumberPicker;->invalidate()V

    goto :goto_0
.end method

.method protected dispatchHoverEvent(Landroid/view/MotionEvent;)Z
    .locals 11
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v10, 0x0

    const/16 v9, 0x100

    const/16 v8, 0x80

    const/16 v7, 0x40

    const/4 v6, -0x1

    .line 996
    iget-boolean v4, p0, Lnet/simonvt/numberpicker/NumberPicker;->mHasSelectorWheel:Z

    if-nez v4, :cond_0

    .line 997
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->dispatchHoverEvent(Landroid/view/MotionEvent;)Z

    move-result v4

    .line 1041
    :goto_0
    return v4

    .line 1000
    :cond_0
    invoke-virtual {p0}, Lnet/simonvt/numberpicker/NumberPicker;->getContext()Landroid/content/Context;

    move-result-object v4

    const-string v5, "accessibility"

    invoke-virtual {v4, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/view/accessibility/AccessibilityManager;

    invoke-virtual {v4}, Landroid/view/accessibility/AccessibilityManager;->isEnabled()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 1001
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v4

    float-to-int v1, v4

    .line 1003
    .local v1, "eventY":I
    iget v4, p0, Lnet/simonvt/numberpicker/NumberPicker;->mTopSelectionDividerTop:I

    if-ge v1, v4, :cond_2

    .line 1004
    const/4 v2, 0x3

    .line 1010
    .local v2, "hoveredVirtualViewId":I
    :goto_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v4

    and-int/lit16 v0, v4, 0xff

    .line 1011
    .local v0, "action":I
    invoke-direct {p0}, Lnet/simonvt/numberpicker/NumberPicker;->getSupportAccessibilityNodeProvider()Lnet/simonvt/numberpicker/NumberPicker$SupportAccessibilityNodeProvider;

    move-result-object v3

    .line 1013
    .local v3, "provider":Lnet/simonvt/numberpicker/NumberPicker$SupportAccessibilityNodeProvider;
    packed-switch v0, :pswitch_data_0

    .line 1041
    .end local v0    # "action":I
    .end local v1    # "eventY":I
    .end local v2    # "hoveredVirtualViewId":I
    .end local v3    # "provider":Lnet/simonvt/numberpicker/NumberPicker$SupportAccessibilityNodeProvider;
    :cond_1
    :goto_2
    :pswitch_0
    const/4 v4, 0x0

    goto :goto_0

    .line 1005
    .restart local v1    # "eventY":I
    :cond_2
    iget v4, p0, Lnet/simonvt/numberpicker/NumberPicker;->mBottomSelectionDividerBottom:I

    if-le v1, v4, :cond_3

    .line 1006
    const/4 v2, 0x1

    .restart local v2    # "hoveredVirtualViewId":I
    goto :goto_1

    .line 1008
    .end local v2    # "hoveredVirtualViewId":I
    :cond_3
    const/4 v2, 0x2

    .restart local v2    # "hoveredVirtualViewId":I
    goto :goto_1

    .line 1015
    .restart local v0    # "action":I
    .restart local v3    # "provider":Lnet/simonvt/numberpicker/NumberPicker$SupportAccessibilityNodeProvider;
    :pswitch_1
    invoke-virtual {v3, v2, v8}, Lnet/simonvt/numberpicker/NumberPicker$SupportAccessibilityNodeProvider;->sendAccessibilityEventForVirtualView(II)V

    .line 1017
    iput v2, p0, Lnet/simonvt/numberpicker/NumberPicker;->mLastHoveredChildVirtualViewId:I

    .line 1018
    invoke-virtual {v3, v2, v7, v10}, Lnet/simonvt/numberpicker/NumberPicker$SupportAccessibilityNodeProvider;->performAction(IILandroid/os/Bundle;)Z

    goto :goto_2

    .line 1022
    :pswitch_2
    iget v4, p0, Lnet/simonvt/numberpicker/NumberPicker;->mLastHoveredChildVirtualViewId:I

    if-eq v4, v2, :cond_1

    iget v4, p0, Lnet/simonvt/numberpicker/NumberPicker;->mLastHoveredChildVirtualViewId:I

    if-eq v4, v6, :cond_1

    .line 1024
    iget v4, p0, Lnet/simonvt/numberpicker/NumberPicker;->mLastHoveredChildVirtualViewId:I

    invoke-virtual {v3, v4, v9}, Lnet/simonvt/numberpicker/NumberPicker$SupportAccessibilityNodeProvider;->sendAccessibilityEventForVirtualView(II)V

    .line 1027
    invoke-virtual {v3, v2, v8}, Lnet/simonvt/numberpicker/NumberPicker$SupportAccessibilityNodeProvider;->sendAccessibilityEventForVirtualView(II)V

    .line 1029
    iput v2, p0, Lnet/simonvt/numberpicker/NumberPicker;->mLastHoveredChildVirtualViewId:I

    .line 1030
    invoke-virtual {v3, v2, v7, v10}, Lnet/simonvt/numberpicker/NumberPicker$SupportAccessibilityNodeProvider;->performAction(IILandroid/os/Bundle;)Z

    goto :goto_2

    .line 1035
    :pswitch_3
    invoke-virtual {v3, v2, v9}, Lnet/simonvt/numberpicker/NumberPicker$SupportAccessibilityNodeProvider;->sendAccessibilityEventForVirtualView(II)V

    .line 1037
    iput v6, p0, Lnet/simonvt/numberpicker/NumberPicker;->mLastHoveredChildVirtualViewId:I

    goto :goto_2

    .line 1013
    nop

    :pswitch_data_0
    .packed-switch 0x7
        :pswitch_2
        :pswitch_0
        :pswitch_1
        :pswitch_3
    .end packed-switch
.end method

.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 5
    .param p1, "event"    # Landroid/view/KeyEvent;

    .prologue
    const/16 v4, 0x14

    const/4 v2, 0x1

    .line 947
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v0

    .line 948
    .local v0, "keyCode":I
    sparse-switch v0, :sswitch_data_0

    .line 979
    :cond_0
    :goto_0
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result v2

    :cond_1
    :goto_1
    return v2

    .line 951
    :sswitch_0
    invoke-direct {p0}, Lnet/simonvt/numberpicker/NumberPicker;->removeAllCallbacks()V

    goto :goto_0

    .line 955
    :sswitch_1
    iget-boolean v1, p0, Lnet/simonvt/numberpicker/NumberPicker;->mHasSelectorWheel:Z

    if-eqz v1, :cond_0

    .line 958
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    goto :goto_0

    .line 960
    :pswitch_0
    iget-boolean v1, p0, Lnet/simonvt/numberpicker/NumberPicker;->mWrapSelectorWheel:Z

    if-nez v1, :cond_2

    if-ne v0, v4, :cond_3

    .line 961
    :cond_2
    invoke-virtual {p0}, Lnet/simonvt/numberpicker/NumberPicker;->getValue()I

    move-result v1

    invoke-virtual {p0}, Lnet/simonvt/numberpicker/NumberPicker;->getMaxValue()I

    move-result v3

    if-ge v1, v3, :cond_0

    .line 962
    :goto_2
    invoke-virtual {p0}, Lnet/simonvt/numberpicker/NumberPicker;->requestFocus()Z

    .line 963
    iput v0, p0, Lnet/simonvt/numberpicker/NumberPicker;->mLastHandledDownDpadKeyCode:I

    .line 964
    invoke-direct {p0}, Lnet/simonvt/numberpicker/NumberPicker;->removeAllCallbacks()V

    .line 965
    iget-object v1, p0, Lnet/simonvt/numberpicker/NumberPicker;->mFlingScroller:Lnet/simonvt/numberpicker/Scroller;

    invoke-virtual {v1}, Lnet/simonvt/numberpicker/Scroller;->isFinished()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 966
    if-ne v0, v4, :cond_4

    move v1, v2

    :goto_3
    invoke-direct {p0, v1}, Lnet/simonvt/numberpicker/NumberPicker;->changeValueByOne(Z)V

    goto :goto_1

    .line 961
    :cond_3
    invoke-virtual {p0}, Lnet/simonvt/numberpicker/NumberPicker;->getValue()I

    move-result v1

    invoke-virtual {p0}, Lnet/simonvt/numberpicker/NumberPicker;->getMinValue()I

    move-result v3

    if-le v1, v3, :cond_0

    goto :goto_2

    .line 966
    :cond_4
    const/4 v1, 0x0

    goto :goto_3

    .line 972
    :pswitch_1
    iget v1, p0, Lnet/simonvt/numberpicker/NumberPicker;->mLastHandledDownDpadKeyCode:I

    if-ne v1, v0, :cond_0

    .line 973
    const/4 v1, -0x1

    iput v1, p0, Lnet/simonvt/numberpicker/NumberPicker;->mLastHandledDownDpadKeyCode:I

    goto :goto_1

    .line 948
    nop

    :sswitch_data_0
    .sparse-switch
        0x13 -> :sswitch_1
        0x14 -> :sswitch_1
        0x17 -> :sswitch_0
        0x42 -> :sswitch_0
    .end sparse-switch

    .line 958
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 935
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v1

    and-int/lit16 v0, v1, 0xff

    .line 936
    .local v0, "action":I
    packed-switch v0, :pswitch_data_0

    .line 942
    :goto_0
    :pswitch_0
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v1

    return v1

    .line 939
    :pswitch_1
    invoke-direct {p0}, Lnet/simonvt/numberpicker/NumberPicker;->removeAllCallbacks()V

    goto :goto_0

    .line 936
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public dispatchTrackballEvent(Landroid/view/MotionEvent;)Z
    .locals 2
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 984
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v1

    and-int/lit16 v0, v1, 0xff

    .line 985
    .local v0, "action":I
    packed-switch v0, :pswitch_data_0

    .line 991
    :goto_0
    :pswitch_0
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->dispatchTrackballEvent(Landroid/view/MotionEvent;)Z

    move-result v1

    return v1

    .line 988
    :pswitch_1
    invoke-direct {p0}, Lnet/simonvt/numberpicker/NumberPicker;->removeAllCallbacks()V

    goto :goto_0

    .line 985
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public getAccessibilityNodeProvider()Landroid/view/accessibility/AccessibilityNodeProvider;
    .locals 2

    .prologue
    .line 1511
    iget-boolean v0, p0, Lnet/simonvt/numberpicker/NumberPicker;->mHasSelectorWheel:Z

    if-nez v0, :cond_0

    .line 1512
    invoke-super {p0}, Landroid/widget/LinearLayout;->getAccessibilityNodeProvider()Landroid/view/accessibility/AccessibilityNodeProvider;

    move-result-object v0

    .line 1517
    :goto_0
    return-object v0

    .line 1514
    :cond_0
    iget-object v0, p0, Lnet/simonvt/numberpicker/NumberPicker;->mAccessibilityNodeProvider:Lnet/simonvt/numberpicker/NumberPicker$SupportAccessibilityNodeProvider;

    if-nez v0, :cond_1

    .line 1515
    new-instance v0, Lnet/simonvt/numberpicker/NumberPicker$SupportAccessibilityNodeProvider;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lnet/simonvt/numberpicker/NumberPicker$SupportAccessibilityNodeProvider;-><init>(Lnet/simonvt/numberpicker/NumberPicker;Lnet/simonvt/numberpicker/NumberPicker$1;)V

    iput-object v0, p0, Lnet/simonvt/numberpicker/NumberPicker;->mAccessibilityNodeProvider:Lnet/simonvt/numberpicker/NumberPicker$SupportAccessibilityNodeProvider;

    .line 1517
    :cond_1
    iget-object v0, p0, Lnet/simonvt/numberpicker/NumberPicker;->mAccessibilityNodeProvider:Lnet/simonvt/numberpicker/NumberPicker$SupportAccessibilityNodeProvider;

    iget-object v0, v0, Lnet/simonvt/numberpicker/NumberPicker$SupportAccessibilityNodeProvider;->mProvider:Lnet/simonvt/numberpicker/NumberPicker$AccessibilityNodeProviderImpl;

    goto :goto_0
.end method

.method protected getBottomFadingEdgeStrength()F
    .locals 1

    .prologue
    .line 1433
    const v0, 0x3f666666    # 0.9f

    return v0
.end method

.method public getDisplayedValues()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 1397
    iget-object v0, p0, Lnet/simonvt/numberpicker/NumberPicker;->mDisplayedValues:[Ljava/lang/String;

    return-object v0
.end method

.method public getMaxValue()I
    .locals 1

    .prologue
    .line 1359
    iget v0, p0, Lnet/simonvt/numberpicker/NumberPicker;->mMaxValue:I

    return v0
.end method

.method public getMinValue()I
    .locals 1

    .prologue
    .line 1321
    iget v0, p0, Lnet/simonvt/numberpicker/NumberPicker;->mMinValue:I

    return v0
.end method

.method public getSolidColor()I
    .locals 1

    .prologue
    .line 1113
    iget v0, p0, Lnet/simonvt/numberpicker/NumberPicker;->mSolidColor:I

    return v0
.end method

.method protected getTopFadingEdgeStrength()F
    .locals 1

    .prologue
    .line 1428
    const v0, 0x3f666666    # 0.9f

    return v0
.end method

.method public getValue()I
    .locals 1

    .prologue
    .line 1312
    iget v0, p0, Lnet/simonvt/numberpicker/NumberPicker;->mValue:I

    return v0
.end method

.method public getWrapSelectorWheel()Z
    .locals 1

    .prologue
    .line 1265
    iget-boolean v0, p0, Lnet/simonvt/numberpicker/NumberPicker;->mWrapSelectorWheel:Z

    return v0
.end method

.method protected onDetachedFromWindow()V
    .locals 0

    .prologue
    .line 1438
    invoke-direct {p0}, Lnet/simonvt/numberpicker/NumberPicker;->removeAllCallbacks()V

    .line 1439
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 16
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 1443
    move-object/from16 v0, p0

    iget-boolean v11, v0, Lnet/simonvt/numberpicker/NumberPicker;->mHasSelectorWheel:Z

    if-nez v11, :cond_1

    .line 1444
    invoke-super/range {p0 .. p1}, Landroid/widget/LinearLayout;->onDraw(Landroid/graphics/Canvas;)V

    .line 1498
    :cond_0
    :goto_0
    return-void

    .line 1447
    :cond_1
    invoke-virtual/range {p0 .. p0}, Lnet/simonvt/numberpicker/NumberPicker;->getRight()I

    move-result v11

    invoke-virtual/range {p0 .. p0}, Lnet/simonvt/numberpicker/NumberPicker;->getLeft()I

    move-result v12

    sub-int/2addr v11, v12

    div-int/lit8 v11, v11, 0x2

    int-to-float v9, v11

    .line 1448
    .local v9, "x":F
    move-object/from16 v0, p0

    iget v11, v0, Lnet/simonvt/numberpicker/NumberPicker;->mCurrentScrollOffset:I

    int-to-float v10, v11

    .line 1451
    .local v10, "y":F
    move-object/from16 v0, p0

    iget-object v11, v0, Lnet/simonvt/numberpicker/NumberPicker;->mVirtualButtonPressedDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v11, :cond_3

    move-object/from16 v0, p0

    iget v11, v0, Lnet/simonvt/numberpicker/NumberPicker;->mScrollState:I

    if-nez v11, :cond_3

    .line 1453
    move-object/from16 v0, p0

    iget-boolean v11, v0, Lnet/simonvt/numberpicker/NumberPicker;->mDecrementVirtualButtonPressed:Z

    if-eqz v11, :cond_2

    .line 1455
    move-object/from16 v0, p0

    iget-object v11, v0, Lnet/simonvt/numberpicker/NumberPicker;->mVirtualButtonPressedDrawable:Landroid/graphics/drawable/Drawable;

    sget-object v12, Lnet/simonvt/numberpicker/NumberPicker;->PRESSED_ENABLED_STATE_SET:[I

    invoke-virtual {v11, v12}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    .line 1456
    move-object/from16 v0, p0

    iget-object v11, v0, Lnet/simonvt/numberpicker/NumberPicker;->mVirtualButtonPressedDrawable:Landroid/graphics/drawable/Drawable;

    const/4 v12, 0x0

    const/4 v13, 0x0

    invoke-virtual/range {p0 .. p0}, Lnet/simonvt/numberpicker/NumberPicker;->getRight()I

    move-result v14

    move-object/from16 v0, p0

    iget v15, v0, Lnet/simonvt/numberpicker/NumberPicker;->mTopSelectionDividerTop:I

    invoke-virtual {v11, v12, v13, v14, v15}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 1457
    move-object/from16 v0, p0

    iget-object v11, v0, Lnet/simonvt/numberpicker/NumberPicker;->mVirtualButtonPressedDrawable:Landroid/graphics/drawable/Drawable;

    move-object/from16 v0, p1

    invoke-virtual {v11, v0}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 1459
    :cond_2
    move-object/from16 v0, p0

    iget-boolean v11, v0, Lnet/simonvt/numberpicker/NumberPicker;->mIncrementVirtualButtonPressed:Z

    if-eqz v11, :cond_3

    .line 1461
    move-object/from16 v0, p0

    iget-object v11, v0, Lnet/simonvt/numberpicker/NumberPicker;->mVirtualButtonPressedDrawable:Landroid/graphics/drawable/Drawable;

    sget-object v12, Lnet/simonvt/numberpicker/NumberPicker;->PRESSED_ENABLED_STATE_SET:[I

    invoke-virtual {v11, v12}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    .line 1462
    move-object/from16 v0, p0

    iget-object v11, v0, Lnet/simonvt/numberpicker/NumberPicker;->mVirtualButtonPressedDrawable:Landroid/graphics/drawable/Drawable;

    const/4 v12, 0x0

    move-object/from16 v0, p0

    iget v13, v0, Lnet/simonvt/numberpicker/NumberPicker;->mBottomSelectionDividerBottom:I

    invoke-virtual/range {p0 .. p0}, Lnet/simonvt/numberpicker/NumberPicker;->getRight()I

    move-result v14

    .line 1463
    invoke-virtual/range {p0 .. p0}, Lnet/simonvt/numberpicker/NumberPicker;->getBottom()I

    move-result v15

    .line 1462
    invoke-virtual {v11, v12, v13, v14, v15}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 1464
    move-object/from16 v0, p0

    iget-object v11, v0, Lnet/simonvt/numberpicker/NumberPicker;->mVirtualButtonPressedDrawable:Landroid/graphics/drawable/Drawable;

    move-object/from16 v0, p1

    invoke-virtual {v11, v0}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 1469
    :cond_3
    move-object/from16 v0, p0

    iget-object v6, v0, Lnet/simonvt/numberpicker/NumberPicker;->mSelectorIndices:[I

    .line 1470
    .local v6, "selectorIndices":[I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1
    array-length v11, v6

    if-ge v3, v11, :cond_6

    .line 1471
    aget v5, v6, v3

    .line 1472
    .local v5, "selectorIndex":I
    move-object/from16 v0, p0

    iget-object v11, v0, Lnet/simonvt/numberpicker/NumberPicker;->mSelectorIndexToStringCache:Landroid/util/SparseArray;

    invoke-virtual {v11, v5}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 1478
    .local v4, "scrollSelectorValue":Ljava/lang/String;
    const/4 v11, 0x1

    if-ne v3, v11, :cond_4

    move-object/from16 v0, p0

    iget-object v11, v0, Lnet/simonvt/numberpicker/NumberPicker;->mInputText:Landroid/widget/EditText;

    invoke-virtual {v11}, Landroid/widget/EditText;->getVisibility()I

    move-result v11

    if-eqz v11, :cond_5

    .line 1479
    :cond_4
    move-object/from16 v0, p0

    iget-object v11, v0, Lnet/simonvt/numberpicker/NumberPicker;->mSelectorWheelPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v4, v9, v10, v11}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 1481
    :cond_5
    move-object/from16 v0, p0

    iget v11, v0, Lnet/simonvt/numberpicker/NumberPicker;->mSelectorElementHeight:I

    int-to-float v11, v11

    add-float/2addr v10, v11

    .line 1470
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 1485
    .end local v4    # "scrollSelectorValue":Ljava/lang/String;
    .end local v5    # "selectorIndex":I
    :cond_6
    move-object/from16 v0, p0

    iget-object v11, v0, Lnet/simonvt/numberpicker/NumberPicker;->mSelectionDivider:Landroid/graphics/drawable/Drawable;

    if-eqz v11, :cond_0

    .line 1487
    move-object/from16 v0, p0

    iget v8, v0, Lnet/simonvt/numberpicker/NumberPicker;->mTopSelectionDividerTop:I

    .line 1488
    .local v8, "topOfTopDivider":I
    move-object/from16 v0, p0

    iget v11, v0, Lnet/simonvt/numberpicker/NumberPicker;->mSelectionDividerHeight:I

    add-int v2, v8, v11

    .line 1489
    .local v2, "bottomOfTopDivider":I
    move-object/from16 v0, p0

    iget-object v11, v0, Lnet/simonvt/numberpicker/NumberPicker;->mSelectionDivider:Landroid/graphics/drawable/Drawable;

    const/4 v12, 0x0

    invoke-virtual/range {p0 .. p0}, Lnet/simonvt/numberpicker/NumberPicker;->getRight()I

    move-result v13

    invoke-virtual {v11, v12, v8, v13, v2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 1490
    move-object/from16 v0, p0

    iget-object v11, v0, Lnet/simonvt/numberpicker/NumberPicker;->mSelectionDivider:Landroid/graphics/drawable/Drawable;

    move-object/from16 v0, p1

    invoke-virtual {v11, v0}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 1493
    move-object/from16 v0, p0

    iget v1, v0, Lnet/simonvt/numberpicker/NumberPicker;->mBottomSelectionDividerBottom:I

    .line 1494
    .local v1, "bottomOfBottomDivider":I
    move-object/from16 v0, p0

    iget v11, v0, Lnet/simonvt/numberpicker/NumberPicker;->mSelectionDividerHeight:I

    sub-int v7, v1, v11

    .line 1495
    .local v7, "topOfBottomDivider":I
    move-object/from16 v0, p0

    iget-object v11, v0, Lnet/simonvt/numberpicker/NumberPicker;->mSelectionDivider:Landroid/graphics/drawable/Drawable;

    const/4 v12, 0x0

    invoke-virtual/range {p0 .. p0}, Lnet/simonvt/numberpicker/NumberPicker;->getRight()I

    move-result v13

    invoke-virtual {v11, v12, v7, v13, v1}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 1496
    move-object/from16 v0, p0

    iget-object v11, v0, Lnet/simonvt/numberpicker/NumberPicker;->mSelectionDivider:Landroid/graphics/drawable/Drawable;

    move-object/from16 v0, p1

    invoke-virtual {v11, v0}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    goto/16 :goto_0
.end method

.method public onInitializeAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V
    .locals 2
    .param p1, "event"    # Landroid/view/accessibility/AccessibilityEvent;

    .prologue
    .line 1502
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->onInitializeAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V

    .line 1503
    const-class v0, Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityEvent;->setClassName(Ljava/lang/CharSequence;)V

    .line 1504
    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityEvent;->setScrollable(Z)V

    .line 1505
    iget v0, p0, Lnet/simonvt/numberpicker/NumberPicker;->mMinValue:I

    iget v1, p0, Lnet/simonvt/numberpicker/NumberPicker;->mValue:I

    add-int/2addr v0, v1

    iget v1, p0, Lnet/simonvt/numberpicker/NumberPicker;->mSelectorElementHeight:I

    mul-int/2addr v0, v1

    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityEvent;->setScrollY(I)V

    .line 1506
    iget v0, p0, Lnet/simonvt/numberpicker/NumberPicker;->mMaxValue:I

    iget v1, p0, Lnet/simonvt/numberpicker/NumberPicker;->mMinValue:I

    sub-int/2addr v0, v1

    iget v1, p0, Lnet/simonvt/numberpicker/NumberPicker;->mSelectorElementHeight:I

    mul-int/2addr v0, v1

    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityEvent;->setMaxScrollY(I)V

    .line 1507
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 6
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 809
    iget-boolean v3, p0, Lnet/simonvt/numberpicker/NumberPicker;->mHasSelectorWheel:Z

    if-eqz v3, :cond_0

    invoke-virtual {p0}, Lnet/simonvt/numberpicker/NumberPicker;->isEnabled()Z

    move-result v3

    if-nez v3, :cond_1

    :cond_0
    move v1, v2

    .line 857
    :goto_0
    return v1

    .line 812
    :cond_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v3

    and-int/lit16 v0, v3, 0xff

    .line 813
    .local v0, "action":I
    packed-switch v0, :pswitch_data_0

    move v1, v2

    .line 857
    goto :goto_0

    .line 815
    :pswitch_0
    invoke-direct {p0}, Lnet/simonvt/numberpicker/NumberPicker;->removeAllCallbacks()V

    .line 816
    iget-object v3, p0, Lnet/simonvt/numberpicker/NumberPicker;->mInputText:Landroid/widget/EditText;

    const/4 v4, 0x4

    invoke-virtual {v3, v4}, Landroid/widget/EditText;->setVisibility(I)V

    .line 817
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    iput v3, p0, Lnet/simonvt/numberpicker/NumberPicker;->mLastDownEventY:F

    iput v3, p0, Lnet/simonvt/numberpicker/NumberPicker;->mLastDownOrMoveEventY:F

    .line 818
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v4

    iput-wide v4, p0, Lnet/simonvt/numberpicker/NumberPicker;->mLastDownEventTime:J

    .line 819
    iput-boolean v2, p0, Lnet/simonvt/numberpicker/NumberPicker;->mIngonreMoveEvents:Z

    .line 820
    iput-boolean v2, p0, Lnet/simonvt/numberpicker/NumberPicker;->mShowSoftInputOnTap:Z

    .line 822
    iget v3, p0, Lnet/simonvt/numberpicker/NumberPicker;->mLastDownEventY:F

    iget v4, p0, Lnet/simonvt/numberpicker/NumberPicker;->mTopSelectionDividerTop:I

    int-to-float v4, v4

    cmpg-float v3, v3, v4

    if-gez v3, :cond_3

    .line 823
    iget v3, p0, Lnet/simonvt/numberpicker/NumberPicker;->mScrollState:I

    if-nez v3, :cond_2

    .line 824
    iget-object v3, p0, Lnet/simonvt/numberpicker/NumberPicker;->mPressedStateHelper:Lnet/simonvt/numberpicker/NumberPicker$PressedStateHelper;

    const/4 v4, 0x2

    invoke-virtual {v3, v4}, Lnet/simonvt/numberpicker/NumberPicker$PressedStateHelper;->buttonPressDelayed(I)V

    .line 834
    :cond_2
    :goto_1
    invoke-virtual {p0}, Lnet/simonvt/numberpicker/NumberPicker;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    invoke-interface {v3, v1}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 835
    iget-object v3, p0, Lnet/simonvt/numberpicker/NumberPicker;->mFlingScroller:Lnet/simonvt/numberpicker/Scroller;

    invoke-virtual {v3}, Lnet/simonvt/numberpicker/Scroller;->isFinished()Z

    move-result v3

    if-nez v3, :cond_4

    .line 836
    iget-object v3, p0, Lnet/simonvt/numberpicker/NumberPicker;->mFlingScroller:Lnet/simonvt/numberpicker/Scroller;

    invoke-virtual {v3, v1}, Lnet/simonvt/numberpicker/Scroller;->forceFinished(Z)V

    .line 837
    iget-object v3, p0, Lnet/simonvt/numberpicker/NumberPicker;->mAdjustScroller:Lnet/simonvt/numberpicker/Scroller;

    invoke-virtual {v3, v1}, Lnet/simonvt/numberpicker/Scroller;->forceFinished(Z)V

    .line 838
    invoke-direct {p0, v2}, Lnet/simonvt/numberpicker/NumberPicker;->onScrollStateChange(I)V

    goto :goto_0

    .line 827
    :cond_3
    iget v3, p0, Lnet/simonvt/numberpicker/NumberPicker;->mLastDownEventY:F

    iget v4, p0, Lnet/simonvt/numberpicker/NumberPicker;->mBottomSelectionDividerBottom:I

    int-to-float v4, v4

    cmpl-float v3, v3, v4

    if-lez v3, :cond_2

    .line 828
    iget v3, p0, Lnet/simonvt/numberpicker/NumberPicker;->mScrollState:I

    if-nez v3, :cond_2

    .line 829
    iget-object v3, p0, Lnet/simonvt/numberpicker/NumberPicker;->mPressedStateHelper:Lnet/simonvt/numberpicker/NumberPicker$PressedStateHelper;

    invoke-virtual {v3, v1}, Lnet/simonvt/numberpicker/NumberPicker$PressedStateHelper;->buttonPressDelayed(I)V

    goto :goto_1

    .line 839
    :cond_4
    iget-object v3, p0, Lnet/simonvt/numberpicker/NumberPicker;->mAdjustScroller:Lnet/simonvt/numberpicker/Scroller;

    invoke-virtual {v3}, Lnet/simonvt/numberpicker/Scroller;->isFinished()Z

    move-result v3

    if-nez v3, :cond_5

    .line 840
    iget-object v2, p0, Lnet/simonvt/numberpicker/NumberPicker;->mFlingScroller:Lnet/simonvt/numberpicker/Scroller;

    invoke-virtual {v2, v1}, Lnet/simonvt/numberpicker/Scroller;->forceFinished(Z)V

    .line 841
    iget-object v2, p0, Lnet/simonvt/numberpicker/NumberPicker;->mAdjustScroller:Lnet/simonvt/numberpicker/Scroller;

    invoke-virtual {v2, v1}, Lnet/simonvt/numberpicker/Scroller;->forceFinished(Z)V

    goto :goto_0

    .line 842
    :cond_5
    iget v3, p0, Lnet/simonvt/numberpicker/NumberPicker;->mLastDownEventY:F

    iget v4, p0, Lnet/simonvt/numberpicker/NumberPicker;->mTopSelectionDividerTop:I

    int-to-float v4, v4

    cmpg-float v3, v3, v4

    if-gez v3, :cond_6

    .line 843
    invoke-direct {p0}, Lnet/simonvt/numberpicker/NumberPicker;->hideSoftInput()V

    .line 845
    invoke-static {}, Landroid/view/ViewConfiguration;->getLongPressTimeout()I

    move-result v3

    int-to-long v4, v3

    .line 844
    invoke-direct {p0, v2, v4, v5}, Lnet/simonvt/numberpicker/NumberPicker;->postChangeCurrentByOneFromLongPress(ZJ)V

    goto/16 :goto_0

    .line 846
    :cond_6
    iget v2, p0, Lnet/simonvt/numberpicker/NumberPicker;->mLastDownEventY:F

    iget v3, p0, Lnet/simonvt/numberpicker/NumberPicker;->mBottomSelectionDividerBottom:I

    int-to-float v3, v3

    cmpl-float v2, v2, v3

    if-lez v2, :cond_7

    .line 847
    invoke-direct {p0}, Lnet/simonvt/numberpicker/NumberPicker;->hideSoftInput()V

    .line 849
    invoke-static {}, Landroid/view/ViewConfiguration;->getLongPressTimeout()I

    move-result v2

    int-to-long v2, v2

    .line 848
    invoke-direct {p0, v1, v2, v3}, Lnet/simonvt/numberpicker/NumberPicker;->postChangeCurrentByOneFromLongPress(ZJ)V

    goto/16 :goto_0

    .line 851
    :cond_7
    iput-boolean v1, p0, Lnet/simonvt/numberpicker/NumberPicker;->mShowSoftInputOnTap:Z

    .line 852
    invoke-direct {p0}, Lnet/simonvt/numberpicker/NumberPicker;->postBeginSoftInputOnLongPressCommand()V

    goto/16 :goto_0

    .line 813
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method protected onLayout(ZIIII)V
    .locals 10
    .param p1, "changed"    # Z
    .param p2, "left"    # I
    .param p3, "top"    # I
    .param p4, "right"    # I
    .param p5, "bottom"    # I

    .prologue
    .line 734
    iget-boolean v8, p0, Lnet/simonvt/numberpicker/NumberPicker;->mHasSelectorWheel:Z

    if-nez v8, :cond_1

    .line 735
    invoke-super/range {p0 .. p5}, Landroid/widget/LinearLayout;->onLayout(ZIIII)V

    .line 759
    :cond_0
    :goto_0
    return-void

    .line 738
    :cond_1
    invoke-virtual {p0}, Lnet/simonvt/numberpicker/NumberPicker;->getMeasuredWidth()I

    move-result v7

    .line 739
    .local v7, "msrdWdth":I
    invoke-virtual {p0}, Lnet/simonvt/numberpicker/NumberPicker;->getMeasuredHeight()I

    move-result v6

    .line 742
    .local v6, "msrdHght":I
    iget-object v8, p0, Lnet/simonvt/numberpicker/NumberPicker;->mInputText:Landroid/widget/EditText;

    invoke-virtual {v8}, Landroid/widget/EditText;->getMeasuredWidth()I

    move-result v3

    .line 743
    .local v3, "inptTxtMsrdWdth":I
    iget-object v8, p0, Lnet/simonvt/numberpicker/NumberPicker;->mInputText:Landroid/widget/EditText;

    invoke-virtual {v8}, Landroid/widget/EditText;->getMeasuredHeight()I

    move-result v2

    .line 744
    .local v2, "inptTxtMsrdHght":I
    sub-int v8, v7, v3

    div-int/lit8 v1, v8, 0x2

    .line 745
    .local v1, "inptTxtLeft":I
    sub-int v8, v6, v2

    div-int/lit8 v5, v8, 0x2

    .line 746
    .local v5, "inptTxtTop":I
    add-int v4, v1, v3

    .line 747
    .local v4, "inptTxtRight":I
    add-int v0, v5, v2

    .line 748
    .local v0, "inptTxtBottom":I
    iget-object v8, p0, Lnet/simonvt/numberpicker/NumberPicker;->mInputText:Landroid/widget/EditText;

    invoke-virtual {v8, v1, v5, v4, v0}, Landroid/widget/EditText;->layout(IIII)V

    .line 750
    if-eqz p1, :cond_0

    .line 752
    invoke-direct {p0}, Lnet/simonvt/numberpicker/NumberPicker;->initializeSelectorWheel()V

    .line 753
    invoke-direct {p0}, Lnet/simonvt/numberpicker/NumberPicker;->initializeFadingEdges()V

    .line 754
    invoke-virtual {p0}, Lnet/simonvt/numberpicker/NumberPicker;->getHeight()I

    move-result v8

    iget v9, p0, Lnet/simonvt/numberpicker/NumberPicker;->mSelectionDividersDistance:I

    sub-int/2addr v8, v9

    div-int/lit8 v8, v8, 0x2

    iget v9, p0, Lnet/simonvt/numberpicker/NumberPicker;->mSelectionDividerHeight:I

    sub-int/2addr v8, v9

    iput v8, p0, Lnet/simonvt/numberpicker/NumberPicker;->mTopSelectionDividerTop:I

    .line 756
    iget v8, p0, Lnet/simonvt/numberpicker/NumberPicker;->mTopSelectionDividerTop:I

    iget v9, p0, Lnet/simonvt/numberpicker/NumberPicker;->mSelectionDividerHeight:I

    mul-int/lit8 v9, v9, 0x2

    add-int/2addr v8, v9

    iget v9, p0, Lnet/simonvt/numberpicker/NumberPicker;->mSelectionDividersDistance:I

    add-int/2addr v8, v9

    iput v8, p0, Lnet/simonvt/numberpicker/NumberPicker;->mBottomSelectionDividerBottom:I

    goto :goto_0
.end method

.method protected onMeasure(II)V
    .locals 6
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    .line 763
    iget-boolean v4, p0, Lnet/simonvt/numberpicker/NumberPicker;->mHasSelectorWheel:Z

    if-nez v4, :cond_0

    .line 764
    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->onMeasure(II)V

    .line 777
    :goto_0
    return-void

    .line 768
    :cond_0
    iget v4, p0, Lnet/simonvt/numberpicker/NumberPicker;->mMaxWidth:I

    invoke-direct {p0, p1, v4}, Lnet/simonvt/numberpicker/NumberPicker;->makeMeasureSpec(II)I

    move-result v2

    .line 769
    .local v2, "newWidthMeasureSpec":I
    iget v4, p0, Lnet/simonvt/numberpicker/NumberPicker;->mMaxHeight:I

    invoke-direct {p0, p2, v4}, Lnet/simonvt/numberpicker/NumberPicker;->makeMeasureSpec(II)I

    move-result v1

    .line 770
    .local v1, "newHeightMeasureSpec":I
    invoke-super {p0, v2, v1}, Landroid/widget/LinearLayout;->onMeasure(II)V

    .line 772
    iget v4, p0, Lnet/simonvt/numberpicker/NumberPicker;->mMinWidth:I

    invoke-virtual {p0}, Lnet/simonvt/numberpicker/NumberPicker;->getMeasuredWidth()I

    move-result v5

    invoke-direct {p0, v4, v5, p1}, Lnet/simonvt/numberpicker/NumberPicker;->resolveSizeAndStateRespectingMinSize(III)I

    move-result v3

    .line 774
    .local v3, "widthSize":I
    iget v4, p0, Lnet/simonvt/numberpicker/NumberPicker;->mMinHeight:I

    invoke-virtual {p0}, Lnet/simonvt/numberpicker/NumberPicker;->getMeasuredHeight()I

    move-result v5

    invoke-direct {p0, v4, v5, p2}, Lnet/simonvt/numberpicker/NumberPicker;->resolveSizeAndStateRespectingMinSize(III)I

    move-result v0

    .line 776
    .local v0, "heightSize":I
    invoke-virtual {p0, v3, v0}, Lnet/simonvt/numberpicker/NumberPicker;->setMeasuredDimension(II)V

    goto :goto_0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 18
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 862
    invoke-virtual/range {p0 .. p0}, Lnet/simonvt/numberpicker/NumberPicker;->isEnabled()Z

    move-result v14

    if-eqz v14, :cond_0

    move-object/from16 v0, p0

    iget-boolean v14, v0, Lnet/simonvt/numberpicker/NumberPicker;->mHasSelectorWheel:Z

    if-nez v14, :cond_1

    .line 863
    :cond_0
    const/4 v14, 0x0

    .line 930
    :goto_0
    return v14

    .line 865
    :cond_1
    move-object/from16 v0, p0

    iget-object v14, v0, Lnet/simonvt/numberpicker/NumberPicker;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-nez v14, :cond_2

    .line 866
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object v14

    move-object/from16 v0, p0

    iput-object v14, v0, Lnet/simonvt/numberpicker/NumberPicker;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 868
    :cond_2
    move-object/from16 v0, p0

    iget-object v14, v0, Lnet/simonvt/numberpicker/NumberPicker;->mVelocityTracker:Landroid/view/VelocityTracker;

    move-object/from16 v0, p1

    invoke-virtual {v14, v0}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 869
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v14

    and-int/lit16 v2, v14, 0xff

    .line 870
    .local v2, "action":I
    packed-switch v2, :pswitch_data_0

    .line 930
    :cond_3
    :goto_1
    const/4 v14, 0x1

    goto :goto_0

    .line 872
    :pswitch_0
    move-object/from16 v0, p0

    iget-boolean v14, v0, Lnet/simonvt/numberpicker/NumberPicker;->mIngonreMoveEvents:Z

    if-nez v14, :cond_3

    .line 875
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    .line 876
    .local v3, "currentMoveY":F
    move-object/from16 v0, p0

    iget v14, v0, Lnet/simonvt/numberpicker/NumberPicker;->mScrollState:I

    const/4 v15, 0x1

    if-eq v14, v15, :cond_5

    .line 877
    move-object/from16 v0, p0

    iget v14, v0, Lnet/simonvt/numberpicker/NumberPicker;->mLastDownEventY:F

    sub-float v14, v3, v14

    invoke-static {v14}, Ljava/lang/Math;->abs(F)F

    move-result v14

    float-to-int v4, v14

    .line 878
    .local v4, "deltaDownY":I
    move-object/from16 v0, p0

    iget v14, v0, Lnet/simonvt/numberpicker/NumberPicker;->mTouchSlop:I

    if-le v4, v14, :cond_4

    .line 879
    invoke-direct/range {p0 .. p0}, Lnet/simonvt/numberpicker/NumberPicker;->removeAllCallbacks()V

    .line 880
    const/4 v14, 0x1

    move-object/from16 v0, p0

    invoke-direct {v0, v14}, Lnet/simonvt/numberpicker/NumberPicker;->onScrollStateChange(I)V

    .line 887
    .end local v4    # "deltaDownY":I
    :cond_4
    :goto_2
    move-object/from16 v0, p0

    iput v3, v0, Lnet/simonvt/numberpicker/NumberPicker;->mLastDownOrMoveEventY:F

    goto :goto_1

    .line 883
    :cond_5
    move-object/from16 v0, p0

    iget v14, v0, Lnet/simonvt/numberpicker/NumberPicker;->mLastDownOrMoveEventY:F

    sub-float v14, v3, v14

    float-to-int v5, v14

    .line 884
    .local v5, "deltaMoveY":I
    const/4 v14, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v14, v5}, Lnet/simonvt/numberpicker/NumberPicker;->scrollBy(II)V

    .line 885
    invoke-virtual/range {p0 .. p0}, Lnet/simonvt/numberpicker/NumberPicker;->invalidate()V

    goto :goto_2

    .line 890
    .end local v3    # "currentMoveY":F
    .end local v5    # "deltaMoveY":I
    :pswitch_1
    invoke-direct/range {p0 .. p0}, Lnet/simonvt/numberpicker/NumberPicker;->removeBeginSoftInputCommand()V

    .line 891
    invoke-direct/range {p0 .. p0}, Lnet/simonvt/numberpicker/NumberPicker;->removeChangeCurrentByOneFromLongPress()V

    .line 892
    move-object/from16 v0, p0

    iget-object v14, v0, Lnet/simonvt/numberpicker/NumberPicker;->mPressedStateHelper:Lnet/simonvt/numberpicker/NumberPicker$PressedStateHelper;

    invoke-virtual {v14}, Lnet/simonvt/numberpicker/NumberPicker$PressedStateHelper;->cancel()V

    .line 893
    move-object/from16 v0, p0

    iget-object v11, v0, Lnet/simonvt/numberpicker/NumberPicker;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 894
    .local v11, "velocityTracker":Landroid/view/VelocityTracker;
    const/16 v14, 0x3e8

    move-object/from16 v0, p0

    iget v15, v0, Lnet/simonvt/numberpicker/NumberPicker;->mMaximumFlingVelocity:I

    int-to-float v15, v15

    invoke-virtual {v11, v14, v15}, Landroid/view/VelocityTracker;->computeCurrentVelocity(IF)V

    .line 895
    invoke-virtual {v11}, Landroid/view/VelocityTracker;->getYVelocity()F

    move-result v14

    float-to-int v9, v14

    .line 896
    .local v9, "initialVelocity":I
    invoke-static {v9}, Ljava/lang/Math;->abs(I)I

    move-result v14

    move-object/from16 v0, p0

    iget v15, v0, Lnet/simonvt/numberpicker/NumberPicker;->mMinimumFlingVelocity:I

    if-le v14, v15, :cond_6

    .line 897
    move-object/from16 v0, p0

    invoke-direct {v0, v9}, Lnet/simonvt/numberpicker/NumberPicker;->fling(I)V

    .line 898
    const/4 v14, 0x2

    move-object/from16 v0, p0

    invoke-direct {v0, v14}, Lnet/simonvt/numberpicker/NumberPicker;->onScrollStateChange(I)V

    .line 926
    :goto_3
    move-object/from16 v0, p0

    iget-object v14, v0, Lnet/simonvt/numberpicker/NumberPicker;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v14}, Landroid/view/VelocityTracker;->recycle()V

    .line 927
    const/4 v14, 0x0

    move-object/from16 v0, p0

    iput-object v14, v0, Lnet/simonvt/numberpicker/NumberPicker;->mVelocityTracker:Landroid/view/VelocityTracker;

    goto/16 :goto_1

    .line 900
    :cond_6
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getY()F

    move-result v14

    float-to-int v8, v14

    .line 901
    .local v8, "eventY":I
    int-to-float v14, v8

    move-object/from16 v0, p0

    iget v15, v0, Lnet/simonvt/numberpicker/NumberPicker;->mLastDownEventY:F

    sub-float/2addr v14, v15

    invoke-static {v14}, Ljava/lang/Math;->abs(F)F

    move-result v14

    float-to-int v5, v14

    .line 902
    .restart local v5    # "deltaMoveY":I
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v14

    move-object/from16 v0, p0

    iget-wide v0, v0, Lnet/simonvt/numberpicker/NumberPicker;->mLastDownEventTime:J

    move-wide/from16 v16, v0

    sub-long v6, v14, v16

    .line 903
    .local v6, "deltaTime":J
    invoke-static {}, Landroid/view/ViewConfiguration;->getTapTimeout()I

    move-result v14

    int-to-long v12, v14

    .line 904
    .local v12, "tapTimeout":J
    move-object/from16 v0, p0

    iget v14, v0, Lnet/simonvt/numberpicker/NumberPicker;->mTouchSlop:I

    if-gt v5, v14, :cond_a

    .line 905
    move-object/from16 v0, p0

    iget-boolean v14, v0, Lnet/simonvt/numberpicker/NumberPicker;->mShowSoftInputOnTap:Z

    if-eqz v14, :cond_8

    .line 906
    const/4 v14, 0x0

    move-object/from16 v0, p0

    iput-boolean v14, v0, Lnet/simonvt/numberpicker/NumberPicker;->mShowSoftInputOnTap:Z

    .line 907
    invoke-direct/range {p0 .. p0}, Lnet/simonvt/numberpicker/NumberPicker;->showSoftInput()V

    .line 924
    :cond_7
    :goto_4
    const/4 v14, 0x0

    move-object/from16 v0, p0

    invoke-direct {v0, v14}, Lnet/simonvt/numberpicker/NumberPicker;->onScrollStateChange(I)V

    goto :goto_3

    .line 909
    :cond_8
    move-object/from16 v0, p0

    iget v14, v0, Lnet/simonvt/numberpicker/NumberPicker;->mSelectorElementHeight:I

    div-int v14, v8, v14

    add-int/lit8 v10, v14, -0x1

    .line 911
    .local v10, "selectorIndexOffset":I
    if-lez v10, :cond_9

    .line 912
    const/4 v14, 0x1

    move-object/from16 v0, p0

    invoke-direct {v0, v14}, Lnet/simonvt/numberpicker/NumberPicker;->changeValueByOne(Z)V

    .line 913
    move-object/from16 v0, p0

    iget-object v14, v0, Lnet/simonvt/numberpicker/NumberPicker;->mPressedStateHelper:Lnet/simonvt/numberpicker/NumberPicker$PressedStateHelper;

    const/4 v15, 0x1

    invoke-virtual {v14, v15}, Lnet/simonvt/numberpicker/NumberPicker$PressedStateHelper;->buttonTapped(I)V

    goto :goto_4

    .line 915
    :cond_9
    if-gez v10, :cond_7

    .line 916
    const/4 v14, 0x0

    move-object/from16 v0, p0

    invoke-direct {v0, v14}, Lnet/simonvt/numberpicker/NumberPicker;->changeValueByOne(Z)V

    .line 917
    move-object/from16 v0, p0

    iget-object v14, v0, Lnet/simonvt/numberpicker/NumberPicker;->mPressedStateHelper:Lnet/simonvt/numberpicker/NumberPicker$PressedStateHelper;

    const/4 v15, 0x2

    invoke-virtual {v14, v15}, Lnet/simonvt/numberpicker/NumberPicker$PressedStateHelper;->buttonTapped(I)V

    goto :goto_4

    .line 922
    .end local v10    # "selectorIndexOffset":I
    :cond_a
    invoke-direct/range {p0 .. p0}, Lnet/simonvt/numberpicker/NumberPicker;->ensureScrollWheelAdjusted()Z

    goto :goto_4

    .line 870
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public scrollBy(II)V
    .locals 4
    .param p1, "x"    # I
    .param p2, "y"    # I

    .prologue
    const/4 v3, 0x1

    .line 1081
    iget-object v0, p0, Lnet/simonvt/numberpicker/NumberPicker;->mSelectorIndices:[I

    .line 1082
    .local v0, "selectorIndices":[I
    iget-boolean v1, p0, Lnet/simonvt/numberpicker/NumberPicker;->mWrapSelectorWheel:Z

    if-nez v1, :cond_1

    if-lez p2, :cond_1

    aget v1, v0, v3

    iget v2, p0, Lnet/simonvt/numberpicker/NumberPicker;->mMinValue:I

    if-gt v1, v2, :cond_1

    .line 1084
    iget v1, p0, Lnet/simonvt/numberpicker/NumberPicker;->mInitialScrollOffset:I

    iput v1, p0, Lnet/simonvt/numberpicker/NumberPicker;->mCurrentScrollOffset:I

    .line 1109
    :cond_0
    :goto_0
    return-void

    .line 1087
    :cond_1
    iget-boolean v1, p0, Lnet/simonvt/numberpicker/NumberPicker;->mWrapSelectorWheel:Z

    if-nez v1, :cond_2

    if-gez p2, :cond_2

    aget v1, v0, v3

    iget v2, p0, Lnet/simonvt/numberpicker/NumberPicker;->mMaxValue:I

    if-lt v1, v2, :cond_2

    .line 1089
    iget v1, p0, Lnet/simonvt/numberpicker/NumberPicker;->mInitialScrollOffset:I

    iput v1, p0, Lnet/simonvt/numberpicker/NumberPicker;->mCurrentScrollOffset:I

    goto :goto_0

    .line 1092
    :cond_2
    iget v1, p0, Lnet/simonvt/numberpicker/NumberPicker;->mCurrentScrollOffset:I

    add-int/2addr v1, p2

    iput v1, p0, Lnet/simonvt/numberpicker/NumberPicker;->mCurrentScrollOffset:I

    .line 1093
    :cond_3
    :goto_1
    iget v1, p0, Lnet/simonvt/numberpicker/NumberPicker;->mCurrentScrollOffset:I

    iget v2, p0, Lnet/simonvt/numberpicker/NumberPicker;->mInitialScrollOffset:I

    sub-int/2addr v1, v2

    iget v2, p0, Lnet/simonvt/numberpicker/NumberPicker;->mSelectorTextGapHeight:I

    if-le v1, v2, :cond_4

    .line 1094
    iget v1, p0, Lnet/simonvt/numberpicker/NumberPicker;->mCurrentScrollOffset:I

    iget v2, p0, Lnet/simonvt/numberpicker/NumberPicker;->mSelectorElementHeight:I

    sub-int/2addr v1, v2

    iput v1, p0, Lnet/simonvt/numberpicker/NumberPicker;->mCurrentScrollOffset:I

    .line 1095
    invoke-direct {p0, v0}, Lnet/simonvt/numberpicker/NumberPicker;->decrementSelectorIndices([I)V

    .line 1096
    aget v1, v0, v3

    invoke-direct {p0, v1, v3}, Lnet/simonvt/numberpicker/NumberPicker;->setValueInternal(IZ)V

    .line 1097
    iget-boolean v1, p0, Lnet/simonvt/numberpicker/NumberPicker;->mWrapSelectorWheel:Z

    if-nez v1, :cond_3

    aget v1, v0, v3

    iget v2, p0, Lnet/simonvt/numberpicker/NumberPicker;->mMinValue:I

    if-gt v1, v2, :cond_3

    .line 1098
    iget v1, p0, Lnet/simonvt/numberpicker/NumberPicker;->mInitialScrollOffset:I

    iput v1, p0, Lnet/simonvt/numberpicker/NumberPicker;->mCurrentScrollOffset:I

    goto :goto_1

    .line 1101
    :cond_4
    :goto_2
    iget v1, p0, Lnet/simonvt/numberpicker/NumberPicker;->mCurrentScrollOffset:I

    iget v2, p0, Lnet/simonvt/numberpicker/NumberPicker;->mInitialScrollOffset:I

    sub-int/2addr v1, v2

    iget v2, p0, Lnet/simonvt/numberpicker/NumberPicker;->mSelectorTextGapHeight:I

    neg-int v2, v2

    if-ge v1, v2, :cond_0

    .line 1102
    iget v1, p0, Lnet/simonvt/numberpicker/NumberPicker;->mCurrentScrollOffset:I

    iget v2, p0, Lnet/simonvt/numberpicker/NumberPicker;->mSelectorElementHeight:I

    add-int/2addr v1, v2

    iput v1, p0, Lnet/simonvt/numberpicker/NumberPicker;->mCurrentScrollOffset:I

    .line 1103
    invoke-direct {p0, v0}, Lnet/simonvt/numberpicker/NumberPicker;->incrementSelectorIndices([I)V

    .line 1104
    aget v1, v0, v3

    invoke-direct {p0, v1, v3}, Lnet/simonvt/numberpicker/NumberPicker;->setValueInternal(IZ)V

    .line 1105
    iget-boolean v1, p0, Lnet/simonvt/numberpicker/NumberPicker;->mWrapSelectorWheel:Z

    if-nez v1, :cond_4

    aget v1, v0, v3

    iget v2, p0, Lnet/simonvt/numberpicker/NumberPicker;->mMaxValue:I

    if-lt v1, v2, :cond_4

    .line 1106
    iget v1, p0, Lnet/simonvt/numberpicker/NumberPicker;->mInitialScrollOffset:I

    iput v1, p0, Lnet/simonvt/numberpicker/NumberPicker;->mCurrentScrollOffset:I

    goto :goto_2
.end method

.method public setDisplayedValues([Ljava/lang/String;)V
    .locals 2
    .param p1, "displayedValues"    # [Ljava/lang/String;

    .prologue
    .line 1410
    iget-object v0, p0, Lnet/simonvt/numberpicker/NumberPicker;->mDisplayedValues:[Ljava/lang/String;

    if-ne v0, p1, :cond_0

    .line 1424
    :goto_0
    return-void

    .line 1413
    :cond_0
    iput-object p1, p0, Lnet/simonvt/numberpicker/NumberPicker;->mDisplayedValues:[Ljava/lang/String;

    .line 1414
    iget-object v0, p0, Lnet/simonvt/numberpicker/NumberPicker;->mDisplayedValues:[Ljava/lang/String;

    if-eqz v0, :cond_1

    .line 1416
    iget-object v0, p0, Lnet/simonvt/numberpicker/NumberPicker;->mInputText:Landroid/widget/EditText;

    const v1, 0x80001

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setRawInputType(I)V

    .line 1421
    :goto_1
    invoke-direct {p0}, Lnet/simonvt/numberpicker/NumberPicker;->updateInputTextView()Z

    .line 1422
    invoke-direct {p0}, Lnet/simonvt/numberpicker/NumberPicker;->initializeSelectorWheelIndices()V

    .line 1423
    invoke-direct {p0}, Lnet/simonvt/numberpicker/NumberPicker;->tryComputeMaxWidth()V

    goto :goto_0

    .line 1419
    :cond_1
    iget-object v0, p0, Lnet/simonvt/numberpicker/NumberPicker;->mInputText:Landroid/widget/EditText;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setRawInputType(I)V

    goto :goto_1
.end method

.method public setEnabled(Z)V
    .locals 1
    .param p1, "enabled"    # Z

    .prologue
    .line 1069
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->setEnabled(Z)V

    .line 1070
    iget-boolean v0, p0, Lnet/simonvt/numberpicker/NumberPicker;->mHasSelectorWheel:Z

    if-nez v0, :cond_0

    .line 1071
    iget-object v0, p0, Lnet/simonvt/numberpicker/NumberPicker;->mIncrementButton:Landroid/widget/ImageButton;

    invoke-virtual {v0, p1}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 1073
    :cond_0
    iget-boolean v0, p0, Lnet/simonvt/numberpicker/NumberPicker;->mHasSelectorWheel:Z

    if-nez v0, :cond_1

    .line 1074
    iget-object v0, p0, Lnet/simonvt/numberpicker/NumberPicker;->mDecrementButton:Landroid/widget/ImageButton;

    invoke-virtual {v0, p1}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 1076
    :cond_1
    iget-object v0, p0, Lnet/simonvt/numberpicker/NumberPicker;->mInputText:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setEnabled(Z)V

    .line 1077
    return-void
.end method

.method public setFormatter(Lnet/simonvt/numberpicker/NumberPicker$Formatter;)V
    .locals 1
    .param p1, "formatter"    # Lnet/simonvt/numberpicker/NumberPicker$Formatter;

    .prologue
    .line 1146
    iget-object v0, p0, Lnet/simonvt/numberpicker/NumberPicker;->mFormatter:Lnet/simonvt/numberpicker/NumberPicker$Formatter;

    if-ne p1, v0, :cond_0

    .line 1152
    :goto_0
    return-void

    .line 1149
    :cond_0
    iput-object p1, p0, Lnet/simonvt/numberpicker/NumberPicker;->mFormatter:Lnet/simonvt/numberpicker/NumberPicker$Formatter;

    .line 1150
    invoke-direct {p0}, Lnet/simonvt/numberpicker/NumberPicker;->initializeSelectorWheelIndices()V

    .line 1151
    invoke-direct {p0}, Lnet/simonvt/numberpicker/NumberPicker;->updateInputTextView()Z

    goto :goto_0
.end method

.method public setMaxValue(I)V
    .locals 3
    .param p1, "maxValue"    # I

    .prologue
    .line 1373
    iget v1, p0, Lnet/simonvt/numberpicker/NumberPicker;->mMaxValue:I

    if-ne v1, p1, :cond_0

    .line 1389
    :goto_0
    return-void

    .line 1376
    :cond_0
    if-gez p1, :cond_1

    .line 1377
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "maxValue must be >= 0"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1379
    :cond_1
    iput p1, p0, Lnet/simonvt/numberpicker/NumberPicker;->mMaxValue:I

    .line 1380
    iget v1, p0, Lnet/simonvt/numberpicker/NumberPicker;->mMaxValue:I

    iget v2, p0, Lnet/simonvt/numberpicker/NumberPicker;->mValue:I

    if-ge v1, v2, :cond_2

    .line 1381
    iget v1, p0, Lnet/simonvt/numberpicker/NumberPicker;->mMaxValue:I

    iput v1, p0, Lnet/simonvt/numberpicker/NumberPicker;->mValue:I

    .line 1383
    :cond_2
    iget v1, p0, Lnet/simonvt/numberpicker/NumberPicker;->mMaxValue:I

    iget v2, p0, Lnet/simonvt/numberpicker/NumberPicker;->mMinValue:I

    sub-int/2addr v1, v2

    iget-object v2, p0, Lnet/simonvt/numberpicker/NumberPicker;->mSelectorIndices:[I

    array-length v2, v2

    if-le v1, v2, :cond_3

    const/4 v0, 0x1

    .line 1384
    .local v0, "wrapSelectorWheel":Z
    :goto_1
    invoke-virtual {p0, v0}, Lnet/simonvt/numberpicker/NumberPicker;->setWrapSelectorWheel(Z)V

    .line 1385
    invoke-direct {p0}, Lnet/simonvt/numberpicker/NumberPicker;->initializeSelectorWheelIndices()V

    .line 1386
    invoke-direct {p0}, Lnet/simonvt/numberpicker/NumberPicker;->updateInputTextView()Z

    .line 1387
    invoke-direct {p0}, Lnet/simonvt/numberpicker/NumberPicker;->tryComputeMaxWidth()V

    .line 1388
    invoke-virtual {p0}, Lnet/simonvt/numberpicker/NumberPicker;->invalidate()V

    goto :goto_0

    .line 1383
    .end local v0    # "wrapSelectorWheel":Z
    :cond_3
    const/4 v0, 0x0

    goto :goto_1
.end method

.method public setMinValue(I)V
    .locals 3
    .param p1, "minValue"    # I

    .prologue
    .line 1335
    iget v1, p0, Lnet/simonvt/numberpicker/NumberPicker;->mMinValue:I

    if-ne v1, p1, :cond_0

    .line 1351
    :goto_0
    return-void

    .line 1338
    :cond_0
    if-gez p1, :cond_1

    .line 1339
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "minValue must be >= 0"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1341
    :cond_1
    iput p1, p0, Lnet/simonvt/numberpicker/NumberPicker;->mMinValue:I

    .line 1342
    iget v1, p0, Lnet/simonvt/numberpicker/NumberPicker;->mMinValue:I

    iget v2, p0, Lnet/simonvt/numberpicker/NumberPicker;->mValue:I

    if-le v1, v2, :cond_2

    .line 1343
    iget v1, p0, Lnet/simonvt/numberpicker/NumberPicker;->mMinValue:I

    iput v1, p0, Lnet/simonvt/numberpicker/NumberPicker;->mValue:I

    .line 1345
    :cond_2
    iget v1, p0, Lnet/simonvt/numberpicker/NumberPicker;->mMaxValue:I

    iget v2, p0, Lnet/simonvt/numberpicker/NumberPicker;->mMinValue:I

    sub-int/2addr v1, v2

    iget-object v2, p0, Lnet/simonvt/numberpicker/NumberPicker;->mSelectorIndices:[I

    array-length v2, v2

    if-le v1, v2, :cond_3

    const/4 v0, 0x1

    .line 1346
    .local v0, "wrapSelectorWheel":Z
    :goto_1
    invoke-virtual {p0, v0}, Lnet/simonvt/numberpicker/NumberPicker;->setWrapSelectorWheel(Z)V

    .line 1347
    invoke-direct {p0}, Lnet/simonvt/numberpicker/NumberPicker;->initializeSelectorWheelIndices()V

    .line 1348
    invoke-direct {p0}, Lnet/simonvt/numberpicker/NumberPicker;->updateInputTextView()Z

    .line 1349
    invoke-direct {p0}, Lnet/simonvt/numberpicker/NumberPicker;->tryComputeMaxWidth()V

    .line 1350
    invoke-virtual {p0}, Lnet/simonvt/numberpicker/NumberPicker;->invalidate()V

    goto :goto_0

    .line 1345
    .end local v0    # "wrapSelectorWheel":Z
    :cond_3
    const/4 v0, 0x0

    goto :goto_1
.end method

.method public setOnLongPressUpdateInterval(J)V
    .locals 1
    .param p1, "intervalMillis"    # J

    .prologue
    .line 1303
    iput-wide p1, p0, Lnet/simonvt/numberpicker/NumberPicker;->mLongPressUpdateInterval:J

    .line 1304
    return-void
.end method

.method public setOnScrollListener(Lnet/simonvt/numberpicker/NumberPicker$OnScrollListener;)V
    .locals 0
    .param p1, "onScrollListener"    # Lnet/simonvt/numberpicker/NumberPicker$OnScrollListener;

    .prologue
    .line 1131
    iput-object p1, p0, Lnet/simonvt/numberpicker/NumberPicker;->mOnScrollListener:Lnet/simonvt/numberpicker/NumberPicker$OnScrollListener;

    .line 1132
    return-void
.end method

.method public setOnValueChangedListener(Lnet/simonvt/numberpicker/NumberPicker$OnValueChangeListener;)V
    .locals 0
    .param p1, "onValueChangedListener"    # Lnet/simonvt/numberpicker/NumberPicker$OnValueChangeListener;

    .prologue
    .line 1122
    iput-object p1, p0, Lnet/simonvt/numberpicker/NumberPicker;->mOnValueChangeListener:Lnet/simonvt/numberpicker/NumberPicker$OnValueChangeListener;

    .line 1123
    return-void
.end method

.method public setValue(I)V
    .locals 1
    .param p1, "value"    # I

    .prologue
    .line 1183
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lnet/simonvt/numberpicker/NumberPicker;->setValueInternal(IZ)V

    .line 1184
    return-void
.end method

.method public setWrapSelectorWheel(Z)V
    .locals 3
    .param p1, "wrapSelectorWheel"    # Z

    .prologue
    .line 1286
    iget v1, p0, Lnet/simonvt/numberpicker/NumberPicker;->mMaxValue:I

    iget v2, p0, Lnet/simonvt/numberpicker/NumberPicker;->mMinValue:I

    sub-int/2addr v1, v2

    iget-object v2, p0, Lnet/simonvt/numberpicker/NumberPicker;->mSelectorIndices:[I

    array-length v2, v2

    if-lt v1, v2, :cond_2

    const/4 v0, 0x1

    .line 1287
    .local v0, "wrappingAllowed":Z
    :goto_0
    if-eqz p1, :cond_0

    if-eqz v0, :cond_1

    :cond_0
    iget-boolean v1, p0, Lnet/simonvt/numberpicker/NumberPicker;->mWrapSelectorWheel:Z

    if-eq p1, v1, :cond_1

    .line 1288
    iput-boolean p1, p0, Lnet/simonvt/numberpicker/NumberPicker;->mWrapSelectorWheel:Z

    .line 1290
    :cond_1
    return-void

    .line 1286
    .end local v0    # "wrappingAllowed":Z
    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method
