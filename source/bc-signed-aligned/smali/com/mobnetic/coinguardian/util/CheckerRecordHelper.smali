.class public Lcom/mobnetic/coinguardian/util/CheckerRecordHelper;
.super Ljava/lang/Object;
.source "CheckerRecordHelper.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static createCheckerInfo(Lcom/mobnetic/coinguardian/db/content/CheckerRecord;)Lcom/mobnetic/coinguardian/model/CheckerInfo;
    .locals 6
    .param p0, "checkerRecord"    # Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    .prologue
    .line 21
    new-instance v0, Lcom/mobnetic/coinguardian/model/CheckerInfo;

    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getCurrencySrc()Ljava/lang/String;

    move-result-object v1

    .line 22
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getCurrencyDst()Ljava/lang/String;

    move-result-object v2

    .line 23
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getCurrencyPairId()Ljava/lang/String;

    move-result-object v3

    .line 24
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getContractType()J

    move-result-wide v4

    long-to-int v4, v4

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/mobnetic/coinguardian/model/CheckerInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    .line 21
    return-object v0
.end method

.method public static final doAfterDelete(Landroid/content/Context;Lcom/mobnetic/coinguardian/db/content/CheckerRecord;)V
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "checkerRecord"    # Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    .prologue
    .line 44
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/mobnetic/coinguardian/appwidget/WidgetProvider;->refreshWidget(Landroid/content/Context;)V

    .line 45
    return-void
.end method

.method public static final doAfterEdit(Landroid/content/Context;Lcom/mobnetic/coinguardian/db/content/CheckerRecord;Z)V
    .locals 4
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "checkerRecord"    # Lcom/mobnetic/coinguardian/db/content/CheckerRecord;
    .param p2, "updateWidget"    # Z

    .prologue
    .line 28
    invoke-virtual {p1}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getId()J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/mobnetic/coinguardian/receiver/MarketChecker;->cancelCheckingForCheckerRecord(J)V

    .line 29
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {v0, p1, v1}, Lcom/mobnetic/coinguardian/receiver/MarketChecker;->resetAlarmManagerForChecker(Landroid/content/Context;Lcom/mobnetic/coinguardian/db/content/CheckerRecord;Z)V

    .line 30
    invoke-virtual {p1}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getEnabled()Z

    move-result v0

    if-nez v0, :cond_0

    .line 31
    invoke-static {p0, p1}, Lcom/mobnetic/coinguardian/util/NotificationUtils;->clearNotificationsForCheckerRecord(Landroid/content/Context;Lcom/mobnetic/coinguardian/db/content/CheckerRecord;)V

    .line 32
    :cond_0
    if-eqz p2, :cond_1

    .line 33
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/mobnetic/coinguardian/appwidget/WidgetProvider;->refreshWidget(Landroid/content/Context;)V

    .line 34
    :cond_1
    invoke-virtual {p1}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getId()J

    move-result-wide v0

    const-wide/16 v2, -0x1

    invoke-static {p0, v0, v1, v2, v3}, Lcom/mobnetic/coinguardian/alarm/AlarmKlaxonHelper;->createAlarmKlaxonDismissIntent(Landroid/content/Context;JJ)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 35
    return-void
.end method

