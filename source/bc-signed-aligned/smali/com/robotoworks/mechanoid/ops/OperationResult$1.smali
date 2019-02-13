.class final Lcom/robotoworks/mechanoid/ops/OperationResult$1;
.super Ljava/lang/Object;
.source "OperationResult.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/robotoworks/mechanoid/ops/OperationResult;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$Creator",
        "<",
        "Lcom/robotoworks/mechanoid/ops/OperationResult;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 90
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromParcel(Landroid/os/Parcel;)Lcom/robotoworks/mechanoid/ops/OperationResult;
    .locals 2
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 92
    new-instance v0, Lcom/robotoworks/mechanoid/ops/OperationResult;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lcom/robotoworks/mechanoid/ops/OperationResult;-><init>(Landroid/os/Parcel;Lcom/robotoworks/mechanoid/ops/OperationResult$1;)V

    return-object v0
.end method

.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # Landroid/os/Parcel;

    .prologue
    .line 90
    invoke-virtual {p0, p1}, Lcom/robotoworks/mechanoid/ops/OperationResult$1;->createFromParcel(Landroid/os/Parcel;)Lcom/robotoworks/mechanoid/ops/OperationResult;

    move-result-object v0

    return-object v0
.end method

.method public newArray(I)[Lcom/robotoworks/mechanoid/ops/OperationResult;
    .locals 1
    .param p1, "size"    # I

    .prologue
    .line 96
    new-array v0, p1, [Lcom/robotoworks/mechanoid/ops/OperationResult;

    return-object v0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # I

    .prologue
    .line 90
    invoke-virtual {p0, p1}, Lcom/robotoworks/mechanoid/ops/OperationResult$1;->newArray(I)[Lcom/robotoworks/mechanoid/ops/OperationResult;

    move-result-object v0

    return-object v0
.end method
