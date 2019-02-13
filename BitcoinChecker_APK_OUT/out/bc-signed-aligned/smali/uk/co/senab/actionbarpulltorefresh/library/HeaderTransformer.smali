.class public abstract Luk/co/senab/actionbarpulltorefresh/library/HeaderTransformer;
.super Ljava/lang/Object;
.source "HeaderTransformer.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract hideHeaderView()Z
.end method

.method public onConfigurationChanged(Landroid/app/Activity;Landroid/content/res/Configuration;)V
    .locals 0
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "newConfig"    # Landroid/content/res/Configuration;

    .prologue
    .line 98
    return-void
.end method

.method public onPulled(F)V
    .locals 0
    .param p1, "percentagePulled"    # F

    .prologue
    .line 54
    return-void
.end method

.method public onRefreshMinimized()V
    .locals 0

    .prologue
    .line 74
    return-void
.end method

.method public onRefreshStarted()V
    .locals 0

    .prologue
    .line 61
    return-void
.end method

.method public onReleaseToRefresh()V
    .locals 0

    .prologue
    .line 68
    return-void
.end method

.method public onReset()V
    .locals 0

    .prologue
    .line 46
    return-void
.end method

.method public onViewCreated(Landroid/app/Activity;Landroid/view/View;)V
    .locals 0
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "headerView"    # Landroid/view/View;

    .prologue
    .line 37
    return-void
.end method

.method public abstract showHeaderView()Z
.end method
