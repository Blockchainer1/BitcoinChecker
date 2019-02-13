.class Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment$9;
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
    .line 120
    iput-object p1, p0, Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment$9;->this$0:Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPreferenceClick(Landroid/preference/Preference;)Z
    .locals 2
    .param p1, "preference"    # Landroid/preference/Preference;

    .prologue
    .line 122
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment$9;->this$0:Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment;

    invoke-virtual {v0}, Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    iget-object v1, p0, Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment$9;->this$0:Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment;

    invoke-virtual {v1}, Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v4/app/FragmentActivity;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mobnetic/coinguardian/util/Utils;->goToGooglePlay(Landroid/content/Context;Ljava/lang/String;)Z

    .line 123
    const/4 v0, 0x1

    return v0
.end method
