.class final Lcom/mobnetic/coinguardian/util/TTSHelper$1;
.super Ljava/lang/Object;
.source "TTSHelper.java"

# interfaces
.implements Landroid/speech/tts/TextToSpeech$OnInitListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mobnetic/coinguardian/util/TTSHelper;->speak(Landroid/content/Context;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$appContext:Landroid/content/Context;


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .locals 0

    .prologue
    .line 50
    iput-object p1, p0, Lcom/mobnetic/coinguardian/util/TTSHelper$1;->val$appContext:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onInit(I)V
    .locals 3
    .param p1, "status"    # I

    .prologue
    const/4 v2, 0x0

    .line 53
    invoke-static {p1}, Lcom/mobnetic/coinguardian/util/TTSHelper;->isStatusSuccess(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 54
    invoke-static {}, Lcom/mobnetic/coinguardian/util/TTSHelper;->access$100()Landroid/speech/tts/TextToSpeech;

    move-result-object v0

    invoke-virtual {v0}, Landroid/speech/tts/TextToSpeech;->getLanguage()Ljava/util/Locale;

    move-result-object v0

    invoke-static {v0}, Lcom/mobnetic/coinguardian/util/TTSHelper;->access$002(Ljava/util/Locale;)Ljava/util/Locale;

    .line 55
    iget-object v0, p0, Lcom/mobnetic/coinguardian/util/TTSHelper$1;->val$appContext:Landroid/content/Context;

    invoke-static {}, Lcom/mobnetic/coinguardian/util/TTSHelper;->access$200()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mobnetic/coinguardian/util/TTSHelper;->access$300(Landroid/content/Context;Ljava/lang/String;)V

    .line 61
    :goto_0
    return-void

    .line 57
    :cond_0
    const-string v0, "TTS"

    const-string v1, "Initilization Failed!"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 58
    invoke-static {v2}, Lcom/mobnetic/coinguardian/util/TTSHelper;->access$002(Ljava/util/Locale;)Ljava/util/Locale;

    .line 59
    invoke-static {v2}, Lcom/mobnetic/coinguardian/util/TTSHelper;->access$102(Landroid/speech/tts/TextToSpeech;)Landroid/speech/tts/TextToSpeech;

    goto :goto_0
.end method
