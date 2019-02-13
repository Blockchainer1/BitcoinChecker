.class public Lcom/robotoworks/mechanoid/ops/OperationResult;
.super Ljava/lang/Object;
.source "OperationResult.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/robotoworks/mechanoid/ops/OperationResult;",
            ">;"
        }
    .end annotation
.end field

.field public static final RESULT_ERROR:I = 0x1

.field public static final RESULT_OK:I


# instance fields
.field private mError:Ljava/lang/Throwable;

.field private mRequest:Landroid/content/Intent;

.field private mResultCode:I

.field private mResultData:Landroid/os/Bundle;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 89
    new-instance v0, Lcom/robotoworks/mechanoid/ops/OperationResult$1;

    invoke-direct {v0}, Lcom/robotoworks/mechanoid/ops/OperationResult$1;-><init>()V

    sput-object v0, Lcom/robotoworks/mechanoid/ops/OperationResult;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(I)V
    .locals 2
    .param p1, "resultCode"    # I

    .prologue
    const/4 v1, 0x0

    .line 100
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    const/4 v0, 0x0

    iput v0, p0, Lcom/robotoworks/mechanoid/ops/OperationResult;->mResultCode:I

    .line 21
    iput-object v1, p0, Lcom/robotoworks/mechanoid/ops/OperationResult;->mError:Ljava/lang/Throwable;

    .line 23
    iput-object v1, p0, Lcom/robotoworks/mechanoid/ops/OperationResult;->mResultData:Landroid/os/Bundle;

    .line 25
    iput-object v1, p0, Lcom/robotoworks/mechanoid/ops/OperationResult;->mRequest:Landroid/content/Intent;

    .line 101
    iput p1, p0, Lcom/robotoworks/mechanoid/ops/OperationResult;->mResultCode:I

    .line 102
    return-void
.end method

.method private constructor <init>(Landroid/os/Parcel;)V
    .locals 2
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    const/4 v1, 0x0

    .line 104
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    const/4 v0, 0x0

    iput v0, p0, Lcom/robotoworks/mechanoid/ops/OperationResult;->mResultCode:I

    .line 21
    iput-object v1, p0, Lcom/robotoworks/mechanoid/ops/OperationResult;->mError:Ljava/lang/Throwable;

    .line 23
    iput-object v1, p0, Lcom/robotoworks/mechanoid/ops/OperationResult;->mResultData:Landroid/os/Bundle;

    .line 25
    iput-object v1, p0, Lcom/robotoworks/mechanoid/ops/OperationResult;->mRequest:Landroid/content/Intent;

    .line 105
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/robotoworks/mechanoid/ops/OperationResult;->mResultCode:I

    .line 106
    invoke-virtual {p1}, Landroid/os/Parcel;->readSerializable()Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Ljava/lang/Throwable;

    iput-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationResult;->mError:Ljava/lang/Throwable;

    .line 107
    invoke-virtual {p1}, Landroid/os/Parcel;->readBundle()Landroid/os/Bundle;

    move-result-object v0

    iput-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationResult;->mResultData:Landroid/os/Bundle;

    .line 108
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/content/Intent;

    iput-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationResult;->mRequest:Landroid/content/Intent;

    .line 109
    return-void
.end method

.method synthetic constructor <init>(Landroid/os/Parcel;Lcom/robotoworks/mechanoid/ops/OperationResult$1;)V
    .locals 0
    .param p1, "x0"    # Landroid/os/Parcel;
    .param p2, "x1"    # Lcom/robotoworks/mechanoid/ops/OperationResult$1;

    .prologue
    .line 8
    invoke-direct {p0, p1}, Lcom/robotoworks/mechanoid/ops/OperationResult;-><init>(Landroid/os/Parcel;)V

    return-void
.end method

.method public static error(Ljava/lang/Throwable;)Lcom/robotoworks/mechanoid/ops/OperationResult;
    .locals 2
    .param p0, "error"    # Ljava/lang/Throwable;

    .prologue
    .line 131
    new-instance v0, Lcom/robotoworks/mechanoid/ops/OperationResult;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lcom/robotoworks/mechanoid/ops/OperationResult;-><init>(I)V

    .line 132
    .local v0, "result":Lcom/robotoworks/mechanoid/ops/OperationResult;
    invoke-virtual {v0, p0}, Lcom/robotoworks/mechanoid/ops/OperationResult;->setError(Ljava/lang/Throwable;)V

    .line 133
    return-object v0
.end method

