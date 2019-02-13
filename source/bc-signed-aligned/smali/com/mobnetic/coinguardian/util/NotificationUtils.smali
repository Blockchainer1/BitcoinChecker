.class public Lcom/mobnetic/coinguardian/util/NotificationUtils;
.super Ljava/lang/Object;
.source "NotificationUtils.java"


# static fields
.field private static final NOTIFICATION_ALARM_TAG:Ljava/lang/String; = "alarm"

.field private static final NOTIFICATION_CHECKER_TAG:Ljava/lang/String; = "checker"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static checkfThereIsAlertSituationAndShowAlertNotification(Landroid/content/Context;Lcom/mobnetic/coinguardian/db/content/CheckerRecord;Lcom/mobnetic/coinguardian/model/Ticker;)Z
    .locals 39
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "checkerRecord"    # Lcom/mobnetic/coinguardian/db/content/CheckerRecord;
    .param p2, "ticker"    # Lcom/mobnetic/coinguardian/model/Ticker;

    .prologue
    .line 219
    invoke-static/range {p0 .. p0}, Landroid/support/v4/app/NotificationManagerCompat;->from(Landroid/content/Context;)Landroid/support/v4/app/NotificationManagerCompat;

    move-result-object v23

    .line 220
    .local v23, "notificationManager":Landroid/support/v4/app/NotificationManagerCompat;
    const/16 v34, 0x0

    .line 222
    .local v34, "wasPriceSpoken":Z
    invoke-virtual/range {p1 .. p1}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getEnabled()Z

    move-result v5

    if-nez v5, :cond_0

    .line 223
    move-object/from16 v0, p0

    move-object/from16 v1, v23

    move-object/from16 v2, p1

    invoke-static {v0, v1, v2}, Lcom/mobnetic/coinguardian/util/NotificationUtils;->clearAlarmNotificationForCheckerRecord(Landroid/content/Context;Landroid/support/v4/app/NotificationManagerCompat;Lcom/mobnetic/coinguardian/db/content/CheckerRecord;)V

    .line 224
    const/4 v5, 0x0

    .line 438
    :goto_0
    return v5

    .line 227
    :cond_0
    invoke-virtual/range {p1 .. p1}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getErrorMsg()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_1

    .line 228
    const/4 v5, 0x0

    goto :goto_0

    .line 230
    :cond_1
    const/4 v5, 0x0

    move-object/from16 v0, p1

    invoke-static {v0, v5}, Lcom/mobnetic/coinguardian/util/CheckerRecordHelper;->getAlarmsForCheckerRecord(Lcom/mobnetic/coinguardian/db/content/CheckerRecord;Z)Ljava/util/List;

    move-result-object v14

    .line 231
    .local v14, "alarmRecords":Ljava/util/List;, "Ljava/util/List<Lcom/mobnetic/coinguardian/db/content/AlarmRecord;>;"
    invoke-interface {v14}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v35

    :cond_2
    :goto_1
    invoke-interface/range {v35 .. v35}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_21

    invoke-interface/range {v35 .. v35}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;

    .line 232
    .local v4, "alarmRecord":Lcom/mobnetic/coinguardian/db/content/AlarmRecord;
    if-eqz v4, :cond_2

    .line 234
    invoke-virtual {v4}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->getEnabled()Z

    move-result v5

    if-nez v5, :cond_3

    .line 235
    const-string v5, "alarm"

    invoke-virtual {v4}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->getId()J

    move-result-wide v6

    long-to-int v6, v6

    move-object/from16 v0, v23

    invoke-virtual {v0, v5, v6}, Landroid/support/v4/app/NotificationManagerCompat;->cancel(Ljava/lang/String;I)V

    goto :goto_1

    .line 240
    :cond_3
    const/16 v26, 0x1

    .line 241
    .local v26, "shouldAlarmBeTriggered":Z
    const/16 v21, 0x0

    .line 242
    .local v21, "isDown":Z
    const/16 v28, 0x0

    .line 243
    .local v28, "text":Landroid/text/Spanned;
    const/16 v29, 0x0

    .line 244
    .local v29, "title":Landroid/text/Spanned;
    const-string v31, ""

    .line 246
    .local v31, "ttsString":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getMarketKey()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/mobnetic/coinguardian/util/MarketsConfigUtils;->getMarketByKey(Ljava/lang/String;)Lcom/mobnetic/coinguardian/model/Market;

    move-result-object v12

    .line 247
    .local v12, "market":Lcom/mobnetic/coinguardian/model/Market;
    invoke-virtual/range {p1 .. p1}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getCurrencySrc()Ljava/lang/String;

    move-result-object v5

    invoke-virtual/range {p1 .. p1}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getContractType()J

    move-result-wide v6

    long-to-int v6, v6

    invoke-static {v5, v12, v6}, Lcom/mobnetic/coinguardian/util/FormatUtils;->getCurrencySrcWithContractType(Ljava/lang/String;Lcom/mobnetic/coinguardian/model/Market;I)Ljava/lang/String;

    move-result-object v20

    .line 248
    .local v20, "currencySrcWithContractType":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getCurrencyDst()Ljava/lang/String;

    move-result-object v19

    .line 249
    .local v19, "currencyDst":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getCurrencySubunitDst()J

    move-result-wide v6

    move-object/from16 v0, v19

    invoke-static {v0, v6, v7}, Lcom/mobnetic/coinguardian/util/CurrencyUtils;->getCurrencySubunit(Ljava/lang/String;J)Lcom/mobnetic/coinguardian/model/CurrencySubunit;

    move-result-object v27

    .line 251
    .local v27, "subunitDst":Lcom/mobnetic/coinguardian/model/CurrencySubunit;
    invoke-virtual {v4}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->getType()J

    move-result-wide v6

    long-to-int v15, v6

    .line 252
    .local v15, "alarmTypeInt":I
    packed-switch v15, :pswitch_data_0

    .line 374
    const/16 v26, 0x0

    .line 378
    :cond_4
    :goto_2
    if-nez v26, :cond_15

    .line 379
    const-string v5, "alarm"

    invoke-virtual {v4}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->getId()J

    move-result-wide v6

    long-to-int v6, v6

    move-object/from16 v0, v23

    invoke-virtual {v0, v5, v6}, Landroid/support/v4/app/NotificationManagerCompat;->cancel(Ljava/lang/String;I)V

    goto :goto_1

    .line 256
    :pswitch_0
    invoke-virtual {v4}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->getLastCheckPointTicker()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/mobnetic/coinguardian/util/TickerUtils;->fromJson(Ljava/lang/String;)Lcom/mobnetic/coinguardian/model/Ticker;

    move-result-object v22

    .line 257
    .local v22, "lastCheckPointTicker":Lcom/mobnetic/coinguardian/model/Ticker;
    if-nez v22, :cond_5

    .line 258
    invoke-static/range {p2 .. p2}, Lcom/mobnetic/coinguardian/util/TickerUtils;->toJson(Lcom/mobnetic/coinguardian/model/Ticker;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->setLastCheckPointTicker(Ljava/lang/String;)V

    .line 259
    invoke-virtual {v4}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->save()J

    .line 260
    const/16 v26, 0x0

    .line 261
    goto :goto_2

    .line 264
    :cond_5
    move-object/from16 v0, v22

    iget-wide v6, v0, Lcom/mobnetic/coinguardian/model/Ticker;->last:D

    move-object/from16 v0, p2

    iget-wide v8, v0, Lcom/mobnetic/coinguardian/model/Ticker;->last:D

    invoke-static {v6, v7, v8, v9}, Lcom/mobnetic/coinguardian/util/AlarmRecordHelper;->getDifferenceForPercentageChange(DD)D

    move-result-wide v24

    .line 265
    .local v24, "percentageDifference":D
    invoke-virtual {v4}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->getValue()D

    move-result-wide v16

    .line 266
    .local v16, "alertTreshold":D
    if-nez v15, :cond_6

    invoke-static/range {v24 .. v25}, Ljava/lang/Math;->abs(D)D

    move-result-wide v6

    cmpg-double v5, v6, v16

    if-gez v5, :cond_6

    .line 267
    const/16 v26, 0x0

    .line 268
    goto :goto_2

    .line 269
    :cond_6
    const/4 v5, 0x1

    if-ne v15, v5, :cond_7

    cmpg-double v5, v24, v16

    if-gez v5, :cond_7

    .line 270
    const/16 v26, 0x0

    .line 271
    goto :goto_2

    .line 272
    :cond_7
    const/4 v5, 0x2

    if-ne v15, v5, :cond_8

    move-wide/from16 v0, v16

    neg-double v6, v0

    cmpl-double v5, v24, v6

    if-lez v5, :cond_8

    .line 273
    const/16 v26, 0x0

    .line 274
    goto :goto_2

    .line 277
    :cond_8
    invoke-static/range {p2 .. p2}, Lcom/mobnetic/coinguardian/util/TickerUtils;->toJson(Lcom/mobnetic/coinguardian/model/Ticker;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->setLastCheckPointTicker(Ljava/lang/String;)V

    .line 278
    invoke-virtual {v4}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->save()J

    .line 280
    const-wide/16 v6, 0x0

    cmpg-double v5, v24, v6

    if-gez v5, :cond_9

    const/16 v21, 0x1

    .line 281
    :goto_3
    if-eqz v21, :cond_a

    const v5, 0x7f07008b

    :goto_4
    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v30

    .line 282
    .local v30, "ttsDownOrUpString":Ljava/lang/String;
    const v5, 0x7f070089

    const/4 v6, 0x3

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object v20, v6, v7

    const/4 v7, 0x1

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "<b>"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    move-object/from16 v0, p2

    iget-wide v10, v0, Lcom/mobnetic/coinguardian/model/Ticker;->last:D

    .line 284
    move-object/from16 v0, v27

    invoke-static {v10, v11, v0}, Lcom/mobnetic/coinguardian/util/FormatUtils;->formatPriceWithCurrency(DLcom/mobnetic/coinguardian/model/CurrencySubunit;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "</b>"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    const/4 v7, 0x2

    iget-object v8, v12, Lcom/mobnetic/coinguardian/model/Market;->name:Ljava/lang/String;

    aput-object v8, v6, v7

    .line 282
    move-object/from16 v0, p0

    invoke-virtual {v0, v5, v6}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v29

    .line 286
    const v11, 0x7f070086

    const/4 v5, 0x3

    new-array v13, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "<b>"

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-wide/16 v8, 0x0

    cmpl-double v5, v24, v8

    if-lez v5, :cond_b

    const-string v5, "+"

    :goto_5
    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const/4 v7, 0x0

    .line 287
    move-wide/from16 v0, v24

    invoke-static {v0, v1, v7}, Lcom/mobnetic/coinguardian/util/FormatUtils;->formatDouble(DZ)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v7, "%</b>"

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v13, v6

    const/4 v5, 0x1

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "<b>"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move-object/from16 v0, v22

    iget-wide v8, v0, Lcom/mobnetic/coinguardian/model/Ticker;->last:D

    .line 288
    move-object/from16 v0, v27

    invoke-static {v8, v9, v0}, Lcom/mobnetic/coinguardian/util/FormatUtils;->formatPriceWithCurrency(DLcom/mobnetic/coinguardian/model/CurrencySubunit;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "</b>"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v13, v5

    const/16 v36, 0x2

    move-object/from16 v0, v22

    iget-wide v6, v0, Lcom/mobnetic/coinguardian/model/Ticker;->timestamp:J

    move-object/from16 v0, p2

    iget-wide v8, v0, Lcom/mobnetic/coinguardian/model/Ticker;->timestamp:J

    const/4 v10, 0x1

    move-object/from16 v5, p0

    .line 289
    invoke-static/range {v5 .. v10}, Lcom/mobnetic/coinguardian/util/FormatUtils;->formatRelativeTime(Landroid/content/Context;JJZ)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v13, v36

    .line 286
    move-object/from16 v0, p0

    invoke-virtual {v0, v11, v13}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v28

    .line 290
    const v36, 0x7f07008d

    const/4 v5, 0x3

    new-array v0, v5, [Ljava/lang/Object;

    move-object/from16 v37, v0

    const/4 v5, 0x0

    aput-object v30, v37, v5

    const/16 v38, 0x1

    move-object/from16 v0, v22

    iget-wide v6, v0, Lcom/mobnetic/coinguardian/model/Ticker;->last:D

    const/4 v9, 0x1

    const/4 v11, 0x1

    const/4 v13, 0x1

    move-object/from16 v5, p0

    move-object/from16 v8, p1

    move-object/from16 v10, v27

    .line 292
    invoke-static/range {v5 .. v13}, Lcom/mobnetic/coinguardian/util/FormatUtils;->formatTextForTTS(Landroid/content/Context;DLcom/mobnetic/coinguardian/db/content/CheckerRecord;ZLcom/mobnetic/coinguardian/model/CurrencySubunit;ZLcom/mobnetic/coinguardian/model/Market;Z)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v37, v38

    const/16 v38, 0x2

    move-object/from16 v0, p2

    iget-wide v6, v0, Lcom/mobnetic/coinguardian/model/Ticker;->last:D

    const/4 v9, 0x1

    const/4 v11, 0x0

    const/4 v13, 0x0

    move-object/from16 v5, p0

    move-object/from16 v8, p1

    move-object/from16 v10, v27

    .line 293
    invoke-static/range {v5 .. v13}, Lcom/mobnetic/coinguardian/util/FormatUtils;->formatTextForTTS(Landroid/content/Context;DLcom/mobnetic/coinguardian/db/content/CheckerRecord;ZLcom/mobnetic/coinguardian/model/CurrencySubunit;ZLcom/mobnetic/coinguardian/model/Market;Z)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v37, v38

    .line 290
    move-object/from16 v0, p0

    move/from16 v1, v36

    move-object/from16 v2, v37

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v31

    .line 294
    invoke-static/range {p0 .. p0}, Lcom/mobnetic/coinguardian/util/PreferencesUtils;->getTTSFormatSpeakBaseCurrency(Landroid/content/Context;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 295
    const v5, 0x7f07010f

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    invoke-virtual/range {p1 .. p1}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getCurrencySrc()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    const/4 v7, 0x1

    aput-object v31, v6, v7

    move-object/from16 v0, p0

    invoke-virtual {v0, v5, v6}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v31

    goto/16 :goto_2

    .line 280
    .end local v30    # "ttsDownOrUpString":Ljava/lang/String;
    :cond_9
    const/16 v21, 0x0

    goto/16 :goto_3

    .line 281
    :cond_a
    const v5, 0x7f07008e

    goto/16 :goto_4

    .line 286
    .restart local v30    # "ttsDownOrUpString":Ljava/lang/String;
    :cond_b
    const-string v5, ""

    goto/16 :goto_5

    .line 300
    .end local v16    # "alertTreshold":D
    .end local v22    # "lastCheckPointTicker":Lcom/mobnetic/coinguardian/model/Ticker;
    .end local v24    # "percentageDifference":D
    .end local v30    # "ttsDownOrUpString":Ljava/lang/String;
    :pswitch_1
    invoke-virtual {v4}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->getLastCheckPointTicker()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/mobnetic/coinguardian/util/TickerUtils;->fromJson(Ljava/lang/String;)Lcom/mobnetic/coinguardian/model/Ticker;

    move-result-object v22

    .line 301
    .restart local v22    # "lastCheckPointTicker":Lcom/mobnetic/coinguardian/model/Ticker;
    if-nez v22, :cond_c

    .line 302
    invoke-static/range {p2 .. p2}, Lcom/mobnetic/coinguardian/util/TickerUtils;->toJson(Lcom/mobnetic/coinguardian/model/Ticker;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->setLastCheckPointTicker(Ljava/lang/String;)V

    .line 303
    invoke-virtual {v4}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->save()J

    .line 304
    const/16 v26, 0x0

    .line 305
    goto/16 :goto_2

    .line 308
    :cond_c
    invoke-virtual {v4}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->getValue()D

    move-result-wide v6

    invoke-static {v6, v7}, Lcom/mobnetic/coinguardian/util/FormatUtils;->fixSatoshi(D)Ljava/math/BigDecimal;

    move-result-object v16

    .line 309
    .local v16, "alertTreshold":Ljava/math/BigDecimal;
    move-object/from16 v0, p2

    iget-wide v6, v0, Lcom/mobnetic/coinguardian/model/Ticker;->last:D

    invoke-static {v6, v7}, Lcom/mobnetic/coinguardian/util/FormatUtils;->fixSatoshi(D)Ljava/math/BigDecimal;

    move-result-object v5

    move-object/from16 v0, v22

    iget-wide v6, v0, Lcom/mobnetic/coinguardian/model/Ticker;->last:D

    invoke-static {v6, v7}, Lcom/mobnetic/coinguardian/util/FormatUtils;->fixSatoshi(D)Ljava/math/BigDecimal;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/math/BigDecimal;->subtract(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v33

    .line 310
    .local v33, "valueDifference":Ljava/math/BigDecimal;
    const/4 v5, 0x3

    if-ne v15, v5, :cond_d

    invoke-virtual/range {v33 .. v33}, Ljava/math/BigDecimal;->abs()Ljava/math/BigDecimal;

    move-result-object v5

    move-object/from16 v0, v16

    invoke-virtual {v5, v0}, Ljava/math/BigDecimal;->compareTo(Ljava/math/BigDecimal;)I

    move-result v5

    if-gez v5, :cond_d

    .line 311
    const/16 v26, 0x0

    .line 312
    goto/16 :goto_2

    .line 313
    :cond_d
    const/4 v5, 0x4

    if-ne v15, v5, :cond_e

    move-object/from16 v0, v33

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/math/BigDecimal;->compareTo(Ljava/math/BigDecimal;)I

    move-result v5

    if-gez v5, :cond_e

    .line 314
    const/16 v26, 0x0

    .line 315
    goto/16 :goto_2

    .line 316
    :cond_e
    const/4 v5, 0x5

    if-ne v15, v5, :cond_f

    invoke-virtual/range {v16 .. v16}, Ljava/math/BigDecimal;->negate()Ljava/math/BigDecimal;

    move-result-object v5

    move-object/from16 v0, v33

    invoke-virtual {v0, v5}, Ljava/math/BigDecimal;->compareTo(Ljava/math/BigDecimal;)I

    move-result v5

    if-lez v5, :cond_f

    .line 317
    const/16 v26, 0x0

    .line 318
    goto/16 :goto_2

    .line 321
    :cond_f
    invoke-static/range {p2 .. p2}, Lcom/mobnetic/coinguardian/util/TickerUtils;->toJson(Lcom/mobnetic/coinguardian/model/Ticker;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->setLastCheckPointTicker(Ljava/lang/String;)V

    .line 322
    invoke-virtual {v4}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->save()J

    .line 324
    invoke-virtual/range {v33 .. v33}, Ljava/math/BigDecimal;->doubleValue()D

    move-result-wide v6

    const-wide/16 v8, 0x0

    cmpg-double v5, v6, v8

    if-gez v5, :cond_10

    const/16 v21, 0x1

    .line 325
    :goto_6
    if-eqz v21, :cond_11

    const v5, 0x7f07008b

    :goto_7
    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v30

    .line 326
    .restart local v30    # "ttsDownOrUpString":Ljava/lang/String;
    const v5, 0x7f07008a

    const/4 v6, 0x3

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object v20, v6, v7

    const/4 v7, 0x1

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "<b>"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    move-object/from16 v0, p2

    iget-wide v10, v0, Lcom/mobnetic/coinguardian/model/Ticker;->last:D

    .line 328
    move-object/from16 v0, v27

    invoke-static {v10, v11, v0}, Lcom/mobnetic/coinguardian/util/FormatUtils;->formatPriceWithCurrency(DLcom/mobnetic/coinguardian/model/CurrencySubunit;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "</b>"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    const/4 v7, 0x2

    iget-object v8, v12, Lcom/mobnetic/coinguardian/model/Market;->name:Ljava/lang/String;

    aput-object v8, v6, v7

    .line 326
    move-object/from16 v0, p0

    invoke-virtual {v0, v5, v6}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v29

    .line 330
    const v11, 0x7f070087

    const/4 v5, 0x3

    new-array v13, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "<b>"

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 331
    invoke-virtual/range {v33 .. v33}, Ljava/math/BigDecimal;->doubleValue()D

    move-result-wide v8

    const-wide/16 v36, 0x0

    cmpl-double v5, v8, v36

    if-lez v5, :cond_12

    const-string v5, "+"

    :goto_8
    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual/range {v33 .. v33}, Ljava/math/BigDecimal;->doubleValue()D

    move-result-wide v8

    move-object/from16 v0, v27

    invoke-static {v8, v9, v0}, Lcom/mobnetic/coinguardian/util/FormatUtils;->formatPriceWithCurrency(DLcom/mobnetic/coinguardian/model/CurrencySubunit;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v7, "</b>"

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v13, v6

    const/4 v5, 0x1

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "<b>"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move-object/from16 v0, v22

    iget-wide v8, v0, Lcom/mobnetic/coinguardian/model/Ticker;->last:D

    .line 332
    move-object/from16 v0, v27

    invoke-static {v8, v9, v0}, Lcom/mobnetic/coinguardian/util/FormatUtils;->formatPriceWithCurrency(DLcom/mobnetic/coinguardian/model/CurrencySubunit;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "</b>"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v13, v5

    const/16 v36, 0x2

    move-object/from16 v0, v22

    iget-wide v6, v0, Lcom/mobnetic/coinguardian/model/Ticker;->timestamp:J

    move-object/from16 v0, p2

    iget-wide v8, v0, Lcom/mobnetic/coinguardian/model/Ticker;->timestamp:J

    const/4 v10, 0x1

    move-object/from16 v5, p0

    .line 333
    invoke-static/range {v5 .. v10}, Lcom/mobnetic/coinguardian/util/FormatUtils;->formatRelativeTime(Landroid/content/Context;JJZ)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v13, v36

    .line 330
    move-object/from16 v0, p0

    invoke-virtual {v0, v11, v13}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v28

    .line 334
    const v36, 0x7f07008d

    const/4 v5, 0x3

    new-array v0, v5, [Ljava/lang/Object;

    move-object/from16 v37, v0

    const/4 v5, 0x0

    aput-object v30, v37, v5

    const/16 v38, 0x1

    move-object/from16 v0, v22

    iget-wide v6, v0, Lcom/mobnetic/coinguardian/model/Ticker;->last:D

    const/4 v9, 0x1

    const/4 v11, 0x1

    const/4 v13, 0x1

    move-object/from16 v5, p0

    move-object/from16 v8, p1

    move-object/from16 v10, v27

    .line 336
    invoke-static/range {v5 .. v13}, Lcom/mobnetic/coinguardian/util/FormatUtils;->formatTextForTTS(Landroid/content/Context;DLcom/mobnetic/coinguardian/db/content/CheckerRecord;ZLcom/mobnetic/coinguardian/model/CurrencySubunit;ZLcom/mobnetic/coinguardian/model/Market;Z)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v37, v38

    const/16 v38, 0x2

    move-object/from16 v0, p2

    iget-wide v6, v0, Lcom/mobnetic/coinguardian/model/Ticker;->last:D

    const/4 v9, 0x1

    const/4 v11, 0x0

    const/4 v13, 0x0

    move-object/from16 v5, p0

    move-object/from16 v8, p1

    move-object/from16 v10, v27

    .line 337
    invoke-static/range {v5 .. v13}, Lcom/mobnetic/coinguardian/util/FormatUtils;->formatTextForTTS(Landroid/content/Context;DLcom/mobnetic/coinguardian/db/content/CheckerRecord;ZLcom/mobnetic/coinguardian/model/CurrencySubunit;ZLcom/mobnetic/coinguardian/model/Market;Z)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v37, v38

    .line 334
    move-object/from16 v0, p0

    move/from16 v1, v36

    move-object/from16 v2, v37

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v31

    .line 338
    invoke-static/range {p0 .. p0}, Lcom/mobnetic/coinguardian/util/PreferencesUtils;->getTTSFormatSpeakBaseCurrency(Landroid/content/Context;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 339
    const v5, 0x7f07010f

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    invoke-virtual/range {p1 .. p1}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getCurrencySrc()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    const/4 v7, 0x1

    aput-object v31, v6, v7

    move-object/from16 v0, p0

    invoke-virtual {v0, v5, v6}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v31

    goto/16 :goto_2

    .line 324
    .end local v30    # "ttsDownOrUpString":Ljava/lang/String;
    :cond_10
    const/16 v21, 0x0

    goto/16 :goto_6

    .line 325
    :cond_11
    const v5, 0x7f07008e

    goto/16 :goto_7

    .line 331
    .restart local v30    # "ttsDownOrUpString":Ljava/lang/String;
    :cond_12
    const-string v5, ""

    goto/16 :goto_8

    .line 342
    .end local v16    # "alertTreshold":Ljava/math/BigDecimal;
    .end local v22    # "lastCheckPointTicker":Lcom/mobnetic/coinguardian/model/Ticker;
    .end local v30    # "ttsDownOrUpString":Ljava/lang/String;
    .end local v33    # "valueDifference":Ljava/math/BigDecimal;
    :pswitch_2
    move-object/from16 v0, p2

    iget-wide v6, v0, Lcom/mobnetic/coinguardian/model/Ticker;->last:D

    invoke-virtual {v4}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->getValue()D

    move-result-wide v8

    cmpg-double v5, v6, v8

    if-gez v5, :cond_13

    .line 343
    const/16 v26, 0x0

    .line 344
    goto/16 :goto_2

    .line 347
    :cond_13
    const/16 v21, 0x0

    .line 348
    const v5, 0x7f070088

    const/4 v6, 0x3

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object v20, v6, v7

    const/4 v7, 0x1

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "<b>"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    move-object/from16 v0, p2

    iget-wide v10, v0, Lcom/mobnetic/coinguardian/model/Ticker;->last:D

    .line 350
    move-object/from16 v0, v27

    invoke-static {v10, v11, v0}, Lcom/mobnetic/coinguardian/util/FormatUtils;->formatPriceWithCurrency(DLcom/mobnetic/coinguardian/model/CurrencySubunit;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "</b>"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    const/4 v7, 0x2

    iget-object v8, v12, Lcom/mobnetic/coinguardian/model/Market;->name:Ljava/lang/String;

    aput-object v8, v6, v7

    .line 348
    move-object/from16 v0, p0

    invoke-virtual {v0, v5, v6}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v29

    .line 352
    const v5, 0x7f070084

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "<b>"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    .line 353
    invoke-virtual {v4}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->getValue()D

    move-result-wide v10

    move-object/from16 v0, v27

    invoke-static {v10, v11, v0}, Lcom/mobnetic/coinguardian/util/FormatUtils;->formatPriceWithCurrency(DLcom/mobnetic/coinguardian/model/CurrencySubunit;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "</b>"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    .line 352
    move-object/from16 v0, p0

    invoke-virtual {v0, v5, v6}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v28

    .line 354
    const v5, 0x7f07008c

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v13, 0x0

    move-object/from16 v0, p2

    iget-wide v8, v0, Lcom/mobnetic/coinguardian/model/Ticker;->last:D

    move-object/from16 v7, p0

    move-object/from16 v10, p1

    move-object/from16 v11, v27

    .line 355
    invoke-static/range {v7 .. v12}, Lcom/mobnetic/coinguardian/util/FormatUtils;->formatTextForTTS(Landroid/content/Context;DLcom/mobnetic/coinguardian/db/content/CheckerRecord;Lcom/mobnetic/coinguardian/model/CurrencySubunit;Lcom/mobnetic/coinguardian/model/Market;)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v13

    .line 354
    move-object/from16 v0, p0

    invoke-virtual {v0, v5, v6}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v31

    .line 356
    goto/16 :goto_2

    .line 358
    :pswitch_3
    move-object/from16 v0, p2

    iget-wide v6, v0, Lcom/mobnetic/coinguardian/model/Ticker;->last:D

    invoke-virtual {v4}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->getValue()D

    move-result-wide v8

    cmpl-double v5, v6, v8

    if-lez v5, :cond_14

    .line 359
    const/16 v26, 0x0

    .line 360
    goto/16 :goto_2

    .line 363
    :cond_14
    const/16 v21, 0x1

    .line 364
    const v5, 0x7f070088

    const/4 v6, 0x3

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object v20, v6, v7

    const/4 v7, 0x1

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "<b>"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    move-object/from16 v0, p2

    iget-wide v10, v0, Lcom/mobnetic/coinguardian/model/Ticker;->last:D

    .line 366
    move-object/from16 v0, v27

    invoke-static {v10, v11, v0}, Lcom/mobnetic/coinguardian/util/FormatUtils;->formatPriceWithCurrency(DLcom/mobnetic/coinguardian/model/CurrencySubunit;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "</b>"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    const/4 v7, 0x2

    iget-object v8, v12, Lcom/mobnetic/coinguardian/model/Market;->name:Ljava/lang/String;

    aput-object v8, v6, v7

    .line 364
    move-object/from16 v0, p0

    invoke-virtual {v0, v5, v6}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v29

    .line 368
    const v5, 0x7f070085

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "<b>"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    .line 369
    invoke-virtual {v4}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->getValue()D

    move-result-wide v10

    move-object/from16 v0, v27

    invoke-static {v10, v11, v0}, Lcom/mobnetic/coinguardian/util/FormatUtils;->formatPriceWithCurrency(DLcom/mobnetic/coinguardian/model/CurrencySubunit;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "</b>"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    .line 368
    move-object/from16 v0, p0

    invoke-virtual {v0, v5, v6}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v28

    .line 370
    const v5, 0x7f07008c

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v13, 0x0

    move-object/from16 v0, p2

    iget-wide v8, v0, Lcom/mobnetic/coinguardian/model/Ticker;->last:D

    move-object/from16 v7, p0

    move-object/from16 v10, p1

    move-object/from16 v11, v27

    .line 371
    invoke-static/range {v7 .. v12}, Lcom/mobnetic/coinguardian/util/FormatUtils;->formatTextForTTS(Landroid/content/Context;DLcom/mobnetic/coinguardian/db/content/CheckerRecord;Lcom/mobnetic/coinguardian/model/CurrencySubunit;Lcom/mobnetic/coinguardian/model/Market;)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v13

    .line 370
    move-object/from16 v0, p0

    invoke-virtual {v0, v5, v6}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v31

    .line 372
    goto/16 :goto_2

    .line 383
    :cond_15
    const/16 v32, 0x0

    .line 384
    .local v32, "useAlarmKlaxon":Z
    new-instance v5, Landroid/support/v4/app/NotificationCompat$Builder;

    move-object/from16 v0, p0

    invoke-direct {v5, v0}, Landroid/support/v4/app/NotificationCompat$Builder;-><init>(Landroid/content/Context;)V

    .line 385
    move-object/from16 v0, v29

    invoke-virtual {v5, v0}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v5

    .line 386
    move-object/from16 v0, v28

    invoke-virtual {v5, v0}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v5

    .line 387
    move-object/from16 v0, v29

    invoke-virtual {v5, v0}, Landroid/support/v4/app/NotificationCompat$Builder;->setTicker(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v5

    .line 388
    move/from16 v0, v32

    invoke-virtual {v5, v0}, Landroid/support/v4/app/NotificationCompat$Builder;->setOngoing(Z)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v5

    const/4 v6, 0x1

    .line 389
    invoke-virtual {v5, v6}, Landroid/support/v4/app/NotificationCompat$Builder;->setAutoCancel(Z)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v5

    const/4 v6, 0x0

    .line 390
    invoke-virtual {v5, v6}, Landroid/support/v4/app/NotificationCompat$Builder;->setOnlyAlertOnce(Z)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v5

    move-object/from16 v0, p2

    iget-wide v6, v0, Lcom/mobnetic/coinguardian/model/Ticker;->timestamp:J

    .line 391
    invoke-virtual {v5, v6, v7}, Landroid/support/v4/app/NotificationCompat$Builder;->setWhen(J)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v5

    const/4 v6, 0x2

    .line 392
    invoke-virtual {v5, v6}, Landroid/support/v4/app/NotificationCompat$Builder;->setPriority(I)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v5

    .line 393
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-static {v0, v1, v4}, Lcom/mobnetic/coinguardian/util/NotificationUtils;->createCheckerAlertDetailsPendingIntent(Landroid/content/Context;Lcom/mobnetic/coinguardian/db/content/CheckerRecord;Lcom/mobnetic/coinguardian/db/content/AlarmRecord;)Landroid/app/PendingIntent;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v18

    .line 395
    .local v18, "builder":Landroid/support/v4/app/NotificationCompat$Builder;
    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v6, 0x15

    if-lt v5, v6, :cond_1c

    .line 396
    if-eqz v21, :cond_1a

    const v5, 0x7f020080

    :goto_9
    move-object/from16 v0, v18

    invoke-virtual {v0, v5}, Landroid/support/v4/app/NotificationCompat$Builder;->setSmallIcon(I)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 397
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    if-eqz v21, :cond_1b

    const v5, 0x7f0d0007

    :goto_a
    invoke-virtual {v6, v5}, Landroid/content/res/Resources;->getColor(I)I

    move-result v5

    move-object/from16 v0, v18

    invoke-virtual {v0, v5}, Landroid/support/v4/app/NotificationCompat$Builder;->setColor(I)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 404
    :goto_b
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-static {v0, v1, v4}, Lcom/mobnetic/coinguardian/util/NotificationUtils;->createAlarmDismissPendingIntent(Landroid/content/Context;Lcom/mobnetic/coinguardian/db/content/CheckerRecord;Lcom/mobnetic/coinguardian/db/content/AlarmRecord;)Landroid/app/PendingIntent;

    move-result-object v5

    move-object/from16 v0, v18

    invoke-virtual {v0, v5}, Landroid/support/v4/app/NotificationCompat$Builder;->setDeleteIntent(Landroid/app/PendingIntent;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 405
    if-eqz v32, :cond_1e

    .line 406
    const v5, 0x7f02007e

    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v7, 0x7f070083

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 407
    invoke-virtual/range {p1 .. p1}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getId()J

    move-result-wide v8

    invoke-virtual {v4}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->getId()J

    move-result-wide v10

    move-object/from16 v0, p0

    invoke-static {v0, v8, v9, v10, v11}, Lcom/mobnetic/coinguardian/alarm/AlarmKlaxonHelper;->createAlarmKlaxonDismissPendingIntent(Landroid/content/Context;JJ)Landroid/app/PendingIntent;

    move-result-object v7

    .line 406
    move-object/from16 v0, v18

    invoke-virtual {v0, v5, v6, v7}, Landroid/support/v4/app/NotificationCompat$Builder;->addAction(ILjava/lang/CharSequence;Landroid/app/PendingIntent;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 417
    :cond_16
    :goto_c
    invoke-virtual {v4}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->getVibrate()Z

    move-result v5

    if-eqz v5, :cond_17

    .line 418
    const/4 v5, 0x4

    new-array v5, v5, [J

    fill-array-data v5, :array_0

    move-object/from16 v0, v18

    invoke-virtual {v0, v5}, Landroid/support/v4/app/NotificationCompat$Builder;->setVibrate([J)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 420
    :cond_17
    invoke-virtual {v4}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->getLed()Z

    move-result v5

    if-eqz v5, :cond_18

    .line 421
    if-eqz v21, :cond_20

    const/high16 v5, -0x10000

    :goto_d
    const/16 v6, 0x3e8

    const/16 v7, 0x3e8

    move-object/from16 v0, v18

    invoke-virtual {v0, v5, v6, v7}, Landroid/support/v4/app/NotificationCompat$Builder;->setLights(III)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 423
    :cond_18
    const-string v5, "alarm"

    invoke-virtual {v4}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->getId()J

    move-result-wide v6

    long-to-int v6, v6

    move-object/from16 v0, v23

    invoke-virtual {v0, v5, v6}, Landroid/support/v4/app/NotificationManagerCompat;->cancel(Ljava/lang/String;I)V

    .line 424
    const-string v5, "alarm"

    invoke-virtual {v4}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->getId()J

    move-result-wide v6

    long-to-int v6, v6

    invoke-virtual/range {v18 .. v18}, Landroid/support/v4/app/NotificationCompat$Builder;->build()Landroid/app/Notification;

    move-result-object v7

    move-object/from16 v0, v23

    invoke-virtual {v0, v5, v6, v7}, Landroid/support/v4/app/NotificationManagerCompat;->notify(Ljava/lang/String;ILandroid/app/Notification;)V

    .line 426
    if-eqz v32, :cond_19

    .line 427
    move-object/from16 v0, p0

    invoke-static {v0, v4}, Lcom/mobnetic/coinguardian/alarm/AlarmKlaxonHelper;->startAlarmKlaxon(Landroid/content/Context;Lcom/mobnetic/coinguardian/db/content/AlarmRecord;)V

    .line 432
    :cond_19
    invoke-virtual {v4}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->getTtsEnabled()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-static/range {v31 .. v31}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_2

    .line 433
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    move-object/from16 v0, v31

    invoke-static {v5, v0}, Lcom/mobnetic/coinguardian/util/TTSHelper;->speak(Landroid/content/Context;Ljava/lang/String;)V

    .line 434
    or-int/lit8 v34, v34, 0x1

    goto/16 :goto_1

    .line 396
    :cond_1a
    const v5, 0x7f020082

    goto/16 :goto_9

    .line 397
    :cond_1b
    const v5, 0x7f0d0006

    goto/16 :goto_a

    .line 399
    :cond_1c
    if-eqz v21, :cond_1d

    const v5, 0x7f02007f

    :goto_e
    move-object/from16 v0, v18

    invoke-virtual {v0, v5}, Landroid/support/v4/app/NotificationCompat$Builder;->setSmallIcon(I)Landroid/support/v4/app/NotificationCompat$Builder;

    goto/16 :goto_b

    :cond_1d
    const v5, 0x7f020081

    goto :goto_e

    .line 409
    :cond_1e
    invoke-virtual {v4}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->getSound()Z

    move-result v5

    if-eqz v5, :cond_16

    .line 410
    if-eqz v21, :cond_1f

    .line 411
    invoke-static/range {p0 .. p0}, Lcom/mobnetic/coinguardian/util/PreferencesUtils;->getSoundAlarmNotificationDown(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v5

    .line 410
    :goto_f
    invoke-static {v5}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v5

    .line 413
    invoke-static/range {p0 .. p0}, Lcom/mobnetic/coinguardian/util/PreferencesUtils;->getSoundsAdvancedAlarmStream(Landroid/content/Context;)I

    move-result v6

    .line 410
    move-object/from16 v0, v18

    invoke-virtual {v0, v5, v6}, Landroid/support/v4/app/NotificationCompat$Builder;->setSound(Landroid/net/Uri;I)Landroid/support/v4/app/NotificationCompat$Builder;

    goto/16 :goto_c

    .line 412
    :cond_1f
    invoke-static/range {p0 .. p0}, Lcom/mobnetic/coinguardian/util/PreferencesUtils;->getSoundAlarmNotificationUp(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v5

    goto :goto_f

    .line 421
    :cond_20
    const v5, -0xff0100

    goto/16 :goto_d

    .end local v4    # "alarmRecord":Lcom/mobnetic/coinguardian/db/content/AlarmRecord;
    .end local v12    # "market":Lcom/mobnetic/coinguardian/model/Market;
    .end local v15    # "alarmTypeInt":I
    .end local v18    # "builder":Landroid/support/v4/app/NotificationCompat$Builder;
    .end local v19    # "currencyDst":Ljava/lang/String;
    .end local v20    # "currencySrcWithContractType":Ljava/lang/String;
    .end local v21    # "isDown":Z
    .end local v26    # "shouldAlarmBeTriggered":Z
    .end local v27    # "subunitDst":Lcom/mobnetic/coinguardian/model/CurrencySubunit;
    .end local v28    # "text":Landroid/text/Spanned;
    .end local v29    # "title":Landroid/text/Spanned;
    .end local v31    # "ttsString":Ljava/lang/String;
    .end local v32    # "useAlarmKlaxon":Z
    :cond_21
    move/from16 v5, v34

    .line 438
    goto/16 :goto_0

    .line 252
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch

    .line 418
    :array_0
    .array-data 8
        0x0
        0x1f4
        0xfa
        0x1f4
    .end array-data
.end method

.method public static clearAlarmNotificationForAlarmRecord(Landroid/content/Context;J)V
    .locals 5
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "alarmRecordId"    # J

    .prologue
    .line 493
    const-wide/16 v2, 0x0

    cmp-long v1, p1, v2

    if-lez v1, :cond_0

    .line 494
    invoke-static {p0}, Landroid/support/v4/app/NotificationManagerCompat;->from(Landroid/content/Context;)Landroid/support/v4/app/NotificationManagerCompat;

    move-result-object v0

    .line 495
    .local v0, "notificationManager":Landroid/support/v4/app/NotificationManagerCompat;
    const-string v1, "alarm"

    long-to-int v2, p1

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/app/NotificationManagerCompat;->cancel(Ljava/lang/String;I)V

    .line 497
    .end local v0    # "notificationManager":Landroid/support/v4/app/NotificationManagerCompat;
    :cond_0
    return-void
.end method

.method private static clearAlarmNotificationForCheckerRecord(Landroid/content/Context;Landroid/support/v4/app/NotificationManagerCompat;Lcom/mobnetic/coinguardian/db/content/CheckerRecord;)V
    .locals 8
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "notificationManager"    # Landroid/support/v4/app/NotificationManagerCompat;
    .param p2, "checkerRecord"    # Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    .prologue
    .line 486
    invoke-virtual {p2}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getId()J

    move-result-wide v4

    invoke-static {v4, v5}, Lcom/mobnetic/coinguardian/util/CheckerRecordHelper;->getAlarmsIdsForCheckerRecord(J)Ljava/util/List;

    move-result-object v2

    .line 487
    .local v2, "alarmsIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Long;>;"
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_0
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Long;

    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    .line 488
    .local v0, "alarmRecordId":J
    const-wide/16 v6, 0x0

    cmp-long v3, v0, v6

    if-lez v3, :cond_0

    .line 489
    const-string v3, "alarm"

    long-to-int v5, v0

    invoke-virtual {p1, v3, v5}, Landroid/support/v4/app/NotificationManagerCompat;->cancel(Ljava/lang/String;I)V

    goto :goto_0

    .line 491
    .end local v0    # "alarmRecordId":J
    :cond_1
    return-void
.end method

.method public static clearAlarmNotificationForCheckerRecord(Landroid/content/Context;Lcom/mobnetic/coinguardian/db/content/CheckerRecord;)V
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "checkerRecord"    # Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    .prologue
    .line 482
    invoke-static {p0}, Landroid/support/v4/app/NotificationManagerCompat;->from(Landroid/content/Context;)Landroid/support/v4/app/NotificationManagerCompat;

    move-result-object v0

    .line 483
    .local v0, "notificationManager":Landroid/support/v4/app/NotificationManagerCompat;
    invoke-static {p0, v0, p1}, Lcom/mobnetic/coinguardian/util/NotificationUtils;->clearAlarmNotificationForCheckerRecord(Landroid/content/Context;Landroid/support/v4/app/NotificationManagerCompat;Lcom/mobnetic/coinguardian/db/content/CheckerRecord;)V

    .line 484
    return-void
.end method

.method public static clearNotificationsForCheckerRecord(Landroid/content/Context;Lcom/mobnetic/coinguardian/db/content/CheckerRecord;)V
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "checkerRecord"    # Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    .prologue
    .line 500
    invoke-static {p0}, Landroid/support/v4/app/NotificationManagerCompat;->from(Landroid/content/Context;)Landroid/support/v4/app/NotificationManagerCompat;

    move-result-object v0

    .line 501
    .local v0, "notificationManager":Landroid/support/v4/app/NotificationManagerCompat;
    invoke-static {p0, v0, p1}, Lcom/mobnetic/coinguardian/util/NotificationUtils;->clearOngoingNotificationForCheckerRecord(Landroid/content/Context;Landroid/support/v4/app/NotificationManagerCompat;Lcom/mobnetic/coinguardian/db/content/CheckerRecord;)V

    .line 502
    invoke-static {p0, v0, p1}, Lcom/mobnetic/coinguardian/util/NotificationUtils;->clearAlarmNotificationForCheckerRecord(Landroid/content/Context;Landroid/support/v4/app/NotificationManagerCompat;Lcom/mobnetic/coinguardian/db/content/CheckerRecord;)V

    .line 503
    return-void
.end method

.method public static clearOngoingNotification(Landroid/content/Context;Lcom/mobnetic/coinguardian/db/content/CheckerRecord;)V
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "checkerRecord"    # Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    .prologue
    .line 475
    invoke-static {p0}, Landroid/support/v4/app/NotificationManagerCompat;->from(Landroid/content/Context;)Landroid/support/v4/app/NotificationManagerCompat;

    move-result-object v0

    .line 476
    .local v0, "notificationManager":Landroid/support/v4/app/NotificationManagerCompat;
    invoke-static {p0, v0, p1}, Lcom/mobnetic/coinguardian/util/NotificationUtils;->clearOngoingNotificationForCheckerRecord(Landroid/content/Context;Landroid/support/v4/app/NotificationManagerCompat;Lcom/mobnetic/coinguardian/db/content/CheckerRecord;)V

    .line 477
    return-void
.end method

.method private static clearOngoingNotificationForCheckerRecord(Landroid/content/Context;Landroid/support/v4/app/NotificationManagerCompat;Lcom/mobnetic/coinguardian/db/content/CheckerRecord;)V
    .locals 4
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "notificationManager"    # Landroid/support/v4/app/NotificationManagerCompat;
    .param p2, "checkerRecord"    # Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    .prologue
    .line 479
    const-string v0, "checker"

    invoke-virtual {p2}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getId()J

    move-result-wide v2

    long-to-int v1, v2

    invoke-virtual {p1, v0, v1}, Landroid/support/v4/app/NotificationManagerCompat;->cancel(Ljava/lang/String;I)V

    .line 480
    return-void
.end method

.method private static createAlarmDismissPendingIntent(Landroid/content/Context;Lcom/mobnetic/coinguardian/db/content/CheckerRecord;Lcom/mobnetic/coinguardian/db/content/AlarmRecord;)Landroid/app/PendingIntent;
    .locals 4
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "checkerRecord"    # Lcom/mobnetic/coinguardian/db/content/CheckerRecord;
    .param p2, "alarmRecord"    # Lcom/mobnetic/coinguardian/db/content/AlarmRecord;

    .prologue
    .line 465
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.mobnetic.coinguardian.receiver.action.notification_alarm_dismiss"

    const/4 v2, 0x0

    const-class v3, Lcom/mobnetic/coinguardian/receiver/NotificationAndWidgetReceiver;

    invoke-direct {v0, v1, v2, p0, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;Landroid/content/Context;Ljava/lang/Class;)V

    .line 466
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "checker_record_id"

    invoke-virtual {p1}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getId()J

    move-result-wide v2

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 467
    const-string v1, "alarm_record_id"

    invoke-virtual {p2}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->getId()J

    move-result-wide v2

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 468
    invoke-virtual {p2}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->getId()J

    move-result-wide v2

    long-to-int v1, v2

    const/high16 v2, 0x8000000

    invoke-static {p0, v1, v0, v2}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v1

    return-object v1
.end method

.method private static createCheckerAlertDetailsPendingIntent(Landroid/content/Context;Lcom/mobnetic/coinguardian/db/content/CheckerRecord;Lcom/mobnetic/coinguardian/db/content/AlarmRecord;)Landroid/app/PendingIntent;
    .locals 4
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "checkerRecord"    # Lcom/mobnetic/coinguardian/db/content/CheckerRecord;
    .param p2, "alarmRecord"    # Lcom/mobnetic/coinguardian/db/content/AlarmRecord;

    .prologue
    .line 458
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.mobnetic.coinguardian.receiver.action.notification_checker_alarm_details"

    const/4 v2, 0x0

    const-class v3, Lcom/mobnetic/coinguardian/receiver/NotificationAndWidgetReceiver;

    invoke-direct {v0, v1, v2, p0, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;Landroid/content/Context;Ljava/lang/Class;)V

    .line 459
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "checker_record_id"

    invoke-virtual {p1}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getId()J

    move-result-wide v2

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 460
    const-string v1, "alarm_record_id"

    invoke-virtual {p2}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->getId()J

    move-result-wide v2

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 461
    invoke-virtual {p2}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->getId()J

    move-result-wide v2

    long-to-int v1, v2

    const/4 v2, 0x0

    invoke-static {p0, v1, v0, v2}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v1

    return-object v1
.end method

.method private static createCheckerDetailsPendingIntent(Landroid/content/Context;Lcom/mobnetic/coinguardian/db/content/CheckerRecord;)Landroid/app/PendingIntent;
    .locals 4
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "checkerRecord"    # Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    .prologue
    .line 452
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/mobnetic/coinguardian/activity/CheckerAddActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 453
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "checker_record_id"

    invoke-virtual {p1}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getId()J

    move-result-wide v2

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 454
    invoke-virtual {p1}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getId()J

    move-result-wide v2

    long-to-int v1, v2

    const/4 v2, 0x0

    invoke-static {p0, v1, v0, v2}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v1

    return-object v1
.end method

.method public static createMainActivityPendingIntent(Landroid/content/Context;)Landroid/app/PendingIntent;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const/4 v2, 0x0

    .line 446
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/mobnetic/coinguardian/activity/CheckersListActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 447
    .local v0, "intent":Landroid/content/Intent;
    const/high16 v1, 0x24000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 448
    invoke-static {p0, v2, v0, v2}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v1

    return-object v1
.end method

.method public static getIconBackgroundColorResIdForTickersLollipop(Lcom/mobnetic/coinguardian/model/Ticker;Lcom/mobnetic/coinguardian/model/Ticker;)I
    .locals 4
    .param p0, "previousCheckTicker"    # Lcom/mobnetic/coinguardian/model/Ticker;
    .param p1, "lastCheckTicker"    # Lcom/mobnetic/coinguardian/model/Ticker;

    .prologue
    .line 537
    if-eqz p0, :cond_0

    if-eqz p1, :cond_0

    iget-wide v0, p0, Lcom/mobnetic/coinguardian/model/Ticker;->last:D

    iget-wide v2, p1, Lcom/mobnetic/coinguardian/model/Ticker;->last:D

    cmpl-double v0, v0, v2

    if-nez v0, :cond_1

    .line 538
    :cond_0
    const v0, 0x7f0d0005

    .line 542
    :goto_0
    return v0

    .line 539
    :cond_1
    iget-wide v0, p1, Lcom/mobnetic/coinguardian/model/Ticker;->last:D

    iget-wide v2, p0, Lcom/mobnetic/coinguardian/model/Ticker;->last:D

    cmpl-double v0, v0, v2

    if-lez v0, :cond_2

    .line 540
    const v0, 0x7f0d0006

    goto :goto_0

    .line 542
    :cond_2
    const v0, 0x7f0d0007

    goto :goto_0
.end method

.method private static getIconBackgroundResIdForTickersLollipop(Lcom/mobnetic/coinguardian/model/Ticker;Lcom/mobnetic/coinguardian/model/Ticker;)I
    .locals 4
    .param p0, "previousCheckTicker"    # Lcom/mobnetic/coinguardian/model/Ticker;
    .param p1, "lastCheckTicker"    # Lcom/mobnetic/coinguardian/model/Ticker;

    .prologue
    .line 528
    if-eqz p0, :cond_0

    if-eqz p1, :cond_0

    iget-wide v0, p0, Lcom/mobnetic/coinguardian/model/Ticker;->last:D

    iget-wide v2, p1, Lcom/mobnetic/coinguardian/model/Ticker;->last:D

    cmpl-double v0, v0, v2

    if-nez v0, :cond_1

    .line 529
    :cond_0
    const v0, 0x7f020063

    .line 533
    :goto_0
    return v0

    .line 530
    :cond_1
    iget-wide v0, p1, Lcom/mobnetic/coinguardian/model/Ticker;->last:D

    iget-wide v2, p0, Lcom/mobnetic/coinguardian/model/Ticker;->last:D

    cmpl-double v0, v0, v2

    if-lez v0, :cond_2

    .line 531
    const v0, 0x7f020064

    goto :goto_0

    .line 533
    :cond_2
    const v0, 0x7f020065

    goto :goto_0
.end method

.method private static getIconResIdForNotification(Lcom/mobnetic/coinguardian/model/Ticker;Lcom/mobnetic/coinguardian/model/Ticker;)I
    .locals 6
    .param p0, "previousCheckTicker"    # Lcom/mobnetic/coinguardian/model/Ticker;
    .param p1, "lastCheckTicker"    # Lcom/mobnetic/coinguardian/model/Ticker;

    .prologue
    .line 518
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x15

    if-lt v1, v2, :cond_1

    const/4 v0, 0x1

    .line 519
    .local v0, "isLollipop":Z
    :goto_0
    if-eqz p0, :cond_0

    if-eqz p1, :cond_0

    iget-wide v2, p0, Lcom/mobnetic/coinguardian/model/Ticker;->last:D

    iget-wide v4, p1, Lcom/mobnetic/coinguardian/model/Ticker;->last:D

    cmpl-double v1, v2, v4

    if-nez v1, :cond_3

    .line 520
    :cond_0
    if-eqz v0, :cond_2

    const v1, 0x7f020089

    .line 524
    :goto_1
    return v1

    .line 518
    .end local v0    # "isLollipop":Z
    :cond_1
    const/4 v0, 0x0

    goto :goto_0

    .line 520
    .restart local v0    # "isLollipop":Z
    :cond_2
    const v1, 0x7f020087

    goto :goto_1

    .line 521
    :cond_3
    iget-wide v2, p1, Lcom/mobnetic/coinguardian/model/Ticker;->last:D

    iget-wide v4, p0, Lcom/mobnetic/coinguardian/model/Ticker;->last:D

    cmpl-double v1, v2, v4

    if-lez v1, :cond_5

    .line 522
    if-eqz v0, :cond_4

    const v1, 0x7f02008b

    goto :goto_1

    :cond_4
    const v1, 0x7f02008a

    goto :goto_1

    .line 524
    :cond_5
    if-eqz v0, :cond_6

    const v1, 0x7f020084

    goto :goto_1

    :cond_6
    const v1, 0x7f020083

    goto :goto_1
.end method

.method public static getIconResIdForTickers(Lcom/mobnetic/coinguardian/model/Ticker;Lcom/mobnetic/coinguardian/model/Ticker;Z)I
    .locals 4
    .param p0, "previousCheckTicker"    # Lcom/mobnetic/coinguardian/model/Ticker;
    .param p1, "lastCheckTicker"    # Lcom/mobnetic/coinguardian/model/Ticker;
    .param p2, "useGrayRightIcon"    # Z

    .prologue
    .line 509
    if-eqz p0, :cond_0

    if-eqz p1, :cond_0

    iget-wide v0, p0, Lcom/mobnetic/coinguardian/model/Ticker;->last:D

    iget-wide v2, p1, Lcom/mobnetic/coinguardian/model/Ticker;->last:D

    cmpl-double v0, v0, v2

    if-nez v0, :cond_2

    .line 510
    :cond_0
    if-eqz p2, :cond_1

    const v0, 0x7f020088

    .line 514
    :goto_0
    return v0

    .line 510
    :cond_1
    const v0, 0x7f020087

    goto :goto_0

    .line 511
    :cond_2
    iget-wide v0, p1, Lcom/mobnetic/coinguardian/model/Ticker;->last:D

    iget-wide v2, p0, Lcom/mobnetic/coinguardian/model/Ticker;->last:D

    cmpl-double v0, v0, v2

    if-lez v0, :cond_3

    .line 512
    const v0, 0x7f02008a

    goto :goto_0

    .line 514
    :cond_3
    const v0, 0x7f020083

    goto :goto_0
.end method

.method public static refreshOngoingNotifications(Landroid/content/Context;)V
    .locals 7
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const/4 v6, 0x1

    .line 200
    invoke-static {}, Lcom/robotoworks/mechanoid/db/SQuery;->newQuery()Lcom/robotoworks/mechanoid/db/SQuery;

    move-result-object v2

    const-string v3, "enabled"

    const-string v4, " = "

    .line 201
    invoke-virtual {v2, v3, v4, v6}, Lcom/robotoworks/mechanoid/db/SQuery;->expr(Ljava/lang/String;Ljava/lang/String;Z)Lcom/robotoworks/mechanoid/db/SQuery;

    move-result-object v2

    .line 202
    invoke-virtual {v2}, Lcom/robotoworks/mechanoid/db/SQuery;->and()Lcom/robotoworks/mechanoid/db/SQuery;

    move-result-object v2

    const-string v3, "notificationPriority"

    const-string v4, " >= "

    const/4 v5, -0x2

    .line 203
    invoke-virtual {v2, v3, v4, v5}, Lcom/robotoworks/mechanoid/db/SQuery;->expr(Ljava/lang/String;Ljava/lang/String;I)Lcom/robotoworks/mechanoid/db/SQuery;

    move-result-object v2

    sget-object v3, Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker;->CONTENT_URI:Landroid/net/Uri;

    .line 204
    invoke-virtual {v2, v3}, Lcom/robotoworks/mechanoid/db/SQuery;->select(Landroid/net/Uri;)Ljava/util/List;

    move-result-object v1

    .line 205
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

    .line 206
    .local v0, "checkerRecord":Lcom/mobnetic/coinguardian/db/content/CheckerRecord;
    invoke-static {p0, v0, v6}, Lcom/mobnetic/coinguardian/util/NotificationUtils;->showOngoingNotification(Landroid/content/Context;Lcom/mobnetic/coinguardian/db/content/CheckerRecord;Z)V

    goto :goto_0

    .line 208
    .end local v0    # "checkerRecord":Lcom/mobnetic/coinguardian/db/content/CheckerRecord;
    :cond_0
    return-void
.end method

.method public static showOngoingNotification(Landroid/content/Context;Lcom/mobnetic/coinguardian/db/content/CheckerRecord;Z)V
    .locals 36
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "checkerRecord"    # Lcom/mobnetic/coinguardian/db/content/CheckerRecord;
    .param p2, "doNotSpeakTTS"    # Z
    .annotation build Landroid/annotation/TargetApi;
        value = 0x10
    .end annotation

    .prologue
    .line 44
    invoke-static/range {p0 .. p0}, Landroid/support/v4/app/NotificationManagerCompat;->from(Landroid/content/Context;)Landroid/support/v4/app/NotificationManagerCompat;

    move-result-object v19

    .line 45
    .local v19, "notificationManager":Landroid/support/v4/app/NotificationManagerCompat;
    if-nez p1, :cond_1

    .line 197
    :cond_0
    :goto_0
    return-void

    .line 48
    :cond_1
    invoke-virtual/range {p1 .. p1}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getEnabled()Z

    move-result v5

    if-nez v5, :cond_2

    .line 49
    const-string v5, "checker"

    invoke-virtual/range {p1 .. p1}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getId()J

    move-result-wide v6

    long-to-int v6, v6

    move-object/from16 v0, v19

    invoke-virtual {v0, v5, v6}, Landroid/support/v4/app/NotificationManagerCompat;->cancel(Ljava/lang/String;I)V

    goto :goto_0

    .line 53
    :cond_2
    invoke-virtual/range {p1 .. p1}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getMarketKey()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/mobnetic/coinguardian/util/MarketsConfigUtils;->getMarketByKey(Ljava/lang/String;)Lcom/mobnetic/coinguardian/model/Market;

    move-result-object v10

    .line 54
    .local v10, "market":Lcom/mobnetic/coinguardian/model/Market;
    invoke-virtual/range {p1 .. p1}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getLastCheckTicker()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/mobnetic/coinguardian/util/TickerUtils;->fromJson(Ljava/lang/String;)Lcom/mobnetic/coinguardian/model/Ticker;

    move-result-object v18

    .line 55
    .local v18, "lastCheckTicker":Lcom/mobnetic/coinguardian/model/Ticker;
    if-eqz v10, :cond_0

    if-nez v18, :cond_3

    invoke-virtual/range {p1 .. p1}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getErrorMsg()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_0

    .line 58
    :cond_3
    const/16 v20, 0x0

    .line 59
    .local v20, "previousCheckTicker":Lcom/mobnetic/coinguardian/model/Ticker;
    invoke-virtual/range {p1 .. p1}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getCurrencySrc()Ljava/lang/String;

    move-result-object v5

    invoke-virtual/range {p1 .. p1}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getContractType()J

    move-result-wide v6

    long-to-int v6, v6

    invoke-static {v5, v10, v6}, Lcom/mobnetic/coinguardian/util/FormatUtils;->getCurrencySrcWithContractType(Ljava/lang/String;Lcom/mobnetic/coinguardian/model/Market;I)Ljava/lang/String;

    move-result-object v15

    .line 60
    .local v15, "currencySrcWithContractType":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getCurrencyDst()Ljava/lang/String;

    move-result-object v14

    .line 61
    .local v14, "currencyDst":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getCurrencySubunitDst()J

    move-result-wide v6

    invoke-static {v14, v6, v7}, Lcom/mobnetic/coinguardian/util/CurrencyUtils;->getCurrencySubunit(Ljava/lang/String;J)Lcom/mobnetic/coinguardian/model/CurrencySubunit;

    move-result-object v9

    .line 62
    .local v9, "subunitDst":Lcom/mobnetic/coinguardian/model/CurrencySubunit;
    invoke-virtual/range {p1 .. p1}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getNotificationPriority()J

    move-result-wide v6

    const-wide/16 v34, -0x2

    cmp-long v5, v6, v34

    if-ltz v5, :cond_14

    .line 70
    invoke-virtual/range {p1 .. p1}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getErrorMsg()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_8

    .line 71
    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-static {v5, v6}, Lcom/mobnetic/coinguardian/util/NotificationUtils;->getIconResIdForNotification(Lcom/mobnetic/coinguardian/model/Ticker;Lcom/mobnetic/coinguardian/model/Ticker;)I

    move-result v17

    .line 72
    .local v17, "iconResId":I
    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-static {v5, v6}, Lcom/mobnetic/coinguardian/util/NotificationUtils;->getIconBackgroundResIdForTickersLollipop(Lcom/mobnetic/coinguardian/model/Ticker;Lcom/mobnetic/coinguardian/model/Ticker;)I

    move-result v16

    .line 73
    .local v16, "iconBackgroundResId":I
    invoke-virtual/range {p1 .. p1}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getLastCheckDate()J

    move-result-wide v30

    .line 74
    .local v30, "timestamp":J
    const v5, 0x7f070096

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    const v8, 0x7f07006e

    const/16 v33, 0x2

    move/from16 v0, v33

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v33, v0

    const/16 v34, 0x0

    aput-object v15, v33, v34

    const/16 v34, 0x1

    aput-object v14, v33, v34

    .line 75
    move-object/from16 v0, p0

    move-object/from16 v1, v33

    invoke-virtual {v0, v8, v1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    const/4 v7, 0x1

    iget-object v8, v10, Lcom/mobnetic/coinguardian/model/Market;->name:Ljava/lang/String;

    aput-object v8, v6, v7

    .line 74
    move-object/from16 v0, p0

    invoke-virtual {v0, v5, v6}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v29

    .line 77
    .local v29, "title":Ljava/lang/CharSequence;
    const v5, 0x7f070010

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    invoke-virtual/range {p1 .. p1}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getErrorMsg()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    move-object/from16 v0, p0

    invoke-virtual {v0, v5, v6}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v28

    .line 78
    .local v28, "tickerMsg":Ljava/lang/CharSequence;
    move-object/from16 v13, v28

    .line 79
    .local v13, "contentText":Ljava/lang/CharSequence;
    move-object v4, v13

    .line 143
    .local v4, "bigStyleContentText":Ljava/lang/CharSequence;
    :goto_1
    new-instance v5, Landroid/support/v4/app/NotificationCompat$Builder;

    move-object/from16 v0, p0

    invoke-direct {v5, v0}, Landroid/support/v4/app/NotificationCompat$Builder;-><init>(Landroid/content/Context;)V

    .line 144
    move/from16 v0, v17

    invoke-virtual {v5, v0}, Landroid/support/v4/app/NotificationCompat$Builder;->setSmallIcon(I)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v5

    .line 145
    move-object/from16 v0, v29

    invoke-virtual {v5, v0}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v5

    .line 146
    invoke-virtual {v5, v13}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v5

    const/4 v6, 0x1

    .line 147
    invoke-virtual {v5, v6}, Landroid/support/v4/app/NotificationCompat$Builder;->setOngoing(Z)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v5

    const/4 v6, 0x1

    .line 148
    invoke-virtual {v5, v6}, Landroid/support/v4/app/NotificationCompat$Builder;->setOnlyAlertOnce(Z)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v5

    .line 149
    move-wide/from16 v0, v30

    invoke-virtual {v5, v0, v1}, Landroid/support/v4/app/NotificationCompat$Builder;->setWhen(J)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v5

    const/4 v6, -0x2

    .line 150
    invoke-virtual {v5, v6}, Landroid/support/v4/app/NotificationCompat$Builder;->setPriority(I)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v5

    .line 151
    invoke-static/range {p0 .. p0}, Lcom/mobnetic/coinguardian/util/NotificationUtils;->createMainActivityPendingIntent(Landroid/content/Context;)Landroid/app/PendingIntent;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v12

    .line 153
    .local v12, "builder":Landroid/support/v4/app/NotificationCompat$Builder;
    invoke-static/range {p0 .. p0}, Lcom/mobnetic/coinguardian/util/PreferencesUtils;->getCheckNotificationTicker(Landroid/content/Context;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 154
    move-object/from16 v0, v28

    invoke-virtual {v12, v0}, Landroid/support/v4/app/NotificationCompat$Builder;->setTicker(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 156
    :cond_4
    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v6, 0xe

    if-lt v5, v6, :cond_6

    invoke-static/range {p0 .. p0}, Lcom/mobnetic/coinguardian/util/PreferencesUtils;->getCheckNotificationCustomLayout(Landroid/content/Context;)Z

    move-result v5

    if-eqz v5, :cond_6

    .line 157
    new-instance v23, Landroid/widget/RemoteViews;

    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v5

    const v6, 0x7f030027

    move-object/from16 v0, v23

    invoke-direct {v0, v5, v6}, Landroid/widget/RemoteViews;-><init>(Ljava/lang/String;I)V

    .line 158
    .local v23, "remoteViews":Landroid/widget/RemoteViews;
    const v5, 0x7f0e008a

    move-object/from16 v0, v23

    move/from16 v1, v17

    invoke-virtual {v0, v5, v1}, Landroid/widget/RemoteViews;->setImageViewResource(II)V

    .line 159
    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v6, 0x15

    if-lt v5, v6, :cond_5

    .line 160
    const v5, 0x7f0e008a

    const-string v6, "setBackgroundResource"

    move-object/from16 v0, v23

    move/from16 v1, v16

    invoke-virtual {v0, v5, v6, v1}, Landroid/widget/RemoteViews;->setInt(ILjava/lang/String;I)V

    .line 161
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    move-object/from16 v0, v20

    move-object/from16 v1, v18

    invoke-static {v0, v1}, Lcom/mobnetic/coinguardian/util/NotificationUtils;->getIconBackgroundColorResIdForTickersLollipop(Lcom/mobnetic/coinguardian/model/Ticker;Lcom/mobnetic/coinguardian/model/Ticker;)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getColor(I)I

    move-result v5

    invoke-virtual {v12, v5}, Landroid/support/v4/app/NotificationCompat$Builder;->setColor(I)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 164
    :cond_5
    const v5, 0x7f0e008b

    move-object/from16 v0, v23

    move-object/from16 v1, v29

    invoke-virtual {v0, v5, v1}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    .line 165
    const v5, 0x7f0e008c

    move-object/from16 v0, v23

    invoke-virtual {v0, v5, v13}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    .line 166
    new-instance v21, Landroid/content/Intent;

    const-string v5, "com.mobnetic.coinguardian.receiver.action.notification_refresh"

    const/4 v6, 0x0

    const-class v7, Lcom/mobnetic/coinguardian/receiver/NotificationAndWidgetReceiver;

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    invoke-direct {v0, v5, v6, v1, v7}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;Landroid/content/Context;Ljava/lang/Class;)V

    .line 167
    .local v21, "refreshIntent":Landroid/content/Intent;
    const-string v5, "checker_record_id"

    invoke-virtual/range {p1 .. p1}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getId()J

    move-result-wide v6

    move-object/from16 v0, v21

    invoke-virtual {v0, v5, v6, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 168
    invoke-virtual/range {p1 .. p1}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getId()J

    move-result-wide v6

    long-to-int v5, v6

    const/high16 v6, 0x8000000

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-static {v0, v5, v1, v6}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v22

    .line 169
    .local v22, "refreshPendingIntent":Landroid/app/PendingIntent;
    const v5, 0x7f0e008d

    move-object/from16 v0, v23

    move-object/from16 v1, v22

    invoke-virtual {v0, v5, v1}, Landroid/widget/RemoteViews;->setOnClickPendingIntent(ILandroid/app/PendingIntent;)V

    .line 170
    move-object/from16 v0, v23

    invoke-virtual {v12, v0}, Landroid/support/v4/app/NotificationCompat$Builder;->setContent(Landroid/widget/RemoteViews;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 173
    .end local v21    # "refreshIntent":Landroid/content/Intent;
    .end local v22    # "refreshPendingIntent":Landroid/app/PendingIntent;
    .end local v23    # "remoteViews":Landroid/widget/RemoteViews;
    :cond_6
    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v6, 0x10

    if-lt v5, v6, :cond_7

    invoke-static/range {p0 .. p0}, Lcom/mobnetic/coinguardian/util/PreferencesUtils;->getCheckNotificationExpandable(Landroid/content/Context;)Z

    move-result v5

    if-eqz v5, :cond_7

    .line 174
    new-instance v11, Landroid/support/v4/app/NotificationCompat$BigTextStyle;

    invoke-direct {v11}, Landroid/support/v4/app/NotificationCompat$BigTextStyle;-><init>()V

    .line 175
    .local v11, "bigTextStyle":Landroid/support/v4/app/NotificationCompat$BigTextStyle;
    move-object/from16 v0, v29

    invoke-virtual {v11, v0}, Landroid/support/v4/app/NotificationCompat$BigTextStyle;->setBigContentTitle(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$BigTextStyle;

    .line 176
    invoke-virtual {v11, v4}, Landroid/support/v4/app/NotificationCompat$BigTextStyle;->bigText(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$BigTextStyle;

    .line 177
    invoke-virtual {v12, v11}, Landroid/support/v4/app/NotificationCompat$Builder;->setStyle(Landroid/support/v4/app/NotificationCompat$Style;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 179
    const v5, 0x7f020085

    const v6, 0x7f070070

    move-object/from16 v0, p0

    invoke-virtual {v0, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-static/range {p0 .. p1}, Lcom/mobnetic/coinguardian/util/NotificationUtils;->createCheckerDetailsPendingIntent(Landroid/content/Context;Lcom/mobnetic/coinguardian/db/content/CheckerRecord;)Landroid/app/PendingIntent;

    move-result-object v7

    invoke-virtual {v12, v5, v6, v7}, Landroid/support/v4/app/NotificationCompat$Builder;->addAction(ILjava/lang/CharSequence;Landroid/app/PendingIntent;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 180
    new-instance v21, Landroid/content/Intent;

    const-string v5, "com.mobnetic.coinguardian.receiver.action.notification_refresh"

    const/4 v6, 0x0

    const-class v7, Lcom/mobnetic/coinguardian/receiver/NotificationAndWidgetReceiver;

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    invoke-direct {v0, v5, v6, v1, v7}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;Landroid/content/Context;Ljava/lang/Class;)V

    .line 181
    .restart local v21    # "refreshIntent":Landroid/content/Intent;
    const-string v5, "checker_record_id"

    invoke-virtual/range {p1 .. p1}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getId()J

    move-result-wide v6

    move-object/from16 v0, v21

    invoke-virtual {v0, v5, v6, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 182
    invoke-virtual/range {p1 .. p1}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getId()J

    move-result-wide v6

    long-to-int v5, v6

    const/high16 v6, 0x8000000

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-static {v0, v5, v1, v6}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v22

    .line 183
    .restart local v22    # "refreshPendingIntent":Landroid/app/PendingIntent;
    const v5, 0x7f020086

    const v6, 0x7f070074

    move-object/from16 v0, p0

    invoke-virtual {v0, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    move-object/from16 v0, v22

    invoke-virtual {v12, v5, v6, v0}, Landroid/support/v4/app/NotificationCompat$Builder;->addAction(ILjava/lang/CharSequence;Landroid/app/PendingIntent;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 188
    .end local v11    # "bigTextStyle":Landroid/support/v4/app/NotificationCompat$BigTextStyle;
    .end local v21    # "refreshIntent":Landroid/content/Intent;
    .end local v22    # "refreshPendingIntent":Landroid/app/PendingIntent;
    :cond_7
    const-string v5, "checker"

    invoke-virtual/range {p1 .. p1}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getId()J

    move-result-wide v6

    long-to-int v6, v6

    invoke-virtual {v12}, Landroid/support/v4/app/NotificationCompat$Builder;->build()Landroid/app/Notification;

    move-result-object v7

    move-object/from16 v0, v19

    invoke-virtual {v0, v5, v6, v7}, Landroid/support/v4/app/NotificationManagerCompat;->notify(Ljava/lang/String;ILandroid/app/Notification;)V

    .line 193
    .end local v4    # "bigStyleContentText":Ljava/lang/CharSequence;
    .end local v12    # "builder":Landroid/support/v4/app/NotificationCompat$Builder;
    .end local v13    # "contentText":Ljava/lang/CharSequence;
    .end local v16    # "iconBackgroundResId":I
    .end local v17    # "iconResId":I
    .end local v28    # "tickerMsg":Ljava/lang/CharSequence;
    .end local v29    # "title":Ljava/lang/CharSequence;
    .end local v30    # "timestamp":J
    :goto_2
    if-nez p2, :cond_0

    invoke-virtual/range {p1 .. p1}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getTtsEnabled()Z

    move-result v5

    if-eqz v5, :cond_0

    if-eqz v18, :cond_0

    invoke-virtual/range {p1 .. p1}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getErrorMsg()Ljava/lang/String;

    move-result-object v5

    if-nez v5, :cond_0

    .line 194
    move-object/from16 v0, v18

    iget-wide v6, v0, Lcom/mobnetic/coinguardian/model/Ticker;->last:D

    move-object/from16 v5, p0

    move-object/from16 v8, p1

    invoke-static/range {v5 .. v10}, Lcom/mobnetic/coinguardian/util/FormatUtils;->formatTextForTTS(Landroid/content/Context;DLcom/mobnetic/coinguardian/db/content/CheckerRecord;Lcom/mobnetic/coinguardian/model/CurrencySubunit;Lcom/mobnetic/coinguardian/model/Market;)Ljava/lang/String;

    move-result-object v32

    .line 195
    .local v32, "ttsString":Ljava/lang/String;
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    move-object/from16 v0, v32

    invoke-static {v5, v0}, Lcom/mobnetic/coinguardian/util/TTSHelper;->speak(Landroid/content/Context;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 80
    .end local v32    # "ttsString":Ljava/lang/String;
    :cond_8
    if-eqz v18, :cond_0

    .line 81
    invoke-virtual/range {p1 .. p1}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getPreviousCheckTicker()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/mobnetic/coinguardian/util/TickerUtils;->fromJson(Ljava/lang/String;)Lcom/mobnetic/coinguardian/model/Ticker;

    move-result-object v20

    .line 82
    move-object/from16 v0, v20

    move-object/from16 v1, v18

    invoke-static {v0, v1}, Lcom/mobnetic/coinguardian/util/NotificationUtils;->getIconResIdForNotification(Lcom/mobnetic/coinguardian/model/Ticker;Lcom/mobnetic/coinguardian/model/Ticker;)I

    move-result v17

    .line 83
    .restart local v17    # "iconResId":I
    move-object/from16 v0, v20

    move-object/from16 v1, v18

    invoke-static {v0, v1}, Lcom/mobnetic/coinguardian/util/NotificationUtils;->getIconBackgroundResIdForTickersLollipop(Lcom/mobnetic/coinguardian/model/Ticker;Lcom/mobnetic/coinguardian/model/Ticker;)I

    move-result v16

    .line 84
    .restart local v16    # "iconBackgroundResId":I
    move-object/from16 v0, v18

    iget-wide v0, v0, Lcom/mobnetic/coinguardian/model/Ticker;->timestamp:J

    move-wide/from16 v30, v0

    .line 85
    .restart local v30    # "timestamp":J
    const v5, 0x7f070095

    const/4 v6, 0x3

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object v15, v6, v7

    const/4 v7, 0x1

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v33, "<b>"

    move-object/from16 v0, v33

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    move-object/from16 v0, v18

    iget-wide v0, v0, Lcom/mobnetic/coinguardian/model/Ticker;->last:D

    move-wide/from16 v34, v0

    .line 87
    move-wide/from16 v0, v34

    invoke-static {v0, v1, v9}, Lcom/mobnetic/coinguardian/util/FormatUtils;->formatPriceWithCurrency(DLcom/mobnetic/coinguardian/model/CurrencySubunit;)Ljava/lang/String;

    move-result-object v33

    move-object/from16 v0, v33

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v33, "</b>"

    move-object/from16 v0, v33

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    const/4 v7, 0x2

    iget-object v8, v10, Lcom/mobnetic/coinguardian/model/Market;->name:Ljava/lang/String;

    aput-object v8, v6, v7

    .line 85
    move-object/from16 v0, p0

    invoke-virtual {v0, v5, v6}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v29

    .line 89
    .restart local v29    # "title":Ljava/lang/CharSequence;
    move-object/from16 v28, v29

    .line 91
    .restart local v28    # "tickerMsg":Ljava/lang/CharSequence;
    const/16 v25, 0x0

    .line 92
    .local v25, "textLine1":Landroid/text/Spanned;
    move-object/from16 v0, v18

    iget-wide v6, v0, Lcom/mobnetic/coinguardian/model/Ticker;->high:D

    const-wide/16 v34, 0x0

    cmpl-double v5, v6, v34

    if-ltz v5, :cond_9

    move-object/from16 v0, v18

    iget-wide v6, v0, Lcom/mobnetic/coinguardian/model/Ticker;->low:D

    const-wide/16 v34, 0x0

    cmpl-double v5, v6, v34

    if-ltz v5, :cond_9

    .line 93
    const v5, 0x7f07008f

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v33, "<b>"

    move-object/from16 v0, v33

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    move-object/from16 v0, v18

    iget-wide v0, v0, Lcom/mobnetic/coinguardian/model/Ticker;->high:D

    move-wide/from16 v34, v0

    .line 94
    move-wide/from16 v0, v34

    invoke-static {v0, v1, v9}, Lcom/mobnetic/coinguardian/util/FormatUtils;->formatPriceWithCurrency(DLcom/mobnetic/coinguardian/model/CurrencySubunit;)Ljava/lang/String;

    move-result-object v33

    move-object/from16 v0, v33

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v33, "</b>"

    move-object/from16 v0, v33

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    const/4 v7, 0x1

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v33, "<b>"

    move-object/from16 v0, v33

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    move-object/from16 v0, v18

    iget-wide v0, v0, Lcom/mobnetic/coinguardian/model/Ticker;->low:D

    move-wide/from16 v34, v0

    .line 95
    move-wide/from16 v0, v34

    invoke-static {v0, v1, v9}, Lcom/mobnetic/coinguardian/util/FormatUtils;->formatPriceWithCurrency(DLcom/mobnetic/coinguardian/model/CurrencySubunit;)Ljava/lang/String;

    move-result-object v33

    move-object/from16 v0, v33

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v33, "</b>"

    move-object/from16 v0, v33

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    .line 93
    move-object/from16 v0, p0

    invoke-virtual {v0, v5, v6}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v25

    .line 97
    :cond_9
    new-instance v26, Landroid/text/SpannableStringBuilder;

    invoke-direct/range {v26 .. v26}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 98
    .local v26, "textLine2":Landroid/text/SpannableStringBuilder;
    move-object/from16 v0, v18

    iget-wide v6, v0, Lcom/mobnetic/coinguardian/model/Ticker;->bid:D

    const-wide/16 v34, 0x0

    cmpl-double v5, v6, v34

    if-ltz v5, :cond_a

    .line 99
    const v5, 0x7f070091

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v33, "<b>"

    move-object/from16 v0, v33

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    move-object/from16 v0, v18

    iget-wide v0, v0, Lcom/mobnetic/coinguardian/model/Ticker;->bid:D

    move-wide/from16 v34, v0

    .line 100
    move-wide/from16 v0, v34

    invoke-static {v0, v1, v9}, Lcom/mobnetic/coinguardian/util/FormatUtils;->formatPriceWithCurrency(DLcom/mobnetic/coinguardian/model/CurrencySubunit;)Ljava/lang/String;

    move-result-object v33

    move-object/from16 v0, v33

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v33, "</b>"

    move-object/from16 v0, v33

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    .line 99
    move-object/from16 v0, p0

    invoke-virtual {v0, v5, v6}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v5

    move-object/from16 v0, v26

    invoke-virtual {v0, v5}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 102
    :cond_a
    move-object/from16 v0, v18

    iget-wide v6, v0, Lcom/mobnetic/coinguardian/model/Ticker;->ask:D

    const-wide/16 v34, 0x0

    cmpl-double v5, v6, v34

    if-ltz v5, :cond_c

    .line 103
    invoke-virtual/range {v26 .. v26}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v5

    if-lez v5, :cond_b

    .line 104
    const v5, 0x7f070093

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v26

    invoke-virtual {v0, v5}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 105
    :cond_b
    const v5, 0x7f070090

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v33, "<b>"

    move-object/from16 v0, v33

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    move-object/from16 v0, v18

    iget-wide v0, v0, Lcom/mobnetic/coinguardian/model/Ticker;->ask:D

    move-wide/from16 v34, v0

    .line 106
    move-wide/from16 v0, v34

    invoke-static {v0, v1, v9}, Lcom/mobnetic/coinguardian/util/FormatUtils;->formatPriceWithCurrency(DLcom/mobnetic/coinguardian/model/CurrencySubunit;)Ljava/lang/String;

    move-result-object v33

    move-object/from16 v0, v33

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v33, "</b>"

    move-object/from16 v0, v33

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    .line 105
    move-object/from16 v0, p0

    invoke-virtual {v0, v5, v6}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v5

    move-object/from16 v0, v26

    invoke-virtual {v0, v5}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 108
    :cond_c
    const/16 v27, 0x0

    .line 109
    .local v27, "textLine3":Landroid/text/Spanned;
    move-object/from16 v0, v18

    iget-wide v6, v0, Lcom/mobnetic/coinguardian/model/Ticker;->vol:D

    const-wide/16 v34, 0x0

    cmpl-double v5, v6, v34

    if-ltz v5, :cond_d

    .line 110
    const v5, 0x7f070094

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v33, "<b>"

    move-object/from16 v0, v33

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    move-object/from16 v0, v18

    iget-wide v0, v0, Lcom/mobnetic/coinguardian/model/Ticker;->vol:D

    move-wide/from16 v34, v0

    .line 111
    invoke-virtual/range {p1 .. p1}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getCurrencySrc()Ljava/lang/String;

    move-result-object v33

    move-wide/from16 v0, v34

    move-object/from16 v2, v33

    invoke-static {v0, v1, v2}, Lcom/mobnetic/coinguardian/util/FormatUtils;->formatPriceWithCurrency(DLjava/lang/String;)Ljava/lang/String;

    move-result-object v33

    move-object/from16 v0, v33

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v33, "</b>"

    move-object/from16 v0, v33

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    .line 110
    move-object/from16 v0, p0

    invoke-virtual {v0, v5, v6}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v27

    .line 114
    :cond_d
    const-string v13, ""

    .line 115
    .restart local v13    # "contentText":Ljava/lang/CharSequence;
    new-instance v24, Landroid/text/SpannableStringBuilder;

    invoke-direct/range {v24 .. v24}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 116
    .local v24, "ssb":Landroid/text/SpannableStringBuilder;
    if-eqz v25, :cond_e

    invoke-interface/range {v25 .. v25}, Landroid/text/Spanned;->length()I

    move-result v5

    if-lez v5, :cond_e

    .line 117
    move-object/from16 v13, v25

    .line 118
    invoke-virtual/range {v24 .. v25}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 120
    :cond_e
    if-eqz v26, :cond_f

    invoke-virtual/range {v26 .. v26}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v5

    if-lez v5, :cond_f

    .line 121
    invoke-virtual/range {v24 .. v24}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v5

    if-lez v5, :cond_12

    .line 122
    const-string v5, "\n"

    move-object/from16 v0, v24

    invoke-virtual {v0, v5}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 125
    :goto_3
    move-object/from16 v0, v24

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 127
    :cond_f
    if-eqz v27, :cond_10

    invoke-interface/range {v27 .. v27}, Landroid/text/Spanned;->length()I

    move-result v5

    if-lez v5, :cond_10

    .line 128
    invoke-virtual/range {v24 .. v24}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v5

    if-lez v5, :cond_13

    .line 129
    const-string v5, "\n"

    move-object/from16 v0, v24

    invoke-virtual {v0, v5}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 132
    :goto_4
    move-object/from16 v0, v24

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 134
    :cond_10
    invoke-static/range {v24 .. v24}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_11

    .line 135
    new-instance v13, Landroid/text/SpannedString;

    .end local v13    # "contentText":Ljava/lang/CharSequence;
    const v5, 0x7f070092

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v13, v5}, Landroid/text/SpannedString;-><init>(Ljava/lang/CharSequence;)V

    .line 136
    .restart local v13    # "contentText":Ljava/lang/CharSequence;
    move-object/from16 v0, v24

    invoke-virtual {v0, v13}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 138
    :cond_11
    move-object/from16 v4, v24

    .line 139
    .restart local v4    # "bigStyleContentText":Ljava/lang/CharSequence;
    goto/16 :goto_1

    .line 124
    .end local v4    # "bigStyleContentText":Ljava/lang/CharSequence;
    :cond_12
    move-object/from16 v13, v26

    goto :goto_3

    .line 131
    :cond_13
    move-object/from16 v13, v27

    goto :goto_4

    .line 190
    .end local v13    # "contentText":Ljava/lang/CharSequence;
    .end local v16    # "iconBackgroundResId":I
    .end local v17    # "iconResId":I
    .end local v24    # "ssb":Landroid/text/SpannableStringBuilder;
    .end local v25    # "textLine1":Landroid/text/Spanned;
    .end local v26    # "textLine2":Landroid/text/SpannableStringBuilder;
    .end local v27    # "textLine3":Landroid/text/Spanned;
    .end local v28    # "tickerMsg":Ljava/lang/CharSequence;
    .end local v29    # "title":Ljava/lang/CharSequence;
    .end local v30    # "timestamp":J
    :cond_14
    const-string v5, "checker"

    invoke-virtual/range {p1 .. p1}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getId()J

    move-result-wide v6

    long-to-int v6, v6

    move-object/from16 v0, v19

    invoke-virtual {v0, v5, v6}, Landroid/support/v4/app/NotificationManagerCompat;->cancel(Ljava/lang/String;I)V

    goto/16 :goto_2
.end method
