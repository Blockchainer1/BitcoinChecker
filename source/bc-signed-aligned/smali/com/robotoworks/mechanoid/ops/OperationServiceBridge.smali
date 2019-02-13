.class public Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;
.super Ljava/lang/Object;
.source "OperationServiceBridge.java"


# static fields
.field public static final MSG_OPERATION_ABORTED:I = 0x4

.field public static final MSG_OPERATION_COMPLETE:I = 0x2

.field public static final MSG_OPERATION_PROGRESS:I = 0x3

.field public static final MSG_OPERATION_STARTING:I = 0x1


# instance fields
.field private mConfigurations:Ljava/util/Hashtable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Hashtable",
            "<",
            "Ljava/lang/String;",
            "Lcom/robotoworks/mechanoid/ops/OperationServiceConfiguration;",
            ">;"
        }
    .end annotation
.end field

.field private mListeners:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lcom/robotoworks/mechanoid/ops/OperationServiceListener;",
            ">;"
        }
    .end annotation
.end field

.field private mLog:Lcom/robotoworks/mechanoid/ops/OperationLog;

.field private mPaused:Z

.field private mPausedRequests:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Landroid/content/Intent;",
            ">;"
        }
    .end annotation
.end field

.field private mPendingRequests:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Landroid/content/Intent;",
            ">;"
        }
    .end annotation
.end field

.field private mRequestIdCounter:I

.field private messenger:Landroid/os/Messenger;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 110
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    const/4 v0, 0x1

    iput v0, p0, Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;->mRequestIdCounter:I

    .line 47
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    iput-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;->mConfigurations:Ljava/util/Hashtable;

    .line 49
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;->mPendingRequests:Landroid/util/SparseArray;

    .line 50
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;->mPausedRequests:Landroid/util/SparseArray;

    .line 52
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    invoke-static {v0}, Lcom/robotoworks/mechanoid/internal/util/Collections;->newSetFromMap(Ljava/util/Map;)Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;->mListeners:Ljava/util/Set;

    .line 54
    new-instance v0, Lcom/robotoworks/mechanoid/ops/OperationLog;

    const/16 v1, 0x3c

    invoke-direct {v0, v1}, Lcom/robotoworks/mechanoid/ops/OperationLog;-><init>(I)V

    iput-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;->mLog:Lcom/robotoworks/mechanoid/ops/OperationLog;

    .line 70
    new-instance v0, Landroid/os/Messenger;

    new-instance v1, Lcom/robotoworks/mechanoid/ops/OperationServiceBridge$1;

    invoke-direct {v1, p0}, Lcom/robotoworks/mechanoid/ops/OperationServiceBridge$1;-><init>(Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;)V

    invoke-direct {v0, v1}, Landroid/os/Messenger;-><init>(Landroid/os/Handler;)V

    iput-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;->messenger:Landroid/os/Messenger;

    .line 111
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;->initConfigurations()V

    .line 112
    return-void
.end method

.method private createRequestId()I
    .locals 2

    .prologue
    .line 146
    iget v0, p0, Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;->mRequestIdCounter:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;->mRequestIdCounter:I

    return v0
.end method

