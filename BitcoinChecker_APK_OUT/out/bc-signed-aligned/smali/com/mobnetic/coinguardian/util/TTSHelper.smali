.class public Lcom/mobnetic/coinguardian/util/TTSHelper;
.super Ljava/lang/Object;
.source "TTSHelper.java"


# static fields
.field private static final LOCK:Ljava/lang/Object;

.field static final afChangeListener:Landroid/media/AudioManager$OnAudioFocusChangeListener;

.field private static audioManager:Landroid/media/AudioManager;

.field private static defaultLanguageLocale:Ljava/util/Locale;

.field private static textToBeSpoken:Ljava/lang/String;

.field private static tts:Landroid/speech/tts/TextToSpeech;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 21
    const/4 v0, 0x0

    sput-object v0, Lcom/mobnetic/coinguardian/util/TTSHelper;->tts:Landroid/speech/tts/TextToSpeech;

    .line 22
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/mobnetic/coinguardian/util/TTSHelper;->LOCK:Ljava/lang/Object;

    .line 159
    new-instance v0, Lcom/mobnetic/coinguardian/util/TTSHelper$4;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/util/TTSHelper$4;-><init>()V

    sput-object v0, Lcom/mobnetic/coinguardian/util/TTSHelper;->afChangeListener:Landroid/media/AudioManager$OnAudioFocusChangeListener;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$002(Ljava/util/Locale;)Ljava/util/Locale;
    .locals 0
    .param p0, "x0"    # Ljava/util/Locale;

    .prologue
    .line 19
    sput-object p0, Lcom/mobnetic/coinguardian/util/TTSHelper;->defaultLanguageLocale:Ljava/util/Locale;

    return-object p0
.end method

.method static synthetic access$100()Landroid/speech/tts/TextToSpeech;
    .locals 1

    .prologue
    .line 19
    sget-object v0, Lcom/mobnetic/coinguardian/util/TTSHelper;->tts:Landroid/speech/tts/TextToSpeech;

    return-object v0
.end method

.method static synthetic access$102(Landroid/speech/tts/TextToSpeech;)Landroid/speech/tts/TextToSpeech;
    .locals 0
    .param p0, "x0"    # Landroid/speech/tts/TextToSpeech;

    .prologue
    .line 19
    sput-object p0, Lcom/mobnetic/coinguardian/util/TTSHelper;->tts:Landroid/speech/tts/TextToSpeech;

    return-object p0
.end method

