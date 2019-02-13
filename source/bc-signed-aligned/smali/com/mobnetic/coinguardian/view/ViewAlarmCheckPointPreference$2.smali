.class Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference$2;
.super Ljava/lang/Object;
.source "ViewAlarmCheckPointPreference.java"

# interfaces
.implements Ljava/lang/Runnable;


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
    .line 149
    iput-object p1, p0, Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference$2;->this$0:Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;

    iput-object p2, p0, Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference$2;->val$valueView:Landroid/widget/EditText;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 151
    iget-object v0, p0, Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference$2;->this$0:Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;

    invoke-virtual {v0}, Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference$2;->val$valueView:Landroid/widget/EditText;

    invoke-static {v0, v1}, Lcom/mobnetic/coinguardian/util/Utils;->showKeyboard(Landroid/content/Context;Landroid/view/View;)V

    .line 152
    return-void
.end method
