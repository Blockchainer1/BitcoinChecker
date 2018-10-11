.class Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity$1;
.super Ljava/lang/Object;
.source "SimpleDonateFragmentSubActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


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
    .line 113
    .local p0, "this":Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity$1;, "Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity$1;"
    iput-object p1, p0, Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity$1;->this$0:Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 115
    .local p0, "this":Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity$1;, "Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity$1;"
    iget-object v0, p0, Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity$1;->this$0:Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity;

    invoke-virtual {v0}, Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "show_donate_dialog"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    .line 117
    packed-switch p2, :pswitch_data_0

    .line 141
    :goto_0
    return-void

    .line 119
    :pswitch_0
    iget-object v0, p0, Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity$1;->this$0:Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity;

    iget-object v1, p0, Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity$1;->this$0:Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity;

    invoke-static {v0, v1}, Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity;->access$000(Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity;Landroid/app/Activity;)V

    goto :goto_0

    .line 122
    :pswitch_1
    iget-object v0, p0, Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity$1;->this$0:Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity;

    iget-object v1, p0, Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity$1;->this$0:Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity;

    invoke-static {v0, v1}, Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity;->access$100(Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity;Landroid/app/Activity;)V

    goto :goto_0

    .line 125
    :pswitch_2
    iget-object v0, p0, Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity$1;->this$0:Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity;

    iget-object v1, p0, Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity$1;->this$0:Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity;

    invoke-static {v0, v1}, Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity;->access$200(Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity;Landroid/app/Activity;)V

    goto :goto_0

    .line 117
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method
