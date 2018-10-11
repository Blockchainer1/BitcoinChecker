.class Lcom/mobnetic/coinguardian/fragment/SettingsSoundsFragment$3;
.super Landroid/preference/RingtonePreference;
.source "SettingsSoundsFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mobnetic/coinguardian/fragment/SettingsSoundsFragment;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mobnetic/coinguardian/fragment/SettingsSoundsFragment;


# direct methods
.method constructor <init>(Lcom/mobnetic/coinguardian/fragment/SettingsSoundsFragment;Landroid/content/Context;)V
    .locals 0
    .param p1, "this$0"    # Lcom/mobnetic/coinguardian/fragment/SettingsSoundsFragment;
    .param p2, "x0"    # Landroid/content/Context;

    .prologue
    .line 49
    iput-object p1, p0, Lcom/mobnetic/coinguardian/fragment/SettingsSoundsFragment$3;->this$0:Lcom/mobnetic/coinguardian/fragment/SettingsSoundsFragment;

    invoke-direct {p0, p2}, Landroid/preference/RingtonePreference;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method protected onRestoreRingtone()Landroid/net/Uri;
    .locals 3

    .prologue
    .line 51
    invoke-super {p0}, Landroid/preference/RingtonePreference;->onRestoreRingtone()Landroid/net/Uri;

    move-result-object v0

    .line 52
    .local v0, "uri":Landroid/net/Uri;
    if-nez v0, :cond_0

    .line 53
    iget-object v1, p0, Lcom/mobnetic/coinguardian/fragment/SettingsSoundsFragment$3;->this$0:Lcom/mobnetic/coinguardian/fragment/SettingsSoundsFragment;

    invoke-virtual {v1}, Lcom/mobnetic/coinguardian/fragment/SettingsSoundsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    const-string v2, "bitcoin_checker_down_alert"

    invoke-static {v1, v2}, Lcom/mobnetic/coinguardian/util/SoundFilesManager;->getUriForRingtone(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .line 54
    :cond_0
    return-object v0
.end method
