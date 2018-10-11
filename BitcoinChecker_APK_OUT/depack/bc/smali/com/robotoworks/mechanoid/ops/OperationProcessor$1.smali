.class Lcom/robotoworks/mechanoid/ops/OperationProcessor$1;
.super Landroid/os/Handler;
.source "OperationProcessor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/robotoworks/mechanoid/ops/OperationProcessor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/robotoworks/mechanoid/ops/OperationProcessor;


# direct methods
.method constructor <init>(Lcom/robotoworks/mechanoid/ops/OperationProcessor;)V
    .locals 0

    .prologue
    .line 48
    iput-object p1, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor$1;->this$0:Lcom/robotoworks/mechanoid/ops/OperationProcessor;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 6
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x0

    const/4 v2, 0x1

    .line 50
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    .line 90
    :goto_0
    return-void

    .line 52
    :pswitch_0
    iget-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor$1;->this$0:Lcom/robotoworks/mechanoid/ops/OperationProcessor;

    invoke-static {v0, v2}, Lcom/robotoworks/mechanoid/ops/OperationProcessor;->access$002(Lcom/robotoworks/mechanoid/ops/OperationProcessor;Z)Z

    .line 53
    iget-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor$1;->this$0:Lcom/robotoworks/mechanoid/ops/OperationProcessor;

    invoke-static {v0}, Lcom/robotoworks/mechanoid/ops/OperationProcessor;->access$100(Lcom/robotoworks/mechanoid/ops/OperationProcessor;)V

    goto :goto_0

    .line 56
    :pswitch_1
    iget-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor$1;->this$0:Lcom/robotoworks/mechanoid/ops/OperationProcessor;

    iget-boolean v0, v0, Lcom/robotoworks/mechanoid/ops/OperationProcessor;->mEnableLogging:Z

    if-eqz v0, :cond_0

    .line 57
    iget-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor$1;->this$0:Lcom/robotoworks/mechanoid/ops/OperationProcessor;

    iget-object v0, v0, Lcom/robotoworks/mechanoid/ops/OperationProcessor;->mLogTag:Ljava/lang/String;

    const-string v1, "[Handle Operation Starting] intent:%s"

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v3, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor$1;->this$0:Lcom/robotoworks/mechanoid/ops/OperationProcessor;

    invoke-static {v3}, Lcom/robotoworks/mechanoid/ops/OperationProcessor;->access$200(Lcom/robotoworks/mechanoid/ops/OperationProcessor;)Landroid/content/Intent;

    move-result-object v3

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 59
    :cond_0
    iget-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor$1;->this$0:Lcom/robotoworks/mechanoid/ops/OperationProcessor;

    invoke-static {v0}, Lcom/robotoworks/mechanoid/ops/OperationProcessor;->access$300(Lcom/robotoworks/mechanoid/ops/OperationProcessor;)Lcom/robotoworks/mechanoid/ops/OperationService;

    move-result-object v0

    iget-object v1, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor$1;->this$0:Lcom/robotoworks/mechanoid/ops/OperationProcessor;

    invoke-static {v1}, Lcom/robotoworks/mechanoid/ops/OperationProcessor;->access$200(Lcom/robotoworks/mechanoid/ops/OperationProcessor;)Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/robotoworks/mechanoid/ops/OperationService;->onOperationStarting(Landroid/content/Intent;Landroid/os/Bundle;)V

    goto :goto_0

    .line 63
    :pswitch_2
    iget-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor$1;->this$0:Lcom/robotoworks/mechanoid/ops/OperationProcessor;

    iget-boolean v0, v0, Lcom/robotoworks/mechanoid/ops/OperationProcessor;->mEnableLogging:Z

    if-eqz v0, :cond_1

    .line 64
    iget-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor$1;->this$0:Lcom/robotoworks/mechanoid/ops/OperationProcessor;

    iget-object v0, v0, Lcom/robotoworks/mechanoid/ops/OperationProcessor;->mLogTag:Ljava/lang/String;

    const-string v1, "[Handle Operation Complete] intent:%s"

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v3, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor$1;->this$0:Lcom/robotoworks/mechanoid/ops/OperationProcessor;

    invoke-static {v3}, Lcom/robotoworks/mechanoid/ops/OperationProcessor;->access$200(Lcom/robotoworks/mechanoid/ops/OperationProcessor;)Landroid/content/Intent;

    move-result-object v3

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 66
    :cond_1
    iget-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor$1;->this$0:Lcom/robotoworks/mechanoid/ops/OperationProcessor;

    invoke-static {v0, v5}, Lcom/robotoworks/mechanoid/ops/OperationProcessor;->access$402(Lcom/robotoworks/mechanoid/ops/OperationProcessor;Lcom/robotoworks/mechanoid/ops/Operation;)Lcom/robotoworks/mechanoid/ops/Operation;

    .line 67
    iget-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor$1;->this$0:Lcom/robotoworks/mechanoid/ops/OperationProcessor;

    invoke-static {v0}, Lcom/robotoworks/mechanoid/ops/OperationProcessor;->access$300(Lcom/robotoworks/mechanoid/ops/OperationProcessor;)Lcom/robotoworks/mechanoid/ops/OperationService;

    move-result-object v0

    iget-object v1, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor$1;->this$0:Lcom/robotoworks/mechanoid/ops/OperationProcessor;

    invoke-static {v1}, Lcom/robotoworks/mechanoid/ops/OperationProcessor;->access$200(Lcom/robotoworks/mechanoid/ops/OperationProcessor;)Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/robotoworks/mechanoid/ops/OperationService;->onOperationComplete(Landroid/content/Intent;Landroid/os/Bundle;)V

    .line 69
    iget-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor$1;->this$0:Lcom/robotoworks/mechanoid/ops/OperationProcessor;

    invoke-static {v0}, Lcom/robotoworks/mechanoid/ops/OperationProcessor;->access$100(Lcom/robotoworks/mechanoid/ops/OperationProcessor;)V

    goto :goto_0

    .line 73
    :pswitch_3
    iget-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor$1;->this$0:Lcom/robotoworks/mechanoid/ops/OperationProcessor;

    iget-boolean v0, v0, Lcom/robotoworks/mechanoid/ops/OperationProcessor;->mEnableLogging:Z

    if-eqz v0, :cond_2

    .line 74
    iget-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor$1;->this$0:Lcom/robotoworks/mechanoid/ops/OperationProcessor;

    iget-object v0, v0, Lcom/robotoworks/mechanoid/ops/OperationProcessor;->mLogTag:Ljava/lang/String;

    const-string v1, "[Handle Operation Aborted] intent:%s"

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v3, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor$1;->this$0:Lcom/robotoworks/mechanoid/ops/OperationProcessor;

    invoke-static {v3}, Lcom/robotoworks/mechanoid/ops/OperationProcessor;->access$200(Lcom/robotoworks/mechanoid/ops/OperationProcessor;)Landroid/content/Intent;

    move-result-object v3

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 76
    :cond_2
    iget-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor$1;->this$0:Lcom/robotoworks/mechanoid/ops/OperationProcessor;

    invoke-static {v0, v5}, Lcom/robotoworks/mechanoid/ops/OperationProcessor;->access$402(Lcom/robotoworks/mechanoid/ops/OperationProcessor;Lcom/robotoworks/mechanoid/ops/Operation;)Lcom/robotoworks/mechanoid/ops/Operation;

    .line 77
    iget-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor$1;->this$0:Lcom/robotoworks/mechanoid/ops/OperationProcessor;

    invoke-static {v0}, Lcom/robotoworks/mechanoid/ops/OperationProcessor;->access$300(Lcom/robotoworks/mechanoid/ops/OperationProcessor;)Lcom/robotoworks/mechanoid/ops/OperationService;

    move-result-object v0

    iget-object v1, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor$1;->this$0:Lcom/robotoworks/mechanoid/ops/OperationProcessor;

    invoke-static {v1}, Lcom/robotoworks/mechanoid/ops/OperationProcessor;->access$200(Lcom/robotoworks/mechanoid/ops/OperationProcessor;)Landroid/content/Intent;

    move-result-object v1

    iget v2, p1, Landroid/os/Message;->arg1:I

    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v3

    invoke-virtual {v0, v1, v2, v3}, Lcom/robotoworks/mechanoid/ops/OperationService;->onOperationAborted(Landroid/content/Intent;ILandroid/os/Bundle;)V

    .line 79
    iget-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor$1;->this$0:Lcom/robotoworks/mechanoid/ops/OperationProcessor;

    invoke-static {v0}, Lcom/robotoworks/mechanoid/ops/OperationProcessor;->access$100(Lcom/robotoworks/mechanoid/ops/OperationProcessor;)V

    goto/16 :goto_0

    .line 83
    :pswitch_4
    iget-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor$1;->this$0:Lcom/robotoworks/mechanoid/ops/OperationProcessor;

    iget-boolean v0, v0, Lcom/robotoworks/mechanoid/ops/OperationProcessor;->mEnableLogging:Z

    if-eqz v0, :cond_3

    .line 84
    iget-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor$1;->this$0:Lcom/robotoworks/mechanoid/ops/OperationProcessor;

    iget-object v0, v0, Lcom/robotoworks/mechanoid/ops/OperationProcessor;->mLogTag:Ljava/lang/String;

    const-string v1, "[Handle Operation Progress] intent:%s"

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v3, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor$1;->this$0:Lcom/robotoworks/mechanoid/ops/OperationProcessor;

    invoke-static {v3}, Lcom/robotoworks/mechanoid/ops/OperationProcessor;->access$200(Lcom/robotoworks/mechanoid/ops/OperationProcessor;)Landroid/content/Intent;

    move-result-object v3

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 86
    :cond_3
    iget-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor$1;->this$0:Lcom/robotoworks/mechanoid/ops/OperationProcessor;

    invoke-static {v0}, Lcom/robotoworks/mechanoid/ops/OperationProcessor;->access$300(Lcom/robotoworks/mechanoid/ops/OperationProcessor;)Lcom/robotoworks/mechanoid/ops/OperationService;

    move-result-object v0

    iget-object v1, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor$1;->this$0:Lcom/robotoworks/mechanoid/ops/OperationProcessor;

    invoke-static {v1}, Lcom/robotoworks/mechanoid/ops/OperationProcessor;->access$200(Lcom/robotoworks/mechanoid/ops/OperationProcessor;)Landroid/content/Intent;

    move-result-object v1

    iget v2, p1, Landroid/os/Message;->arg1:I

    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v3

    invoke-virtual {v0, v1, v2, v3}, Lcom/robotoworks/mechanoid/ops/OperationService;->onOperationProgress(Landroid/content/Intent;ILandroid/os/Bundle;)V

    goto/16 :goto_0

    .line 50
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_2
        :pswitch_4
        :pswitch_3
        :pswitch_0
    .end packed-switch
.end method
