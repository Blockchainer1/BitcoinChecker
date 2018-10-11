.class public Lcom/mobnetic/coinguardian/activity/SettingsSoundsActivity;
.super Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentSubActivity;
.source "SettingsSoundsActivity.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentSubActivity",
        "<",
        "Lcom/mobnetic/coinguardian/fragment/SettingsSoundsFragment;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 8
    invoke-direct {p0}, Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentSubActivity;-><init>()V

    return-void
.end method


# virtual methods
.method protected bridge synthetic createChildFragment()Landroid/support/v4/app/Fragment;
    .locals 1

    .prologue
    .line 8
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/activity/SettingsSoundsActivity;->createChildFragment()Lcom/mobnetic/coinguardian/fragment/SettingsSoundsFragment;

    move-result-object v0

    return-object v0
.end method

.method protected createChildFragment()Lcom/mobnetic/coinguardian/fragment/SettingsSoundsFragment;
    .locals 1

    .prologue
    .line 12
    new-instance v0, Lcom/mobnetic/coinguardian/fragment/SettingsSoundsFragment;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/fragment/SettingsSoundsFragment;-><init>()V

    return-object v0
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 1
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 17
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/activity/SettingsSoundsActivity;->getChildFragment()Landroid/support/v4/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/mobnetic/coinguardian/fragment/SettingsSoundsFragment;

    invoke-virtual {v0, p1, p2, p3}, Lcom/mobnetic/coinguardian/fragment/SettingsSoundsFragment;->onActivityResult(IILandroid/content/Intent;)V

    .line 18
    invoke-super {p0, p1, p2, p3}, Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentSubActivity;->onActivityResult(IILandroid/content/Intent;)V

    .line 19
    return-void
.end method
