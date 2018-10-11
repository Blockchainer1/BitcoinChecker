.class Luk/co/senab/actionbarpulltorefresh/library/widget/AnimationRunnable;
.super Ljava/lang/Object;
.source "AnimationRunnable.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Luk/co/senab/actionbarpulltorefresh/library/widget/AnimationRunnable$AnimatorUpdateListener;
    }
.end annotation


# static fields
.field public static final INFINITE:I = -0x1


# instance fields
.field private mAnimationValue:F

.field private mDuration:I

.field private mInterpolator:Landroid/view/animation/Interpolator;

.field private mRepeatCount:I

.field private mRunCount:I

.field private mStartTime:J

.field private mStarted:Z

.field private mUpdateListener:Luk/co/senab/actionbarpulltorefresh/library/widget/AnimationRunnable$AnimatorUpdateListener;

.field private final mView:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 0
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    iput-object p1, p0, Luk/co/senab/actionbarpulltorefresh/library/widget/AnimationRunnable;->mView:Landroid/view/View;

    .line 56
    return-void
.end method

.method private checkState()V
    .locals 2

    .prologue
    .line 120
    iget-object v0, p0, Luk/co/senab/actionbarpulltorefresh/library/widget/AnimationRunnable;->mInterpolator:Landroid/view/animation/Interpolator;

    if-nez v0, :cond_0

    .line 121
    new-instance v0, Landroid/view/animation/LinearInterpolator;

    invoke-direct {v0}, Landroid/view/animation/LinearInterpolator;-><init>()V

    iput-object v0, p0, Luk/co/senab/actionbarpulltorefresh/library/widget/AnimationRunnable;->mInterpolator:Landroid/view/animation/Interpolator;

    .line 123
    :cond_0
    iget v0, p0, Luk/co/senab/actionbarpulltorefresh/library/widget/AnimationRunnable;->mDuration:I

    if-nez v0, :cond_1

    .line 124
    iget-object v0, p0, Luk/co/senab/actionbarpulltorefresh/library/widget/AnimationRunnable;->mView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const/high16 v1, 0x10e0000

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v0

    iput v0, p0, Luk/co/senab/actionbarpulltorefresh/library/widget/AnimationRunnable;->mDuration:I

    .line 126
    :cond_1
    return-void
.end method

.method private restart()V
    .locals 2

    .prologue
    .line 84
    invoke-static {}, Landroid/view/animation/AnimationUtils;->currentAnimationTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Luk/co/senab/actionbarpulltorefresh/library/widget/AnimationRunnable;->mStartTime:J

    .line 85
    iget-object v0, p0, Luk/co/senab/actionbarpulltorefresh/library/widget/AnimationRunnable;->mView:Landroid/view/View;

    invoke-static {v0, p0}, Luk/co/senab/actionbarpulltorefresh/library/sdk/Compat;->postOnAnimation(Landroid/view/View;Ljava/lang/Runnable;)V

    .line 86
    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 1

    .prologue
    .line 89
    const/4 v0, 0x0

    iput-boolean v0, p0, Luk/co/senab/actionbarpulltorefresh/library/widget/AnimationRunnable;->mStarted:Z

    .line 90
    iget-object v0, p0, Luk/co/senab/actionbarpulltorefresh/library/widget/AnimationRunnable;->mView:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 91
    return-void
.end method

.method public getAnimatedValue()F
    .locals 1

    .prologue
    .line 98
    iget v0, p0, Luk/co/senab/actionbarpulltorefresh/library/widget/AnimationRunnable;->mAnimationValue:F

    return v0
.end method

.method public isStarted()Z
    .locals 1

    .prologue
    .line 94
    iget-boolean v0, p0, Luk/co/senab/actionbarpulltorefresh/library/widget/AnimationRunnable;->mStarted:Z

    return v0
.end method

