.class public Lcom/linearlistview/internal/IcsLinearLayout;
.super Landroid/widget/LinearLayout;
.source "IcsLinearLayout.java"


# static fields
.field private static final IS_HONEYCOMB:Z

.field private static final LinearLayout_divider:I = 0x0

.field private static final LinearLayout_dividerPadding:I = 0x3

.field private static final LinearLayout_measureWithLargestChild:I = 0x1

.field private static final LinearLayout_showDividers:I = 0x2

.field private static final R_styleable_LinearLayout:[I

.field public static final SHOW_DIVIDER_BEGINNING:I = 0x1

.field public static final SHOW_DIVIDER_END:I = 0x4

.field public static final SHOW_DIVIDER_MIDDLE:I = 0x2

.field public static final SHOW_DIVIDER_NONE:I


# instance fields
.field private mClipDivider:Z

.field private mDivider:Landroid/graphics/drawable/Drawable;

.field protected mDividerHeight:I

.field private mDividerPadding:I

.field protected mDividerWidth:I

.field private mShowDividers:I

.field private mUseLargestChild:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 21
    const/4 v0, 0x4

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/linearlistview/internal/IcsLinearLayout;->R_styleable_LinearLayout:[I

    .line 50
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-lt v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lcom/linearlistview/internal/IcsLinearLayout;->IS_HONEYCOMB:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 21
    :array_0
    .array-data 4
        0x1010129
        0x10102d4
        0x1010329
        0x101032a
    .end array-data
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v2, 0x0

    .line 63
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 65
    sget-object v1, Lcom/linearlistview/internal/IcsLinearLayout;->R_styleable_LinearLayout:[I

    invoke-virtual {p1, p2, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 67
    .local v0, "a":Landroid/content/res/TypedArray;
    invoke-virtual {v0, v2}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/linearlistview/internal/IcsLinearLayout;->setDividerDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 68
    const/4 v1, 0x2

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v1

    iput v1, p0, Lcom/linearlistview/internal/IcsLinearLayout;->mShowDividers:I

    .line 69
    const/4 v1, 0x3

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    iput v1, p0, Lcom/linearlistview/internal/IcsLinearLayout;->mDividerPadding:I

    .line 70
    const/4 v1, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v1

    iput-boolean v1, p0, Lcom/linearlistview/internal/IcsLinearLayout;->mUseLargestChild:Z

    .line 72
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 73
    return-void
.end method

.method private useLargestChildHorizontal()V
    .locals 10

    .prologue
    const/high16 v9, 0x40000000    # 2.0f

    .line 349
    invoke-virtual {p0}, Lcom/linearlistview/internal/IcsLinearLayout;->getChildCount()I

    move-result v1

    .line 352
    .local v1, "childCount":I
    const/4 v4, 0x0

    .line 353
    .local v4, "largestChildWidth":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    if-ge v3, v1, :cond_0

    .line 354
    invoke-virtual {p0, v3}, Lcom/linearlistview/internal/IcsLinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 355
    .local v0, "child":Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    move-result v7

    invoke-static {v7, v4}, Ljava/lang/Math;->max(II)I

    move-result v4

    .line 353
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 358
    .end local v0    # "child":Landroid/view/View;
    :cond_0
    const/4 v6, 0x0

    .line 360
    .local v6, "totalWidth":I
    const/4 v3, 0x0

    :goto_1
    if-ge v3, v1, :cond_4

    .line 361
    invoke-virtual {p0, v3}, Lcom/linearlistview/internal/IcsLinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 363
    .restart local v0    # "child":Landroid/view/View;
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v7

    const/16 v8, 0x8

    if-ne v7, v8, :cond_2

    .line 360
    :cond_1
    :goto_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 368
    :cond_2
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    check-cast v5, Landroid/widget/LinearLayout$LayoutParams;

    .line 370
    .local v5, "lp":Landroid/widget/LinearLayout$LayoutParams;
    iget v2, v5, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    .line 371
    .local v2, "childExtra":F
    const/4 v7, 0x0

    cmpl-float v7, v2, v7

    if-lez v7, :cond_3

    .line 373
    invoke-static {v4, v9}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v7

    .line 375
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    move-result v8

    invoke-static {v8, v9}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v8

    .line 372
    invoke-virtual {v0, v7, v8}, Landroid/view/View;->measure(II)V

    .line 377
    add-int/2addr v6, v4

    .line 383
    :goto_3
    iget v7, v5, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    iget v8, v5, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    add-int/2addr v7, v8

    add-int/2addr v6, v7

    goto :goto_2

    .line 380
    :cond_3
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    move-result v7

    add-int/2addr v6, v7

    goto :goto_3

    .line 386
    .end local v0    # "child":Landroid/view/View;
    .end local v2    # "childExtra":F
    .end local v5    # "lp":Landroid/widget/LinearLayout$LayoutParams;
    :cond_4
    invoke-virtual {p0}, Lcom/linearlistview/internal/IcsLinearLayout;->getPaddingLeft()I

    move-result v7

    invoke-virtual {p0}, Lcom/linearlistview/internal/IcsLinearLayout;->getPaddingRight()I

    move-result v8

    add-int/2addr v7, v8

    add-int/2addr v6, v7

    .line 387
    invoke-virtual {p0}, Lcom/linearlistview/internal/IcsLinearLayout;->getMeasuredHeight()I

    move-result v7

    invoke-virtual {p0, v6, v7}, Lcom/linearlistview/internal/IcsLinearLayout;->setMeasuredDimension(II)V

    .line 388
    return-void
.end method

.method private useLargestChildVertical()V
    .locals 10

    .prologue
    const/high16 v9, 0x40000000    # 2.0f

    .line 391
    invoke-virtual {p0}, Lcom/linearlistview/internal/IcsLinearLayout;->getChildCount()I

    move-result v1

    .line 394
    .local v1, "childCount":I
    const/4 v4, 0x0

    .line 395
    .local v4, "largestChildHeight":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    if-ge v3, v1, :cond_0

    .line 396
    invoke-virtual {p0, v3}, Lcom/linearlistview/internal/IcsLinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 397
    .local v0, "child":Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    move-result v7

    invoke-static {v7, v4}, Ljava/lang/Math;->max(II)I

    move-result v4

    .line 395
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 400
    .end local v0    # "child":Landroid/view/View;
    :cond_0
    const/4 v6, 0x0

    .line 402
    .local v6, "totalHeight":I
    const/4 v3, 0x0

    :goto_1
    if-ge v3, v1, :cond_4

    .line 403
    invoke-virtual {p0, v3}, Lcom/linearlistview/internal/IcsLinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 405
    .restart local v0    # "child":Landroid/view/View;
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v7

    const/16 v8, 0x8

    if-ne v7, v8, :cond_2

    .line 402
    :cond_1
    :goto_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 410
    :cond_2
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    check-cast v5, Landroid/widget/LinearLayout$LayoutParams;

    .line 412
    .local v5, "lp":Landroid/widget/LinearLayout$LayoutParams;
    iget v2, v5, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    .line 413
    .local v2, "childExtra":F
    const/4 v7, 0x0

    cmpl-float v7, v2, v7

    if-lez v7, :cond_3

    .line 415
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    move-result v7

    invoke-static {v7, v9}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v7

    .line 417
    invoke-static {v4, v9}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v8

    .line 414
    invoke-virtual {v0, v7, v8}, Landroid/view/View;->measure(II)V

    .line 419
    add-int/2addr v6, v4

    .line 425
    :goto_3
    iget v7, v5, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    iget v8, v5, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    add-int/2addr v7, v8

    add-int/2addr v6, v7

    goto :goto_2

    .line 422
    :cond_3
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    move-result v7

    add-int/2addr v6, v7

    goto :goto_3

    .line 428
    .end local v0    # "child":Landroid/view/View;
    .end local v2    # "childExtra":F
    .end local v5    # "lp":Landroid/widget/LinearLayout$LayoutParams;
    :cond_4
    invoke-virtual {p0}, Lcom/linearlistview/internal/IcsLinearLayout;->getPaddingLeft()I

    move-result v7

    invoke-virtual {p0}, Lcom/linearlistview/internal/IcsLinearLayout;->getPaddingRight()I

    move-result v8

    add-int/2addr v7, v8

    add-int/2addr v6, v7

    .line 429
    invoke-virtual {p0}, Lcom/linearlistview/internal/IcsLinearLayout;->getMeasuredWidth()I

    move-result v7

    invoke-virtual {p0, v7, v6}, Lcom/linearlistview/internal/IcsLinearLayout;->setMeasuredDimension(II)V

    .line 430
    return-void
.end method


# virtual methods
.method drawDividersHorizontal(Landroid/graphics/Canvas;)V
    .locals 8
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 221
    invoke-virtual {p0}, Lcom/linearlistview/internal/IcsLinearLayout;->getChildCount()I

    move-result v1

    .line 222
    .local v1, "count":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v1, :cond_1

    .line 223
    invoke-virtual {p0, v2}, Lcom/linearlistview/internal/IcsLinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 225
    .local v0, "child":Landroid/view/View;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v6

    const/16 v7, 0x8

    if-eq v6, v7, :cond_0

    .line 226
    invoke-virtual {p0, v2}, Lcom/linearlistview/internal/IcsLinearLayout;->hasDividerBeforeChildAt(I)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 227
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    check-cast v4, Landroid/widget/LinearLayout$LayoutParams;

    .line 228
    .local v4, "lp":Landroid/widget/LinearLayout$LayoutParams;
    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    move-result v6

    iget v7, v4, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    sub-int v3, v6, v7

    .line 229
    .local v3, "left":I
    invoke-virtual {p0, p1, v3}, Lcom/linearlistview/internal/IcsLinearLayout;->drawVerticalDivider(Landroid/graphics/Canvas;I)V

    .line 222
    .end local v3    # "left":I
    .end local v4    # "lp":Landroid/widget/LinearLayout$LayoutParams;
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 234
    .end local v0    # "child":Landroid/view/View;
    :cond_1
    invoke-virtual {p0, v1}, Lcom/linearlistview/internal/IcsLinearLayout;->hasDividerBeforeChildAt(I)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 235
    add-int/lit8 v6, v1, -0x1

    invoke-virtual {p0, v6}, Lcom/linearlistview/internal/IcsLinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 236
    .restart local v0    # "child":Landroid/view/View;
    const/4 v5, 0x0

    .line 237
    .local v5, "right":I
    if-nez v0, :cond_3

    .line 238
    invoke-virtual {p0}, Lcom/linearlistview/internal/IcsLinearLayout;->getWidth()I

    move-result v6

    invoke-virtual {p0}, Lcom/linearlistview/internal/IcsLinearLayout;->getPaddingRight()I

    move-result v7

    sub-int/2addr v6, v7

    iget v7, p0, Lcom/linearlistview/internal/IcsLinearLayout;->mDividerWidth:I

    sub-int v5, v6, v7

    .line 243
    :goto_1
    invoke-virtual {p0, p1, v5}, Lcom/linearlistview/internal/IcsLinearLayout;->drawVerticalDivider(Landroid/graphics/Canvas;I)V

    .line 245
    .end local v0    # "child":Landroid/view/View;
    .end local v5    # "right":I
    :cond_2
    return-void

    .line 241
    .restart local v0    # "child":Landroid/view/View;
    .restart local v5    # "right":I
    :cond_3
    invoke-virtual {v0}, Landroid/view/View;->getRight()I

    move-result v5

    goto :goto_1
.end method

.method drawDividersVertical(Landroid/graphics/Canvas;)V
    .locals 8
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 194
    invoke-virtual {p0}, Lcom/linearlistview/internal/IcsLinearLayout;->getChildCount()I

    move-result v2

    .line 195
    .local v2, "count":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    if-ge v3, v2, :cond_1

    .line 196
    invoke-virtual {p0, v3}, Lcom/linearlistview/internal/IcsLinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 198
    .local v1, "child":Landroid/view/View;
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Landroid/view/View;->getVisibility()I

    move-result v6

    const/16 v7, 0x8

    if-eq v6, v7, :cond_0

    .line 199
    invoke-virtual {p0, v3}, Lcom/linearlistview/internal/IcsLinearLayout;->hasDividerBeforeChildAt(I)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 200
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    check-cast v4, Landroid/widget/LinearLayout$LayoutParams;

    .line 201
    .local v4, "lp":Landroid/widget/LinearLayout$LayoutParams;
    invoke-virtual {v1}, Landroid/view/View;->getTop()I

    move-result v6

    iget v7, v4, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    sub-int v5, v6, v7

    .line 202
    .local v5, "top":I
    invoke-virtual {p0, p1, v5}, Lcom/linearlistview/internal/IcsLinearLayout;->drawHorizontalDivider(Landroid/graphics/Canvas;I)V

    .line 195
    .end local v4    # "lp":Landroid/widget/LinearLayout$LayoutParams;
    .end local v5    # "top":I
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 207
    .end local v1    # "child":Landroid/view/View;
    :cond_1
    invoke-virtual {p0, v2}, Lcom/linearlistview/internal/IcsLinearLayout;->hasDividerBeforeChildAt(I)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 208
    add-int/lit8 v6, v2, -0x1

    invoke-virtual {p0, v6}, Lcom/linearlistview/internal/IcsLinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 209
    .restart local v1    # "child":Landroid/view/View;
    const/4 v0, 0x0

    .line 210
    .local v0, "bottom":I
    if-nez v1, :cond_3

    .line 211
    invoke-virtual {p0}, Lcom/linearlistview/internal/IcsLinearLayout;->getHeight()I

    move-result v6

    invoke-virtual {p0}, Lcom/linearlistview/internal/IcsLinearLayout;->getPaddingBottom()I

    move-result v7

    sub-int/2addr v6, v7

    iget v7, p0, Lcom/linearlistview/internal/IcsLinearLayout;->mDividerHeight:I

    sub-int v0, v6, v7

    .line 216
    :goto_1
    invoke-virtual {p0, p1, v0}, Lcom/linearlistview/internal/IcsLinearLayout;->drawHorizontalDivider(Landroid/graphics/Canvas;I)V

    .line 218
    .end local v0    # "bottom":I
    .end local v1    # "child":Landroid/view/View;
    :cond_2
    return-void

    .line 214
    .restart local v0    # "bottom":I
    .restart local v1    # "child":Landroid/view/View;
    :cond_3
    invoke-virtual {v1}, Landroid/view/View;->getBottom()I

    move-result v0

    goto :goto_1
.end method

.method drawHorizontalDivider(Landroid/graphics/Canvas;I)V
    .locals 4
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "top"    # I

    .prologue
    .line 248
    iget-boolean v0, p0, Lcom/linearlistview/internal/IcsLinearLayout;->mClipDivider:Z

    if-eqz v0, :cond_0

    sget-boolean v0, Lcom/linearlistview/internal/IcsLinearLayout;->IS_HONEYCOMB:Z

    if-nez v0, :cond_0

    .line 249
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 250
    invoke-virtual {p0}, Lcom/linearlistview/internal/IcsLinearLayout;->getPaddingLeft()I

    move-result v0

    iget v1, p0, Lcom/linearlistview/internal/IcsLinearLayout;->mDividerPadding:I

    add-int/2addr v0, v1

    .line 251
    invoke-virtual {p0}, Lcom/linearlistview/internal/IcsLinearLayout;->getWidth()I

    move-result v1

    invoke-virtual {p0}, Lcom/linearlistview/internal/IcsLinearLayout;->getPaddingRight()I

    move-result v2

    sub-int/2addr v1, v2

    iget v2, p0, Lcom/linearlistview/internal/IcsLinearLayout;->mDividerPadding:I

    sub-int/2addr v1, v2

    iget v2, p0, Lcom/linearlistview/internal/IcsLinearLayout;->mDividerHeight:I

    add-int/2addr v2, p2

    .line 250
    invoke-virtual {p1, v0, p2, v1, v2}, Landroid/graphics/Canvas;->clipRect(IIII)Z

    .line 252
    iget-object v0, p0, Lcom/linearlistview/internal/IcsLinearLayout;->mDivider:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 253
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 259
    :goto_0
    return-void

    .line 255
    :cond_0
    iget-object v0, p0, Lcom/linearlistview/internal/IcsLinearLayout;->mDivider:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0}, Lcom/linearlistview/internal/IcsLinearLayout;->getPaddingLeft()I

    move-result v1

    iget v2, p0, Lcom/linearlistview/internal/IcsLinearLayout;->mDividerPadding:I

    add-int/2addr v1, v2

    .line 256
    invoke-virtual {p0}, Lcom/linearlistview/internal/IcsLinearLayout;->getWidth()I

    move-result v2

    invoke-virtual {p0}, Lcom/linearlistview/internal/IcsLinearLayout;->getPaddingRight()I

    move-result v3

    sub-int/2addr v2, v3

    iget v3, p0, Lcom/linearlistview/internal/IcsLinearLayout;->mDividerPadding:I

    sub-int/2addr v2, v3

    iget v3, p0, Lcom/linearlistview/internal/IcsLinearLayout;->mDividerHeight:I

    add-int/2addr v3, p2

    .line 255
    invoke-virtual {v0, v1, p2, v2, v3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 257
    iget-object v0, p0, Lcom/linearlistview/internal/IcsLinearLayout;->mDivider:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    goto :goto_0
.end method

.method drawVerticalDivider(Landroid/graphics/Canvas;I)V
    .locals 5
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "left"    # I

    .prologue
    .line 262
    iget-boolean v0, p0, Lcom/linearlistview/internal/IcsLinearLayout;->mClipDivider:Z

    if-eqz v0, :cond_0

    sget-boolean v0, Lcom/linearlistview/internal/IcsLinearLayout;->IS_HONEYCOMB:Z

    if-nez v0, :cond_0

    .line 263
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 264
    invoke-virtual {p0}, Lcom/linearlistview/internal/IcsLinearLayout;->getPaddingTop()I

    move-result v0

    iget v1, p0, Lcom/linearlistview/internal/IcsLinearLayout;->mDividerPadding:I

    add-int/2addr v0, v1

    iget v1, p0, Lcom/linearlistview/internal/IcsLinearLayout;->mDividerWidth:I

    add-int/2addr v1, p2

    .line 265
    invoke-virtual {p0}, Lcom/linearlistview/internal/IcsLinearLayout;->getHeight()I

    move-result v2

    invoke-virtual {p0}, Lcom/linearlistview/internal/IcsLinearLayout;->getPaddingBottom()I

    move-result v3

    sub-int/2addr v2, v3

    iget v3, p0, Lcom/linearlistview/internal/IcsLinearLayout;->mDividerPadding:I

    sub-int/2addr v2, v3

    .line 264
    invoke-virtual {p1, p2, v0, v1, v2}, Landroid/graphics/Canvas;->clipRect(IIII)Z

    .line 266
    iget-object v0, p0, Lcom/linearlistview/internal/IcsLinearLayout;->mDivider:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 267
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 273
    :goto_0
    return-void

    .line 269
    :cond_0
    iget-object v0, p0, Lcom/linearlistview/internal/IcsLinearLayout;->mDivider:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0}, Lcom/linearlistview/internal/IcsLinearLayout;->getPaddingTop()I

    move-result v1

    iget v2, p0, Lcom/linearlistview/internal/IcsLinearLayout;->mDividerPadding:I

    add-int/2addr v1, v2

    iget v2, p0, Lcom/linearlistview/internal/IcsLinearLayout;->mDividerWidth:I

    add-int/2addr v2, p2

    .line 270
    invoke-virtual {p0}, Lcom/linearlistview/internal/IcsLinearLayout;->getHeight()I

    move-result v3

    invoke-virtual {p0}, Lcom/linearlistview/internal/IcsLinearLayout;->getPaddingBottom()I

    move-result v4

    sub-int/2addr v3, v4

    iget v4, p0, Lcom/linearlistview/internal/IcsLinearLayout;->mDividerPadding:I

    sub-int/2addr v3, v4

    .line 269
    invoke-virtual {v0, p2, v1, v2, v3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 271
    iget-object v0, p0, Lcom/linearlistview/internal/IcsLinearLayout;->mDivider:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    goto :goto_0
.end method

.method public getDividerPadding()I
    .locals 1

    .prologue
    .line 141
    iget v0, p0, Lcom/linearlistview/internal/IcsLinearLayout;->mDividerPadding:I

    return v0
.end method

.method public getDividerWidth()I
    .locals 1

    .prologue
    .line 150
    iget v0, p0, Lcom/linearlistview/internal/IcsLinearLayout;->mDividerWidth:I

    return v0
.end method

.method public getShowDividers()I
    .locals 1

    .prologue
    .line 95
    iget v0, p0, Lcom/linearlistview/internal/IcsLinearLayout;->mShowDividers:I

    return v0
.end method

.method protected hasDividerBeforeChildAt(I)Z
    .locals 5
    .param p1, "childIndex"    # I

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 283
    if-nez p1, :cond_2

    .line 284
    iget v4, p0, Lcom/linearlistview/internal/IcsLinearLayout;->mShowDividers:I

    and-int/lit8 v4, v4, 0x1

    if-eqz v4, :cond_1

    .line 297
    :cond_0
    :goto_0
    return v2

    :cond_1
    move v2, v3

    .line 284
    goto :goto_0

    .line 285
    :cond_2
    invoke-virtual {p0}, Lcom/linearlistview/internal/IcsLinearLayout;->getChildCount()I

    move-result v4

    if-ne p1, v4, :cond_3

    .line 286
    iget v4, p0, Lcom/linearlistview/internal/IcsLinearLayout;->mShowDividers:I

    and-int/lit8 v4, v4, 0x4

    if-nez v4, :cond_0

    move v2, v3

    goto :goto_0

    .line 287
    :cond_3
    iget v2, p0, Lcom/linearlistview/internal/IcsLinearLayout;->mShowDividers:I

    and-int/lit8 v2, v2, 0x2

    if-eqz v2, :cond_6

    .line 288
    const/4 v0, 0x0

    .line 289
    .local v0, "hasVisibleViewBefore":Z
    add-int/lit8 v1, p1, -0x1

    .local v1, "i":I
    :goto_1
    if-ltz v1, :cond_4

    .line 290
    invoke-virtual {p0, v1}, Lcom/linearlistview/internal/IcsLinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    move-result v2

    const/16 v3, 0x8

    if-eq v2, v3, :cond_5

    .line 291
    const/4 v0, 0x1

    :cond_4
    move v2, v0

    .line 295
    goto :goto_0

    .line 289
    :cond_5
    add-int/lit8 v1, v1, -0x1

    goto :goto_1

    .end local v0    # "hasVisibleViewBefore":Z
    .end local v1    # "i":I
    :cond_6
    move v2, v3

    .line 297
    goto :goto_0
.end method

.method public isMeasureWithLargestChildEnabled()Z
    .locals 1

    .prologue
    .line 311
    iget-boolean v0, p0, Lcom/linearlistview/internal/IcsLinearLayout;->mUseLargestChild:Z

    return v0
.end method

.method protected measureChildWithMargins(Landroid/view/View;IIII)V
    .locals 6
    .param p1, "child"    # Landroid/view/View;
    .param p2, "parentWidthMeasureSpec"    # I
    .param p3, "widthUsed"    # I
    .param p4, "parentHeightMeasureSpec"    # I
    .param p5, "heightUsed"    # I

    .prologue
    const/4 v5, 0x1

    .line 155
    invoke-virtual {p0, p1}, Lcom/linearlistview/internal/IcsLinearLayout;->indexOfChild(Landroid/view/View;)I

    move-result v1

    .line 156
    .local v1, "index":I
    invoke-virtual {p0}, Lcom/linearlistview/internal/IcsLinearLayout;->getOrientation()I

    move-result v2

    .line 157
    .local v2, "orientation":I
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroid/widget/LinearLayout$LayoutParams;

    .line 158
    .local v3, "params":Landroid/widget/LinearLayout$LayoutParams;
    invoke-virtual {p0, v1}, Lcom/linearlistview/internal/IcsLinearLayout;->hasDividerBeforeChildAt(I)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 159
    if-ne v2, v5, :cond_2

    .line 161
    iget v4, p0, Lcom/linearlistview/internal/IcsLinearLayout;->mDividerHeight:I

    iput v4, v3, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 168
    :cond_0
    :goto_0
    invoke-virtual {p0}, Lcom/linearlistview/internal/IcsLinearLayout;->getChildCount()I

    move-result v0

    .line 169
    .local v0, "count":I
    add-int/lit8 v4, v0, -0x1

    if-ne v1, v4, :cond_1

    .line 170
    invoke-virtual {p0, v0}, Lcom/linearlistview/internal/IcsLinearLayout;->hasDividerBeforeChildAt(I)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 171
    if-ne v2, v5, :cond_3

    .line 172
    iget v4, p0, Lcom/linearlistview/internal/IcsLinearLayout;->mDividerHeight:I

    iput v4, v3, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 178
    :cond_1
    :goto_1
    invoke-super/range {p0 .. p5}, Landroid/widget/LinearLayout;->measureChildWithMargins(Landroid/view/View;IIII)V

    .line 179
    return-void

    .line 164
    .end local v0    # "count":I
    :cond_2
    iget v4, p0, Lcom/linearlistview/internal/IcsLinearLayout;->mDividerWidth:I

    iput v4, v3, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    goto :goto_0

    .line 174
    .restart local v0    # "count":I
    :cond_3
    iget v4, p0, Lcom/linearlistview/internal/IcsLinearLayout;->mDividerWidth:I

    iput v4, v3, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    goto :goto_1
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 2
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 183
    iget-object v0, p0, Lcom/linearlistview/internal/IcsLinearLayout;->mDivider:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_0

    .line 184
    invoke-virtual {p0}, Lcom/linearlistview/internal/IcsLinearLayout;->getOrientation()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    .line 185
    invoke-virtual {p0, p1}, Lcom/linearlistview/internal/IcsLinearLayout;->drawDividersVertical(Landroid/graphics/Canvas;)V

    .line 190
    :cond_0
    :goto_0
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->onDraw(Landroid/graphics/Canvas;)V

    .line 191
    return-void

    .line 187
    :cond_1
    invoke-virtual {p0, p1}, Lcom/linearlistview/internal/IcsLinearLayout;->drawDividersHorizontal(Landroid/graphics/Canvas;)V

    goto :goto_0
.end method

.method protected onMeasure(II)V
    .locals 2
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    .line 332
    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->onMeasure(II)V

    .line 334
    iget-boolean v1, p0, Lcom/linearlistview/internal/IcsLinearLayout;->mUseLargestChild:Z

    if-eqz v1, :cond_0

    .line 335
    invoke-virtual {p0}, Lcom/linearlistview/internal/IcsLinearLayout;->getOrientation()I

    move-result v0

    .line 336
    .local v0, "orientation":I
    packed-switch v0, :pswitch_data_0

    .line 346
    .end local v0    # "orientation":I
    :cond_0
    :goto_0
    return-void

    .line 338
    .restart local v0    # "orientation":I
    :pswitch_0
    invoke-direct {p0}, Lcom/linearlistview/internal/IcsLinearLayout;->useLargestChildHorizontal()V

    goto :goto_0

    .line 342
    :pswitch_1
    invoke-direct {p0}, Lcom/linearlistview/internal/IcsLinearLayout;->useLargestChildVertical()V

    goto :goto_0

    .line 336
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public setDividerDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 2
    .param p1, "divider"    # Landroid/graphics/drawable/Drawable;

    .prologue
    const/4 v0, 0x0

    .line 104
    iget-object v1, p0, Lcom/linearlistview/internal/IcsLinearLayout;->mDivider:Landroid/graphics/drawable/Drawable;

    if-ne p1, v1, :cond_0

    .line 118
    :goto_0
    return-void

    .line 107
    :cond_0
    iput-object p1, p0, Lcom/linearlistview/internal/IcsLinearLayout;->mDivider:Landroid/graphics/drawable/Drawable;

    .line 108
    instance-of v1, p1, Landroid/graphics/drawable/ColorDrawable;

    iput-boolean v1, p0, Lcom/linearlistview/internal/IcsLinearLayout;->mClipDivider:Z

    .line 109
    if-eqz p1, :cond_2

    .line 110
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v1

    iput v1, p0, Lcom/linearlistview/internal/IcsLinearLayout;->mDividerWidth:I

    .line 111
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v1

    iput v1, p0, Lcom/linearlistview/internal/IcsLinearLayout;->mDividerHeight:I

    .line 116
    :goto_1
    if-nez p1, :cond_1

    const/4 v0, 0x1

    :cond_1
    invoke-virtual {p0, v0}, Lcom/linearlistview/internal/IcsLinearLayout;->setWillNotDraw(Z)V

    .line 117
    invoke-virtual {p0}, Lcom/linearlistview/internal/IcsLinearLayout;->requestLayout()V

    goto :goto_0

    .line 113
    :cond_2
    iput v0, p0, Lcom/linearlistview/internal/IcsLinearLayout;->mDividerWidth:I

    .line 114
    iput v0, p0, Lcom/linearlistview/internal/IcsLinearLayout;->mDividerHeight:I

    goto :goto_1
.end method

.method public setDividerPadding(I)V
    .locals 0
    .param p1, "padding"    # I

    .prologue
    .line 130
    iput p1, p0, Lcom/linearlistview/internal/IcsLinearLayout;->mDividerPadding:I

    .line 131
    return-void
.end method

.method public setMeasureWithLargestChildEnabled(Z)V
    .locals 0
    .param p1, "enabled"    # Z

    .prologue
    .line 327
    iput-boolean p1, p0, Lcom/linearlistview/internal/IcsLinearLayout;->mUseLargestChild:Z

    .line 328
    return-void
.end method

.method public setShowDividers(I)V
    .locals 1
    .param p1, "showDividers"    # I

    .prologue
    .line 83
    iget v0, p0, Lcom/linearlistview/internal/IcsLinearLayout;->mShowDividers:I

    if-eq p1, v0, :cond_0

    .line 84
    invoke-virtual {p0}, Lcom/linearlistview/internal/IcsLinearLayout;->requestLayout()V

    .line 85
    invoke-virtual {p0}, Lcom/linearlistview/internal/IcsLinearLayout;->invalidate()V

    .line 87
    :cond_0
    iput p1, p0, Lcom/linearlistview/internal/IcsLinearLayout;->mShowDividers:I

    .line 88
    return-void
.end method
