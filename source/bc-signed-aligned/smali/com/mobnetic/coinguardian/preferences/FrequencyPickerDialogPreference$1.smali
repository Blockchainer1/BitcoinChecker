.class Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference$1;
.super Ljava/lang/Object;
.source "FrequencyPickerDialogPreference.java"

# interfaces
.implements Lnet/simonvt/numberpicker/NumberPicker$OnValueChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;->onBindDialogView(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;


# direct methods
.method constructor <init>(Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;)V
    .locals 0
    .param p1, "this$0"    # Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;

    .prologue
    .line 109
    iput-object p1, p0, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference$1;->this$0:Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;

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
    .line 112
    iget-object v0, p0, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference$1;->this$0:Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;

    invoke-static {v0}, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;->access$000(Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;)Lnet/simonvt/numberpicker/NumberPicker;

    move-result-object v0

    sget-object v1, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;->FREQUENCY_VALUE_MIN:[I

    aget v1, v1, p3

    invoke-virtual {v0, v1}, Lnet/simonvt/numberpicker/NumberPicker;->setMinValue(I)V

    .line 113
    iget-object v0, p0, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference$1;->this$0:Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;

    invoke-static {v0}, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;->access$000(Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;)Lnet/simonvt/numberpicker/NumberPicker;

    move-result-object v0

    sget-object v1, Lcom/mobnetic/coinguardian/preferences/FrequencyPickerDialogPreference;->FREQUENCY_VALUE_MAX:[I

    aget v1, v1, p3

    invoke-virtual {v0, v1}, Lnet/simonvt/numberpicker/NumberPicker;->setMaxValue(I)V

    .line 114
    return-void
.end method
