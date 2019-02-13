.class Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference$1;
.super Ljava/lang/Object;
.source "ViewAlarmCheckPointPreference.java"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;->onPrepareDialog(Landroid/app/AlertDialog$Builder;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field selectionEnd:I

.field selectionStart:I

.field final synthetic this$0:Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;

.field final synthetic val$valueView:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;Landroid/widget/EditText;)V
    .locals 0
    .param p1, "this$0"    # Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;

    .prologue
    .line 113
    iput-object p1, p0, Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference$1;->this$0:Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;

    iput-object p2, p0, Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference$1;->val$valueView:Landroid/widget/EditText;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 3
    .param p1, "s"    # Landroid/text/Editable;

    .prologue
    .line 127
    iget-object v0, p0, Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference$1;->val$valueView:Landroid/widget/EditText;

    iget v1, p0, Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference$1;->selectionStart:I

    iget v2, p0, Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference$1;->selectionEnd:I

    invoke-virtual {v0, v1, v2}, Landroid/widget/EditText;->setSelection(II)V

    .line 128
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "count"    # I
    .param p4, "after"    # I

    .prologue
    .line 125
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 4
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "before"    # I
    .param p4, "count"    # I

    .prologue
    .line 117
    iget-object v0, p0, Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference$1;->val$valueView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getSelectionStart()I

    move-result v0

    iput v0, p0, Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference$1;->selectionStart:I

    .line 118
    iget-object v0, p0, Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference$1;->val$valueView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getSelectionEnd()I

    move-result v0

    iput v0, p0, Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference$1;->selectionEnd:I

    .line 119
    iget-object v0, p0, Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference$1;->val$valueView:Landroid/widget/EditText;

    invoke-virtual {v0, p0}, Landroid/widget/EditText;->removeTextChangedListener(Landroid/text/TextWatcher;)V

    .line 120
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 121
    iget-object v0, p0, Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference$1;->val$valueView:Landroid/widget/EditText;

    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x2c

    const/16 v3, 0x2e

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 122
    :cond_0
    iget-object v0, p0, Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference$1;->val$valueView:Landroid/widget/EditText;

    invoke-virtual {v0, p0}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 123
    return-void
.end method
