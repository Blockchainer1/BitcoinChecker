.class public abstract Lcom/robotoworks/mechanoid/ops/OperationManagerBase;
.super Ljava/lang/Object;
.source "OperationManagerBase.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/robotoworks/mechanoid/ops/OperationManagerBase$OpInfo;
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "OperationManager"


# instance fields
.field mCallbacks:Lcom/robotoworks/mechanoid/ops/OperationManagerCallbacks;

.field private mEnableLogging:Z

.field private mOperations:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Lcom/robotoworks/mechanoid/ops/OperationManagerBase$OpInfo;",
            ">;"
        }
    .end annotation
.end field

.field private mPendingOperations:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue",
            "<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field private mServiceListener:Lcom/robotoworks/mechanoid/ops/OperationServiceListener;

.field private mStarted:Z

.field private mStateKey:Ljava/lang/String;


# direct methods
.method protected constructor <init>(Lcom/robotoworks/mechanoid/ops/OperationManagerCallbacks;Z)V
    .locals 1
    .param p1, "callbacks"    # Lcom/robotoworks/mechanoid/ops/OperationManagerCallbacks;
    .param p2, "enableLogging"    # Z

    .prologue
    .line 114
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationManagerBase;->mOperations:Landroid/util/SparseArray;

    .line 40
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationManagerBase;->mPendingOperations:Ljava/util/Queue;

    .line 42
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/robotoworks/mechanoid/ops/OperationManagerBase;->mStarted:Z

    .line 89
    new-instance v0, Lcom/robotoworks/mechanoid/ops/OperationManagerBase$1;

    invoke-direct {v0, p0}, Lcom/robotoworks/mechanoid/ops/OperationManagerBase$1;-><init>(Lcom/robotoworks/mechanoid/ops/OperationManagerBase;)V

    iput-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationManagerBase;->mServiceListener:Lcom/robotoworks/mechanoid/ops/OperationServiceListener;

    .line 115
    iput-object p1, p0, Lcom/robotoworks/mechanoid/ops/OperationManagerBase;->mCallbacks:Lcom/robotoworks/mechanoid/ops/OperationManagerCallbacks;

    .line 116
    iput-boolean p2, p0, Lcom/robotoworks/mechanoid/ops/OperationManagerBase;->mEnableLogging:Z

    .line 117
    const-string v0, "com.robotoworks.mechanoid.ops.OperationManager.State"

    iput-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationManagerBase;->mStateKey:Ljava/lang/String;

    .line 118
    return-void
.end method

.method static synthetic access$000(Lcom/robotoworks/mechanoid/ops/OperationManagerBase;I)Lcom/robotoworks/mechanoid/ops/OperationManagerBase$OpInfo;
    .locals 1
    .param p0, "x0"    # Lcom/robotoworks/mechanoid/ops/OperationManagerBase;
    .param p1, "x1"    # I

    .prologue
    .line 28
    invoke-direct {p0, p1}, Lcom/robotoworks/mechanoid/ops/OperationManagerBase;->findOperationInfoByRequestId(I)Lcom/robotoworks/mechanoid/ops/OperationManagerBase$OpInfo;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$100(Lcom/robotoworks/mechanoid/ops/OperationManagerBase;)Z
    .locals 1
    .param p0, "x0"    # Lcom/robotoworks/mechanoid/ops/OperationManagerBase;

    .prologue
    .line 28
    iget-boolean v0, p0, Lcom/robotoworks/mechanoid/ops/OperationManagerBase;->mEnableLogging:Z

    return v0
.end method

