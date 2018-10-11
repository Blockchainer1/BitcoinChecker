.class public Lcom/mobnetic/coinguardian/receiver/MarketChecker;
.super Landroid/content/BroadcastReceiver;
.source "MarketChecker.java"


# static fields
.field private static final ACTION_CHECK_MARKET:Ljava/lang/String; = "com.mobnetic.coinguardian.receiver.action.check_market"

.field public static final EXTRA_ALARM_RECORD_ID:Ljava/lang/String; = "alarm_record_id"

.field public static final EXTRA_CHECKER_RECORD_ID:Ljava/lang/String; = "checker_record_id"

.field private static final LOCK:Ljava/lang/Object;

.field private static requestQueue:Lcom/android/volley/RequestQueue;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 42
    const/4 v0, 0x0

    sput-object v0, Lcom/mobnetic/coinguardian/receiver/MarketChecker;->requestQueue:Lcom/android/volley/RequestQueue;

    .line 43
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/mobnetic/coinguardian/receiver/MarketChecker;->LOCK:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 36
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method static synthetic access$000(Landroid/content/Context;Lcom/mobnetic/coinguardian/db/content/CheckerRecord;Lcom/mobnetic/coinguardian/model/Ticker;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Landroid/content/Context;
    .param p1, "x1"    # Lcom/mobnetic/coinguardian/db/content/CheckerRecord;
    .param p2, "x2"    # Lcom/mobnetic/coinguardian/model/Ticker;
    .param p3, "x3"    # Ljava/lang/String;

    .prologue
    .line 36
    invoke-static {p0, p1, p2, p3}, Lcom/mobnetic/coinguardian/receiver/MarketChecker;->handleNewTicker(Landroid/content/Context;Lcom/mobnetic/coinguardian/db/content/CheckerRecord;Lcom/mobnetic/coinguardian/model/Ticker;Ljava/lang/String;)V

    return-void
.end method

.method public static cancelCheckingForCheckerRecord(J)V
    .locals 0
    .param p0, "checkerRecordId"    # J

    .prologue
    .line 151
    invoke-static {p0, p1}, Lcom/mobnetic/coinguardian/volley/CheckerVolleyAsyncTask;->cancelCheckingForCheckerRecord(J)V

    .line 162
    return-void
.end method

.method public static checkIfAlarmsAreSet(Landroid/content/Context;)V
    .locals 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 125
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 126
    .local v0, "appContext":Landroid/content/Context;
    new-instance v1, Lcom/mobnetic/coinguardian/receiver/MarketChecker$1;

    invoke-direct {v1, v0}, Lcom/mobnetic/coinguardian/receiver/MarketChecker$1;-><init>(Landroid/content/Context;)V

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Void;

    invoke-static {v1, v2}, Lcom/mobnetic/coinguardian/util/AsyncTaskCompat;->execute(Landroid/os/AsyncTask;[Ljava/lang/Object;)V

    .line 144
    return-void
.end method

.method public static checkMarketAsyncForCheckerRecord(Landroid/content/Context;Lcom/mobnetic/coinguardian/db/content/CheckerRecord;)V
    .locals 6
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "checkerRecord"    # Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    .prologue
    .line 165
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getEnabled()Z

    move-result v1

    if-nez v1, :cond_1

    .line 194
    :cond_0
    :goto_0
    return-void

    .line 168
    :cond_1
    sget-object v2, Lcom/mobnetic/coinguardian/receiver/MarketChecker;->LOCK:Ljava/lang/Object;

    monitor-enter v2

    .line 169
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 171
    .local v0, "appContext":Landroid/content/Context;
    sget-object v1, Lcom/mobnetic/coinguardian/receiver/MarketChecker;->requestQueue:Lcom/android/volley/RequestQueue;

    if-eqz v1, :cond_2

    .line 177
    :goto_1
    new-instance v1, Lcom/mobnetic/coinguardian/volley/CheckerVolleyAsyncTask;

    sget-object v3, Lcom/mobnetic/coinguardian/receiver/MarketChecker;->requestQueue:Lcom/android/volley/RequestQueue;

    new-instance v4, Lcom/mobnetic/coinguardian/receiver/MarketChecker$2;

    invoke-direct {v4, v0, p1}, Lcom/mobnetic/coinguardian/receiver/MarketChecker$2;-><init>(Landroid/content/Context;Lcom/mobnetic/coinguardian/db/content/CheckerRecord;)V

    new-instance v5, Lcom/mobnetic/coinguardian/receiver/MarketChecker$3;

    invoke-direct {v5, v0, p1}, Lcom/mobnetic/coinguardian/receiver/MarketChecker$3;-><init>(Landroid/content/Context;Lcom/mobnetic/coinguardian/db/content/CheckerRecord;)V

    invoke-direct {v1, v3, p1, v4, v5}, Lcom/mobnetic/coinguardian/volley/CheckerVolleyAsyncTask;-><init>(Lcom/android/volley/RequestQueue;Lcom/mobnetic/coinguardian/db/content/CheckerRecord;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;)V

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Void;

    invoke-static {v1, v3}, Lcom/mobnetic/coinguardian/util/AsyncTaskCompat;->execute(Landroid/os/AsyncTask;[Ljava/lang/Object;)V

    .line 193
    monitor-exit v2

    goto :goto_0

    .end local v0    # "appContext":Landroid/content/Context;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 174
    .restart local v0    # "appContext":Landroid/content/Context;
    :cond_2
    :try_start_1
    invoke-static {v0}, Lcom/mobnetic/coinguardian/util/HttpsHelper;->newRequestQueue(Landroid/content/Context;)Lcom/android/volley/RequestQueue;

    move-result-object v1

    sput-object v1, Lcom/mobnetic/coinguardian/receiver/MarketChecker;->requestQueue:Lcom/android/volley/RequestQueue;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1
.end method

.method private static createIntentForCheckerRecord(Landroid/content/Context;J)Landroid/content/Intent;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "checkerRecordId"    # J

    .prologue
    .line 109
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/mobnetic/coinguardian/receiver/MarketChecker;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 110
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "com.mobnetic.coinguardian.receiver.action.check_market"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 111
    const-string v1, "checker_record_id"

    invoke-virtual {v0, v1, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 112
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->toUri(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 113
    return-object v0
.end method

.method private static createPendingIntentForMarket(Landroid/content/Context;J)Landroid/app/PendingIntent;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "checkerRecordId"    # J

    .prologue
    .line 117
    long-to-int v0, p1

    invoke-static {p0, p1, p2}, Lcom/mobnetic/coinguardian/receiver/MarketChecker;->createIntentForCheckerRecord(Landroid/content/Context;J)Landroid/content/Intent;

    move-result-object v1

    const/high16 v2, 0x8000000

    invoke-static {p0, v0, v1, v2}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v0

    return-object v0
.end method

.method private static handleNewTicker(Landroid/content/Context;Lcom/mobnetic/coinguardian/db/content/CheckerRecord;Lcom/mobnetic/coinguardian/model/Ticker;Ljava/lang/String;)V
    .locals 4
    .param p0, "appContext"    # Landroid/content/Context;
    .param p1, "checkerRecord"    # Lcom/mobnetic/coinguardian/db/content/CheckerRecord;
    .param p2, "ticker"    # Lcom/mobnetic/coinguardian/model/Ticker;
    .param p3, "errorMsg"    # Ljava/lang/String;

    .prologue
    .line 197
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {p1, v2, v3}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->setLastCheckDate(J)V

    .line 198
    invoke-virtual {p1, p3}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->setErrorMsg(Ljava/lang/String;)V

    .line 199
    if-eqz p2, :cond_0

    .line 200
    invoke-virtual {p1}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getLastCheckTicker()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->setPreviousCheckTicker(Ljava/lang/String;)V

    .line 201
    invoke-static {p2}, Lcom/mobnetic/coinguardian/util/TickerUtils;->toJson(Lcom/mobnetic/coinguardian/model/Ticker;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->setLastCheckTicker(Ljava/lang/String;)V

    .line 203
    :cond_0
    invoke-virtual {p1}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->save()J

    .line 205
    invoke-static {p0, p1, p2}, Lcom/mobnetic/coinguardian/util/NotificationUtils;->checkfThereIsAlertSituationAndShowAlertNotification(Landroid/content/Context;Lcom/mobnetic/coinguardian/db/content/CheckerRecord;Lcom/mobnetic/coinguardian/model/Ticker;)Z

    move-result v0

    .line 206
    .local v0, "wasPriceSpoken":Z
    invoke-static {p0, p1, v0}, Lcom/mobnetic/coinguardian/util/NotificationUtils;->showOngoingNotification(Landroid/content/Context;Lcom/mobnetic/coinguardian/db/content/CheckerRecord;Z)V

    .line 208
    invoke-static {p0}, Lcom/mobnetic/coinguardian/appwidget/WidgetProvider;->refreshWidget(Landroid/content/Context;)V

    .line 209
    return-void
.end method

.method public static isAlarmScheduledForChecker(Landroid/content/Context;J)Z
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "checkerRecordId"    # J

    .prologue
    .line 121
    long-to-int v0, p1

    invoke-static {p0, p1, p2}, Lcom/mobnetic/coinguardian/receiver/MarketChecker;->createIntentForCheckerRecord(Landroid/content/Context;J)Landroid/content/Intent;

    move-result-object v1

    const/high16 v2, 0x20000000

    invoke-static {p0, v0, v1, v2}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static refreshAllEnabledCheckerRecords(Landroid/content/Context;)V
    .locals 6
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 63
    invoke-static {}, Lcom/robotoworks/mechanoid/db/SQuery;->newQuery()Lcom/robotoworks/mechanoid/db/SQuery;

    move-result-object v2

    const-string v3, "enabled"

    const-string v4, " = "

    const/4 v5, 0x1

    invoke-virtual {v2, v3, v4, v5}, Lcom/robotoworks/mechanoid/db/SQuery;->expr(Ljava/lang/String;Ljava/lang/String;Z)Lcom/robotoworks/mechanoid/db/SQuery;

    move-result-object v2

    sget-object v3, Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker;->CONTENT_URI:Landroid/net/Uri;

    invoke-static {p0}, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;->getSortOrderString(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lcom/robotoworks/mechanoid/db/SQuery;->select(Landroid/net/Uri;Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    .line 64
    .local v1, "checkerRecords":Ljava/util/List;, "Ljava/util/List<Lcom/mobnetic/coinguardian/db/content/CheckerRecord;>;"
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    .line 65
    .local v0, "checkerRecord":Lcom/mobnetic/coinguardian/db/content/CheckerRecord;
    invoke-static {p0, v0}, Lcom/mobnetic/coinguardian/receiver/MarketChecker;->checkMarketAsyncForCheckerRecord(Landroid/content/Context;Lcom/mobnetic/coinguardian/db/content/CheckerRecord;)V

    goto :goto_0

    .line 67
    .end local v0    # "checkerRecord":Lcom/mobnetic/coinguardian/db/content/CheckerRecord;
    :cond_0
    return-void
.end method

.method public static resetAlarmManager(Landroid/content/Context;)V
    .locals 5
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 73
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 74
    .local v0, "appContext":Landroid/content/Context;
    invoke-static {}, Lcom/robotoworks/mechanoid/db/SQuery;->newQuery()Lcom/robotoworks/mechanoid/db/SQuery;

    move-result-object v3

    sget-object v4, Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v3, v4}, Lcom/robotoworks/mechanoid/db/SQuery;->select(Landroid/net/Uri;)Ljava/util/List;

    move-result-object v2

    .line 75
    .local v2, "checkerRecords":Ljava/util/List;, "Ljava/util/List<Lcom/mobnetic/coinguardian/db/content/CheckerRecord;>;"
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    .line 76
    .local v1, "checkerRecord":Lcom/mobnetic/coinguardian/db/content/CheckerRecord;
    const/4 v4, 0x1

    invoke-static {v0, v1, v4}, Lcom/mobnetic/coinguardian/receiver/MarketChecker;->resetAlarmManagerForChecker(Landroid/content/Context;Lcom/mobnetic/coinguardian/db/content/CheckerRecord;Z)V

    goto :goto_0

    .line 77
    .end local v1    # "checkerRecord":Lcom/mobnetic/coinguardian/db/content/CheckerRecord;
    :cond_0
    return-void
.end method

.method public static resetAlarmManagerForAllEnabledThatUseGlobalFrequency(Landroid/content/Context;)V
    .locals 9
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const/4 v8, 0x1

    .line 80
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 81
    .local v0, "appContext":Landroid/content/Context;
    invoke-static {}, Lcom/robotoworks/mechanoid/db/SQuery;->newQuery()Lcom/robotoworks/mechanoid/db/SQuery;

    move-result-object v3

    const-string v4, "frequency"

    const-string v5, " = "

    const-wide/16 v6, -0x1

    .line 82
    invoke-virtual {v3, v4, v5, v6, v7}, Lcom/robotoworks/mechanoid/db/SQuery;->expr(Ljava/lang/String;Ljava/lang/String;J)Lcom/robotoworks/mechanoid/db/SQuery;

    move-result-object v3

    .line 83
    invoke-virtual {v3}, Lcom/robotoworks/mechanoid/db/SQuery;->and()Lcom/robotoworks/mechanoid/db/SQuery;

    move-result-object v3

    const-string v4, "enabled"

    const-string v5, " = "

    .line 84
    invoke-virtual {v3, v4, v5, v8}, Lcom/robotoworks/mechanoid/db/SQuery;->expr(Ljava/lang/String;Ljava/lang/String;Z)Lcom/robotoworks/mechanoid/db/SQuery;

    move-result-object v3

    sget-object v4, Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker;->CONTENT_URI:Landroid/net/Uri;

    .line 85
    invoke-virtual {v3, v4}, Lcom/robotoworks/mechanoid/db/SQuery;->select(Landroid/net/Uri;)Ljava/util/List;

    move-result-object v2

    .line 86
    .local v2, "checkerRecords":Ljava/util/List;, "Ljava/util/List<Lcom/mobnetic/coinguardian/db/content/CheckerRecord;>;"
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    .line 87
    .local v1, "checkerRecord":Lcom/mobnetic/coinguardian/db/content/CheckerRecord;
    invoke-static {v0, v1, v8}, Lcom/mobnetic/coinguardian/receiver/MarketChecker;->resetAlarmManagerForChecker(Landroid/content/Context;Lcom/mobnetic/coinguardian/db/content/CheckerRecord;Z)V

    goto :goto_0

    .line 88
    .end local v1    # "checkerRecord":Lcom/mobnetic/coinguardian/db/content/CheckerRecord;
    :cond_0
    return-void
.end method

.method public static resetAlarmManagerForChecker(Landroid/content/Context;Lcom/mobnetic/coinguardian/db/content/CheckerRecord;Z)V
    .locals 7
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "checkerRecord"    # Lcom/mobnetic/coinguardian/db/content/CheckerRecord;
    .param p2, "checkNow"    # Z

    .prologue
    .line 91
    const-string v1, "alarm"

    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    .line 92
    .local v0, "alarmManager":Landroid/app/AlarmManager;
    invoke-virtual {p1}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getEnabled()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 93
    if-eqz p2, :cond_0

    .line 94
    invoke-static {p0, p1}, Lcom/mobnetic/coinguardian/receiver/MarketChecker;->checkMarketAsyncForCheckerRecord(Landroid/content/Context;Lcom/mobnetic/coinguardian/db/content/CheckerRecord;)V

    .line 95
    :cond_0
    invoke-virtual {p1}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getId()J

    move-result-wide v2

    invoke-static {p0, v2, v3}, Lcom/mobnetic/coinguardian/receiver/MarketChecker;->createPendingIntentForMarket(Landroid/content/Context;J)Landroid/app/PendingIntent;

    move-result-object v6

    .line 96
    .local v6, "pi":Landroid/app/PendingIntent;
    invoke-virtual {v0, v6}, Landroid/app/AlarmManager;->cancel(Landroid/app/PendingIntent;)V

    .line 97
    invoke-static {p0, p1}, Lcom/mobnetic/coinguardian/util/CheckerRecordHelper;->getDisplayedFrequency(Landroid/content/Context;Lcom/mobnetic/coinguardian/db/content/CheckerRecord;)J

    move-result-wide v4

    .line 98
    .local v4, "frequency":J
    const/4 v1, 0x2

    .line 99
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    add-long/2addr v2, v4

    .line 98
    invoke-virtual/range {v0 .. v6}, Landroid/app/AlarmManager;->setInexactRepeating(IJJLandroid/app/PendingIntent;)V

    .line 106
    .end local v4    # "frequency":J
    .end local v6    # "pi":Landroid/app/PendingIntent;
    :goto_0
    return-void

    .line 103
    :cond_1
    invoke-virtual {p1}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getId()J

    move-result-wide v2

    invoke-static {v2, v3}, Lcom/mobnetic/coinguardian/receiver/MarketChecker;->cancelCheckingForCheckerRecord(J)V

    .line 104
    invoke-virtual {p1}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getId()J

    move-result-wide v2

    invoke-static {p0, v2, v3}, Lcom/mobnetic/coinguardian/receiver/MarketChecker;->createPendingIntentForMarket(Landroid/content/Context;J)Landroid/app/PendingIntent;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlarmManager;->cancel(Landroid/app/PendingIntent;)V

    goto :goto_0
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 50
    if-nez p2, :cond_1

    .line 60
    :cond_0
    :goto_0
    return-void

    .line 53
    :cond_1
    const-string v1, "com.mobnetic.coinguardian.receiver.action.check_market"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 54
    const-string v1, "checker_record_id"

    const-wide/16 v4, -0x1

    invoke-virtual {p2, v1, v4, v5}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v2

    .line 55
    .local v2, "checkerRecordId":J
    const-wide/16 v4, 0x0

    cmp-long v1, v2, v4

    if-lez v1, :cond_0

    .line 56
    invoke-static {v2, v3}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->get(J)Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    move-result-object v0

    .line 57
    .local v0, "checkerRecord":Lcom/mobnetic/coinguardian/db/content/CheckerRecord;
    invoke-static {p1, v0}, Lcom/mobnetic/coinguardian/receiver/MarketChecker;->checkMarketAsyncForCheckerRecord(Landroid/content/Context;Lcom/mobnetic/coinguardian/db/content/CheckerRecord;)V

    goto :goto_0
.end method
