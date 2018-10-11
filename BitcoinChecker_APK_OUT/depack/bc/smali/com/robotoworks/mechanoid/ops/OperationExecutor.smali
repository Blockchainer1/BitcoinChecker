.class public Lcom/robotoworks/mechanoid/ops/OperationExecutor;
.super Ljava/lang/Object;
.source "OperationExecutor.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/robotoworks/mechanoid/ops/OperationExecutor$OpInfo;
    }
.end annotation


# static fields
.field public static final MODE_ALWAYS:I = 0x1

.field public static final MODE_ONCE:I = 0x0

.field public static final MODE_ON_ERROR:I = 0x2

.field private static final STATE_KEY:Ljava/lang/String; = "com.robotoworks.mechanoid.ops.OperationExecutor.State"

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mCallbacksRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/robotoworks/mechanoid/ops/OperationExecutorCallbacks;",
            ">;"
        }
    .end annotation
.end field

.field private mEnableLogging:Z

.field private mOpInfo:Lcom/robotoworks/mechanoid/ops/OperationExecutor$OpInfo;

.field private mServiceListener:Lcom/robotoworks/mechanoid/ops/OperationServiceListener;

.field private mUserStateKey:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 38
    const-class v0, Lcom/robotoworks/mechanoid/ops/OperationExecutor;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/robotoworks/mechanoid/ops/OperationExecutor;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Landroid/os/Bundle;Lcom/robotoworks/mechanoid/ops/OperationExecutorCallbacks;)V
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;
    .param p3, "callbacks"    # Lcom/robotoworks/mechanoid/ops/OperationExecutorCallbacks;

    .prologue
    .line 57
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/robotoworks/mechanoid/ops/OperationExecutor;-><init>(Ljava/lang/String;Landroid/os/Bundle;Lcom/robotoworks/mechanoid/ops/OperationExecutorCallbacks;Z)V

    .line 58
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Landroid/os/Bundle;Lcom/robotoworks/mechanoid/ops/OperationExecutorCallbacks;Z)V
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;
    .param p3, "callbacks"    # Lcom/robotoworks/mechanoid/ops/OperationExecutorCallbacks;
    .param p4, "enableLogging"    # Z

    .prologue
    .line 66
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 175
    new-instance v0, Lcom/robotoworks/mechanoid/ops/OperationExecutor$1;

    invoke-direct {v0, p0}, Lcom/robotoworks/mechanoid/ops/OperationExecutor$1;-><init>(Lcom/robotoworks/mechanoid/ops/OperationExecutor;)V

    iput-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationExecutor;->mServiceListener:Lcom/robotoworks/mechanoid/ops/OperationServiceListener;

    .line 67
    iput-object p1, p0, Lcom/robotoworks/mechanoid/ops/OperationExecutor;->mUserStateKey:Ljava/lang/String;

    .line 68
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p3}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationExecutor;->mCallbacksRef:Ljava/lang/ref/WeakReference;

    .line 69
    iput-boolean p4, p0, Lcom/robotoworks/mechanoid/ops/OperationExecutor;->mEnableLogging:Z

    .line 71
    invoke-direct {p0, p2}, Lcom/robotoworks/mechanoid/ops/OperationExecutor;->restoreState(Landroid/os/Bundle;)V

    .line 73
    iget-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationExecutor;->mServiceListener:Lcom/robotoworks/mechanoid/ops/OperationServiceListener;

    invoke-static {v0}, Lcom/robotoworks/mechanoid/ops/Ops;->bindListener(Lcom/robotoworks/mechanoid/ops/OperationServiceListener;)V

    .line 75
    invoke-direct {p0}, Lcom/robotoworks/mechanoid/ops/OperationExecutor;->ensureCallbacks()V

    .line 76
    return-void
.end method

.method static synthetic access$000(Lcom/robotoworks/mechanoid/ops/OperationExecutor;)Lcom/robotoworks/mechanoid/ops/OperationExecutor$OpInfo;
    .locals 1
    .param p0, "x0"    # Lcom/robotoworks/mechanoid/ops/OperationExecutor;

    .prologue
    .line 14
    iget-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationExecutor;->mOpInfo:Lcom/robotoworks/mechanoid/ops/OperationExecutor$OpInfo;

    return-object v0
.end method

