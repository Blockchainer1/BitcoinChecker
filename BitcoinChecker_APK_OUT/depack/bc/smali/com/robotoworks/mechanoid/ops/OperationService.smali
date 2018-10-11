.class public abstract Lcom/robotoworks/mechanoid/ops/OperationService;
.super Landroid/app/Service;
.source "OperationService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/robotoworks/mechanoid/ops/OperationService$LocalBinder;
    }
.end annotation


# static fields
.field protected static final ACTION_ABORT:Ljava/lang/String; = "com.robotoworks.mechanoid.op.actions.ABORT"

.field public static final EXTRA_ABORT_REASON:Ljava/lang/String; = "com.robotoworks.mechanoid.op.extras.ABORT_REASON"

.field public static final EXTRA_BRIDGE_MESSENGER:Ljava/lang/String; = "com.robotoworks.mechanoid.op.extras.BRIDGE_MESSENGER"

.field public static final EXTRA_IS_ABORTED:Ljava/lang/String; = "com.robotoworks.mechanoid.op.extras.IS_ABORTED"

.field public static final EXTRA_REQUEST_ID:Ljava/lang/String; = "com.robotoworks.mechanoid.op.extras.REQUEST_ID"

.field public static final EXTRA_START_ID:Ljava/lang/String; = "com.robotoworks.mechanoid.op.extras.START_ID"

.field private static final MSG_STOP:I = 0x1


# instance fields
.field private mBinder:Landroid/os/IBinder;

.field protected final mEnableLogging:Z

.field private mHandler:Landroid/os/Handler;

.field protected final mLogTag:Ljava/lang/String;

.field private mProcessor:Lcom/robotoworks/mechanoid/ops/OperationProcessor;

.field private mStopped:Z


# direct methods
.method public constructor <init>(Z)V
    .locals 1
    .param p1, "enableLogging"    # Z

    .prologue
    .line 79
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    .line 61
    new-instance v0, Lcom/robotoworks/mechanoid/ops/OperationService$1;

    invoke-direct {v0, p0}, Lcom/robotoworks/mechanoid/ops/OperationService$1;-><init>(Lcom/robotoworks/mechanoid/ops/OperationService;)V

    iput-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationService;->mHandler:Landroid/os/Handler;

    .line 69
    new-instance v0, Lcom/robotoworks/mechanoid/ops/OperationService$LocalBinder;

    invoke-direct {v0, p0}, Lcom/robotoworks/mechanoid/ops/OperationService$LocalBinder;-><init>(Lcom/robotoworks/mechanoid/ops/OperationService;)V

    iput-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationService;->mBinder:Landroid/os/IBinder;

    .line 80
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/ops/OperationService;->createProcessor()Lcom/robotoworks/mechanoid/ops/OperationProcessor;

    move-result-object v0

    iput-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationService;->mProcessor:Lcom/robotoworks/mechanoid/ops/OperationProcessor;

    .line 81
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationService;->mLogTag:Ljava/lang/String;

    .line 82
    iput-boolean p1, p0, Lcom/robotoworks/mechanoid/ops/OperationService;->mEnableLogging:Z

    .line 83
    return-void
.end method

.method static synthetic access$000(Lcom/robotoworks/mechanoid/ops/OperationService;I)V
    .locals 0
    .param p0, "x0"    # Lcom/robotoworks/mechanoid/ops/OperationService;
    .param p1, "x1"    # I

    .prologue
    .line 40
    invoke-direct {p0, p1}, Lcom/robotoworks/mechanoid/ops/OperationService;->stop(I)V

    return-void
.end method

.method private handleIntent(Landroid/content/Intent;)V
    .locals 1
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 108
    iget-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationService;->mProcessor:Lcom/robotoworks/mechanoid/ops/OperationProcessor;

    invoke-virtual {v0, p1}, Lcom/robotoworks/mechanoid/ops/OperationProcessor;->execute(Landroid/content/Intent;)V

    .line 109
    return-void
.end method

