.class Lcom/mobnetic/coinguardian/view/generic/ViewNumberPickerPreference$1;
.super Ljava/lang/Object;
.source "ViewNumberPickerPreference.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mobnetic/coinguardian/view/generic/ViewNumberPickerPreference;->onPrepareDialog(Landroid/app/AlertDialog$Builder;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mobnetic/coinguardian/view/generic/ViewNumberPickerPreference;

.field final synthetic val$numberPicker:Lnet/simonvt/numberpicker/NumberPicker;


# direct methods
.method constructor <init>(Lcom/mobnetic/coinguardian/view/generic/ViewNumberPickerPreference;Lnet/simonvt/numberpicker/NumberPicker;)V
    .locals 0
    .param p1, "this$0"    # Lcom/mobnetic/coinguardian/view/generic/ViewNumberPickerPreference;

    .prologue
    .line 62
    iput-object p1, p0, Lcom/mobnetic/coinguardian/view/generic/ViewNumberPickerPreference$1;->this$0:Lcom/mobnetic/coinguardian/view/generic/ViewNumberPickerPreference;

    iput-object p2, p0, Lcom/mobnetic/coinguardian/view/generic/ViewNumberPickerPreference$1;->val$numberPicker:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 64
    iget-object v0, p0, Lcom/mobnetic/coinguardian/view/generic/ViewNumberPickerPreference$1;->val$numberPicker:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v0}, Lnet/simonvt/numberpicker/NumberPicker;->clearFocus()V

    .line 65
    iget-object v0, p0, Lcom/mobnetic/coinguardian/view/generic/ViewNumberPickerPreference$1;->this$0:Lcom/mobnetic/coinguardian/view/generic/ViewNumberPickerPreference;

    iget-object v1, p0, Lcom/mobnetic/coinguardian/view/generic/ViewNumberPickerPreference$1;->val$numberPicker:Lnet/simonvt/numberpicker/NumberPicker;

    invoke-virtual {v1}, Lnet/simonvt/numberpicker/NumberPicker;->getValue()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/mobnetic/coinguardian/view/generic/ViewNumberPickerPreference;->setValue(I)V

    .line 66
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 67
    return-void
.end method
