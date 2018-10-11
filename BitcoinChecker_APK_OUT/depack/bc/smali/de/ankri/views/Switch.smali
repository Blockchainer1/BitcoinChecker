.class public Lde/ankri/views/Switch;
.super Landroid/widget/CompoundButton;
.source "Switch.java"


# static fields
.field private static final CHECKED_STATE_SET:[I

.field private static final MONOSPACE:I = 0x3

.field private static final SANS:I = 0x1

.field private static final SERIF:I = 0x2

.field private static final TOUCH_MODE_DOWN:I = 0x1

.field private static final TOUCH_MODE_DRAGGING:I = 0x2

.field private static final TOUCH_MODE_IDLE:I


# instance fields
.field private mMinFlingVelocity:I

.field private mOffLayout:Landroid/text/Layout;

.field private mOnLayout:Landroid/text/Layout;

.field private mSwitchBottom:I

.field private mSwitchHeight:I

.field private mSwitchLeft:I

.field private mSwitchMinWidth:I

.field private mSwitchPadding:I

.field private mSwitchRight:I

.field private mSwitchTop:I

.field private mSwitchTransformationMethod:Lde/ankri/text/method/TransformationMethodCompat2;

.field private mSwitchWidth:I

.field private final mTempRect:Landroid/graphics/Rect;

.field private mTextColors:Landroid/content/res/ColorStateList;

.field private mTextOff:Ljava/lang/CharSequence;

.field private mTextOn:Ljava/lang/CharSequence;

.field private mTextPaint:Landroid/text/TextPaint;

.field private mThumbDrawable:Landroid/graphics/drawable/Drawable;

.field private mThumbPosition:F

.field private mThumbTextPadding:I

.field private mThumbWidth:I

.field private mTouchMode:I

.field private mTouchSlop:I

.field private mTouchX:F

.field private mTouchY:F

.field private mTrackDrawable:Landroid/graphics/drawable/Drawable;

.field private mVelocityTracker:Landroid/view/VelocityTracker;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 93
    const/4 v0, 0x1

    new-array v0, v0, [I

    const/4 v1, 0x0

    const v2, 0x10100a0

    aput v2, v0, v1

    sput-object v0, Lde/ankri/views/Switch;->CHECKED_STATE_SET:[I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 103
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lde/ankri/views/Switch;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 104
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 116
    sget v0, Lde/ankri/R$attr;->switchStyle:I

    invoke-direct {p0, p1, p2, v0}, Lde/ankri/views/Switch;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 117
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    const/4 v6, 0x0

    .line 131
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/CompoundButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 71
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object v4

    iput-object v4, p0, Lde/ankri/views/Switch;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 91
    new-instance v4, Landroid/graphics/Rect;

    invoke-direct {v4}, Landroid/graphics/Rect;-><init>()V

    iput-object v4, p0, Lde/ankri/views/Switch;->mTempRect:Landroid/graphics/Rect;

    .line 133
    new-instance v4, Landroid/text/TextPaint;

    const/4 v5, 0x1

    invoke-direct {v4, v5}, Landroid/text/TextPaint;-><init>(I)V

    iput-object v4, p0, Lde/ankri/views/Switch;->mTextPaint:Landroid/text/TextPaint;

    .line 134
    invoke-virtual {p0}, Lde/ankri/views/Switch;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    .line 135
    .local v3, "res":Landroid/content/res/Resources;
    iget-object v4, p0, Lde/ankri/views/Switch;->mTextPaint:Landroid/text/TextPaint;

    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v5

    iget v5, v5, Landroid/util/DisplayMetrics;->density:F

    iput v5, v4, Landroid/text/TextPaint;->density:F

    .line 140
    sget-object v4, Lde/ankri/R$styleable;->Switch:[I

    invoke-virtual {p1, p2, v4, p3, v6}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 142
    .local v0, "a":Landroid/content/res/TypedArray;
    sget v4, Lde/ankri/R$styleable;->Switch_thumb:I

    invoke-virtual {v0, v4}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    iput-object v4, p0, Lde/ankri/views/Switch;->mThumbDrawable:Landroid/graphics/drawable/Drawable;

    .line 143
    sget v4, Lde/ankri/R$styleable;->Switch_track:I

    invoke-virtual {v0, v4}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    iput-object v4, p0, Lde/ankri/views/Switch;->mTrackDrawable:Landroid/graphics/drawable/Drawable;

    .line 144
    sget v4, Lde/ankri/R$styleable;->Switch_textOn:I

    invoke-virtual {v0, v4}, Landroid/content/res/TypedArray;->getText(I)Ljava/lang/CharSequence;

    move-result-object v4

    iput-object v4, p0, Lde/ankri/views/Switch;->mTextOn:Ljava/lang/CharSequence;

    .line 145
    sget v4, Lde/ankri/R$styleable;->Switch_textOff:I

    invoke-virtual {v0, v4}, Landroid/content/res/TypedArray;->getText(I)Ljava/lang/CharSequence;

    move-result-object v4

    iput-object v4, p0, Lde/ankri/views/Switch;->mTextOff:Ljava/lang/CharSequence;

    .line 146
    sget v4, Lde/ankri/R$styleable;->Switch_thumbTextPadding:I

    invoke-virtual {v0, v4, v6}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v4

    iput v4, p0, Lde/ankri/views/Switch;->mThumbTextPadding:I

    .line 147
    sget v4, Lde/ankri/R$styleable;->Switch_switchMinWidth:I

    invoke-virtual {v0, v4, v6}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v4

    iput v4, p0, Lde/ankri/views/Switch;->mSwitchMinWidth:I

    .line 148
    sget v4, Lde/ankri/R$styleable;->Switch_switchPadding:I

    invoke-virtual {v0, v4, v6}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v4

    iput v4, p0, Lde/ankri/views/Switch;->mSwitchPadding:I

    .line 150
    sget v4, Lde/ankri/R$styleable;->Switch_switchTextAppearance:I

    invoke-virtual {v0, v4, v6}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v1

    .line 151
    .local v1, "appearance":I
    if-eqz v1, :cond_0

    .line 153
    invoke-virtual {p0, p1, v1}, Lde/ankri/views/Switch;->setSwitchTextAppearance(Landroid/content/Context;I)V

    .line 155
    :cond_0
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 157
    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v2

    .line 158
    .local v2, "config":Landroid/view/ViewConfiguration;
    invoke-virtual {v2}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result v4

    iput v4, p0, Lde/ankri/views/Switch;->mTouchSlop:I

    .line 159
    invoke-virtual {v2}, Landroid/view/ViewConfiguration;->getScaledMinimumFlingVelocity()I

    move-result v4

    iput v4, p0, Lde/ankri/views/Switch;->mMinFlingVelocity:I

    .line 162
    invoke-virtual {p0}, Lde/ankri/views/Switch;->refreshDrawableState()V

    .line 163
    invoke-virtual {p0}, Lde/ankri/views/Switch;->isChecked()Z

    move-result v4

    invoke-virtual {p0, v4}, Lde/ankri/views/Switch;->setChecked(Z)V

    .line 166
    new-instance v4, Lde/ankri/views/Switch$1;

    invoke-direct {v4, p0}, Lde/ankri/views/Switch$1;-><init>(Lde/ankri/views/Switch;)V

    invoke-virtual {p0, v4}, Lde/ankri/views/Switch;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 175
    return-void
.end method

.method private animateThumbToCheckedState(Z)V
    .locals 0
    .param p1, "newCheckedState"    # Z

    .prologue
    .line 683
    invoke-virtual {p0, p1}, Lde/ankri/views/Switch;->setChecked(Z)V

    .line 684
    return-void
.end method

.method private cancelSuperTouch(Landroid/view/MotionEvent;)V
    .locals 2
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .prologue
    .line 636
    invoke-static {p1}, Landroid/view/MotionEvent;->obtain(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    move-result-object v0

    .line 637
    .local v0, "cancel":Landroid/view/MotionEvent;
    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->setAction(I)V

    .line 638
    invoke-super {p0, v0}, Landroid/widget/CompoundButton;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 639
    invoke-virtual {v0}, Landroid/view/MotionEvent;->recycle()V

    .line 640
    return-void
.end method

.method private getTargetCheckedState()Z
    .locals 2

    .prologue
    .line 688
    iget v0, p0, Lde/ankri/views/Switch;->mThumbPosition:F

    invoke-direct {p0}, Lde/ankri/views/Switch;->getThumbScrollRange()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    int-to-float v1, v1

    cmpl-float v0, v0, v1

    if-ltz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private getThumbScrollRange()I
    .locals 2

    .prologue
    .line 805
    iget-object v0, p0, Lde/ankri/views/Switch;->mTrackDrawable:Landroid/graphics/drawable/Drawable;

    if-nez v0, :cond_0

    .line 807
    const/4 v0, 0x0

    .line 810
    :goto_0
    return v0

    .line 809
    :cond_0
    iget-object v0, p0, Lde/ankri/views/Switch;->mTrackDrawable:Landroid/graphics/drawable/Drawable;

    iget-object v1, p0, Lde/ankri/views/Switch;->mTempRect:Landroid/graphics/Rect;

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->getPadding(Landroid/graphics/Rect;)Z

    .line 810
    iget v0, p0, Lde/ankri/views/Switch;->mSwitchWidth:I

    iget v1, p0, Lde/ankri/views/Switch;->mThumbWidth:I

    sub-int/2addr v0, v1

    iget-object v1, p0, Lde/ankri/views/Switch;->mTempRect:Landroid/graphics/Rect;

    iget v1, v1, Landroid/graphics/Rect;->left:I

    sub-int/2addr v0, v1

    iget-object v1, p0, Lde/ankri/views/Switch;->mTempRect:Landroid/graphics/Rect;

    iget v1, v1, Landroid/graphics/Rect;->right:I

    sub-int/2addr v0, v1

    goto :goto_0
.end method

.method private hitThumb(FF)Z
    .locals 7
    .param p1, "x"    # F
    .param p2, "y"    # F

    .prologue
    .line 549
    iget-object v4, p0, Lde/ankri/views/Switch;->mThumbDrawable:Landroid/graphics/drawable/Drawable;

    iget-object v5, p0, Lde/ankri/views/Switch;->mTempRect:Landroid/graphics/Rect;

    invoke-virtual {v4, v5}, Landroid/graphics/drawable/Drawable;->getPadding(Landroid/graphics/Rect;)Z

    .line 550
    iget v4, p0, Lde/ankri/views/Switch;->mSwitchTop:I

    iget v5, p0, Lde/ankri/views/Switch;->mTouchSlop:I

    sub-int v3, v4, v5

    .line 551
    .local v3, "thumbTop":I
    iget v4, p0, Lde/ankri/views/Switch;->mSwitchLeft:I

    iget v5, p0, Lde/ankri/views/Switch;->mThumbPosition:F

    const/high16 v6, 0x3f000000    # 0.5f

    add-float/2addr v5, v6

    float-to-int v5, v5

    add-int/2addr v4, v5

    iget v5, p0, Lde/ankri/views/Switch;->mTouchSlop:I

    sub-int v1, v4, v5

    .line 552
    .local v1, "thumbLeft":I
    iget v4, p0, Lde/ankri/views/Switch;->mThumbWidth:I

    add-int/2addr v4, v1

    iget-object v5, p0, Lde/ankri/views/Switch;->mTempRect:Landroid/graphics/Rect;

    iget v5, v5, Landroid/graphics/Rect;->left:I

    add-int/2addr v4, v5

    iget-object v5, p0, Lde/ankri/views/Switch;->mTempRect:Landroid/graphics/Rect;

    iget v5, v5, Landroid/graphics/Rect;->right:I

    add-int/2addr v4, v5

    iget v5, p0, Lde/ankri/views/Switch;->mTouchSlop:I

    add-int v2, v4, v5

    .line 553
    .local v2, "thumbRight":I
    iget v4, p0, Lde/ankri/views/Switch;->mSwitchBottom:I

    iget v5, p0, Lde/ankri/views/Switch;->mTouchSlop:I

    add-int v0, v4, v5

    .line 554
    .local v0, "thumbBottom":I
    int-to-float v4, v1

    cmpl-float v4, p1, v4

    if-lez v4, :cond_0

    int-to-float v4, v2

    cmpg-float v4, p1, v4

    if-gez v4, :cond_0

    int-to-float v4, v3

    cmpl-float v4, p2, v4

    if-lez v4, :cond_0

    int-to-float v4, v0

    cmpg-float v4, p2, v4

    if-gez v4, :cond_0

    const/4 v4, 0x1

    :goto_0
    return v4

    :cond_0
    const/4 v4, 0x0

    goto :goto_0
.end method

.method private makeLayout(Ljava/lang/CharSequence;)Landroid/text/Layout;
    .locals 8
    .param p1, "text"    # Ljava/lang/CharSequence;

    .prologue
    .line 540
    iget-object v0, p0, Lde/ankri/views/Switch;->mSwitchTransformationMethod:Lde/ankri/text/method/TransformationMethodCompat2;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lde/ankri/views/Switch;->mSwitchTransformationMethod:Lde/ankri/text/method/TransformationMethodCompat2;

    invoke-interface {v0, p1, p0}, Lde/ankri/text/method/TransformationMethodCompat2;->getTransformation(Ljava/lang/CharSequence;Landroid/view/View;)Ljava/lang/CharSequence;

    move-result-object v1

    .line 541
    .local v1, "transformed":Ljava/lang/CharSequence;
    :goto_0
    new-instance v0, Landroid/text/StaticLayout;

    iget-object v2, p0, Lde/ankri/views/Switch;->mTextPaint:Landroid/text/TextPaint;

    iget-object v3, p0, Lde/ankri/views/Switch;->mTextPaint:Landroid/text/TextPaint;

    invoke-static {v1, v3}, Landroid/text/Layout;->getDesiredWidth(Ljava/lang/CharSequence;Landroid/text/TextPaint;)F

    move-result v3

    invoke-static {v3}, Landroid/util/FloatMath;->ceil(F)F

    move-result v3

    float-to-int v3, v3

    sget-object v4, Landroid/text/Layout$Alignment;->ALIGN_NORMAL:Landroid/text/Layout$Alignment;

    const/high16 v5, 0x3f800000    # 1.0f

    const/4 v6, 0x0

    const/4 v7, 0x1

    invoke-direct/range {v0 .. v7}, Landroid/text/StaticLayout;-><init>(Ljava/lang/CharSequence;Landroid/text/TextPaint;ILandroid/text/Layout$Alignment;FFZ)V

    return-object v0

    .end local v1    # "transformed":Ljava/lang/CharSequence;
    :cond_0
    move-object v1, p1

    .line 540
    goto :goto_0
.end method

.method private setSwitchTypefaceByIndex(II)V
    .locals 1
    .param p1, "typefaceIndex"    # I
    .param p2, "styleIndex"    # I

    .prologue
    .line 233
    const/4 v0, 0x0

    .line 234
    .local v0, "tf":Landroid/graphics/Typeface;
    packed-switch p1, :pswitch_data_0

    .line 249
    :goto_0
    invoke-virtual {p0, v0, p2}, Lde/ankri/views/Switch;->setSwitchTypeface(Landroid/graphics/Typeface;I)V

    .line 250
    return-void

    .line 237
    :pswitch_0
    sget-object v0, Landroid/graphics/Typeface;->SANS_SERIF:Landroid/graphics/Typeface;

    .line 238
    goto :goto_0

    .line 241
    :pswitch_1
    sget-object v0, Landroid/graphics/Typeface;->SERIF:Landroid/graphics/Typeface;

    .line 242
    goto :goto_0

    .line 245
    :pswitch_2
    sget-object v0, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;

    goto :goto_0

    .line 234
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method private setThumbPosition(Z)V
    .locals 1
    .param p1, "checked"    # Z

    .prologue
    .line 693
    if-eqz p1, :cond_0

    invoke-direct {p0}, Lde/ankri/views/Switch;->getThumbScrollRange()I

    move-result v0

    int-to-float v0, v0

    :goto_0
    iput v0, p0, Lde/ankri/views/Switch;->mThumbPosition:F

    .line 694
    return-void

    .line 693
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private stopDrag(Landroid/view/MotionEvent;)V
    .locals 7
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 650
    iput v4, p0, Lde/ankri/views/Switch;->mTouchMode:I

    .line 652
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v5

    if-ne v5, v3, :cond_0

    invoke-virtual {p0}, Lde/ankri/views/Switch;->isEnabled()Z

    move-result v5

    if-eqz v5, :cond_0

    move v0, v3

    .line 654
    .local v0, "commitChange":Z
    :goto_0
    invoke-direct {p0, p1}, Lde/ankri/views/Switch;->cancelSuperTouch(Landroid/view/MotionEvent;)V

    .line 656
    if-eqz v0, :cond_3

    .line 659
    iget-object v5, p0, Lde/ankri/views/Switch;->mVelocityTracker:Landroid/view/VelocityTracker;

    const/16 v6, 0x3e8

    invoke-virtual {v5, v6}, Landroid/view/VelocityTracker;->computeCurrentVelocity(I)V

    .line 660
    iget-object v5, p0, Lde/ankri/views/Switch;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v5}, Landroid/view/VelocityTracker;->getXVelocity()F

    move-result v2

    .line 661
    .local v2, "xvel":F
    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v5

    iget v6, p0, Lde/ankri/views/Switch;->mMinFlingVelocity:I

    int-to-float v6, v6

    cmpl-float v5, v5, v6

    if-lez v5, :cond_2

    .line 664
    const/4 v5, 0x0

    cmpl-float v5, v2, v5

    if-lez v5, :cond_1

    move v1, v3

    .line 670
    .local v1, "newState":Z
    :goto_1
    invoke-direct {p0, v1}, Lde/ankri/views/Switch;->animateThumbToCheckedState(Z)V

    .line 676
    .end local v1    # "newState":Z
    .end local v2    # "xvel":F
    :goto_2
    return-void

    .end local v0    # "commitChange":Z
    :cond_0
    move v0, v4

    .line 652
    goto :goto_0

    .restart local v0    # "commitChange":Z
    .restart local v2    # "xvel":F
    :cond_1
    move v1, v4

    .line 664
    goto :goto_1

    .line 668
    :cond_2
    invoke-direct {p0}, Lde/ankri/views/Switch;->getTargetCheckedState()Z

    move-result v1

    .restart local v1    # "newState":Z
    goto :goto_1

    .line 674
    .end local v1    # "newState":Z
    .end local v2    # "xvel":F
    :cond_3
    invoke-virtual {p0}, Lde/ankri/views/Switch;->isChecked()Z

    move-result v3

    invoke-direct {p0, v3}, Lde/ankri/views/Switch;->animateThumbToCheckedState(Z)V

    goto :goto_2
.end method


# virtual methods
.method protected drawableStateChanged()V
    .locals 2

    .prologue
    .line 827
    invoke-super {p0}, Landroid/widget/CompoundButton;->drawableStateChanged()V

    .line 829
    invoke-virtual {p0}, Lde/ankri/views/Switch;->getDrawableState()[I

    move-result-object v0

    .line 833
    .local v0, "myDrawableState":[I
    iget-object v1, p0, Lde/ankri/views/Switch;->mThumbDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_0

    .line 834
    iget-object v1, p0, Lde/ankri/views/Switch;->mThumbDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, v0}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    .line 835
    :cond_0
    iget-object v1, p0, Lde/ankri/views/Switch;->mTrackDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_1

    .line 836
    iget-object v1, p0, Lde/ankri/views/Switch;->mTrackDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, v0}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    .line 838
    :cond_1
    invoke-virtual {p0}, Lde/ankri/views/Switch;->invalidate()V

    .line 839
    return-void
.end method

.method public getCompoundPaddingRight()I
    .locals 3

    .prologue
    .line 795
    invoke-super {p0}, Landroid/widget/CompoundButton;->getCompoundPaddingRight()I

    move-result v1

    iget v2, p0, Lde/ankri/views/Switch;->mSwitchWidth:I

    add-int v0, v1, v2

    .line 796
    .local v0, "padding":I
    invoke-virtual {p0}, Lde/ankri/views/Switch;->getText()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 798
    iget v1, p0, Lde/ankri/views/Switch;->mSwitchPadding:I

    add-int/2addr v0, v1

    .line 800
    :cond_0
    return v0
.end method

.method public getSwitchMinWidth()I
    .locals 1

    .prologue
    .line 347
    iget v0, p0, Lde/ankri/views/Switch;->mSwitchMinWidth:I

    return v0
.end method

.method public getSwitchPadding()I
    .locals 1

    .prologue
    .line 321
    iget v0, p0, Lde/ankri/views/Switch;->mSwitchPadding:I

    return v0
.end method

.method public getTextOff()Ljava/lang/CharSequence;
    .locals 1

    .prologue
    .line 482
    iget-object v0, p0, Lde/ankri/views/Switch;->mTextOff:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public getTextOn()Ljava/lang/CharSequence;
    .locals 1

    .prologue
    .line 461
    iget-object v0, p0, Lde/ankri/views/Switch;->mTextOn:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public getThumbDrawable()Landroid/graphics/drawable/Drawable;
    .locals 1

    .prologue
    .line 451
    iget-object v0, p0, Lde/ankri/views/Switch;->mThumbDrawable:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method public getThumbTextPadding()I
    .locals 1

    .prologue
    .line 373
    iget v0, p0, Lde/ankri/views/Switch;->mThumbTextPadding:I

    return v0
.end method

.method public getTrackDrawable()Landroid/graphics/drawable/Drawable;
    .locals 1

    .prologue
    .line 412
    iget-object v0, p0, Lde/ankri/views/Switch;->mTrackDrawable:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method protected onCreateDrawableState(I)[I
    .locals 2
    .param p1, "extraSpace"    # I

    .prologue
    .line 816
    add-int/lit8 v1, p1, 0x1

    invoke-super {p0, v1}, Landroid/widget/CompoundButton;->onCreateDrawableState(I)[I

    move-result-object v0

    .line 817
    .local v0, "drawableState":[I
    invoke-virtual {p0}, Lde/ankri/views/Switch;->isChecked()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 819
    sget-object v1, Lde/ankri/views/Switch;->CHECKED_STATE_SET:[I

    invoke-static {v0, v1}, Lde/ankri/views/Switch;->mergeDrawableStates([I[I)[I

    .line 821
    :cond_0
    return-object v0
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 17
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 747
    invoke-super/range {p0 .. p1}, Landroid/widget/CompoundButton;->onDraw(Landroid/graphics/Canvas;)V

    .line 750
    move-object/from16 v0, p0

    iget v6, v0, Lde/ankri/views/Switch;->mSwitchLeft:I

    .line 751
    .local v6, "switchLeft":I
    move-object/from16 v0, p0

    iget v9, v0, Lde/ankri/views/Switch;->mSwitchTop:I

    .line 752
    .local v9, "switchTop":I
    move-object/from16 v0, p0

    iget v7, v0, Lde/ankri/views/Switch;->mSwitchRight:I

    .line 753
    .local v7, "switchRight":I
    move-object/from16 v0, p0

    iget v1, v0, Lde/ankri/views/Switch;->mSwitchBottom:I

    .line 755
    .local v1, "switchBottom":I
    move-object/from16 v0, p0

    iget-object v13, v0, Lde/ankri/views/Switch;->mTrackDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v13, v6, v9, v7, v1}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 756
    move-object/from16 v0, p0

    iget-object v13, v0, Lde/ankri/views/Switch;->mTrackDrawable:Landroid/graphics/drawable/Drawable;

    move-object/from16 v0, p1

    invoke-virtual {v13, v0}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 758
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->save()I

    .line 760
    move-object/from16 v0, p0

    iget-object v13, v0, Lde/ankri/views/Switch;->mTrackDrawable:Landroid/graphics/drawable/Drawable;

    move-object/from16 v0, p0

    iget-object v14, v0, Lde/ankri/views/Switch;->mTempRect:Landroid/graphics/Rect;

    invoke-virtual {v13, v14}, Landroid/graphics/drawable/Drawable;->getPadding(Landroid/graphics/Rect;)Z

    .line 761
    move-object/from16 v0, p0

    iget-object v13, v0, Lde/ankri/views/Switch;->mTempRect:Landroid/graphics/Rect;

    iget v13, v13, Landroid/graphics/Rect;->left:I

    add-int v3, v6, v13

    .line 762
    .local v3, "switchInnerLeft":I
    move-object/from16 v0, p0

    iget-object v13, v0, Lde/ankri/views/Switch;->mTempRect:Landroid/graphics/Rect;

    iget v13, v13, Landroid/graphics/Rect;->top:I

    add-int v5, v9, v13

    .line 763
    .local v5, "switchInnerTop":I
    move-object/from16 v0, p0

    iget-object v13, v0, Lde/ankri/views/Switch;->mTempRect:Landroid/graphics/Rect;

    iget v13, v13, Landroid/graphics/Rect;->right:I

    sub-int v4, v7, v13

    .line 764
    .local v4, "switchInnerRight":I
    move-object/from16 v0, p0

    iget-object v13, v0, Lde/ankri/views/Switch;->mTempRect:Landroid/graphics/Rect;

    iget v13, v13, Landroid/graphics/Rect;->bottom:I

    sub-int v2, v1, v13

    .line 765
    .local v2, "switchInnerBottom":I
    move-object/from16 v0, p1

    invoke-virtual {v0, v3, v9, v4, v1}, Landroid/graphics/Canvas;->clipRect(IIII)Z

    .line 767
    move-object/from16 v0, p0

    iget-object v13, v0, Lde/ankri/views/Switch;->mThumbDrawable:Landroid/graphics/drawable/Drawable;

    move-object/from16 v0, p0

    iget-object v14, v0, Lde/ankri/views/Switch;->mTempRect:Landroid/graphics/Rect;

    invoke-virtual {v13, v14}, Landroid/graphics/drawable/Drawable;->getPadding(Landroid/graphics/Rect;)Z

    .line 768
    move-object/from16 v0, p0

    iget v13, v0, Lde/ankri/views/Switch;->mThumbPosition:F

    const/high16 v14, 0x3f000000    # 0.5f

    add-float/2addr v13, v14

    float-to-int v11, v13

    .line 769
    .local v11, "thumbPos":I
    move-object/from16 v0, p0

    iget-object v13, v0, Lde/ankri/views/Switch;->mTempRect:Landroid/graphics/Rect;

    iget v13, v13, Landroid/graphics/Rect;->left:I

    sub-int v13, v3, v13

    add-int v10, v13, v11

    .line 770
    .local v10, "thumbLeft":I
    add-int v13, v3, v11

    move-object/from16 v0, p0

    iget v14, v0, Lde/ankri/views/Switch;->mThumbWidth:I

    add-int/2addr v13, v14

    move-object/from16 v0, p0

    iget-object v14, v0, Lde/ankri/views/Switch;->mTempRect:Landroid/graphics/Rect;

    iget v14, v14, Landroid/graphics/Rect;->right:I

    add-int v12, v13, v14

    .line 772
    .local v12, "thumbRight":I
    move-object/from16 v0, p0

    iget-object v13, v0, Lde/ankri/views/Switch;->mThumbDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v13, v10, v9, v12, v1}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 773
    move-object/from16 v0, p0

    iget-object v13, v0, Lde/ankri/views/Switch;->mThumbDrawable:Landroid/graphics/drawable/Drawable;

    move-object/from16 v0, p1

    invoke-virtual {v13, v0}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 776
    move-object/from16 v0, p0

    iget-object v13, v0, Lde/ankri/views/Switch;->mTextColors:Landroid/content/res/ColorStateList;

    if-eqz v13, :cond_0

    .line 778
    move-object/from16 v0, p0

    iget-object v13, v0, Lde/ankri/views/Switch;->mTextPaint:Landroid/text/TextPaint;

    move-object/from16 v0, p0

    iget-object v14, v0, Lde/ankri/views/Switch;->mTextColors:Landroid/content/res/ColorStateList;

    invoke-virtual/range {p0 .. p0}, Lde/ankri/views/Switch;->getDrawableState()[I

    move-result-object v15

    move-object/from16 v0, p0

    iget-object v0, v0, Lde/ankri/views/Switch;->mTextColors:Landroid/content/res/ColorStateList;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v16

    invoke-virtual/range {v14 .. v16}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v14

    invoke-virtual {v13, v14}, Landroid/text/TextPaint;->setColor(I)V

    .line 780
    :cond_0
    move-object/from16 v0, p0

    iget-object v13, v0, Lde/ankri/views/Switch;->mTextPaint:Landroid/text/TextPaint;

    invoke-virtual/range {p0 .. p0}, Lde/ankri/views/Switch;->getDrawableState()[I

    move-result-object v14

    iput-object v14, v13, Landroid/text/TextPaint;->drawableState:[I

    .line 782
    invoke-direct/range {p0 .. p0}, Lde/ankri/views/Switch;->getTargetCheckedState()Z

    move-result v13

    if-eqz v13, :cond_2

    move-object/from16 v0, p0

    iget-object v8, v0, Lde/ankri/views/Switch;->mOnLayout:Landroid/text/Layout;

    .line 783
    .local v8, "switchText":Landroid/text/Layout;
    :goto_0
    if-eqz v8, :cond_1

    .line 785
    add-int v13, v10, v12

    div-int/lit8 v13, v13, 0x2

    invoke-virtual {v8}, Landroid/text/Layout;->getWidth()I

    move-result v14

    div-int/lit8 v14, v14, 0x2

    sub-int/2addr v13, v14

    int-to-float v13, v13

    add-int v14, v5, v2

    div-int/lit8 v14, v14, 0x2

    invoke-virtual {v8}, Landroid/text/Layout;->getHeight()I

    move-result v15

    div-int/lit8 v15, v15, 0x2

    sub-int/2addr v14, v15

    int-to-float v14, v14

    move-object/from16 v0, p1

    invoke-virtual {v0, v13, v14}, Landroid/graphics/Canvas;->translate(FF)V

    .line 786
    move-object/from16 v0, p1

    invoke-virtual {v8, v0}, Landroid/text/Layout;->draw(Landroid/graphics/Canvas;)V

    .line 789
    :cond_1
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->restore()V

    .line 790
    return-void

    .line 782
    .end local v8    # "switchText":Landroid/text/Layout;
    :cond_2
    move-object/from16 v0, p0

    iget-object v8, v0, Lde/ankri/views/Switch;->mOffLayout:Landroid/text/Layout;

    goto :goto_0
.end method

.method protected onLayout(ZIIII)V
    .locals 6
    .param p1, "changed"    # Z
    .param p2, "left"    # I
    .param p3, "top"    # I
    .param p4, "right"    # I
    .param p5, "bottom"    # I

    .prologue
    .line 707
    invoke-super/range {p0 .. p5}, Landroid/widget/CompoundButton;->onLayout(ZIIII)V

    .line 709
    invoke-virtual {p0}, Lde/ankri/views/Switch;->isChecked()Z

    move-result v4

    invoke-direct {p0, v4}, Lde/ankri/views/Switch;->setThumbPosition(Z)V

    .line 714
    invoke-virtual {p0}, Lde/ankri/views/Switch;->getWidth()I

    move-result v4

    invoke-virtual {p0}, Lde/ankri/views/Switch;->getPaddingRight()I

    move-result v5

    sub-int v2, v4, v5

    .line 715
    .local v2, "switchRight":I
    iget v4, p0, Lde/ankri/views/Switch;->mSwitchWidth:I

    sub-int v1, v2, v4

    .line 717
    .local v1, "switchLeft":I
    const/4 v3, 0x0

    .line 718
    .local v3, "switchTop":I
    const/4 v0, 0x0

    .line 719
    .local v0, "switchBottom":I
    invoke-virtual {p0}, Lde/ankri/views/Switch;->getGravity()I

    move-result v4

    and-int/lit8 v4, v4, 0x70

    sparse-switch v4, :sswitch_data_0

    .line 723
    invoke-virtual {p0}, Lde/ankri/views/Switch;->getPaddingTop()I

    move-result v3

    .line 724
    iget v4, p0, Lde/ankri/views/Switch;->mSwitchHeight:I

    add-int v0, v3, v4

    .line 738
    :goto_0
    iput v1, p0, Lde/ankri/views/Switch;->mSwitchLeft:I

    .line 739
    iput v3, p0, Lde/ankri/views/Switch;->mSwitchTop:I

    .line 740
    iput v0, p0, Lde/ankri/views/Switch;->mSwitchBottom:I

    .line 741
    iput v2, p0, Lde/ankri/views/Switch;->mSwitchRight:I

    .line 742
    return-void

    .line 728
    :sswitch_0
    invoke-virtual {p0}, Lde/ankri/views/Switch;->getPaddingTop()I

    move-result v4

    invoke-virtual {p0}, Lde/ankri/views/Switch;->getHeight()I

    move-result v5

    add-int/2addr v4, v5

    invoke-virtual {p0}, Lde/ankri/views/Switch;->getPaddingBottom()I

    move-result v5

    sub-int/2addr v4, v5

    div-int/lit8 v4, v4, 0x2

    iget v5, p0, Lde/ankri/views/Switch;->mSwitchHeight:I

    div-int/lit8 v5, v5, 0x2

    sub-int v3, v4, v5

    .line 729
    iget v4, p0, Lde/ankri/views/Switch;->mSwitchHeight:I

    add-int v0, v3, v4

    .line 730
    goto :goto_0

    .line 733
    :sswitch_1
    invoke-virtual {p0}, Lde/ankri/views/Switch;->getHeight()I

    move-result v4

    invoke-virtual {p0}, Lde/ankri/views/Switch;->getPaddingBottom()I

    move-result v5

    sub-int v0, v4, v5

    .line 734
    iget v4, p0, Lde/ankri/views/Switch;->mSwitchHeight:I

    sub-int v3, v0, v4

    goto :goto_0

    .line 719
    :sswitch_data_0
    .sparse-switch
        0x10 -> :sswitch_0
        0x50 -> :sswitch_1
    .end sparse-switch
.end method

.method public onMeasure(II)V
    .locals 7
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    .line 499
    iget-object v4, p0, Lde/ankri/views/Switch;->mOnLayout:Landroid/text/Layout;

    if-nez v4, :cond_0

    .line 501
    iget-object v4, p0, Lde/ankri/views/Switch;->mTextOn:Ljava/lang/CharSequence;

    invoke-direct {p0, v4}, Lde/ankri/views/Switch;->makeLayout(Ljava/lang/CharSequence;)Landroid/text/Layout;

    move-result-object v4

    iput-object v4, p0, Lde/ankri/views/Switch;->mOnLayout:Landroid/text/Layout;

    .line 503
    :cond_0
    iget-object v4, p0, Lde/ankri/views/Switch;->mOffLayout:Landroid/text/Layout;

    if-nez v4, :cond_1

    .line 505
    iget-object v4, p0, Lde/ankri/views/Switch;->mTextOff:Ljava/lang/CharSequence;

    invoke-direct {p0, v4}, Lde/ankri/views/Switch;->makeLayout(Ljava/lang/CharSequence;)Landroid/text/Layout;

    move-result-object v4

    iput-object v4, p0, Lde/ankri/views/Switch;->mOffLayout:Landroid/text/Layout;

    .line 508
    :cond_1
    iget-object v4, p0, Lde/ankri/views/Switch;->mTrackDrawable:Landroid/graphics/drawable/Drawable;

    iget-object v5, p0, Lde/ankri/views/Switch;->mTempRect:Landroid/graphics/Rect;

    invoke-virtual {v4, v5}, Landroid/graphics/drawable/Drawable;->getPadding(Landroid/graphics/Rect;)Z

    .line 509
    iget-object v4, p0, Lde/ankri/views/Switch;->mOnLayout:Landroid/text/Layout;

    invoke-virtual {v4}, Landroid/text/Layout;->getWidth()I

    move-result v4

    iget-object v5, p0, Lde/ankri/views/Switch;->mOffLayout:Landroid/text/Layout;

    invoke-virtual {v5}, Landroid/text/Layout;->getWidth()I

    move-result v5

    invoke-static {v4, v5}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 510
    .local v0, "maxTextWidth":I
    iget v4, p0, Lde/ankri/views/Switch;->mSwitchMinWidth:I

    mul-int/lit8 v5, v0, 0x2

    iget v6, p0, Lde/ankri/views/Switch;->mThumbTextPadding:I

    mul-int/lit8 v6, v6, 0x4

    add-int/2addr v5, v6

    iget-object v6, p0, Lde/ankri/views/Switch;->mTempRect:Landroid/graphics/Rect;

    iget v6, v6, Landroid/graphics/Rect;->left:I

    add-int/2addr v5, v6

    iget-object v6, p0, Lde/ankri/views/Switch;->mTempRect:Landroid/graphics/Rect;

    iget v6, v6, Landroid/graphics/Rect;->right:I

    add-int/2addr v5, v6

    invoke-static {v4, v5}, Ljava/lang/Math;->max(II)I

    move-result v3

    .line 511
    .local v3, "switchWidth":I
    iget-object v4, p0, Lde/ankri/views/Switch;->mTrackDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v4}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v2

    .line 513
    .local v2, "switchHeight":I
    iget v4, p0, Lde/ankri/views/Switch;->mThumbTextPadding:I

    mul-int/lit8 v4, v4, 0x2

    add-int/2addr v4, v0

    iput v4, p0, Lde/ankri/views/Switch;->mThumbWidth:I

    .line 515
    iput v3, p0, Lde/ankri/views/Switch;->mSwitchWidth:I

    .line 516
    iput v2, p0, Lde/ankri/views/Switch;->mSwitchHeight:I

    .line 518
    invoke-super {p0, p1, p2}, Landroid/widget/CompoundButton;->onMeasure(II)V

    .line 519
    invoke-virtual {p0}, Lde/ankri/views/Switch;->getMeasuredHeight()I

    move-result v1

    .line 520
    .local v1, "measuredHeight":I
    if-ge v1, v2, :cond_2

    .line 522
    invoke-virtual {p0}, Lde/ankri/views/Switch;->getMeasuredWidth()I

    move-result v4

    invoke-virtual {p0, v4, v2}, Lde/ankri/views/Switch;->setMeasuredDimension(II)V

    .line 524
    :cond_2
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 9
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v8, 0x2

    const/4 v5, 0x1

    .line 560
    iget-object v6, p0, Lde/ankri/views/Switch;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v6, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 561
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    .line 562
    .local v0, "action":I
    packed-switch v0, :pswitch_data_0

    .line 631
    :cond_0
    :goto_0
    :pswitch_0
    invoke-super {p0, p1}, Landroid/widget/CompoundButton;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v5

    :cond_1
    :goto_1
    return v5

    .line 566
    :pswitch_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    .line 567
    .local v3, "x":F
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v4

    .line 568
    .local v4, "y":F
    invoke-virtual {p0}, Lde/ankri/views/Switch;->isEnabled()Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-direct {p0, v3, v4}, Lde/ankri/views/Switch;->hitThumb(FF)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 570
    iput v5, p0, Lde/ankri/views/Switch;->mTouchMode:I

    .line 571
    iput v3, p0, Lde/ankri/views/Switch;->mTouchX:F

    .line 572
    iput v4, p0, Lde/ankri/views/Switch;->mTouchY:F

    goto :goto_0

    .line 579
    .end local v3    # "x":F
    .end local v4    # "y":F
    :pswitch_2
    iget v6, p0, Lde/ankri/views/Switch;->mTouchMode:I

    packed-switch v6, :pswitch_data_1

    goto :goto_0

    .line 587
    :pswitch_3
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    .line 588
    .restart local v3    # "x":F
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v4

    .line 589
    .restart local v4    # "y":F
    iget v6, p0, Lde/ankri/views/Switch;->mTouchX:F

    sub-float v6, v3, v6

    invoke-static {v6}, Ljava/lang/Math;->abs(F)F

    move-result v6

    iget v7, p0, Lde/ankri/views/Switch;->mTouchSlop:I

    int-to-float v7, v7

    cmpl-float v6, v6, v7

    if-gtz v6, :cond_2

    iget v6, p0, Lde/ankri/views/Switch;->mTouchY:F

    sub-float v6, v4, v6

    invoke-static {v6}, Ljava/lang/Math;->abs(F)F

    move-result v6

    iget v7, p0, Lde/ankri/views/Switch;->mTouchSlop:I

    int-to-float v7, v7

    cmpl-float v6, v6, v7

    if-lez v6, :cond_0

    .line 591
    :cond_2
    iput v8, p0, Lde/ankri/views/Switch;->mTouchMode:I

    .line 592
    invoke-virtual {p0}, Lde/ankri/views/Switch;->getParent()Landroid/view/ViewParent;

    move-result-object v6

    invoke-interface {v6, v5}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 593
    iput v3, p0, Lde/ankri/views/Switch;->mTouchX:F

    .line 594
    iput v4, p0, Lde/ankri/views/Switch;->mTouchY:F

    goto :goto_1

    .line 602
    .end local v3    # "x":F
    .end local v4    # "y":F
    :pswitch_4
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    .line 603
    .restart local v3    # "x":F
    iget v6, p0, Lde/ankri/views/Switch;->mTouchX:F

    sub-float v1, v3, v6

    .line 604
    .local v1, "dx":F
    const/4 v6, 0x0

    iget v7, p0, Lde/ankri/views/Switch;->mThumbPosition:F

    add-float/2addr v7, v1

    invoke-direct {p0}, Lde/ankri/views/Switch;->getThumbScrollRange()I

    move-result v8

    int-to-float v8, v8

    invoke-static {v7, v8}, Ljava/lang/Math;->min(FF)F

    move-result v7

    invoke-static {v6, v7}, Ljava/lang/Math;->max(FF)F

    move-result v2

    .line 605
    .local v2, "newPos":F
    iget v6, p0, Lde/ankri/views/Switch;->mThumbPosition:F

    cmpl-float v6, v2, v6

    if-eqz v6, :cond_1

    .line 607
    iput v2, p0, Lde/ankri/views/Switch;->mThumbPosition:F

    .line 608
    iput v3, p0, Lde/ankri/views/Switch;->mTouchX:F

    .line 609
    invoke-virtual {p0}, Lde/ankri/views/Switch;->invalidate()V

    goto :goto_1

    .line 620
    .end local v1    # "dx":F
    .end local v2    # "newPos":F
    .end local v3    # "x":F
    :pswitch_5
    iget v6, p0, Lde/ankri/views/Switch;->mTouchMode:I

    if-ne v6, v8, :cond_3

    .line 622
    invoke-direct {p0, p1}, Lde/ankri/views/Switch;->stopDrag(Landroid/view/MotionEvent;)V

    goto/16 :goto_1

    .line 625
    :cond_3
    const/4 v5, 0x0

    iput v5, p0, Lde/ankri/views/Switch;->mTouchMode:I

    .line 626
    iget-object v5, p0, Lde/ankri/views/Switch;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v5}, Landroid/view/VelocityTracker;->clear()V

    goto/16 :goto_0

    .line 562
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_5
        :pswitch_2
        :pswitch_5
    .end packed-switch

    .line 579
    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_0
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method

.method public setChecked(Z)V
    .locals 1
    .param p1, "checked"    # Z

    .prologue
    .line 699
    invoke-super {p0, p1}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 700
    invoke-virtual {p0}, Lde/ankri/views/Switch;->isChecked()Z

    move-result v0

    invoke-direct {p0, v0}, Lde/ankri/views/Switch;->setThumbPosition(Z)V

    .line 701
    invoke-virtual {p0}, Lde/ankri/views/Switch;->invalidate()V

    .line 702
    return-void
.end method

.method public setSwitchMinWidth(I)V
    .locals 0
    .param p1, "pixels"    # I

    .prologue
    .line 334
    iput p1, p0, Lde/ankri/views/Switch;->mSwitchMinWidth:I

    .line 335
    invoke-virtual {p0}, Lde/ankri/views/Switch;->requestLayout()V

    .line 336
    return-void
.end method

.method public setSwitchPadding(I)V
    .locals 0
    .param p1, "pixels"    # I

    .prologue
    .line 308
    iput p1, p0, Lde/ankri/views/Switch;->mSwitchPadding:I

    .line 309
    invoke-virtual {p0}, Lde/ankri/views/Switch;->requestLayout()V

    .line 310
    return-void
.end method

.method public setSwitchTextAppearance(Landroid/content/Context;I)V
    .locals 10
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "resid"    # I

    .prologue
    const/4 v9, 0x0

    const/4 v8, -0x1

    .line 184
    sget-object v6, Lde/ankri/R$styleable;->TextAppearanceSwitch:[I

    invoke-virtual {p1, p2, v6}, Landroid/content/Context;->obtainStyledAttributes(I[I)Landroid/content/res/TypedArray;

    move-result-object v1

    .line 189
    .local v1, "appearance":Landroid/content/res/TypedArray;
    sget v6, Lde/ankri/R$styleable;->TextAppearanceSwitch_textColor:I

    invoke-virtual {v1, v6}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v2

    .line 190
    .local v2, "colors":Landroid/content/res/ColorStateList;
    if-eqz v2, :cond_1

    .line 192
    iput-object v2, p0, Lde/ankri/views/Switch;->mTextColors:Landroid/content/res/ColorStateList;

    .line 200
    :goto_0
    sget v6, Lde/ankri/R$styleable;->TextAppearanceSwitch_textSize:I

    invoke-virtual {v1, v6, v9}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v4

    .line 201
    .local v4, "ts":I
    if-eqz v4, :cond_0

    .line 203
    int-to-float v6, v4

    iget-object v7, p0, Lde/ankri/views/Switch;->mTextPaint:Landroid/text/TextPaint;

    invoke-virtual {v7}, Landroid/text/TextPaint;->getTextSize()F

    move-result v7

    cmpl-float v6, v6, v7

    if-eqz v6, :cond_0

    .line 205
    iget-object v6, p0, Lde/ankri/views/Switch;->mTextPaint:Landroid/text/TextPaint;

    int-to-float v7, v4

    invoke-virtual {v6, v7}, Landroid/text/TextPaint;->setTextSize(F)V

    .line 206
    invoke-virtual {p0}, Lde/ankri/views/Switch;->requestLayout()V

    .line 212
    :cond_0
    sget v6, Lde/ankri/R$styleable;->TextAppearanceSwitch_typeface:I

    invoke-virtual {v1, v6, v8}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v5

    .line 213
    .local v5, "typefaceIndex":I
    sget v6, Lde/ankri/R$styleable;->TextAppearanceSwitch_textStyle:I

    invoke-virtual {v1, v6, v8}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v3

    .line 215
    .local v3, "styleIndex":I
    invoke-direct {p0, v5, v3}, Lde/ankri/views/Switch;->setSwitchTypefaceByIndex(II)V

    .line 217
    sget v6, Lde/ankri/R$styleable;->TextAppearanceSwitch_switchTextAllCaps:I

    invoke-virtual {v1, v6, v9}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v0

    .line 218
    .local v0, "allCaps":Z
    if-eqz v0, :cond_2

    .line 220
    new-instance v6, Lde/ankri/text/method/AllCapsTransformationMethod;

    invoke-virtual {p0}, Lde/ankri/views/Switch;->getContext()Landroid/content/Context;

    move-result-object v7

    invoke-direct {v6, v7}, Lde/ankri/text/method/AllCapsTransformationMethod;-><init>(Landroid/content/Context;)V

    iput-object v6, p0, Lde/ankri/views/Switch;->mSwitchTransformationMethod:Lde/ankri/text/method/TransformationMethodCompat2;

    .line 221
    iget-object v6, p0, Lde/ankri/views/Switch;->mSwitchTransformationMethod:Lde/ankri/text/method/TransformationMethodCompat2;

    const/4 v7, 0x1

    invoke-interface {v6, v7}, Lde/ankri/text/method/TransformationMethodCompat2;->setLengthChangesAllowed(Z)V

    .line 228
    :goto_1
    invoke-virtual {v1}, Landroid/content/res/TypedArray;->recycle()V

    .line 229
    return-void

    .line 197
    .end local v0    # "allCaps":Z
    .end local v3    # "styleIndex":I
    .end local v4    # "ts":I
    .end local v5    # "typefaceIndex":I
    :cond_1
    invoke-virtual {p0}, Lde/ankri/views/Switch;->getTextColors()Landroid/content/res/ColorStateList;

    move-result-object v6

    iput-object v6, p0, Lde/ankri/views/Switch;->mTextColors:Landroid/content/res/ColorStateList;

    goto :goto_0

    .line 225
    .restart local v0    # "allCaps":Z
    .restart local v3    # "styleIndex":I
    .restart local v4    # "ts":I
    .restart local v5    # "typefaceIndex":I
    :cond_2
    const/4 v6, 0x0

    iput-object v6, p0, Lde/ankri/views/Switch;->mSwitchTransformationMethod:Lde/ankri/text/method/TransformationMethodCompat2;

    goto :goto_1
.end method

.method public setSwitchTypeface(Landroid/graphics/Typeface;)V
    .locals 1
    .param p1, "tf"    # Landroid/graphics/Typeface;

    .prologue
    .line 289
    iget-object v0, p0, Lde/ankri/views/Switch;->mTextPaint:Landroid/text/TextPaint;

    invoke-virtual {v0}, Landroid/text/TextPaint;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v0

    if-eq v0, p1, :cond_0

    .line 291
    iget-object v0, p0, Lde/ankri/views/Switch;->mTextPaint:Landroid/text/TextPaint;

    invoke-virtual {v0, p1}, Landroid/text/TextPaint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 293
    invoke-virtual {p0}, Lde/ankri/views/Switch;->requestLayout()V

    .line 294
    invoke-virtual {p0}, Lde/ankri/views/Switch;->invalidate()V

    .line 296
    :cond_0
    return-void
.end method

.method public setSwitchTypeface(Landroid/graphics/Typeface;I)V
    .locals 6
    .param p1, "tf"    # Landroid/graphics/Typeface;
    .param p2, "style"    # I

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 254
    if-lez p2, :cond_4

    .line 256
    if-nez p1, :cond_1

    .line 258
    invoke-static {p2}, Landroid/graphics/Typeface;->defaultFromStyle(I)Landroid/graphics/Typeface;

    move-result-object p1

    .line 265
    :goto_0
    invoke-virtual {p0, p1}, Lde/ankri/views/Switch;->setSwitchTypeface(Landroid/graphics/Typeface;)V

    .line 267
    if-eqz p1, :cond_2

    invoke-virtual {p1}, Landroid/graphics/Typeface;->getStyle()I

    move-result v1

    .line 268
    .local v1, "typefaceStyle":I
    :goto_1
    xor-int/lit8 v4, v1, -0x1

    and-int v0, p2, v4

    .line 269
    .local v0, "need":I
    iget-object v4, p0, Lde/ankri/views/Switch;->mTextPaint:Landroid/text/TextPaint;

    and-int/lit8 v5, v0, 0x1

    if-eqz v5, :cond_0

    const/4 v2, 0x1

    :cond_0
    invoke-virtual {v4, v2}, Landroid/text/TextPaint;->setFakeBoldText(Z)V

    .line 270
    iget-object v4, p0, Lde/ankri/views/Switch;->mTextPaint:Landroid/text/TextPaint;

    and-int/lit8 v2, v0, 0x2

    if-eqz v2, :cond_3

    const/high16 v2, -0x41800000    # -0.25f

    :goto_2
    invoke-virtual {v4, v2}, Landroid/text/TextPaint;->setTextSkewX(F)V

    .line 278
    .end local v0    # "need":I
    .end local v1    # "typefaceStyle":I
    :goto_3
    return-void

    .line 262
    :cond_1
    invoke-static {p1, p2}, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;

    move-result-object p1

    goto :goto_0

    :cond_2
    move v1, v2

    .line 267
    goto :goto_1

    .restart local v0    # "need":I
    .restart local v1    # "typefaceStyle":I
    :cond_3
    move v2, v3

    .line 270
    goto :goto_2

    .line 274
    .end local v0    # "need":I
    .end local v1    # "typefaceStyle":I
    :cond_4
    iget-object v4, p0, Lde/ankri/views/Switch;->mTextPaint:Landroid/text/TextPaint;

    invoke-virtual {v4, v2}, Landroid/text/TextPaint;->setFakeBoldText(Z)V

    .line 275
    iget-object v2, p0, Lde/ankri/views/Switch;->mTextPaint:Landroid/text/TextPaint;

    invoke-virtual {v2, v3}, Landroid/text/TextPaint;->setTextSkewX(F)V

    .line 276
    invoke-virtual {p0, p1}, Lde/ankri/views/Switch;->setSwitchTypeface(Landroid/graphics/Typeface;)V

    goto :goto_3
.end method

.method public setTextOff(Ljava/lang/CharSequence;)V
    .locals 0
    .param p1, "textOff"    # Ljava/lang/CharSequence;

    .prologue
    .line 492
    iput-object p1, p0, Lde/ankri/views/Switch;->mTextOff:Ljava/lang/CharSequence;

    .line 493
    invoke-virtual {p0}, Lde/ankri/views/Switch;->requestLayout()V

    .line 494
    return-void
.end method

.method public setTextOn(Ljava/lang/CharSequence;)V
    .locals 0
    .param p1, "textOn"    # Ljava/lang/CharSequence;

    .prologue
    .line 471
    iput-object p1, p0, Lde/ankri/views/Switch;->mTextOn:Ljava/lang/CharSequence;

    .line 472
    invoke-virtual {p0}, Lde/ankri/views/Switch;->requestLayout()V

    .line 473
    return-void
.end method

.method public setThumbDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 0
    .param p1, "thumb"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 425
    iput-object p1, p0, Lde/ankri/views/Switch;->mThumbDrawable:Landroid/graphics/drawable/Drawable;

    .line 426
    invoke-virtual {p0}, Lde/ankri/views/Switch;->requestLayout()V

    .line 427
    return-void
.end method

.method public setThumbResource(I)V
    .locals 1
    .param p1, "resId"    # I

    .prologue
    .line 439
    invoke-virtual {p0}, Lde/ankri/views/Switch;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p0, v0}, Lde/ankri/views/Switch;->setThumbDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 440
    return-void
.end method

.method public setThumbTextPadding(I)V
    .locals 0
    .param p1, "pixels"    # I

    .prologue
    .line 360
    iput p1, p0, Lde/ankri/views/Switch;->mThumbTextPadding:I

    .line 361
    invoke-virtual {p0}, Lde/ankri/views/Switch;->requestLayout()V

    .line 362
    return-void
.end method

.method public setTrackDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 0
    .param p1, "track"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 386
    iput-object p1, p0, Lde/ankri/views/Switch;->mTrackDrawable:Landroid/graphics/drawable/Drawable;

    .line 387
    invoke-virtual {p0}, Lde/ankri/views/Switch;->requestLayout()V

    .line 388
    return-void
.end method

.method public setTrackResource(I)V
    .locals 1
    .param p1, "resId"    # I

    .prologue
    .line 400
    invoke-virtual {p0}, Lde/ankri/views/Switch;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p0, v0}, Lde/ankri/views/Switch;->setTrackDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 401
    return-void
.end method

.method protected verifyDrawable(Landroid/graphics/drawable/Drawable;)Z
    .locals 1
    .param p1, "who"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 844
    invoke-super {p0, p1}, Landroid/widget/CompoundButton;->verifyDrawable(Landroid/graphics/drawable/Drawable;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lde/ankri/views/Switch;->mThumbDrawable:Landroid/graphics/drawable/Drawable;

    if-eq p1, v0, :cond_0

    iget-object v0, p0, Lde/ankri/views/Switch;->mTrackDrawable:Landroid/graphics/drawable/Drawable;

    if-ne p1, v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method
