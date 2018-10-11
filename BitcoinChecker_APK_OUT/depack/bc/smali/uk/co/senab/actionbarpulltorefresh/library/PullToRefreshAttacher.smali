.class public Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;
.super Ljava/lang/Object;
.source "PullToRefreshAttacher.java"


# static fields
.field private static final DEBUG:Z = false

.field private static final LOG_TAG:Ljava/lang/String; = "PullToRefreshAttacher"


# instance fields
.field private mActivity:Landroid/app/Activity;

.field private mEnvironmentDelegate:Luk/co/senab/actionbarpulltorefresh/library/EnvironmentDelegate;

.field private final mHandler:Landroid/os/Handler;

.field private mHandlingTouchEventFromDown:Z

.field private mHeaderTransformer:Luk/co/senab/actionbarpulltorefresh/library/HeaderTransformer;

.field private mHeaderView:Landroid/view/View;

.field private mHeaderViewListener:Luk/co/senab/actionbarpulltorefresh/library/listeners/HeaderViewListener;

.field private mInitialMotionX:F

.field private mInitialMotionY:F

.field private mIsBeingDragged:Z

.field private mIsDestroyed:Z

.field private mIsRefreshing:Z

.field private mLastMotionY:F

.field private mOnRefreshListener:Luk/co/senab/actionbarpulltorefresh/library/listeners/OnRefreshListener;

.field private mPullBeginY:F

.field private final mRect:Landroid/graphics/Rect;

.field private final mRefreshMinimize:Z

.field private final mRefreshMinimizeDelay:I

.field private final mRefreshMinimizeRunnable:Ljava/lang/Runnable;

.field private final mRefreshOnUp:Z

.field private final mRefreshScrollDistance:F

.field private final mRefreshableViews:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap",
            "<",
            "Landroid/view/View;",
            "Luk/co/senab/actionbarpulltorefresh/library/viewdelegates/ViewDelegate;",
            ">;"
        }
    .end annotation
.end field

.field private final mTouchSlop:I

.field private mViewBeingDragged:Landroid/view/View;