.method static synthetic access$200()Ljava/lang/String;
    .locals 1

    .prologue
    .line 19
    sget-object v0, Lcom/mobnetic/coinguardian/util/TTSHelper;->textToBeSpoken:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$300(Landroid/content/Context;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Landroid/content/Context;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 19
    invoke-static {p0, p1}, Lcom/mobnetic/coinguardian/util/TTSHelper;->speakAfterInit(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$400()V
    .locals 0

    .prologue
    .line 19
    invoke-static {}, Lcom/mobnetic/coinguardian/util/TTSHelper;->onDoneSpeaking()V

    return-void
.end method

.method public static getProperAudioStream(Landroid/content/Context;)I
    .locals 1
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 173
    invoke-static {p0}, Lcom/mobnetic/coinguardian/util/TTSHelper;->isHeadsetConnected(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x3

    :goto_0
    return v0

    :cond_0
    invoke-static {p0}, Lcom/mobnetic/coinguardian/util/PreferencesUtils;->getTTSAdvancedStream(Landroid/content/Context;)I

    move-result v0

    goto :goto_0
.end method

.method public static initTTS(Landroid/content/Context;Landroid/speech/tts/TextToSpeech$OnInitListener;)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "onInitListener"    # Landroid/speech/tts/TextToSpeech$OnInitListener;

    .prologue
    .line 28
    sget-object v0, Lcom/mobnetic/coinguardian/util/TTSHelper;->tts:Landroid/speech/tts/TextToSpeech;

    if-nez v0, :cond_0

    .line 29
    new-instance v0, Landroid/speech/tts/TextToSpeech;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Landroid/speech/tts/TextToSpeech;-><init>(Landroid/content/Context;Landroid/speech/tts/TextToSpeech$OnInitListener;)V

    sput-object v0, Lcom/mobnetic/coinguardian/util/TTSHelper;->tts:Landroid/speech/tts/TextToSpeech;

    .line 33
    :goto_0
    return-void

    .line 31
    :cond_0
    const/4 v0, 0x0

    invoke-interface {p1, v0}, Landroid/speech/tts/TextToSpeech$OnInitListener;->onInit(I)V

    goto :goto_0
.end method

.method public static isHeadsetConnected(Landroid/content/Context;)Z
    .locals 2
    .param p0, "appContext"    # Landroid/content/Context;

    .prologue
    .line 177
    const-string v1, "audio"

    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    .line 178
    .local v0, "audioManager":Landroid/media/AudioManager;
    invoke-virtual {v0}, Landroid/media/AudioManager;->isWiredHeadsetOn()Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {v0}, Landroid/media/AudioManager;->isBluetoothA2dpOn()Z

    move-result v1

    if-eqz v1, :cond_1

    :cond_0
    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static isStatusSuccess(I)Z
    .locals 1
    .param p0, "status"    # I

    .prologue
    .line 73
    if-nez p0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static onDoneSpeaking()V
    .locals 2

    .prologue
    .line 155
    sget-object v0, Lcom/mobnetic/coinguardian/util/TTSHelper;->audioManager:Landroid/media/AudioManager;

    if-eqz v0, :cond_0

    .line 156
    sget-object v0, Lcom/mobnetic/coinguardian/util/TTSHelper;->audioManager:Landroid/media/AudioManager;

    sget-object v1, Lcom/mobnetic/coinguardian/util/TTSHelper;->afChangeListener:Landroid/media/AudioManager$OnAudioFocusChangeListener;

    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->abandonAudioFocus(Landroid/media/AudioManager$OnAudioFocusChangeListener;)I

    .line 157
    :cond_0
    return-void
.end method

.method private static setLanguageAndCheck(Ljava/util/Locale;)Z
    .locals 2
    .param p0, "locale"    # Ljava/util/Locale;

    .prologue
    .line 77
    sget-object v1, Lcom/mobnetic/coinguardian/util/TTSHelper;->tts:Landroid/speech/tts/TextToSpeech;

    invoke-virtual {v1, p0}, Landroid/speech/tts/TextToSpeech;->setLanguage(Ljava/util/Locale;)I

    move-result v0

    .line 78
    .local v0, "result":I
    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    const/4 v1, -0x2

    if-eq v0, v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private static setTTSListeners()V
    .locals 3
    .annotation build Landroid/annotation/TargetApi;
        value = 0xf
    .end annotation

    .prologue
    .line 119
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0xf

    if-lt v1, v2, :cond_1

    .line 120
    sget-object v1, Lcom/mobnetic/coinguardian/util/TTSHelper;->tts:Landroid/speech/tts/TextToSpeech;

    new-instance v2, Lcom/mobnetic/coinguardian/util/TTSHelper$2;

    invoke-direct {v2}, Lcom/mobnetic/coinguardian/util/TTSHelper$2;-><init>()V

    invoke-virtual {v1, v2}, Landroid/speech/tts/TextToSpeech;->setOnUtteranceProgressListener(Landroid/speech/tts/UtteranceProgressListener;)I

    move-result v0

    .line 136
    .local v0, "result":I
    if-eqz v0, :cond_0

    .line 137
    invoke-static {}, Lcom/mobnetic/coinguardian/util/TTSHelper;->onDoneSpeaking()V

    .line 146
    .end local v0    # "result":I
    :cond_0
    :goto_0
    return-void

    .line 139
    :cond_1
    sget-object v1, Lcom/mobnetic/coinguardian/util/TTSHelper;->tts:Landroid/speech/tts/TextToSpeech;

    new-instance v2, Lcom/mobnetic/coinguardian/util/TTSHelper$3;

    invoke-direct {v2}, Lcom/mobnetic/coinguardian/util/TTSHelper$3;-><init>()V

    invoke-virtual {v1, v2}, Landroid/speech/tts/TextToSpeech;->setOnUtteranceCompletedListener(Landroid/speech/tts/TextToSpeech$OnUtteranceCompletedListener;)I

    goto :goto_0
.end method

.method public static speak(Landroid/content/Context;Ljava/lang/String;)V
    .locals 5
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 36
    sget-object v3, Lcom/mobnetic/coinguardian/util/TTSHelper;->LOCK:Ljava/lang/Object;

    monitor-enter v3

    .line 38
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 40
    .local v0, "appContext":Landroid/content/Context;
    invoke-static {v0}, Lcom/mobnetic/coinguardian/util/PreferencesUtils;->getTTSDisplayOffOnly(Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_0

    const-string v2, "power"

    invoke-virtual {v0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/os/PowerManager;

    invoke-virtual {v2}, Landroid/os/PowerManager;->isScreenOn()Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v2

    if-eqz v2, :cond_0

    .line 41
    :try_start_1
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 70
    .end local v0    # "appContext":Landroid/content/Context;
    :goto_0
    return-void

    .line 43
    .restart local v0    # "appContext":Landroid/content/Context;
    :cond_0
    :try_start_2
    invoke-static {v0}, Lcom/mobnetic/coinguardian/util/PreferencesUtils;->getTTSHeadphonesOnly(Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-static {v0}, Lcom/mobnetic/coinguardian/util/TTSHelper;->isHeadsetConnected(Landroid/content/Context;)Z
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result v2

    if-nez v2, :cond_1

    .line 44
    :try_start_3
    monitor-exit v3

    goto :goto_0

    .line 69
    .end local v0    # "appContext":Landroid/content/Context;
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v2

    .line 48
    .restart local v0    # "appContext":Landroid/content/Context;
    :cond_1
    :try_start_4
    sput-object p1, Lcom/mobnetic/coinguardian/util/TTSHelper;->textToBeSpoken:Ljava/lang/String;

    .line 49
    sget-object v2, Lcom/mobnetic/coinguardian/util/TTSHelper;->tts:Landroid/speech/tts/TextToSpeech;

    if-nez v2, :cond_2

    .line 50
    new-instance v2, Landroid/speech/tts/TextToSpeech;

    new-instance v4, Lcom/mobnetic/coinguardian/util/TTSHelper$1;

    invoke-direct {v4, v0}, Lcom/mobnetic/coinguardian/util/TTSHelper$1;-><init>(Landroid/content/Context;)V

    invoke-direct {v2, v0, v4}, Landroid/speech/tts/TextToSpeech;-><init>(Landroid/content/Context;Landroid/speech/tts/TextToSpeech$OnInitListener;)V

    sput-object v2, Lcom/mobnetic/coinguardian/util/TTSHelper;->tts:Landroid/speech/tts/TextToSpeech;
    :try_end_4
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 69
    .end local v0    # "appContext":Landroid/content/Context;
    :goto_1
    :try_start_5
    monitor-exit v3
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto :goto_0

    .line 64
    .restart local v0    # "appContext":Landroid/content/Context;
    :cond_2
    :try_start_6
    sget-object v2, Lcom/mobnetic/coinguardian/util/TTSHelper;->textToBeSpoken:Ljava/lang/String;

    invoke-static {v0, v2}, Lcom/mobnetic/coinguardian/util/TTSHelper;->speakAfterInit(Landroid/content/Context;Ljava/lang/String;)V
    :try_end_6
    .catch Ljava/lang/Throwable; {:try_start_6 .. :try_end_6} :catch_0
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    goto :goto_1

    .line 66
    .end local v0    # "appContext":Landroid/content/Context;
    :catch_0
    move-exception v1

    .line 67
    .local v1, "e":Ljava/lang/Throwable;
    :try_start_7
    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    goto :goto_1
.end method

.method private static speakAfterInit(Landroid/content/Context;Ljava/lang/String;)V
    .locals 7
    .param p0, "appContext"    # Landroid/content/Context;
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 83
    sget-object v4, Lcom/mobnetic/coinguardian/util/TTSHelper;->tts:Landroid/speech/tts/TextToSpeech;

    if-nez v4, :cond_0

    .line 114
    :goto_0
    return-void

    .line 87
    :cond_0
    :try_start_0
    const-string v4, "audio"

    invoke-virtual {p0, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/media/AudioManager;

    sput-object v4, Lcom/mobnetic/coinguardian/util/TTSHelper;->audioManager:Landroid/media/AudioManager;

    .line 88
    sget-object v4, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-static {v4}, Lcom/mobnetic/coinguardian/util/TTSHelper;->setLanguageAndCheck(Ljava/util/Locale;)Z

    move-result v4

    if-nez v4, :cond_2

    .line 89
    const-string v4, "TTS"

    const-string v5, "ENGLISH language is not supported, setting default instead."

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 90
    sget-object v4, Lcom/mobnetic/coinguardian/util/TTSHelper;->defaultLanguageLocale:Ljava/util/Locale;

    if-eqz v4, :cond_1

    sget-object v4, Lcom/mobnetic/coinguardian/util/TTSHelper;->defaultLanguageLocale:Ljava/util/Locale;

    invoke-static {v4}, Lcom/mobnetic/coinguardian/util/TTSHelper;->setLanguageAndCheck(Ljava/util/Locale;)Z

    move-result v4

    if-nez v4, :cond_2

    .line 91
    :cond_1
    const-string v4, "TTS"

    const-string v5, "Error while setting default language!"

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 111
    :catch_0
    move-exception v0

    .line 112
    .local v0, "e":Ljava/lang/Throwable;
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_0

    .line 96
    .end local v0    # "e":Ljava/lang/Throwable;
    :cond_2
    :try_start_1
    invoke-static {p0}, Lcom/mobnetic/coinguardian/util/TTSHelper;->getProperAudioStream(Landroid/content/Context;)I

    move-result v3

    .line 98
    .local v3, "streamId":I
    sget-object v4, Lcom/mobnetic/coinguardian/util/TTSHelper;->audioManager:Landroid/media/AudioManager;

    sget-object v5, Lcom/mobnetic/coinguardian/util/TTSHelper;->afChangeListener:Landroid/media/AudioManager$OnAudioFocusChangeListener;

    const/4 v6, 0x3

    invoke-virtual {v4, v5, v3, v6}, Landroid/media/AudioManager;->requestAudioFocus(Landroid/media/AudioManager$OnAudioFocusChangeListener;II)I

    move-result v2

    .line 103
    .local v2, "requestAudioForucResult":I
    invoke-static {}, Lcom/mobnetic/coinguardian/util/TTSHelper;->setTTSListeners()V

    .line 104
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 105
    .local v1, "myHashParams":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v4, "utteranceId"

    const-string v5, "DONE"

    invoke-virtual {v1, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 108
    const-string v4, "streamType"

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 109
    sget-object v4, Lcom/mobnetic/coinguardian/util/TTSHelper;->tts:Landroid/speech/tts/TextToSpeech;

    const/4 v5, 0x1

    invoke-virtual {v4, p1, v5, v1}, Landroid/speech/tts/TextToSpeech;->speak(Ljava/lang/String;ILjava/util/HashMap;)I
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0
.end method

.method public static stopSpeaking()V
    .locals 1

    .prologue
    .line 149
    sget-object v0, Lcom/mobnetic/coinguardian/util/TTSHelper;->tts:Landroid/speech/tts/TextToSpeech;

    if-eqz v0, :cond_0

    .line 150
    sget-object v0, Lcom/mobnetic/coinguardian/util/TTSHelper;->tts:Landroid/speech/tts/TextToSpeech;

    invoke-virtual {v0}, Landroid/speech/tts/TextToSpeech;->stop()I

    .line 152
    :cond_0
    return-void
.end method
