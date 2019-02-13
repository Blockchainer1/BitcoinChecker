.class public Lcom/mobnetic/coinguardian/model/Futures;
.super Ljava/lang/Object;
.source "Futures.java"


# static fields
.field public static final CONTRACT_TYPE_BIMONTHLY:I = 0x3

.field public static final CONTRACT_TYPE_BIWEEKLY:I = 0x1

.field public static final CONTRACT_TYPE_MONTHLY:I = 0x2

.field public static final CONTRACT_TYPE_QUARTERLY:I = 0x4

.field private static final CONTRACT_TYPE_SHORT_NAMES:[Ljava/lang/String;

.field public static final CONTRACT_TYPE_WEEKLY:I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 11
    const/4 v0, 0x5

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "1W"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "2W"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "1M"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "2M"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "3M"

    aput-object v2, v0, v1

    sput-object v0, Lcom/mobnetic/coinguardian/model/Futures;->CONTRACT_TYPE_SHORT_NAMES:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getContractTypeShortName(I)Ljava/lang/String;
    .locals 1
    .param p0, "contractType"    # I

    .prologue
    .line 20
    if-ltz p0, :cond_0

    sget-object v0, Lcom/mobnetic/coinguardian/model/Futures;->CONTRACT_TYPE_SHORT_NAMES:[Ljava/lang/String;

    array-length v0, v0

    if-ge p0, v0, :cond_0

    .line 21
    sget-object v0, Lcom/mobnetic/coinguardian/model/Futures;->CONTRACT_TYPE_SHORT_NAMES:[Ljava/lang/String;

    aget-object v0, v0, p0

    .line 23
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
