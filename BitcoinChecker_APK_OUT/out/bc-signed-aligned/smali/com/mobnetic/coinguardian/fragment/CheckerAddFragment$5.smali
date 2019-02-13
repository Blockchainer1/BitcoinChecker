.class Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$5;
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
    .line 246
    iput-object p1, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$5;->this$0:Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 248
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$5;->this$0:Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

    const/16 v1, 0xc7

    iget-object v2, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$5;->this$0:Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

    invoke-static {v2}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->access$500(Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;)Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getMarketKey()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/mobnetic/coinguardian/activity/MarketPickerListActivity;->startActivityForResult(Landroid/support/v4/app/Fragment;ILjava/lang/String;)V

    .line 249
    return-void
.end method
