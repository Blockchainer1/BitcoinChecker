.class public Lcom/robotoworks/mechanoid/net/HttpUrlConnectionResponse;
.super Ljava/lang/Object;
.source "HttpUrlConnectionResponse.java"

# interfaces
.implements Lcom/robotoworks/mechanoid/net/Response;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/robotoworks/mechanoid/net/Response",
        "<TT;>;"
    }
.end annotation


# instance fields
.field private mConn:Ljava/net/HttpURLConnection;

.field private mContent:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field private mHeaders:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field private mInputBytes:[B

.field private mParsed:Z

.field private mParser:Lcom/robotoworks/mechanoid/net/Parser;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/robotoworks/mechanoid/net/Parser",
            "<TT;>;"
        }
    .end annotation
.end field

.field private mResponseCode:I


# direct methods
.method public constructor <init>(Ljava/net/HttpURLConnection;Lcom/robotoworks/mechanoid/net/Parser;)V
    .locals 2
    .param p1, "conn"    # Ljava/net/HttpURLConnection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/net/HttpURLConnection;",
            "Lcom/robotoworks/mechanoid/net/Parser",
            "<TT;>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/robotoworks/mechanoid/net/ServiceException;
        }
    .end annotation

    .prologue
    .line 80
    .local p0, "this":Lcom/robotoworks/mechanoid/net/HttpUrlConnectionResponse;, "Lcom/robotoworks/mechanoid/net/HttpUrlConnectionResponse<TT;>;"
    .local p2, "parser":Lcom/robotoworks/mechanoid/net/Parser;, "Lcom/robotoworks/mechanoid/net/Parser<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 81
    iput-object p1, p0, Lcom/robotoworks/mechanoid/net/HttpUrlConnectionResponse;->mConn:Ljava/net/HttpURLConnection;

    .line 82
    iput-object p2, p0, Lcom/robotoworks/mechanoid/net/HttpUrlConnectionResponse;->mParser:Lcom/robotoworks/mechanoid/net/Parser;

    .line 84
    :try_start_0
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v1

    iput v1, p0, Lcom/robotoworks/mechanoid/net/HttpUrlConnectionResponse;->mResponseCode:I

    .line 85
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getHeaderFields()Ljava/util/Map;

    move-result-object v1

    iput-object v1, p0, Lcom/robotoworks/mechanoid/net/HttpUrlConnectionResponse;->mHeaders:Ljava/util/Map;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 89
    return-void

    .line 86
    :catch_0
    move-exception v0

    .line 87
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Lcom/robotoworks/mechanoid/net/ServiceException;

    invoke-direct {v1, v0}, Lcom/robotoworks/mechanoid/net/ServiceException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method private getInputStream()Ljava/io/InputStream;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 127
    .local p0, "this":Lcom/robotoworks/mechanoid/net/HttpUrlConnectionResponse;, "Lcom/robotoworks/mechanoid/net/HttpUrlConnectionResponse<TT;>;"
    iget-object v1, p0, Lcom/robotoworks/mechanoid/net/HttpUrlConnectionResponse;->mConn:Ljava/net/HttpURLConnection;

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getErrorStream()Ljava/io/InputStream;

    move-result-object v0

    .line 128
    .local v0, "stream":Ljava/io/InputStream;
    if-eqz v0, :cond_0

    .line 130
    .end local v0    # "stream":Ljava/io/InputStream;
    :goto_0
    return-object v0

    .restart local v0    # "stream":Ljava/io/InputStream;
    :cond_0
    iget-object v1, p0, Lcom/robotoworks/mechanoid/net/HttpUrlConnectionResponse;->mConn:Ljava/net/HttpURLConnection;

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    goto :goto_0
.end method