.method private ensureCallbacks()V
    .locals 10

    .prologue
    const/4 v9, 0x2

    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 190
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v3, p0, Lcom/robotoworks/mechanoid/ops/OperationManagerBase;->mOperations:Landroid/util/SparseArray;

    invoke-virtual {v3}, Landroid/util/SparseArray;->size()I

    move-result v3

    if-ge v0, v3, :cond_3

    .line 191
    iget-object v3, p0, Lcom/robotoworks/mechanoid/ops/OperationManagerBase;->mOperations:Landroid/util/SparseArray;

    invoke-virtual {v3, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/robotoworks/mechanoid/ops/OperationManagerBase$OpInfo;

    .line 193
    .local v1, "op":Lcom/robotoworks/mechanoid/ops/OperationManagerBase$OpInfo;
    iget v3, v1, Lcom/robotoworks/mechanoid/ops/OperationManagerBase$OpInfo;->mId:I

    invoke-static {v3}, Lcom/robotoworks/mechanoid/ops/Ops;->isOperationPending(I)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 195
    iget-boolean v3, p0, Lcom/robotoworks/mechanoid/ops/OperationManagerBase;->mEnableLogging:Z

    if-eqz v3, :cond_0

    .line 196
    const-string v3, "OperationManager"

    const-string v4, "[Operation Pending] request id: %s, user code:%s"

    new-array v5, v9, [Ljava/lang/Object;

    iget v6, v1, Lcom/robotoworks/mechanoid/ops/OperationManagerBase$OpInfo;->mId:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v7

    iget v6, v1, Lcom/robotoworks/mechanoid/ops/OperationManagerBase$OpInfo;->mUserCode:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v8

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 199
    :cond_0
    iget v3, v1, Lcom/robotoworks/mechanoid/ops/OperationManagerBase$OpInfo;->mUserCode:I

    invoke-virtual {p0, v3}, Lcom/robotoworks/mechanoid/ops/OperationManagerBase;->invokeOnOperationPending(I)Z

    .line 190
    :cond_1
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 204
    :cond_2
    invoke-static {}, Lcom/robotoworks/mechanoid/ops/Ops;->getLog()Lcom/robotoworks/mechanoid/ops/OperationLog;

    move-result-object v3

    iget v4, v1, Lcom/robotoworks/mechanoid/ops/OperationManagerBase$OpInfo;->mId:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/robotoworks/mechanoid/ops/OperationLog;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/robotoworks/mechanoid/ops/OperationResult;

    .line 206
    .local v2, "result":Lcom/robotoworks/mechanoid/ops/OperationResult;
    if-eqz v2, :cond_1

    .line 207
    iput-object v2, v1, Lcom/robotoworks/mechanoid/ops/OperationManagerBase$OpInfo;->mResult:Lcom/robotoworks/mechanoid/ops/OperationResult;

    .line 209
    iget-boolean v3, v1, Lcom/robotoworks/mechanoid/ops/OperationManagerBase$OpInfo;->mCallbackInvoked:Z

    if-nez v3, :cond_1

    .line 211
    iget v3, v1, Lcom/robotoworks/mechanoid/ops/OperationManagerBase$OpInfo;->mUserCode:I

    iget-object v4, v1, Lcom/robotoworks/mechanoid/ops/OperationManagerBase$OpInfo;->mResult:Lcom/robotoworks/mechanoid/ops/OperationResult;

    invoke-virtual {p0, v3, v4, v7}, Lcom/robotoworks/mechanoid/ops/OperationManagerBase;->invokeOnOperationComplete(ILcom/robotoworks/mechanoid/ops/OperationResult;Z)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 213
    iput-boolean v8, v1, Lcom/robotoworks/mechanoid/ops/OperationManagerBase$OpInfo;->mCallbackInvoked:Z

    .line 215
    iget-boolean v3, p0, Lcom/robotoworks/mechanoid/ops/OperationManagerBase;->mEnableLogging:Z

    if-eqz v3, :cond_1

    .line 216
    const-string v3, "OperationManager"

    const-string v4, "[Operation Complete] request id: %s, user code:%s"

    new-array v5, v9, [Ljava/lang/Object;

    iget v6, v1, Lcom/robotoworks/mechanoid/ops/OperationManagerBase$OpInfo;->mId:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v7

    iget v6, v1, Lcom/robotoworks/mechanoid/ops/OperationManagerBase$OpInfo;->mUserCode:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v8

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 224
    .end local v1    # "op":Lcom/robotoworks/mechanoid/ops/OperationManagerBase$OpInfo;
    .end local v2    # "result":Lcom/robotoworks/mechanoid/ops/OperationResult;
    :cond_3
    return-void
.end method

.method private executePendingOperations()V
    .locals 1

    .prologue
    .line 184
    :goto_0
    iget-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationManagerBase;->mPendingOperations:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->peek()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 185
    iget-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationManagerBase;->mPendingOperations:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    goto :goto_0

    .line 187
    :cond_0
    return-void
.end method

.method private findOperationInfoByRequestId(I)Lcom/robotoworks/mechanoid/ops/OperationManagerBase$OpInfo;
    .locals 3
    .param p1, "requestId"    # I

    .prologue
    .line 129
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v2, p0, Lcom/robotoworks/mechanoid/ops/OperationManagerBase;->mOperations:Landroid/util/SparseArray;

    invoke-virtual {v2}, Landroid/util/SparseArray;->size()I

    move-result v2

    if-ge v0, v2, :cond_1

    .line 130
    iget-object v2, p0, Lcom/robotoworks/mechanoid/ops/OperationManagerBase;->mOperations:Landroid/util/SparseArray;

    invoke-virtual {v2, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/robotoworks/mechanoid/ops/OperationManagerBase$OpInfo;

    .line 131
    .local v1, "op":Lcom/robotoworks/mechanoid/ops/OperationManagerBase$OpInfo;
    iget v2, v1, Lcom/robotoworks/mechanoid/ops/OperationManagerBase$OpInfo;->mId:I

    if-ne v2, p1, :cond_0

    .line 136
    .end local v1    # "op":Lcom/robotoworks/mechanoid/ops/OperationManagerBase$OpInfo;
    :goto_1
    return-object v1

    .line 129
    .restart local v1    # "op":Lcom/robotoworks/mechanoid/ops/OperationManagerBase$OpInfo;
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 136
    .end local v1    # "op":Lcom/robotoworks/mechanoid/ops/OperationManagerBase$OpInfo;
    :cond_1
    const/4 v1, 0x0

    goto :goto_1
.end method

.method private queuePendingOperation(Landroid/content/Intent;IZ)V
    .locals 2
    .param p1, "operationIntent"    # Landroid/content/Intent;
    .param p2, "pendingOperationCode"    # I
    .param p3, "pendingForce"    # Z

    .prologue
    .line 311
    iget-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationManagerBase;->mPendingOperations:Ljava/util/Queue;

    new-instance v1, Lcom/robotoworks/mechanoid/ops/OperationManagerBase$2;

    invoke-direct {v1, p0, p1, p2, p3}, Lcom/robotoworks/mechanoid/ops/OperationManagerBase$2;-><init>(Lcom/robotoworks/mechanoid/ops/OperationManagerBase;Landroid/content/Intent;IZ)V

    invoke-interface {v0, v1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 319
    return-void
.end method


# virtual methods
.method public execute(Landroid/content/Intent;IZ)V
    .locals 8
    .param p1, "operationIntent"    # Landroid/content/Intent;
    .param p2, "code"    # I
    .param p3, "force"    # Z

    .prologue
    const/4 v6, 0x0

    const/4 v7, 0x1

    .line 260
    if-nez p1, :cond_1

    .line 261
    const-string v2, "OperationManager"

    const-string v3, "[Operation Null] operationintent argument was null, code:%s"

    new-array v4, v7, [Ljava/lang/Object;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 308
    :cond_0
    :goto_0
    return-void

    .line 265
    :cond_1
    iget-boolean v2, p0, Lcom/robotoworks/mechanoid/ops/OperationManagerBase;->mStarted:Z

    if-nez v2, :cond_3

    .line 266
    iget-boolean v2, p0, Lcom/robotoworks/mechanoid/ops/OperationManagerBase;->mEnableLogging:Z

    if-eqz v2, :cond_2

    .line 267
    const-string v2, "OperationManager"

    const-string v3, "[Queue Operation] manager not started, queueing, user code:%s"

    new-array v4, v7, [Ljava/lang/Object;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 269
    :cond_2
    invoke-direct {p0, p1, p2, p3}, Lcom/robotoworks/mechanoid/ops/OperationManagerBase;->queuePendingOperation(Landroid/content/Intent;IZ)V

    goto :goto_0

    .line 273
    :cond_3
    iget-object v2, p0, Lcom/robotoworks/mechanoid/ops/OperationManagerBase;->mOperations:Landroid/util/SparseArray;

    invoke-virtual {v2, p2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/robotoworks/mechanoid/ops/OperationManagerBase$OpInfo;

    .line 275
    .local v1, "op":Lcom/robotoworks/mechanoid/ops/OperationManagerBase$OpInfo;
    if-nez p3, :cond_4

    if-nez v1, :cond_7

    .line 276
    :cond_4
    iget-object v2, p0, Lcom/robotoworks/mechanoid/ops/OperationManagerBase;->mOperations:Landroid/util/SparseArray;

    invoke-virtual {v2, p2}, Landroid/util/SparseArray;->delete(I)V

    .line 278
    iget-boolean v2, p0, Lcom/robotoworks/mechanoid/ops/OperationManagerBase;->mEnableLogging:Z

    if-eqz v2, :cond_5

    .line 279
    const-string v2, "OperationManager"

    const-string v3, "[Operation Pending] user code:%s"

    new-array v4, v7, [Ljava/lang/Object;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 282
    :cond_5
    invoke-virtual {p0, p2}, Lcom/robotoworks/mechanoid/ops/OperationManagerBase;->invokeOnOperationPending(I)Z

    .line 284
    iget-boolean v2, p0, Lcom/robotoworks/mechanoid/ops/OperationManagerBase;->mEnableLogging:Z

    if-eqz v2, :cond_6

    .line 285
    const-string v2, "OperationManager"

    const-string v3, "[Execute Operation] user code:%s"

    new-array v4, v7, [Ljava/lang/Object;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 288
    :cond_6
    new-instance v0, Lcom/robotoworks/mechanoid/ops/OperationManagerBase$OpInfo;

    invoke-direct {v0}, Lcom/robotoworks/mechanoid/ops/OperationManagerBase$OpInfo;-><init>()V

    .line 289
    .local v0, "newOp":Lcom/robotoworks/mechanoid/ops/OperationManagerBase$OpInfo;
    iput p2, v0, Lcom/robotoworks/mechanoid/ops/OperationManagerBase$OpInfo;->mUserCode:I

    .line 290
    iput-object p1, v0, Lcom/robotoworks/mechanoid/ops/OperationManagerBase$OpInfo;->mIntent:Landroid/content/Intent;

    .line 292
    iget-object v2, p0, Lcom/robotoworks/mechanoid/ops/OperationManagerBase;->mOperations:Landroid/util/SparseArray;

    invoke-virtual {v2, p2, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 294
    invoke-static {p1}, Lcom/robotoworks/mechanoid/ops/Ops;->execute(Landroid/content/Intent;)I

    move-result v2

    iput v2, v0, Lcom/robotoworks/mechanoid/ops/OperationManagerBase$OpInfo;->mId:I

    goto :goto_0

    .line 299
    .end local v0    # "newOp":Lcom/robotoworks/mechanoid/ops/OperationManagerBase$OpInfo;
    :cond_7
    iget-object v2, v1, Lcom/robotoworks/mechanoid/ops/OperationManagerBase$OpInfo;->mResult:Lcom/robotoworks/mechanoid/ops/OperationResult;

    if-eqz v2, :cond_0

    .line 300
    iget-boolean v2, p0, Lcom/robotoworks/mechanoid/ops/OperationManagerBase;->mEnableLogging:Z

    if-eqz v2, :cond_8

    .line 301
    const-string v2, "OperationManager"

    const-string v3, "[Operation Complete] request id: %s, user code:%s, from cache:%s"

    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/Object;

    iget v5, v1, Lcom/robotoworks/mechanoid/ops/OperationManagerBase$OpInfo;->mId:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v6

    iget v5, v1, Lcom/robotoworks/mechanoid/ops/OperationManagerBase$OpInfo;->mUserCode:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v7

    const/4 v5, 0x2

    iget-boolean v6, v1, Lcom/robotoworks/mechanoid/ops/OperationManagerBase$OpInfo;->mCallbackInvoked:Z

    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 304
    :cond_8
    iget v2, v1, Lcom/robotoworks/mechanoid/ops/OperationManagerBase$OpInfo;->mUserCode:I

    iget-object v3, v1, Lcom/robotoworks/mechanoid/ops/OperationManagerBase$OpInfo;->mResult:Lcom/robotoworks/mechanoid/ops/OperationResult;

    iget-boolean v4, v1, Lcom/robotoworks/mechanoid/ops/OperationManagerBase$OpInfo;->mCallbackInvoked:Z

    invoke-virtual {p0, v2, v3, v4}, Lcom/robotoworks/mechanoid/ops/OperationManagerBase;->invokeOnOperationComplete(ILcom/robotoworks/mechanoid/ops/OperationResult;Z)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 305
    iput-boolean v7, v1, Lcom/robotoworks/mechanoid/ops/OperationManagerBase$OpInfo;->mCallbackInvoked:Z

    goto/16 :goto_0
.end method

.method protected invokeOnOperationComplete(ILcom/robotoworks/mechanoid/ops/OperationResult;Z)Z
    .locals 1
    .param p1, "code"    # I
    .param p2, "result"    # Lcom/robotoworks/mechanoid/ops/OperationResult;
    .param p3, "fromCache"    # Z

    .prologue
    .line 332
    iget-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationManagerBase;->mCallbacks:Lcom/robotoworks/mechanoid/ops/OperationManagerCallbacks;

    if-nez v0, :cond_0

    .line 333
    const/4 v0, 0x0

    .line 337
    :goto_0
    return v0

    .line 336
    :cond_0
    iget-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationManagerBase;->mCallbacks:Lcom/robotoworks/mechanoid/ops/OperationManagerCallbacks;

    invoke-interface {v0, p1, p2, p3}, Lcom/robotoworks/mechanoid/ops/OperationManagerCallbacks;->onOperationComplete(ILcom/robotoworks/mechanoid/ops/OperationResult;Z)V

    .line 337
    const/4 v0, 0x1

    goto :goto_0
.end method

.method protected invokeOnOperationPending(I)Z
    .locals 1
    .param p1, "code"    # I

    .prologue
    .line 323
    iget-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationManagerBase;->mCallbacks:Lcom/robotoworks/mechanoid/ops/OperationManagerCallbacks;

    if-nez v0, :cond_0

    .line 324
    const/4 v0, 0x0

    .line 328
    :goto_0
    return v0

    .line 327
    :cond_0
    iget-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationManagerBase;->mCallbacks:Lcom/robotoworks/mechanoid/ops/OperationManagerCallbacks;

    invoke-interface {v0, p1}, Lcom/robotoworks/mechanoid/ops/OperationManagerCallbacks;->onOperationPending(I)V

    .line 328
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public removeCallbacks()V
    .locals 1

    .prologue
    .line 121
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationManagerBase;->mCallbacks:Lcom/robotoworks/mechanoid/ops/OperationManagerCallbacks;

    .line 122
    return-void
.end method

.method restoreState(Landroid/os/Bundle;)V
    .locals 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 140
    if-eqz p1, :cond_0

    .line 141
    iget-object v1, p0, Lcom/robotoworks/mechanoid/ops/OperationManagerBase;->mStateKey:Ljava/lang/String;

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    .line 143
    .local v0, "state":Landroid/os/Bundle;
    if-eqz v0, :cond_0

    .line 144
    const-string v1, "operations"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getSparseParcelableArray(Ljava/lang/String;)Landroid/util/SparseArray;

    move-result-object v1

    iput-object v1, p0, Lcom/robotoworks/mechanoid/ops/OperationManagerBase;->mOperations:Landroid/util/SparseArray;

    .line 146
    iget-boolean v1, p0, Lcom/robotoworks/mechanoid/ops/OperationManagerBase;->mEnableLogging:Z

    if-eqz v1, :cond_0

    .line 147
    const-string v1, "OperationManager"

    const-string v2, "[Restoring State]"

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 151
    .end local v0    # "state":Landroid/os/Bundle;
    :cond_0
    return-void
.end method

.method saveState(Landroid/os/Bundle;)V
    .locals 4
    .param p1, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 155
    iget-boolean v1, p0, Lcom/robotoworks/mechanoid/ops/OperationManagerBase;->mEnableLogging:Z

    if-eqz v1, :cond_0

    .line 156
    const-string v1, "OperationManager"

    const-string v2, "[Saving State]"

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 159
    :cond_0
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 160
    .local v0, "state":Landroid/os/Bundle;
    const-string v1, "operations"

    iget-object v2, p0, Lcom/robotoworks/mechanoid/ops/OperationManagerBase;->mOperations:Landroid/util/SparseArray;

    invoke-virtual {p1, v1, v2}, Landroid/os/Bundle;->putSparseParcelableArray(Ljava/lang/String;Landroid/util/SparseArray;)V

    .line 162
    iget-object v1, p0, Lcom/robotoworks/mechanoid/ops/OperationManagerBase;->mStateKey:Ljava/lang/String;

    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 163
    return-void
.end method

.method public setCallbacks(Lcom/robotoworks/mechanoid/ops/OperationManagerCallbacks;)V
    .locals 0
    .param p1, "callbacks"    # Lcom/robotoworks/mechanoid/ops/OperationManagerCallbacks;

    .prologue
    .line 125
    iput-object p1, p0, Lcom/robotoworks/mechanoid/ops/OperationManagerBase;->mCallbacks:Lcom/robotoworks/mechanoid/ops/OperationManagerCallbacks;

    .line 126
    return-void
.end method

.method start()V
    .locals 3

    .prologue
    .line 166
    iget-boolean v0, p0, Lcom/robotoworks/mechanoid/ops/OperationManagerBase;->mStarted:Z

    if-eqz v0, :cond_0

    .line 181
    :goto_0
    return-void

    .line 170
    :cond_0
    iget-boolean v0, p0, Lcom/robotoworks/mechanoid/ops/OperationManagerBase;->mEnableLogging:Z

    if-eqz v0, :cond_1

    .line 171
    const-string v0, "OperationManager"

    const-string v1, "[Starting]"

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 174
    :cond_1
    iget-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationManagerBase;->mServiceListener:Lcom/robotoworks/mechanoid/ops/OperationServiceListener;

    invoke-static {v0}, Lcom/robotoworks/mechanoid/ops/Ops;->bindListener(Lcom/robotoworks/mechanoid/ops/OperationServiceListener;)V

    .line 176
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/robotoworks/mechanoid/ops/OperationManagerBase;->mStarted:Z

    .line 178
    invoke-direct {p0}, Lcom/robotoworks/mechanoid/ops/OperationManagerBase;->ensureCallbacks()V

    .line 180
    invoke-direct {p0}, Lcom/robotoworks/mechanoid/ops/OperationManagerBase;->executePendingOperations()V

    goto :goto_0
.end method

.method stop()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 228
    iget-boolean v0, p0, Lcom/robotoworks/mechanoid/ops/OperationManagerBase;->mStarted:Z

    if-nez v0, :cond_0

    .line 239
    :goto_0
    return-void

    .line 232
    :cond_0
    iput-boolean v2, p0, Lcom/robotoworks/mechanoid/ops/OperationManagerBase;->mStarted:Z

    .line 234
    iget-boolean v0, p0, Lcom/robotoworks/mechanoid/ops/OperationManagerBase;->mEnableLogging:Z

    if-eqz v0, :cond_1

    .line 235
    const-string v0, "OperationManager"

    const-string v1, "[Stopping]"

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 238
    :cond_1
    iget-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationManagerBase;->mServiceListener:Lcom/robotoworks/mechanoid/ops/OperationServiceListener;

    invoke-static {v0}, Lcom/robotoworks/mechanoid/ops/Ops;->unbindListener(Lcom/robotoworks/mechanoid/ops/OperationServiceListener;)V

    goto :goto_0
.end method
