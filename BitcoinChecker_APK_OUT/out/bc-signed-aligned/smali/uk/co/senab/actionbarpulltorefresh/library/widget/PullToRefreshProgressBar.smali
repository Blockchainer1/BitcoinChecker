.class public Luk/co/senab/actionbarpulltorefresh/library/widget/PullToRefreshProgressBar;
.super Landroid/view/View;
.source "PullToRefreshProgressBar.java"

# interfaces
.implements Luk/co/senab/actionbarpulltorefresh/library/widget/AnimationRunnable$AnimatorUpdateListener;


# static fields
.field private static final BASE_DURATION_MS:I = 0x1c2

.field private static final BASE_SEGMENT_COUNT:I = 0x3

.field private static final BASE_WIDTH_DP:I = 0x12c

.field private static final DEFAULT_BAR_HEIGHT_DP:I = 0x4

.field private static final DEFAULT_INDETERMINATE_BAR_SPACING_DP:I = 0x5

.field private static final DEFAULT_PROGRESS_MAX:I = 0x2710


# instance fields
.field private final mDensity:F

.field private final mDrawRect:Landroid/graphics/RectF;

.field private mIndeterminate:Z

.field private final mIndeterminateAnimator:Luk/co/senab/actionbarpulltorefresh/library/widget/AnimationRunnable;

.field private final mIndeterminateBarSpacing:I

.field private final mPaint:Landroid/graphics/Paint;

.field private mProgress:I

.field private mProgressBarColor:I

.field private mProgressBarRadiusPx:F

.field private mProgressMax:I

.field private mSegmentCount:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "c"    # Landroid/content/Context;

    .prologue
    .line 70
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Luk/co/senab/actionbarpulltorefresh/library/widget/PullToRefreshProgressBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 71
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 74
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 54
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Luk/co/senab/actionbarpulltorefresh/library/widget/PullToRefreshProgressBar;->mPaint:Landroid/graphics/Paint;

    .line 67
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Luk/co/senab/actionbarpulltorefresh/library/widget/PullToRefreshProgressBar;->mDrawRect:Landroid/graphics/RectF;

    .line 76
    invoke-virtual {p0}, Luk/co/senab/actionbarpulltorefresh/library/widget/PullToRefreshProgressBar;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    iput v0, p0, Luk/co/senab/actionbarpulltorefresh/library/widget/PullToRefreshProgressBar;->mDensity:F

    .line 78
    const/16 v0, 0x2710

    iput v0, p0, Luk/co/senab/actionbarpulltorefresh/library/widget/PullToRefreshProgressBar;->mProgressMax:I

    .line 80
    const/high16 v0, 0x40a00000    # 5.0f

    iget v1, p0, Luk/co/senab/actionbarpulltorefresh/library/widget/PullToRefreshProgressBar;->mDensity:F

    mul-float/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    iput v0, p0, Luk/co/senab/actionbarpulltorefresh/library/widget/PullToRefreshProgressBar;->mIndeterminateBarSpacing:I

    .line 82
    new-instance v0, Luk/co/senab/actionbarpulltorefresh/library/widget/AnimationRunnable;

    invoke-direct {v0, p0}, Luk/co/senab/actionbarpulltorefresh/library/widget/AnimationRunnable;-><init>(Landroid/view/View;)V

    iput-object v0, p0, Luk/co/senab/actionbarpulltorefresh/library/widget/PullToRefreshProgressBar;->mIndeterminateAnimator:Luk/co/senab/actionbarpulltorefresh/library/widget/AnimationRunnable;

    .line 83
    iget-object v0, p0, Luk/co/senab/actionbarpulltorefresh/library/widget/PullToRefreshProgressBar;->mIndeterminateAnimator:Luk/co/senab/actionbarpulltorefresh/library/widget/AnimationRunnable;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Luk/co/senab/actionbarpulltorefresh/library/widget/AnimationRunnable;->setRepeatCount(I)V

    .line 84
    iget-object v0, p0, Luk/co/senab/actionbarpulltorefresh/library/widget/PullToRefreshProgressBar;->mIndeterminateAnimator:Luk/co/senab/actionbarpulltorefresh/library/widget/AnimationRunnable;

    invoke-virtual {v0, p0}, Luk/co/senab/actionbarpulltorefresh/library/widget/AnimationRunnable;->setUpdateListener(Luk/co/senab/actionbarpulltorefresh/library/widget/AnimationRunnable$AnimatorUpdateListener;)V

    .line 86
    iget-object v0, p0, Luk/co/senab/actionbarpulltorefresh/library/widget/PullToRefreshProgressBar;->mPaint:Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 87
    iget-object v0, p0, Luk/co/senab/actionbarpulltorefresh/library/widget/PullToRefreshProgressBar;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p0}, Luk/co/senab/actionbarpulltorefresh/library/widget/PullToRefreshProgressBar;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Luk/co/senab/actionbarpulltorefresh/library/R$color;->default_progress_bar_color:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 88
    return-void
