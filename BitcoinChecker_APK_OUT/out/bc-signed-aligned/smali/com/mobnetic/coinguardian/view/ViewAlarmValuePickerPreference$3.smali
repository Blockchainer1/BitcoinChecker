.class Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference$3;
.super Ljava/lang/Object;
.source "ViewAlarmValuePickerPreference.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


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
    .line 118
    iput-object p1, p0, Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference$3;->this$0:Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference;

    iput-object p2, p0, Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference$3;->val$valueView:Landroid/widget/EditText;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 6
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 120
    iget-object v4, p0, Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference$3;->this$0:Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference;

    invoke-virtual {v4}, Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference;->getContext()Landroid/content/Context;

    move-result-object v4

    iget-object v5, p0, Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference$3;->val$valueView:Landroid/widget/EditText;

    invoke-static {v4, v5}, Lcom/mobnetic/coinguardian/util/Utils;->hideKeyboard(Landroid/content/Context;Landroid/view/View;)V

    .line 121
    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    .line 123
    .local v2, "newValue":D
    :try_start_0
    iget-object v4, p0, Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference$3;->val$valueView:Landroid/widget/EditText;

    invoke-virtual {v4}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    .line 124
    .local v1, "valueString":Ljava/lang/String;
    const/16 v4, 0x2c

    const/16 v5, 0x2e

    invoke-virtual {v1, v4, v5}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v1

    .line 125
    invoke-static {v1}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v2

    .line 126
    iget-object v4, p0, Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference$3;->this$0:Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference;

    invoke-static {v4}, Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference;->access$000(Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference;)Lcom/mobnetic/coinguardian/model/CurrencySubunit;

    move-result-object v4

    iget-object v5, p0, Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference$3;->this$0:Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference;

    invoke-static {v5}, Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference;->access$100(Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference;)Lcom/mobnetic/coinguardian/db/content/AlarmRecord;

    move-result-object v5

    invoke-static {v4, v5, v2, v3}, Lcom/mobnetic/coinguardian/util/AlarmRecordHelper;->parseEnteredValueForAlarmType(Lcom/mobnetic/coinguardian/model/CurrencySubunit;Lcom/mobnetic/coinguardian/db/content/AlarmRecord;D)D
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v2

    .line 130
    .end local v1    # "valueString":Ljava/lang/String;
    :goto_0
    iget-object v4, p0, Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference$3;->this$0:Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference;

    invoke-virtual {v4, v2, v3}, Lcom/mobnetic/coinguardian/view/ViewAlarmValuePickerPreference;->setValue(D)V

    .line 131
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 132
    return-void

    .line 127
    :catch_0
    move-exception v0

    .line 128
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method
