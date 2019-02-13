.class Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference$1;
.super Ljava/lang/Object;
.source "ViewFrequencyPickerPreference.java"

# interfaces
.implements Lnet/simonvt/numberpicker/NumberPicker$OnValueChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference;->onPrepareDialog(Landroid/app/AlertDialog$Builder;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference;

.field final synthetic val$frequencyValuePicker:Lnet/simonvt/numberpicker/NumberPicker;


# direct methods
.method constructor <init>(Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference;Lnet/simonvt/numberpicker/NumberPicker;)V
    .locals 0
    .param p1, "this$0"    # Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference;

    .prologue
    .line 98
    iput-object p1, p0, Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference$1;->this$0:Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference;

    iput-object p2, p0, Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference$1;->val$frequencyValuePicker:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onValueChange(Lnet/simonvt/numberpicker/NumberPicker;II)V
    .locals 2
    .param p1, "np"    # Lnet/simonvt/numberpicker/NumberPicker;
    .param p2, "oldVal"    # I
    .param p3, "newVal"    # I

    .prologue
    .line 101
    iget-object v0, p0, Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference$1;->val$frequencyValuePicker:Lnet/simonvt/numberpicker/NumberPicker;

    sget-object v1, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;->FREQUENCY_VALUE_MIN:[I

    aget v1, v1, p3

    invoke-virtual {v0, v1}, Lnet/simonvt/numberpicker/NumberPicker;->setMinValue(I)V

    .line 102
    iget-object v0, p0, Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference$1;->val$frequencyValuePicker:Lnet/simonvt/numberpicker/NumberPicker;

    sget-object v1, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;->FREQUENCY_VALUE_MAX:[I

    aget v1, v1, p3

    invoke-virtual {v0, v1}, Lnet/simonvt/numberpicker/NumberPicker;->setMaxValue(I)V

    .line 103
    return-void
.end method
