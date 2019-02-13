.class Lcom/robotoworks/mechanoid/ops/OperationService$LocalBinder;
.super Landroid/os/Binder;
.source "OperationService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/robotoworks/mechanoid/ops/OperationService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "LocalBinder"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/robotoworks/mechanoid/ops/OperationService;


# direct methods
.method constructor <init>(Lcom/robotoworks/mechanoid/ops/OperationService;)V
    .locals 0

    .prologue
    .line 55
    iput-object p1, p0, Lcom/robotoworks/mechanoid/ops/OperationService$LocalBinder;->this$0:Lcom/robotoworks/mechanoid/ops/OperationService;

    invoke-direct {p0}, Landroid/os/Binder;-><init>()V

    return-void
.end method


# virtual methods
.method getService()Lcom/robotoworks/mechanoid/ops/OperationService;
    .locals 1

    .prologue
    .line 57
    iget-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationService$LocalBinder;->this$0:Lcom/robotoworks/mechanoid/ops/OperationService;

    return-object v0
.end method
