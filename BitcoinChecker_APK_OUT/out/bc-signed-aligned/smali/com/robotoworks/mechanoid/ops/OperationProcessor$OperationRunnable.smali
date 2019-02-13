.class Lcom/robotoworks/mechanoid/ops/OperationProcessor$OperationRunnable;
.super Ljava/lang/Object;
.source "OperationProcessor.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/robotoworks/mechanoid/ops/OperationProcessor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "OperationRunnable"
.end annotation


# instance fields
.field private mCallbackHandler:Landroid/os/Handler;

.field private mEnableLogging:Z

.field private mLogTag:Ljava/lang/String;

.field private mOperation:Lcom/robotoworks/mechanoid/ops/Operation;

.field private mOperationContext:Lcom/robotoworks/mechanoid/ops/OperationContext;


# direct methods
.method public constructor <init>(Landroid/os/Handler;Lcom/robotoworks/mechanoid/ops/OperationContext;Lcom/robotoworks/mechanoid/ops/Operation;ZLjava/lang/String;)V
    .locals 0
    .param p1, "callbackHandler"    # Landroid/os/Handler;
    .param p2, "operationContext"    # Lcom/robotoworks/mechanoid/ops/OperationContext;
    .param p3, "operation"    # Lcom/robotoworks/mechanoid/ops/Operation;
    .param p4, "enableLogging"    # Z
    .param p5, "logTag"    # Ljava/lang/String;

    .prologue
    .line 248
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 249
    iput-object p1, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor$OperationRunnable;->mCallbackHandler:Landroid/os/Handler;

    .line 250
    iput-object p3, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor$OperationRunnable;->mOperation:Lcom/robotoworks/mechanoid/ops/Operation;

    .line 251
    iput-boolean p4, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor$OperationRunnable;->mEnableLogging:Z

    .line 252
    iput-object p2, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor$OperationRunnable;->mOperationContext:Lcom/robotoworks/mechanoid/ops/OperationContext;

    .line 253
    iput-object p5, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor$OperationRunnable;->mLogTag:Ljava/lang/String;

    .line 254
    return-void
.end method


# virtual methods
.method public run()V
    .locals 10

    .prologue
    const/4 v7, 0x1

    .line 258
    iget-object v5, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor$OperationRunnable;->mCallbackHandler:Landroid/os/Handler;

    invoke-virtual {v5, v7}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v1

    .line 259
    .local v1, "messageStarting":Landroid/os/Message;
    iget-object v5, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor$OperationRunnable;->mCallbackHandler:Landroid/os/Handler;

    invoke-virtual {v5, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 261
    const/4 v3, 0x0

    .line 264
    .local v3, "result":Landroid/os/Bundle;
    :try_start_0
    iget-object v5, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor$OperationRunnable;->mOperation:Lcom/robotoworks/mechanoid/ops/Operation;

    iget-object v6, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor$OperationRunnable;->mOperationContext:Lcom/robotoworks/mechanoid/ops/OperationContext;

    invoke-virtual {v5, v6}, Lcom/robotoworks/mechanoid/ops/Operation;->execute(Lcom/robotoworks/mechanoid/ops/OperationContext;)Lcom/robotoworks/mechanoid/ops/OperationResult;

    move-result-object v2

    .line 266
    .local v2, "opResult":Lcom/robotoworks/mechanoid/ops/OperationResult;
    if-nez v2, :cond_1

    .line 267
    new-instance v5, Ljava/lang/NullPointerException;

    const-string v6, "OperationResult should not be null"

    invoke-direct {v5, v6}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v5
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 272
    .end local v2    # "opResult":Lcom/robotoworks/mechanoid/ops/OperationResult;
    :catch_0
    move-exception v4

    .line 274
    .local v4, "x":Ljava/lang/Exception;
    invoke-static {v4}, Lcom/robotoworks/mechanoid/ops/OperationResult;->error(Ljava/lang/Throwable;)Lcom/robotoworks/mechanoid/ops/OperationResult;

    move-result-object v5

    invoke-virtual {v5}, Lcom/robotoworks/mechanoid/ops/OperationResult;->toBundle()Landroid/os/Bundle;

    move-result-object v3

    .line 276
    iget-boolean v5, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor$OperationRunnable;->mEnableLogging:Z

    if-eqz v5, :cond_0

    .line 277
    iget-object v5, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor$OperationRunnable;->mLogTag:Ljava/lang/String;

    const-string v6, "[Operation Error] %s"

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    invoke-static {v4}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 281
    .end local v4    # "x":Ljava/lang/Exception;
    :cond_0
    :goto_0
    const/4 v0, 0x0

    .line 283
    .local v0, "m":Landroid/os/Message;
    iget-object v5, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor$OperationRunnable;->mOperationContext:Lcom/robotoworks/mechanoid/ops/OperationContext;

    invoke-virtual {v5}, Lcom/robotoworks/mechanoid/ops/OperationContext;->isAborted()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 284
    iget-object v5, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor$OperationRunnable;->mCallbackHandler:Landroid/os/Handler;

    const/4 v6, 0x4

    invoke-virtual {v5, v6}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    .line 285
    iget-object v5, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor$OperationRunnable;->mOperationContext:Lcom/robotoworks/mechanoid/ops/OperationContext;

    invoke-virtual {v5}, Lcom/robotoworks/mechanoid/ops/OperationContext;->getAbortReason()I

    move-result v5

    iput v5, v0, Landroid/os/Message;->arg1:I

    .line 290
    :goto_1
    invoke-virtual {v0, v3}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 291
    iget-object v5, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor$OperationRunnable;->mCallbackHandler:Landroid/os/Handler;

    invoke-virtual {v5, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 292
    return-void

    .line 270
    .end local v0    # "m":Landroid/os/Message;
    .restart local v2    # "opResult":Lcom/robotoworks/mechanoid/ops/OperationResult;
    :cond_1
    :try_start_1
    invoke-virtual {v2}, Lcom/robotoworks/mechanoid/ops/OperationResult;->toBundle()Landroid/os/Bundle;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v3

    goto :goto_0

    .line 287
    .end local v2    # "opResult":Lcom/robotoworks/mechanoid/ops/OperationResult;
    .restart local v0    # "m":Landroid/os/Message;
    :cond_2
    iget-object v5, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor$OperationRunnable;->mCallbackHandler:Landroid/os/Handler;

    const/4 v6, 0x2

    invoke-virtual {v5, v6}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    goto :goto_1
.end method
