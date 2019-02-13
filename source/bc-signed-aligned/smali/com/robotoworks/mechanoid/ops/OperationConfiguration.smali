.class public abstract Lcom/robotoworks/mechanoid/ops/OperationConfiguration;
.super Ljava/lang/Object;
.source "OperationConfiguration.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract createOperation()Lcom/robotoworks/mechanoid/ops/Operation;
.end method

.method public abstract findMatchOnConstraint(Lcom/robotoworks/mechanoid/ops/OperationServiceBridge;Landroid/content/Intent;)Landroid/content/Intent;
.end method
