.class public abstract Lcom/robotoworks/mechanoid/ops/OperationProcessor;
.super Ljava/lang/Object;
.source "OperationProcessor.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/robotoworks/mechanoid/ops/OperationProcessor$Worker;,
        Lcom/robotoworks/mechanoid/ops/OperationProcessor$OperationRunnable;
    }
.end annotation


# static fields
.field protected static final MSG_OPERATION_ABORTED:I = 0x4

.field protected static final MSG_OPERATION_COMPLETE:I = 0x2

.field protected static final MSG_OPERATION_PROGRESS:I = 0x3

.field protected static final MSG_OPERATION_STARTING:I = 0x1

.field protected static final MSG_WORKER_READY:I = 0x5


# instance fields
.field private handler:Landroid/os/Handler;

.field private mContext:Lcom/robotoworks/mechanoid/ops/OperationContext;

.field private mCurrentOperation:Lcom/robotoworks/mechanoid/ops/Operation;

.field private mCurrentRequest:Landroid/content/Intent;

.field protected final mEnableLogging:Z

.field protected final mLogTag:Ljava/lang/String;

.field private final mService:Lcom/robotoworks/mechanoid/ops/OperationService;

.field private mWorker:Lcom/robotoworks/mechanoid/ops/OperationProcessor$Worker;

.field private mWorkerReady:Z

.field private requestQueue:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Landroid/content/Intent;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/robotoworks/mechanoid/ops/OperationService;Z)V
    .locals 2
    .param p1, "service"    # Lcom/robotoworks/mechanoid/ops/OperationService;
    .param p2, "enableLogging"    # Z

    .prologue
    .line 105
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor;->requestQueue:Ljava/util/LinkedList;

    .line 48
    new-instance v0, Lcom/robotoworks/mechanoid/ops/OperationProcessor$1;

    invoke-direct {v0, p0}, Lcom/robotoworks/mechanoid/ops/OperationProcessor$1;-><init>(Lcom/robotoworks/mechanoid/ops/OperationProcessor;)V

    iput-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor;->handler:Landroid/os/Handler;

    .line 106
    iput-object p1, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor;->mService:Lcom/robotoworks/mechanoid/ops/OperationService;

    .line 107
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor;->mLogTag:Ljava/lang/String;

    .line 108
    iput-boolean p2, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor;->mEnableLogging:Z

    .line 110
    new-instance v0, Lcom/robotoworks/mechanoid/ops/OperationContext;

    invoke-direct {v0}, Lcom/robotoworks/mechanoid/ops/OperationContext;-><init>()V

    iput-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor;->mContext:Lcom/robotoworks/mechanoid/ops/OperationContext;

    .line 112
    new-instance v0, Lcom/robotoworks/mechanoid/ops/OperationProcessor$Worker;

    iget-object v1, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor;->handler:Landroid/os/Handler;

    invoke-direct {v0, v1}, Lcom/robotoworks/mechanoid/ops/OperationProcessor$Worker;-><init>(Landroid/os/Handler;)V

    iput-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor;->mWorker:Lcom/robotoworks/mechanoid/ops/OperationProcessor$Worker;

    .line 113
    iget-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor;->mWorker:Lcom/robotoworks/mechanoid/ops/OperationProcessor$Worker;

    invoke-virtual {v0}, Lcom/robotoworks/mechanoid/ops/OperationProcessor$Worker;->start()V

    .line 114
    return-void
.end method

