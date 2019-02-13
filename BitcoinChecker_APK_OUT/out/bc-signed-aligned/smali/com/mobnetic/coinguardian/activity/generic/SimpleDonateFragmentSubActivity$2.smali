.class Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity$2;
.super Ljava/lang/Object;
.source "SimpleDonateFragmentSubActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity;->showDonateDialog()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity;


# direct methods
.method constructor <init>(Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity;

    .prologue
    .line 108
    .local p0, "this":Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity$2;, "Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity$2;"
    iput-object p1, p0, Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity$2;->this$0:Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 110
    .local p0, "this":Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity$2;, "Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity$2;"
    iget-object v0, p0, Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity$2;->this$0:Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity;

    invoke-virtual {v0}, Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "show_donate_dialog"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    .line 111
    return-void
.end method
