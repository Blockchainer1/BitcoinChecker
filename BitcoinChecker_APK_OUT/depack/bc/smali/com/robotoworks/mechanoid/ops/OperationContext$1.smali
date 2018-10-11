.class Lcom/robotoworks/mechanoid/ops/OperationContext$1;
.super Landroid/os/Handler;
.source "OperationContext.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/robotoworks/mechanoid/ops/OperationContext;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/robotoworks/mechanoid/ops/OperationContext;


# direct methods
.method constructor <init>(Lcom/robotoworks/mechanoid/ops/OperationContext;)V
    .locals 0

    .prologue
    .line 19
    iput-object p1, p0, Lcom/robotoworks/mechanoid/ops/OperationContext$1;->this$0:Lcom/robotoworks/mechanoid/ops/OperationContext;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 3
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 22
    iget v1, p1, Landroid/os/Message;->what:I

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    .line 23
    iget v0, p1, Landroid/os/Message;->arg1:I

    .line 24
    .local v0, "reason":I
    iget-object v1, p0, Lcom/robotoworks/mechanoid/ops/OperationContext$1;->this$0:Lcom/robotoworks/mechanoid/ops/OperationContext;

    invoke-virtual {v1, v0}, Lcom/robotoworks/mechanoid/ops/OperationContext;->abort(I)V

    .line 26
    .end local v0    # "reason":I
    :cond_0
    return-void
.end method
