.class Lcom/robotoworks/mechanoid/ops/OperationExecutor$1;
.super Lcom/robotoworks/mechanoid/ops/OperationServiceListener;
.source "OperationExecutor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/robotoworks/mechanoid/ops/OperationExecutor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/robotoworks/mechanoid/ops/OperationExecutor;


# direct methods
.method constructor <init>(Lcom/robotoworks/mechanoid/ops/OperationExecutor;)V
    .locals 0

    .prologue
    .line 175
    iput-object p1, p0, Lcom/robotoworks/mechanoid/ops/OperationExecutor$1;->this$0:Lcom/robotoworks/mechanoid/ops/OperationExecutor;

    invoke-direct {p0}, Lcom/robotoworks/mechanoid/ops/OperationServiceListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onOperationComplete(ILcom/robotoworks/mechanoid/ops/OperationResult;)V
    .locals 5
    .param p1, "id"    # I
    .param p2, "result"    # Lcom/robotoworks/mechanoid/ops/OperationResult;

    .prologue
    const/4 v2, 0x1

    .line 179
    iget-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationExecutor$1;->this$0:Lcom/robotoworks/mechanoid/ops/OperationExecutor;

    invoke-static {v0}, Lcom/robotoworks/mechanoid/ops/OperationExecutor;->access$000(Lcom/robotoworks/mechanoid/ops/OperationExecutor;)Lcom/robotoworks/mechanoid/ops/OperationExecutor$OpInfo;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationExecutor$1;->this$0:Lcom/robotoworks/mechanoid/ops/OperationExecutor;

    invoke-static {v0}, Lcom/robotoworks/mechanoid/ops/OperationExecutor;->access$000(Lcom/robotoworks/mechanoid/ops/OperationExecutor;)Lcom/robotoworks/mechanoid/ops/OperationExecutor$OpInfo;

    move-result-object v0

    iget v0, v0, Lcom/robotoworks/mechanoid/ops/OperationExecutor$OpInfo;->mId:I

    if-eq v0, p1, :cond_1

    .line 192
    :cond_0
    :goto_0
    return-void

    .line 183
    :cond_1
    iget-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationExecutor$1;->this$0:Lcom/robotoworks/mechanoid/ops/OperationExecutor;

    invoke-static {v0}, Lcom/robotoworks/mechanoid/ops/OperationExecutor;->access$000(Lcom/robotoworks/mechanoid/ops/OperationExecutor;)Lcom/robotoworks/mechanoid/ops/OperationExecutor$OpInfo;

    move-result-object v0

    iput-object p2, v0, Lcom/robotoworks/mechanoid/ops/OperationExecutor$OpInfo;->mResult:Lcom/robotoworks/mechanoid/ops/OperationResult;

    .line 185
    iget-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationExecutor$1;->this$0:Lcom/robotoworks/mechanoid/ops/OperationExecutor;

    invoke-virtual {v0, p2}, Lcom/robotoworks/mechanoid/ops/OperationExecutor;->invokeOnOperationComplete(Lcom/robotoworks/mechanoid/ops/OperationResult;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 186
    iget-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationExecutor$1;->this$0:Lcom/robotoworks/mechanoid/ops/OperationExecutor;

    invoke-static {v0}, Lcom/robotoworks/mechanoid/ops/OperationExecutor;->access$000(Lcom/robotoworks/mechanoid/ops/OperationExecutor;)Lcom/robotoworks/mechanoid/ops/OperationExecutor$OpInfo;

    move-result-object v0

    iput-boolean v2, v0, Lcom/robotoworks/mechanoid/ops/OperationExecutor$OpInfo;->mCallbackInvoked:Z

    .line 187
    iget-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationExecutor$1;->this$0:Lcom/robotoworks/mechanoid/ops/OperationExecutor;

    invoke-static {v0}, Lcom/robotoworks/mechanoid/ops/OperationExecutor;->access$100(Lcom/robotoworks/mechanoid/ops/OperationExecutor;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 188
    invoke-static {}, Lcom/robotoworks/mechanoid/ops/OperationExecutor;->access$200()Ljava/lang/String;

    move-result-object v0

    const-string v1, "[Operation Complete] key: %s"

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-object v4, p0, Lcom/robotoworks/mechanoid/ops/OperationExecutor$1;->this$0:Lcom/robotoworks/mechanoid/ops/OperationExecutor;

    invoke-static {v4}, Lcom/robotoworks/mechanoid/ops/OperationExecutor;->access$300(Lcom/robotoworks/mechanoid/ops/OperationExecutor;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method