.method public static final doBeforeDelete(Landroid/content/Context;Lcom/mobnetic/coinguardian/db/content/CheckerRecord;)V
    .locals 5
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "checkerRecord"    # Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    .prologue
    const/4 v4, 0x0

    .line 38
    invoke-virtual {p1, v4}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->setEnabled(Z)V

    .line 39
    invoke-static {p0, p1, v4}, Lcom/mobnetic/coinguardian/util/CheckerRecordHelper;->doAfterEdit(Landroid/content/Context;Lcom/mobnetic/coinguardian/db/content/CheckerRecord;Z)V

    .line 40
    const-string v0, "checkerId = ?"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    invoke-virtual {p1}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getId()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v4

    invoke-static {v0, v1}, Lcom/mobnetic/coinguardian/db/content/MaindbContract$Alarm;->delete(Ljava/lang/String;[Ljava/lang/String;)I

    .line 41
    return-void
.end method

.method private static getAlarmsForCheckerRecord(JZ)Ljava/util/List;
    .locals 6
    .param p0, "checkerRecordId"    # J
    .param p2, "enabledOnly"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JZ)",
            "Ljava/util/List",
            "<",
            "Lcom/mobnetic/coinguardian/db/content/AlarmRecord;",
            ">;"
        }
    .end annotation

    .prologue
    .line 51
    invoke-static {}, Lcom/robotoworks/mechanoid/db/SQuery;->newQuery()Lcom/robotoworks/mechanoid/db/SQuery;

    move-result-object v1

    const-string v2, "checkerId"

    const-string v3, " = "

    invoke-virtual {v1, v2, v3, p0, p1}, Lcom/robotoworks/mechanoid/db/SQuery;->expr(Ljava/lang/String;Ljava/lang/String;J)Lcom/robotoworks/mechanoid/db/SQuery;

    move-result-object v0

    .line 52
    .local v0, "sQuery":Lcom/robotoworks/mechanoid/db/SQuery;
    if-eqz p2, :cond_0

    .line 53
    invoke-virtual {v0}, Lcom/robotoworks/mechanoid/db/SQuery;->and()Lcom/robotoworks/mechanoid/db/SQuery;

    move-result-object v1

    const-string v2, "enabled"

    const-string v3, " = "

    const/4 v4, 0x1

    invoke-virtual {v1, v2, v3, v4}, Lcom/robotoworks/mechanoid/db/SQuery;->expr(Ljava/lang/String;Ljava/lang/String;Z)Lcom/robotoworks/mechanoid/db/SQuery;

    .line 54
    :cond_0
    sget-object v1, Lcom/mobnetic/coinguardian/db/content/MaindbContract$Alarm;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v0, v1}, Lcom/robotoworks/mechanoid/db/SQuery;->select(Landroid/net/Uri;)Ljava/util/List;

    move-result-object v1

    return-object v1
.end method

.method public static getAlarmsForCheckerRecord(Lcom/mobnetic/coinguardian/db/content/CheckerRecord;Z)Ljava/util/List;
    .locals 2
    .param p0, "checkerRecord"    # Lcom/mobnetic/coinguardian/db/content/CheckerRecord;
    .param p1, "enabledOnly"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/mobnetic/coinguardian/db/content/CheckerRecord;",
            "Z)",
            "Ljava/util/List",
            "<",
            "Lcom/mobnetic/coinguardian/db/content/AlarmRecord;",
            ">;"
        }
    .end annotation

    .prologue
    .line 48
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getId()J

    move-result-wide v0

    invoke-static {v0, v1, p1}, Lcom/mobnetic/coinguardian/util/CheckerRecordHelper;->getAlarmsForCheckerRecord(JZ)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public static getAlarmsIdsForCheckerRecord(J)Ljava/util/List;
    .locals 4
    .param p0, "checkerRecordId"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .prologue
    .line 58
    invoke-static {}, Lcom/robotoworks/mechanoid/db/SQuery;->newQuery()Lcom/robotoworks/mechanoid/db/SQuery;

    move-result-object v0

    const-string v1, "checkerId"

    const-string v2, " = "

    invoke-virtual {v0, v1, v2, p0, p1}, Lcom/robotoworks/mechanoid/db/SQuery;->expr(Ljava/lang/String;Ljava/lang/String;J)Lcom/robotoworks/mechanoid/db/SQuery;

    move-result-object v0

    sget-object v1, Lcom/mobnetic/coinguardian/db/content/MaindbContract$Alarm;->CONTENT_URI:Landroid/net/Uri;

    const-string v2, "_id"

    invoke-virtual {v0, v1, v2}, Lcom/robotoworks/mechanoid/db/SQuery;->selectLongList(Landroid/net/Uri;Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public static getDisplayedFrequency(Landroid/content/Context;Lcom/mobnetic/coinguardian/db/content/CheckerRecord;)J
    .locals 4
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "checkerRecord"    # Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    .prologue
    .line 62
    invoke-virtual {p1}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getFrequency()J

    move-result-wide v0

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-gtz v0, :cond_0

    .line 63
    invoke-static {p0}, Lcom/mobnetic/coinguardian/util/PreferencesUtils;->getCheckGlobalFrequency(Landroid/content/Context;)J

    move-result-wide v0

    .line 64
    :goto_0
    return-wide v0

    :cond_0
    invoke-virtual {p1}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getFrequency()J

    move-result-wide v0

    goto :goto_0
.end method
