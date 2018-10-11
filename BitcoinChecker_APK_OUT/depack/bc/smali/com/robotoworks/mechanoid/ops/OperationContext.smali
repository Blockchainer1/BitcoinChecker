.class public Lcom/robotoworks/mechanoid/ops/OperationContext;
.super Ljava/lang/Object;
.source "OperationContext.java"


# static fields
.field protected static final MSG_ABORT:I = 0x1


# instance fields
.field handler:Landroid/os/Handler;

.field private mAbortReason:I

.field private mApplicationContext:Landroid/content/Context;

.field private mIntent:Landroid/content/Intent;

.field private mIsAborted:Z

.field private mProcessor:Lcom/robotoworks/mechanoid/ops/OperationProcessor;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    new-instance v0, Lcom/robotoworks/mechanoid/ops/OperationContext$1;

    invoke-direct {v0, p0}, Lcom/robotoworks/mechanoid/ops/OperationContext$1;-><init>(Lcom/robotoworks/mechanoid/ops/OperationContext;)V

    iput-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationContext;->handler:Landroid/os/Handler;

    return-void
.end method


# virtual methods
.method public abort(I)V
    .locals 1
    .param p1, "reason"    # I

    .prologue
    .line 60
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/robotoworks/mechanoid/ops/OperationContext;->mIsAborted:Z

    .line 61
    iput p1, p0, Lcom/robotoworks/mechanoid/ops/OperationContext;->mAbortReason:I

    .line 62
    return-void
.end method

.method public getAbortReason()I
    .locals 1

    .prologue
    .line 42
    iget v0, p0, Lcom/robotoworks/mechanoid/ops/OperationContext;->mAbortReason:I

    return v0
.end method

.method public getApplicationContext()Landroid/content/Context;
    .locals 1

    .prologue
    .line 65
    iget-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationContext;->mApplicationContext:Landroid/content/Context;

    return-object v0
.end method

.method public getIntent()Landroid/content/Intent;
    .locals 1

    .prologue
    .line 69
    iget-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationContext;->mIntent:Landroid/content/Intent;

    return-object v0
.end method

.method public isAborted()Z
    .locals 1

    .prologue
    .line 50
    iget-boolean v0, p0, Lcom/robotoworks/mechanoid/ops/OperationContext;->mIsAborted:Z

    return v0
.end method

.method public postProgress(I)V
    .locals 1
    .param p1, "progress"    # I

    .prologue
    .line 96
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/robotoworks/mechanoid/ops/OperationContext;->postProgress(ILandroid/os/Bundle;)V

    .line 97
    return-void
.end method

.method public postProgress(ILandroid/os/Bundle;)V
    .locals 1
    .param p1, "progress"    # I
    .param p2, "data"    # Landroid/os/Bundle;

    .prologue
    .line 86
    if-nez p2, :cond_0

    .line 87
    new-instance p2, Landroid/os/Bundle;

    .end local p2    # "data":Landroid/os/Bundle;
    invoke-direct {p2}, Landroid/os/Bundle;-><init>()V

    .line 90
    .restart local p2    # "data":Landroid/os/Bundle;
    :cond_0
    iget-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationContext;->mProcessor:Lcom/robotoworks/mechanoid/ops/OperationProcessor;

    if-eqz v0, :cond_1

    .line 91
    iget-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationContext;->mProcessor:Lcom/robotoworks/mechanoid/ops/OperationProcessor;

    invoke-virtual {v0, p1, p2}, Lcom/robotoworks/mechanoid/ops/OperationProcessor;->notifyProgress(ILandroid/os/Bundle;)V

    .line 93
    :cond_1
    return-void
.end method

.method public reset()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 31
    iput-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationContext;->mApplicationContext:Landroid/content/Context;

    .line 32
    iput-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationContext;->mProcessor:Lcom/robotoworks/mechanoid/ops/OperationProcessor;

    .line 33
    iput-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationContext;->mIntent:Landroid/content/Intent;

    .line 34
    iput-boolean v1, p0, Lcom/robotoworks/mechanoid/ops/OperationContext;->mIsAborted:Z

    .line 35
    iput v1, p0, Lcom/robotoworks/mechanoid/ops/OperationContext;->mAbortReason:I

    .line 36
    return-void
.end method

.method setApplicationContext(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 73
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationContext;->mApplicationContext:Landroid/content/Context;

    .line 74
    return-void
.end method

.method setIntent(Landroid/content/Intent;)V
    .locals 0
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 77
    iput-object p1, p0, Lcom/robotoworks/mechanoid/ops/OperationContext;->mIntent:Landroid/content/Intent;

    .line 78
    return-void
.end method

.method setOperationProcessor(Lcom/robotoworks/mechanoid/ops/OperationProcessor;)V
    .locals 0
    .param p1, "processor"    # Lcom/robotoworks/mechanoid/ops/OperationProcessor;

    .prologue
    .line 81
    iput-object p1, p0, Lcom/robotoworks/mechanoid/ops/OperationContext;->mProcessor:Lcom/robotoworks/mechanoid/ops/OperationProcessor;

    .line 82
    return-void
.end method
