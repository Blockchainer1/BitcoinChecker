.class Lcom/mobnetic/coinguardian/fragment/SettingsSoundsFragment$1;
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
    .line 27
    iput-object p1, p0, Lcom/mobnetic/coinguardian/fragment/SettingsSoundsFragment$1;->this$0:Lcom/mobnetic/coinguardian/fragment/SettingsSoundsFragment;

    invoke-direct {p0, p2}, Landroid/preference/RingtonePreference;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method protected onRestoreRingtone()Landroid/net/Uri;
    .locals 3

    .prologue
    .line 29
    invoke-super {p0}, Landroid/preference/RingtonePreference;->onRestoreRingtone()Landroid/net/Uri;

    move-result-object v0

    .line 30
    .local v0, "uri":Landroid/net/Uri;
    if-nez v0, :cond_0

    .line 31
    iget-object v1, p0, Lcom/mobnetic/coinguardian/fragment/SettingsSoundsFragment$1;->this$0:Lcom/mobnetic/coinguardian/fragment/SettingsSoundsFragment;

    invoke-virtual {v1}, Lcom/mobnetic/coinguardian/fragment/SettingsSoundsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    const-string v2, "bitcoin_checker_up_cheers"

    invoke-static {v1, v2}, Lcom/mobnetic/coinguardian/util/SoundFilesManager;->getUriForRingtone(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .line 32
    :cond_0
    return-object v0
.end method