.method static synthetic access$100(Lcom/robotoworks/mechanoid/ops/OperationExecutor;)Z
    .locals 1
    .param p0, "x0"    # Lcom/robotoworks/mechanoid/ops/OperationExecutor;

    .prologue
    .line 14
    iget-boolean v0, p0, Lcom/robotoworks/mechanoid/ops/OperationExecutor;->mEnableLogging:Z

    return v0
.end method

.method static synthetic access$200()Ljava/lang/String;
    .locals 1

    .prologue
    .line 14
    sget-object v0, Lcom/robotoworks/mechanoid/ops/OperationExecutor;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$300(Lcom/robotoworks/mechanoid/ops/OperationExecutor;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/robotoworks/mechanoid/ops/OperationExecutor;

    .prologue
    .line 14
    iget-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationExecutor;->mUserStateKey:Ljava/lang/String;

    return-object v0
.end method

.method private completeOperation()V
    .locals 6

    .prologue
    const/4 v5, 0x1

    .line 360
    iget-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationExecutor;->mOpInfo:Lcom/robotoworks/mechanoid/ops/OperationExecutor$OpInfo;

    iget-object v0, v0, Lcom/robotoworks/mechanoid/ops/OperationExecutor$OpInfo;->mResult:Lcom/robotoworks/mechanoid/ops/OperationResult;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationExecutor;->mOpInfo:Lcom/robotoworks/mechanoid/ops/OperationExecutor$OpInfo;

    iget-boolean v0, v0, Lcom/robotoworks/mechanoid/ops/OperationExecutor$OpInfo;->mCallbackInvoked:Z

    if-nez v0, :cond_1

    .line 361
    iget-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationExecutor;->mOpInfo:Lcom/robotoworks/mechanoid/ops/OperationExecutor$OpInfo;

    iget-object v0, v0, Lcom/robotoworks/mechanoid/ops/OperationExecutor$OpInfo;->mResult:Lcom/robotoworks/mechanoid/ops/OperationResult;

    invoke-virtual {p0, v0}, Lcom/robotoworks/mechanoid/ops/OperationExecutor;->invokeOnOperationComplete(Lcom/robotoworks/mechanoid/ops/OperationResult;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 362
    iget-boolean v0, p0, Lcom/robotoworks/mechanoid/ops/OperationExecutor;->mEnableLogging:Z

    if-eqz v0, :cond_0

    .line 363
    sget-object v0, Lcom/robotoworks/mechanoid/ops/OperationExecutor;->TAG:Ljava/lang/String;

    const-string v1, "[Operation Complete] request id: %s, key: %s"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-object v4, p0, Lcom/robotoworks/mechanoid/ops/OperationExecutor;->mOpInfo:Lcom/robotoworks/mechanoid/ops/OperationExecutor$OpInfo;

    iget v4, v4, Lcom/robotoworks/mechanoid/ops/OperationExecutor$OpInfo;->mId:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    iget-object v3, p0, Lcom/robotoworks/mechanoid/ops/OperationExecutor;->mUserStateKey:Ljava/lang/String;

    aput-object v3, v2, v5

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 366
    :cond_0
    iget-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationExecutor;->mOpInfo:Lcom/robotoworks/mechanoid/ops/OperationExecutor$OpInfo;

    iput-boolean v5, v0, Lcom/robotoworks/mechanoid/ops/OperationExecutor$OpInfo;->mCallbackInvoked:Z

    .line 369
    :cond_1
    return-void
.end method

.method private ensureCallbacks()V
    .locals 7

    .prologue
    const/4 v3, 0x2

    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 212
    iget-object v1, p0, Lcom/robotoworks/mechanoid/ops/OperationExecutor;->mOpInfo:Lcom/robotoworks/mechanoid/ops/OperationExecutor$OpInfo;

    if-nez v1, :cond_0

    .line 245
    :goto_0
    return-void

    .line 216
    :cond_0
    iget-object v1, p0, Lcom/robotoworks/mechanoid/ops/OperationExecutor;->mOpInfo:Lcom/robotoworks/mechanoid/ops/OperationExecutor$OpInfo;

    iget-object v1, v1, Lcom/robotoworks/mechanoid/ops/OperationExecutor$OpInfo;->mResult:Lcom/robotoworks/mechanoid/ops/OperationResult;

    if-eqz v1, :cond_1

    .line 217
    invoke-direct {p0}, Lcom/robotoworks/mechanoid/ops/OperationExecutor;->completeOperation()V

    goto :goto_0

    .line 221
    :cond_1
    iget-object v1, p0, Lcom/robotoworks/mechanoid/ops/OperationExecutor;->mOpInfo:Lcom/robotoworks/mechanoid/ops/OperationExecutor$OpInfo;

    iget v1, v1, Lcom/robotoworks/mechanoid/ops/OperationExecutor$OpInfo;->mId:I

    invoke-static {v1}, Lcom/robotoworks/mechanoid/ops/Ops;->isOperationPending(I)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 223
    iget-boolean v1, p0, Lcom/robotoworks/mechanoid/ops/OperationExecutor;->mEnableLogging:Z

    if-eqz v1, :cond_2

    .line 224
    sget-object v1, Lcom/robotoworks/mechanoid/ops/OperationExecutor;->TAG:Ljava/lang/String;

    const-string v2, "[Operation Pending] request id: %s, key: %s"

    new-array v3, v3, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/robotoworks/mechanoid/ops/OperationExecutor;->mOpInfo:Lcom/robotoworks/mechanoid/ops/OperationExecutor$OpInfo;

    iget v4, v4, Lcom/robotoworks/mechanoid/ops/OperationExecutor$OpInfo;->mId:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v5

    iget-object v4, p0, Lcom/robotoworks/mechanoid/ops/OperationExecutor;->mUserStateKey:Ljava/lang/String;

    aput-object v4, v3, v6

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 227
    :cond_2
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/ops/OperationExecutor;->invokeOnOperationPending()Z

    goto :goto_0

    .line 232
    :cond_3
    invoke-static {}, Lcom/robotoworks/mechanoid/ops/Ops;->getLog()Lcom/robotoworks/mechanoid/ops/OperationLog;

    move-result-object v1

    iget-object v2, p0, Lcom/robotoworks/mechanoid/ops/OperationExecutor;->mOpInfo:Lcom/robotoworks/mechanoid/ops/OperationExecutor$OpInfo;

    iget v2, v2, Lcom/robotoworks/mechanoid/ops/OperationExecutor$OpInfo;->mId:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/robotoworks/mechanoid/ops/OperationLog;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/robotoworks/mechanoid/ops/OperationResult;

    .line 234
    .local v0, "result":Lcom/robotoworks/mechanoid/ops/OperationResult;
    if-nez v0, :cond_4

    .line 235
    sget-object v1, Lcom/robotoworks/mechanoid/ops/OperationExecutor;->TAG:Ljava/lang/String;

    const-string v2, "[Operation Retry] the log did not contain request id: %s, key: %s, retrying..."

    new-array v3, v3, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/robotoworks/mechanoid/ops/OperationExecutor;->mOpInfo:Lcom/robotoworks/mechanoid/ops/OperationExecutor$OpInfo;

    iget v4, v4, Lcom/robotoworks/mechanoid/ops/OperationExecutor$OpInfo;->mId:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v5

    iget-object v4, p0, Lcom/robotoworks/mechanoid/ops/OperationExecutor;->mUserStateKey:Ljava/lang/String;

    aput-object v4, v3, v6

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 237
    iget-object v1, p0, Lcom/robotoworks/mechanoid/ops/OperationExecutor;->mOpInfo:Lcom/robotoworks/mechanoid/ops/OperationExecutor$OpInfo;

    iget-object v1, v1, Lcom/robotoworks/mechanoid/ops/OperationExecutor$OpInfo;->mIntent:Landroid/content/Intent;

    invoke-virtual {p0, v1}, Lcom/robotoworks/mechanoid/ops/OperationExecutor;->executeOperation(Landroid/content/Intent;)V

    goto :goto_0

    .line 242
    :cond_4
    iget-object v1, p0, Lcom/robotoworks/mechanoid/ops/OperationExecutor;->mOpInfo:Lcom/robotoworks/mechanoid/ops/OperationExecutor$OpInfo;

    iput-object v0, v1, Lcom/robotoworks/mechanoid/ops/OperationExecutor$OpInfo;->mResult:Lcom/robotoworks/mechanoid/ops/OperationResult;

    .line 244
    invoke-direct {p0}, Lcom/robotoworks/mechanoid/ops/OperationExecutor;->completeOperation()V

    goto :goto_0
.end method

.method private restoreState(Landroid/os/Bundle;)V
    .locals 6
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 144
    if-eqz p1, :cond_0

    .line 145
    const-string v1, "com.robotoworks.mechanoid.ops.OperationExecutor.State"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    .line 147
    .local v0, "state":Landroid/os/Bundle;
    if-eqz v0, :cond_0

    .line 148
    const-class v1, Lcom/robotoworks/mechanoid/ops/OperationExecutor$OpInfo;

    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->setClassLoader(Ljava/lang/ClassLoader;)V

    .line 149
    iget-object v1, p0, Lcom/robotoworks/mechanoid/ops/OperationExecutor;->mUserStateKey:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Lcom/robotoworks/mechanoid/ops/OperationExecutor$OpInfo;

    iput-object v1, p0, Lcom/robotoworks/mechanoid/ops/OperationExecutor;->mOpInfo:Lcom/robotoworks/mechanoid/ops/OperationExecutor$OpInfo;

    .line 151
    iget-boolean v1, p0, Lcom/robotoworks/mechanoid/ops/OperationExecutor;->mEnableLogging:Z

    if-eqz v1, :cond_0

    .line 152
    sget-object v1, Lcom/robotoworks/mechanoid/ops/OperationExecutor;->TAG:Ljava/lang/String;

    const-string v2, "[Restoring State] key:%s"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    iget-object v5, p0, Lcom/robotoworks/mechanoid/ops/OperationExecutor;->mUserStateKey:Ljava/lang/String;

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 156
    .end local v0    # "state":Landroid/os/Bundle;
    :cond_0
    return-void
.end method


# virtual methods
.method public execute(Landroid/content/Intent;I)V
    .locals 5
    .param p1, "operationIntent"    # Landroid/content/Intent;
    .param p2, "mode"    # I

    .prologue
    const/4 v2, 0x1

    .line 338
    if-nez p1, :cond_0

    .line 339
    sget-object v0, Lcom/robotoworks/mechanoid/ops/OperationExecutor;->TAG:Ljava/lang/String;

    const-string v1, "[Operation Null] operationintent argument was null, key: %s"

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-object v4, p0, Lcom/robotoworks/mechanoid/ops/OperationExecutor;->mUserStateKey:Ljava/lang/String;

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 357
    :goto_0
    return-void

    .line 343
    :cond_0
    if-ne p2, v2, :cond_2

    .line 344
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationExecutor;->mOpInfo:Lcom/robotoworks/mechanoid/ops/OperationExecutor$OpInfo;

    .line 345
    invoke-virtual {p0, p1}, Lcom/robotoworks/mechanoid/ops/OperationExecutor;->executeOperation(Landroid/content/Intent;)V

    .line 356
    :cond_1
    :goto_1
    invoke-direct {p0}, Lcom/robotoworks/mechanoid/ops/OperationExecutor;->completeOperation()V

    goto :goto_0

    .line 346
    :cond_2
    if-nez p2, :cond_3

    .line 347
    iget-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationExecutor;->mOpInfo:Lcom/robotoworks/mechanoid/ops/OperationExecutor$OpInfo;

    if-nez v0, :cond_1

    .line 348
    invoke-virtual {p0, p1}, Lcom/robotoworks/mechanoid/ops/OperationExecutor;->executeOperation(Landroid/content/Intent;)V

    goto :goto_1

    .line 350
    :cond_3
    const/4 v0, 0x2

    if-ne p2, v0, :cond_1

    .line 351
    iget-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationExecutor;->mOpInfo:Lcom/robotoworks/mechanoid/ops/OperationExecutor$OpInfo;

    if-eqz v0, :cond_4

    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/ops/OperationExecutor;->isError()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 352
    :cond_4
    invoke-virtual {p0, p1}, Lcom/robotoworks/mechanoid/ops/OperationExecutor;->executeOperation(Landroid/content/Intent;)V

    goto :goto_1
.end method

.method protected executeOperation(Landroid/content/Intent;)V
    .locals 5
    .param p1, "operationIntent"    # Landroid/content/Intent;

    .prologue
    .line 372
    iget-boolean v0, p0, Lcom/robotoworks/mechanoid/ops/OperationExecutor;->mEnableLogging:Z

    if-eqz v0, :cond_0

    .line 373
    sget-object v0, Lcom/robotoworks/mechanoid/ops/OperationExecutor;->TAG:Ljava/lang/String;

    const-string v1, "[Execute Operation] key: %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-object v4, p0, Lcom/robotoworks/mechanoid/ops/OperationExecutor;->mUserStateKey:Ljava/lang/String;

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 376
    :cond_0
    new-instance v0, Lcom/robotoworks/mechanoid/ops/OperationExecutor$OpInfo;

    invoke-direct {v0}, Lcom/robotoworks/mechanoid/ops/OperationExecutor$OpInfo;-><init>()V

    iput-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationExecutor;->mOpInfo:Lcom/robotoworks/mechanoid/ops/OperationExecutor$OpInfo;

    .line 377
    iget-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationExecutor;->mOpInfo:Lcom/robotoworks/mechanoid/ops/OperationExecutor$OpInfo;

    iput-object p1, v0, Lcom/robotoworks/mechanoid/ops/OperationExecutor$OpInfo;->mIntent:Landroid/content/Intent;

    .line 379
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/ops/OperationExecutor;->invokeOnOperationPending()Z

    .line 381
    iget-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationExecutor;->mOpInfo:Lcom/robotoworks/mechanoid/ops/OperationExecutor$OpInfo;

    invoke-static {p1}, Lcom/robotoworks/mechanoid/ops/Ops;->execute(Landroid/content/Intent;)I

    move-result v1

    iput v1, v0, Lcom/robotoworks/mechanoid/ops/OperationExecutor$OpInfo;->mId:I

    .line 382
    return-void
.end method

.method public getIntent()Landroid/content/Intent;
    .locals 1

    .prologue
    .line 136
    iget-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationExecutor;->mOpInfo:Lcom/robotoworks/mechanoid/ops/OperationExecutor$OpInfo;

    if-nez v0, :cond_0

    .line 137
    const/4 v0, 0x0

    .line 140
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationExecutor;->mOpInfo:Lcom/robotoworks/mechanoid/ops/OperationExecutor$OpInfo;

    iget-object v0, v0, Lcom/robotoworks/mechanoid/ops/OperationExecutor$OpInfo;->mIntent:Landroid/content/Intent;

    goto :goto_0
.end method

.method public getKey()Ljava/lang/String;
    .locals 1

    .prologue
    .line 48
    iget-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationExecutor;->mUserStateKey:Ljava/lang/String;

    return-object v0
.end method

.method public getResult()Lcom/robotoworks/mechanoid/ops/OperationResult;
    .locals 1

    .prologue
    .line 125
    iget-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationExecutor;->mOpInfo:Lcom/robotoworks/mechanoid/ops/OperationExecutor$OpInfo;

    if-nez v0, :cond_0

    .line 126
    const/4 v0, 0x0

    .line 129
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationExecutor;->mOpInfo:Lcom/robotoworks/mechanoid/ops/OperationExecutor$OpInfo;

    iget-object v0, v0, Lcom/robotoworks/mechanoid/ops/OperationExecutor$OpInfo;->mResult:Lcom/robotoworks/mechanoid/ops/OperationResult;

    goto :goto_0
.end method

.method protected invokeOnOperationComplete(Lcom/robotoworks/mechanoid/ops/OperationResult;)Z
    .locals 3
    .param p1, "result"    # Lcom/robotoworks/mechanoid/ops/OperationResult;

    .prologue
    const/4 v1, 0x0

    .line 305
    iget-object v2, p0, Lcom/robotoworks/mechanoid/ops/OperationExecutor;->mCallbacksRef:Ljava/lang/ref/WeakReference;

    if-nez v2, :cond_1

    .line 315
    :cond_0
    :goto_0
    return v1

    .line 309
    :cond_1
    iget-object v2, p0, Lcom/robotoworks/mechanoid/ops/OperationExecutor;->mCallbacksRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/robotoworks/mechanoid/ops/OperationExecutorCallbacks;

    .line 311
    .local v0, "callbacks":Lcom/robotoworks/mechanoid/ops/OperationExecutorCallbacks;
    if-eqz v0, :cond_0

    .line 315
    iget-object v1, p0, Lcom/robotoworks/mechanoid/ops/OperationExecutor;->mUserStateKey:Ljava/lang/String;

    invoke-interface {v0, v1, p1}, Lcom/robotoworks/mechanoid/ops/OperationExecutorCallbacks;->onOperationComplete(Ljava/lang/String;Lcom/robotoworks/mechanoid/ops/OperationResult;)Z

    move-result v1

    goto :goto_0
.end method

.method protected invokeOnOperationPending()Z
    .locals 3

    .prologue
    const/4 v1, 0x0

    .line 290
    iget-object v2, p0, Lcom/robotoworks/mechanoid/ops/OperationExecutor;->mCallbacksRef:Ljava/lang/ref/WeakReference;

    if-nez v2, :cond_1

    .line 301
    :cond_0
    :goto_0
    return v1

    .line 294
    :cond_1
    iget-object v2, p0, Lcom/robotoworks/mechanoid/ops/OperationExecutor;->mCallbacksRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/robotoworks/mechanoid/ops/OperationExecutorCallbacks;

    .line 296
    .local v0, "callbacks":Lcom/robotoworks/mechanoid/ops/OperationExecutorCallbacks;
    if-eqz v0, :cond_0

    .line 300
    iget-object v1, p0, Lcom/robotoworks/mechanoid/ops/OperationExecutor;->mUserStateKey:Ljava/lang/String;

    invoke-interface {v0, v1}, Lcom/robotoworks/mechanoid/ops/OperationExecutorCallbacks;->onOperationPending(Ljava/lang/String;)V

    .line 301
    const/4 v1, 0x1

    goto :goto_0
.end method

.method public isComplete()Z
    .locals 1

    .prologue
    .line 85
    iget-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationExecutor;->mOpInfo:Lcom/robotoworks/mechanoid/ops/OperationExecutor$OpInfo;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationExecutor;->mOpInfo:Lcom/robotoworks/mechanoid/ops/OperationExecutor$OpInfo;

    iget-boolean v0, v0, Lcom/robotoworks/mechanoid/ops/OperationExecutor$OpInfo;->mCallbackInvoked:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isError()Z
    .locals 1

    .prologue
    .line 106
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/ops/OperationExecutor;->isComplete()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/ops/OperationExecutor;->getResult()Lcom/robotoworks/mechanoid/ops/OperationResult;

    move-result-object v0

    invoke-virtual {v0}, Lcom/robotoworks/mechanoid/ops/OperationResult;->isOk()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isOk()Z
    .locals 1

    .prologue
    .line 96
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/ops/OperationExecutor;->isComplete()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/ops/OperationExecutor;->getResult()Lcom/robotoworks/mechanoid/ops/OperationResult;

    move-result-object v0

    invoke-virtual {v0}, Lcom/robotoworks/mechanoid/ops/OperationResult;->isOk()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isPending()Z
    .locals 1

    .prologue
    .line 117
    iget-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationExecutor;->mOpInfo:Lcom/robotoworks/mechanoid/ops/OperationExecutor$OpInfo;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationExecutor;->mOpInfo:Lcom/robotoworks/mechanoid/ops/OperationExecutor$OpInfo;

    iget-object v0, v0, Lcom/robotoworks/mechanoid/ops/OperationExecutor$OpInfo;->mResult:Lcom/robotoworks/mechanoid/ops/OperationResult;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public removeCallback()V
    .locals 1

    .prologue
    .line 202
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationExecutor;->mCallbacksRef:Ljava/lang/ref/WeakReference;

    .line 203
    return-void
.end method

.method public saveState(Landroid/os/Bundle;)V
    .locals 6
    .param p1, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 165
    iget-boolean v1, p0, Lcom/robotoworks/mechanoid/ops/OperationExecutor;->mEnableLogging:Z

    if-eqz v1, :cond_0

    .line 166
    sget-object v1, Lcom/robotoworks/mechanoid/ops/OperationExecutor;->TAG:Ljava/lang/String;

    const-string v2, "[Saving State] key: %s"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    iget-object v5, p0, Lcom/robotoworks/mechanoid/ops/OperationExecutor;->mUserStateKey:Ljava/lang/String;

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 169
    :cond_0
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 170
    .local v0, "state":Landroid/os/Bundle;
    iget-object v1, p0, Lcom/robotoworks/mechanoid/ops/OperationExecutor;->mUserStateKey:Ljava/lang/String;

    iget-object v2, p0, Lcom/robotoworks/mechanoid/ops/OperationExecutor;->mOpInfo:Lcom/robotoworks/mechanoid/ops/OperationExecutor$OpInfo;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 172
    const-string v1, "com.robotoworks.mechanoid.ops.OperationExecutor.State"

    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 173
    return-void
.end method

.method public setCallback(Lcom/robotoworks/mechanoid/ops/OperationExecutorCallbacks;)V
    .locals 1
    .param p1, "callbacks"    # Lcom/robotoworks/mechanoid/ops/OperationExecutorCallbacks;

    .prologue
    .line 206
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationExecutor;->mCallbacksRef:Ljava/lang/ref/WeakReference;

    .line 207
    return-void
.end method
