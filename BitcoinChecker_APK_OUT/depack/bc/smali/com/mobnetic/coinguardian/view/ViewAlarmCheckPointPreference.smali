.class public Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;
.super Lcom/mobnetic/coinguardian/view/generic/ViewDialogPreference;
.source "ViewAlarmCheckPointPreference.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference$OnCheckpointChangedListener;
    }
.end annotation


# instance fields
.field private alarmRecord:Lcom/mobnetic/coinguardian/db/content/AlarmRecord;

.field private checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

.field private onCheckpointChangedListener:Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference$OnCheckpointChangedListener;

.field private subunit:Lcom/mobnetic/coinguardian/model/CurrencySubunit;

.field private sufix:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 38
    invoke-direct {p0, p1}, Lcom/mobnetic/coinguardian/view/generic/ViewDialogPreference;-><init>(Landroid/content/Context;)V

    .line 39
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 42
    invoke-direct {p0, p1, p2}, Lcom/mobnetic/coinguardian/view/generic/ViewDialogPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 43
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .prologue
    .line 47
    invoke-direct {p0, p1, p2, p3}, Lcom/mobnetic/coinguardian/view/generic/ViewDialogPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 48
    return-void
.end method

.method static synthetic access$000(Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;)V
    .locals 0
    .param p0, "x0"    # Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;

    .prologue
    .line 29
    invoke-direct {p0}, Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;->resetCheckpointToLastCheck()V

    return-void
.end method

.method static synthetic access$100(Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;)Landroid/app/AlertDialog;
    .locals 1
    .param p0, "x0"    # Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;

    .prologue
    .line 29
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;->getDialog()Landroid/app/AlertDialog;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$200(Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;)Lcom/mobnetic/coinguardian/model/CurrencySubunit;
    .locals 1
    .param p0, "x0"    # Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;

    .prologue
    .line 29
    iget-object v0, p0, Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;->subunit:Lcom/mobnetic/coinguardian/model/CurrencySubunit;

    return-object v0
.end method

.method static synthetic access$300(Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;D)V
    .locals 1
    .param p0, "x0"    # Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;
    .param p1, "x1"    # D

    .prologue
    .line 29
    invoke-direct {p0, p1, p2}, Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;->setValue(D)V

    return-void
.end method