# virtual methods
.method public checkResponseCode(I)V
    .locals 3
    .param p1, "responseCode"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/robotoworks/mechanoid/net/UnexpectedHttpStatusException;
        }
    .end annotation

    .prologue
    .line 67
    .local p0, "this":Lcom/robotoworks/mechanoid/net/HttpUrlConnectionResponse;, "Lcom/robotoworks/mechanoid/net/HttpUrlConnectionResponse<TT;>;"
    iget v0, p0, Lcom/robotoworks/mechanoid/net/HttpUrlConnectionResponse;->mResponseCode:I

    if-eq v0, p1, :cond_0

    .line 68
    new-instance v0, Lcom/robotoworks/mechanoid/net/UnexpectedHttpStatusException;

    iget v1, p0, Lcom/robotoworks/mechanoid/net/HttpUrlConnectionResponse;->mResponseCode:I

    const/16 v2, 0xc8

    invoke-direct {v0, v1, v2}, Lcom/robotoworks/mechanoid/net/UnexpectedHttpStatusException;-><init>(II)V

    throw v0

    .line 70
    :cond_0
    return-void
.end method

.method public checkResponseCodeOk()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/robotoworks/mechanoid/net/UnexpectedHttpStatusException;
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/robotoworks/mechanoid/net/HttpUrlConnectionResponse;, "Lcom/robotoworks/mechanoid/net/HttpUrlConnectionResponse<TT;>;"
    const/16 v2, 0xc8

    .line 57
    iget v0, p0, Lcom/robotoworks/mechanoid/net/HttpUrlConnectionResponse;->mResponseCode:I

    if-eq v0, v2, :cond_0

    .line 58
    new-instance v0, Lcom/robotoworks/mechanoid/net/UnexpectedHttpStatusException;

    iget v1, p0, Lcom/robotoworks/mechanoid/net/HttpUrlConnectionResponse;->mResponseCode:I

    invoke-direct {v0, v1, v2}, Lcom/robotoworks/mechanoid/net/UnexpectedHttpStatusException;-><init>(II)V

    throw v0

    .line 60
    :cond_0
    return-void
.end method

.method public getHeaders()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 77
    .local p0, "this":Lcom/robotoworks/mechanoid/net/HttpUrlConnectionResponse;, "Lcom/robotoworks/mechanoid/net/HttpUrlConnectionResponse<TT;>;"
    iget-object v0, p0, Lcom/robotoworks/mechanoid/net/HttpUrlConnectionResponse;->mHeaders:Ljava/util/Map;

    return-object v0
.end method

.method public getResponseCode()I
    .locals 1

    .prologue
    .line 49
    .local p0, "this":Lcom/robotoworks/mechanoid/net/HttpUrlConnectionResponse;, "Lcom/robotoworks/mechanoid/net/HttpUrlConnectionResponse<TT;>;"
    iget v0, p0, Lcom/robotoworks/mechanoid/net/HttpUrlConnectionResponse;->mResponseCode:I

    return v0
.end method

