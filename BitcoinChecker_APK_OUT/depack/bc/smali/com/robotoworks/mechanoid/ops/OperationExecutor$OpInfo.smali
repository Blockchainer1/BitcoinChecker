.class Lcom/robotoworks/mechanoid/ops/OperationExecutor$OpInfo;
.super Ljava/lang/Object;
.source "OperationExecutor.java"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/robotoworks/mechanoid/ops/OperationExecutor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "OpInfo"
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/robotoworks/mechanoid/ops/OperationExecutor$OpInfo;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field mCallbackInvoked:Z

.field mId:I

.field public mIntent:Landroid/content/Intent;

.field mResult:Lcom/robotoworks/mechanoid/ops/OperationResult;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 253
    new-instance v0, Lcom/robotoworks/mechanoid/ops/OperationExecutor$OpInfo$1;

    invoke-direct {v0}, Lcom/robotoworks/mechanoid/ops/OperationExecutor$OpInfo$1;-><init>()V

    sput-object v0, Lcom/robotoworks/mechanoid/ops/OperationExecutor$OpInfo;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 264
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 248
    iput v0, p0, Lcom/robotoworks/mechanoid/ops/OperationExecutor$OpInfo;->mId:I

    .line 249
    iput-boolean v0, p0, Lcom/robotoworks/mechanoid/ops/OperationExecutor$OpInfo;->mCallbackInvoked:Z

    .line 250
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationExecutor$OpInfo;->mResult:Lcom/robotoworks/mechanoid/ops/OperationResult;

    .line 266
    return-void
.end method

.method constructor <init>(Landroid/os/Parcel;)V
    .locals 2
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    const/4 v0, 0x0

    .line 268
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 248
    iput v0, p0, Lcom/robotoworks/mechanoid/ops/OperationExecutor$OpInfo;->mId:I

    .line 249
    iput-boolean v0, p0, Lcom/robotoworks/mechanoid/ops/OperationExecutor$OpInfo;->mCallbackInvoked:Z

    .line 250
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/robotoworks/mechanoid/ops/OperationExecutor$OpInfo;->mResult:Lcom/robotoworks/mechanoid/ops/OperationResult;

    .line 269
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    iput v1, p0, Lcom/robotoworks/mechanoid/ops/OperationExecutor$OpInfo;->mId:I

    .line 270
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    if-lez v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    iput-boolean v0, p0, Lcom/robotoworks/mechanoid/ops/OperationExecutor$OpInfo;->mCallbackInvoked:Z

    .line 271
    const-class v0, Lcom/robotoworks/mechanoid/ops/OperationResult;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/robotoworks/mechanoid/ops/OperationResult;

    iput-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationExecutor$OpInfo;->mResult:Lcom/robotoworks/mechanoid/ops/OperationResult;

    .line 272
    const-class v0, Landroid/content/Intent;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/content/Intent;

    iput-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationExecutor$OpInfo;->mIntent:Landroid/content/Intent;

    .line 273
    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .prologue
    .line 277
    const/4 v0, 0x0

    return v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 2
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    const/4 v1, 0x0

    .line 282
    iget v0, p0, Lcom/robotoworks/mechanoid/ops/OperationExecutor$OpInfo;->mId:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 283
    iget-boolean v0, p0, Lcom/robotoworks/mechanoid/ops/OperationExecutor$OpInfo;->mCallbackInvoked:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 284
    iget-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationExecutor$OpInfo;->mResult:Lcom/robotoworks/mechanoid/ops/OperationResult;

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    .line 285
    iget-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationExecutor$OpInfo;->mIntent:Landroid/content/Intent;

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    .line 286
    return-void

    :cond_0
    move v0, v1

    .line 283
    goto :goto_0
.end method