.method private resetCheckpointToLastCheck()V
    .locals 3

    .prologue
    .line 99
    iget-object v1, p0, Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;->alarmRecord:Lcom/mobnetic/coinguardian/db/content/AlarmRecord;

    invoke-virtual {v1}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->getLastCheckPointTicker()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;->checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    invoke-virtual {v1}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getLastCheckTicker()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    :cond_0
    iget-object v1, p0, Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;->alarmRecord:Lcom/mobnetic/coinguardian/db/content/AlarmRecord;

    invoke-virtual {v1}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->getLastCheckPointTicker()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_2

    iget-object v1, p0, Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;->alarmRecord:Lcom/mobnetic/coinguardian/db/content/AlarmRecord;

    invoke-virtual {v1}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->getLastCheckPointTicker()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;->checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    invoke-virtual {v2}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getLastCheckTicker()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 100
    :cond_1
    iget-object v1, p0, Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;->checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    invoke-virtual {v1}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getLastCheckTicker()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mobnetic/coinguardian/util/TickerUtils;->fromJson(Ljava/lang/String;)Lcom/mobnetic/coinguardian/model/Ticker;

    move-result-object v0

    .line 101
    .local v0, "lastCheckPointTicker":Lcom/mobnetic/coinguardian/model/Ticker;
    iget-object v1, p0, Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;->onCheckpointChangedListener:Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference$OnCheckpointChangedListener;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;->onCheckpointChangedListener:Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference$OnCheckpointChangedListener;

    invoke-interface {v1, p0, v0}, Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference$OnCheckpointChangedListener;->onCheckpointChanged(Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;Lcom/mobnetic/coinguardian/model/Ticker;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 105
    .end local v0    # "lastCheckPointTicker":Lcom/mobnetic/coinguardian/model/Ticker;
    :cond_2
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;->getEntry()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 106
    return-void
.end method

.method private setValue(D)V
    .locals 7
    .param p1, "value"    # D

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 73
    iget-object v4, p0, Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;->alarmRecord:Lcom/mobnetic/coinguardian/db/content/AlarmRecord;

    invoke-virtual {v4}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->getLastCheckPointTicker()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/mobnetic/coinguardian/util/TickerUtils;->fromJson(Ljava/lang/String;)Lcom/mobnetic/coinguardian/model/Ticker;

    move-result-object v1

    .line 74
    .local v1, "lastCheckPointTicker":Lcom/mobnetic/coinguardian/model/Ticker;
    const/4 v0, 0x0

    .line 75
    .local v0, "isModyfied":Z
    const-wide/16 v4, 0x0

    cmpg-double v4, p1, v4

    if-gtz v4, :cond_3

    .line 76
    if-eqz v1, :cond_2

    move v0, v2

    .line 77
    :goto_0
    const/4 v1, 0x0

    .line 85
    :goto_1
    if-eqz v0, :cond_1

    .line 86
    if-eqz v1, :cond_0

    .line 87
    iput-wide p1, v1, Lcom/mobnetic/coinguardian/model/Ticker;->last:D

    .line 88
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iput-wide v2, v1, Lcom/mobnetic/coinguardian/model/Ticker;->timestamp:J

    .line 91
    :cond_0
    iget-object v2, p0, Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;->onCheckpointChangedListener:Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference$OnCheckpointChangedListener;

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;->onCheckpointChangedListener:Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference$OnCheckpointChangedListener;

    invoke-interface {v2, p0, v1}, Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference$OnCheckpointChangedListener;->onCheckpointChanged(Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;Lcom/mobnetic/coinguardian/model/Ticker;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 95
    :cond_1
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;->getEntry()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 96
    return-void

    :cond_2
    move v0, v3

    .line 76
    goto :goto_0

    .line 78
    :cond_3
    if-eqz v1, :cond_5

    .line 79
    iget-wide v4, v1, Lcom/mobnetic/coinguardian/model/Ticker;->last:D

    cmpl-double v4, v4, p1

    if-eqz v4, :cond_4

    move v0, v2

    :goto_2
    goto :goto_1

    :cond_4
    move v0, v3

    goto :goto_2

    .line 81
    :cond_5
    new-instance v1, Lcom/mobnetic/coinguardian/model/Ticker;

    .end local v1    # "lastCheckPointTicker":Lcom/mobnetic/coinguardian/model/Ticker;
    invoke-direct {v1}, Lcom/mobnetic/coinguardian/model/Ticker;-><init>()V

    .line 82
    .restart local v1    # "lastCheckPointTicker":Lcom/mobnetic/coinguardian/model/Ticker;
    const/4 v0, 0x1

    goto :goto_1
.end method


# virtual methods
.method public bridge synthetic getEntry()Ljava/lang/CharSequence;
    .locals 1

    .prologue
    .line 29
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;->getEntry()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getEntry()Ljava/lang/String;
    .locals 6

    .prologue
    .line 51
    iget-object v2, p0, Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;->alarmRecord:Lcom/mobnetic/coinguardian/db/content/AlarmRecord;

    invoke-virtual {v2}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->getLastCheckPointTicker()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/mobnetic/coinguardian/util/TickerUtils;->fromJson(Ljava/lang/String;)Lcom/mobnetic/coinguardian/model/Ticker;

    move-result-object v0

    .line 52
    .local v0, "lastCheckPointTicker":Lcom/mobnetic/coinguardian/model/Ticker;
    const/4 v1, 0x0

    .line 53
    .local v1, "summary":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 54
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-wide v4, v0, Lcom/mobnetic/coinguardian/model/Ticker;->last:D

    iget-object v3, p0, Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;->subunit:Lcom/mobnetic/coinguardian/model/CurrencySubunit;

    invoke-static {v4, v5, v3}, Lcom/mobnetic/coinguardian/util/FormatUtils;->formatPriceWithCurrency(DLcom/mobnetic/coinguardian/model/CurrencySubunit;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " - "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;->getContext()Landroid/content/Context;

    move-result-object v3

    iget-wide v4, v0, Lcom/mobnetic/coinguardian/model/Ticker;->timestamp:J

    invoke-static {v3, v4, v5}, Lcom/mobnetic/coinguardian/util/FormatUtils;->formatDateTime(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 58
    :goto_0
    return-object v1

    .line 56
    :cond_0
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;->getContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f070017

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method protected onPrepareDialog(Landroid/app/AlertDialog$Builder;)V
    .locals 12
    .param p1, "builder"    # Landroid/app/AlertDialog$Builder;

    .prologue
    const/4 v11, 0x0

    const/4 v6, 0x0

    .line 110
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;->getContext()Landroid/content/Context;

    move-result-object v7

    invoke-static {v7}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v7

    const v8, 0x7f030018

    invoke-virtual {v7, v8, v11}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v5

    .line 112
    .local v5, "view":Landroid/view/View;
    const v7, 0x7f0e004a

    invoke-virtual {v5, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/EditText;

    .line 113
    .local v4, "valueView":Landroid/widget/EditText;
    new-instance v7, Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference$1;

    invoke-direct {v7, p0, v4}, Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference$1;-><init>(Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;Landroid/widget/EditText;)V

    invoke-virtual {v4, v7}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 130
    const v7, 0x7f0e004b

    invoke-virtual {v5, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    .line 132
    .local v2, "sufixView":Landroid/widget/TextView;
    const v7, 0x7f0e004c

    invoke-virtual {v5, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 134
    .local v1, "resetCheckpointButton":Landroid/view/View;
    iget-object v7, p0, Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;->alarmRecord:Lcom/mobnetic/coinguardian/db/content/AlarmRecord;

    invoke-virtual {v7}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->getLastCheckPointTicker()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/mobnetic/coinguardian/util/TickerUtils;->fromJson(Ljava/lang/String;)Lcom/mobnetic/coinguardian/model/Ticker;

    move-result-object v0

    .line 135
    .local v0, "lastCheckPointTicker":Lcom/mobnetic/coinguardian/model/Ticker;
    if-eqz v0, :cond_1

    .line 136
    iget-wide v8, v0, Lcom/mobnetic/coinguardian/model/Ticker;->last:D

    iget-object v7, p0, Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;->subunit:Lcom/mobnetic/coinguardian/model/CurrencySubunit;

    const/4 v10, 0x1

    invoke-static {v8, v9, v7, v6, v10}, Lcom/mobnetic/coinguardian/util/FormatUtils;->formatPriceValueForSubunit(DLcom/mobnetic/coinguardian/model/CurrencySubunit;ZZ)Ljava/lang/String;

    move-result-object v3

    .line 137
    .local v3, "valueString":Ljava/lang/String;
    const/16 v7, 0x2c

    const/16 v8, 0x2e

    invoke-virtual {v3, v7, v8}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v3

    .line 138
    invoke-virtual {v4, v3}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 145
    .end local v3    # "valueString":Ljava/lang/String;
    :goto_0
    iget-object v7, p0, Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;->checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    invoke-virtual {v7}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getLastCheckTicker()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_0

    const/16 v6, 0x8

    :cond_0
    invoke-virtual {v1, v6}, Landroid/view/View;->setVisibility(I)V

    .line 146
    invoke-static {v4}, Lcom/mobnetic/coinguardian/util/Utils;->setSelectionAfterLastLetter(Landroid/widget/EditText;)V

    .line 147
    iget-object v6, p0, Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;->sufix:Ljava/lang/String;

    invoke-virtual {v2, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 149
    new-instance v6, Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference$2;

    invoke-direct {v6, p0, v4}, Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference$2;-><init>(Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;Landroid/widget/EditText;)V

    invoke-virtual {v4, v6}, Landroid/widget/EditText;->post(Ljava/lang/Runnable;)Z

    .line 155
    new-instance v6, Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference$3;

    invoke-direct {v6, p0}, Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference$3;-><init>(Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;)V

    invoke-virtual {v1, v6}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 164
    const v6, 0x104000a

    new-instance v7, Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference$4;

    invoke-direct {v7, p0, v4}, Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference$4;-><init>(Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;Landroid/widget/EditText;)V

    invoke-virtual {p1, v6, v7}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 181
    const/high16 v6, 0x1040000

    invoke-virtual {p1, v6, v11}, Landroid/app/AlertDialog$Builder;->setNeutralButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 182
    const v6, 0x7f070076

    new-instance v7, Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference$5;

    invoke-direct {v7, p0}, Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference$5;-><init>(Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;)V

    invoke-virtual {p1, v6, v7}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 188
    invoke-virtual {p1, v5}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    .line 189
    return-void

    .line 141
    :cond_1
    const-string v7, ""

    invoke-virtual {v4, v7}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0
.end method

.method public setCheckerAndAlarmRecord(Lcom/mobnetic/coinguardian/db/content/CheckerRecord;Lcom/mobnetic/coinguardian/db/content/AlarmRecord;)V
    .locals 4
    .param p1, "checkerRecord"    # Lcom/mobnetic/coinguardian/db/content/CheckerRecord;
    .param p2, "alarmRecord"    # Lcom/mobnetic/coinguardian/db/content/AlarmRecord;

    .prologue
    .line 62
    iput-object p1, p0, Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;->checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    .line 63
    invoke-virtual {p1}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getCurrencyDst()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getCurrencySubunitDst()J

    move-result-wide v2

    invoke-static {v0, v2, v3}, Lcom/mobnetic/coinguardian/util/CurrencyUtils;->getCurrencySubunit(Ljava/lang/String;J)Lcom/mobnetic/coinguardian/model/CurrencySubunit;

    move-result-object v0

    iput-object v0, p0, Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;->subunit:Lcom/mobnetic/coinguardian/model/CurrencySubunit;

    .line 64
    iput-object p2, p0, Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;->alarmRecord:Lcom/mobnetic/coinguardian/db/content/AlarmRecord;

    .line 65
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;->getEntry()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 66
    return-void
.end method

.method public setOnCheckpointChangedListener(Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference$OnCheckpointChangedListener;)V
    .locals 0
    .param p1, "onCheckpointChangedListener"    # Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference$OnCheckpointChangedListener;

    .prologue
    .line 200
    iput-object p1, p0, Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;->onCheckpointChangedListener:Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference$OnCheckpointChangedListener;

    .line 201
    return-void
.end method

.method public setSufix(Ljava/lang/String;)V
    .locals 0
    .param p1, "sufix"    # Ljava/lang/String;

    .prologue
    .line 69
    iput-object p1, p0, Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;->sufix:Ljava/lang/String;

    .line 70
    return-void
.end method
