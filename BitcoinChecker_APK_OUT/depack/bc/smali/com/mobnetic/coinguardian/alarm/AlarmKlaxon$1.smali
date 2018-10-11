.class Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon$1;
.super Landroid/os/Handler;
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
    .line 77
    iput-object p1, p0, Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon$1;->this$0:Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 3
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 80
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    .line 89
    :goto_0
    return-void

    .line 85
    :pswitch_0
    iget-object v1, p0, Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon$1;->this$0:Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon;

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;

    const/4 v2, 0x0

    invoke-static {v1, v0, v2}, Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon;->access$000(Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon;Lcom/mobnetic/coinguardian/db/content/AlarmRecord;Z)V

    .line 86
    iget-object v0, p0, Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon$1;->this$0:Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon;

    invoke-virtual {v0}, Lcom/mobnetic/coinguardian/alarm/AlarmKlaxon;->stopSelf()V

    goto :goto_0

    .line 80
    :pswitch_data_0
    .packed-switch 0x3e8
        :pswitch_0
    .end packed-switch
.end method