.field private final mViewLocationResult:[I


# direct methods
.method protected constructor <init>(Landroid/app/Activity;Luk/co/senab/actionbarpulltorefresh/library/Options;)V
    .locals 4
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "options"    # Luk/co/senab/actionbarpulltorefresh/library/Options;

    .prologue
    const/4 v3, 0x0

    .line 78
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 71
    iput-boolean v3, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mIsDestroyed:Z

    .line 73
    const/4 v1, 0x2

    new-array v1, v1, [I

    iput-object v1, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mViewLocationResult:[I

    .line 74
    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    iput-object v1, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mRect:Landroid/graphics/Rect;

    .line 76
    new-instance v1, Landroid/os/Handler;

    invoke-direct {v1}, Landroid/os/Handler;-><init>()V

    iput-object v1, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mHandler:Landroid/os/Handler;

    .line 625
    new-instance v1, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher$3;

    invoke-direct {v1, p0}, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher$3;-><init>(Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;)V

    iput-object v1, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mRefreshMinimizeRunnable:Ljava/lang/Runnable;

    .line 79
    if-nez p2, :cond_0

    .line 80
    const-string v1, "PullToRefreshAttacher"

    const-string v2, "Given null options so using default options."

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 81
    new-instance p2, Luk/co/senab/actionbarpulltorefresh/library/Options;

    .end local p2    # "options":Luk/co/senab/actionbarpulltorefresh/library/Options;
    invoke-direct {p2}, Luk/co/senab/actionbarpulltorefresh/library/Options;-><init>()V

    .line 84
    .restart local p2    # "options":Luk/co/senab/actionbarpulltorefresh/library/Options;
    :cond_0
    iput-object p1, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mActivity:Landroid/app/Activity;

    .line 85
    new-instance v1, Ljava/util/WeakHashMap;

    invoke-direct {v1}, Ljava/util/WeakHashMap;-><init>()V

    iput-object v1, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mRefreshableViews:Ljava/util/WeakHashMap;

    .line 88
    iget v1, p2, Luk/co/senab/actionbarpulltorefresh/library/Options;->refreshScrollDistance:F

    iput v1, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mRefreshScrollDistance:F

    .line 89
    iget-boolean v1, p2, Luk/co/senab/actionbarpulltorefresh/library/Options;->refreshOnUp:Z

    iput-boolean v1, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mRefreshOnUp:Z

    .line 90
    iget v1, p2, Luk/co/senab/actionbarpulltorefresh/library/Options;->refreshMinimizeDelay:I

    iput v1, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mRefreshMinimizeDelay:I

    .line 91
    iget-boolean v1, p2, Luk/co/senab/actionbarpulltorefresh/library/Options;->refreshMinimize:Z

    iput-boolean v1, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mRefreshMinimize:Z

    .line 94
    iget-object v1, p2, Luk/co/senab/actionbarpulltorefresh/library/Options;->environmentDelegate:Luk/co/senab/actionbarpulltorefresh/library/EnvironmentDelegate;

    if-eqz v1, :cond_1

    iget-object v1, p2, Luk/co/senab/actionbarpulltorefresh/library/Options;->environmentDelegate:Luk/co/senab/actionbarpulltorefresh/library/EnvironmentDelegate;

    .line 95
    :goto_0
    iput-object v1, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mEnvironmentDelegate:Luk/co/senab/actionbarpulltorefresh/library/EnvironmentDelegate;

    .line 98
    iget-object v1, p2, Luk/co/senab/actionbarpulltorefresh/library/Options;->headerTransformer:Luk/co/senab/actionbarpulltorefresh/library/HeaderTransformer;

    if-eqz v1, :cond_2

    iget-object v1, p2, Luk/co/senab/actionbarpulltorefresh/library/Options;->headerTransformer:Luk/co/senab/actionbarpulltorefresh/library/HeaderTransformer;

    .line 99
    :goto_1
    iput-object v1, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mHeaderTransformer:Luk/co/senab/actionbarpulltorefresh/library/HeaderTransformer;

    .line 102
    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result v1

    iput v1, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mTouchSlop:I

    .line 105
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v1

    .line 106
    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 109
    .local v0, "decorView":Landroid/view/ViewGroup;
    iget-object v1, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mEnvironmentDelegate:Luk/co/senab/actionbarpulltorefresh/library/EnvironmentDelegate;

    .line 110
    invoke-interface {v1, p1}, Luk/co/senab/actionbarpulltorefresh/library/EnvironmentDelegate;->getContextForInflater(Landroid/app/Activity;)Landroid/content/Context;

    move-result-object v1

    .line 109
    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    iget v2, p2, Luk/co/senab/actionbarpulltorefresh/library/Options;->headerLayout:I

    .line 110
    invoke-virtual {v1, v2, v0, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mHeaderView:Landroid/view/View;

    .line 112
    iget-object v1, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mHeaderView:Landroid/view/View;

    if-nez v1, :cond_3

    .line 113
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Must supply valid layout id for header."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 95
    .end local v0    # "decorView":Landroid/view/ViewGroup;
    :cond_1
    invoke-virtual {p0}, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->createDefaultEnvironmentDelegate()Luk/co/senab/actionbarpulltorefresh/library/EnvironmentDelegate;

    move-result-object v1

    goto :goto_0

    .line 99
    :cond_2
    invoke-virtual {p0}, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->createDefaultHeaderTransformer()Luk/co/senab/actionbarpulltorefresh/library/HeaderTransformer;

    move-result-object v1

    goto :goto_1

    .line 116
    .restart local v0    # "decorView":Landroid/view/ViewGroup;
    :cond_3
    iget-object v1, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mHeaderView:Landroid/view/View;

    const/4 v2, 0x4

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 119
    iget-object v1, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mHeaderTransformer:Luk/co/senab/actionbarpulltorefresh/library/HeaderTransformer;

    iget-object v2, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mHeaderView:Landroid/view/View;

    invoke-virtual {v1, p1, v2}, Luk/co/senab/actionbarpulltorefresh/library/HeaderTransformer;->onViewCreated(Landroid/app/Activity;Landroid/view/View;)V

    .line 122
    iget-object v1, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mHandler:Landroid/os/Handler;

    new-instance v2, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher$1;

    invoke-direct {v2, p0, v0}, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher$1;-><init>(Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;Landroid/view/ViewGroup;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 134
    return-void
.end method

.method static synthetic access$000(Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;

    .prologue
    .line 42
    iget-object v0, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mHeaderView:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$100(Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;)Landroid/app/Activity;
    .locals 1
    .param p0, "x0"    # Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;

    .prologue
    .line 42
    iget-object v0, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mActivity:Landroid/app/Activity;

    return-object v0
.end method

.method static synthetic access$200(Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;)Landroid/os/Handler;
    .locals 1
    .param p0, "x0"    # Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;

    .prologue
    .line 42
    iget-object v0, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method private canRefresh(Z)Z
    .locals 1
    .param p1, "fromTouch"    # Z

    .prologue
    .line 538
    iget-boolean v0, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mIsRefreshing:Z

    if-nez v0, :cond_1

    if-eqz p1, :cond_0

    iget-object v0, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mOnRefreshListener:Luk/co/senab/actionbarpulltorefresh/library/listeners/OnRefreshListener;

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private checkScrollForRefresh(Landroid/view/View;)Z
    .locals 3
    .param p1, "view"    # Landroid/view/View;

    .prologue
    const/4 v0, 0x1

    .line 505
    iget-boolean v1, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mIsBeingDragged:Z

    if-eqz v1, :cond_0

    iget-boolean v1, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mRefreshOnUp:Z

    if-eqz v1, :cond_0

    if-eqz p1, :cond_0

    .line 506
    iget v1, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mLastMotionY:F

    iget v2, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mPullBeginY:F

    sub-float/2addr v1, v2

    invoke-direct {p0, p1}, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->getScrollNeededForRefresh(Landroid/view/View;)F

    move-result v2

    cmpl-float v1, v1, v2

    if-ltz v1, :cond_0

    .line 507
    invoke-direct {p0, p1, v0, v0}, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->setRefreshingInt(Landroid/view/View;ZZ)V

    .line 511
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private getScrollNeededForRefresh(Landroid/view/View;)F
    .locals 2
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 542
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v0

    int-to-float v0, v0

    iget v1, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mRefreshScrollDistance:F

    mul-float/2addr v0, v1

    return v0
.end method

.method private isDestroyed()Z
    .locals 2

    .prologue
    .line 586
    iget-boolean v0, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mIsDestroyed:Z

    if-eqz v0, :cond_0

    .line 587
    const-string v0, "PullToRefreshAttacher"

    const-string v1, "PullToRefreshAttacher is destroyed."

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 589
    :cond_0
    iget-boolean v0, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mIsDestroyed:Z

    return v0
.end method

.method private reset(Z)V
    .locals 2
    .param p1, "fromTouch"    # Z

    .prologue
    .line 547
    const/4 v0, 0x0

    iput-boolean v0, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mIsRefreshing:Z

    .line 550
    iget-boolean v0, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mRefreshMinimize:Z

    if-eqz v0, :cond_0

    .line 551
    iget-object v0, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mRefreshMinimizeRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 555
    :cond_0
    invoke-virtual {p0}, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->hideHeaderView()V

    .line 556
    return-void
.end method

.method private setRefreshingInt(Landroid/view/View;ZZ)V
    .locals 1
    .param p1, "view"    # Landroid/view/View;
    .param p2, "refreshing"    # Z
    .param p3, "fromTouch"    # Z

    .prologue
    .line 515
    invoke-direct {p0}, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->isDestroyed()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 530
    :cond_0
    :goto_0
    return-void

    .line 519
    :cond_1
    iget-boolean v0, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mIsRefreshing:Z

    if-eq v0, p2, :cond_0

    .line 523
    invoke-virtual {p0}, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->resetTouch()V

    .line 525
    if-eqz p2, :cond_2

    invoke-direct {p0, p3}, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->canRefresh(Z)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 526
    invoke-direct {p0, p1, p3}, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->startRefresh(Landroid/view/View;Z)V

    goto :goto_0

    .line 528
    :cond_2
    invoke-direct {p0, p3}, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->reset(Z)V

    goto :goto_0
.end method

.method private startRefresh(Landroid/view/View;Z)V
    .locals 4
    .param p1, "view"    # Landroid/view/View;
    .param p2, "fromTouch"    # Z

    .prologue
    .line 560
    const/4 v0, 0x1

    iput-boolean v0, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mIsRefreshing:Z

    .line 563
    if-eqz p2, :cond_0

    .line 564
    iget-object v0, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mOnRefreshListener:Luk/co/senab/actionbarpulltorefresh/library/listeners/OnRefreshListener;

    if-eqz v0, :cond_0

    .line 565
    iget-object v0, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mOnRefreshListener:Luk/co/senab/actionbarpulltorefresh/library/listeners/OnRefreshListener;

    invoke-interface {v0, p1}, Luk/co/senab/actionbarpulltorefresh/library/listeners/OnRefreshListener;->onRefreshStarted(Landroid/view/View;)V

    .line 570
    :cond_0
    iget-object v0, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mHeaderTransformer:Luk/co/senab/actionbarpulltorefresh/library/HeaderTransformer;

    invoke-virtual {v0}, Luk/co/senab/actionbarpulltorefresh/library/HeaderTransformer;->onRefreshStarted()V

    .line 573
    invoke-virtual {p0}, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->showHeaderView()V

    .line 576
    iget-boolean v0, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mRefreshMinimize:Z

    if-eqz v0, :cond_1

    .line 577
    iget v0, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mRefreshMinimizeDelay:I

    if-lez v0, :cond_2

    .line 578
    iget-object v0, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mRefreshMinimizeRunnable:Ljava/lang/Runnable;

    iget v2, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mRefreshMinimizeDelay:I

    int-to-long v2, v2

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 583
    :cond_1
    :goto_0
    return-void

    .line 580
    :cond_2
    iget-object v0, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mRefreshMinimizeRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0
.end method


# virtual methods
.method protected addHeaderViewToActivity(Landroid/view/View;Landroid/app/Activity;)V
    .locals 9
    .param p1, "headerViewLayout"    # Landroid/view/View;
    .param p2, "activity"    # Landroid/app/Activity;

    .prologue
    .line 594
    invoke-virtual {p2}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v6

    .line 595
    .local v6, "decorView":Landroid/view/View;
    new-instance v8, Landroid/graphics/Rect;

    invoke-direct {v8}, Landroid/graphics/Rect;-><init>()V

    .line 596
    .local v8, "visibleRect":Landroid/graphics/Rect;
    invoke-virtual {v6, v8}, Landroid/view/View;->getWindowVisibleDisplayFrame(Landroid/graphics/Rect;)V

    .line 599
    const/4 v1, -0x1

    .line 600
    .local v1, "width":I
    const/4 v2, -0x2

    .line 601
    .local v2, "height":I
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v7

    .line 602
    .local v7, "requestedLp":Landroid/view/ViewGroup$LayoutParams;
    if-eqz v7, :cond_0

    .line 603
    iget v1, v7, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 604
    iget v2, v7, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 608
    :cond_0
    new-instance v0, Landroid/view/WindowManager$LayoutParams;

    const/16 v3, 0x3e8

    const/16 v4, 0x18

    const/4 v5, -0x3

    invoke-direct/range {v0 .. v5}, Landroid/view/WindowManager$LayoutParams;-><init>(IIIII)V

    .line 612
    .local v0, "params":Landroid/view/WindowManager$LayoutParams;
    const/4 v3, 0x0

    iput v3, v0, Landroid/view/WindowManager$LayoutParams;->x:I

    .line 613
    iget v3, v8, Landroid/graphics/Rect;->top:I

    iput v3, v0, Landroid/view/WindowManager$LayoutParams;->y:I

    .line 614
    const/16 v3, 0x30

    iput v3, v0, Landroid/view/WindowManager$LayoutParams;->gravity:I

    .line 616
    invoke-virtual {p2}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v3

    invoke-interface {v3, p1, v0}, Landroid/view/WindowManager;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 617
    return-void
.end method

.method addRefreshableView(Landroid/view/View;Luk/co/senab/actionbarpulltorefresh/library/viewdelegates/ViewDelegate;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;
    .param p2, "viewDelegate"    # Luk/co/senab/actionbarpulltorefresh/library/viewdelegates/ViewDelegate;

    .prologue
    .line 142
    invoke-direct {p0}, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->isDestroyed()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 157
    :goto_0
    return-void

    .line 145
    :cond_0
    if-nez p1, :cond_1

    .line 146
    const-string v0, "PullToRefreshAttacher"

    const-string v1, "Refreshable View is null."

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 151
    :cond_1
    if-nez p2, :cond_2

    .line 152
    invoke-static {p1}, Luk/co/senab/actionbarpulltorefresh/library/InstanceCreationUtils;->getBuiltInViewDelegate(Landroid/view/View;)Luk/co/senab/actionbarpulltorefresh/library/viewdelegates/ViewDelegate;

    move-result-object p2

    .line 156
    :cond_2
    iget-object v0, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mRefreshableViews:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p1, p2}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method clearRefreshableViews()V
    .locals 1

    .prologue
    .line 171
    iget-object v0, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mRefreshableViews:Ljava/util/WeakHashMap;

    invoke-virtual {v0}, Ljava/util/WeakHashMap;->clear()V

    .line 172
    return-void
.end method

.method protected createDefaultEnvironmentDelegate()Luk/co/senab/actionbarpulltorefresh/library/EnvironmentDelegate;
    .locals 1

    .prologue
    .line 482
    new-instance v0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher$2;

    invoke-direct {v0, p0}, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher$2;-><init>(Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;)V

    return-object v0
.end method

.method protected createDefaultHeaderTransformer()Luk/co/senab/actionbarpulltorefresh/library/HeaderTransformer;
    .locals 1

    .prologue
    .line 501
    new-instance v0, Luk/co/senab/actionbarpulltorefresh/library/DefaultHeaderTransformer;

    invoke-direct {v0}, Luk/co/senab/actionbarpulltorefresh/library/DefaultHeaderTransformer;-><init>()V

    return-object v0
.end method

.method destroy()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 220
    iget-boolean v0, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mIsDestroyed:Z

    if-eqz v0, :cond_0

    .line 235
    :goto_0
    return-void

    .line 223
    :cond_0
    iget-object v0, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mHeaderView:Landroid/view/View;

    iget-object v1, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mActivity:Landroid/app/Activity;

    invoke-virtual {p0, v0, v1}, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->removeHeaderViewFromActivity(Landroid/view/View;Landroid/app/Activity;)V

    .line 226
    invoke-virtual {p0}, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->clearRefreshableViews()V

    .line 228
    iput-object v2, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mActivity:Landroid/app/Activity;

    .line 229
    iput-object v2, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mHeaderView:Landroid/view/View;

    .line 230
    iput-object v2, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mHeaderViewListener:Luk/co/senab/actionbarpulltorefresh/library/listeners/HeaderViewListener;

    .line 231
    iput-object v2, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mEnvironmentDelegate:Luk/co/senab/actionbarpulltorefresh/library/EnvironmentDelegate;

    .line 232
    iput-object v2, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mHeaderTransformer:Luk/co/senab/actionbarpulltorefresh/library/HeaderTransformer;

    .line 234
    const/4 v0, 0x1

    iput-boolean v0, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mIsDestroyed:Z

    goto :goto_0
.end method

.method final getAttachedActivity()Landroid/app/Activity;
    .locals 1

    .prologue
    .line 478
    iget-object v0, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mActivity:Landroid/app/Activity;

    return-object v0
.end method

.method getHeaderTransformer()Luk/co/senab/actionbarpulltorefresh/library/HeaderTransformer;
    .locals 1

    .prologue
    .line 259
    iget-object v0, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mHeaderTransformer:Luk/co/senab/actionbarpulltorefresh/library/HeaderTransformer;

    return-object v0
.end method

.method final getHeaderView()Landroid/view/View;
    .locals 1

    .prologue
    .line 252
    iget-object v0, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mHeaderView:Landroid/view/View;

    return-object v0
.end method

.method hideHeaderView()V
    .locals 3

    .prologue
    .line 469
    iget-object v0, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mHeaderTransformer:Luk/co/senab/actionbarpulltorefresh/library/HeaderTransformer;

    invoke-virtual {v0}, Luk/co/senab/actionbarpulltorefresh/library/HeaderTransformer;->hideHeaderView()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 470
    iget-object v0, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mHeaderViewListener:Luk/co/senab/actionbarpulltorefresh/library/listeners/HeaderViewListener;

    if-eqz v0, :cond_0

    .line 471
    iget-object v0, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mHeaderViewListener:Luk/co/senab/actionbarpulltorefresh/library/listeners/HeaderViewListener;

    iget-object v1, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mHeaderView:Landroid/view/View;

    const/4 v2, 0x2

    invoke-interface {v0, v1, v2}, Luk/co/senab/actionbarpulltorefresh/library/listeners/HeaderViewListener;->onStateChanged(Landroid/view/View;I)V

    .line 475
    :cond_0
    return-void
.end method

.method final isRefreshing()Z
    .locals 1

    .prologue
    .line 199
    iget-boolean v0, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mIsRefreshing:Z

    return v0
.end method

.method final isViewBeingDragged(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 9
    .param p1, "view"    # Landroid/view/View;
    .param p2, "event"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v5, 0x0

    .line 320
    invoke-virtual {p1}, Landroid/view/View;->isShown()Z

    move-result v6

    if-eqz v6, :cond_0

    iget-object v6, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mRefreshableViews:Ljava/util/WeakHashMap;

    invoke-virtual {v6, p1}, Ljava/util/WeakHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 322
    iget-object v6, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mViewLocationResult:[I

    invoke-virtual {p1, v6}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 323
    iget-object v6, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mViewLocationResult:[I

    aget v3, v6, v5

    .local v3, "viewLeft":I
    iget-object v6, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mViewLocationResult:[I

    const/4 v7, 0x1

    aget v4, v6, v7

    .line 324
    .local v4, "viewTop":I
    iget-object v6, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mRect:Landroid/graphics/Rect;

    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v7

    add-int/2addr v7, v3

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v8

    add-int/2addr v8, v4

    invoke-virtual {v6, v3, v4, v7, v8}, Landroid/graphics/Rect;->set(IIII)V

    .line 328
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawX()F

    move-result v6

    float-to-int v1, v6

    .local v1, "rawX":I
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawY()F

    move-result v6

    float-to-int v2, v6

    .line 329
    .local v2, "rawY":I
    iget-object v6, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mRect:Landroid/graphics/Rect;

    invoke-virtual {v6, v1, v2}, Landroid/graphics/Rect;->contains(II)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 331
    iget-object v6, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mRefreshableViews:Ljava/util/WeakHashMap;

    invoke-virtual {v6, p1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Luk/co/senab/actionbarpulltorefresh/library/viewdelegates/ViewDelegate;

    .line 332
    .local v0, "delegate":Luk/co/senab/actionbarpulltorefresh/library/viewdelegates/ViewDelegate;
    if-eqz v0, :cond_0

    .line 334
    iget-object v5, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mRect:Landroid/graphics/Rect;

    iget v5, v5, Landroid/graphics/Rect;->left:I

    sub-int v5, v1, v5

    int-to-float v5, v5

    iget-object v6, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mRect:Landroid/graphics/Rect;

    iget v6, v6, Landroid/graphics/Rect;->top:I

    sub-int v6, v2, v6

    int-to-float v6, v6

    invoke-interface {v0, p1, v5, v6}, Luk/co/senab/actionbarpulltorefresh/library/viewdelegates/ViewDelegate;->isReadyForPull(Landroid/view/View;FF)Z

    move-result v5

    .line 338
    .end local v0    # "delegate":Luk/co/senab/actionbarpulltorefresh/library/viewdelegates/ViewDelegate;
    .end local v1    # "rawX":I
    .end local v2    # "rawY":I
    .end local v3    # "viewLeft":I
    .end local v4    # "viewTop":I
    :cond_0
    return v5
.end method

.method minimizeHeader()V
    .locals 3

    .prologue
    .line 408
    invoke-direct {p0}, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->isDestroyed()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 415
    :cond_0
    :goto_0
    return-void

    .line 410
    :cond_1
    iget-object v0, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mHeaderTransformer:Luk/co/senab/actionbarpulltorefresh/library/HeaderTransformer;

    invoke-virtual {v0}, Luk/co/senab/actionbarpulltorefresh/library/HeaderTransformer;->onRefreshMinimized()V

    .line 412
    iget-object v0, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mHeaderViewListener:Luk/co/senab/actionbarpulltorefresh/library/listeners/HeaderViewListener;

    if-eqz v0, :cond_0

    .line 413
    iget-object v0, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mHeaderViewListener:Luk/co/senab/actionbarpulltorefresh/library/listeners/HeaderViewListener;

    iget-object v1, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mHeaderView:Landroid/view/View;

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Luk/co/senab/actionbarpulltorefresh/library/listeners/HeaderViewListener;->onStateChanged(Landroid/view/View;I)V

    goto :goto_0
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 2
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .prologue
    .line 181
    iget-object v0, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mHeaderTransformer:Luk/co/senab/actionbarpulltorefresh/library/HeaderTransformer;

    iget-object v1, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0, v1, p1}, Luk/co/senab/actionbarpulltorefresh/library/HeaderTransformer;->onConfigurationChanged(Landroid/app/Activity;Landroid/content/res/Configuration;)V

    .line 182
    return-void
.end method

.method final onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 8
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v7, 0x1

    .line 269
    invoke-virtual {p0}, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->isRefreshing()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 270
    const/4 v5, 0x0

    .line 316
    :goto_0
    return v5

    .line 273
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    .local v1, "x":F
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    .line 275
    .local v3, "y":F
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v5

    packed-switch v5, :pswitch_data_0

    .line 316
    :cond_1
    :goto_1
    iget-boolean v5, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mIsBeingDragged:Z

    goto :goto_0

    .line 279
    :pswitch_0
    iget-boolean v5, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mIsBeingDragged:Z

    if-nez v5, :cond_1

    iget v5, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mInitialMotionY:F

    const/4 v6, 0x0

    cmpl-float v5, v5, v6

    if-lez v5, :cond_1

    .line 280
    iget v5, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mInitialMotionY:F

    sub-float v4, v3, v5

    .line 281
    .local v4, "yDiff":F
    iget v5, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mInitialMotionX:F

    sub-float v2, v1, v5

    .line 283
    .local v2, "xDiff":F
    cmpl-float v5, v4, v2

    if-lez v5, :cond_2

    iget v5, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mTouchSlop:I

    int-to-float v5, v5

    cmpl-float v5, v4, v5

    if-lez v5, :cond_2

    .line 284
    iput-boolean v7, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mIsBeingDragged:Z

    .line 285
    invoke-virtual {p0, v3}, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->onPullStarted(F)V

    goto :goto_1

    .line 286
    :cond_2
    iget v5, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mTouchSlop:I

    neg-int v5, v5

    int-to-float v5, v5

    cmpg-float v5, v4, v5

    if-gez v5, :cond_1

    .line 287
    invoke-virtual {p0}, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->resetTouch()V

    goto :goto_1

    .line 295
    .end local v2    # "xDiff":F
    .end local v4    # "yDiff":F
    :pswitch_1
    invoke-direct {p0, v7}, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->canRefresh(Z)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 296
    iget-object v5, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mRefreshableViews:Ljava/util/WeakHashMap;

    invoke-virtual {v5}, Ljava/util/WeakHashMap;->keySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_3
    :goto_2
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    .line 297
    .local v0, "view":Landroid/view/View;
    invoke-virtual {p0, v0, p1}, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->isViewBeingDragged(Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 298
    iput v1, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mInitialMotionX:F

    .line 299
    iput v3, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mInitialMotionY:F

    .line 300
    iput-object v0, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mViewBeingDragged:Landroid/view/View;

    goto :goto_2

    .line 309
    .end local v0    # "view":Landroid/view/View;
    :pswitch_2
    invoke-virtual {p0}, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->resetTouch()V

    goto :goto_1

    .line 275
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_2
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method onPull(Landroid/view/View;F)V
    .locals 4
    .param p1, "view"    # Landroid/view/View;
    .param p2, "y"    # F

    .prologue
    const/4 v3, 0x1

    .line 436
    invoke-direct {p0, p1}, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->getScrollNeededForRefresh(Landroid/view/View;)F

    move-result v0

    .line 437
    .local v0, "pxScrollForRefresh":F
    iget v2, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mPullBeginY:F

    sub-float v1, p2, v2

    .line 439
    .local v1, "scrollLength":F
    cmpg-float v2, v1, v0

    if-gez v2, :cond_0

    .line 440
    iget-object v2, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mHeaderTransformer:Luk/co/senab/actionbarpulltorefresh/library/HeaderTransformer;

    div-float v3, v1, v0

    invoke-virtual {v2, v3}, Luk/co/senab/actionbarpulltorefresh/library/HeaderTransformer;->onPulled(F)V

    .line 448
    :goto_0
    return-void

    .line 442
    :cond_0
    iget-boolean v2, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mRefreshOnUp:Z

    if-eqz v2, :cond_1

    .line 443
    iget-object v2, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mHeaderTransformer:Luk/co/senab/actionbarpulltorefresh/library/HeaderTransformer;

    invoke-virtual {v2}, Luk/co/senab/actionbarpulltorefresh/library/HeaderTransformer;->onReleaseToRefresh()V

    goto :goto_0

    .line 445
    :cond_1
    invoke-direct {p0, p1, v3, v3}, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->setRefreshingInt(Landroid/view/View;ZZ)V

    goto :goto_0
.end method

.method onPullEnded()V
    .locals 1

    .prologue
    .line 454
    iget-boolean v0, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mIsRefreshing:Z

    if-nez v0, :cond_0

    .line 455
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->reset(Z)V

    .line 457
    :cond_0
    return-void
.end method

.method onPullStarted(F)V
    .locals 0
    .param p1, "y"    # F

    .prologue
    .line 427
    invoke-virtual {p0}, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->showHeaderView()V

    .line 428
    iput p1, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mPullBeginY:F

    .line 429
    return-void
.end method

.method final onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 5
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 347
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v4

    if-nez v4, :cond_0

    .line 348
    iput-boolean v2, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mHandlingTouchEventFromDown:Z

    .line 353
    :cond_0
    iget-boolean v4, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mHandlingTouchEventFromDown:Z

    if-eqz v4, :cond_2

    iget-boolean v4, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mIsBeingDragged:Z

    if-nez v4, :cond_2

    .line 354
    invoke-virtual {p0, p1}, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    .line 404
    :cond_1
    :goto_0
    return v2

    .line 358
    :cond_2
    iget-object v4, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mViewBeingDragged:Landroid/view/View;

    if-nez v4, :cond_3

    move v2, v3

    .line 359
    goto :goto_0

    .line 362
    :cond_3
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v4

    packed-switch v4, :pswitch_data_0

    goto :goto_0

    .line 395
    :pswitch_0
    iget-object v3, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mViewBeingDragged:Landroid/view/View;

    invoke-direct {p0, v3}, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->checkScrollForRefresh(Landroid/view/View;)Z

    .line 396
    iget-boolean v3, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mIsBeingDragged:Z

    if-eqz v3, :cond_4

    .line 397
    invoke-virtual {p0}, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->onPullEnded()V

    .line 399
    :cond_4
    invoke-virtual {p0}, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->resetTouch()V

    goto :goto_0

    .line 365
    :pswitch_1
    invoke-virtual {p0}, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->isRefreshing()Z

    move-result v4

    if-eqz v4, :cond_5

    move v2, v3

    .line 366
    goto :goto_0

    .line 369
    :cond_5
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    .line 371
    .local v0, "y":F
    iget-boolean v3, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mIsBeingDragged:Z

    if-eqz v3, :cond_1

    iget v3, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mLastMotionY:F

    cmpl-float v3, v0, v3

    if-eqz v3, :cond_1

    .line 372
    iget v3, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mLastMotionY:F

    sub-float v1, v0, v3

    .line 379
    .local v1, "yDx":F
    iget v3, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mTouchSlop:I

    neg-int v3, v3

    int-to-float v3, v3

    cmpl-float v3, v1, v3

    if-ltz v3, :cond_6

    .line 380
    iget-object v3, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mViewBeingDragged:Landroid/view/View;

    invoke-virtual {p0, v3, v0}, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->onPull(Landroid/view/View;F)V

    .line 382
    const/4 v3, 0x0

    cmpl-float v3, v1, v3

    if-lez v3, :cond_1

    .line 383
    iput v0, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mLastMotionY:F

    goto :goto_0

    .line 386
    :cond_6
    invoke-virtual {p0}, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->onPullEnded()V

    .line 387
    invoke-virtual {p0}, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->resetTouch()V

    goto :goto_0

    .line 362
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method protected removeHeaderViewFromActivity(Landroid/view/View;Landroid/app/Activity;)V
    .locals 1
    .param p1, "headerViewLayout"    # Landroid/view/View;
    .param p2, "activity"    # Landroid/app/Activity;

    .prologue
    .line 620
    invoke-virtual {p1}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 621
    invoke-virtual {p2}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v0

    invoke-interface {v0, p1}, Landroid/view/WindowManager;->removeView(Landroid/view/View;)V

    .line 623
    :cond_0
    return-void
.end method

.method resetTouch()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 418
    iput-boolean v0, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mIsBeingDragged:Z

    .line 419
    iput-boolean v0, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mHandlingTouchEventFromDown:Z

    .line 420
    const/high16 v0, -0x40800000    # -1.0f

    iput v0, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mPullBeginY:F

    iput v0, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mLastMotionY:F

    iput v0, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mInitialMotionY:F

    .line 421
    return-void
.end method

.method final setHeaderViewListener(Luk/co/senab/actionbarpulltorefresh/library/listeners/HeaderViewListener;)V
    .locals 0
    .param p1, "listener"    # Luk/co/senab/actionbarpulltorefresh/library/listeners/HeaderViewListener;

    .prologue
    .line 244
    iput-object p1, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mHeaderViewListener:Luk/co/senab/actionbarpulltorefresh/library/listeners/HeaderViewListener;

    .line 245
    return-void
.end method

.method setOnRefreshListener(Luk/co/senab/actionbarpulltorefresh/library/listeners/OnRefreshListener;)V
    .locals 0
    .param p1, "listener"    # Luk/co/senab/actionbarpulltorefresh/library/listeners/OnRefreshListener;

    .prologue
    .line 216
    iput-object p1, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mOnRefreshListener:Luk/co/senab/actionbarpulltorefresh/library/listeners/OnRefreshListener;

    .line 217
    return-void
.end method

.method final setRefreshComplete()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 209
    const/4 v0, 0x0

    invoke-direct {p0, v0, v1, v1}, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->setRefreshingInt(Landroid/view/View;ZZ)V

    .line 210
    return-void
.end method

.method final setRefreshing(Z)V
    .locals 2
    .param p1, "refreshing"    # Z

    .prologue
    .line 192
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-direct {p0, v0, p1, v1}, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->setRefreshingInt(Landroid/view/View;ZZ)V

    .line 193
    return-void
.end method

.method showHeaderView()V
    .locals 3

    .prologue
    .line 460
    iget-object v0, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mHeaderTransformer:Luk/co/senab/actionbarpulltorefresh/library/HeaderTransformer;

    invoke-virtual {v0}, Luk/co/senab/actionbarpulltorefresh/library/HeaderTransformer;->showHeaderView()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 461
    iget-object v0, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mHeaderViewListener:Luk/co/senab/actionbarpulltorefresh/library/listeners/HeaderViewListener;

    if-eqz v0, :cond_0

    .line 462
    iget-object v0, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mHeaderViewListener:Luk/co/senab/actionbarpulltorefresh/library/listeners/HeaderViewListener;

    iget-object v1, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mHeaderView:Landroid/view/View;

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Luk/co/senab/actionbarpulltorefresh/library/listeners/HeaderViewListener;->onStateChanged(Landroid/view/View;I)V

    .line 466
    :cond_0
    return-void
.end method

.method useViewDelegate(Ljava/lang/Class;Luk/co/senab/actionbarpulltorefresh/library/viewdelegates/ViewDelegate;)V
    .locals 3
    .param p2, "delegate"    # Luk/co/senab/actionbarpulltorefresh/library/viewdelegates/ViewDelegate;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Luk/co/senab/actionbarpulltorefresh/library/viewdelegates/ViewDelegate;",
            ")V"
        }
    .end annotation

    .prologue
    .line 160
    .local p1, "viewClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    iget-object v1, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mRefreshableViews:Ljava/util/WeakHashMap;

    invoke-virtual {v1}, Ljava/util/WeakHashMap;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    .line 161
    .local v0, "view":Landroid/view/View;
    invoke-virtual {p1, v0}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 162
    iget-object v2, p0, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->mRefreshableViews:Ljava/util/WeakHashMap;

    invoke-virtual {v2, v0, p2}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 165
    .end local v0    # "view":Landroid/view/View;
    :cond_1
    return-void
.end method