.method public parse()Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/robotoworks/mechanoid/net/ServiceException;
        }
    .end annotation

    .prologue
    .line 96
    .local p0, "this":Lcom/robotoworks/mechanoid/net/HttpUrlConnectionResponse;, "Lcom/robotoworks/mechanoid/net/HttpUrlConnectionResponse<TT;>;"
    iget-boolean v3, p0, Lcom/robotoworks/mechanoid/net/HttpUrlConnectionResponse;->mParsed:Z

    if-eqz v3, :cond_0

    .line 97
    iget-object v3, p0, Lcom/robotoworks/mechanoid/net/HttpUrlConnectionResponse;->mContent:Ljava/lang/Object;

    .line 120
    :goto_0
    return-object v3

    .line 101
    :cond_0
    const/4 v1, 0x0

    .line 102
    .local v1, "stream":Ljava/io/InputStream;
    :try_start_0
    iget-object v3, p0, Lcom/robotoworks/mechanoid/net/HttpUrlConnectionResponse;->mInputBytes:[B

    if-nez v3, :cond_3

    .line 103
    invoke-direct {p0}, Lcom/robotoworks/mechanoid/net/HttpUrlConnectionResponse;->getInputStream()Ljava/io/InputStream;

    move-result-object v1

    .line 110
    :cond_1
    :goto_1
    if-eqz v1, :cond_2

    .line 111
    iget-object v3, p0, Lcom/robotoworks/mechanoid/net/HttpUrlConnectionResponse;->mParser:Lcom/robotoworks/mechanoid/net/Parser;

    invoke-interface {v3, v1}, Lcom/robotoworks/mechanoid/net/Parser;->parse(Ljava/io/InputStream;)Ljava/lang/Object;

    move-result-object v3

    iput-object v3, p0, Lcom/robotoworks/mechanoid/net/HttpUrlConnectionResponse;->mContent:Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 118
    :cond_2
    const/4 v3, 0x1

    iput-boolean v3, p0, Lcom/robotoworks/mechanoid/net/HttpUrlConnectionResponse;->mParsed:Z

    .line 120
    iget-object v3, p0, Lcom/robotoworks/mechanoid/net/HttpUrlConnectionResponse;->mContent:Ljava/lang/Object;

    goto :goto_0

    .line 105
    :cond_3
    :try_start_1
    iget-object v3, p0, Lcom/robotoworks/mechanoid/net/HttpUrlConnectionResponse;->mInputBytes:[B

    array-length v3, v3

    if-lez v3, :cond_1

    .line 106
    new-instance v2, Ljava/io/ByteArrayInputStream;

    iget-object v3, p0, Lcom/robotoworks/mechanoid/net/HttpUrlConnectionResponse;->mInputBytes:[B

    invoke-direct {v2, v3}, Ljava/io/ByteArrayInputStream;-><init>([B)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .end local v1    # "stream":Ljava/io/InputStream;
    .local v2, "stream":Ljava/io/InputStream;
    move-object v1, v2

    .end local v2    # "stream":Ljava/io/InputStream;
    .restart local v1    # "stream":Ljava/io/InputStream;
    goto :goto_1

    .line 114
    :catch_0
    move-exception v0

    .line 115
    .local v0, "e":Ljava/lang/Exception;
    new-instance v3, Lcom/robotoworks/mechanoid/net/ServiceException;

    invoke-direct {v3, v0}, Lcom/robotoworks/mechanoid/net/ServiceException;-><init>(Ljava/lang/Throwable;)V

    throw v3
.end method

.method public readAsText()Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 138
    .local p0, "this":Lcom/robotoworks/mechanoid/net/HttpUrlConnectionResponse;, "Lcom/robotoworks/mechanoid/net/HttpUrlConnectionResponse<TT;>;"
    iget-object v1, p0, Lcom/robotoworks/mechanoid/net/HttpUrlConnectionResponse;->mInputBytes:[B

    if-nez v1, :cond_0

    .line 139
    invoke-direct {p0}, Lcom/robotoworks/mechanoid/net/HttpUrlConnectionResponse;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    .line 140
    .local v0, "stream":Ljava/io/InputStream;
    if-nez v0, :cond_1

    .line 141
    const/4 v1, 0x0

    new-array v1, v1, [B

    iput-object v1, p0, Lcom/robotoworks/mechanoid/net/HttpUrlConnectionResponse;->mInputBytes:[B

    .line 147
    .end local v0    # "stream":Ljava/io/InputStream;
    :cond_0
    :goto_0
    new-instance v1, Ljava/io/ByteArrayInputStream;

    iget-object v2, p0, Lcom/robotoworks/mechanoid/net/HttpUrlConnectionResponse;->mInputBytes:[B

    invoke-direct {v1, v2}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-static {v1}, Lcom/robotoworks/mechanoid/util/Streams;->readAllText(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 143
    .restart local v0    # "stream":Ljava/io/InputStream;
    :cond_1
    invoke-direct {p0}, Lcom/robotoworks/mechanoid/net/HttpUrlConnectionResponse;->getInputStream()Ljava/io/InputStream;

    move-result-object v1

    invoke-static {v1}, Lcom/robotoworks/mechanoid/util/Streams;->readAllBytes(Ljava/io/InputStream;)[B

    move-result-object v1

    iput-object v1, p0, Lcom/robotoworks/mechanoid/net/HttpUrlConnectionResponse;->mInputBytes:[B

    goto :goto_0
.end method
