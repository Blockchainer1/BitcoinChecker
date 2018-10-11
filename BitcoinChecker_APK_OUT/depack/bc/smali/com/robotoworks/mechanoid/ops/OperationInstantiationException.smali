.class public Lcom/robotoworks/mechanoid/ops/OperationInstantiationException;
.super Ljava/lang/RuntimeException;
.source "OperationInstantiationException.java"


# static fields
.field private static final serialVersionUID:J = 0x533250eee146da58L


# direct methods
.method public constructor <init>(Ljava/lang/Throwable;)V
    .locals 0
    .param p1, "cause"    # Ljava/lang/Throwable;

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/RuntimeException;-><init>()V

    .line 22
    invoke-virtual {p0, p1}, Lcom/robotoworks/mechanoid/ops/OperationInstantiationException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 23
    return-void
.end method
