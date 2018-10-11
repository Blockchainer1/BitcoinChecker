.class public abstract Lcom/robotoworks/mechanoid/ops/OperationServiceListener;
.super Ljava/lang/Object;
.source "OperationServiceListener.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onOperationAborted(ILandroid/content/Intent;ILandroid/os/Bundle;)V
    .locals 0
    .param p1, "id"    # I
    .param p2, "intent"    # Landroid/content/Intent;
    .param p3, "reason"    # I
    .param p4, "data"    # Landroid/os/Bundle;

    .prologue
    .line 70
    return-void
.end method

.method public abstract onOperationComplete(ILcom/robotoworks/mechanoid/ops/OperationResult;)V
.end method

.method public onOperationProgress(ILandroid/content/Intent;ILandroid/os/Bundle;)V
    .locals 0
    .param p1, "id"    # I
    .param p2, "intent"    # Landroid/content/Intent;
    .param p3, "progress"    # I
    .param p4, "data"    # Landroid/os/Bundle;

    .prologue
    .line 56
    return-void
.end method

.method public onOperationStarting(ILandroid/content/Intent;Landroid/os/Bundle;)V
    .locals 0
    .param p1, "id"    # I
    .param p2, "intent"    # Landroid/content/Intent;
    .param p3, "data"    # Landroid/os/Bundle;

    .prologue
    .line 34
    return-void
.end method
