.class public Luk/co/senab/actionbarpulltorefresh/extras/actionbarcompat/AbcPullToRefreshAttacher$AbcEnvironmentDelegate;
.super Ljava/lang/Object;
.source "AbcPullToRefreshAttacher.java"

# interfaces
.implements Luk/co/senab/actionbarpulltorefresh/library/EnvironmentDelegate;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Luk/co/senab/actionbarpulltorefresh/extras/actionbarcompat/AbcPullToRefreshAttacher;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "AbcEnvironmentDelegate"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 72
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getContextForInflater(Landroid/app/Activity;)Landroid/content/Context;
    .locals 3
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 77
    const/4 v1, 0x0

    .local v1, "context":Landroid/content/Context;
    move-object v2, p1

    .line 78
    check-cast v2, Landroid/support/v7/app/ActionBarActivity;

    invoke-virtual {v2}, Landroid/support/v7/app/ActionBarActivity;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v0

    .line 79
    .local v0, "ab":Landroid/support/v7/app/ActionBar;
    if-eqz v0, :cond_0

    .line 80
    invoke-virtual {v0}, Landroid/support/v7/app/ActionBar;->getThemedContext()Landroid/content/Context;

    move-result-object v1

    .line 82
    :cond_0
    if-nez v1, :cond_1

    .line 83
    move-object v1, p1

    .line 85
    :cond_1
    return-object v1
.end method
