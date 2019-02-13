.class public Lcom/mobnetic/coinguardian/util/AlarmRecordHelper;
.super Ljava/lang/Object;
.source "AlarmRecordHelper.java"


# static fields
.field public static final ALARM_TYPE_GREATER_THAN:I = 0x6

.field public static final ALARM_TYPE_LOWER_THAN:I = 0x7

.field public static final ALARM_TYPE_PERCENT_CHANGE:I = 0x0

.field public static final ALARM_TYPE_PERCENT_CHANGE_DOWN:I = 0x2

.field public static final ALARM_TYPE_PERCENT_CHANGE_UP:I = 0x1

.field public static final ALARM_TYPE_VALUE_CHANGE:I = 0x3

.field public static final ALARM_TYPE_VALUE_CHANGE_DOWN:I = 0x5

.field public static final ALARM_TYPE_VALUE_CHANGE_UP:I = 0x4


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static generateDefaultAlarmRecord(Z)Lcom/mobnetic/coinguardian/db/content/AlarmRecord;
    .locals 4
    .param p0, "enabled"    # Z

    .prologue
    const/4 v1, 0x1

    .line 22
    new-instance v0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;-><init>()V

    .line 23
    .local v0, "alarmRecord":Lcom/mobnetic/coinguardian/db/content/AlarmRecord;
    invoke-virtual {v0, p0}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->setEnabled(Z)V

    .line 24
    const-wide/high16 v2, 0x4008000000000000L    # 3.0

    invoke-virtual {v0, v2, v3}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->setValue(D)V

    .line 25
    invoke-virtual {v0, v1}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->setSound(Z)V

    .line 26
    invoke-virtual {v0, v1}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->setVibrate(Z)V

    .line 27
    invoke-virtual {v0, v1}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->setLed(Z)V

    .line 28
    return-object v0
.end method

