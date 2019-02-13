.class Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference$4;
.super Ljava/lang/Object;
.source "ViewAlarmCheckPointPreference.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;->onPrepareDialog(Landroid/app/AlertDialog$Builder;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;

.field final synthetic val$valueView:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;Landroid/widget/EditText;)V
    .locals 0
    .param p1, "this$0"    # Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;

    .prologue
    .line 164
    iput-object p1, p0, Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference$4;->this$0:Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;

    iput-object p2, p0, Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference$4;->val$valueView:Landroid/widget/EditText;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 8
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 166
    iget-object v4, p0, Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference$4;->this$0:Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;

    invoke-virtual {v4}, Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;->getContext()Landroid/content/Context;

    move-result-object v4

    iget-object v5, p0, Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference$4;->val$valueView:Landroid/widget/EditText;

    invoke-static {v4, v5}, Lcom/mobnetic/coinguardian/util/Utils;->hideKeyboard(Landroid/content/Context;Landroid/view/View;)V

    .line 167
    const-wide/16 v2, 0x0

    .line 169
    .local v2, "newValue":D
    :try_start_0
    iget-object v4, p0, Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference$4;->val$valueView:Landroid/widget/EditText;

    invoke-virtual {v4}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    .line 170
    .local v1, "valueString":Ljava/lang/String;
    const/16 v4, 0x2c

    const/16 v5, 0x2e

    invoke-virtual {v1, v4, v5}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v1

    .line 171
    invoke-static {v1}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v2

    .line 172
    iget-object v4, p0, Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference$4;->this$0:Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;

    invoke-static {v4}, Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;->access$200(Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;)Lcom/mobnetic/coinguardian/model/CurrencySubunit;

    move-result-object v4

    if-eqz v4, :cond_0

    .line 173
    iget-object v4, p0, Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference$4;->this$0:Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;

    invoke-static {v4}, Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;->access$200(Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;)Lcom/mobnetic/coinguardian/model/CurrencySubunit;

    move-result-object v4

    iget-wide v4, v4, Lcom/mobnetic/coinguardian/model/CurrencySubunit;->subunitToUnit:J

    long-to-double v4, v4

    div-double/2addr v2, v4

    .line 174
    :cond_0
    iget-object v4, p0, Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference$4;->this$0:Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;

    invoke-static {v4, v2, v3}, Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;->access$300(Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;D)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 179
    .end local v1    # "valueString":Ljava/lang/String;
    :goto_0
    return-void

    .line 175
    :catch_0
    move-exception v0

    .line 176
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 177
    iget-object v4, p0, Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference$4;->this$0:Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;

    const-wide/high16 v6, -0x4010000000000000L    # -1.0

    invoke-static {v4, v6, v7}, Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;->access$300(Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;D)V

    goto :goto_0
.end method
