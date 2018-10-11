.class public Lcom/mobnetic/coinguardian/preferences/NumberPickerPreference;
.super Landroid/preference/DialogPreference;
.source "NumberPickerPreference.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mobnetic/coinguardian/preferences/NumberPickerPreference$SavedState;
    }
.end annotation


# instance fields
.field initialValue:I

.field picker:Lnet/simonvt/numberpicker/NumberPicker;

.field viewValue:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 22
    invoke-direct {p0, p1, p2}, Landroid/preference/DialogPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 24
    const v0, 0x7f030028

    invoke-virtual {p0, v0}, Lcom/mobnetic/coinguardian/preferences/NumberPickerPreference;->setDialogLayoutResource(I)V

    .line 25
    const v0, 0x104000a

    invoke-virtual {p0, v0}, Lcom/mobnetic/coinguardian/preferences/NumberPickerPreference;->setPositiveButtonText(I)V

    .line 26
    const/high16 v0, 0x1040000

    invoke-virtual {p0, v0}, Lcom/mobnetic/coinguardian/preferences/NumberPickerPreference;->setNegativeButtonText(I)V

    .line 27
    return-void
.end method


# virtual methods
.method protected onBindDialogView(Landroid/view/View;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 47
    invoke-super {p0, p1}, Landroid/preference/DialogPreference;->onBindDialogView(Landroid/view/View;)V

    .line 48
    const v0, 0x7f0e008e

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lnet/simonvt/numberpicker/NumberPicker;

    iput-object v0, p0, Lcom/mobnetic/coinguardian/preferences/NumberPickerPreference;->picker:Lnet/simonvt/numberpicker/NumberPicker;

    .line 50
    iget v0, p0, Lcom/mobnetic/coinguardian/preferences/NumberPickerPreference;->viewValue:I

    if-nez v0, :cond_0

    .line 51
    iget v0, p0, Lcom/mobnetic/coinguardian/preferences/NumberPickerPreference;->initialValue:I

    iput v0, p0, Lcom/mobnetic/coinguardian/preferences/NumberPickerPreference;->viewValue:I

    .line 53
    :cond_0
    iget-object v0, p0, Lcom/mobnetic/coinguardian/preferences/NumberPickerPreference;->picker:Lnet/simonvt/numberpicker/NumberPicker;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lnet/simonvt/numberpicker/NumberPicker;->setMinValue(I)V

    .line 54
    iget-object v0, p0, Lcom/mobnetic/coinguardian/preferences/NumberPickerPreference;->picker:Lnet/simonvt/numberpicker/NumberPicker;

    const/16 v1, 0x64

    invoke-virtual {v0, v1}, Lnet/simonvt/numberpicker/NumberPicker;->setMaxValue(I)V

    .line 55
    iget-object v0, p0, Lcom/mobnetic/coinguardian/preferences/NumberPickerPreference;->picker:Lnet/simonvt/numberpicker/NumberPicker;

    iget v1, p0, Lcom/mobnetic/coinguardian/preferences/NumberPickerPreference;->viewValue:I

    invoke-virtual {v0, v1}, Lnet/simonvt/numberpicker/NumberPicker;->setValue(I)V

    .line 56
    return-void
.end method

.method protected onDialogClosed(Z)V
    .locals 2
    .param p1, "positiveResult"    # Z

    .prologue
    .line 60
    invoke-super {p0, p1}, Landroid/preference/DialogPreference;->onDialogClosed(Z)V

    .line 63
    if-eqz p1, :cond_1

    .line 64
    iget-object v1, p0, Lcom/mobnetic/coinguardian/preferences/NumberPickerPreference;->picker:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v1}, Lnet/simonvt/numberpicker/NumberPicker;->getValue()I

    move-result v0

    .line 65
    .local v0, "value":I
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/mobnetic/coinguardian/preferences/NumberPickerPreference;->callChangeListener(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 66
    invoke-virtual {p0, v0}, Lcom/mobnetic/coinguardian/preferences/NumberPickerPreference;->setValue(I)V

    .line 71
    .end local v0    # "value":I
    :cond_0
    :goto_0
    return-void

    .line 69
    :cond_1
    const/4 v1, 0x0

    iput v1, p0, Lcom/mobnetic/coinguardian/preferences/NumberPickerPreference;->viewValue:I

    goto :goto_0
.end method

.method protected onGetDefaultValue(Landroid/content/res/TypedArray;I)Ljava/lang/Object;
    .locals 1
    .param p1, "a"    # Landroid/content/res/TypedArray;
    .param p2, "index"    # I

    .prologue
    .line 36
    const/4 v0, 0x1

    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method protected onPrepareDialogBuilder(Landroid/app/AlertDialog$Builder;)V
    .locals 1
    .param p1, "builder"    # Landroid/app/AlertDialog$Builder;

    .prologue
    .line 41
    invoke-super {p0, p1}, Landroid/preference/DialogPreference;->onPrepareDialogBuilder(Landroid/app/AlertDialog$Builder;)V

    .line 42
    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/app/AlertDialog$Builder;->setInverseBackgroundForced(Z)Landroid/app/AlertDialog$Builder;

    .line 43
    return-void
.end method

.method protected onRestoreInstanceState(Landroid/os/Parcelable;)V
    .locals 3
    .param p1, "state"    # Landroid/os/Parcelable;

    .prologue
    .line 102
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-class v2, Lcom/mobnetic/coinguardian/preferences/NumberPickerPreference$SavedState;

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 104
    :cond_0
    invoke-super {p0, p1}, Landroid/preference/DialogPreference;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 114
    :goto_0
    return-void

    :cond_1
    move-object v0, p1

    .line 109
    check-cast v0, Lcom/mobnetic/coinguardian/preferences/NumberPickerPreference$SavedState;

    .line 110
    .local v0, "myState":Lcom/mobnetic/coinguardian/preferences/NumberPickerPreference$SavedState;
    iget v1, v0, Lcom/mobnetic/coinguardian/preferences/NumberPickerPreference$SavedState;->initialValue:I

    invoke-virtual {p0, v1}, Lcom/mobnetic/coinguardian/preferences/NumberPickerPreference;->setValue(I)V

    .line 111
    iget v1, v0, Lcom/mobnetic/coinguardian/preferences/NumberPickerPreference$SavedState;->viewValue:I

    iput v1, p0, Lcom/mobnetic/coinguardian/preferences/NumberPickerPreference;->viewValue:I

    .line 113
    invoke-virtual {v0}, Lcom/mobnetic/coinguardian/preferences/NumberPickerPreference$SavedState;->getSuperState()Landroid/os/Parcelable;

    move-result-object v1

    invoke-super {p0, v1}, Landroid/preference/DialogPreference;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    goto :goto_0
.end method

.method protected onSaveInstanceState()Landroid/os/Parcelable;
    .locals 3

    .prologue
    .line 88
    invoke-super {p0}, Landroid/preference/DialogPreference;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v1

    .line 92
    .local v1, "superState":Landroid/os/Parcelable;
    new-instance v0, Lcom/mobnetic/coinguardian/preferences/NumberPickerPreference$SavedState;

    invoke-direct {v0, v1}, Lcom/mobnetic/coinguardian/preferences/NumberPickerPreference$SavedState;-><init>(Landroid/os/Parcelable;)V

    .line 93
    .local v0, "myState":Lcom/mobnetic/coinguardian/preferences/NumberPickerPreference$SavedState;
    iget v2, p0, Lcom/mobnetic/coinguardian/preferences/NumberPickerPreference;->initialValue:I

    iput v2, v0, Lcom/mobnetic/coinguardian/preferences/NumberPickerPreference$SavedState;->initialValue:I

    .line 94
    iget-object v2, p0, Lcom/mobnetic/coinguardian/preferences/NumberPickerPreference;->picker:Lnet/simonvt/numberpicker/NumberPicker;

    if-eqz v2, :cond_0

    .line 95
    iget-object v2, p0, Lcom/mobnetic/coinguardian/preferences/NumberPickerPreference;->picker:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v2}, Lnet/simonvt/numberpicker/NumberPicker;->getValue()I

    move-result v2

    iput v2, v0, Lcom/mobnetic/coinguardian/preferences/NumberPickerPreference$SavedState;->viewValue:I

    .line 96
    :cond_0
    return-object v0