.end method


# virtual methods
.method drawIndeterminate(Landroid/graphics/Canvas;)V
    .locals 8
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 132
    iget-object v5, p0, Luk/co/senab/actionbarpulltorefresh/library/widget/PullToRefreshProgressBar;->mIndeterminateAnimator:Luk/co/senab/actionbarpulltorefresh/library/widget/AnimationRunnable;

    invoke-virtual {v5}, Luk/co/senab/actionbarpulltorefresh/library/widget/AnimationRunnable;->isStarted()Z

    move-result v5

    if-nez v5, :cond_1

    .line 147
    :cond_0
    return-void

    .line 136
    :cond_1
    iget-object v5, p0, Luk/co/senab/actionbarpulltorefresh/library/widget/PullToRefreshProgressBar;->mPaint:Landroid/graphics/Paint;

    iget v6, p0, Luk/co/senab/actionbarpulltorefresh/library/widget/PullToRefreshProgressBar;->mProgressBarColor:I

    invoke-virtual {v5, v6}, Landroid/graphics/Paint;->setColor(I)V

    .line 138
    iget-object v5, p0, Luk/co/senab/actionbarpulltorefresh/library/widget/PullToRefreshProgressBar;->mIndeterminateAnimator:Luk/co/senab/actionbarpulltorefresh/library/widget/AnimationRunnable;

    invoke-virtual {v5}, Luk/co/senab/actionbarpulltorefresh/library/widget/AnimationRunnable;->getAnimatedValue()F

    move-result v0

    .line 139
    .local v0, "animProgress":F
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v5

    int-to-float v5, v5

    iget v6, p0, Luk/co/senab/actionbarpulltorefresh/library/widget/PullToRefreshProgressBar;->mSegmentCount:I

    int-to-float v6, v6

    div-float v1, v5, v6

    .line 141
    .local v1, "barWidth":F
    const/4 v2, -0x1

    .local v2, "i":I
    :goto_0
    iget v5, p0, Luk/co/senab/actionbarpulltorefresh/library/widget/PullToRefreshProgressBar;->mSegmentCount:I

    if-ge v2, v5, :cond_0

    .line 142
    int-to-float v5, v2

    add-float/2addr v5, v0

    mul-float v3, v5, v1

    .line 143
    .local v3, "l":F
    add-float v5, v3, v1

    iget v6, p0, Luk/co/senab/actionbarpulltorefresh/library/widget/PullToRefreshProgressBar;->mIndeterminateBarSpacing:I

    int-to-float v6, v6

    sub-float v4, v5, v6

    .line 144
    .local v4, "r":F
    iget-object v5, p0, Luk/co/senab/actionbarpulltorefresh/library/widget/PullToRefreshProgressBar;->mDrawRect:Landroid/graphics/RectF;

    const/4 v6, 0x0

    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    move-result v7

    int-to-float v7, v7

    invoke-virtual {v5, v3, v6, v4, v7}, Landroid/graphics/RectF;->set(FFFF)V

    .line 145
    iget-object v5, p0, Luk/co/senab/actionbarpulltorefresh/library/widget/PullToRefreshProgressBar;->mDrawRect:Landroid/graphics/RectF;

    iget-object v6, p0, Luk/co/senab/actionbarpulltorefresh/library/widget/PullToRefreshProgressBar;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v5, v6}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 141
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method drawProgress(Landroid/graphics/Canvas;)V
    .locals 7
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/4 v6, 0x0

    .line 121
    iget-object v3, p0, Luk/co/senab/actionbarpulltorefresh/library/widget/PullToRefreshProgressBar;->mPaint:Landroid/graphics/Paint;

    iget v4, p0, Luk/co/senab/actionbarpulltorefresh/library/widget/PullToRefreshProgressBar;->mProgressBarColor:I

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 123
    iget v3, p0, Luk/co/senab/actionbarpulltorefresh/library/widget/PullToRefreshProgressBar;->mProgress:I

    int-to-float v3, v3

    iget v4, p0, Luk/co/senab/actionbarpulltorefresh/library/widget/PullToRefreshProgressBar;->mProgressMax:I

    int-to-float v4, v4

    div-float/2addr v3, v4

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-static {v3, v4}, Ljava/lang/Math;->min(FF)F

    move-result v3

    invoke-static {v3, v6}, Ljava/lang/Math;->max(FF)F

    move-result v2

    .line 124
    .local v2, "progress":F
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v3

    int-to-float v3, v3

    mul-float v0, v2, v3

    .line 125
    .local v0, "barWidth":F
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v3

    int-to-float v3, v3

    sub-float/2addr v3, v0

    const/high16 v4, 0x40000000    # 2.0f

    div-float v1, v3, v4

    .line 127
    .local v1, "l":F
    iget-object v3, p0, Luk/co/senab/actionbarpulltorefresh/library/widget/PullToRefreshProgressBar;->mDrawRect:Landroid/graphics/RectF;

    add-float v4, v1, v0

    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    move-result v5

    int-to-float v5, v5

    invoke-virtual {v3, v1, v6, v4, v5}, Landroid/graphics/RectF;->set(FFFF)V

    .line 128
    iget-object v3, p0, Luk/co/senab/actionbarpulltorefresh/library/widget/PullToRefreshProgressBar;->mDrawRect:Landroid/graphics/RectF;

    iget v4, p0, Luk/co/senab/actionbarpulltorefresh/library/widget/PullToRefreshProgressBar;->mProgressBarRadiusPx:F

    iget v5, p0, Luk/co/senab/actionbarpulltorefresh/library/widget/PullToRefreshProgressBar;->mProgressBarRadiusPx:F

    iget-object v6, p0, Luk/co/senab/actionbarpulltorefresh/library/widget/PullToRefreshProgressBar;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v3, v4, v5, v6}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 129
    return-void
