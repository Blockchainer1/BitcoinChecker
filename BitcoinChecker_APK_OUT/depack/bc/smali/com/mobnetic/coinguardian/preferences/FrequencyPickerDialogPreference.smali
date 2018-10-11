.class public Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;
.super Landroid/preference/DialogPreference;
.source "FrequencyPickerDialogPreference.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference$SavedState;
    }
.end annotation


# static fields
.field public static final DEFAULT_FREQUENCY_MILLIS:J = 0x927c0L

.field public static final FREQUENCY_TYPE_MULTIPLAYERS:[J

.field public static final FREQUENCY_TYPE_NAMES:[I

.field public static final FREQUENCY_TYPE_PLURALS:[I

.field public static final FREQUENCY_VALUE_MAX:[I

.field public static final FREQUENCY_VALUE_MIN:[I

.field public static final MIN_FREQUENCY_MILLIS:J


# instance fields
.field private baseFrequencyMillis:J

.field private frequencyTypeEntries:[Ljava/lang/String;

.field private frequencyTypePicker:Lnet/simonvt/numberpicker/NumberPicker;

.field private frequencyValuePicker:Lnet/simonvt/numberpicker/NumberPicker;

.field private viewFrequencyMillis:J


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    const/4 v1, 0x4

    .line 25
    new-array v0, v1, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;->FREQUENCY_TYPE_NAMES:[I

    .line 32
    new-array v0, v1, [I

    fill-array-data v0, :array_1

    sput-object v0, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;->FREQUENCY_TYPE_PLURALS:[I

    .line 39
    new-array v0, v1, [J

    fill-array-data v0, :array_2

    sput-object v0, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;->FREQUENCY_TYPE_MULTIPLAYERS:[J

    .line 45
    new-array v0, v1, [I

    fill-array-data v0, :array_3

    sput-object v0, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;->FREQUENCY_VALUE_MIN:[I

    .line 51
    new-array v0, v1, [I

    fill-array-data v0, :array_4

    sput-object v0, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;->FREQUENCY_VALUE_MAX:[I

    .line 58
    sget-object v0, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;->FREQUENCY_VALUE_MIN:[I

    aget v0, v0, v3

    int-to-long v0, v0

    sget-object v2, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;->FREQUENCY_TYPE_MULTIPLAYERS:[J

    aget-wide v2, v2, v3

    mul-long/2addr v0, v2

    sput-wide v0, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;->MIN_FREQUENCY_MILLIS:J

    return-void

    .line 25
    :array_0
    .array-data 4
        0x7f07010d
        0x7f07010a
        0x7f070107
        0x7f070105
    .end array-data

    .line 32
    :array_1
    .array-data 4
        0x7f0f0004
        0x7f0f0002
        0x7f0f0001
        0x7f0f0000
    .end array-data

    .line 39
    :array_2
    .array-data 8
        0x3e8
        0xea60
        0x36ee80
        0x5265c00
    .end array-data

    .line 45
    :array_3
    .array-data 4
        0x5
        0x1
        0x1
        0x1
    .end array-data

    .line 51
    :array_4
    .array-data 4
        0x3b
        0x3b
        0x17
        0x16d
    .end array-data
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 62
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 63
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 66
    invoke-direct {p0, p1, p2}, Landroid/preference/DialogPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 68
    const/4 v1, 0x4

    new-array v1, v1, [Ljava/lang/String;

    iput-object v1, p0, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;->frequencyTypeEntries:[Ljava/lang/String;

    .line 69
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    sget-object v1, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;->FREQUENCY_TYPE_NAMES:[I

    array-length v1, v1

    if-ge v0, v1, :cond_0

    .line 70
    iget-object v1, p0, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;->frequencyTypeEntries:[Ljava/lang/String;

    sget-object v2, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;->FREQUENCY_TYPE_NAMES:[I

    aget v2, v2, v0

    invoke-virtual {p1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v0

    .line 69
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 73
    :cond_0
    const v1, 0x7f030025

    invoke-virtual {p0, v1}, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;->setDialogLayoutResource(I)V

    .line 74
    const v1, 0x104000a

    invoke-virtual {p0, v1}, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;->setPositiveButtonText(I)V

    .line 75
    const/high16 v1, 0x1040000

    invoke-virtual {p0, v1}, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;->setNegativeButtonText(I)V

    .line 76
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;->setDialogIcon(Landroid/graphics/drawable/Drawable;)V

    .line 78
    const-wide/32 v2, 0x927c0

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;->setDefaultValue(Ljava/lang/Object;)V

    .line 79
    return-void
.end method

.method static synthetic access$000(Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;)Lnet/simonvt/numberpicker/NumberPicker;
    .locals 1
    .param p0, "x0"    # Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;

    .prologue
    .line 17
    iget-object v0, p0, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;->frequencyValuePicker:Lnet/simonvt/numberpicker/NumberPicker;

    return-object v0
.end method

.method private getFrequencyMillis()J
    .locals 2

    .prologue
    .line 181
    iget-wide v0, p0, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;->baseFrequencyMillis:J

    return-wide v0
.end method

.method private getFrequencyMillis(II)J
    .locals 4
    .param p1, "frequencyTypeId"    # I
    .param p2, "frequencyValue"    # I

    .prologue
    .line 134
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
    .line 138
    sget-object v1, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;->FREQUENCY_TYPE_MULTIPLAYERS:[J

    array-length v1, v1

    add-int/lit8 v0, v1, -0x1

    .local v0, "i":I
    :goto_0
    if-ltz v0, :cond_1

    .line 139
    sget-object v1, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;->FREQUENCY_TYPE_MULTIPLAYERS:[J

    aget-wide v2, v1, v0

    sget-object v1, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;->FREQUENCY_VALUE_MIN:[I

    const/4 v4, 0x1

    aget v1, v1, v4

    int-to-long v4, v1

    mul-long/2addr v2, v4

    cmp-long v1, p1, v2

    if-ltz v1, :cond_0

    .line 142
    .end local v0    # "i":I
    :goto_1
    return v0

    .line 138
    .restart local v0    # "i":I
    :cond_0
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 142
    :cond_1
    const/4 v0, 0x0

    goto :goto_1
.end method

.method private parseFrequencyValue(JI)I
    .locals 3
    .param p1, "frequencyMillis"    # J
    .param p3, "frequencyTypeId"    # I

    .prologue
    .line 146
    sget-object v0, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;->FREQUENCY_TYPE_MULTIPLAYERS:[J

    aget-wide v0, v0, p3

    div-long v0, p1, v0

    long-to-int v0, v0

    return v0
.end method


# virtual methods
.method protected onBindDialogView(Landroid/view/View;)V
    .locals 6
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 100
    invoke-super {p0, p1}, Landroid/preference/DialogPreference;->onBindDialogView(Landroid/view/View;)V

    .line 102
    const v1, 0x7f0e0085

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lnet/simonvt/numberpicker/NumberPicker;

    iput-object v1, p0, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;->frequencyTypePicker:Lnet/simonvt/numberpicker/NumberPicker;

    .line 103
    const v1, 0x7f0e0084

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lnet/simonvt/numberpicker/NumberPicker;

    iput-object v1, p0, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;->frequencyValuePicker:Lnet/simonvt/numberpicker/NumberPicker;

    .line 104
    const v1, 0x7f0e0086

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 106
    iget-object v1, p0, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;->frequencyTypePicker:Lnet/simonvt/numberpicker/NumberPicker;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lnet/simonvt/numberpicker/NumberPicker;->setMinValue(I)V

    .line 107
    iget-object v1, p0, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;->frequencyTypePicker:Lnet/simonvt/numberpicker/NumberPicker;

    iget-object v2, p0, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;->frequencyTypeEntries:[Ljava/lang/String;

    array-length v2, v2

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v1, v2}, Lnet/simonvt/numberpicker/NumberPicker;->setMaxValue(I)V

    .line 108
    iget-object v1, p0, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;->frequencyTypePicker:Lnet/simonvt/numberpicker/NumberPicker;

    iget-object v2, p0, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;->frequencyTypeEntries:[Ljava/lang/String;

    invoke-virtual {v1, v2}, Lnet/simonvt/numberpicker/NumberPicker;->setDisplayedValues([Ljava/lang/String;)V

    .line 109
    iget-object v1, p0, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;->frequencyTypePicker:Lnet/simonvt/numberpicker/NumberPicker;

    new-instance v2, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference$1;

    invoke-direct {v2, p0}, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference$1;-><init>(Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;)V

    invoke-virtual {v1, v2}, Lnet/simonvt/numberpicker/NumberPicker;->setOnValueChangedListener(Lnet/simonvt/numberpicker/NumberPicker$OnValueChangeListener;)V

    .line 117
    iget-object v1, p0, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;->frequencyValuePicker:Lnet/simonvt/numberpicker/NumberPicker;

    new-instance v2, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference$2;

    invoke-direct {v2, p0}, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference$2;-><init>(Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;)V

    invoke-virtual {v1, v2}, Lnet/simonvt/numberpicker/NumberPicker;->setOnValueChangedListener(Lnet/simonvt/numberpicker/NumberPicker$OnValueChangeListener;)V

    .line 123
    iget-wide v2, p0, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;->viewFrequencyMillis:J

    const-wide/16 v4, 0x0

    cmp-long v1, v2, v4

    if-gez v1, :cond_0

    .line 124
    iget-wide v2, p0, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;->baseFrequencyMillis:J

    iput-wide v2, p0, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;->viewFrequencyMillis:J

    .line 126
    :cond_0
    iget-wide v2, p0, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;->viewFrequencyMillis:J

    invoke-direct {p0, v2, v3}, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;->parseFrequencyTypeId(J)I

    move-result v0

    .line 127
    .local v0, "frequencyTypeId":I
    iget-object v1, p0, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;->frequencyTypePicker:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v1, v0}, Lnet/simonvt/numberpicker/NumberPicker;->setValue(I)V

    .line 128
    iget-object v1, p0, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;->frequencyValuePicker:Lnet/simonvt/numberpicker/NumberPicker;

    sget-object v2, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;->FREQUENCY_VALUE_MIN:[I

    iget-object v3, p0, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;->frequencyTypePicker:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v3}, Lnet/simonvt/numberpicker/NumberPicker;->getValue()I

    move-result v3

    aget v2, v2, v3

    invoke-virtual {v1, v2}, Lnet/simonvt/numberpicker/NumberPicker;->setMinValue(I)V

    .line 129
    iget-object v1, p0, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;->frequencyValuePicker:Lnet/simonvt/numberpicker/NumberPicker;

    sget-object v2, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;->FREQUENCY_VALUE_MAX:[I

    iget-object v3, p0, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;->frequencyTypePicker:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v3}, Lnet/simonvt/numberpicker/NumberPicker;->getValue()I

    move-result v3

    aget v2, v2, v3

    invoke-virtual {v1, v2}, Lnet/simonvt/numberpicker/NumberPicker;->setMaxValue(I)V

    .line 130
    iget-object v1, p0, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;->frequencyValuePicker:Lnet/simonvt/numberpicker/NumberPicker;

    iget-wide v2, p0, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;->viewFrequencyMillis:J

    invoke-direct {p0, v2, v3, v0}, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;->parseFrequencyValue(JI)I

    move-result v2

    invoke-virtual {v1, v2}, Lnet/simonvt/numberpicker/NumberPicker;->setValue(I)V

    .line 131
    return-void
.end method

.method protected onDialogClosed(Z)V
    .locals 4
    .param p1, "positiveResult"    # Z

    .prologue
    .line 151
    invoke-super {p0, p1}, Landroid/preference/DialogPreference;->onDialogClosed(Z)V

    .line 154
    if-eqz p1, :cond_1

    .line 155
    iget-object v2, p0, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;->frequencyTypePicker:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v2}, Lnet/simonvt/numberpicker/NumberPicker;->getValue()I

    move-result v2

    iget-object v3, p0, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;->frequencyValuePicker:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v3}, Lnet/simonvt/numberpicker/NumberPicker;->getValue()I

    move-result v3

    invoke-direct {p0, v2, v3}, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;->getFrequencyMillis(II)J

    move-result-wide v0

    .line 156
    .local v0, "frequencyMillis":J
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;->callChangeListener(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 157
    invoke-virtual {p0, v0, v1}, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;->setFrequencyMillis(J)V

    .line 162
    .end local v0    # "frequencyMillis":J
    :cond_0
    :goto_0
    return-void

    .line 160
    :cond_1
    const-wide/16 v2, -0x1

    iput-wide v2, p0, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;->viewFrequencyMillis:J

    goto :goto_0
.end method

.method protected onGetDefaultValue(Landroid/content/res/TypedArray;I)Ljava/lang/Object;
    .locals 2
    .param p1, "a"    # Landroid/content/res/TypedArray;
    .param p2, "index"    # I

    .prologue
    .line 88
    const-wide/32 v0, 0x927c0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    return-object v0
.end method

.method protected onPrepareDialogBuilder(Landroid/app/AlertDialog$Builder;)V
    .locals 1
    .param p1, "builder"    # Landroid/app/AlertDialog$Builder;

    .prologue
    .line 94
    invoke-super {p0, p1}, Landroid/preference/DialogPreference;->onPrepareDialogBuilder(Landroid/app/AlertDialog$Builder;)V

    .line 95
    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/app/AlertDialog$Builder;->setInverseBackgroundForced(Z)Landroid/app/AlertDialog$Builder;

    .line 96
    return-void
.end method

.method protected onRestoreInstanceState(Landroid/os/Parcelable;)V
    .locals 4
    .param p1, "state"    # Landroid/os/Parcelable;

    .prologue
    .line 204
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-class v2, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference$SavedState;

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 206
    :cond_0
    invoke-super {p0, p1}, Landroid/preference/DialogPreference;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 216
    :goto_0
    return-void

    :cond_1
    move-object v0, p1

    .line 211
    check-cast v0, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference$SavedState;

    .line 212
    .local v0, "myState":Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference$SavedState;
    iget-wide v2, v0, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference$SavedState;->baseFrequencyMillis:J

    invoke-virtual {p0, v2, v3}, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;->setFrequencyMillis(J)V

    .line 213
    iget-wide v2, v0, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference$SavedState;->viewFrequencyMillis:J

    iput-wide v2, p0, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;->viewFrequencyMillis:J

    .line 215
    invoke-virtual {v0}, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference$SavedState;->getSuperState()Landroid/os/Parcelable;

    move-result-object v1

    invoke-super {p0, v1}, Landroid/preference/DialogPreference;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    goto :goto_0
.end method

.method protected onSaveInstanceState()Landroid/os/Parcelable;
    .locals 4

    .prologue
    .line 189
    invoke-super {p0}, Landroid/preference/DialogPreference;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v1

    .line 193
    .local v1, "superState":Landroid/os/Parcelable;
    new-instance v0, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference$SavedState;

    invoke-direct {v0, v1}, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference$SavedState;-><init>(Landroid/os/Parcelable;)V

    .line 194
    .local v0, "myState":Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference$SavedState;
    invoke-direct {p0}, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;->getFrequencyMillis()J

    move-result-wide v2

    iput-wide v2, v0, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference$SavedState;->baseFrequencyMillis:J

    .line 195
    iget-object v2, p0, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;->frequencyTypePicker:Lnet/simonvt/numberpicker/NumberPicker;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;->frequencyValuePicker:Lnet/simonvt/numberpicker/NumberPicker;

    if-eqz v2, :cond_0

    .line 196
    iget-object v2, p0, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;->frequencyTypePicker:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v2}, Lnet/simonvt/numberpicker/NumberPicker;->getValue()I

    move-result v2

    iget-object v3, p0, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;->frequencyValuePicker:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v3}, Lnet/simonvt/numberpicker/NumberPicker;->getValue()I

    move-result v3

    invoke-direct {p0, v2, v3}, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;->getFrequencyMillis(II)J

    move-result-wide v2

    iput-wide v2, v0, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference$SavedState;->viewFrequencyMillis:J

    .line 198
    :cond_0
    return-object v0
.end method

.method protected onSetInitialValue(ZLjava/lang/Object;)V
    .locals 2
    .param p1, "restore"    # Z
    .param p2, "defaultValue"    # Ljava/lang/Object;

    .prologue
    .line 83
    if-eqz p1, :cond_0

    const-wide/32 v0, 0x927c0

    invoke-virtual {p0, v0, v1}, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;->getPersistedLong(J)J

    move-result-wide v0

    .end local p2    # "defaultValue":Ljava/lang/Object;
    :goto_0
    invoke-virtual {p0, v0, v1}, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;->setFrequencyMillis(J)V

    .line 84
    return-void

    .line 83
    .restart local p2    # "defaultValue":Ljava/lang/Object;
    :cond_0
    check-cast p2, Ljava/lang/Long;

    .end local p2    # "defaultValue":Ljava/lang/Object;
    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    goto :goto_0
.end method

.method public setFrequencyMillis(J)V
    .locals 7
    .param p1, "frequencyMillis"    # J

    .prologue
    .line 165
    sget-wide v2, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;->MIN_FREQUENCY_MILLIS:J

    cmp-long v2, p1, v2

    if-gez v2, :cond_0

    .line 166
    sget-wide p1, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;->MIN_FREQUENCY_MILLIS:J

    .line 168
    :cond_0
    iput-wide p1, p0, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;->viewFrequencyMillis:J

    .line 170
    invoke-direct {p0, p1, p2}, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;->parseFrequencyTypeId(J)I

    move-result v0

    .line 171
    .local v0, "frequencyTypeId":I
    invoke-direct {p0, p1, p2, v0}, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;->parseFrequencyValue(JI)I

    move-result v1

    .line 172
    .local v1, "frequencyValue":I
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    sget-object v3, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;->FREQUENCY_TYPE_PLURALS:[I

    aget v3, v3, v0

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-virtual {v2, v3, v1, v4}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 173
    iget-wide v2, p0, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;->baseFrequencyMillis:J

    cmp-long v2, p1, v2

    if-eqz v2, :cond_1

    .line 174
    iput-wide p1, p0, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;->baseFrequencyMillis:J

    .line 175
    invoke-virtual {p0, p1, p2}, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;->persistLong(J)Z

    .line 176
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;->notifyChanged()V

    .line 178
    :cond_1
    return-void
.end method
