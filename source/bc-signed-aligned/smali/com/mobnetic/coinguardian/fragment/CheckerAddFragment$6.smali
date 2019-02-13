.class Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$6;
.super Ljava/lang/Object;
.source "CheckerAddFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;


# direct methods
.method constructor <init>(Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

    .prologue
    .line 253
    iput-object p1, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$6;->this$0:Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 255
    new-instance v0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$6$1;

    iget-object v1, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$6;->this$0:Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

    invoke-virtual {v1}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    iget-object v2, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$6;->this$0:Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

    invoke-static {v2}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->access$600(Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;)Lcom/mobnetic/coinguardian/model/Market;

    move-result-object v2

    iget-object v3, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$6;->this$0:Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

    invoke-static {v3}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->access$700(Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;)Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;

    move-result-object v3

    invoke-direct {v0, p0, v1, v2, v3}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$6$1;-><init>(Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$6;Landroid/content/Context;Lcom/mobnetic/coinguardian/model/Market;Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;)V

    .line 263
    invoke-virtual {v0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$6$1;->show()V

    .line 264
    return-void
.end method
