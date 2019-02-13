.class Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference$2;
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


# direct methods
.method constructor <init>(Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference;)V
    .locals 0
    .param p1, "this$0"    # Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference;

    .prologue
    .line 106
    iput-object p1, p0, Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference$2;->this$0:Lcom/mobnetic/coinguardian/view/generic/ViewFrequencyPickerPreference;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onValueChange(Lnet/simonvt/numberpicker/NumberPicker;II)V
    .locals 0
    .param p1, "np"    # Lnet/simonvt/numberpicker/NumberPicker;
    .param p2, "oldVal"    # I
    .param p3, "newVal"    # I

    .prologue
    .line 109
    return-void
.end method
