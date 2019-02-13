.class Lcom/robotoworks/mechanoid/ops/OperationManagerBase$2;
.super Ljava/lang/Object;
.source "OperationManagerBase.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/robotoworks/mechanoid/ops/OperationManagerBase;->queuePendingOperation(Landroid/content/Intent;IZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/robotoworks/mechanoid/ops/OperationManagerBase;

.field final synthetic val$operationIntent:Landroid/content/Intent;

.field final synthetic val$pendingForce:Z

.field final synthetic val$pendingOperationCode:I


# direct methods
.method constructor <init>(Lcom/robotoworks/mechanoid/ops/OperationManagerBase;Landroid/content/Intent;IZ)V
    .locals 0

    .prologue
    .line 311
    iput-object p1, p0, Lcom/robotoworks/mechanoid/ops/OperationManagerBase$2;->this$0:Lcom/robotoworks/mechanoid/ops/OperationManagerBase;

    iput-object p2, p0, Lcom/robotoworks/mechanoid/ops/OperationManagerBase$2;->val$operationIntent:Landroid/content/Intent;

    iput p3, p0, Lcom/robotoworks/mechanoid/ops/OperationManagerBase$2;->val$pendingOperationCode:I

    iput-boolean p4, p0, Lcom/robotoworks/mechanoid/ops/OperationManagerBase$2;->val$pendingForce:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 315
    iget-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationManagerBase$2;->this$0:Lcom/robotoworks/mechanoid/ops/OperationManagerBase;

    iget-object v1, p0, Lcom/robotoworks/mechanoid/ops/OperationManagerBase$2;->val$operationIntent:Landroid/content/Intent;

    iget v2, p0, Lcom/robotoworks/mechanoid/ops/OperationManagerBase$2;->val$pendingOperationCode:I

    iget-boolean v3, p0, Lcom/robotoworks/mechanoid/ops/OperationManagerBase$2;->val$pendingForce:Z

    invoke-virtual {v0, v1, v2, v3}, Lcom/robotoworks/mechanoid/ops/OperationManagerBase;->execute(Landroid/content/Intent;IZ)V

    .line 316
    return-void
.end method