.method private abortOperation(II)V
    .locals 8
    .param p1, "abortRequestId"    # I
    .param p2, "abortReason"    # I

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 138
    iget-boolean v2, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor;->mEnableLogging:Z

    if-eqz v2, :cond_0

    .line 139
    iget-object v2, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor;->mLogTag:Ljava/lang/String;

    const-string v3, "[Aborting] id:%s, reason:%s"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v7

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 143
    :cond_0
    iget-object v2, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor;->mCurrentOperation:Lcom/robotoworks/mechanoid/ops/Operation;

    if-eqz v2, :cond_1

    .line 144
    iget-object v2, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor;->mCurrentRequest:Landroid/content/Intent;

    invoke-static {v2}, Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;->getOperationRequestId(Landroid/content/Intent;)I

    move-result v0

    .line 146
    .local v0, "currentRequestId":I
    if-ne v0, p1, :cond_1

    .line 147
    iget-object v2, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor;->mContext:Lcom/robotoworks/mechanoid/ops/OperationContext;

    iget-object v2, v2, Lcom/robotoworks/mechanoid/ops/OperationContext;->handler:Landroid/os/Handler;

    invoke-virtual {v2, v7, p2, v6}, Landroid/os/Handler;->obtainMessage(III)Landroid/os/Message;

    move-result-object v1

    .line 148
    .local v1, "m":Landroid/os/Message;
    iget-object v2, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor;->mContext:Lcom/robotoworks/mechanoid/ops/OperationContext;

    iget-object v2, v2, Lcom/robotoworks/mechanoid/ops/OperationContext;->handler:Landroid/os/Handler;

    invoke-virtual {v2, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 156
    .end local v0    # "currentRequestId":I
    .end local v1    # "m":Landroid/os/Message;
    :goto_0
    return-void

    .line 155
    :cond_1
    invoke-direct {p0, p1, p2}, Lcom/robotoworks/mechanoid/ops/OperationProcessor;->tryFlagQueuedOperationAsAborted(II)V

    goto :goto_0
.end method

.method static synthetic access$002(Lcom/robotoworks/mechanoid/ops/OperationProcessor;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/robotoworks/mechanoid/ops/OperationProcessor;
    .param p1, "x1"    # Z

    .prologue
    .line 27
    iput-boolean p1, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor;->mWorkerReady:Z

    return p1
.end method

.method static synthetic access$100(Lcom/robotoworks/mechanoid/ops/OperationProcessor;)V
    .locals 0
    .param p0, "x0"    # Lcom/robotoworks/mechanoid/ops/OperationProcessor;

    .prologue
    .line 27
    invoke-direct {p0}, Lcom/robotoworks/mechanoid/ops/OperationProcessor;->executePendingOperations()V

    return-void
.end method

.method static synthetic access$200(Lcom/robotoworks/mechanoid/ops/OperationProcessor;)Landroid/content/Intent;
    .locals 1
    .param p0, "x0"    # Lcom/robotoworks/mechanoid/ops/OperationProcessor;

    .prologue
    .line 27
    iget-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor;->mCurrentRequest:Landroid/content/Intent;

    return-object v0
.end method

.method static synthetic access$300(Lcom/robotoworks/mechanoid/ops/OperationProcessor;)Lcom/robotoworks/mechanoid/ops/OperationService;
    .locals 1
    .param p0, "x0"    # Lcom/robotoworks/mechanoid/ops/OperationProcessor;

    .prologue
    .line 27
    iget-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor;->mService:Lcom/robotoworks/mechanoid/ops/OperationService;

    return-object v0
.end method

.method static synthetic access$402(Lcom/robotoworks/mechanoid/ops/OperationProcessor;Lcom/robotoworks/mechanoid/ops/Operation;)Lcom/robotoworks/mechanoid/ops/Operation;
    .locals 0
    .param p0, "x0"    # Lcom/robotoworks/mechanoid/ops/OperationProcessor;
    .param p1, "x1"    # Lcom/robotoworks/mechanoid/ops/Operation;

    .prologue
    .line 27
    iput-object p1, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor;->mCurrentOperation:Lcom/robotoworks/mechanoid/ops/Operation;

    return-object p1
.end method

.method private executeOperation(Landroid/content/Intent;)V
    .locals 8
    .param p1, "request"    # Landroid/content/Intent;

    .prologue
    const/4 v3, 0x0

    .line 209
    iget-boolean v0, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor;->mEnableLogging:Z

    if-eqz v0, :cond_0

    .line 210
    iget-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor;->mLogTag:Ljava/lang/String;

    const-string v1, "[Execute Operation] intent:%s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    aput-object p1, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 216
    :cond_0
    const-string v0, "com.robotoworks.mechanoid.op.extras.IS_ABORTED"

    invoke-virtual {p1, v0, v3}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 217
    const-string v0, "com.robotoworks.mechanoid.op.extras.ABORT_REASON"

    invoke-virtual {p1, v0, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v6

    .line 218
    .local v6, "abortReason":I
    iget-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor;->mService:Lcom/robotoworks/mechanoid/ops/OperationService;

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    invoke-virtual {v0, p1, v6, v1}, Lcom/robotoworks/mechanoid/ops/OperationService;->onOperationAborted(Landroid/content/Intent;ILandroid/os/Bundle;)V

    .line 219
    invoke-direct {p0}, Lcom/robotoworks/mechanoid/ops/OperationProcessor;->executePendingOperations()V

    .line 236
    .end local v6    # "abortReason":I
    :goto_0
    return-void

    .line 223
    :cond_1
    iput-object p1, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor;->mCurrentRequest:Landroid/content/Intent;

    .line 224
    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/robotoworks/mechanoid/ops/OperationProcessor;->createOperation(Ljava/lang/String;)Lcom/robotoworks/mechanoid/ops/Operation;

    move-result-object v0

    iput-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor;->mCurrentOperation:Lcom/robotoworks/mechanoid/ops/Operation;

    .line 226
    iget-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor;->mCurrentOperation:Lcom/robotoworks/mechanoid/ops/Operation;

    if-nez v0, :cond_2

    .line 227
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " Not Implemented"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 230
    :cond_2
    iget-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor;->mContext:Lcom/robotoworks/mechanoid/ops/OperationContext;

    invoke-virtual {v0}, Lcom/robotoworks/mechanoid/ops/OperationContext;->reset()V

    .line 231
    iget-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor;->mContext:Lcom/robotoworks/mechanoid/ops/OperationContext;

    iget-object v1, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor;->mService:Lcom/robotoworks/mechanoid/ops/OperationService;

    invoke-virtual {v1}, Lcom/robotoworks/mechanoid/ops/OperationService;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/robotoworks/mechanoid/ops/OperationContext;->setApplicationContext(Landroid/content/Context;)V

    .line 232
    iget-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor;->mContext:Lcom/robotoworks/mechanoid/ops/OperationContext;

    invoke-virtual {v0, p1}, Lcom/robotoworks/mechanoid/ops/OperationContext;->setIntent(Landroid/content/Intent;)V

    .line 233
    iget-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor;->mContext:Lcom/robotoworks/mechanoid/ops/OperationContext;

    invoke-virtual {v0, p0}, Lcom/robotoworks/mechanoid/ops/OperationContext;->setOperationProcessor(Lcom/robotoworks/mechanoid/ops/OperationProcessor;)V

    .line 235
    iget-object v7, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor;->mWorker:Lcom/robotoworks/mechanoid/ops/OperationProcessor$Worker;

    new-instance v0, Lcom/robotoworks/mechanoid/ops/OperationProcessor$OperationRunnable;

    iget-object v1, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor;->handler:Landroid/os/Handler;

    iget-object v2, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor;->mContext:Lcom/robotoworks/mechanoid/ops/OperationContext;

    iget-object v3, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor;->mCurrentOperation:Lcom/robotoworks/mechanoid/ops/Operation;

    iget-boolean v4, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor;->mEnableLogging:Z

    iget-object v5, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor;->mLogTag:Ljava/lang/String;

    invoke-direct/range {v0 .. v5}, Lcom/robotoworks/mechanoid/ops/OperationProcessor$OperationRunnable;-><init>(Landroid/os/Handler;Lcom/robotoworks/mechanoid/ops/OperationContext;Lcom/robotoworks/mechanoid/ops/Operation;ZLjava/lang/String;)V

    invoke-virtual {v7, v0}, Lcom/robotoworks/mechanoid/ops/OperationProcessor$Worker;->post(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method private executePendingOperations()V
    .locals 3

    .prologue
    .line 171
    iget-boolean v1, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor;->mWorkerReady:Z

    if-nez v1, :cond_1

    .line 172
    iget-object v1, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor;->mLogTag:Ljava/lang/String;

    const-string v2, "[Waiting on Worker]"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 190
    :cond_0
    :goto_0
    return-void

    .line 176
    :cond_1
    iget-object v1, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor;->mCurrentOperation:Lcom/robotoworks/mechanoid/ops/Operation;

    if-nez v1, :cond_0

    .line 180
    iget-boolean v1, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor;->mEnableLogging:Z

    if-eqz v1, :cond_2

    .line 181
    iget-object v1, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor;->mLogTag:Ljava/lang/String;

    const-string v2, "[Executing Pending]"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 185
    :cond_2
    iget-object v1, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor;->requestQueue:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Intent;

    .line 187
    .local v0, "request":Landroid/content/Intent;
    if-eqz v0, :cond_0

    .line 188
    invoke-direct {p0, v0}, Lcom/robotoworks/mechanoid/ops/OperationProcessor;->executeOperation(Landroid/content/Intent;)V

    goto :goto_0
.end method

.method private tryFlagQueuedOperationAsAborted(II)V
    .locals 4
    .param p1, "abortRequestId"    # I
    .param p2, "abortReason"    # I

    .prologue
    .line 159
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v2, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor;->requestQueue:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->size()I

    move-result v2

    if-ge v0, v2, :cond_0

    .line 160
    iget-object v2, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor;->requestQueue:Ljava/util/LinkedList;

    invoke-virtual {v2, v0}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/Intent;

    .line 162
    .local v1, "queuedRequest":Landroid/content/Intent;
    invoke-static {v1}, Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;->getOperationRequestId(Landroid/content/Intent;)I

    move-result v2

    if-ne v2, p1, :cond_1

    .line 163
    const-string v2, "com.robotoworks.mechanoid.op.extras.IS_ABORTED"

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 164
    const-string v2, "com.robotoworks.mechanoid.op.extras.ABORT_REASON"

    invoke-virtual {v1, v2, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 168
    .end local v1    # "queuedRequest":Landroid/content/Intent;
    :cond_0
    return-void

    .line 159
    .restart local v1    # "queuedRequest":Landroid/content/Intent;
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method


# virtual methods
.method protected abstract createOperation(Ljava/lang/String;)Lcom/robotoworks/mechanoid/ops/Operation;
.end method

.method public execute(Landroid/content/Intent;)V
    .locals 6
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v5, 0x0

    .line 118
    iget-boolean v2, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor;->mEnableLogging:Z

    if-eqz v2, :cond_0

    .line 119
    iget-object v2, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor;->mLogTag:Ljava/lang/String;

    const-string v3, "[Execute (Queue)] intent:%s"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    aput-object p1, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 122
    :cond_0
    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    const-string v3, "com.robotoworks.mechanoid.op.actions.ABORT"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 123
    const-string v2, "com.robotoworks.mechanoid.op.extras.REQUEST_ID"

    invoke-virtual {p1, v2, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    .line 124
    .local v1, "abortRequestId":I
    const-string v2, "com.robotoworks.mechanoid.op.extras.ABORT_REASON"

    invoke-virtual {p1, v2, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    .line 126
    .local v0, "abortReason":I
    invoke-direct {p0, v1, v0}, Lcom/robotoworks/mechanoid/ops/OperationProcessor;->abortOperation(II)V

    .line 135
    .end local v0    # "abortReason":I
    .end local v1    # "abortRequestId":I
    :goto_0
    return-void

    .line 132
    :cond_1
    iget-object v2, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor;->requestQueue:Ljava/util/LinkedList;

    invoke-virtual {v2, p1}, Ljava/util/LinkedList;->offer(Ljava/lang/Object;)Z

    .line 134
    invoke-direct {p0}, Lcom/robotoworks/mechanoid/ops/OperationProcessor;->executePendingOperations()V

    goto :goto_0
.end method

.method public hasPendingOperations()Z
    .locals 1

    .prologue
    .line 102
    iget-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor;->requestQueue:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected notifyProgress(ILandroid/os/Bundle;)V
    .locals 3
    .param p1, "progress"    # I
    .param p2, "data"    # Landroid/os/Bundle;

    .prologue
    .line 94
    iget-object v1, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor;->handler:Landroid/os/Handler;

    const/4 v2, 0x3

    invoke-virtual {v1, v2}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    .line 95
    .local v0, "m":Landroid/os/Message;
    iput p1, v0, Landroid/os/Message;->arg1:I

    .line 96
    invoke-virtual {v0, p2}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 98
    iget-object v1, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor;->handler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 99
    return-void
.end method

.method public quit()V
    .locals 4

    .prologue
    .line 194
    iget-boolean v2, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor;->mEnableLogging:Z

    if-eqz v2, :cond_0

    .line 195
    iget-object v2, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor;->mLogTag:Ljava/lang/String;

    const-string v3, "[Quit]"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 198
    :cond_0
    const/4 v0, 0x0

    .line 200
    .local v0, "request":Landroid/content/Intent;
    :goto_0
    iget-object v2, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor;->requestQueue:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->poll()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "request":Landroid/content/Intent;
    check-cast v0, Landroid/content/Intent;

    .restart local v0    # "request":Landroid/content/Intent;
    if-eqz v0, :cond_1

    .line 201
    new-instance v2, Lcom/robotoworks/mechanoid/ops/OperationServiceStoppedException;

    invoke-direct {v2}, Lcom/robotoworks/mechanoid/ops/OperationServiceStoppedException;-><init>()V

    invoke-static {v2}, Lcom/robotoworks/mechanoid/ops/OperationResult;->error(Ljava/lang/Throwable;)Lcom/robotoworks/mechanoid/ops/OperationResult;

    move-result-object v1

    .line 202
    .local v1, "result":Lcom/robotoworks/mechanoid/ops/OperationResult;
    iget-object v2, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor;->mService:Lcom/robotoworks/mechanoid/ops/OperationService;

    invoke-virtual {v1}, Lcom/robotoworks/mechanoid/ops/OperationResult;->toBundle()Landroid/os/Bundle;

    move-result-object v3

    invoke-virtual {v2, v0, v3}, Lcom/robotoworks/mechanoid/ops/OperationService;->onOperationComplete(Landroid/content/Intent;Landroid/os/Bundle;)V

    goto :goto_0

    .line 205
    .end local v1    # "result":Lcom/robotoworks/mechanoid/ops/OperationResult;
    :cond_1
    iget-object v2, p0, Lcom/robotoworks/mechanoid/ops/OperationProcessor;->mWorker:Lcom/robotoworks/mechanoid/ops/OperationProcessor$Worker;

    invoke-virtual {v2}, Lcom/robotoworks/mechanoid/ops/OperationProcessor$Worker;->quit()Z

    .line 206
    return-void
.end method