.end method

.method public declared-synchronized getMax()I
    .locals 1

    .prologue
    .line 117
    monitor-enter p0

    :try_start_0
    iget v0, p0, Luk/co/senab/actionbarpulltorefresh/library/widget/PullToRefreshProgressBar;->mProgressMax:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized isIndeterminate()Z
    .locals 1

    .prologue
    .line 91
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Luk/co/senab/actionbarpulltorefresh/library/widget/PullToRefreshProgressBar;->mIndeterminate:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public onAnimationUpdate(Luk/co/senab/actionbarpulltorefresh/library/widget/AnimationRunnable;)V
    .locals 0
    .param p1, "animation"    # Luk/co/senab/actionbarpulltorefresh/library/widget/AnimationRunnable;

    .prologue
    .line 242
    invoke-virtual {p0}, Luk/co/senab/actionbarpulltorefresh/library/widget/PullToRefreshProgressBar;->invalidate()V

    .line 243
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 1
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 186
    iget-boolean v0, p0, Luk/co/senab/actionbarpulltorefresh/library/widget/PullToRefreshProgressBar;->mIndeterminate:Z

    if-eqz v0, :cond_0

    .line 187
    invoke-virtual {p0, p1}, Luk/co/senab/actionbarpulltorefresh/library/widget/PullToRefreshProgressBar;->drawIndeterminate(Landroid/graphics/Canvas;)V

    .line 191
    :goto_0
    return-void

    .line 189
    :cond_0
    invoke-virtual {p0, p1}, Luk/co/senab/actionbarpulltorefresh/library/widget/PullToRefreshProgressBar;->drawProgress(Landroid/graphics/Canvas;)V

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
    const/high16 v5, 0x3f800000    # 1.0f

    .line 151
    if-eqz p1, :cond_0

    .line 152
    invoke-virtual {p0}, Luk/co/senab/actionbarpulltorefresh/library/widget/PullToRefreshProgressBar;->getWidth()I

    move-result v3

    int-to-float v3, v3

    iget v4, p0, Luk/co/senab/actionbarpulltorefresh/library/widget/PullToRefreshProgressBar;->mDensity:F

    div-float/2addr v3, v4

    const/high16 v4, 0x43960000    # 300.0f

    div-float v2, v3, v4

    .line 154
    .local v2, "widthMultiplier":F
    const v3, 0x3e99999a    # 0.3f

    sub-float v4, v2, v5

    mul-float/2addr v3, v4

    add-float v0, v3, v5

    .line 155
    .local v0, "durationMult":F
    const v3, 0x3dcccccd    # 0.1f

    sub-float v4, v2, v5

    mul-float/2addr v3, v4

    add-float v1, v3, v5

    .line 156
    .local v1, "segmentMult":F
    iget-object v3, p0, Luk/co/senab/actionbarpulltorefresh/library/widget/PullToRefreshProgressBar;->mIndeterminateAnimator:Luk/co/senab/actionbarpulltorefresh/library/widget/AnimationRunnable;

    const/high16 v4, 0x43e10000    # 450.0f

    mul-float/2addr v4, v0

    float-to-int v4, v4

    invoke-virtual {v3, v4}, Luk/co/senab/actionbarpulltorefresh/library/widget/AnimationRunnable;->setDuration(I)V

    .line 157
    const/high16 v3, 0x40400000    # 3.0f

    mul-float/2addr v3, v1

    float-to-int v3, v3

    iput v3, p0, Luk/co/senab/actionbarpulltorefresh/library/widget/PullToRefreshProgressBar;->mSegmentCount:I

    .line 159
    .end local v0    # "durationMult":F
    .end local v1    # "segmentMult":F
    .end local v2    # "widthMultiplier":F
    :cond_0
    return-void
