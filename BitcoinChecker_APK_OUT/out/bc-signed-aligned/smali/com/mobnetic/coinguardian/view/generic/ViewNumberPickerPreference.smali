.class public Lcom/mobnetic/coinguardian/view/generic/ViewNumberPickerPreference;
.super Lcom/mobnetic/coinguardian/view/generic/ViewDialogPreference;
.source "ViewNumberPickerPreference.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mobnetic/coinguardian/view/generic/ViewNumberPickerPreference$OnValueChangedListener;
    }
.end annotation


# instance fields
.field private onValueSelectedListener:Lcom/mobnetic/coinguardian/view/generic/ViewNumberPickerPreference$OnValueChangedListener;

.field private value:I

.field private valueSufix:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 22
    invoke-direct {p0, p1}, Lcom/mobnetic/coinguardian/view/generic/ViewDialogPreference;-><init>(Landroid/content/Context;)V

    .line 17
    const/4 v0, -0x1

    iput v0, p0, Lcom/mobnetic/coinguardian/view/generic/ViewNumberPickerPreference;->value:I

    .line 23
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 26
    invoke-direct {p0, p1, p2}, Lcom/mobnetic/coinguardian/view/generic/ViewDialogPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 17
    const/4 v0, -0x1

    iput v0, p0, Lcom/mobnetic/coinguardian/view/generic/ViewNumberPickerPreference;->value:I

    .line 27
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .prologue
    .line 31
    invoke-direct {p0, p1, p2, p3}, Lcom/mobnetic/coinguardian/view/generic/ViewDialogPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 17
    const/4 v0, -0x1

    iput v0, p0, Lcom/mobnetic/coinguardian/view/generic/ViewNumberPickerPreference;->value:I

    .line 32
    return-void
.end method


# virtual methods
.method public bridge synthetic getEntry()Ljava/lang/CharSequence;
    .locals 1

    .prologue
    .line 15
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/view/generic/ViewNumberPickerPreference;->getEntry()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getEntry()Ljava/lang/String;
    .locals 2

    .prologue
    .line 35
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/view/generic/ViewNumberPickerPreference;->getValue()I

    move-result v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v0, p0, Lcom/mobnetic/coinguardian/view/generic/ViewNumberPickerPreference;->valueSufix:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mobnetic/coinguardian/view/generic/ViewNumberPickerPreference;->valueSufix:Ljava/lang/String;

    :goto_0
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    const-string v0, ""

    goto :goto_0
.end method

.method public getValue()I
    .locals 1

    .prologue
    .line 47
    iget v0, p0, Lcom/mobnetic/coinguardian/view/generic/ViewNumberPickerPreference;->value:I

    return v0
.end method

.method protected onPrepareDialog(Landroid/app/AlertDialog$Builder;)V
    .locals 5
    .param p1, "builder"    # Landroid/app/AlertDialog$Builder;

    .prologue
    .line 56
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/view/generic/ViewNumberPickerPreference;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v2

    const v3, 0x7f030028

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    .line 57
    .local v1, "view":Landroid/view/View;
    const v2, 0x7f0e008e

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lnet/simonvt/numberpicker/NumberPicker;

    .line 58
    .local v0, "numberPicker":Lnet/simonvt/numberpicker/NumberPicker;
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Lnet/simonvt/numberpicker/NumberPicker;->setMinValue(I)V

    .line 59
    const/16 v2, 0x64

    invoke-virtual {v0, v2}, Lnet/simonvt/numberpicker/NumberPicker;->setMaxValue(I)V

    .line 60
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/view/generic/ViewNumberPickerPreference;->getValue()I

    move-result v2

    invoke-virtual {v0, v2}, Lnet/simonvt/numberpicker/NumberPicker;->setValue(I)V

    .line 62
    const v2, 0x104000a

    new-instance v3, Lcom/mobnetic/coinguardian/view/generic/ViewNumberPickerPreference$1;

    invoke-direct {v3, p0, v0}, Lcom/mobnetic/coinguardian/view/generic/ViewNumberPickerPreference$1;-><init>(Lcom/mobnetic/coinguardian/view/generic/ViewNumberPickerPreference;Lnet/simonvt/numberpicker/NumberPicker;)V

    invoke-virtual {p1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 70
    invoke-virtual {p1, v1}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    .line 71
    return-void
.end method

.method public setOnValueChangedListener(Lcom/mobnetic/coinguardian/view/generic/ViewNumberPickerPreference$OnValueChangedListener;)V
    .locals 0
    .param p1, "onValueSelectedListener"    # Lcom/mobnetic/coinguardian/view/generic/ViewNumberPickerPreference$OnValueChangedListener;

    .prologue
    .line 82
    iput-object p1, p0, Lcom/mobnetic/coinguardian/view/generic/ViewNumberPickerPreference;->onValueSelectedListener:Lcom/mobnetic/coinguardian/view/generic/ViewNumberPickerPreference$OnValueChangedListener;

    .line 83
    return-void
.end method

.method public setValue(I)V
    .locals 1
    .param p1, "value"    # I

    .prologue
    .line 39
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/view/generic/ViewNumberPickerPreference;->getValue()I

    move-result v0

    if-eq v0, p1, :cond_1

    .line 40
    iget-object v0, p0, Lcom/mobnetic/coinguardian/view/generic/ViewNumberPickerPreference;->onValueSelectedListener:Lcom/mobnetic/coinguardian/view/generic/ViewNumberPickerPreference$OnValueChangedListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mobnetic/coinguardian/view/generic/ViewNumberPickerPreference;->onValueSelectedListener:Lcom/mobnetic/coinguardian/view/generic/ViewNumberPickerPreference$OnValueChangedListener;

    invoke-interface {v0, p0, p1}, Lcom/mobnetic/coinguardian/view/generic/ViewNumberPickerPreference$OnValueChangedListener;->onValueChanged(Lcom/mobnetic/coinguardian/view/generic/ViewNumberPickerPreference;I)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 41
    :cond_0
    iput p1, p0, Lcom/mobnetic/coinguardian/view/generic/ViewNumberPickerPreference;->value:I

    .line 44
    :cond_1
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/view/generic/ViewNumberPickerPreference;->getEntry()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mobnetic/coinguardian/view/generic/ViewNumberPickerPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 45
    return-void
.end method

.method public setValueSufix(Ljava/lang/String;)V
    .locals 0
    .param p1, "valueSufix"    # Ljava/lang/String;

    .prologue
    .line 51
    iput-object p1, p0, Lcom/mobnetic/coinguardian/view/generic/ViewNumberPickerPreference;->valueSufix:Ljava/lang/String;

    .line 52
    return-void
.end method
