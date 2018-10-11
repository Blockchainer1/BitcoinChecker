.class Lcom/robotoworks/mechanoid/ops/OperationManagerBase$1;
.super Lcom/robotoworks/mechanoid/ops/OperationServiceListener;
.source "OperationManagerBase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/robotoworks/mechanoid/ops/OperationManagerBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/robotoworks/mechanoid/ops/OperationManagerBase;


# direct methods
.method constructor <init>(Lcom/robotoworks/mechanoid/ops/OperationManagerBase;)V
    .locals 0

    .prologue
    .line 89
    iput-object p1, p0, Lcom/robotoworks/mechanoid/ops/OperationManagerBase$1;->this$0:Lcom/robotoworks/mechanoid/ops/OperationManagerBase;

    invoke-direct {p0}, Lcom/robotoworks/mechanoid/ops/OperationServiceListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onOperationComplete(ILcom/robotoworks/mechanoid/ops/OperationResult;)V
    .locals 7
    .param p1, "id"    # I
    .param p2, "result"    # Lcom/robotoworks/mechanoid/ops/OperationResult;

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 93
    iget-object v1, p0, Lcom/robotoworks/mechanoid/ops/OperationManagerBase$1;->this$0:Lcom/robotoworks/mechanoid/ops/OperationManagerBase;

    invoke-static {v1, p1}, Lcom/robotoworks/mechanoid/ops/OperationManagerBase;->access$000(Lcom/robotoworks/mechanoid/ops/OperationManagerBase;I)Lcom/robotoworks/mechanoid/ops/OperationManagerBase$OpInfo;

    move-result-object v0

    .line 96
    .local v0, "op":Lcom/robotoworks/mechanoid/ops/OperationManagerBase$OpInfo;
    if-nez v0, :cond_1

    .line 108
    :cond_0
    :goto_0
    return-void

    .line 100
    :cond_1
    iput-object p2, v0, Lcom/robotoworks/mechanoid/ops/OperationManagerBase$OpInfo;->mResult:Lcom/robotoworks/mechanoid/ops/OperationResult;

    .line 101
    iget-object v1, p0, Lcom/robotoworks/mechanoid/ops/OperationManagerBase$1;->this$0:Lcom/robotoworks/mechanoid/ops/OperationManagerBase;

    iget v2, v0, Lcom/robotoworks/mechanoid/ops/OperationManagerBase$OpInfo;->mUserCode:I

    invoke-virtual {v1, v2, p2, v5}, Lcom/robotoworks/mechanoid/ops/OperationManagerBase;->invokeOnOperationComplete(ILcom/robotoworks/mechanoid/ops/OperationResult;Z)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 102
    iput-boolean v6, v0, Lcom/robotoworks/mechanoid/ops/OperationManagerBase$OpInfo;->mCallbackInvoked:Z

    .line 103
    iget-object v1, p0, Lcom/robotoworks/mechanoid/ops/OperationManagerBase$1;->this$0:Lcom/robotoworks/mechanoid/ops/OperationManagerBase;

    invoke-static {v1}, Lcom/robotoworks/mechanoid/ops/OperationManagerBase;->access$100(Lcom/robotoworks/mechanoid/ops/OperationManagerBase;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 104
    const-string v1, "OperationManager"

    const-string v2, "[Operation Complete] request id:%s, user code:%s"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v5

    iget v4, v0, Lcom/robotoworks/mechanoid/ops/OperationManagerBase$OpInfo;->mUserCode:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v6

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method
