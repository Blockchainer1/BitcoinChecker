.class Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$6$1;
.super Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;
.source "CheckerAddFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$6;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$6;


# direct methods
.method constructor <init>(Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$6;Landroid/content/Context;Lcom/mobnetic/coinguardian/model/Market;Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;)V
    .locals 0
    .param p1, "this$1"    # Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$6;
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "market"    # Lcom/mobnetic/coinguardian/model/Market;
    .param p4, "currencyPairsMapHelper"    # Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;

    .prologue
    .line 255
    iput-object p1, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$6$1;->this$1:Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$6;

    invoke-direct {p0, p2, p3, p4}, Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;-><init>(Landroid/content/Context;Lcom/mobnetic/coinguardian/model/Market;Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;)V

    return-void
.end method


# virtual methods
.method public onPairsUpdated(Lcom/mobnetic/coinguardian/model/Market;Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;)V
    .locals 2
    .param p1, "market"    # Lcom/mobnetic/coinguardian/model/Market;
    .param p2, "currencyPairsMapHelper"    # Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;

    .prologue
    .line 257
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$6$1;->this$1:Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$6;

    iget-object v0, v0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$6;->this$0:Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

    invoke-static {v0, p2}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->access$702(Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;)Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;

    .line 258
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$6$1;->this$1:Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$6;

    iget-object v0, v0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$6;->this$0:Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

    invoke-virtual {v0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->getView()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$6$1;->this$1:Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$6;

    iget-object v0, v0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$6;->this$0:Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

    invoke-virtual {v0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 259
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$6$1;->this$1:Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$6;

    iget-object v0, v0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$6;->this$0:Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

    invoke-static {v0, p1}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->access$800(Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;Lcom/mobnetic/coinguardian/model/Market;)V

    .line 260
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$6$1;->this$1:Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$6;

    iget-object v0, v0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$6;->this$0:Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

    const/4 v1, 0x1

    invoke-static {v0, p1, v1}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->access$900(Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;Lcom/mobnetic/coinguardian/model/Market;Z)V

    .line 262
    :cond_0
    return-void
.end method
