.class public Lcom/mobnetic/coinguardian/appwidget/ListProvider;
.super Ljava/lang/Object;
.source "ListProvider.java"

# interfaces
.implements Landroid/widget/RemoteViewsService$RemoteViewsFactory;


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0xb
.end annotation


# instance fields
.field private appWidgetId:I

.field private context:Landroid/content/Context;

.field private items:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/mobnetic/coinguardian/db/content/CheckerRecord;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mobnetic/coinguardian/appwidget/ListProvider;->context:Landroid/content/Context;

    .line 37
    iput-object p1, p0, Lcom/mobnetic/coinguardian/appwidget/ListProvider;->context:Landroid/content/Context;

    .line 38
    const-string v0, "appWidgetId"

    const/4 v1, 0x0

    invoke-virtual {p2, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/mobnetic/coinguardian/appwidget/ListProvider;->appWidgetId:I

    .line 39
    return-void
.end method

.method private refreshItems()V
    .locals 4

    .prologue
    .line 46
    invoke-static {}, Lcom/robotoworks/mechanoid/db/SQuery;->newQuery()Lcom/robotoworks/mechanoid/db/SQuery;

    move-result-object v0

    const-string v1, "enabled"

    const-string v2, " = "

    const/4 v3, 0x1

    invoke-virtual {v0, v1, v2, v3}, Lcom/robotoworks/mechanoid/db/SQuery;->expr(Ljava/lang/String;Ljava/lang/String;Z)Lcom/robotoworks/mechanoid/db/SQuery;

    move-result-object v0

    sget-object v1, Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker;->CONTENT_URI:Landroid/net/Uri;

    iget-object v2, p0, Lcom/mobnetic/coinguardian/appwidget/ListProvider;->context:Landroid/content/Context;

    invoke-static {v2}, Lcom/mobnetic/coinguardian/fragment/CheckersListFragment;->getSortOrderString(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/robotoworks/mechanoid/db/SQuery;->select(Landroid/net/Uri;Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/mobnetic/coinguardian/appwidget/ListProvider;->items:Ljava/util/List;

    .line 47
    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .prologue
    .line 120
    iget-object v0, p0, Lcom/mobnetic/coinguardian/appwidget/ListProvider;->items:Ljava/util/List;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mobnetic/coinguardian/appwidget/ListProvider;->items:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getItemId(I)J
    .locals 4
    .param p1, "position"    # I

    .prologue
    .line 141
    iget-object v1, p0, Lcom/mobnetic/coinguardian/appwidget/ListProvider;->items:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    .line 142
    .local v0, "item":Lcom/mobnetic/coinguardian/db/content/CheckerRecord;
    if-eqz v0, :cond_0

    .line 143
    invoke-virtual {v0}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getId()J

    move-result-wide v2

    .line 144
    :goto_0
    return-wide v2

    :cond_0
    int-to-long v2, p1

    goto :goto_0
.end method

.method public getLoadingView()Landroid/widget/RemoteViews;
    .locals 1

    .prologue
    .line 125
    const/4 v0, 0x0

    return-object v0
.end method

.method public getViewAt(I)Landroid/widget/RemoteViews;
    .locals 24
    .param p1, "position"    # I

    .prologue
    .line 56
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mobnetic/coinguardian/appwidget/ListProvider;->context:Landroid/content/Context;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/mobnetic/coinguardian/appwidget/ListProvider;->appWidgetId:I

    move/from16 v20, v0

    move-object/from16 v0, v17

    move/from16 v1, v20

    invoke-static {v0, v1}, Lcom/mobnetic/coinguardian/appwidget/WidgetPrefsUtils;->getCompactMode(Landroid/content/Context;I)Z

    move-result v8

    .line 57
    .local v8, "isCompact":Z
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mobnetic/coinguardian/appwidget/ListProvider;->context:Landroid/content/Context;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/mobnetic/coinguardian/appwidget/ListProvider;->appWidgetId:I

    move/from16 v20, v0

    move-object/from16 v0, v17

    move/from16 v1, v20

    invoke-static {v0, v1}, Lcom/mobnetic/coinguardian/appwidget/WidgetPrefsUtils;->getDarkTheme(Landroid/content/Context;I)Z

    move-result v9

    .line 58
    .local v9, "isDarkTheme":Z
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mobnetic/coinguardian/appwidget/ListProvider;->context:Landroid/content/Context;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v20

    if-eqz v9, :cond_3

    const v17, 0x7f0d0013

    :goto_0
    move-object/from16 v0, v20

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v15

    .line 59
    .local v15, "textColorPrimary":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mobnetic/coinguardian/appwidget/ListProvider;->context:Landroid/content/Context;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v20

    if-eqz v9, :cond_4

    const v17, 0x7f0d0015

    :goto_1
    move-object/from16 v0, v20

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v16

    .line 61
    .local v16, "textColorSecondary":I
    new-instance v14, Landroid/widget/RemoteViews;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mobnetic/coinguardian/appwidget/ListProvider;->context:Landroid/content/Context;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v20

    if-eqz v8, :cond_5

    const v17, 0x7f030031

    :goto_2
    move-object/from16 v0, v20

    move/from16 v1, v17

    invoke-direct {v14, v0, v1}, Landroid/widget/RemoteViews;-><init>(Ljava/lang/String;I)V

    .line 63
    .local v14, "remoteViews":Landroid/widget/RemoteViews;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mobnetic/coinguardian/appwidget/ListProvider;->items:Ljava/util/List;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    move/from16 v1, p1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    .line 64
    .local v10, "item":Lcom/mobnetic/coinguardian/db/content/CheckerRecord;
    invoke-virtual {v10}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getMarketKey()Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v17 .. v17}, Lcom/mobnetic/coinguardian/util/MarketsConfigUtils;->getMarketByKey(Ljava/lang/String;)Lcom/mobnetic/coinguardian/model/Market;

    move-result-object v12

    .line 66
    .local v12, "market":Lcom/mobnetic/coinguardian/model/Market;
    const v17, 0x7f0e007a

    move/from16 v0, v17

    move/from16 v1, v16

    invoke-virtual {v14, v0, v1}, Landroid/widget/RemoteViews;->setTextColor(II)V

    .line 67
    const v17, 0x7f0e007a

    iget-object v0, v12, Lcom/mobnetic/coinguardian/model/Market;->name:Ljava/lang/String;

    move-object/from16 v20, v0

    move/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v14, v0, v1}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    .line 68
    const v17, 0x7f0e0078

    move/from16 v0, v17

    invoke-virtual {v14, v0, v15}, Landroid/widget/RemoteViews;->setTextColor(II)V

    .line 69
    invoke-virtual {v10}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getCurrencySrc()Ljava/lang/String;

    move-result-object v17

    invoke-virtual {v10}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getContractType()J

    move-result-wide v20

    move-wide/from16 v0, v20

    long-to-int v0, v0

    move/from16 v20, v0

    move-object/from16 v0, v17

    move/from16 v1, v20

    invoke-static {v0, v12, v1}, Lcom/mobnetic/coinguardian/util/FormatUtils;->getCurrencySrcWithContractType(Ljava/lang/String;Lcom/mobnetic/coinguardian/model/Market;I)Ljava/lang/String;

    move-result-object v4

    .line 70
    .local v4, "currencySrcWithContractType":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mobnetic/coinguardian/appwidget/ListProvider;->context:Landroid/content/Context;

    move-object/from16 v17, v0

    const v20, 0x7f07006e

    const/16 v21, 0x2

    move/from16 v0, v21

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v21, v0

    const/16 v22, 0x0

    aput-object v4, v21, v22

    const/16 v22, 0x1

    invoke-virtual {v10}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getCurrencyDst()Ljava/lang/String;

    move-result-object v23

    aput-object v23, v21, v22

    move-object/from16 v0, v17

    move/from16 v1, v20

    move-object/from16 v2, v21

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    .line 71
    .local v5, "currencyString":Ljava/lang/String;
    if-eqz v8, :cond_0

    .line 72
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mobnetic/coinguardian/appwidget/ListProvider;->context:Landroid/content/Context;

    move-object/from16 v17, v0

    const v20, 0x7f070060

    const/16 v21, 0x1

    move/from16 v0, v21

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v21, v0

    const/16 v22, 0x0

    aput-object v5, v21, v22

    move-object/from16 v0, v17

    move/from16 v1, v20

    move-object/from16 v2, v21

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    .line 73
    :cond_0
    const v17, 0x7f0e0078

    move/from16 v0, v17

    invoke-virtual {v14, v0, v5}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    .line 76
    invoke-virtual {v10}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getLastCheckTicker()Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v17 .. v17}, Lcom/mobnetic/coinguardian/util/TickerUtils;->fromJson(Ljava/lang/String;)Lcom/mobnetic/coinguardian/model/Ticker;

    move-result-object v11

    .line 77
    .local v11, "lastCheckTicker":Lcom/mobnetic/coinguardian/model/Ticker;
    invoke-virtual {v10}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getErrorMsg()Ljava/lang/String;

    move-result-object v17

    if-eqz v17, :cond_6

    .line 78
    const v17, 0x7f0e007e

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mobnetic/coinguardian/appwidget/ListProvider;->context:Landroid/content/Context;

    move-object/from16 v20, v0

    const v21, 0x7f07000f

    invoke-virtual/range {v20 .. v21}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v20

    move/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v14, v0, v1}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    .line 79
    const v17, 0x7f0e00a1

    const/16 v20, 0x8

    move/from16 v0, v17

    move/from16 v1, v20

    invoke-virtual {v14, v0, v1}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    .line 80
    invoke-virtual {v10}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getLastCheckDate()J

    move-result-wide v18

    .line 93
    .local v18, "time":J
    :goto_3
    const v20, 0x7f0e00a0

    if-nez v8, :cond_9

    if-nez v11, :cond_1

    invoke-virtual {v10}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getErrorMsg()Ljava/lang/String;

    move-result-object v17

    if-eqz v17, :cond_9

    :cond_1
    const/16 v17, 0x0

    :goto_4
    move/from16 v0, v20

    move/from16 v1, v17

    invoke-virtual {v14, v0, v1}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    .line 94
    const v17, 0x7f0e007e

    move/from16 v0, v17

    move/from16 v1, v16

    invoke-virtual {v14, v0, v1}, Landroid/widget/RemoteViews;->setTextColor(II)V

    .line 95
    if-nez v8, :cond_2

    .line 96
    const v17, 0x7f0e007d

    move/from16 v0, v17

    move/from16 v1, v16

    invoke-virtual {v14, v0, v1}, Landroid/widget/RemoteViews;->setTextColor(II)V

    .line 97
    const-wide/16 v20, -0x1

    cmp-long v17, v18, v20

    if-nez v17, :cond_a

    .line 98
    const v17, 0x7f0e007f

    const/16 v20, 0x8

    move/from16 v0, v17

    move/from16 v1, v20

    invoke-virtual {v14, v0, v1}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    .line 107
    :cond_2
    :goto_5
    new-instance v6, Landroid/os/Bundle;

    invoke-direct {v6}, Landroid/os/Bundle;-><init>()V

    .line 108
    .local v6, "extras":Landroid/os/Bundle;
    const-string v17, "checker_record_id"

    invoke-virtual {v10}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getId()J

    move-result-wide v20

    move-object/from16 v0, v17

    move-wide/from16 v1, v20

    invoke-virtual {v6, v0, v1, v2}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 109
    new-instance v7, Landroid/content/Intent;

    invoke-direct {v7}, Landroid/content/Intent;-><init>()V

    .line 110
    .local v7, "fillInIntent":Landroid/content/Intent;
    invoke-virtual {v7, v6}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    .line 111
    const v17, 0x7f0e009f

    move/from16 v0, v17

    invoke-virtual {v14, v0, v7}, Landroid/widget/RemoteViews;->setOnClickFillInIntent(ILandroid/content/Intent;)V

    .line 113
    return-object v14

    .line 58
    .end local v4    # "currencySrcWithContractType":Ljava/lang/String;
    .end local v5    # "currencyString":Ljava/lang/String;
    .end local v6    # "extras":Landroid/os/Bundle;
    .end local v7    # "fillInIntent":Landroid/content/Intent;
    .end local v10    # "item":Lcom/mobnetic/coinguardian/db/content/CheckerRecord;
    .end local v11    # "lastCheckTicker":Lcom/mobnetic/coinguardian/model/Ticker;
    .end local v12    # "market":Lcom/mobnetic/coinguardian/model/Market;
    .end local v14    # "remoteViews":Landroid/widget/RemoteViews;
    .end local v15    # "textColorPrimary":I
    .end local v16    # "textColorSecondary":I
    .end local v18    # "time":J
    :cond_3
    const v17, 0x7f0d0014

    goto/16 :goto_0

    .line 59
    .restart local v15    # "textColorPrimary":I
    :cond_4
    const v17, 0x7f0d0016

    goto/16 :goto_1

    .line 61
    .restart local v16    # "textColorSecondary":I
    :cond_5
    const v17, 0x7f030030

    goto/16 :goto_2

    .line 81
    .restart local v4    # "currencySrcWithContractType":Ljava/lang/String;
    .restart local v5    # "currencyString":Ljava/lang/String;
    .restart local v10    # "item":Lcom/mobnetic/coinguardian/db/content/CheckerRecord;
    .restart local v11    # "lastCheckTicker":Lcom/mobnetic/coinguardian/model/Ticker;
    .restart local v12    # "market":Lcom/mobnetic/coinguardian/model/Market;
    .restart local v14    # "remoteViews":Landroid/widget/RemoteViews;
    :cond_6
    if-eqz v11, :cond_8

    .line 82
    invoke-virtual {v10}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getPreviousCheckTicker()Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v17 .. v17}, Lcom/mobnetic/coinguardian/util/TickerUtils;->fromJson(Ljava/lang/String;)Lcom/mobnetic/coinguardian/model/Ticker;

    move-result-object v13

    .line 83
    .local v13, "previousCheckTicker":Lcom/mobnetic/coinguardian/model/Ticker;
    const v17, 0x7f0e007e

    iget-wide v0, v11, Lcom/mobnetic/coinguardian/model/Ticker;->last:D

    move-wide/from16 v20, v0

    move-wide/from16 v0, v20

    invoke-static {v0, v1, v10}, Lcom/mobnetic/coinguardian/util/FormatUtils;->formatPriceWithCurrency(DLcom/mobnetic/coinguardian/db/content/CheckerRecord;)Ljava/lang/String;

    move-result-object v20

    move/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v14, v0, v1}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    .line 84
    const v20, 0x7f0e00a1

    if-nez v9, :cond_7

    const/16 v17, 0x1

    :goto_6
    move/from16 v0, v17

    invoke-static {v13, v11, v0}, Lcom/mobnetic/coinguardian/util/NotificationUtils;->getIconResIdForTickers(Lcom/mobnetic/coinguardian/model/Ticker;Lcom/mobnetic/coinguardian/model/Ticker;Z)I

    move-result v17

    move/from16 v0, v20

    move/from16 v1, v17

    invoke-virtual {v14, v0, v1}, Landroid/widget/RemoteViews;->setImageViewResource(II)V

    .line 85
    const v17, 0x7f0e00a1

    const/16 v20, 0x0

    move/from16 v0, v17

    move/from16 v1, v20

    invoke-virtual {v14, v0, v1}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    .line 86
    iget-wide v0, v11, Lcom/mobnetic/coinguardian/model/Ticker;->timestamp:J

    move-wide/from16 v18, v0

    .line 87
    .restart local v18    # "time":J
    goto/16 :goto_3

    .line 84
    .end local v18    # "time":J
    :cond_7
    const/16 v17, 0x0

    goto :goto_6

    .line 88
    .end local v13    # "previousCheckTicker":Lcom/mobnetic/coinguardian/model/Ticker;
    :cond_8
    const v17, 0x7f0e007e

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mobnetic/coinguardian/appwidget/ListProvider;->context:Landroid/content/Context;

    move-object/from16 v20, v0

    const v21, 0x7f070071

    invoke-virtual/range {v20 .. v21}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v20

    move/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v14, v0, v1}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    .line 89
    const v17, 0x7f0e00a1

    const/16 v20, 0x8

    move/from16 v0, v17

    move/from16 v1, v20

    invoke-virtual {v14, v0, v1}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    .line 90
    const-wide/16 v18, -0x1

    .restart local v18    # "time":J
    goto/16 :goto_3

    .line 93
    :cond_9
    const/16 v17, 0x8

    goto/16 :goto_4

    .line 100
    :cond_a
    const v17, 0x7f0e007f

    move/from16 v0, v17

    move/from16 v1, v16

    invoke-virtual {v14, v0, v1}, Landroid/widget/RemoteViews;->setTextColor(II)V

    .line 101
    const v17, 0x7f0e007f

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mobnetic/coinguardian/appwidget/ListProvider;->context:Landroid/content/Context;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    move-wide/from16 v1, v18

    invoke-static {v0, v1, v2}, Lcom/mobnetic/coinguardian/util/FormatUtils;->formatSameDayTimeOrDate(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v20

    move/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v14, v0, v1}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    .line 102
    const v17, 0x7f0e007f

    const/16 v20, 0x0

    move/from16 v0, v17

    move/from16 v1, v20

    invoke-virtual {v14, v0, v1}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    goto/16 :goto_5
.end method

.method public getViewTypeCount()I
    .locals 1

    .prologue
    .line 149
    const/4 v0, 0x1

    return v0
.end method

.method public hasStableIds()Z
    .locals 1

    .prologue
    .line 154
    const/4 v0, 0x1

    return v0
.end method

.method public onCreate()V
    .locals 0

    .prologue
    .line 43
    return-void
.end method

.method public onDataSetChanged()V
    .locals 0

    .prologue
    .line 136
    invoke-direct {p0}, Lcom/mobnetic/coinguardian/appwidget/ListProvider;->refreshItems()V

    .line 137
    return-void
.end method

.method public onDestroy()V
    .locals 1

    .prologue
    .line 51
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mobnetic/coinguardian/appwidget/ListProvider;->items:Ljava/util/List;

    .line 52
    return-void
.end method
