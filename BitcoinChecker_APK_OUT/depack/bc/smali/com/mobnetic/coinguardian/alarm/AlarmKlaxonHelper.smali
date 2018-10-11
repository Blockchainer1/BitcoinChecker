.class public Lcom/mobnetic/coinguardian/alarm/AlarmKlaxonHelper;
.super Ljava/lang/Object;
.source "AlarmKlaxonHelper.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static createAlarmKlaxonDismissIntent(Landroid/content/Context;JJ)Landroid/content/Intent;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "checkerRecordId"    # J
    .param p3, "alarmRecordId"    # J

    .prologue
    .line 34
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.mobnetic.coinguardian.alarm.ALARM_DISMISS"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 35
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "checker_record_id"

    invoke-virtual {v0, v1, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 36
    const-string v1, "alarm_record_id"

    invoke-virtual {v0, v1, p3, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 37
    return-object v0
.end method

.method public static createAlarmKlaxonDismissPendingIntent(Landroid/content/Context;JJ)Landroid/app/PendingIntent;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "checkerRecordId"    # J
    .param p3, "alarmRecordId"    # J

    .prologue
    .line 29
    invoke-static {p0, p1, p2, p3, p4}, Lcom/mobnetic/coinguardian/alarm/AlarmKlaxonHelper;->createAlarmKlaxonDismissIntent(Landroid/content/Context;JJ)Landroid/content/Intent;

    move-result-object v0

    .line 30
    .local v0, "intent":Landroid/content/Intent;
    long-to-int v1, p3

    const/high16 v2, 0x8000000

    invoke-static {p0, v1, v0, v2}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v1

    return-object v1
.end method

.method public static startAlarmKlaxon(Landroid/content/Context;Lcom/mobnetic/coinguardian/db/content/AlarmRecord;)V
    .locals 0
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "alarmRecord"    # Lcom/mobnetic/coinguardian/db/content/AlarmRecord;

    .prologue
    .line 26
    return-void
.end method