.end method

.method protected onMeasure(II)V
    .locals 5
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    const/high16 v4, 0x40800000    # 4.0f

    .line 163
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v2

    .line 164
    .local v2, "specWidth":I
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v1

    .line 168
    .local v1, "specHeight":I
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v3

    sparse-switch v3, :sswitch_data_0

    .line 177
    iget v3, p0, Luk/co/senab/actionbarpulltorefresh/library/widget/PullToRefreshProgressBar;->mDensity:F

    mul-float/2addr v3, v4

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v0

    .line 181
    .local v0, "height":I
    :goto_0
    invoke-virtual {p0, v2, v0}, Luk/co/senab/actionbarpulltorefresh/library/widget/PullToRefreshProgressBar;->setMeasuredDimension(II)V

    .line 182
    return-void

    .line 170
    .end local v0    # "height":I
    :sswitch_0
    move v0, v1

    .line 171
    .restart local v0    # "height":I
    goto :goto_0

    .line 173
    .end local v0    # "height":I
    :sswitch_1
    iget v3, p0, Luk/co/senab/actionbarpulltorefresh/library/widget/PullToRefreshProgressBar;->mDensity:F

    mul-float/2addr v3, v4

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v3

    invoke-static {v1, v3}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 174
    .restart local v0    # "height":I
    goto :goto_0

    .line 168
    :sswitch_data_0
    .sparse-switch
        -0x80000000 -> :sswitch_1
        0x40000000 -> :sswitch_0
    .end sparse-switch
.end method

