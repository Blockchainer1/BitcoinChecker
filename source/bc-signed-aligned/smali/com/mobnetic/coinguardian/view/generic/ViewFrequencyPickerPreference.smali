.class public Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference;
.super Lcom/mobnetic/coinguardian/view/generic/ViewDialogPreference;
.source "ViewFrequencyPickerPreference.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference$OnFrequencySelectedListener;
    }
.end annotation


# static fields
.field public static final USE_GLOBAL_CHECK_FREQUENCY:J = -0x1L


# instance fields
.field private frequency:J

.field private frequencyTypeEntries:[Ljava/lang/String;

.field private onFrequencySelectedListener:Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference$OnFrequencySelectedListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 29
    invoke-direct {p0, p1}, Lcom/mobnetic/coinguardian/view/generic/ViewDialogPreference;-><init>(Landroid/content/Context;)V

    .line 30
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 33
    invoke-direct {p0, p1, p2}, Lcom/mobnetic/coinguardian/view/generic/ViewDialogPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 34
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
    .line 38
    invoke-direct {p0, p1, p2, p3}, Lcom/mobnetic/coinguardian/view/generic/ViewDialogPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 39
    return-void
.end method

.method static synthetic access$000(Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference;Lnet/simonvt/numberpicker/NumberPicker;Lnet/simonvt/numberpicker/NumberPicker;J)V
    .locals 1
    .param p0, "x0"    # Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference;
    .param p1, "x1"    # Lnet/simonvt/numberpicker/NumberPicker;
    .param p2, "x2"    # Lnet/simonvt/numberpicker/NumberPicker;
    .param p3, "x3"    # J

    .prologue
    .line 20
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference;->refreshFrequencyPickers(Lnet/simonvt/numberpicker/NumberPicker;Lnet/simonvt/numberpicker/NumberPicker;J)V

    return-void
.end method

.method static synthetic access$100(Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference;II)J
    .locals 2
    .param p0, "x0"    # Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference;
    .param p1, "x1"    # I
    .param p2, "x2"    # I

    .prologue
    .line 20
    invoke-direct {p0, p1, p2}, Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference;->getFrequencyMillis(II)J

    move-result-wide v0

    return-wide v0
.end method

.method private getFrequencyMillis(II)J
    .locals 4
    .param p1, "frequencyTypeId"    # I
    .param p2, "frequencyValue"    # I

    .prologue
    .line 153
    sget-object v0, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;->FREQUENCY_TYPE_MULTIPLAYERS:[J

    aget-wide v0, v0, p1

    int-to-long v2, p2

    mul-long/2addr v0, v2

    return-wide v0
.end method

.method private parseFrequencyTypeId(J)I
    .locals 7
    .param p1, "frequencyMillis"    # J

    .prologue
    .line 157
    sget-object v1, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;->FREQUENCY_TYPE_MULTIPLAYERS:[J

    array-length v1, v1

    add-int/lit8 v0, v1, -0x1

    .local v0, "i":I
    :goto_0
    if-ltz v0, :cond_1

    .line 158
    sget-object v1, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;->FREQUENCY_TYPE_MULTIPLAYERS:[J

    aget-wide v2, v1, v0

    sget-object v1, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;->FREQUENCY_VALUE_MIN:[I

    const/4 v4, 0x1

    aget v1, v1, v4

    int-to-long v4, v1

    mul-long/2addr v2, v4

    cmp-long v1, p1, v2

    if-ltz v1, :cond_0

    .line 161
    .end local v0    # "i":I
    :goto_1
    return v0

    .line 157
    .restart local v0    # "i":I
    :cond_0
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 161
    :cond_1
    const/4 v0, 0x0

    goto :goto_1
.end method

.method private parseFrequencyValue(JI)I
    .locals 3
    .param p1, "frequencyMillis"    # J
    .param p3, "frequencyTypeId"    # I

    .prologue
    .line 165
    sget-object v0, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;->FREQUENCY_TYPE_MULTIPLAYERS:[J

    aget-wide v0, v0, p3

    div-long v0, p1, v0

    long-to-int v0, v0

    return v0
.end method

.method private refreshFrequencyPickers(Lnet/simonvt/numberpicker/NumberPicker;Lnet/simonvt/numberpicker/NumberPicker;J)V
    .locals 7
    .param p1, "frequencyTypePicker"    # Lnet/simonvt/numberpicker/NumberPicker;
    .param p2, "frequencyValuePicker"    # Lnet/simonvt/numberpicker/NumberPicker;
    .param p3, "frequency"    # J

    .prologue
    .line 138
    move-wide v0, p3

    .line 139
    .local v0, "frequencyToBeDisplayed":J
    const-wide/16 v4, -0x1

    cmp-long v3, p3, v4

    if-gtz v3, :cond_0

    .line 140
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lcom/mobnetic/coinguardian/util/PreferencesUtils;->getCheckGlobalFrequency(Landroid/content/Context;)J

    move-result-wide v0

    .line 142
    :cond_0
    invoke-direct {p0, v0, v1}, Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference;->parseFrequencyTypeId(J)I

    move-result v2

    .line 143
    .local v2, "frequencyTypeId":I
    invoke-virtual {p1, v2}, Lnet/simonvt/numberpicker/NumberPicker;->setValue(I)V

    .line 144
    sget-object v3, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;->FREQUENCY_VALUE_MIN:[I

    invoke-virtual {p1}, Lnet/simonvt/numberpicker/NumberPicker;->getValue()I

    move-result v4

    aget v3, v3, v4

    invoke-virtual {p2, v3}, Lnet/simonvt/numberpicker/NumberPicker;->setMinValue(I)V

    .line 145
    sget-object v3, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;->FREQUENCY_VALUE_MAX:[I

    invoke-virtual {p1}, Lnet/simonvt/numberpicker/NumberPicker;->getValue()I

    move-result v4

    aget v3, v3, v4

    invoke-virtual {p2, v3}, Lnet/simonvt/numberpicker/NumberPicker;->setMaxValue(I)V

    .line 146
    invoke-direct {p0, v0, v1, v2}, Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference;->parseFrequencyValue(JI)I

    move-result v3

    invoke-virtual {p2, v3}, Lnet/simonvt/numberpicker/NumberPicker;->setValue(I)V

    .line 147
    return-void
.end method


# virtual methods
.method public getEntry()Ljava/lang/CharSequence;
    .locals 14

    .prologue
    const-wide/16 v12, -0x1

    const/4 v10, 0x1

    const/4 v9, 0x0

    .line 73
    iget-wide v2, p0, Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference;->frequency:J

    .line 74
    .local v2, "frequencyToBeDisplayed":J
    iget-wide v6, p0, Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference;->frequency:J

    cmp-long v5, v6, v12

    if-gtz v5, :cond_0

    .line 75
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v5}, Lcom/mobnetic/coinguardian/util/PreferencesUtils;->getCheckGlobalFrequency(Landroid/content/Context;)J

    move-result-wide v2

    .line 77
    :cond_0
    invoke-direct {p0, v2, v3}, Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference;->parseFrequencyTypeId(J)I

    move-result v1

    .line 78
    .local v1, "frequencyTypeId":I
    invoke-direct {p0, v2, v3, v1}, Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference;->parseFrequencyValue(JI)I

    move-result v4

    .line 79
    .local v4, "frequencyValue":I
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    sget-object v6, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;->FREQUENCY_TYPE_PLURALS:[I

    aget v6, v6, v1

    new-array v7, v10, [Ljava/lang/Object;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v9

    invoke-virtual {v5, v6, v4, v7}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 81
    .local v0, "frequencyString":Ljava/lang/String;
    iget-wide v6, p0, Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference;->frequency:J

    cmp-long v5, v6, v12

    if-gtz v5, :cond_1

    .line 82
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f07003e

    new-array v7, v10, [Ljava/lang/Object;

    aput-object v0, v7, v9

    invoke-virtual {v5, v6, v7}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 84
    .end local v0    # "frequencyString":Ljava/lang/String;
    :cond_1
    return-object v0
.end method

.method public getFrequency()J
    .locals 2

    .prologue
    .line 69
    iget-wide v0, p0, Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference;->frequency:J

    return-wide v0
.end method

.method protected init(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 49
    const/4 v1, 0x4

    new-array v1, v1, [Ljava/lang/String;

    iput-object v1, p0, Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference;->frequencyTypeEntries:[Ljava/lang/String;

    .line 50
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    sget-object v1, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;->FREQUENCY_TYPE_NAMES:[I

    array-length v1, v1

    if-ge v0, v1, :cond_0

    .line 51
    iget-object v1, p0, Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference;->frequencyTypeEntries:[Ljava/lang/String;

    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference;->getContext()Landroid/content/Context;

    move-result-object v2

    sget-object v3, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;->FREQUENCY_TYPE_NAMES:[I

    aget v3, v3, v0

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v0

    .line 50
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 53
    :cond_0
    invoke-super {p0, p1, p2}, Lcom/mobnetic/coinguardian/view/generic/ViewDialogPreference;->init(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 54
    return-void
.end method

.method protected onFinishInflate()V
    .locals 2

    .prologue
    .line 43
    invoke-super {p0}, Lcom/mobnetic/coinguardian/view/generic/ViewDialogPreference;->onFinishInflate()V

    .line 44
    const-wide/32 v0, 0x927c0

    invoke-virtual {p0, v0, v1}, Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference;->setFrequency(J)V

    .line 45
    return-void
.end method

.method protected onPrepareDialog(Landroid/app/AlertDialog$Builder;)V
    .locals 10
    .param p1, "builder"    # Landroid/app/AlertDialog$Builder;

    .prologue
    const/4 v4, 0x0

    .line 90
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v5}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v5

    const v6, 0x7f030025

    const/4 v7, 0x0

    invoke-virtual {v5, v6, v7}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 91
    .local v0, "dialogLayout":Landroid/view/View;
    const v5, 0x7f0e0085

    invoke-virtual {v0, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lnet/simonvt/numberpicker/NumberPicker;

    .line 92
    .local v1, "frequencyTypePicker":Lnet/simonvt/numberpicker/NumberPicker;
    const v5, 0x7f0e0084

    invoke-virtual {v0, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lnet/simonvt/numberpicker/NumberPicker;

    .line 93
    .local v2, "frequencyValuePicker":Lnet/simonvt/numberpicker/NumberPicker;
    const v5, 0x7f0e0086

    invoke-virtual {v0, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/CompoundButton;

    .line 95
    .local v3, "useGlobalFrequencyCheckBox":Landroid/widget/CompoundButton;
    invoke-virtual {v1, v4}, Lnet/simonvt/numberpicker/NumberPicker;->setMinValue(I)V

    .line 96
    iget-object v5, p0, Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference;->frequencyTypeEntries:[Ljava/lang/String;

    array-length v5, v5

    add-int/lit8 v5, v5, -0x1

    invoke-virtual {v1, v5}, Lnet/simonvt/numberpicker/NumberPicker;->setMaxValue(I)V

    .line 97
    iget-object v5, p0, Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference;->frequencyTypeEntries:[Ljava/lang/String;

    invoke-virtual {v1, v5}, Lnet/simonvt/numberpicker/NumberPicker;->setDisplayedValues([Ljava/lang/String;)V

    .line 98
    new-instance v5, Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference$1;

    invoke-direct {v5, p0, v2}, Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference$1;-><init>(Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference;Lnet/simonvt/numberpicker/NumberPicker;)V

    invoke-virtual {v1, v5}, Lnet/simonvt/numberpicker/NumberPicker;->setOnValueChangedListener(Lnet/simonvt/numberpicker/NumberPicker$OnValueChangeListener;)V

    .line 106
    new-instance v5, Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference$2;

    invoke-direct {v5, p0}, Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference$2;-><init>(Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference;)V

    invoke-virtual {v2, v5}, Lnet/simonvt/numberpicker/NumberPicker;->setOnValueChangedListener(Lnet/simonvt/numberpicker/NumberPicker$OnValueChangeListener;)V

    .line 112
    new-instance v5, Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference$3;

    invoke-direct {v5, p0, v1, v2}, Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference$3;-><init>(Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference;Lnet/simonvt/numberpicker/NumberPicker;Lnet/simonvt/numberpicker/NumberPicker;)V

    invoke-virtual {v3, v5}, Landroid/widget/CompoundButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 122
    iget-wide v6, p0, Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference;->frequency:J

    const-wide/16 v8, -0x1

    cmp-long v5, v6, v8

    if-gtz v5, :cond_0

    const/4 v4, 0x1

    :cond_0
    invoke-virtual {v3, v4}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 123
    iget-wide v4, p0, Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference;->frequency:J

    invoke-direct {p0, v1, v2, v4, v5}, Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference;->refreshFrequencyPickers(Lnet/simonvt/numberpicker/NumberPicker;Lnet/simonvt/numberpicker/NumberPicker;J)V

    .line 125
    const v4, 0x104000a

    new-instance v5, Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference$4;

    invoke-direct {v5, p0, v1, v2, v3}, Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference$4;-><init>(Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference;Lnet/simonvt/numberpicker/NumberPicker;Lnet/simonvt/numberpicker/NumberPicker;Landroid/widget/CompoundButton;)V

    invoke-virtual {p1, v4, v5}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 134
    invoke-virtual {p1, v0}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    .line 135
    return-void
.end method

.method public setFrequency(J)V
    .locals 3
    .param p1, "frequency"    # J

    .prologue
    .line 57
    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-ltz v0, :cond_0

    sget-wide v0, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;->MIN_FREQUENCY_MILLIS:J

    cmp-long v0, p1, v0

    if-gez v0, :cond_0

    .line 58
    sget-wide p1, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;->MIN_FREQUENCY_MILLIS:J

    .line 60
    :cond_0
    iget-wide v0, p0, Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference;->frequency:J

    cmp-long v0, v0, p1

    if-eqz v0, :cond_2

    .line 61
    iget-object v0, p0, Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference;->onFrequencySelectedListener:Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference$OnFrequencySelectedListener;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference;->onFrequencySelectedListener:Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference$OnFrequencySelectedListener;

    invoke-interface {v0, p0, p1, p2}, Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference$OnFrequencySelectedListener;->onFrequencySelected(Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference;J)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 62
    :cond_1
    iput-wide p1, p0, Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference;->frequency:J

    .line 65
    :cond_2
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference;->getEntry()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 66
    return-void
.end method

.method public setOnFrequencySelectedListener(Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference$OnFrequencySelectedListener;)V
    .locals 0
    .param p1, "onFrequencySelectedListener"    # Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference$OnFrequencySelectedListener;

    .prologue
    .line 176
    iput-object p1, p0, Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference;->onFrequencySelectedListener:Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference$OnFrequencySelectedListener;

    .line 177
    return-void
.end method
