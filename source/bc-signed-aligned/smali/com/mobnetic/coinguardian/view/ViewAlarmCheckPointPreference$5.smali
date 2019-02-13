.class Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference$5;
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


# direct methods
.method constructor <init>(Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;)V
    .locals 0
    .param p1, "this$0"    # Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;

    .prologue
    .line 182
    iput-object p1, p0, Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference$5;->this$0:Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 4
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 184
    iget-object v0, p0, Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference$5;->this$0:Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;

    const-wide/high16 v2, -0x4010000000000000L    # -1.0

    invoke-static {v0, v2, v3}, Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;->access$300(Lcom/mobnetic/coinguardian/view/ViewAlarmCheckPointPreference;D)V

    .line 185
    return-void
.end method
