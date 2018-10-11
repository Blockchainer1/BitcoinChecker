.class Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment$11$2;
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
    .line 145
    iput-object p1, p0, Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment$11$2;->this$1:Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment$11;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 147
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment$11$2;->this$1:Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment$11;

    iget-object v0, v0, Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment$11;->this$0:Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment;

    invoke-virtual {v0}, Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-static {v0}, Lcom/mobnetic/coinguardian/util/Utils;->goToGitHubIssues(Landroid/content/Context;)Z

    .line 148
    return-void
.end method
