.class final Lcom/mobnetic/coinguardian/util/TTSHelper$2;
.super Landroid/speech/tts/UtteranceProgressListener;
.source "TTSHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mobnetic/coinguardian/util/TTSHelper;->setTTSListeners()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 120
    invoke-direct {p0}, Landroid/speech/tts/UtteranceProgressListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onDone(Ljava/lang/String;)V
    .locals 0
    .param p1, "utteranceId"    # Ljava/lang/String;

    .prologue
    .line 133
    invoke-static {}, Lcom/mobnetic/coinguardian/util/TTSHelper;->access$400()V

    .line 134
    return-void
.end method

.method public onError(Ljava/lang/String;)V
    .locals 0
    .param p1, "utteranceId"    # Ljava/lang/String;

    .prologue
    .line 128
    invoke-static {}, Lcom/mobnetic/coinguardian/util/TTSHelper;->access$400()V

    .line 129
    return-void
.end method

.method public onStart(Ljava/lang/String;)V
    .locals 0
    .param p1, "utteranceId"    # Ljava/lang/String;

    .prologue
    .line 124
    return-void
.end method
