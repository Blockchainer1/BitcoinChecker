.class Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon$2;
.super Landroid/content/BroadcastReceiver;
.source "AlarmKlaxon.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon;


# direct methods
.method constructor <init>(Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon;)V
    .locals 0
    .param p1, "this$0"    # Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon;

    .prologue
    .line 108
    iput-object p1, p0, Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon$2;->this$0:Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v6, 0x0

    .line 111
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 112
    .local v0, "action":Ljava/lang/String;
    const-string v1, "AlarmKlaxon"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "AlarmAlertFullScreen - onReceive "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 113
    const-string v1, "checker_record_id"

    const-wide/16 v4, -0x1

    invoke-virtual {p2, v1, v4, v5}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v2

    .line 117
    .local v2, "checkerRecordId":J
    const-string v1, "com.mobnetic.coinguardian.alarm.ALARM_DISMISS"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 118
    iget-object v1, p0, Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon$2;->this$0:Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon;

    invoke-static {v1, v2, v3, v6}, Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon;->access$100(Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon;JZ)V

    .line 122
    :goto_0
    return-void

    .line 120
    :cond_0
    iget-object v1, p0, Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon$2;->this$0:Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon;

    const-string v4, "alarm_replaced"

    invoke-virtual {p2, v4, v6}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v4

    invoke-static {v1, v2, v3, v4}, Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon;->access$100(Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon;JZ)V

    goto :goto_0
.end method
