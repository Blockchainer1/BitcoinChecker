.class public Lcom/mobnetic/coinguardian/activity/SettingsTTSActivity;
.super Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentSubActivity;
.source "SettingsTTSActivity.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentSubActivity",
        "<",
        "Lcom/mobnetic/coinguardian/fragment/SettingsTTSFragment;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 6
    invoke-direct {p0}, Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentSubActivity;-><init>()V

    return-void
.end method


# virtual methods
.method protected bridge synthetic createChildFragment()Landroid/support/v4/app/Fragment;
    .locals 1

    .prologue
    .line 6
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/activity/SettingsTTSActivity;->createChildFragment()Lcom/mobnetic/coinguardian/fragment/SettingsTTSFragment;

    move-result-object v0

    return-object v0
.end method

.method protected createChildFragment()Lcom/mobnetic/coinguardian/fragment/SettingsTTSFragment;
    .locals 1

    .prologue
    .line 10
    new-instance v0, Lcom/mobnetic/coinguardian/fragment/SettingsTTSFragment;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/fragment/SettingsTTSFragment;-><init>()V

    return-object v0
.end method
