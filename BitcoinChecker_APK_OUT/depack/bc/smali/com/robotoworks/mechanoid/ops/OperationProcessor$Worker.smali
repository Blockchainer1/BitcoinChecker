.class Lcom/robotoworks/mechanoid/ops/OperationProcessor$Worker;
.super Landroid/os/HandlerThread;
.source "OperationProcessor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/robotoworks/mechanoid/ops/OperationProcessor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Worker"
.end annotation


# instance fields
.field private mProcessorHandler:Landroid/os/Handler;

.field private mWorkerHandler:Landroid/os/Handler;


# direct methods
.method public constructor <init>(Landroid/os/Handler;)V
    .locals 2
    .param p1, "processorHandler"    # Landroid/os/Handler;

    .prologue
    .line 301
    const-string v0, "worker"

    const/16 v1, 0xa

    invoke-direct {p0, v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;I)V

    .line 302
    iput-object p1, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor$Worker;->mProcessorHandler:Landroid/os/Handler;

    .line 303
    return-void
.end method


# virtual methods
.method protected onLooperPrepared()V
    .locals 2

    .prologue
    .line 311
    invoke-super {p0}, Landroid/os/HandlerThread;->onLooperPrepared()V

    .line 312
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor$Worker;->mWorkerHandler:Landroid/os/Handler;

    .line 313
    iget-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor$Worker;->mProcessorHandler:Landroid/os/Handler;

    const/4 v1, 0x5

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 314
    return-void
.end method

.method public post(Ljava/lang/Runnable;)V
    .locals 1
    .param p1, "runnable"    # Ljava/lang/Runnable;

    .prologue
    .line 306
    iget-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor$Worker;->mWorkerHandler:Landroid/os/Handler;

    invoke-virtual {v0, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 307
    return-void
.end method