.method protected onVisibilityChanged(Landroid/view/View;I)V
    .locals 1
    .param p1, "changedView"    # Landroid/view/View;
    .param p2, "visibility"    # I

    .prologue
    .line 195
    invoke-super {p0, p1, p2}, Landroid/view/View;->onVisibilityChanged(Landroid/view/View;I)V

    .line 197
    iget-boolean v0, p0, Luk/co/senab/actionbarpulltorefresh/library/widget/PullToRefreshProgressBar;->mIndeterminate:Z

    if-eqz v0, :cond_0

    .line 198
    if-nez p2, :cond_1

    .line 199
    iget-object v0, p0, Luk/co/senab/actionbarpulltorefresh/library/widget/PullToRefreshProgressBar;->mIndeterminateAnimator:Luk/co/senab/actionbarpulltorefresh/library/widget/AnimationRunnable;

    invoke-virtual {v0}, Luk/co/senab/actionbarpulltorefresh/library/widget/AnimationRunnable;->start()V

    .line 204
    :cond_0
    :goto_0
    return-void

    .line 201
    :cond_1
    iget-object v0, p0, Luk/co/senab/actionbarpulltorefresh/library/widget/PullToRefreshProgressBar;->mIndeterminateAnimator:Luk/co/senab/actionbarpulltorefresh/library/widget/AnimationRunnable;

    invoke-virtual {v0}, Luk/co/senab/actionbarpulltorefresh/library/widget/AnimationRunnable;->cancel()V

    goto :goto_0
.end method

