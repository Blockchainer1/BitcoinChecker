.class Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment$7;
.super Ljava/lang/Object;
.source "SettingsMainFragment.java"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment;->onCreateBeforeInitTTS(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment;


# direct methods
.method constructor <init>(Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment;

    .prologue
    .line 105
    iput-object p1, p0, Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment$7;->this$0:Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPreferenceClick(Landroid/preference/Preference;)Z
    .locals 1
    .param p1, "preference"    # Landroid/preference/Preference;

    .prologue
    .line 107
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment$7;->this$0:Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment;

    invoke-static {v0}, Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment;->access$000(Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment;)Lcom/mobnetic/coinguardian/activity/SettingsMainActivity;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 108
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment$7;->this$0:Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment;

    invoke-static {v0}, Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment;->access$000(Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment;)Lcom/mobnetic/coinguardian/activity/SettingsMainActivity;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mobnetic/coinguardian/activity/SettingsMainActivity;->showDonateDialog()V

    .line 109
    :cond_0
    const/4 v0, 0x1

    return v0
.end method
