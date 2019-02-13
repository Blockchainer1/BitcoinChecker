.class Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference$4;
.super Ljava/lang/Object;
.source "ViewFrequencyPickerPreference.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


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

.field final synthetic val$useGlobalFrequencyCheckBox:Landroid/widget/CompoundButton;


# direct methods
.method constructor <init>(Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference;Lnet/simonvt/numberpicker/NumberPicker;Lnet/simonvt/numberpicker/NumberPicker;Landroid/widget/CompoundButton;)V
    .locals 0
    .param p1, "this$0"    # Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference;

    .prologue
    .line 125
    iput-object p1, p0, Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference$4;->this$0:Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference;

    iput-object p2, p0, Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference$4;->val$frequencyTypePicker:Lnet/simonvt/numberpicker/NumberPicker;

    iput-object p3, p0, Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference$4;->val$frequencyValuePicker:Lnet/simonvt/numberpicker/NumberPicker;

    iput-object p4, p0, Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference$4;->val$useGlobalFrequencyCheckBox:Landroid/widget/CompoundButton;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 5
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 127
    iget-object v2, p0, Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference$4;->val$frequencyTypePicker:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v2}, Lnet/simonvt/numberpicker/NumberPicker;->clearFocus()V

    .line 128
    iget-object v2, p0, Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference$4;->val$frequencyValuePicker:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v2}, Lnet/simonvt/numberpicker/NumberPicker;->clearFocus()V

    .line 129
    iget-object v2, p0, Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference$4;->val$useGlobalFrequencyCheckBox:Landroid/widget/CompoundButton;

    invoke-virtual {v2}, Landroid/widget/CompoundButton;->isChecked()Z

    move-result v2

    if-eqz v2, :cond_0

    const-wide/16 v0, -0x1

    .line 130
    .local v0, "newFrequency":J
    :goto_0
    iget-object v2, p0, Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference$4;->this$0:Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference;

    invoke-virtual {v2, v0, v1}, Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference;->setFrequency(J)V

    .line 131
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 132
    return-void

    .line 129
    .end local v0    # "newFrequency":J
    :cond_0
    iget-object v2, p0, Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference$4;->this$0:Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference;

    iget-object v3, p0, Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference$4;->val$frequencyTypePicker:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v3}, Lnet/simonvt/numberpicker/NumberPicker;->getValue()I

    move-result v3

    iget-object v4, p0, Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference$4;->val$frequencyValuePicker:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v4}, Lnet/simonvt/numberpicker/NumberPicker;->getValue()I

    move-result v4

    invoke-static {v2, v3, v4}, Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference;->access$100(Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference;II)J

    move-result-wide v0

    goto :goto_0
.end method
