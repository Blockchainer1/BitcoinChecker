.class public Lcom/mobnetic/coinguardian/activity/SettingsMainActivity;
.super Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity;
.source "SettingsMainActivity.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity",
        "<",
        "Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 10
    invoke-direct {p0}, Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity;-><init>()V

    return-void
.end method

.method public static startSettingsMainActivity(Landroid/content/Context;Z)V
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "showDonateDialog"    # Z

    .prologue
    .line 28
    const-class v0, Lcom/mobnetic/coinguardian/activity/SettingsMainActivity;

    invoke-static {p0, v0, p1}, Lcom/mobnetic/coinguardian/activity/SettingsMainActivity;->startSimpleDonateFragmentActivity(Landroid/content/Context;Ljava/lang/Class;Z)V

    .line 29
    return-void
.end method


# virtual methods
.method protected bridge synthetic createChildFragment()Landroid/support/v4/app/Fragment;
    .locals 1

    .prologue
    .line 10
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/activity/SettingsMainActivity;->createChildFragment()Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment;

    move-result-object v0

    return-object v0
.end method

.method protected createChildFragment()Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment;
    .locals 1

    .prologue
    .line 21
    new-instance v0, Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/fragment/SettingsMainFragment;-><init>()V

    return-object v0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 0
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 14
    invoke-super {p0, p1}, Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity;->onCreate(Landroid/os/Bundle;)V

    .line 16
    invoke-static {p0}, Lcom/mobnetic/coinguardian/util/SoundFilesManager;->installRingtonesIfNeeded(Landroid/content/Context;)V

    .line 17
    return-void
.end method
