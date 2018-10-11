.class public Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference;
.super Lcom/mobnetic/coinguardian/view/generic/ViewDialogPreference;
.source "ViewAlarmValuePickerPreference.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference$OnValueChangedListener;
    }
.end annotation


# instance fields
.field private alarmRecord:Lcom/mobnetic/coinguardian/db/content/AlarmRecord;

.field private onValueSelectedListener:Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference$OnValueChangedListener;

.field private prefix:Ljava/lang/String;

.field private subunit:Lcom/mobnetic/coinguardian/model/CurrencySubunit;

.field private sufix:Ljava/lang/String;

.field private value:D


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 35
    invoke-direct {p0, p1}, Lcom/mobnetic/coinguardian/view/generic/ViewDialogPreference;-><init>(Landroid/content/Context;)V

    .line 27
    const-wide/high16 v0, -0x4010000000000000L    # -1.0

    iput-wide v0, p0, Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference;->value:D

    .line 36
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 39
    invoke-direct {p0, p1, p2}, Lcom/mobnetic/coinguardian/view/generic/ViewDialogPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 27
    const-wide/high16 v0, -0x4010000000000000L    # -1.0

    iput-wide v0, p0, Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference;->value:D

    .line 40
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .prologue
    .line 44
    invoke-direct {p0, p1, p2, p3}, Lcom/mobnetic/coinguardian/view/generic/ViewDialogPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 27
    const-wide/high16 v0, -0x4010000000000000L    # -1.0

    iput-wide v0, p0, Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference;->value:D

    .line 45
    return-void
.end method

.method static synthetic access$000(Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference;)Lcom/mobnetic/coinguardian/model/CurrencySubunit;
    .locals 1
    .param p0, "x0"    # Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference;

    .prologue
    .line 25
    iget-object v0, p0, Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference;->subunit:Lcom/mobnetic/coinguardian/model/CurrencySubunit;

    return-object v0
.end method

.method static synthetic access$100(Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference;)Lcom/mobnetic/coinguardian/db/content/AlarmRecord;
    .locals 1
    .param p0, "x0"    # Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference;

    .prologue
    .line 25
    iget-object v0, p0, Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference;->alarmRecord:Lcom/mobnetic/coinguardian/db/content/AlarmRecord;

    return-object v0
.end method


# virtual methods
.method public bridge synthetic getEntry()Ljava/lang/CharSequence;
    .locals 1

    .prologue
    .line 25
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference;->getEntry()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getEntry()Ljava/lang/String;
    .locals 8

    .prologue
    .line 48
    iget-object v2, p0, Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference;->prefix:Ljava/lang/String;

    if-eqz v2, :cond_0

    iget-object v0, p0, Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference;->prefix:Ljava/lang/String;

    .line 49
    .local v0, "prefixString":Ljava/lang/String;
    :goto_0
    iget-object v2, p0, Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference;->sufix:Ljava/lang/String;

    if-eqz v2, :cond_1

    iget-object v1, p0, Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference;->sufix:Ljava/lang/String;

    .line 50
    .local v1, "sufixString":Ljava/lang/String;
    :goto_1
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference;->getContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f07002e

    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v0, v4, v5

    const/4 v5, 0x1

    iget-object v6, p0, Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference;->subunit:Lcom/mobnetic/coinguardian/model/CurrencySubunit;

    iget-object v7, p0, Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference;->alarmRecord:Lcom/mobnetic/coinguardian/db/content/AlarmRecord;

    .line 52
    invoke-static {v6, v7}, Lcom/mobnetic/coinguardian/util/AlarmRecordHelper;->getValueForAlarmType(Lcom/mobnetic/coinguardian/model/CurrencySubunit;Lcom/mobnetic/coinguardian/db/content/AlarmRecord;)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x2

    aput-object v1, v4, v5

    .line 50
    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 48
    .end local v0    # "prefixString":Ljava/lang/String;
    .end local v1    # "sufixString":Ljava/lang/String;
    :cond_0
    const-string v0, ""

    goto :goto_0

    .line 49
    .restart local v0    # "prefixString":Ljava/lang/String;
    :cond_1
    const-string v1, ""

    goto :goto_1
.end method

.method public getValue()D
    .locals 2

    .prologue
    .line 70
    iget-wide v0, p0, Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference;->value:D

    return-wide v0
.end method

