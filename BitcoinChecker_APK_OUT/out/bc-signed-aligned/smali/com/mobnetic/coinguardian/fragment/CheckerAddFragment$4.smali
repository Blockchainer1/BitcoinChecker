.class Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$4;
.super Ljava/lang/Object;
.source "CheckerAddFragment.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


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
    .line 236
    iput-object p1, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$4;->this$0:Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 238
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$4;->this$0:Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

    invoke-virtual {v0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-static {v0}, Lcom/mobnetic/coinguardian/util/PreferencesUtils;->setExchangeTutorialDone(Landroid/content/Context;)V

    .line 239
    return-void
.end method
