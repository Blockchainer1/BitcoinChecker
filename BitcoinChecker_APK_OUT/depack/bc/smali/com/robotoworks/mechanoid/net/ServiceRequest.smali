.class public abstract Lcom/robotoworks/mechanoid/net/ServiceRequest;
.super Ljava/lang/Object;
.source "ServiceRequest.java"


# instance fields
.field private mConnectTimeout:I

.field private mHeaders:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mReadTimeout:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, -0x1

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lcom/robotoworks/mechanoid/net/ServiceRequest;->mHeaders:Ljava/util/LinkedHashMap;

    .line 28
    iput v1, p0, Lcom/robotoworks/mechanoid/net/ServiceRequest;->mReadTimeout:I

    .line 29
    iput v1, p0, Lcom/robotoworks/mechanoid/net/ServiceRequest;->mConnectTimeout:I

    return-void
.end method


# virtual methods
.method public abstract createUrl(Ljava/lang/String;)Ljava/lang/String;
.end method

.method public getConnectTimeout()I
    .locals 1

    .prologue
    .line 56
    iget v0, p0, Lcom/robotoworks/mechanoid/net/ServiceRequest;->mConnectTimeout:I

    return v0
.end method

.method public getHeaderKeys()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 36
    iget-object v0, p0, Lcom/robotoworks/mechanoid/net/ServiceRequest;->mHeaders:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public getHeaderValue(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 40
    iget-object v0, p0, Lcom/robotoworks/mechanoid/net/ServiceRequest;->mHeaders:Ljava/util/LinkedHashMap;

    invoke-virtual {v0, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public getReadTimeout()I
    .locals 1

    .prologue
    .line 48
    iget v0, p0, Lcom/robotoworks/mechanoid/net/ServiceRequest;->mReadTimeout:I

    return v0
.end method

.method public setConnectTimeout(I)V
    .locals 0
    .param p1, "connectTimeout"    # I

    .prologue
    .line 52
    iput p1, p0, Lcom/robotoworks/mechanoid/net/ServiceRequest;->mConnectTimeout:I

    .line 53
    return-void
.end method

.method public setHeader(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "field"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 32
    iget-object v0, p0, Lcom/robotoworks/mechanoid/net/ServiceRequest;->mHeaders:Ljava/util/LinkedHashMap;

    invoke-virtual {v0, p1, p2}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    return-void
.end method

.method public setReadTimeout(I)V
    .locals 0
    .param p1, "readTimeout"    # I

    .prologue
    .line 44
    iput p1, p0, Lcom/robotoworks/mechanoid/net/ServiceRequest;->mReadTimeout:I

    .line 45
    return-void
.end method