.method private sendStopMessage(Landroid/content/Intent;)V
    .locals 6
    .param p1, "request"    # Landroid/content/Intent;

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 112
    iget-object v1, p0, Lcom/robotoworks/mechanoid/ops/OperationService;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1, v4}, Landroid/os/Handler;->removeMessages(I)V

    .line 113
    const-string v1, "com.robotoworks.mechanoid.op.extras.START_ID"

    invoke-virtual {p1, v1, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    .line 114
    .local v0, "startId":I
    iget-object v1, p0, Lcom/robotoworks/mechanoid/ops/OperationService;->mHandler:Landroid/os/Handler;

    iget-object v2, p0, Lcom/robotoworks/mechanoid/ops/OperationService;->mHandler:Landroid/os/Handler;

    invoke-virtual {v2, v4, v0, v3}, Landroid/os/Handler;->obtainMessage(III)Landroid/os/Message;

    move-result-object v2

    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/ops/OperationService;->getIdleStopTime()J

    move-result-wide v4

    invoke-virtual {v1, v2, v4, v5}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 115
    return-void
.end method

.method private stop(I)V
    .locals 6
    .param p1, "startId"    # I

    .prologue
    const/4 v5, 0x1

    .line 122
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/ops/OperationService;->shouldStopOnAllOperationsComplete()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0, p1}, Lcom/robotoworks/mechanoid/ops/OperationService;->stopSelfResult(I)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 123
    iget-boolean v0, p0, Lcom/robotoworks/mechanoid/ops/OperationService;->mEnableLogging:Z

    if-eqz v0, :cond_0

    .line 124
    iget-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationService;->mLogTag:Ljava/lang/String;

    const-string v1, "[Stopping] startId:%s"

    new-array v2, v5, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 127
    :cond_0
    iput-boolean v5, p0, Lcom/robotoworks/mechanoid/ops/OperationService;->mStopped:Z

    .line 129
    :cond_1
    return-void
.end method


# virtual methods
.method protected abstract createProcessor()Lcom/robotoworks/mechanoid/ops/OperationProcessor;
.end method

.method protected getIdleStopTime()J
    .locals 2

    .prologue
    .line 118
    const-wide/16 v0, 0x2710

    return-wide v0
.end method

.method public isStopped()Z
    .locals 1

    .prologue
    .line 76
    iget-boolean v0, p0, Lcom/robotoworks/mechanoid/ops/OperationService;->mStopped:Z

    return v0
.end method

.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 1
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 89
    iget-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationService;->mBinder:Landroid/os/IBinder;

    return-object v0
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    .line 133
    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    .line 135
    iget-boolean v0, p0, Lcom/robotoworks/mechanoid/ops/OperationService;->mEnableLogging:Z

    if-eqz v0, :cond_0

    .line 136
    iget-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationService;->mLogTag:Ljava/lang/String;

    const-string v1, "[Destroying]"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 139
    :cond_0
    iget-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationService;->mProcessor:Lcom/robotoworks/mechanoid/ops/OperationProcessor;

    invoke-virtual {v0}, Lcom/robotoworks/mechanoid/ops/OperationProcessor;->quit()V

    .line 140
    return-void
.end method

