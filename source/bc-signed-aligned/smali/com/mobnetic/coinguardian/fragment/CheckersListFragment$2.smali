.class Lcom/mobnetic/coinguardian/fragment/CheckersListFragment$2;
.super Ljava/lang/Object;
.source "CheckersListFragment.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;


# direct methods
.method constructor <init>(Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;

    .prologue
    .line 101
    iput-object p1, p0, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment$2;->this$0:Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 103
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment$2;->this$0:Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;

    invoke-virtual {v0}, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment$2;->this$0:Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;

    invoke-static {v0}, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;->access$100(Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;)Luk/co/senab/actionbarpulltorefresh/extras/actionbarcompat/PullToRefreshLayout;

    move-result-object v0

    if-nez v0, :cond_1

    .line 107
    :cond_0
    :goto_0
    return-void

    .line 106
    :cond_1
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment$2;->this$0:Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;

    invoke-static {v0}, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;->access$100(Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;)Luk/co/senab/actionbarpulltorefresh/extras/actionbarcompat/PullToRefreshLayout;

    move-result-object v0

    invoke-virtual {v0}, Luk/co/senab/actionbarpulltorefresh/extras/actionbarcompat/PullToRefreshLayout;->setRefreshComplete()V

    goto :goto_0
.end method
