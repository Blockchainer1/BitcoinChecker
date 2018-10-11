.class Lcom/robotoworks/mechanoid/ops/OperationServiceBridge$1;
.super Landroid/os/Handler;
.source "OperationServiceBridge.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;


# direct methods
.method constructor <init>(Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;)V
    .locals 0

    .prologue
    .line 70
    iput-object p1, p0, Lcom/robotoworks/mechanoid/ops/OperationServiceBridge$1;->this$0:Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 5
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 74
    iget v4, p1, Landroid/os/Message;->what:I

    packed-switch v4, :pswitch_data_0

    .line 106
    :goto_0
    return-void

    .line 77
    :pswitch_0
    iget v1, p1, Landroid/os/Message;->arg1:I

    .line 78
    .local v1, "id":I
    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v0

    .line 80
    .local v0, "data":Landroid/os/Bundle;
    iget-object v4, p0, Lcom/robotoworks/mechanoid/ops/OperationServiceBridge$1;->this$0:Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;

    invoke-virtual {v4, v1, v0}, Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;->onOperationStarting(ILandroid/os/Bundle;)V

    goto :goto_0

    .line 84
    .end local v0    # "data":Landroid/os/Bundle;
    .end local v1    # "id":I
    :pswitch_1
    iget v1, p1, Landroid/os/Message;->arg1:I

    .line 85
    .restart local v1    # "id":I
    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v0

    .line 87
    .restart local v0    # "data":Landroid/os/Bundle;
    iget-object v4, p0, Lcom/robotoworks/mechanoid/ops/OperationServiceBridge$1;->this$0:Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;

    invoke-virtual {v4, v1, v0}, Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;->onOperationComplete(ILandroid/os/Bundle;)V

    goto :goto_0

    .line 91
    .end local v0    # "data":Landroid/os/Bundle;
    .end local v1    # "id":I
    :pswitch_2
    iget v1, p1, Landroid/os/Message;->arg1:I

    .line 92
    .restart local v1    # "id":I
    iget v2, p1, Landroid/os/Message;->arg2:I

    .line 93
    .local v2, "progress":I
    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v0

    .line 95
    .restart local v0    # "data":Landroid/os/Bundle;
    iget-object v4, p0, Lcom/robotoworks/mechanoid/ops/OperationServiceBridge$1;->this$0:Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;

    invoke-virtual {v4, v1, v2, v0}, Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;->onOperationProgress(IILandroid/os/Bundle;)V

    goto :goto_0

    .line 99
    .end local v0    # "data":Landroid/os/Bundle;
    .end local v1    # "id":I
    .end local v2    # "progress":I
    :pswitch_3
    iget v1, p1, Landroid/os/Message;->arg1:I

    .line 100
    .restart local v1    # "id":I
    iget v3, p1, Landroid/os/Message;->arg2:I

    .line 101
    .local v3, "reason":I
    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v0

    .line 102
    .restart local v0    # "data":Landroid/os/Bundle;
    iget-object v4, p0, Lcom/robotoworks/mechanoid/ops/OperationServiceBridge$1;->this$0:Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;

    invoke-virtual {v4, v1, v3, v0}, Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;->onOperationAborted(IILandroid/os/Bundle;)V

    goto :goto_0

    .line 74
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method
