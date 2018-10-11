.class public Lcom/robotoworks/mechanoid/net/UnexpectedHttpStatusException;
.super Ljava/lang/RuntimeException;
.source "UnexpectedHttpStatusException.java"


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private mActualStatus:I

.field private mExpectedStatus:I


# direct methods
.method public constructor <init>(II)V
    .locals 4
    .param p1, "actualStatus"    # I
    .param p2, "expectedStatus"    # I

    .prologue
    .line 31
    const-string v0, "Expected Status %d,  Actual Status %d"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 32
    iput p1, p0, Lcom/robotoworks/mechanoid/net/UnexpectedHttpStatusException;->mActualStatus:I

    .line 33
    iput p2, p0, Lcom/robotoworks/mechanoid/net/UnexpectedHttpStatusException;->mExpectedStatus:I

    .line 34
    return-void
.end method


# virtual methods
.method public getActualStatus()I
    .locals 1

    .prologue
    .line 23
    iget v0, p0, Lcom/robotoworks/mechanoid/net/UnexpectedHttpStatusException;->mActualStatus:I

    return v0
.end method

.method public getExpectedStatus()I
    .locals 1

    .prologue
    .line 27
    iget v0, p0, Lcom/robotoworks/mechanoid/net/UnexpectedHttpStatusException;->mExpectedStatus:I

    return v0
.end method