.method public final run()V
    .locals 6

    .prologue
    .line 103
    iget-boolean v2, p0, Luk/co/senab/actionbarpulltorefresh/library/widget/AnimationRunnable;->mStarted:Z

    if-eqz v2, :cond_0

    iget-object v2, p0, Luk/co/senab/actionbarpulltorefresh/library/widget/AnimationRunnable;->mUpdateListener:Luk/co/senab/actionbarpulltorefresh/library/widget/AnimationRunnable$AnimatorUpdateListener;

    if-nez v2, :cond_1

    .line 117
    :cond_0
    :goto_0
    return-void

    .line 105
    :cond_1
    invoke-static {}, Landroid/view/animation/AnimationUtils;->currentAnimationTimeMillis()J

    move-result-wide v2

    iget-wide v4, p0, Luk/co/senab/actionbarpulltorefresh/library/widget/AnimationRunnable;->mStartTime:J

    sub-long v0, v2, v4

    .line 106
    .local v0, "timeElapsed":J
    iget-object v2, p0, Luk/co/senab/actionbarpulltorefresh/library/widget/AnimationRunnable;->mInterpolator:Landroid/view/animation/Interpolator;

    long-to-float v3, v0

    iget v4, p0, Luk/co/senab/actionbarpulltorefresh/library/widget/AnimationRunnable;->mDuration:I

    int-to-float v4, v4

    div-float/2addr v3, v4

    invoke-interface {v2, v3}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    move-result v2

    iput v2, p0, Luk/co/senab/actionbarpulltorefresh/library/widget/AnimationRunnable;->mAnimationValue:F

    .line 108
    iget-object v2, p0, Luk/co/senab/actionbarpulltorefresh/library/widget/AnimationRunnable;->mUpdateListener:Luk/co/senab/actionbarpulltorefresh/library/widget/AnimationRunnable$AnimatorUpdateListener;

    invoke-interface {v2, p0}, Luk/co/senab/actionbarpulltorefresh/library/widget/AnimationRunnable$AnimatorUpdateListener;->onAnimationUpdate(Luk/co/senab/actionbarpulltorefresh/library/widget/AnimationRunnable;)V

    .line 110
    iget v2, p0, Luk/co/senab/actionbarpulltorefresh/library/widget/AnimationRunnable;->mDuration:I

    int-to-long v2, v2

    cmp-long v2, v0, v2

    if-gez v2, :cond_2

    .line 111
    iget-object v2, p0, Luk/co/senab/actionbarpulltorefresh/library/widget/AnimationRunnable;->mView:Landroid/view/View;

    invoke-static {v2, p0}, Luk/co/senab/actionbarpulltorefresh/library/sdk/Compat;->postOnAnimation(Landroid/view/View;Ljava/lang/Runnable;)V

    goto :goto_0

    .line 113
    :cond_2
    iget v2, p0, Luk/co/senab/actionbarpulltorefresh/library/widget/AnimationRunnable;->mRunCount:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Luk/co/senab/actionbarpulltorefresh/library/widget/AnimationRunnable;->mRunCount:I

    iget v3, p0, Luk/co/senab/actionbarpulltorefresh/library/widget/AnimationRunnable;->mRepeatCount:I

    if-lt v2, v3, :cond_3

    iget v2, p0, Luk/co/senab/actionbarpulltorefresh/library/widget/AnimationRunnable;->mRepeatCount:I

    const/4 v3, -0x1

    if-ne v2, v3, :cond_0

    .line 114
    :cond_3
    invoke-direct {p0}, Luk/co/senab/actionbarpulltorefresh/library/widget/AnimationRunnable;->restart()V

    goto :goto_0
.end method

.method public setDuration(I)V
    .locals 0
    .param p1, "duration"    # I

    .prologue
    .line 59
    iput p1, p0, Luk/co/senab/actionbarpulltorefresh/library/widget/AnimationRunnable;->mDuration:I

    .line 60
    return-void
.end method

.method public setInterpolator(Landroid/view/animation/Interpolator;)V
    .locals 0
    .param p1, "interpolator"    # Landroid/view/animation/Interpolator;

    .prologue
    .line 63
    iput-object p1, p0, Luk/co/senab/actionbarpulltorefresh/library/widget/AnimationRunnable;->mInterpolator:Landroid/view/animation/Interpolator;

    .line 64
    return-void
.end method

.method public setRepeatCount(I)V
    .locals 0
    .param p1, "repeatCount"    # I

    .prologue
    .line 67
    iput p1, p0, Luk/co/senab/actionbarpulltorefresh/library/widget/AnimationRunnable;->mRepeatCount:I

    .line 68
    return-void
.end method

.method public setUpdateListener(Luk/co/senab/actionbarpulltorefresh/library/widget/AnimationRunnable$AnimatorUpdateListener;)V
    .locals 0
    .param p1, "listener"    # Luk/co/senab/actionbarpulltorefresh/library/widget/AnimationRunnable$AnimatorUpdateListener;

    .prologue
    .line 71
    iput-object p1, p0, Luk/co/senab/actionbarpulltorefresh/library/widget/AnimationRunnable;->mUpdateListener:Luk/co/senab/actionbarpulltorefresh/library/widget/AnimationRunnable$AnimatorUpdateListener;

    .line 72
    return-void
.end method

.method public start()V
    .locals 2

    .prologue
    .line 75
    iget-boolean v0, p0, Luk/co/senab/actionbarpulltorefresh/library/widget/AnimationRunnable;->mStarted:Z

    if-eqz v0, :cond_0

    .line 81
    :goto_0
    return-void

    .line 76
    :cond_0
    invoke-direct {p0}, Luk/co/senab/actionbarpulltorefresh/library/widget/AnimationRunnable;->checkState()V

    .line 77
    const/4 v0, 0x0

    iput v0, p0, Luk/co/senab/actionbarpulltorefresh/library/widget/AnimationRunnable;->mRunCount:I

    .line 78
    const/4 v0, 0x1

    iput-boolean v0, p0, Luk/co/senab/actionbarpulltorefresh/library/widget/AnimationRunnable;->mStarted:Z

    .line 79
    invoke-static {}, Landroid/view/animation/AnimationUtils;->currentAnimationTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Luk/co/senab/actionbarpulltorefresh/library/widget/AnimationRunnable;->mStartTime:J

    .line 80
    iget-object v0, p0, Luk/co/senab/actionbarpulltorefresh/library/widget/AnimationRunnable;->mView:Landroid/view/View;

    invoke-static {v0, p0}, Luk/co/senab/actionbarpulltorefresh/library/sdk/Compat;->postOnAnimation(Landroid/view/View;Ljava/lang/Runnable;)V

    goto :goto_0
.end method