.end method

.method protected onSetInitialValue(ZLjava/lang/Object;)V
    .locals 1
    .param p1, "restore"    # Z
    .param p2, "defaultValue"    # Ljava/lang/Object;

    .prologue
    .line 31
    if-eqz p1, :cond_0

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/mobnetic/coinguardian/preferences/NumberPickerPreference;->getPersistedInt(I)I

    move-result v0

    .end local p2    # "defaultValue":Ljava/lang/Object;
    :goto_0
    invoke-virtual {p0, v0}, Lcom/mobnetic/coinguardian/preferences/NumberPickerPreference;->setValue(I)V

    .line 32
    return-void

    .line 31
    .restart local p2    # "defaultValue":Ljava/lang/Object;
    :cond_0
    check-cast p2, Ljava/lang/Integer;

    .end local p2    # "defaultValue":Ljava/lang/Object;
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v0

    goto :goto_0
.end method

.method public setValue(I)V
    .locals 2
    .param p1, "value"    # I

    .prologue
    .line 74
    iput p1, p0, Lcom/mobnetic/coinguardian/preferences/NumberPickerPreference;->viewValue:I

    .line 76
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "%"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mobnetic/coinguardian/preferences/NumberPickerPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 77
    iget v0, p0, Lcom/mobnetic/coinguardian/preferences/NumberPickerPreference;->initialValue:I

    if-eq p1, v0, :cond_0

    .line 78
    iput p1, p0, Lcom/mobnetic/coinguardian/preferences/NumberPickerPreference;->initialValue:I

    .line 79
    invoke-virtual {p0, p1}, Lcom/mobnetic/coinguardian/preferences/NumberPickerPreference;->persistInt(I)Z

    .line 80
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/preferences/NumberPickerPreference;->notifyChanged()V

    .line 82
    :cond_0
    return-void
.end method
