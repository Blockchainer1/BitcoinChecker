.class public Lcom/robotoworks/mechanoid/ops/Ops;
.super Ljava/lang/Object;
.source "Ops.java"


# static fields
.field private static mBridge:Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static abort(II)V
    .locals 1
    .param p0, "id"    # I
    .param p1, "reason"    # I

    .prologue
    .line 43
    sget-object v0, Lcom/robotoworks/mechanoid/ops/Ops;->mBridge:Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;

    invoke-virtual {v0, p0, p1}, Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;->abort(II)V

    .line 44
    return-void
.end method

.method public static bindListener(Lcom/robotoworks/mechanoid/ops/OperationServiceListener;)V
    .locals 1
    .param p0, "listener"    # Lcom/robotoworks/mechanoid/ops/OperationServiceListener;

    .prologue
    .line 27
    sget-object v0, Lcom/robotoworks/mechanoid/ops/Ops;->mBridge:Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;

    invoke-virtual {v0, p0}, Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;->bindListener(Lcom/robotoworks/mechanoid/ops/OperationServiceListener;)V

    .line 28
    return-void
.end method

.method public static execute(Landroid/content/Intent;)I
    .locals 1
    .param p0, "intent"    # Landroid/content/Intent;

    .prologue
    .line 23
    sget-object v0, Lcom/robotoworks/mechanoid/ops/Ops;->mBridge:Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;

    invoke-virtual {v0, p0}, Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;->execute(Landroid/content/Intent;)I

    move-result v0

    return v0
.end method

.method public static getLog()Lcom/robotoworks/mechanoid/ops/OperationLog;
    .locals 1

    .prologue
    .line 39
    sget-object v0, Lcom/robotoworks/mechanoid/ops/Ops;->mBridge:Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;

    invoke-virtual {v0}, Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;->getLog()Lcom/robotoworks/mechanoid/ops/OperationLog;

    move-result-object v0

    return-object v0
.end method

.method static init()V
    .locals 1

    .prologue
    .line 10
    sget-object v0, Lcom/robotoworks/mechanoid/ops/Ops;->mBridge:Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;

    if-eqz v0, :cond_0

    .line 15
    :goto_0
    return-void

    .line 14
    :cond_0
    new-instance v0, Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;

    invoke-direct {v0}, Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;-><init>()V

    sput-object v0, Lcom/robotoworks/mechanoid/ops/Ops;->mBridge:Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;

    goto :goto_0
.end method

.method public static isOperationPending(I)Z
    .locals 1
    .param p0, "id"    # I

    .prologue
    .line 35
    sget-object v0, Lcom/robotoworks/mechanoid/ops/Ops;->mBridge:Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;

    invoke-virtual {v0, p0}, Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;->isOperationPending(I)Z

    move-result v0

    return v0
.end method

.method public static pause(Z)V
    .locals 1
    .param p0, "pause"    # Z

    .prologue
    .line 54
    sget-object v0, Lcom/robotoworks/mechanoid/ops/Ops;->mBridge:Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;

    invoke-virtual {v0, p0}, Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;->pause(Z)V

    .line 55
    return-void
.end method

.method public static unbindListener(Lcom/robotoworks/mechanoid/ops/OperationServiceListener;)V
    .locals 1
    .param p0, "listener"    # Lcom/robotoworks/mechanoid/ops/OperationServiceListener;

    .prologue
    .line 31
    sget-object v0, Lcom/robotoworks/mechanoid/ops/Ops;->mBridge:Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;

    invoke-virtual {v0, p0}, Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;->unbindListener(Lcom/robotoworks/mechanoid/ops/OperationServiceListener;)V

    .line 32
    return-void
.end method
