.class Luk/co/senab/actionbarpulltorefresh/extras/actionbarcompat/AbcPullToRefreshAttacher;
.super Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;
.source "AbcPullToRefreshAttacher.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Luk/co/senab/actionbarpulltorefresh/extras/actionbarcompat/AbcPullToRefreshAttacher$AbcEnvironmentDelegate;
    }
.end annotation


# instance fields
.field private mHeaderViewWrapper:Landroid/widget/FrameLayout;


# direct methods
.method protected constructor <init>(Landroid/app/Activity;Luk/co/senab/actionbarpulltorefresh/library/Options;)V
    .locals 0
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "options"    # Luk/co/senab/actionbarpulltorefresh/library/Options;

    .prologue
    .line 36
    invoke-direct {p0, p1, p2}, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;-><init>(Landroid/app/Activity;Luk/co/senab/actionbarpulltorefresh/library/Options;)V

    .line 37
    return-void
.end method


# virtual methods
.method protected addHeaderViewToActivity(Landroid/view/View;Landroid/app/Activity;)V
    .locals 2
    .param p1, "headerViewLayout"    # Landroid/view/View;
    .param p2, "activity"    # Landroid/app/Activity;

    .prologue
    .line 41
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xe

    if-lt v0, v1, :cond_0

    .line 42
    invoke-super {p0, p1, p2}, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->addHeaderViewToActivity(Landroid/view/View;Landroid/app/Activity;)V

    .line 50
    :goto_0
    return-void

    .line 46
    :cond_0
    new-instance v0, Landroid/widget/FrameLayout;

    invoke-direct {v0, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Luk/co/senab/actionbarpulltorefresh/extras/actionbarcompat/AbcPullToRefreshAttacher;->mHeaderViewWrapper:Landroid/widget/FrameLayout;

    .line 47
    iget-object v0, p0, Luk/co/senab/actionbarpulltorefresh/extras/actionbarcompat/AbcPullToRefreshAttacher;->mHeaderViewWrapper:Landroid/widget/FrameLayout;

    invoke-virtual {v0, p1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 48
    iget-object v0, p0, Luk/co/senab/actionbarpulltorefresh/extras/actionbarcompat/AbcPullToRefreshAttacher;->mHeaderViewWrapper:Landroid/widget/FrameLayout;

    invoke-super {p0, v0, p2}, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->addHeaderViewToActivity(Landroid/view/View;Landroid/app/Activity;)V

    goto :goto_0
.end method

.method protected createDefaultEnvironmentDelegate()Luk/co/senab/actionbarpulltorefresh/library/EnvironmentDelegate;
    .locals 1

    .prologue
    .line 64
    new-instance v0, Luk/co/senab/actionbarpulltorefresh/extras/actionbarcompat/AbcPullToRefreshAttacher$AbcEnvironmentDelegate;

    invoke-direct {v0}, Luk/co/senab/actionbarpulltorefresh/extras/actionbarcompat/AbcPullToRefreshAttacher$AbcEnvironmentDelegate;-><init>()V

    return-object v0
.end method

.method protected createDefaultHeaderTransformer()Luk/co/senab/actionbarpulltorefresh/library/HeaderTransformer;
    .locals 1

    .prologue
    .line 69
    new-instance v0, Luk/co/senab/actionbarpulltorefresh/extras/actionbarcompat/AbcDefaultHeaderTransformer;

    invoke-direct {v0}, Luk/co/senab/actionbarpulltorefresh/extras/actionbarcompat/AbcDefaultHeaderTransformer;-><init>()V

    return-object v0
.end method

.method protected removeHeaderViewFromActivity(Landroid/view/View;Landroid/app/Activity;)V
    .locals 2
    .param p1, "headerViewLayout"    # Landroid/view/View;
    .param p2, "activity"    # Landroid/app/Activity;

    .prologue
    .line 54
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xe

    if-lt v0, v1, :cond_1

    .line 55
    invoke-super {p0, p1, p2}, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->removeHeaderViewFromActivity(Landroid/view/View;Landroid/app/Activity;)V

    .line 60
    :cond_0
    :goto_0
    return-void

    .line 56
    :cond_1
    iget-object v0, p0, Luk/co/senab/actionbarpulltorefresh/extras/actionbarcompat/AbcPullToRefreshAttacher;->mHeaderViewWrapper:Landroid/widget/FrameLayout;

    if-eqz v0, :cond_0

    .line 57
    iget-object v0, p0, Luk/co/senab/actionbarpulltorefresh/extras/actionbarcompat/AbcPullToRefreshAttacher;->mHeaderViewWrapper:Landroid/widget/FrameLayout;

    invoke-super {p0, v0, p2}, Luk/co/senab/actionbarpulltorefresh/library/PullToRefreshAttacher;->removeHeaderViewFromActivity(Landroid/view/View;Landroid/app/Activity;)V

    .line 58
    const/4 v0, 0x0

    iput-object v0, p0, Luk/co/senab/actionbarpulltorefresh/extras/actionbarcompat/AbcPullToRefreshAttacher;->mHeaderViewWrapper:Landroid/widget/FrameLayout;

    goto :goto_0
.end method
