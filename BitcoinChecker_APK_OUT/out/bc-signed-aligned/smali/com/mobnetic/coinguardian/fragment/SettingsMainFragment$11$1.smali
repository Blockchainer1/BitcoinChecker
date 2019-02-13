.class Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment$11$1;
.super Ljava/lang/Object;
.source "SettingsMainFragment.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment$11;->onPreferenceClick(Landroid/preference/Preference;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment$11;


# direct methods
.method constructor <init>(Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment$11;)V
    .locals 0
    .param p1, "this$1"    # Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment$11;

    .prologue
    .line 150
    iput-object p1, p0, Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment$11$1;->this$1:Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment$11;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 152
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment$11$1;->this$1:Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment$11;

    iget-object v0, v0, Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment$11;->this$0:Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment;

    invoke-virtual {v0}, Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    const-string v1, "mobnetic@gmail.com"

    const-string v2, "Bitcoin Checker"

    invoke-static {v0, v1, v2}, Lcom/mobnetic/coinguardian/util/Utils;->sendEmail(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 153
    return-void
.end method
