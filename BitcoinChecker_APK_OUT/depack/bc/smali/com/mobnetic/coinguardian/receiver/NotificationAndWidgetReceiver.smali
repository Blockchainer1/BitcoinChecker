.class public Lcom/mobnetic/coinguardian/receiver/NotificationAndWidgetReceiver;
.super Landroid/content/BroadcastReceiver;
.source "NotificationAndWidgetReceiver.java"


# static fields
.field public static final ACTION_NOTIFICATION_ALARM_DISMISS:Ljava/lang/String; = "com.mobnetic.coinguardian.receiver.action.notification_alarm_dismiss"

.field public static final ACTION_NOTIFICATION_CHECKER_ALARM_DETAILS:Ljava/lang/String; = "com.mobnetic.coinguardian.receiver.action.notification_checker_alarm_details"

.field public static final ACTION_NOTIFICATION_REFRESH:Ljava/lang/String; = "com.mobnetic.coinguardian.receiver.action.notification_refresh"

.field public static final ACTION_NOTIFICATION_REFRESH_ALL:Ljava/lang/String; = "com.mobnetic.coinguardian.receiver.action.notification_refresh_all"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 17
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method private disableAlarmRecordIfNeeded(J)Z
    .locals 7
    .param p1, "alarmRecordId"    # J

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 71
    invoke-static {p1, p2}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->get(J)Lcom/mobnetic/coinguardian/db/content/AlarmRecord;

    move-result-object v0

    .line 72
    .local v0, "alarmRecord":Lcom/mobnetic/coinguardian/db/content/AlarmRecord;
    if-eqz v0, :cond_0

    invoke-static {v0}, Lcom/mobnetic/coinguardian/util/AlarmRecordHelper;->shouldDisableAlarmAfterDismiss(Lcom/mobnetic/coinguardian/db/content/AlarmRecord;)Z

    move-result v4

    if-nez v4, :cond_1

    :cond_0
    move v2, v3

    .line 82
    :goto_0
    return v2

    .line 75
    :cond_1
    invoke-virtual {v0, v3}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->setEnabled(Z)V

    .line 77
    const/4 v3, 0x1

    :try_start_0
    invoke-virtual {v0, v3}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->save(Z)J

    .line 78
    invoke-static {}, Lcom/robotoworks/mechanoid/Mechanoid;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    sget-object v4, Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker;->CONTENT_URI:Landroid/net/Uri;

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 79
    :catch_0
    move-exception v1

    .line 80
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 12
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 26
    if-nez p2, :cond_1

    .line 68
    :cond_0
    :goto_0
    return-void

    .line 29
    :cond_1
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 30
    .local v0, "action":Ljava/lang/String;
    const-string v8, "com.mobnetic.coinguardian.receiver.action.notification_refresh"

    invoke-virtual {v8, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 31
    const-string v8, "checker_record_id"

    const-wide/16 v10, -0x1

    invoke-virtual {p2, v8, v10, v11}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v6

    .line 32
    .local v6, "checkerRecrdId":J
    const-wide/16 v8, 0x0

    cmp-long v8, v6, v8

    if-lez v8, :cond_0

    .line 33
    invoke-static {v6, v7}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->get(J)Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    move-result-object v1

    .line 34
    .local v1, "checkerRecord":Lcom/mobnetic/coinguardian/db/content/CheckerRecord;
    invoke-static {p1, v1}, Lcom/mobnetic/coinguardian/receiver/MarketChecker;->checkMarketAsyncForCheckerRecord(Landroid/content/Context;Lcom/mobnetic/coinguardian/db/content/CheckerRecord;)V

    goto :goto_0

    .line 36
    .end local v1    # "checkerRecord":Lcom/mobnetic/coinguardian/db/content/CheckerRecord;
    .end local v6    # "checkerRecrdId":J
    :cond_2
    const-string v8, "com.mobnetic.coinguardian.receiver.action.notification_refresh_all"

    invoke-virtual {v8, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 37
    invoke-static {p1}, Lcom/mobnetic/coinguardian/receiver/MarketChecker;->refreshAllEnabledCheckerRecords(Landroid/content/Context;)V

    goto :goto_0

    .line 38
    :cond_3
    const-string v8, "com.mobnetic.coinguardian.receiver.action.notification_checker_alarm_details"

    invoke-virtual {v8, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_4

    .line 39
    const-string v8, "checker_record_id"

    const-wide/16 v10, -0x1

    invoke-virtual {p2, v8, v10, v11}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v4

    .line 40
    .local v4, "checkerRecordId":J
    const-string v8, "alarm_record_id"

    const-wide/16 v10, -0x1

    invoke-virtual {p2, v8, v10, v11}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v2

    .line 41
    .local v2, "alarmRecordId":J
    const-wide/16 v8, 0x0

    cmp-long v8, v4, v8

    if-lez v8, :cond_0

    const-wide/16 v8, 0x0

    cmp-long v8, v2, v8

    if-lez v8, :cond_0

    .line 42
    invoke-direct {p0, v2, v3}, Lcom/mobnetic/coinguardian/receiver/NotificationAndWidgetReceiver;->disableAlarmRecordIfNeeded(J)Z

    .line 43
    invoke-static {v4, v5}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->get(J)Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    move-result-object v1

    .line 44
    .restart local v1    # "checkerRecord":Lcom/mobnetic/coinguardian/db/content/CheckerRecord;
    if-eqz v1, :cond_0

    .line 45
    const/4 v8, 0x1

    invoke-static {p1, v1, v2, v3, v8}, Lcom/mobnetic/coinguardian/activity/CheckerAddActivity;->startCheckerAddActivity(Landroid/content/Context;Lcom/mobnetic/coinguardian/db/content/CheckerRecord;JZ)V

    goto :goto_0

    .line 48
    .end local v1    # "checkerRecord":Lcom/mobnetic/coinguardian/db/content/CheckerRecord;
    .end local v2    # "alarmRecordId":J
    .end local v4    # "checkerRecordId":J
    :cond_4
    const-string v8, "com.mobnetic.coinguardian.receiver.action.notification_alarm_dismiss"

    invoke-virtual {v8, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_5

    .line 49
    const-string v8, "checker_record_id"

    const-wide/16 v10, -0x1

    invoke-virtual {p2, v8, v10, v11}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v4

    .line 50
    .restart local v4    # "checkerRecordId":J
    const-string v8, "alarm_record_id"

    const-wide/16 v10, -0x1

    invoke-virtual {p2, v8, v10, v11}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v2

    .line 51
    .restart local v2    # "alarmRecordId":J
    const-wide/16 v8, 0x0

    cmp-long v8, v4, v8

    if-lez v8, :cond_0

    const-wide/16 v8, 0x0

    cmp-long v8, v2, v8

    if-lez v8, :cond_0

    .line 52
    invoke-direct {p0, v2, v3}, Lcom/mobnetic/coinguardian/receiver/NotificationAndWidgetReceiver;->disableAlarmRecordIfNeeded(J)Z

    .line 53
    invoke-static {p1, v4, v5, v2, v3}, Lcom/mobnetic/coinguardian/alarm/AlarmKlaxonHelper;->createAlarmKlaxonDismissIntent(Landroid/content/Context;JJ)Landroid/content/Intent;

    move-result-object v8

    invoke-virtual {p1, v8}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    goto/16 :goto_0

    .line 55
    .end local v2    # "alarmRecordId":J
    .end local v4    # "checkerRecordId":J
    :cond_5
    const-string v8, "com.mobnetic.coinguardian.alarm.ALARM_DISMISS"

    invoke-virtual {v8, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_6

    .line 57
    const-string v8, "alarm_record_id"

    const-wide/16 v10, -0x1

    invoke-virtual {p2, v8, v10, v11}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v2

    .line 58
    .restart local v2    # "alarmRecordId":J
    const-wide/16 v8, 0x0

    cmp-long v8, v2, v8

    if-lez v8, :cond_0

    .line 59
    invoke-static {p1, v2, v3}, Lcom/mobnetic/coinguardian/util/NotificationUtils;->clearAlarmNotificationForAlarmRecord(Landroid/content/Context;J)V

    .line 60
    invoke-direct {p0, v2, v3}, Lcom/mobnetic/coinguardian/receiver/NotificationAndWidgetReceiver;->disableAlarmRecordIfNeeded(J)Z

    goto/16 :goto_0

    .line 62
    .end local v2    # "alarmRecordId":J
    :cond_6
    const-string v8, "com.mobnetic.coinguardian.alarm.ALARM_DONE"

    invoke-virtual {v8, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 63
    const-string v8, "alarm_record_id"

    const-wide/16 v10, -0x1

    invoke-virtual {p2, v8, v10, v11}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v2

    .line 64
    .restart local v2    # "alarmRecordId":J
    const-wide/16 v8, 0x0

    cmp-long v8, v2, v8

    if-lez v8, :cond_0

    .line 65
    invoke-static {p1, v2, v3}, Lcom/mobnetic/coinguardian/util/NotificationUtils;->clearAlarmNotificationForAlarmRecord(Landroid/content/Context;J)V

    goto/16 :goto_0
.end method