.method public onOperationAborted(Landroid/content/Intent;ILandroid/os/Bundle;)V
    .locals 9
    .param p1, "request"    # Landroid/content/Intent;
    .param p2, "reason"    # I
    .param p3, "data"    # Landroid/os/Bundle;

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 190
    iget-boolean v3, p0, Lcom/robotoworks/mechanoid/ops/OperationService;->mEnableLogging:Z

    if-eqz v3, :cond_0

    .line 191
    iget-object v3, p0, Lcom/robotoworks/mechanoid/ops/OperationService;->mLogTag:Ljava/lang/String;

    const-string v4, "[Operation Aborted] request:%s, reason%s, data:%s"

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Object;

    aput-object p1, v5, v7

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v8

    const/4 v6, 0x2

    aput-object p3, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 194
    :cond_0
    const-string v3, "com.robotoworks.mechanoid.op.extras.BRIDGE_MESSENGER"

    invoke-virtual {p1, v3}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v2

    check-cast v2, Landroid/os/Messenger;

    .line 195
    .local v2, "messenger":Landroid/os/Messenger;
    new-instance v1, Landroid/os/Message;

    invoke-direct {v1}, Landroid/os/Message;-><init>()V

    .line 196
    .local v1, "m":Landroid/os/Message;
    const/4 v3, 0x4

    iput v3, v1, Landroid/os/Message;->what:I

    .line 197
    invoke-static {p1}, Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;->getOperationRequestId(Landroid/content/Intent;)I

    move-result v3

    iput v3, v1, Landroid/os/Message;->arg1:I

    .line 198
    iput p2, v1, Landroid/os/Message;->arg2:I

    .line 199
    invoke-virtual {v1, p3}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 201
    :try_start_0
    invoke-virtual {v2, v1}, Landroid/os/Messenger;->send(Landroid/os/Message;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 209
    :cond_1
    :goto_0
    invoke-direct {p0, p1}, Lcom/robotoworks/mechanoid/ops/OperationService;->sendStopMessage(Landroid/content/Intent;)V

    .line 210
    return-void

    .line 203
    :catch_0
    move-exception v0

    .line 204
    .local v0, "e":Landroid/os/RemoteException;
    iget-boolean v3, p0, Lcom/robotoworks/mechanoid/ops/OperationService;->mEnableLogging:Z

    if-eqz v3, :cond_1

    .line 205
    iget-object v3, p0, Lcom/robotoworks/mechanoid/ops/OperationService;->mLogTag:Ljava/lang/String;

    const-string v4, "[Operation Exception] %s"

    new-array v5, v8, [Ljava/lang/Object;

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v7

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public onOperationComplete(Landroid/content/Intent;Landroid/os/Bundle;)V
    .locals 9
    .param p1, "request"    # Landroid/content/Intent;
    .param p2, "data"    # Landroid/os/Bundle;

    .prologue
    const/4 v8, 0x2

    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 168
    iget-boolean v3, p0, Lcom/robotoworks/mechanoid/ops/OperationService;->mEnableLogging:Z

    if-eqz v3, :cond_0

    .line 169
    iget-object v3, p0, Lcom/robotoworks/mechanoid/ops/OperationService;->mLogTag:Ljava/lang/String;

    const-string v4, "[Operation Complete] request:%s, data:%s"

    new-array v5, v8, [Ljava/lang/Object;

    aput-object p1, v5, v7

    aput-object p2, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 172
    :cond_0
    const-string v3, "com.robotoworks.mechanoid.op.extras.BRIDGE_MESSENGER"

    invoke-virtual {p1, v3}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v2

    check-cast v2, Landroid/os/Messenger;

    .line 173
    .local v2, "messenger":Landroid/os/Messenger;
    new-instance v1, Landroid/os/Message;

    invoke-direct {v1}, Landroid/os/Message;-><init>()V

    .line 174
    .local v1, "m":Landroid/os/Message;
    iput v8, v1, Landroid/os/Message;->what:I

    .line 175
    invoke-static {p1}, Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;->getOperationRequestId(Landroid/content/Intent;)I

    move-result v3

    iput v3, v1, Landroid/os/Message;->arg1:I

    .line 176
    invoke-virtual {v1, p2}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 178
    :try_start_0
    invoke-virtual {v2, v1}, Landroid/os/Messenger;->send(Landroid/os/Message;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 186
    :cond_1
    :goto_0
    invoke-direct {p0, p1}, Lcom/robotoworks/mechanoid/ops/OperationService;->sendStopMessage(Landroid/content/Intent;)V

    .line 187
    return-void

    .line 180
    :catch_0
    move-exception v0

    .line 181
    .local v0, "e":Landroid/os/RemoteException;
    iget-boolean v3, p0, Lcom/robotoworks/mechanoid/ops/OperationService;->mEnableLogging:Z

    if-eqz v3, :cond_1

    .line 182
    iget-object v3, p0, Lcom/robotoworks/mechanoid/ops/OperationService;->mLogTag:Ljava/lang/String;

    const-string v4, "[Operation Exception] %s"

    new-array v5, v6, [Ljava/lang/Object;

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v7

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public onOperationProgress(Landroid/content/Intent;ILandroid/os/Bundle;)V
    .locals 10
    .param p1, "request"    # Landroid/content/Intent;
    .param p2, "progress"    # I
    .param p3, "data"    # Landroid/os/Bundle;

    .prologue
    const/4 v9, 0x3

    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 214
    iget-boolean v3, p0, Lcom/robotoworks/mechanoid/ops/OperationService;->mEnableLogging:Z

    if-eqz v3, :cond_0

    .line 215
    iget-object v3, p0, Lcom/robotoworks/mechanoid/ops/OperationService;->mLogTag:Ljava/lang/String;

    const-string v4, "[Operation Progress] request:%s, progress:%s, data:%s"

    new-array v5, v9, [Ljava/lang/Object;

    aput-object p1, v5, v7

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v8

    const/4 v6, 0x2

    aput-object p3, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 218
    :cond_0
    const-string v3, "com.robotoworks.mechanoid.op.extras.BRIDGE_MESSENGER"

    invoke-virtual {p1, v3}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v2

    check-cast v2, Landroid/os/Messenger;

    .line 219
    .local v2, "messenger":Landroid/os/Messenger;
    new-instance v1, Landroid/os/Message;

    invoke-direct {v1}, Landroid/os/Message;-><init>()V

    .line 220
    .local v1, "m":Landroid/os/Message;
    iput v9, v1, Landroid/os/Message;->what:I

    .line 221
    invoke-static {p1}, Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;->getOperationRequestId(Landroid/content/Intent;)I

    move-result v3

    iput v3, v1, Landroid/os/Message;->arg1:I

    .line 222
    iput p2, v1, Landroid/os/Message;->arg2:I

    .line 223
    invoke-virtual {v1, p3}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 225
    :try_start_0
    invoke-virtual {v2, v1}, Landroid/os/Messenger;->send(Landroid/os/Message;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 232
    :cond_1
    :goto_0
    return-void

    .line 227
    :catch_0
    move-exception v0

    .line 228
    .local v0, "e":Landroid/os/RemoteException;
    iget-boolean v3, p0, Lcom/robotoworks/mechanoid/ops/OperationService;->mEnableLogging:Z

    if-eqz v3, :cond_1

    .line 229
    iget-object v3, p0, Lcom/robotoworks/mechanoid/ops/OperationService;->mLogTag:Ljava/lang/String;

    const-string v4, "[Operation Exception] %s"

    new-array v5, v8, [Ljava/lang/Object;

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v7

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public onOperationStarting(Landroid/content/Intent;Landroid/os/Bundle;)V
    .locals 8
    .param p1, "request"    # Landroid/content/Intent;
    .param p2, "data"    # Landroid/os/Bundle;

    .prologue
    const/4 v7, 0x0

    const/4 v6, 0x1

    .line 148
    iget-boolean v3, p0, Lcom/robotoworks/mechanoid/ops/OperationService;->mEnableLogging:Z

    if-eqz v3, :cond_0

    .line 149
    iget-object v3, p0, Lcom/robotoworks/mechanoid/ops/OperationService;->mLogTag:Ljava/lang/String;

    const-string v4, "[Operation Starting] request:%s, data:%s"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    aput-object p1, v5, v7

    aput-object p2, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 152
    :cond_0
    const-string v3, "com.robotoworks.mechanoid.op.extras.BRIDGE_MESSENGER"

    invoke-virtual {p1, v3}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v2

    check-cast v2, Landroid/os/Messenger;

    .line 153
    .local v2, "messenger":Landroid/os/Messenger;
    new-instance v1, Landroid/os/Message;

    invoke-direct {v1}, Landroid/os/Message;-><init>()V

    .line 154
    .local v1, "m":Landroid/os/Message;
    iput v6, v1, Landroid/os/Message;->what:I

    .line 155
    invoke-static {p1}, Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;->getOperationRequestId(Landroid/content/Intent;)I

    move-result v3

    iput v3, v1, Landroid/os/Message;->arg1:I

    .line 156
    invoke-virtual {v1, p2}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 158
    :try_start_0
    invoke-virtual {v2, v1}, Landroid/os/Messenger;->send(Landroid/os/Message;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 165
    :cond_1
    :goto_0
    return-void

    .line 160
    :catch_0
    move-exception v0

    .line 161
    .local v0, "e":Landroid/os/RemoteException;
    iget-boolean v3, p0, Lcom/robotoworks/mechanoid/ops/OperationService;->mEnableLogging:Z

    if-eqz v3, :cond_1

    .line 162
    iget-object v3, p0, Lcom/robotoworks/mechanoid/ops/OperationService;->mLogTag:Ljava/lang/String;

    const-string v4, "[Operation Exception] %s"

    new-array v5, v6, [Ljava/lang/Object;

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v7

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 6
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "flags"    # I
    .param p3, "startId"    # I

    .prologue
    const/4 v5, 0x1

    .line 95
    iget-boolean v0, p0, Lcom/robotoworks/mechanoid/ops/OperationService;->mEnableLogging:Z

    if-eqz v0, :cond_0

    .line 96
    iget-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationService;->mLogTag:Ljava/lang/String;

    const-string v1, "[Start Command] startId:%s, intent:%s"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    aput-object p1, v2, v5

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 99
    :cond_0
    if-eqz p1, :cond_1

    .line 100
    const-string v0, "com.robotoworks.mechanoid.op.extras.START_ID"

    invoke-virtual {p1, v0, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 101
    invoke-direct {p0, p1}, Lcom/robotoworks/mechanoid/ops/OperationService;->handleIntent(Landroid/content/Intent;)V

    .line 104
    :cond_1
    return v5
.end method

.method protected shouldStopOnAllOperationsComplete()Z
    .locals 1

    .prologue
    .line 143
    const/4 v0, 0x1

    return v0
.end method
