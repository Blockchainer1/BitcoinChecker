.class Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity$4;
.super Ljava/lang/Object;
.source "SimpleDonateFragmentSubActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity;->makeDonationVirtual(Landroid/app/Activity;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity;

.field final synthetic val$context:Landroid/app/Activity;

.field final synthetic val$walletPackageName:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity;Landroid/app/Activity;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$0"    # Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity;

    .prologue
    .line 184
    .local p0, "this":Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity$4;, "Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity$4;"
    iput-object p1, p0, Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity$4;->this$0:Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity;

    iput-object p2, p0, Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity$4;->val$context:Landroid/app/Activity;

    iput-object p3, p0, Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity$4;->val$walletPackageName:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 186
    .local p0, "this":Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity$4;, "Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity$4;"
    iget-object v0, p0, Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity$4;->val$context:Landroid/app/Activity;

    iget-object v1, p0, Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity$4;->val$walletPackageName:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/mobnetic/coinguardian/util/Utils;->goToGooglePlay(Landroid/content/Context;Ljava/lang/String;)Z

    .line 187
    return-void
.end method