.method public static fromBundle(Landroid/os/Bundle;)Lcom/robotoworks/mechanoid/ops/OperationResult;
    .locals 1
    .param p0, "bundle"    # Landroid/os/Bundle;

    .prologue
    .line 171
    const-class v0, Lcom/robotoworks/mechanoid/ops/OperationResult;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/os/Bundle;->setClassLoader(Ljava/lang/ClassLoader;)V

    .line 172
    const-class v0, Lcom/robotoworks/mechanoid/ops/OperationResult;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/robotoworks/mechanoid/ops/OperationResult;

    return-object v0
.end method

.method public static ok()Lcom/robotoworks/mechanoid/ops/OperationResult;
    .locals 2

    .prologue
    .line 142
    new-instance v0, Lcom/robotoworks/mechanoid/ops/OperationResult;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/robotoworks/mechanoid/ops/OperationResult;-><init>(I)V

    return-object v0
.end method

.method public static ok(Landroid/os/Bundle;)Lcom/robotoworks/mechanoid/ops/OperationResult;
    .locals 3
    .param p0, "bundle"    # Landroid/os/Bundle;

    .prologue
    .line 153
    if-nez p0, :cond_0

    .line 154
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "bundle cannot be null"

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 157
    :cond_0
    new-instance v0, Lcom/robotoworks/mechanoid/ops/OperationResult;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/robotoworks/mechanoid/ops/OperationResult;-><init>(I)V

    .line 158
    .local v0, "result":Lcom/robotoworks/mechanoid/ops/OperationResult;
    invoke-virtual {v0, p0}, Lcom/robotoworks/mechanoid/ops/OperationResult;->setData(Landroid/os/Bundle;)V

    .line 160
    return-object v0
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .prologue
    .line 113
    const/4 v0, 0x0

    return v0
.end method

.method public getCode()I
    .locals 1

    .prologue
    .line 51
    iget v0, p0, Lcom/robotoworks/mechanoid/ops/OperationResult;->mResultCode:I

    return v0
.end method

.method public getData()Landroid/os/Bundle;
    .locals 1

    .prologue
    .line 63
    iget-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationResult;->mResultData:Landroid/os/Bundle;

    return-object v0
.end method

.method public getError()Ljava/lang/Throwable;
    .locals 1

    .prologue
    .line 59
    iget-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationResult;->mError:Ljava/lang/Throwable;

    return-object v0
.end method

.method public getRequest()Landroid/content/Intent;
    .locals 1

    .prologue
    .line 86
    iget-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationResult;->mRequest:Landroid/content/Intent;

    return-object v0
.end method

.method public isOk()Z
    .locals 1

    .prologue
    .line 78
    iget v0, p0, Lcom/robotoworks/mechanoid/ops/OperationResult;->mResultCode:I

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setCode(I)V
    .locals 0
    .param p1, "resultCode"    # I

    .prologue
    .line 43
    iput p1, p0, Lcom/robotoworks/mechanoid/ops/OperationResult;->mResultCode:I

    .line 44
    return-void
.end method

.method public setData(Landroid/os/Bundle;)V
    .locals 0
    .param p1, "resultData"    # Landroid/os/Bundle;

    .prologue
    .line 71
    iput-object p1, p0, Lcom/robotoworks/mechanoid/ops/OperationResult;->mResultData:Landroid/os/Bundle;

    .line 72
    return-void
.end method

.method public setError(Ljava/lang/Throwable;)V
    .locals 0
    .param p1, "error"    # Ljava/lang/Throwable;

    .prologue
    .line 34
    iput-object p1, p0, Lcom/robotoworks/mechanoid/ops/OperationResult;->mError:Ljava/lang/Throwable;

    .line 35
    return-void
.end method

.method public setRequest(Landroid/content/Intent;)V
    .locals 0
    .param p1, "request"    # Landroid/content/Intent;

    .prologue
    .line 82
    iput-object p1, p0, Lcom/robotoworks/mechanoid/ops/OperationResult;->mRequest:Landroid/content/Intent;

    .line 83
    return-void
.end method

.method public toBundle()Landroid/os/Bundle;
    .locals 2

    .prologue
    .line 164
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 165
    .local v0, "bundle":Landroid/os/Bundle;
    const-class v1, Lcom/robotoworks/mechanoid/ops/OperationResult;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 167
    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 2
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 118
    iget v0, p0, Lcom/robotoworks/mechanoid/ops/OperationResult;->mResultCode:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 119
    iget-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationResult;->mError:Ljava/lang/Throwable;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeSerializable(Ljava/io/Serializable;)V

    .line 120
    iget-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationResult;->mResultData:Landroid/os/Bundle;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeBundle(Landroid/os/Bundle;)V

    .line 121
    iget-object v0, p0, Lcom/robotoworks/mechanoid/ops/OperationResult;->mRequest:Landroid/content/Intent;

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    .line 122
    return-void
.end method
