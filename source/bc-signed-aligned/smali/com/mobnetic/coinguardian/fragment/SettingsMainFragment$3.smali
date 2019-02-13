.class Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment$3;
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
    .line 67
    iput-object p1, p0, Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment$3;->this$0:Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPreferenceClick(Landroid/preference/Preference;)Z
    .locals 4
    .param p1, "preference"    # Landroid/preference/Preference;

    .prologue
    .line 69
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment$3;->this$0:Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment;

    new-instance v1, Landroid/content/Intent;

    iget-object v2, p0, Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment$3;->this$0:Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment;

    invoke-virtual {v2}, Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    const-class v3, Lcom/mobnetic/coinguardian/activity/SettingsSoundsActivity;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v0, v1}, Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment;->startActivity(Landroid/content/Intent;)V

    .line 70
    const/4 v0, 0x1

    return v0
.end method