.method public declared-synchronized setIndeterminate(Z)V
    .locals 2
    .param p1, "indeterminate"    # Z

    .prologue
    .line 95
    monitor-enter p0

    :try_start_0
    iget v0, p0, Luk/co/senab/actionbarpulltorefresh/library/widget/PullToRefreshProgressBar;->mProgress:I

    iget v1, p0, Luk/co/senab/actionbarpulltorefresh/library/widget/PullToRefreshProgressBar;->mProgressMax:I

    invoke-virtual {p0, v0, v1, p1}, Luk/co/senab/actionbarpulltorefresh/library/widget/PullToRefreshProgressBar;->setProgressState(IIZ)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 96
    monitor-exit p0

    return-void

    .line 95
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setMax(I)V
    .locals 2
    .param p1, "max"    # I

    .prologue
    .line 113
    monitor-enter p0

    :try_start_0
    iget v0, p0, Luk/co/senab/actionbarpulltorefresh/library/widget/PullToRefreshProgressBar;->mProgress:I

    iget-boolean v1, p0, Luk/co/senab/actionbarpulltorefresh/library/widget/PullToRefreshProgressBar;->mIndeterminate:Z

    invoke-virtual {p0, v0, p1, v1}, Luk/co/senab/actionbarpulltorefresh/library/widget/PullToRefreshProgressBar;->setProgressState(IIZ)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 114
    monitor-exit p0

    return-void

    .line 113
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setProgress(I)V
    .locals 2
    .param p1, "progress"    # I

    .prologue
    .line 99
    monitor-enter p0

    :try_start_0
    iget v0, p0, Luk/co/senab/actionbarpulltorefresh/library/widget/PullToRefreshProgressBar;->mProgressMax:I

    iget-boolean v1, p0, Luk/co/senab/actionbarpulltorefresh/library/widget/PullToRefreshProgressBar;->mIndeterminate:Z

    invoke-virtual {p0, p1, v0, v1}, Luk/co/senab/actionbarpulltorefresh/library/widget/PullToRefreshProgressBar;->setProgressState(IIZ)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 100
    monitor-exit p0

    return-void

    .line 99
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setProgressBarColor(I)V
    .locals 1
    .param p1, "color"    # I

    .prologue
    .line 103
    monitor-enter p0

    :try_start_0
    iput p1, p0, Luk/co/senab/actionbarpulltorefresh/library/widget/PullToRefreshProgressBar;->mProgressBarColor:I

    .line 104
    invoke-virtual {p0}, Luk/co/senab/actionbarpulltorefresh/library/widget/PullToRefreshProgressBar;->invalidate()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 105
    monitor-exit p0

    return-void

    .line 103
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setProgressBarCornerRadius(F)V
    .locals 1
    .param p1, "radiusPx"    # F

    .prologue
    .line 108
    monitor-enter p0

    :try_start_0
    iput p1, p0, Luk/co/senab/actionbarpulltorefresh/library/widget/PullToRefreshProgressBar;->mProgressBarRadiusPx:F

    .line 109
    invoke-virtual {p0}, Luk/co/senab/actionbarpulltorefresh/library/widget/PullToRefreshProgressBar;->invalidate()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 110
    monitor-exit p0

    return-void

    .line 108
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method setProgressState(IIZ)V
    .locals 2
    .param p1, "progress"    # I
    .param p2, "progressMax"    # I
    .param p3, "indeterminate"    # Z

    .prologue
    .line 207
    const/4 v0, 0x0

    .line 209
    .local v0, "invalidate":Z
    iget-boolean v1, p0, Luk/co/senab/actionbarpulltorefresh/library/widget/PullToRefreshProgressBar;->mIndeterminate:Z

    if-eq v1, p3, :cond_1

    .line 210
    iput-boolean p3, p0, Luk/co/senab/actionbarpulltorefresh/library/widget/PullToRefreshProgressBar;->mIndeterminate:Z

    .line 211
    iget-object v1, p0, Luk/co/senab/actionbarpulltorefresh/library/widget/PullToRefreshProgressBar;->mIndeterminateAnimator:Luk/co/senab/actionbarpulltorefresh/library/widget/AnimationRunnable;

    invoke-virtual {v1}, Luk/co/senab/actionbarpulltorefresh/library/widget/AnimationRunnable;->isStarted()Z

    move-result v1

    if-eq p3, v1, :cond_0

    .line 212
    iget-boolean v1, p0, Luk/co/senab/actionbarpulltorefresh/library/widget/PullToRefreshProgressBar;->mIndeterminate:Z

    if-eqz v1, :cond_5

    .line 213
    iget-object v1, p0, Luk/co/senab/actionbarpulltorefresh/library/widget/PullToRefreshProgressBar;->mIndeterminateAnimator:Luk/co/senab/actionbarpulltorefresh/library/widget/AnimationRunnable;

    invoke-virtual {v1}, Luk/co/senab/actionbarpulltorefresh/library/widget/AnimationRunnable;->start()V

    .line 218
    :cond_0
    :goto_0
    const/4 v0, 0x1

    .line 221
    :cond_1
    iget v1, p0, Luk/co/senab/actionbarpulltorefresh/library/widget/PullToRefreshProgressBar;->mProgress:I

    if-eq p1, v1, :cond_2

    .line 222
    iput p1, p0, Luk/co/senab/actionbarpulltorefresh/library/widget/PullToRefreshProgressBar;->mProgress:I

    .line 223
    iget-boolean v1, p0, Luk/co/senab/actionbarpulltorefresh/library/widget/PullToRefreshProgressBar;->mIndeterminate:Z

    if-nez v1, :cond_2

    .line 224
    const/4 v0, 0x1

    .line 228
    :cond_2
    iget v1, p0, Luk/co/senab/actionbarpulltorefresh/library/widget/PullToRefreshProgressBar;->mProgressMax:I

    if-eq p2, v1, :cond_3

    .line 229
    iput p2, p0, Luk/co/senab/actionbarpulltorefresh/library/widget/PullToRefreshProgressBar;->mProgressMax:I

    .line 230
    iget-boolean v1, p0, Luk/co/senab/actionbarpulltorefresh/library/widget/PullToRefreshProgressBar;->mIndeterminate:Z

    if-nez v1, :cond_3

    .line 231
    const/4 v0, 0x1

    .line 235
    :cond_3
    if-eqz v0, :cond_4

    .line 236
    invoke-virtual {p0}, Luk/co/senab/actionbarpulltorefresh/library/widget/PullToRefreshProgressBar;->invalidate()V

    .line 238
    :cond_4
    return-void

    .line 215
    :cond_5
    iget-object v1, p0, Luk/co/senab/actionbarpulltorefresh/library/widget/PullToRefreshProgressBar;->mIndeterminateAnimator:Luk/co/senab/actionbarpulltorefresh/library/widget/AnimationRunnable;

    invoke-virtual {v1}, Luk/co/senab/actionbarpulltorefresh/library/widget/AnimationRunnable;->cancel()V

    goto :goto_0
.end method
