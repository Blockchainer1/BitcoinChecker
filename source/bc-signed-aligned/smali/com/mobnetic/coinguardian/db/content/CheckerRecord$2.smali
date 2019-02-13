.class final Lcom/mobnetic/coinguardian/db/content/CheckerRecord$2;
.super Ljava/lang/Object;
.source "CheckerRecord.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mobnetic/coinguardian/db/content/CheckerRecord;
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
        "Lcom/mobnetic/coinguardian/db/content/CheckerRecord;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromParcel(Landroid/os/Parcel;)Lcom/mobnetic/coinguardian/db/content/CheckerRecord;
    .locals 2
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 41
    new-instance v0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;-><init>(Landroid/os/Parcel;Lcom/mobnetic/coinguardian/db/content/CheckerRecord$1;)V

    return-object v0
.end method

.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 39
    invoke-virtual {p0, p1}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord$2;->createFromParcel(Landroid/os/Parcel;)Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    move-result-object v0

    return-object v0
.end method

.method public newArray(I)[Lcom/mobnetic/coinguardian/db/content/CheckerRecord;
    .locals 1
    .param p1, "size"    # I

    .prologue
    .line 45
    new-array v0, p1, [Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    return-object v0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 1

    .prologue
    .line 39
    invoke-virtual {p0, p1}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord$2;->newArray(I)[Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    move-result-object v0

    return-object v0
.end method
