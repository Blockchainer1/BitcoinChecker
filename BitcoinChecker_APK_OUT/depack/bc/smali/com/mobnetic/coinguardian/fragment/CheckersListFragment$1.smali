.class Lcom/mobnetic/coinguardian/fragment/CheckersListFragment$1;
.super Lcom/mobnetic/coinguardian/adapter/CheckersListAdapter;
.source "CheckersListFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;


# direct methods
.method constructor <init>(Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;Landroid/content/Context;)V
    .locals 0
    .param p1, "this$0"    # Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 83
    iput-object p1, p0, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment$1;->this$0:Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;

    invoke-direct {p0, p2}, Lcom/mobnetic/coinguardian/adapter/CheckersListAdapter;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public drop(II)V
    .locals 1
    .param p1, "from"    # I
    .param p2, "to"    # I

    .prologue
    .line 86
    invoke-super {p0, p1, p2}, Lcom/mobnetic/coinguardian/adapter/CheckersListAdapter;->drop(II)V

    .line 87
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment$1;->this$0:Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;

    invoke-static {v0, p1, p2}, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;->access$000(Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;II)V

    .line 88
    return-void
.end method
