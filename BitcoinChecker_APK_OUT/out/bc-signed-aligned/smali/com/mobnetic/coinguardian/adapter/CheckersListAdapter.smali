.class public Lcom/mobnetic/coinguardian/adapter/CheckersListAdapter;
.super Lcom/mobeta/android/dslv/DragSortCursorAdapter;
.source "CheckersListAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mobnetic/coinguardian/adapter/CheckersListAdapter$ViewHolder;
    }
.end annotation


# instance fields
.field private actionModeActive:Z

.field private final context:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 45
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lcom/mobeta/android/dslv/DragSortCursorAdapter;-><init>(Landroid/content/Context;Landroid/database/Cursor;Z)V

    .line 46
    iput-object p1, p0, Lcom/mobnetic/coinguardian/adapter/CheckersListAdapter;->context:Landroid/content/Context;

    .line 48
    return-void
.end method


# virtual methods
.method public bindView(Landroid/view/View;Landroid/content/Context;Landroid/database/Cursor;)V
    .locals 20
    .param p1, "convertView"    # Landroid/view/View;
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "cursor"    # Landroid/database/Cursor;

    .prologue
    .line 64
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/mobnetic/coinguardian/adapter/CheckersListAdapter$ViewHolder;

    .line 66
    .local v5, "holder":Lcom/mobnetic/coinguardian/adapter/CheckersListAdapter$ViewHolder;
    invoke-static/range {p3 .. p3}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->fromCursor(Landroid/database/Cursor;)Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    move-result-object v6

    .line 67
    .local v6, "item":Lcom/mobnetic/coinguardian/db/content/CheckerRecord;
    invoke-virtual {v6}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getCurrencyDst()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v6}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getCurrencySubunitDst()J

    move-result-wide v14

    invoke-static {v12, v14, v15}, Lcom/mobnetic/coinguardian/util/CurrencyUtils;->getCurrencySubunit(Ljava/lang/String;J)Lcom/mobnetic/coinguardian/model/CurrencySubunit;

    move-result-object v11

    .line 68
    .local v11, "subunitDst":Lcom/mobnetic/coinguardian/model/CurrencySubunit;
    invoke-virtual {v6}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getMarketKey()Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Lcom/mobnetic/coinguardian/util/MarketsConfigUtils;->getMarketByKey(Ljava/lang/String;)Lcom/mobnetic/coinguardian/model/Market;

    move-result-object v9

    .line 72
    .local v9, "market":Lcom/mobnetic/coinguardian/model/Market;
    iget-object v12, v5, Lcom/mobnetic/coinguardian/adapter/CheckersListAdapter$ViewHolder;->marketView:Landroid/widget/TextView;

    iget-object v13, v9, Lcom/mobnetic/coinguardian/model/Market;->name:Ljava/lang/String;

    invoke-virtual {v12, v13}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 74
    iget-object v12, v5, Lcom/mobnetic/coinguardian/adapter/CheckersListAdapter$ViewHolder;->currencyView:Landroid/widget/TextView;

    const v13, 0x7f07006e

    const/4 v14, 0x2

    new-array v14, v14, [Ljava/lang/Object;

    const/4 v15, 0x0

    .line 75
    invoke-virtual {v6}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getCurrencySrc()Ljava/lang/String;

    move-result-object v16

    invoke-virtual {v6}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getContractType()J

    move-result-wide v18

    move-wide/from16 v0, v18

    long-to-int v0, v0

    move/from16 v17, v0

    move-object/from16 v0, v16

    move/from16 v1, v17

    invoke-static {v0, v9, v1}, Lcom/mobnetic/coinguardian/util/FormatUtils;->getCurrencySrcWithContractType(Ljava/lang/String;Lcom/mobnetic/coinguardian/model/Market;I)Ljava/lang/String;

    move-result-object v16

    aput-object v16, v14, v15

    const/4 v15, 0x1

    .line 76
    invoke-virtual {v6}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getCurrencyDst()Ljava/lang/String;

    move-result-object v16

    aput-object v16, v14, v15

    .line 74
    move-object/from16 v0, p2

    invoke-virtual {v0, v13, v14}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 80
    invoke-virtual {v6}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getLastCheckTicker()Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Lcom/mobnetic/coinguardian/util/TickerUtils;->fromJson(Ljava/lang/String;)Lcom/mobnetic/coinguardian/model/Ticker;

    move-result-object v7

    .line 81
    .local v7, "lastCheckTicker":Lcom/mobnetic/coinguardian/model/Ticker;
    invoke-virtual {v6}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getErrorMsg()Ljava/lang/String;

    move-result-object v12

    if-eqz v12, :cond_1

    .line 82
    iget-object v12, v5, Lcom/mobnetic/coinguardian/adapter/CheckersListAdapter$ViewHolder;->lastCheckView:Landroid/widget/TextView;

    const v13, 0x7f070010

    const/4 v14, 0x1

    new-array v14, v14, [Ljava/lang/Object;

    const/4 v15, 0x0

    const-string v16, ""

    aput-object v16, v14, v15

    move-object/from16 v0, p2

    invoke-virtual {v0, v13, v14}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 83
    iget-object v12, v5, Lcom/mobnetic/coinguardian/adapter/CheckersListAdapter$ViewHolder;->lastCheckValueView:Landroid/widget/TextView;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "<small>"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v6}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getErrorMsg()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, "</small>"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v13

    invoke-virtual {v12, v13}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 84
    iget-object v12, v5, Lcom/mobnetic/coinguardian/adapter/CheckersListAdapter$ViewHolder;->lastCheckValueView:Landroid/widget/TextView;

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    invoke-virtual/range {v12 .. v16}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 85
    const/4 v8, 0x0

    .line 86
    .local v8, "lastCheckValueViewVisibility":I
    iget-object v12, v5, Lcom/mobnetic/coinguardian/adapter/CheckersListAdapter$ViewHolder;->lastCheckTimeView:Landroid/widget/TextView;

    invoke-virtual {v6}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getLastCheckDate()J

    move-result-wide v14

    move-object/from16 v0, p2

    invoke-static {v0, v14, v15}, Lcom/mobnetic/coinguardian/util/FormatUtils;->formatSameDayTimeOrDate(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 99
    :goto_0
    iget-object v12, v5, Lcom/mobnetic/coinguardian/adapter/CheckersListAdapter$ViewHolder;->lastCheckView:Landroid/widget/TextView;

    invoke-virtual {v12, v8}, Landroid/widget/TextView;->setVisibility(I)V

    .line 100
    iget-object v12, v5, Lcom/mobnetic/coinguardian/adapter/CheckersListAdapter$ViewHolder;->lastCheckValueView:Landroid/widget/TextView;

    iget-object v13, v5, Lcom/mobnetic/coinguardian/adapter/CheckersListAdapter$ViewHolder;->lastCheckView:Landroid/widget/TextView;

    invoke-virtual {v13}, Landroid/widget/TextView;->getVisibility()I

    move-result v13

    invoke-virtual {v12, v13}, Landroid/widget/TextView;->setVisibility(I)V

    .line 101
    iget-object v12, v5, Lcom/mobnetic/coinguardian/adapter/CheckersListAdapter$ViewHolder;->lastCheckTimeView:Landroid/widget/TextView;

    iget-object v13, v5, Lcom/mobnetic/coinguardian/adapter/CheckersListAdapter$ViewHolder;->lastCheckView:Landroid/widget/TextView;

    invoke-virtual {v13}, Landroid/widget/TextView;->getVisibility()I

    move-result v13

    invoke-virtual {v12, v13}, Landroid/widget/TextView;->setVisibility(I)V

    .line 102
    iget-object v12, v5, Lcom/mobnetic/coinguardian/adapter/CheckersListAdapter$ViewHolder;->separator:Landroid/view/View;

    iget-object v13, v5, Lcom/mobnetic/coinguardian/adapter/CheckersListAdapter$ViewHolder;->lastCheckView:Landroid/widget/TextView;

    invoke-virtual {v13}, Landroid/widget/TextView;->getVisibility()I

    move-result v13

    invoke-virtual {v12, v13}, Landroid/view/View;->setVisibility(I)V

    .line 104
    const/4 v12, 0x1

    invoke-static {v6, v12}, Lcom/mobnetic/coinguardian/util/CheckerRecordHelper;->getAlarmsForCheckerRecord(Lcom/mobnetic/coinguardian/db/content/CheckerRecord;Z)Ljava/util/List;

    move-result-object v3

    .line 105
    .local v3, "alarmRecords":Ljava/util/List;, "Ljava/util/List<Lcom/mobnetic/coinguardian/db/content/AlarmRecord;>;"
    if-eqz v3, :cond_0

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v12

    if-nez v12, :cond_3

    .line 107
    :cond_0
    iget-object v12, v5, Lcom/mobnetic/coinguardian/adapter/CheckersListAdapter$ViewHolder;->alarmView:Landroid/widget/TextView;

    const v13, 0x7f07005d

    const/4 v14, 0x1

    new-array v14, v14, [Ljava/lang/Object;

    const/4 v15, 0x0

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, " "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    const v17, 0x7f07005e

    move-object/from16 v0, p2

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    aput-object v16, v14, v15

    move-object/from16 v0, p2

    invoke-virtual {v0, v13, v14}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 125
    :goto_1
    iget-object v13, v5, Lcom/mobnetic/coinguardian/adapter/CheckersListAdapter$ViewHolder;->dragHandle:Landroid/view/View;

    move-object/from16 v0, p0

    iget-boolean v12, v0, Lcom/mobnetic/coinguardian/adapter/CheckersListAdapter;->actionModeActive:Z

    if-eqz v12, :cond_6

    const/4 v12, 0x0

    :goto_2
    invoke-virtual {v13, v12}, Landroid/view/View;->setVisibility(I)V

    .line 126
    iget-object v13, v5, Lcom/mobnetic/coinguardian/adapter/CheckersListAdapter$ViewHolder;->switchView:Landroid/widget/CompoundButton;

    move-object/from16 v0, p0

    iget-boolean v12, v0, Lcom/mobnetic/coinguardian/adapter/CheckersListAdapter;->actionModeActive:Z

    if-eqz v12, :cond_7

    const/4 v12, 0x4

    :goto_3
    invoke-virtual {v13, v12}, Landroid/widget/CompoundButton;->setVisibility(I)V

    .line 128
    iget-object v12, v5, Lcom/mobnetic/coinguardian/adapter/CheckersListAdapter$ViewHolder;->switchView:Landroid/widget/CompoundButton;

    const/4 v13, 0x0

    invoke-virtual {v12, v13}, Landroid/widget/CompoundButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 129
    iget-object v12, v5, Lcom/mobnetic/coinguardian/adapter/CheckersListAdapter$ViewHolder;->switchView:Landroid/widget/CompoundButton;

    invoke-virtual {v6}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getEnabled()Z

    move-result v13

    invoke-virtual {v12, v13}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 130
    iget-object v12, v5, Lcom/mobnetic/coinguardian/adapter/CheckersListAdapter$ViewHolder;->switchView:Landroid/widget/CompoundButton;

    new-instance v13, Lcom/mobnetic/coinguardian/adapter/CheckersListAdapter$1;

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v13, v0, v6, v1}, Lcom/mobnetic/coinguardian/adapter/CheckersListAdapter$1;-><init>(Lcom/mobnetic/coinguardian/adapter/CheckersListAdapter;Lcom/mobnetic/coinguardian/db/content/CheckerRecord;Landroid/content/Context;)V

    invoke-virtual {v12, v13}, Landroid/widget/CompoundButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 137
    return-void

    .line 87
    .end local v3    # "alarmRecords":Ljava/util/List;, "Ljava/util/List<Lcom/mobnetic/coinguardian/db/content/AlarmRecord;>;"
    .end local v8    # "lastCheckValueViewVisibility":I
    :cond_1
    if-eqz v7, :cond_2

    .line 88
    iget-object v12, v5, Lcom/mobnetic/coinguardian/adapter/CheckersListAdapter$ViewHolder;->lastCheckView:Landroid/widget/TextView;

    const v13, 0x7f070062

    invoke-virtual {v12, v13}, Landroid/widget/TextView;->setText(I)V

    .line 89
    iget-object v12, v5, Lcom/mobnetic/coinguardian/adapter/CheckersListAdapter$ViewHolder;->lastCheckValueView:Landroid/widget/TextView;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, " "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    iget-wide v14, v7, Lcom/mobnetic/coinguardian/model/Ticker;->last:D

    invoke-static {v14, v15, v11}, Lcom/mobnetic/coinguardian/util/FormatUtils;->formatPriceWithCurrency(DLcom/mobnetic/coinguardian/model/CurrencySubunit;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 90
    invoke-virtual {v6}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getPreviousCheckTicker()Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Lcom/mobnetic/coinguardian/util/TickerUtils;->fromJson(Ljava/lang/String;)Lcom/mobnetic/coinguardian/model/Ticker;

    move-result-object v10

    .line 91
    .local v10, "previousCheckTicker":Lcom/mobnetic/coinguardian/model/Ticker;
    iget-object v12, v5, Lcom/mobnetic/coinguardian/adapter/CheckersListAdapter$ViewHolder;->lastCheckValueView:Landroid/widget/TextView;

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x1

    invoke-static {v10, v7, v15}, Lcom/mobnetic/coinguardian/util/NotificationUtils;->getIconResIdForTickers(Lcom/mobnetic/coinguardian/model/Ticker;Lcom/mobnetic/coinguardian/model/Ticker;Z)I

    move-result v15

    const/16 v16, 0x0

    invoke-virtual/range {v12 .. v16}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 92
    const/4 v8, 0x0

    .line 93
    .restart local v8    # "lastCheckValueViewVisibility":I
    iget-object v12, v5, Lcom/mobnetic/coinguardian/adapter/CheckersListAdapter$ViewHolder;->lastCheckTimeView:Landroid/widget/TextView;

    iget-wide v14, v7, Lcom/mobnetic/coinguardian/model/Ticker;->timestamp:J

    move-object/from16 v0, p2

    invoke-static {v0, v14, v15}, Lcom/mobnetic/coinguardian/util/FormatUtils;->formatSameDayTimeOrDate(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_0

    .line 95
    .end local v8    # "lastCheckValueViewVisibility":I
    .end local v10    # "previousCheckTicker":Lcom/mobnetic/coinguardian/model/Ticker;
    :cond_2
    iget-object v12, v5, Lcom/mobnetic/coinguardian/adapter/CheckersListAdapter$ViewHolder;->lastCheckView:Landroid/widget/TextView;

    const v13, 0x7f070062

    invoke-virtual {v12, v13}, Landroid/widget/TextView;->setText(I)V

    .line 96
    iget-object v12, v5, Lcom/mobnetic/coinguardian/adapter/CheckersListAdapter$ViewHolder;->lastCheckValueView:Landroid/widget/TextView;

    const/4 v13, 0x0

    invoke-virtual {v12, v13}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 97
    const/16 v8, 0x8

    .restart local v8    # "lastCheckValueViewVisibility":I
    goto/16 :goto_0

    .line 109
    .restart local v3    # "alarmRecords":Ljava/util/List;, "Ljava/util/List<Lcom/mobnetic/coinguardian/db/content/AlarmRecord;>;"
    :cond_3
    const-string v4, ""

    .line 110
    .local v4, "alarmString":Ljava/lang/String;
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :goto_4
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_5

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;

    .line 112
    .local v2, "alarmRecord":Lcom/mobnetic/coinguardian/db/content/AlarmRecord;
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v13

    if-nez v13, :cond_4

    .line 113
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v13, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, ",  "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 116
    :cond_4
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v13, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const v14, 0x7f07005f

    const/4 v15, 0x3

    new-array v15, v15, [Ljava/lang/Object;

    const/16 v16, 0x0

    .line 117
    invoke-static {v6, v2}, Lcom/mobnetic/coinguardian/util/AlarmRecordHelper;->getPrefixForAlarmType(Lcom/mobnetic/coinguardian/db/content/CheckerRecord;Lcom/mobnetic/coinguardian/db/content/AlarmRecord;)Ljava/lang/String;

    move-result-object v17

    aput-object v17, v15, v16

    const/16 v16, 0x1

    .line 118
    invoke-static {v11, v2}, Lcom/mobnetic/coinguardian/util/AlarmRecordHelper;->getValueForAlarmType(Lcom/mobnetic/coinguardian/model/CurrencySubunit;Lcom/mobnetic/coinguardian/db/content/AlarmRecord;)Ljava/lang/String;

    move-result-object v17

    aput-object v17, v15, v16

    const/16 v16, 0x2

    .line 119
    invoke-static {v6, v2}, Lcom/mobnetic/coinguardian/util/AlarmRecordHelper;->getSufixForAlarmType(Lcom/mobnetic/coinguardian/db/content/CheckerRecord;Lcom/mobnetic/coinguardian/db/content/AlarmRecord;)Ljava/lang/String;

    move-result-object v17

    aput-object v17, v15, v16

    .line 116
    move-object/from16 v0, p2

    invoke-virtual {v0, v14, v15}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 121
    goto :goto_4

    .line 122
    .end local v2    # "alarmRecord":Lcom/mobnetic/coinguardian/db/content/AlarmRecord;
    :cond_5
    iget-object v12, v5, Lcom/mobnetic/coinguardian/adapter/CheckersListAdapter$ViewHolder;->alarmView:Landroid/widget/TextView;

    const v13, 0x7f07005d

    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v13

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, " "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    new-instance v15, Landroid/text/style/RelativeSizeSpan;

    const/high16 v16, 0x3fa00000    # 1.25f

    invoke-direct/range {v15 .. v16}, Landroid/text/style/RelativeSizeSpan;-><init>(F)V

    invoke-static {v13, v14, v15}, Lcom/mobnetic/coinguardian/util/SpannableUtils;->formatWithSpans(Ljava/lang/String;Ljava/lang/String;Landroid/text/style/CharacterStyle;)Ljava/lang/CharSequence;

    move-result-object v13

    invoke-virtual {v12, v13}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_1

    .line 125
    .end local v4    # "alarmString":Ljava/lang/String;
    :cond_6
    const/16 v12, 0x8

    goto/16 :goto_2

    .line 126
    :cond_7
    const/4 v12, 0x0

    goto/16 :goto_3
.end method

.method public newView(Landroid/content/Context;Landroid/database/Cursor;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 4
    .param p1, "arg0"    # Landroid/content/Context;
    .param p2, "cursor"    # Landroid/database/Cursor;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 57
    iget-object v1, p0, Lcom/mobnetic/coinguardian/adapter/CheckersListAdapter;->context:Landroid/content/Context;

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    const v2, 0x7f030021

    const/4 v3, 0x0

    invoke-virtual {v1, v2, p3, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 58
    .local v0, "view":Landroid/view/View;
    new-instance v1, Lcom/mobnetic/coinguardian/adapter/CheckersListAdapter$ViewHolder;

    invoke-direct {v1, v0}, Lcom/mobnetic/coinguardian/adapter/CheckersListAdapter$ViewHolder;-><init>(Landroid/view/View;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 59
    return-object v0
.end method

.method public setActionModeActive(Z)V
    .locals 0
    .param p1, "actionModeActive"    # Z

    .prologue
    .line 51
    iput-boolean p1, p0, Lcom/mobnetic/coinguardian/adapter/CheckersListAdapter;->actionModeActive:Z

    .line 52
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/adapter/CheckersListAdapter;->notifyDataSetChanged()V

    .line 53
    return-void
.end method