.method protected onPrepareDialog(Landroid/app/AlertDialog$Builder;)V
    .locals 8
    .param p1, "builder"    # Landroid/app/AlertDialog$Builder;

    .prologue
    .line 82
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v5}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v5

    const v6, 0x7f030019

    const/4 v7, 0x0

    invoke-virtual {v5, v6, v7}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v4

    .line 84
    .local v4, "view":Landroid/view/View;
    const v5, 0x7f0e004d

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 85
    .local v0, "prefixView":Landroid/widget/TextView;
    const v5, 0x7f0e004a

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/EditText;

    .line 86
    .local v3, "valueView":Landroid/widget/EditText;
    new-instance v5, Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference$1;

    invoke-direct {v5, p0, v3}, Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference$1;-><init>(Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference;Landroid/widget/EditText;)V

    invoke-virtual {v3, v5}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 103
    const v5, 0x7f0e004b

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 105
    .local v1, "sufixView":Landroid/widget/TextView;
    iget-object v5, p0, Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference;->prefix:Ljava/lang/String;

    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 106
    iget-object v5, p0, Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference;->subunit:Lcom/mobnetic/coinguardian/model/CurrencySubunit;

    iget-object v6, p0, Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference;->alarmRecord:Lcom/mobnetic/coinguardian/db/content/AlarmRecord;

    invoke-static {v5, v6}, Lcom/mobnetic/coinguardian/util/AlarmRecordHelper;->getValueForAlarmType(Lcom/mobnetic/coinguardian/model/CurrencySubunit;Lcom/mobnetic/coinguardian/db/content/AlarmRecord;)Ljava/lang/String;

    move-result-object v2

    .line 107
    .local v2, "valueString":Ljava/lang/String;
    const/16 v5, 0x2c

    const/16 v6, 0x2e

    invoke-virtual {v2, v5, v6}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v2

    .line 108
    invoke-virtual {v3, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 109
    invoke-static {v3}, Lcom/mobnetic/coinguardian/util/Utils;->setSelectionAfterLastLetter(Landroid/widget/EditText;)V

    .line 110
    iget-object v5, p0, Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference;->sufix:Ljava/lang/String;

    invoke-virtual {v1, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 112
    new-instance v5, Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference$2;

    invoke-direct {v5, p0, v3}, Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference$2;-><init>(Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference;Landroid/widget/EditText;)V

    invoke-virtual {v3, v5}, Landroid/widget/EditText;->post(Ljava/lang/Runnable;)Z

    .line 118
    const v5, 0x104000a

    new-instance v6, Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference$3;

    invoke-direct {v6, p0, v3}, Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference$3;-><init>(Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference;Landroid/widget/EditText;)V

    invoke-virtual {p1, v5, v6}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 135
    invoke-virtual {p1, v4}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    .line 136
    return-void
.end method

.method public setCheckerAndAlarmRecord(Lcom/mobnetic/coinguardian/db/content/CheckerRecord;Lcom/mobnetic/coinguardian/db/content/AlarmRecord;)V
    .locals 4
    .param p1, "checkerRecord"    # Lcom/mobnetic/coinguardian/db/content/CheckerRecord;
    .param p2, "alarmRecord"    # Lcom/mobnetic/coinguardian/db/content/AlarmRecord;

    .prologue
    .line 57
    invoke-virtual {p1}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getCurrencyDst()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getCurrencySubunitDst()J

    move-result-wide v2

    invoke-static {v0, v2, v3}, Lcom/mobnetic/coinguardian/util/CurrencyUtils;->getCurrencySubunit(Ljava/lang/String;J)Lcom/mobnetic/coinguardian/model/CurrencySubunit;

    move-result-object v0

    iput-object v0, p0, Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference;->subunit:Lcom/mobnetic/coinguardian/model/CurrencySubunit;

    .line 58
    iput-object p2, p0, Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference;->alarmRecord:Lcom/mobnetic/coinguardian/db/content/AlarmRecord;

    .line 59
    return-void
.end method

.method public setOnValueChangedListener(Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference$OnValueChangedListener;)V
    .locals 0
    .param p1, "onValueSelectedListener"    # Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference$OnValueChangedListener;

    .prologue
    .line 147
    iput-object p1, p0, Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference;->onValueSelectedListener:Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference$OnValueChangedListener;

    .line 148
    return-void
.end method

.method public setPrefix(Ljava/lang/String;)V
    .locals 0
    .param p1, "prefix"    # Ljava/lang/String;

    .prologue
    .line 74
    iput-object p1, p0, Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference;->prefix:Ljava/lang/String;

    .line 75
    return-void
.end method

.method public setSufix(Ljava/lang/String;)V
    .locals 0
    .param p1, "sufix"    # Ljava/lang/String;

    .prologue
    .line 77
    iput-object p1, p0, Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference;->sufix:Ljava/lang/String;

    .line 78
    return-void
.end method

.method public setValue(D)V
    .locals 3
    .param p1, "value"    # D

    .prologue
    .line 62
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference;->getValue()D

    move-result-wide v0

    cmpl-double v0, v0, p1

    if-eqz v0, :cond_1

    .line 63
    iget-object v0, p0, Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference;->onValueSelectedListener:Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference$OnValueChangedListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference;->onValueSelectedListener:Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference$OnValueChangedListener;

    invoke-interface {v0, p0, p1, p2}, Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference$OnValueChangedListener;->onValueChanged(Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference;D)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 64
    :cond_0
    iput-wide p1, p0, Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference;->value:D

    .line 67
    :cond_1
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference;->getEntry()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 68
    return-void
.end method
