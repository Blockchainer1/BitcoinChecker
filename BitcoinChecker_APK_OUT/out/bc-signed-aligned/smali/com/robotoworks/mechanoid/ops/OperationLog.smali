.class public Lcom/robotoworks/mechanoid/ops/OperationLog;
.super Lcom/robotoworks/mechanoid/internal/util/LruCache;
.source "OperationLog.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/robotoworks/mechanoid/internal/util/LruCache",
        "<",
        "Ljava/lang/Integer;",
        "Lcom/robotoworks/mechanoid/ops/OperationResult;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(I)V
    .locals 0
    .param p1, "size"    # I

    .prologue
    .line 22
    invoke-direct {p0, p1}, Lcom/robotoworks/mechanoid/internal/util/LruCache;-><init>(I)V

    .line 23
    return-void
.end method
