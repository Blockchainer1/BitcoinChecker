.class Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference$3;
.super Ljava/lang/Object;
.source "ViewAlarmCheckPointPreference.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


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


# direct methods
.method constructor <init>(Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;)V
    .locals 0
    .param p1, "this$0"    # Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;

    .prologue
    .line 155
    iput-object p1, p0, Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference$3;->this$0:Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 157
    iget-object v1, p0, Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference$3;->this$0:Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;

    invoke-static {v1}, Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;->access$000(Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;)V

    .line 158
    iget-object v1, p0, Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference$3;->this$0:Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;

    invoke-static {v1}, Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;->access$100(Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;)Landroid/app/AlertDialog;

    move-result-object v0

    .line 159
    .local v0, "dialog":Landroid/app/AlertDialog;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->isShowing()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 160
    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    .line 161
    :cond_0
    return-void
.end method
