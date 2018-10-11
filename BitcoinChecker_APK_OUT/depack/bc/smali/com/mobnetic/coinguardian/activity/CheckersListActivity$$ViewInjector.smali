.class public Lcom/mobnetic/coinguardian/activity/CheckersListActivity$$ViewInjector;
.super Ljava/lang/Object;
.source "CheckersListActivity$$ViewInjector.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static inject(Lbutterknife/ButterKnife$Finder;Lcom/mobnetic/coinguardian/activity/CheckersListActivity;Ljava/lang/Object;)V
    .locals 3
    .param p0, "finder"    # Lbutterknife/ButterKnife$Finder;
    .param p1, "target"    # Lcom/mobnetic/coinguardian/activity/CheckersListActivity;
    .param p2, "source"    # Ljava/lang/Object;

    .prologue
    .line 10
    const v1, 0x7f0e0073

    invoke-virtual {p0, p2, v1}, Lbutterknife/ButterKnife$Finder;->findById(Ljava/lang/Object;I)Landroid/view/View;

    move-result-object v0

    .line 11
    .local v0, "view":Landroid/view/View;
    if-nez v0, :cond_0

    .line 12
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Required view with id \'2131624051\' for field \'donateBar\' was not found. If this view is optional add \'@Optional\' annotation."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 14
    :cond_0
    iput-object v0, p1, Lcom/mobnetic/coinguardian/activity/CheckersListActivity;->donateBar:Landroid/view/View;

    .line 15
    return-void
.end method

.method public static reset(Lcom/mobnetic/coinguardian/activity/CheckersListActivity;)V
    .locals 1
    .param p0, "target"    # Lcom/mobnetic/coinguardian/activity/CheckersListActivity;

    .prologue
    .line 18
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mobnetic/coinguardian/activity/CheckersListActivity;->donateBar:Landroid/view/View;

    .line 19
    return-void
.end method