.method public static getOperationRequestId(Landroid/content/Intent;)I
    .locals 2
    .param p0, "intent"    # Landroid/content/Intent;

    .prologue
    .line 67
    const-string v0, "com.robotoworks.mechanoid.op.extras.REQUEST_ID"

    const/4 v1, -0x1

    invoke-virtual {p0, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method private notifyOperationAborted(ILandroid/content/Intent;ILandroid/os/Bundle;)V
    .locals 3
    .param p1, "id"    # I
    .param p2, "intent"    # Landroid/content/Intent;
    .param p3, "reason"    # I
    .param p4, "data"    # Landroid/os/Bundle;

    .prologue
    .line 414
    iget-object v2, p0, Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;->mListeners:Ljava/util/Set;

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/robotoworks/mechanoid/ops/OperationServiceListener;

    .line 415
    .local v1, "listener":Lcom/robotoworks/mechanoid/ops/OperationServiceListener;
    if-eqz v1, :cond_0

    .line 416
    invoke-virtual {v1, p1, p2, p3, p4}, Lcom/robotoworks/mechanoid/ops/OperationServiceListener;->onOperationAborted(ILandroid/content/Intent;ILandroid/os/Bundle;)V

    goto :goto_0

    .line 419
    .end local v1    # "listener":Lcom/robotoworks/mechanoid/ops/OperationServiceListener;
    :cond_1
    return-void
.end method

.method private notifyOperationComplete(ILcom/robotoworks/mechanoid/ops/OperationResult;)V
    .locals 3
    .param p1, "id"    # I
    .param p2, "result"    # Lcom/robotoworks/mechanoid/ops/OperationResult;

    .prologue
    .line 398
    iget-object v2, p0, Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;->mListeners:Ljava/util/Set;

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/robotoworks/mechanoid/ops/OperationServiceListener;

    .line 399
    .local v1, "listener":Lcom/robotoworks/mechanoid/ops/OperationServiceListener;
    if-eqz v1, :cond_0

    .line 400
    invoke-virtual {v1, p1, p2}, Lcom/robotoworks/mechanoid/ops/OperationServiceListener;->onOperationComplete(ILcom/robotoworks/mechanoid/ops/OperationResult;)V

    goto :goto_0

    .line 403
    .end local v1    # "listener":Lcom/robotoworks/mechanoid/ops/OperationServiceListener;
    :cond_1
    return-void
.end method

.method private notifyOperationProgress(ILandroid/content/Intent;ILandroid/os/Bundle;)V
    .locals 3
    .param p1, "id"    # I
    .param p2, "intent"    # Landroid/content/Intent;
    .param p3, "progress"    # I
    .param p4, "data"    # Landroid/os/Bundle;

    .prologue
    .line 406
    iget-object v2, p0, Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;->mListeners:Ljava/util/Set;

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/robotoworks/mechanoid/ops/OperationServiceListener;

    .line 407
    .local v1, "listener":Lcom/robotoworks/mechanoid/ops/OperationServiceListener;
    if-eqz v1, :cond_0

    .line 408
    invoke-virtual {v1, p1, p2, p3, p4}, Lcom/robotoworks/mechanoid/ops/OperationServiceListener;->onOperationProgress(ILandroid/content/Intent;ILandroid/os/Bundle;)V

    goto :goto_0

    .line 411
    .end local v1    # "listener":Lcom/robotoworks/mechanoid/ops/OperationServiceListener;
    :cond_1
    return-void
.end method

.method private notifyOperationStarting(ILandroid/content/Intent;Landroid/os/Bundle;)V
    .locals 3
    .param p1, "id"    # I
    .param p2, "intent"    # Landroid/content/Intent;
    .param p3, "data"    # Landroid/os/Bundle;

    .prologue
    .line 390
    iget-object v2, p0, Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;->mListeners:Ljava/util/Set;

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/robotoworks/mechanoid/ops/OperationServiceListener;

    .line 391
    .local v1, "listener":Lcom/robotoworks/mechanoid/ops/OperationServiceListener;
    if-eqz v1, :cond_0

    .line 392
    invoke-virtual {v1, p1, p2, p3}, Lcom/robotoworks/mechanoid/ops/OperationServiceListener;->onOperationStarting(ILandroid/content/Intent;Landroid/os/Bundle;)V

    goto :goto_0

    .line 395
    .end local v1    # "listener":Lcom/robotoworks/mechanoid/ops/OperationServiceListener;
    :cond_1
    return-void
.end method

.method private removePendingRequestById(I)Landroid/content/Intent;
    .locals 3
    .param p1, "requestId"    # I

    .prologue
    .line 203
    iget-object v2, p0, Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;->mPendingRequests:Landroid/util/SparseArray;

    invoke-virtual {v2, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Intent;

    .line 204
    .local v0, "intent":Landroid/content/Intent;
    if-eqz v0, :cond_1

    .line 205
    iget-object v2, p0, Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;->mPendingRequests:Landroid/util/SparseArray;

    invoke-virtual {v2, p1}, Landroid/util/SparseArray;->delete(I)V

    .line 216
    :cond_0
    :goto_0
    return-object v0

    .line 207
    :cond_1
    iget-boolean v2, p0, Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;->mPaused:Z

    if-eqz v2, :cond_0

    .line 208
    iget-object v2, p0, Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;->mPausedRequests:Landroid/util/SparseArray;

    invoke-virtual {v2, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/Intent;

    .line 210
    .local v1, "pausedIntent":Landroid/content/Intent;
    if-eqz v1, :cond_0

    .line 211
    iget-object v2, p0, Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;->mPausedRequests:Landroid/util/SparseArray;

    invoke-virtual {v2, p1}, Landroid/util/SparseArray;->delete(I)V

    .line 212
    move-object v0, v1

    goto :goto_0
.end method


# virtual methods
.method public abort(II)V
    .locals 5
    .param p1, "id"    # I
    .param p2, "reason"    # I

    .prologue
    .line 243
    iget-object v3, p0, Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;->mPendingRequests:Landroid/util/SparseArray;

    invoke-virtual {v3, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/Intent;

    .line 245
    .local v2, "opIntent":Landroid/content/Intent;
    if-eqz v2, :cond_0

    .line 246
    invoke-static {}, Lcom/robotoworks/mechanoid/Mechanoid;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 247
    .local v0, "context":Landroid/content/Context;
    new-instance v1, Landroid/content/Intent;

    const-string v3, "com.robotoworks.mechanoid.op.actions.ABORT"

    invoke-direct {v1, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 248
    .local v1, "intent":Landroid/content/Intent;
    invoke-virtual {v2}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v0, v3}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 249
    const-string v3, "com.robotoworks.mechanoid.op.extras.BRIDGE_MESSENGER"

    iget-object v4, p0, Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;->messenger:Landroid/os/Messenger;

    invoke-virtual {v1, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 250
    const-string v3, "com.robotoworks.mechanoid.op.extras.REQUEST_ID"

    invoke-virtual {v1, v3, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 251
    const-string v3, "com.robotoworks.mechanoid.op.extras.ABORT_REASON"

    invoke-virtual {v1, v3, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 253
    invoke-virtual {v0, v1}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 256
    .end local v0    # "context":Landroid/content/Context;
    .end local v1    # "intent":Landroid/content/Intent;
    :cond_0
    iget-boolean v3, p0, Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;->mPaused:Z

    if-eqz v3, :cond_1

    .line 257
    iget-object v3, p0, Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;->mPausedRequests:Landroid/util/SparseArray;

    invoke-virtual {v3, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/Intent;

    .line 259
    .restart local v1    # "intent":Landroid/content/Intent;
    if-eqz v1, :cond_1

    .line 260
    new-instance v3, Landroid/os/Bundle;

    invoke-direct {v3}, Landroid/os/Bundle;-><init>()V

    invoke-virtual {p0, p1, p2, v3}, Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;->onOperationAborted(IILandroid/os/Bundle;)V

    .line 263
    .end local v1    # "intent":Landroid/content/Intent;
    :cond_1
    return-void
.end method

.method public bindListener(Lcom/robotoworks/mechanoid/ops/OperationServiceListener;)V
    .locals 1
    .param p1, "listener"    # Lcom/robotoworks/mechanoid/ops/OperationServiceListener;

    .prologue
    .line 333
    iget-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;->mListeners:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 334
    return-void
.end method

.method public execute(Landroid/content/Intent;)I
    .locals 7
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 273
    iget-object v5, p0, Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;->mConfigurations:Ljava/util/Hashtable;

    invoke-virtual {p1}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/robotoworks/mechanoid/ops/OperationServiceConfiguration;

    .line 275
    .local v4, "serviceConfig":Lcom/robotoworks/mechanoid/ops/OperationServiceConfiguration;
    invoke-virtual {v4}, Lcom/robotoworks/mechanoid/ops/OperationServiceConfiguration;->getOperationConfigurationRegistry()Lcom/robotoworks/mechanoid/ops/OperationConfigurationRegistry;

    move-result-object v5

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/robotoworks/mechanoid/ops/OperationConfigurationRegistry;->getOperationConfiguration(Ljava/lang/String;)Lcom/robotoworks/mechanoid/ops/OperationConfiguration;

    move-result-object v2

    .line 277
    .local v2, "opConfig":Lcom/robotoworks/mechanoid/ops/OperationConfiguration;
    invoke-virtual {v2, p0, p1}, Lcom/robotoworks/mechanoid/ops/OperationConfiguration;->findMatchOnConstraint(Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;Landroid/content/Intent;)Landroid/content/Intent;

    move-result-object v3

    .line 279
    .local v3, "pending":Landroid/content/Intent;
    if-eqz v3, :cond_0

    .line 280
    invoke-static {v3}, Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;->getOperationRequestId(Landroid/content/Intent;)I

    move-result v1

    .line 297
    :goto_0
    return v1

    .line 283
    :cond_0
    invoke-virtual {p1}, Landroid/content/Intent;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Intent;

    .line 285
    .local v0, "clonedIntent":Landroid/content/Intent;
    invoke-direct {p0}, Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;->createRequestId()I

    move-result v1

    .line 287
    .local v1, "id":I
    const-string v5, "com.robotoworks.mechanoid.op.extras.BRIDGE_MESSENGER"

    iget-object v6, p0, Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;->messenger:Landroid/os/Messenger;

    invoke-virtual {v0, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 288
    const-string v5, "com.robotoworks.mechanoid.op.extras.REQUEST_ID"

    invoke-virtual {v0, v5, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 290
    iget-boolean v5, p0, Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;->mPaused:Z

    if-eqz v5, :cond_1

    .line 291
    iget-object v5, p0, Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;->mPausedRequests:Landroid/util/SparseArray;

    invoke-virtual {v5, v1, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto :goto_0

    .line 293
    :cond_1
    iget-object v5, p0, Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;->mPendingRequests:Landroid/util/SparseArray;

    invoke-virtual {v5, v1, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 294
    invoke-static {v0}, Lcom/robotoworks/mechanoid/Mechanoid;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    goto :goto_0
.end method

.method public findPendingRequestByAction(Ljava/lang/String;)Landroid/content/Intent;
    .locals 3
    .param p1, "action"    # Ljava/lang/String;

    .prologue
    .line 156
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v2, p0, Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;->mPendingRequests:Landroid/util/SparseArray;

    invoke-virtual {v2}, Landroid/util/SparseArray;->size()I

    move-result v2

    if-ge v0, v2, :cond_2

    .line 157
    iget-object v2, p0, Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;->mPendingRequests:Landroid/util/SparseArray;

    invoke-virtual {v2, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/Intent;

    .line 158
    .local v1, "request":Landroid/content/Intent;
    invoke-virtual {v1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 172
    .end local v1    # "request":Landroid/content/Intent;
    :cond_0
    :goto_1
    return-object v1

    .line 156
    .restart local v1    # "request":Landroid/content/Intent;
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 163
    .end local v1    # "request":Landroid/content/Intent;
    :cond_2
    iget-boolean v2, p0, Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;->mPaused:Z

    if-eqz v2, :cond_3

    .line 164
    const/4 v0, 0x0

    :goto_2
    iget-object v2, p0, Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;->mPausedRequests:Landroid/util/SparseArray;

    invoke-virtual {v2}, Landroid/util/SparseArray;->size()I

    move-result v2

    if-ge v0, v2, :cond_3

    .line 165
    iget-object v2, p0, Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;->mPausedRequests:Landroid/util/SparseArray;

    invoke-virtual {v2, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/Intent;

    .line 166
    .restart local v1    # "request":Landroid/content/Intent;
    invoke-virtual {v1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 164
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 172
    .end local v1    # "request":Landroid/content/Intent;
    :cond_3
    const/4 v1, 0x0

    goto :goto_1
.end method

.method public findPendingRequestByActionWithExtras(Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;
    .locals 3
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "extras"    # Landroid/os/Bundle;

    .prologue
    .line 183
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v2, p0, Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;->mPendingRequests:Landroid/util/SparseArray;

    invoke-virtual {v2}, Landroid/util/SparseArray;->size()I

    move-result v2

    if-ge v0, v2, :cond_2

    .line 184
    iget-object v2, p0, Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;->mPendingRequests:Landroid/util/SparseArray;

    invoke-virtual {v2, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/Intent;

    .line 185
    .local v1, "request":Landroid/content/Intent;
    invoke-virtual {v1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {p0, v1, p2}, Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;->intentContainsExtras(Landroid/content/Intent;Landroid/os/Bundle;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 199
    .end local v1    # "request":Landroid/content/Intent;
    :cond_0
    :goto_1
    return-object v1

    .line 183
    .restart local v1    # "request":Landroid/content/Intent;
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 190
    .end local v1    # "request":Landroid/content/Intent;
    :cond_2
    iget-boolean v2, p0, Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;->mPaused:Z

    if-eqz v2, :cond_4

    .line 191
    const/4 v0, 0x0

    :goto_2
    iget-object v2, p0, Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;->mPausedRequests:Landroid/util/SparseArray;

    invoke-virtual {v2}, Landroid/util/SparseArray;->size()I

    move-result v2

    if-ge v0, v2, :cond_4

    .line 192
    iget-object v2, p0, Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;->mPausedRequests:Landroid/util/SparseArray;

    invoke-virtual {v2, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/Intent;

    .line 193
    .restart local v1    # "request":Landroid/content/Intent;
    invoke-virtual {v1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-virtual {p0, v1, p2}, Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;->intentContainsExtras(Landroid/content/Intent;Landroid/os/Bundle;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 191
    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 199
    .end local v1    # "request":Landroid/content/Intent;
    :cond_4
    const/4 v1, 0x0

    goto :goto_1
.end method

.method public getLog()Lcom/robotoworks/mechanoid/ops/OperationLog;
    .locals 1

    .prologue
    .line 57
    iget-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;->mLog:Lcom/robotoworks/mechanoid/ops/OperationLog;

    return-object v0
.end method

.method protected initConfigurations()V
    .locals 14

    .prologue
    .line 115
    invoke-static {}, Lcom/robotoworks/mechanoid/Mechanoid;->getApplicationContext()Landroid/content/Context;

    move-result-object v12

    invoke-virtual {v12}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v7

    .line 116
    .local v7, "packageName":Ljava/lang/String;
    invoke-static {}, Lcom/robotoworks/mechanoid/Mechanoid;->getApplicationContext()Landroid/content/Context;

    move-result-object v12

    invoke-virtual {v12}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v8

    .line 119
    .local v8, "pm":Landroid/content/pm/PackageManager;
    const/4 v12, 0x4

    :try_start_0
    invoke-virtual {v8, v7, v12}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v5

    .line 121
    .local v5, "info":Landroid/content/pm/PackageInfo;
    iget-object v10, v5, Landroid/content/pm/PackageInfo;->services:[Landroid/content/pm/ServiceInfo;

    .line 123
    .local v10, "services":[Landroid/content/pm/ServiceInfo;
    if-nez v10, :cond_1

    .line 143
    .end local v5    # "info":Landroid/content/pm/PackageInfo;
    .end local v10    # "services":[Landroid/content/pm/ServiceInfo;
    :cond_0
    :goto_0
    return-void

    .line 127
    .restart local v5    # "info":Landroid/content/pm/PackageInfo;
    .restart local v10    # "services":[Landroid/content/pm/ServiceInfo;
    :cond_1
    move-object v0, v10

    .local v0, "arr$":[Landroid/content/pm/ServiceInfo;
    array-length v6, v0

    .local v6, "len$":I
    const/4 v4, 0x0

    .local v4, "i$":I
    :goto_1
    if-ge v4, v6, :cond_0

    aget-object v11, v0, v4

    .line 128
    .local v11, "si":Landroid/content/pm/ServiceInfo;
    iget-object v9, v11, Landroid/content/pm/ServiceInfo;->name:Ljava/lang/String;

    .line 130
    .local v9, "serviceName":Ljava/lang/String;
    const-class v12, Lcom/robotoworks/mechanoid/ops/Ops;

    invoke-virtual {v12}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v12

    invoke-static {v12, v9}, Lcom/robotoworks/mechanoid/ReflectUtil;->loadClassSilently(Ljava/lang/ClassLoader;Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 132
    .local v1, "clz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-eqz v1, :cond_2

    const-class v12, Landroid/app/Service;

    invoke-virtual {v12, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v12

    if-eqz v12, :cond_2

    .line 133
    const-string v12, "CONFIG"

    invoke-static {v1, v12}, Lcom/robotoworks/mechanoid/ReflectUtil;->getFieldSilently(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v3

    .line 134
    .local v3, "field":Ljava/lang/reflect/Field;
    if-eqz v3, :cond_2

    .line 135
    invoke-static {v3}, Lcom/robotoworks/mechanoid/ReflectUtil;->getFieldValueSilently(Ljava/lang/reflect/Field;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/robotoworks/mechanoid/ops/OperationServiceConfiguration;

    .line 136
    .local v2, "factory":Lcom/robotoworks/mechanoid/ops/OperationServiceConfiguration;
    iget-object v12, p0, Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;->mConfigurations:Ljava/util/Hashtable;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 127
    .end local v2    # "factory":Lcom/robotoworks/mechanoid/ops/OperationServiceConfiguration;
    .end local v3    # "field":Ljava/lang/reflect/Field;
    :cond_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 141
    .end local v0    # "arr$":[Landroid/content/pm/ServiceInfo;
    .end local v1    # "clz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v4    # "i$":I
    .end local v5    # "info":Landroid/content/pm/PackageInfo;
    .end local v6    # "len$":I
    .end local v9    # "serviceName":Ljava/lang/String;
    .end local v10    # "services":[Landroid/content/pm/ServiceInfo;
    .end local v11    # "si":Landroid/content/pm/ServiceInfo;
    :catch_0
    move-exception v12

    goto :goto_0
.end method

.method public intentContainsExtras(Landroid/content/Intent;Landroid/os/Bundle;)Z
    .locals 7
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "extras"    # Landroid/os/Bundle;

    .prologue
    const/4 v5, 0x0

    .line 422
    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v3

    .line 424
    .local v3, "intentExtras":Landroid/os/Bundle;
    invoke-virtual {p2}, Landroid/os/Bundle;->keySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 425
    .local v4, "key":Ljava/lang/String;
    invoke-virtual {p2, v4}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 426
    .local v0, "a":Ljava/lang/Object;
    invoke-virtual {v3, v4}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 428
    .local v1, "b":Ljava/lang/Object;
    if-nez v1, :cond_1

    .line 437
    .end local v0    # "a":Ljava/lang/Object;
    .end local v1    # "b":Ljava/lang/Object;
    .end local v4    # "key":Ljava/lang/String;
    :goto_0
    return v5

    .line 432
    .restart local v0    # "a":Ljava/lang/Object;
    .restart local v1    # "b":Ljava/lang/Object;
    .restart local v4    # "key":Ljava/lang/String;
    :cond_1
    invoke-virtual {v1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_0

    goto :goto_0

    .line 437
    .end local v0    # "a":Ljava/lang/Object;
    .end local v1    # "b":Ljava/lang/Object;
    .end local v4    # "key":Ljava/lang/String;
    :cond_2
    const/4 v5, 0x1

    goto :goto_0
.end method

.method public isOperationPending(I)Z
    .locals 3
    .param p1, "id"    # I

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 226
    if-gtz p1, :cond_1

    move v0, v1

    .line 232
    :cond_0
    :goto_0
    return v0

    .line 228
    :cond_1
    iget-boolean v2, p0, Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;->mPaused:Z

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;->mPendingRequests:Landroid/util/SparseArray;

    invoke-virtual {v2, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    if-nez v2, :cond_0

    .line 232
    :cond_2
    iget-object v2, p0, Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;->mPendingRequests:Landroid/util/SparseArray;

    invoke-virtual {v2, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    if-nez v2, :cond_0

    move v0, v1

    goto :goto_0
.end method

.method protected onOperationAborted(IILandroid/os/Bundle;)V
    .locals 1
    .param p1, "id"    # I
    .param p2, "reason"    # I
    .param p3, "data"    # Landroid/os/Bundle;

    .prologue
    .line 382
    invoke-direct {p0, p1}, Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;->removePendingRequestById(I)Landroid/content/Intent;

    move-result-object v0

    .line 384
    .local v0, "intent":Landroid/content/Intent;
    if-eqz v0, :cond_0

    .line 385
    invoke-direct {p0, p1, v0, p2, p3}, Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;->notifyOperationAborted(ILandroid/content/Intent;ILandroid/os/Bundle;)V

    .line 387
    :cond_0
    return-void
.end method

.method protected onOperationComplete(ILandroid/os/Bundle;)V
    .locals 4
    .param p1, "id"    # I
    .param p2, "bundledResult"    # Landroid/os/Bundle;

    .prologue
    .line 357
    invoke-direct {p0, p1}, Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;->removePendingRequestById(I)Landroid/content/Intent;

    move-result-object v0

    .line 359
    .local v0, "intent":Landroid/content/Intent;
    invoke-static {p2}, Lcom/robotoworks/mechanoid/ops/OperationResult;->fromBundle(Landroid/os/Bundle;)Lcom/robotoworks/mechanoid/ops/OperationResult;

    move-result-object v1

    .line 361
    .local v1, "result":Lcom/robotoworks/mechanoid/ops/OperationResult;
    if-eqz v0, :cond_0

    .line 363
    invoke-virtual {v1, v0}, Lcom/robotoworks/mechanoid/ops/OperationResult;->setRequest(Landroid/content/Intent;)V

    .line 365
    iget-object v2, p0, Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;->mLog:Lcom/robotoworks/mechanoid/ops/OperationLog;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3, v1}, Lcom/robotoworks/mechanoid/ops/OperationLog;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 367
    invoke-direct {p0, p1, v1}, Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;->notifyOperationComplete(ILcom/robotoworks/mechanoid/ops/OperationResult;)V

    .line 369
    :cond_0
    return-void
.end method

.method protected onOperationProgress(IILandroid/os/Bundle;)V
    .locals 2
    .param p1, "id"    # I
    .param p2, "progress"    # I
    .param p3, "data"    # Landroid/os/Bundle;

    .prologue
    .line 373
    iget-object v1, p0, Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;->mPendingRequests:Landroid/util/SparseArray;

    invoke-virtual {v1, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Intent;

    .line 375
    .local v0, "intent":Landroid/content/Intent;
    if-eqz v0, :cond_0

    .line 376
    invoke-direct {p0, p1, v0, p2, p3}, Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;->notifyOperationProgress(ILandroid/content/Intent;ILandroid/os/Bundle;)V

    .line 378
    :cond_0
    return-void
.end method

.method protected onOperationStarting(ILandroid/os/Bundle;)V
    .locals 2
    .param p1, "id"    # I
    .param p2, "data"    # Landroid/os/Bundle;

    .prologue
    .line 346
    iget-object v1, p0, Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;->mPendingRequests:Landroid/util/SparseArray;

    invoke-virtual {v1, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Intent;

    .line 348
    .local v0, "intent":Landroid/content/Intent;
    if-eqz v0, :cond_1

    .line 349
    if-nez p2, :cond_0

    .line 350
    new-instance p2, Landroid/os/Bundle;

    .end local p2    # "data":Landroid/os/Bundle;
    invoke-direct {p2}, Landroid/os/Bundle;-><init>()V

    .line 352
    .restart local p2    # "data":Landroid/os/Bundle;
    :cond_0
    invoke-direct {p0, p1, v0, p2}, Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;->notifyOperationStarting(ILandroid/content/Intent;Landroid/os/Bundle;)V

    .line 354
    :cond_1
    return-void
.end method

.method public pause(Z)V
    .locals 4
    .param p1, "pause"    # Z

    .prologue
    .line 308
    iget-boolean v2, p0, Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;->mPaused:Z

    if-eqz v2, :cond_1

    if-nez p1, :cond_1

    .line 311
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;->mPaused:Z

    .line 313
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v2, p0, Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;->mPausedRequests:Landroid/util/SparseArray;

    invoke-virtual {v2}, Landroid/util/SparseArray;->size()I

    move-result v2

    if-ge v0, v2, :cond_0

    .line 314
    iget-object v2, p0, Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;->mPausedRequests:Landroid/util/SparseArray;

    invoke-virtual {v2, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/Intent;

    .line 316
    .local v1, "request":Landroid/content/Intent;
    iget-object v2, p0, Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;->mPendingRequests:Landroid/util/SparseArray;

    iget-object v3, p0, Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;->mPausedRequests:Landroid/util/SparseArray;

    invoke-virtual {v3, v0}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v3

    invoke-virtual {v2, v3, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 318
    invoke-static {v1}, Lcom/robotoworks/mechanoid/Mechanoid;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 313
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 321
    .end local v1    # "request":Landroid/content/Intent;
    :cond_0
    iget-object v2, p0, Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;->mPausedRequests:Landroid/util/SparseArray;

    invoke-virtual {v2}, Landroid/util/SparseArray;->clear()V

    .line 324
    .end local v0    # "i":I
    :cond_1
    iput-boolean p1, p0, Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;->mPaused:Z

    .line 325
    return-void
.end method

.method public unbindListener(Lcom/robotoworks/mechanoid/ops/OperationServiceListener;)V
    .locals 1
    .param p1, "listener"    # Lcom/robotoworks/mechanoid/ops/OperationServiceListener;

    .prologue
    .line 342
    iget-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;->mListeners:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 343
    return-void
.end method
