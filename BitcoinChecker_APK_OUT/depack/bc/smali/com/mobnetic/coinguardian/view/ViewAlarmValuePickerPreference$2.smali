.class Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference$2;
.super Ljava/lang/Object;
.source "ViewAlarmValuePickerPreference.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference;->onPrepareDialog(Landroid/app/AlertDialog$Builder;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference;

.field final synthetic val$valueView:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference;Landroid/widget/EditText;)V
    .locals 0
    .param p1, "this$0"    # Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference;

    .prologue
    .line 112
    iput-object p1, p0, Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference$2;->this$0:Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference;

    iput-object p2, p0, Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference$2;->val$valueView:Landroid/widget/EditText;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 114
    iget-object v0, p0, Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference$2;->this$0:Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference;

    invoke-virtual {v0}, Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference$2;->val$valueView:Landroid/widget/EditText;

    invoke-static {v0, v1}, Lcom/mobnetic/coinguardian/util/Utils;->showKeyboard(Landroid/content/Context;Landroid/view/View;)V

    .line 115
    return-void
.end method