.method public static getAlarmTypeForPosition(Landroid/content/Context;I)I
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "position"    # I

    .prologue
    .line 43
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0c0003

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getIntArray(I)[I

    move-result-object v0

    .line 44
    .local v0, "alarmTypesValues":[I
    if-eqz v0, :cond_0

    if-lez p1, :cond_0

    array-length v1, v0

    if-ge p1, v1, :cond_0

    .line 45
    aget v1, v0, p1

    .line 46
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static getDifferenceForPercentageChange(DD)D
    .locals 4
    .param p0, "oldPrice"    # D
    .param p2, "newPrice"    # D

    .prologue
    const-wide/16 v0, 0x0

    .line 134
    cmpl-double v2, p0, v0

    if-nez v2, :cond_0

    .line 136
    :goto_0
    return-wide v0

    :cond_0
    sub-double v0, p2, p0

    div-double/2addr v0, p0

    const-wide/high16 v2, 0x4059000000000000L    # 100.0

    mul-double/2addr v0, v2

    goto :goto_0
.end method

.method public static getPositionForAlarmType(Landroid/content/Context;Lcom/mobnetic/coinguardian/db/content/AlarmRecord;)I
    .locals 6
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "alarmRecord"    # Lcom/mobnetic/coinguardian/db/content/AlarmRecord;

    .prologue
    .line 32
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0c0003

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getIntArray(I)[I

    move-result-object v0

    .line 33
    .local v0, "alarmTypesValues":[I
    if-eqz v0, :cond_1

    .line 34
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, v0

    if-ge v1, v2, :cond_1

    .line 35
    aget v2, v0, v1

    int-to-long v2, v2

    invoke-virtual {p1}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->getType()J

    move-result-wide v4

    cmp-long v2, v2, v4

    if-nez v2, :cond_0

    .line 39
    .end local v1    # "i":I
    :goto_1
    return v1

    .line 34
    .restart local v1    # "i":I
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 39
    .end local v1    # "i":I
    :cond_1
    const/4 v1, 0x0

    goto :goto_1
.end method

.method public static getPrefixForAlarmType(Lcom/mobnetic/coinguardian/db/content/CheckerRecord;Lcom/mobnetic/coinguardian/db/content/AlarmRecord;)Ljava/lang/String;
    .locals 4
    .param p0, "checkerRecord"    # Lcom/mobnetic/coinguardian/db/content/CheckerRecord;
    .param p1, "alarmRecord"    # Lcom/mobnetic/coinguardian/db/content/AlarmRecord;

    .prologue
    .line 50
    invoke-virtual {p1}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->getType()J

    move-result-wide v2

    long-to-int v0, v2

    .line 51
    .local v0, "alarmTypeInt":I
    packed-switch v0, :pswitch_data_0

    .line 63
    :pswitch_0
    const-string v1, "\u00b1"

    :goto_0
    return-object v1

    .line 54
    :pswitch_1
    const-string v1, "+"

    goto :goto_0

    .line 57
    :pswitch_2
    const-string v1, "-"

    goto :goto_0

    .line 59
    :pswitch_3
    const-string v1, ">"

    goto :goto_0

    .line 61
    :pswitch_4
    const-string v1, "<"

    goto :goto_0

    .line 51
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_2
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method

.method public static getSufixForAlarmType(Lcom/mobnetic/coinguardian/db/content/CheckerRecord;Lcom/mobnetic/coinguardian/db/content/AlarmRecord;)Ljava/lang/String;
    .locals 6
    .param p0, "checkerRecord"    # Lcom/mobnetic/coinguardian/db/content/CheckerRecord;
    .param p1, "alarmRecord"    # Lcom/mobnetic/coinguardian/db/content/AlarmRecord;

    .prologue
    .line 103
    invoke-virtual {p1}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->getType()J

    move-result-wide v2

    long-to-int v0, v2

    .line 104
    .local v0, "alarmTypeInt":I
    packed-switch v0, :pswitch_data_0

    .line 113
    const-string v2, "%"

    :goto_0
    return-object v2

    .line 110
    :pswitch_0
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getCurrencyDst()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getCurrencySubunitDst()J

    move-result-wide v4

    invoke-static {v2, v4, v5}, Lcom/mobnetic/coinguardian/util/CurrencyUtils;->getCurrencySubunit(Ljava/lang/String;J)Lcom/mobnetic/coinguardian/model/CurrencySubunit;

    move-result-object v2

    iget-object v1, v2, Lcom/mobnetic/coinguardian/model/CurrencySubunit;->name:Ljava/lang/String;

    .line 111
    .local v1, "currency":Ljava/lang/String;
    invoke-static {v1}, Lcom/mobnetic/coinguardian/util/CurrencyUtils;->getCurrencySymbol(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 104
    :pswitch_data_0
    .packed-switch 0x3
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public static getTriggerPriceForPercentageChange(DD)D
    .locals 2
    .param p0, "checkpointPrice"    # D
    .param p2, "percents"    # D

    .prologue
    .line 140
    const-wide/high16 v0, 0x4059000000000000L    # 100.0

    div-double v0, p2, v0

    mul-double/2addr v0, p0

    add-double/2addr v0, p0

    return-wide v0
.end method

.method public static getValueForAlarmType(Lcom/mobnetic/coinguardian/db/content/CheckerRecord;Lcom/mobnetic/coinguardian/db/content/AlarmRecord;)Ljava/lang/String;
    .locals 4
    .param p0, "checkerRecord"    # Lcom/mobnetic/coinguardian/db/content/CheckerRecord;
    .param p1, "alarmRecord"    # Lcom/mobnetic/coinguardian/db/content/AlarmRecord;

    .prologue
    .line 68
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getCurrencyDst()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getCurrencySubunitDst()J

    move-result-wide v2

    invoke-static {v1, v2, v3}, Lcom/mobnetic/coinguardian/util/CurrencyUtils;->getCurrencySubunit(Ljava/lang/String;J)Lcom/mobnetic/coinguardian/model/CurrencySubunit;

    move-result-object v0

    .line 69
    .local v0, "subunit":Lcom/mobnetic/coinguardian/model/CurrencySubunit;
    invoke-static {v0, p1}, Lcom/mobnetic/coinguardian/util/AlarmRecordHelper;->getValueForAlarmType(Lcom/mobnetic/coinguardian/model/CurrencySubunit;Lcom/mobnetic/coinguardian/db/content/AlarmRecord;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static getValueForAlarmType(Lcom/mobnetic/coinguardian/model/CurrencySubunit;Lcom/mobnetic/coinguardian/db/content/AlarmRecord;)Ljava/lang/String;
    .locals 5
    .param p0, "subunitDst"    # Lcom/mobnetic/coinguardian/model/CurrencySubunit;
    .param p1, "alarmRecord"    # Lcom/mobnetic/coinguardian/db/content/AlarmRecord;

    .prologue
    .line 89
    invoke-virtual {p1}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->getType()J

    move-result-wide v2

    long-to-int v0, v2

    .line 90
    .local v0, "alarmTypeInt":I
    packed-switch v0, :pswitch_data_0

    .line 98
    invoke-virtual {p1}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->getValue()D

    move-result-wide v2

    invoke-static {v2, v3}, Lcom/mobnetic/coinguardian/util/FormatUtils;->formatDoubleWithThreeMax(D)Ljava/lang/String;

    move-result-object v1

    :goto_0
    return-object v1

    .line 96
    :pswitch_0
    invoke-virtual {p1}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->getValue()D

    move-result-wide v2

    const/4 v1, 0x0

    const/4 v4, 0x1

    invoke-static {v2, v3, p0, v1, v4}, Lcom/mobnetic/coinguardian/util/FormatUtils;->formatPriceValueForSubunit(DLcom/mobnetic/coinguardian/model/CurrencySubunit;ZZ)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 90
    :pswitch_data_0
    .packed-switch 0x3
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public static isCheckPointAvailableForAlarmType(Lcom/mobnetic/coinguardian/db/content/AlarmRecord;)Z
    .locals 4
    .param p0, "alarmRecord"    # Lcom/mobnetic/coinguardian/db/content/AlarmRecord;

    .prologue
    .line 118
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->getType()J

    move-result-wide v2

    long-to-int v0, v2

    .line 119
    .local v0, "alarmTypeInt":I
    packed-switch v0, :pswitch_data_0

    .line 124
    const/4 v1, 0x1

    :goto_0
    return v1

    .line 122
    :pswitch_0
    const/4 v1, 0x0

    goto :goto_0

    .line 119
    :pswitch_data_0
    .packed-switch 0x6
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public static parseEnteredValueForAlarmType(Lcom/mobnetic/coinguardian/model/CurrencySubunit;Lcom/mobnetic/coinguardian/db/content/AlarmRecord;D)D
    .locals 4
    .param p0, "subunit"    # Lcom/mobnetic/coinguardian/model/CurrencySubunit;
    .param p1, "alarmRecord"    # Lcom/mobnetic/coinguardian/db/content/AlarmRecord;
    .param p2, "newValue"    # D

    .prologue
    .line 73
    invoke-virtual {p1}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->getType()J

    move-result-wide v2

    long-to-int v0, v2

    .line 74
    .local v0, "alarmTypeInt":I
    packed-switch v0, :pswitch_data_0

    .line 84
    .end local p2    # "newValue":D
    :cond_0
    :goto_0
    return-wide p2

    .line 80
    .restart local p2    # "newValue":D
    :pswitch_0
    if-eqz p0, :cond_0

    .line 81
    iget-wide v2, p0, Lcom/mobnetic/coinguardian/model/CurrencySubunit;->subunitToUnit:J

    long-to-double v2, v2

    div-double/2addr p2, v2

    goto :goto_0

    .line 74
    :pswitch_data_0
    .packed-switch 0x3
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public static shouldDisableAlarmAfterDismiss(Lcom/mobnetic/coinguardian/db/content/AlarmRecord;)Z
    .locals 4
    .param p0, "alarmRecord"    # Lcom/mobnetic/coinguardian/db/content/AlarmRecord;

    .prologue
    .line 129
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->getType()J

    move-result-wide v2

    long-to-int v0, v2

    .line 130
    .local v0, "alarmTypeInt":I
    const/4 v1, 0x6

    if-eq v0, v1, :cond_0

    const/4 v1, 0x7

    if-ne v0, v1, :cond_1

    :cond_0
    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method
