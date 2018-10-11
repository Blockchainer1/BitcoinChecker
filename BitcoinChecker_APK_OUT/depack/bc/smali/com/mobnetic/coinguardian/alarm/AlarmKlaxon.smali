.class public Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon;
.super Landroid/app/Service;
.source "AlarmKlaxon.java"


# static fields
.field private static final DEFAULT_ALARM_TIMEOUT_MINUTES:I = 0xa

.field private static final KILLER:I = 0x3e8

.field private static final TAG:Ljava/lang/String; = "AlarmKlaxon"

.field private static final loggingOn:Z

.field private static final sVibratePattern:[J


# instance fields
.field private alarmRecord:Lcom/mobnetic/coinguardian/db/content/AlarmRecord;

.field private mHandler:Landroid/os/Handler;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "HandlerLeak"
        }
    .end annotation
.end field

.field private mMediaPlayer:Landroid/media/MediaPlayer;

.field private mPlaying:Z

.field private final mReceiver:Landroid/content/BroadcastReceiver;

.field private mStartTime:J

.field private mVibrator:Landroid/os/Vibrator;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 53
    const/4 v0, 0x2

    new-array v0, v0, [J

    fill-array-data v0, :array_0

    sput-object v0, Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon;->sVibratePattern:[J

    return-void

    nop

    :array_0
    .array-data 8
        0x1f4
        0x1f4
    .end array-data
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 49
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    .line 55
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon;->mPlaying:Z

    .line 76
    new-instance v0, Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon$1;

    invoke-direct {v0, p0}, Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon$1;-><init>(Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon;)V

    iput-object v0, p0, Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon;->mHandler:Landroid/os/Handler;

    .line 108
    new-instance v0, Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon$2;

    invoke-direct {v0, p0}, Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon$2;-><init>(Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon;)V

    iput-object v0, p0, Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon;->mReceiver:Landroid/content/BroadcastReceiver;

    return-void
.end method

.method static synthetic access$000(Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon;Lcom/mobnetic/coinguardian/db/content/AlarmRecord;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon;
    .param p1, "x1"    # Lcom/mobnetic/coinguardian/db/content/AlarmRecord;
    .param p2, "x2"    # Z

    .prologue
    .line 49
    invoke-direct {p0, p1, p2}, Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon;->sendKillBroadcast(Lcom/mobnetic/coinguardian/db/content/AlarmRecord;Z)V

    return-void
.end method

.method static synthetic access$100(Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon;JZ)V
    .locals 1
    .param p0, "x0"    # Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon;
    .param p1, "x1"    # J
    .param p3, "x2"    # Z

    .prologue
    .line 49
    invoke-direct {p0, p1, p2, p3}, Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon;->dismiss(JZ)V

    return-void
.end method

.method static synthetic access$202(Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon;Landroid/media/MediaPlayer;)Landroid/media/MediaPlayer;
    .locals 0
    .param p0, "x0"    # Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon;
    .param p1, "x1"    # Landroid/media/MediaPlayer;

    .prologue
    .line 49
    iput-object p1, p0, Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon;->mMediaPlayer:Landroid/media/MediaPlayer;

    return-object p1
.end method

.method private disableKiller()V
    .locals 2

    .prologue
    .line 377
    iget-object v0, p0, Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon;->mHandler:Landroid/os/Handler;

    const/16 v1, 0x3e8

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 378
    return-void
.end method

.method private dismiss(JZ)V
    .locals 3
    .param p1, "checkerRecordId"    # J
    .param p3, "replaced"    # Z

    .prologue
    .line 218
    iget-object v0, p0, Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon;->alarmRecord:Lcom/mobnetic/coinguardian/db/content/AlarmRecord;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon;->alarmRecord:Lcom/mobnetic/coinguardian/db/content/AlarmRecord;

    invoke-virtual {v0}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->getCheckerId()J

    move-result-wide v0

    cmp-long v0, v0, p1

    if-eqz v0, :cond_1

    .line 229
    :cond_0
    :goto_0
    return-void

    .line 224
    :cond_1
    iget-object v0, p0, Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon;->alarmRecord:Lcom/mobnetic/coinguardian/db/content/AlarmRecord;

    invoke-virtual {v0}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->getId()J

    move-result-wide v0

    invoke-static {p0, v0, v1}, Lcom/mobnetic/coinguardian/util/NotificationUtils;->clearAlarmNotificationForAlarmRecord(Landroid/content/Context;J)V

    .line 226
    if-nez p3, :cond_0

    .line 227
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon;->stopSelf()V

    goto :goto_0
.end method

.method private enableKiller(Lcom/mobnetic/coinguardian/db/content/AlarmRecord;)V
    .locals 8
    .param p1, "alarmRecord"    # Lcom/mobnetic/coinguardian/db/content/AlarmRecord;

    .prologue
    .line 370
    const/16 v0, 0xa

    .line 371
    .local v0, "autoSnoozeMinutes":I
    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    .line 372
    iget-object v1, p0, Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon;->mHandler:Landroid/os/Handler;

    iget-object v2, p0, Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon;->mHandler:Landroid/os/Handler;

    const/16 v3, 0x3e8

    invoke-virtual {v2, v3, p1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v2

    int-to-long v4, v0

    const-wide/32 v6, 0xea60

    mul-long/2addr v4, v6

    invoke-virtual {v1, v2, v4, v5}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 374
    :cond_0
    return-void
.end method

.method private play(Lcom/mobnetic/coinguardian/db/content/AlarmRecord;)V
    .locals 6
    .param p1, "alarmRecord"    # Lcom/mobnetic/coinguardian/db/content/AlarmRecord;

    .prologue
    .line 248
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon;->stop()V

    .line 254
    const/4 v3, 0x4

    invoke-static {v3}, Landroid/media/RingtoneManager;->getDefaultUri(I)Landroid/net/Uri;

    move-result-object v0

    .line 261
    .local v0, "alert":Landroid/net/Uri;
    new-instance v3, Landroid/media/MediaPlayer;

    invoke-direct {v3}, Landroid/media/MediaPlayer;-><init>()V

    iput-object v3, p0, Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon;->mMediaPlayer:Landroid/media/MediaPlayer;

    .line 262
    iget-object v3, p0, Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon;->mMediaPlayer:Landroid/media/MediaPlayer;

    new-instance v4, Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon$3;

    invoke-direct {v4, p0}, Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon$3;-><init>(Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon;)V

    invoke-virtual {v3, v4}, Landroid/media/MediaPlayer;->setOnErrorListener(Landroid/media/MediaPlayer$OnErrorListener;)V

    .line 281
    :try_start_0
    iget-object v3, p0, Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v3, p0, v0}, Landroid/media/MediaPlayer;->setDataSource(Landroid/content/Context;Landroid/net/Uri;)V

    .line 283
    iget-object v3, p0, Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-direct {p0, v3}, Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon;->startAlarm(Landroid/media/MediaPlayer;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 302
    :goto_0
    iget-object v3, p0, Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon;->mVibrator:Landroid/os/Vibrator;

    sget-object v4, Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon;->sVibratePattern:[J

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5}, Landroid/os/Vibrator;->vibrate([JI)V

    .line 307
    invoke-direct {p0, p1}, Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon;->enableKiller(Lcom/mobnetic/coinguardian/db/content/AlarmRecord;)V

    .line 308
    const/4 v3, 0x1

    iput-boolean v3, p0, Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon;->mPlaying:Z

    .line 309
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    iput-wide v4, p0, Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon;->mStartTime:J

    .line 310
    return-void

    .line 284
    :catch_0
    move-exception v1

    .line 285
    .local v1, "ex":Ljava/lang/Exception;
    const-string v3, "AlarmKlaxon"

    const-string v4, "Using the fallback ringtone"

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 290
    :try_start_1
    iget-object v3, p0, Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v3}, Landroid/media/MediaPlayer;->reset()V

    .line 291
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    iget-object v4, p0, Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon;->mMediaPlayer:Landroid/media/MediaPlayer;

    const v5, 0x7f060002

    invoke-direct {p0, v3, v4, v5}, Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon;->setDataSourceFromResource(Landroid/content/res/Resources;Landroid/media/MediaPlayer;I)V

    .line 292
    iget-object v3, p0, Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-direct {p0, v3}, Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon;->startAlarm(Landroid/media/MediaPlayer;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 293
    :catch_1
    move-exception v2

    .line 295
    .local v2, "ex2":Ljava/lang/Exception;
    const-string v3, "AlarmKlaxon"

    const-string v4, "Failed to play fallback ringtone"

    invoke-static {v3, v4, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method private sendKillBroadcast(Lcom/mobnetic/coinguardian/db/content/AlarmRecord;Z)V
    .locals 8
    .param p1, "alarmRecord"    # Lcom/mobnetic/coinguardian/db/content/AlarmRecord;
    .param p2, "replaced"    # Z

    .prologue
    .line 232
    invoke-virtual {p1}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->getCheckerId()J

    move-result-wide v4

    invoke-direct {p0, v4, v5, p2}, Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon;->dismiss(JZ)V

    .line 234
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    iget-wide v6, p0, Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon;->mStartTime:J

    sub-long v2, v4, v6

    .line 235
    .local v2, "millis":J
    long-to-double v4, v2

    const-wide v6, 0x40ed4c0000000000L    # 60000.0

    div-double/2addr v4, v6

    invoke-static {v4, v5}, Ljava/lang/Math;->round(D)J

    move-result-wide v4

    long-to-int v1, v4

    .line 236
    .local v1, "minutes":I
    new-instance v0, Landroid/content/Intent;

    const-string v4, "alarm_killed"

    invoke-direct {v0, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 237
    .local v0, "alarmKilled":Landroid/content/Intent;
    const-string v4, "alarm_record_id"

    invoke-virtual {p1}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->getId()J

    move-result-wide v6

    invoke-virtual {v0, v4, v6, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 238
    const-string v4, "alarm_killed_timeout"

    invoke-virtual {v0, v4, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 239
    const-string v4, "alarm_replaced"

    invoke-virtual {v0, v4, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 240
    invoke-virtual {p0, v0}, Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon;->sendBroadcast(Landroid/content/Intent;)V

    .line 241
    return-void
.end method

.method private setDataSourceFromResource(Landroid/content/res/Resources;Landroid/media/MediaPlayer;I)V
    .locals 7
    .param p1, "resources"    # Landroid/content/res/Resources;
    .param p2, "player"    # Landroid/media/MediaPlayer;
    .param p3, "res"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 326
    invoke-virtual {p1, p3}, Landroid/content/res/Resources;->openRawResourceFd(I)Landroid/content/res/AssetFileDescriptor;

    move-result-object v6

    .line 327
    .local v6, "afd":Landroid/content/res/AssetFileDescriptor;
    if-eqz v6, :cond_0

    .line 328
    invoke-virtual {v6}, Landroid/content/res/AssetFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v1

    invoke-virtual {v6}, Landroid/content/res/AssetFileDescriptor;->getStartOffset()J

    move-result-wide v2

    invoke-virtual {v6}, Landroid/content/res/AssetFileDescriptor;->getLength()J

    move-result-wide v4

    move-object v0, p2

    invoke-virtual/range {v0 .. v5}, Landroid/media/MediaPlayer;->setDataSource(Ljava/io/FileDescriptor;JJ)V

    .line 329
    invoke-virtual {v6}, Landroid/content/res/AssetFileDescriptor;->close()V

    .line 331
    :cond_0
    return-void
.end method

.method private startAlarm(Landroid/media/MediaPlayer;)V
    .locals 3
    .param p1, "player"    # Landroid/media/MediaPlayer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x4

    .line 314
    const-string v1, "audio"

    invoke-virtual {p0, v1}, Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    .line 317
    .local v0, "audioManager":Landroid/media/AudioManager;
    invoke-virtual {v0, v2}, Landroid/media/AudioManager;->getStreamVolume(I)I

    move-result v1

    if-eqz v1, :cond_0

    .line 318
    invoke-virtual {p1, v2}, Landroid/media/MediaPlayer;->setAudioStreamType(I)V

    .line 319
    const/4 v1, 0x1

    invoke-virtual {p1, v1}, Landroid/media/MediaPlayer;->setLooping(Z)V

    .line 320
    invoke-virtual {p1}, Landroid/media/MediaPlayer;->prepare()V

    .line 321
    invoke-virtual {p1}, Landroid/media/MediaPlayer;->start()V

    .line 323
    :cond_0
    return-void
.end method

.method public static stopAlarmService(Landroid/content/Context;)V
    .locals 4
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 381
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.mobnetic.coinguardian.alarm.ALARM_ALERT"

    const/4 v2, 0x0

    const-class v3, Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon;

    invoke-direct {v0, v1, v2, p0, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v0}, Landroid/content/Context;->stopService(Landroid/content/Intent;)Z

    .line 382
    return-void
.end method


# virtual methods
.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 1
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 167
    const/4 v0, 0x0

    return-object v0
.end method

.method public onCreate()V
    .locals 2

    .prologue
    .line 131
    const-string v1, "vibrator"

    invoke-virtual {p0, v1}, Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/os/Vibrator;

    iput-object v1, p0, Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon;->mVibrator:Landroid/os/Vibrator;

    .line 137
    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "alarm_killed"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 138
    .local v0, "filter":Landroid/content/IntentFilter;
    const-string v1, "com.mobnetic.coinguardian.alarm.ALARM_DISMISS"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 139
    iget-object v1, p0, Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v1, v0}, Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 141
    invoke-static {p0}, Lcom/mobnetic/coinguardian/alarm/AlarmAlertWakeLock;->acquireCpuWakeLock(Landroid/content/Context;)V

    .line 142
    return-void
.end method

.method public onDestroy()V
    .locals 6

    .prologue
    .line 146
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon;->stop()V

    .line 147
    new-instance v0, Landroid/content/Intent;

    const-string v2, "com.mobnetic.coinguardian.alarm.ALARM_DONE"

    invoke-direct {v0, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 148
    .local v0, "alarmDone":Landroid/content/Intent;
    iget-object v2, p0, Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon;->alarmRecord:Lcom/mobnetic/coinguardian/db/content/AlarmRecord;

    if-eqz v2, :cond_0

    .line 149
    const-string v2, "alarm_record_id"

    iget-object v3, p0, Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon;->alarmRecord:Lcom/mobnetic/coinguardian/db/content/AlarmRecord;

    invoke-virtual {v3}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->getId()J

    move-result-wide v4

    invoke-virtual {v0, v2, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 150
    :cond_0
    invoke-virtual {p0, v0}, Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon;->sendBroadcast(Landroid/content/Intent;)V

    .line 157
    :try_start_0
    iget-object v2, p0, Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v2}, Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 162
    :goto_0
    invoke-static {}, Lcom/mobnetic/coinguardian/alarm/AlarmAlertWakeLock;->releaseCpuLock()V

    .line 163
    return-void

    .line 158
    :catch_0
    move-exception v1

    .line 159
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 6
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "flags"    # I
    .param p3, "startId"    # I

    .prologue
    const/4 v1, 0x2

    const/4 v2, 0x1

    .line 173
    if-nez p1, :cond_0

    .line 174
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon;->stopSelf()V

    .line 195
    :goto_0
    return v1

    .line 178
    :cond_0
    const-string v3, "alarm_record_id"

    const-wide/16 v4, -0x1

    invoke-virtual {p1, v3, v4, v5}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v4

    invoke-static {v4, v5}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->get(J)Lcom/mobnetic/coinguardian/db/content/AlarmRecord;

    move-result-object v0

    .line 180
    .local v0, "newAlarmRecord":Lcom/mobnetic/coinguardian/db/content/AlarmRecord;
    if-nez v0, :cond_1

    .line 181
    const-string v2, "AlarmKlaxon"

    const-string v3, "AlarmKlaxon failed to parse the alarm from the intent"

    invoke-static {v2, v3}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 182
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon;->stopSelf()V

    goto :goto_0

    .line 186
    :cond_1
    iget-object v1, p0, Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon;->alarmRecord:Lcom/mobnetic/coinguardian/db/content/AlarmRecord;

    if-eqz v1, :cond_2

    .line 187
    iget-object v1, p0, Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon;->alarmRecord:Lcom/mobnetic/coinguardian/db/content/AlarmRecord;

    invoke-direct {p0, v1, v2}, Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon;->sendKillBroadcast(Lcom/mobnetic/coinguardian/db/content/AlarmRecord;Z)V

    .line 190
    :cond_2
    invoke-direct {p0, v0}, Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon;->play(Lcom/mobnetic/coinguardian/db/content/AlarmRecord;)V

    .line 191
    iput-object v0, p0, Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon;->alarmRecord:Lcom/mobnetic/coinguardian/db/content/AlarmRecord;

    move v1, v2

    .line 195
    goto :goto_0
.end method

.method public stop()V
    .locals 1

    .prologue
    .line 339
    iget-boolean v0, p0, Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon;->mPlaying:Z

    if-eqz v0, :cond_1

    .line 340
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon;->mPlaying:Z

    .line 343
    iget-object v0, p0, Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon;->mMediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    .line 344
    iget-object v0, p0, Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->stop()V

    .line 345
    iget-object v0, p0, Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->release()V

    .line 346
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon;->mMediaPlayer:Landroid/media/MediaPlayer;

    .line 350
    :cond_0
    iget-object v0, p0, Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon;->mVibrator:Landroid/os/Vibrator;

    invoke-virtual {v0}, Landroid/os/Vibrator;->cancel()V

    .line 352
    :cond_1
    invoke-direct {p0}, Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon;->disableKiller()V

    .line 353
    return-void
.end method
