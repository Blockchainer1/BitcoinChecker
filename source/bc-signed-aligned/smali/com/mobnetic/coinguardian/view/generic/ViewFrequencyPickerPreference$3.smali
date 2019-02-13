.class Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference$3;
.super Ljava/lang/Object;
.source "ViewFrequencyPickerPreference.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


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

.field final synthetic val$frequencyTypePicker:Lnet/simonvt/numberpicker/NumberPicker;

.field final synthetic val$frequencyValuePicker:Lnet/simonvt/numberpicker/NumberPicker;


# direct methods
.method constructor <init>(Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference;Lnet/simonvt/numberpicker/NumberPicker;Lnet/simonvt/numberpicker/NumberPicker;)V
    .locals 0
    .param p1, "this$0"    # Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference;

    .prologue
    .line 112
    iput-object p1, p0, Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference$3;->this$0:Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference;

    iput-object p2, p0, Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference$3;->val$frequencyTypePicker:Lnet/simonvt/numberpicker/NumberPicker;

    iput-object p3, p0, Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference$3;->val$frequencyValuePicker:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 8
    .param p1, "buttonView"    # Landroid/widget/CompoundButton;
    .param p2, "isChecked"    # Z

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 114
    iget-object v0, p0, Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference$3;->this$0:Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference;

    iget-object v3, p0, Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference$3;->val$frequencyTypePicker:Lnet/simonvt/numberpicker/NumberPicker;

    iget-object v4, p0, Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference$3;->val$frequencyValuePicker:Lnet/simonvt/numberpicker/NumberPicker;

    const-wide/16 v6, -0x1

    invoke-static {v0, v3, v4, v6, v7}, Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference;->access$000(Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference;Lnet/simonvt/numberpicker/NumberPicker;Lnet/simonvt/numberpicker/NumberPicker;J)V

    .line 116
    iget-object v3, p0, Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference$3;->val$frequencyTypePicker:Lnet/simonvt/numberpicker/NumberPicker;

    if-nez p2, :cond_0

    move v0, v1

    :goto_0
    invoke-virtual {v3, v0}, Lnet/simonvt/numberpicker/NumberPicker;->setEnabled(Z)V

    .line 117
    iget-object v0, p0, Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference$3;->val$frequencyValuePicker:Lnet/simonvt/numberpicker/NumberPicker;

    if-nez p2, :cond_1

    :goto_1
    invoke-virtual {v0, v1}, Lnet/simonvt/numberpicker/NumberPicker;->setEnabled(Z)V

    .line 118
    iget-object v0, p0, Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference$3;->val$frequencyTypePicker:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v0}, Lnet/simonvt/numberpicker/NumberPicker;->clearFocus()V

    .line 119
    iget-object v0, p0, Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference$3;->val$frequencyValuePicker:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v0}, Lnet/simonvt/numberpicker/NumberPicker;->clearFocus()V

    .line 120
    return-void

    :cond_0
    move v0, v2

    .line 116
    goto :goto_0

    :cond_1
    move v1, v2

    .line 117
    goto :goto_1
.end method
