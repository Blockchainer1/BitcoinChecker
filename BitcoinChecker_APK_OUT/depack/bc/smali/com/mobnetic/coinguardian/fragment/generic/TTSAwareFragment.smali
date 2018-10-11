.class public Lcom/mobnetic/coinguardian/fragment/generic/TTSAwareFragment;
.super Landroid/support/v4/preference/PreferenceFragment;
.source "TTSAwareFragment.java"

# interfaces
.implements Landroid/speech/tts/TextToSpeech$OnInitListener;


# instance fields
.field private isTTSAvailable:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 9
    invoke-direct {p0}, Landroid/support/v4/preference/PreferenceFragment;-><init>()V

    return-void
.end method


# virtual methods
.method protected isTTSAvailable()Z
    .locals 1

    .prologue
    .line 25
    iget-boolean v0, p0, Lcom/mobnetic/coinguardian/fragment/generic/TTSAwareFragment;->isTTSAvailable:Z

    return v0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "paramBundle"    # Landroid/os/Bundle;

    .prologue
    .line 15
    invoke-super {p0, p1}, Landroid/support/v4/preference/PreferenceFragment;->onCreate(Landroid/os/Bundle;)V

    .line 16
    invoke-virtual {p0, p1}, Lcom/mobnetic/coinguardian/fragment/generic/TTSAwareFragment;->onCreateBeforeInitTTS(Landroid/os/Bundle;)V

    .line 17
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/generic/TTSAwareFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-static {v0, p0}, Lcom/mobnetic/coinguardian/util/TTSHelper;->initTTS(Landroid/content/Context;Landroid/speech/tts/TextToSpeech$OnInitListener;)V

    .line 18
    return-void
.end method

.method protected onCreateBeforeInitTTS(Landroid/os/Bundle;)V
    .locals 0
    .param p1, "paramBundle"    # Landroid/os/Bundle;

    .prologue
    .line 22
    return-void
.end method

.method public final onInit(I)V
    .locals 1
    .param p1, "status"    # I

    .prologue
    .line 37
    invoke-static {p1}, Lcom/mobnetic/coinguardian/util/TTSHelper;->isStatusSuccess(I)Z

    move-result v0

    iput-boolean v0, p0, Lcom/mobnetic/coinguardian/fragment/generic/TTSAwareFragment;->isTTSAvailable:Z

    .line 38
    iget-boolean v0, p0, Lcom/mobnetic/coinguardian/fragment/generic/TTSAwareFragment;->isTTSAvailable:Z

    invoke-virtual {p0, v0}, Lcom/mobnetic/coinguardian/fragment/generic/TTSAwareFragment;->onTTSAvailable(Z)V

    .line 39
    return-void
.end method

.method protected onTTSAvailable(Z)V
    .locals 0
    .param p1, "available"    # Z

    .prologue
    .line 30
    return-void
.end method
