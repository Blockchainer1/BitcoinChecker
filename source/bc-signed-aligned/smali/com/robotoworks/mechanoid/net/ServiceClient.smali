.class public abstract Lcom/robotoworks/mechanoid/net/ServiceClient;
.super Ljava/lang/Object;
.source "ServiceClient.java"


# static fields
.field private static final DEFAULT_LOG_TAG:Ljava/lang/String;

.field protected static final METHOD_DELETE:Ljava/lang/String; = "DELETE"

.field protected static final METHOD_GET:Ljava/lang/String; = "GET"

.field protected static final METHOD_POST:Ljava/lang/String; = "POST"

.field protected static final METHOD_PUT:Ljava/lang/String; = "PUT"


# instance fields
.field private mBaseUrl:Ljava/lang/String;

.field private mConnectTimeout:I

.field private mDebug:Z

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

.field private mReaderProvider:Lcom/robotoworks/mechanoid/net/JsonEntityReaderProvider;

.field private mWriterProvider:Lcom/robotoworks/mechanoid/net/JsonEntityWriterProvider;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 31
    const-class v0, Lcom/robotoworks/mechanoid/net/ServiceClient;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/robotoworks/mechanoid/net/ServiceClient;->DEFAULT_LOG_TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Z)V
    .locals 2
    .param p1, "baseUrl"    # Ljava/lang/String;
    .param p2, "debug"    # Z

    .prologue
    const/16 v1, 0x4e20

    .line 92
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lcom/robotoworks/mechanoid/net/ServiceClient;->mHeaders:Ljava/util/LinkedHashMap;

    .line 45
    iput v1, p0, Lcom/robotoworks/mechanoid/net/ServiceClient;->mConnectTimeout:I

    .line 46
    iput v1, p0, Lcom/robotoworks/mechanoid/net/ServiceClient;->mReadTimeout:I

    .line 93
    iput-object p1, p0, Lcom/robotoworks/mechanoid/net/ServiceClient;->mBaseUrl:Ljava/lang/String;

    .line 94
    iput-boolean p2, p0, Lcom/robotoworks/mechanoid/net/ServiceClient;->mDebug:Z

    .line 96
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/net/ServiceClient;->createReaderProvider()Lcom/robotoworks/mechanoid/net/JsonEntityReaderProvider;

    move-result-object v0

    iput-object v0, p0, Lcom/robotoworks/mechanoid/net/ServiceClient;->mReaderProvider:Lcom/robotoworks/mechanoid/net/JsonEntityReaderProvider;

    .line 97
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/net/ServiceClient;->createWriterProvider()Lcom/robotoworks/mechanoid/net/JsonEntityWriterProvider;

    move-result-object v0

    iput-object v0, p0, Lcom/robotoworks/mechanoid/net/ServiceClient;->mWriterProvider:Lcom/robotoworks/mechanoid/net/JsonEntityWriterProvider;

    .line 98
    return-void
.end method


# virtual methods
.method protected applyRequestProperties(Lcom/robotoworks/mechanoid/net/ServiceRequest;Ljava/net/HttpURLConnection;)V
    .locals 3
    .param p2, "conn"    # Ljava/net/HttpURLConnection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<REQUEST:",
            "Lcom/robotoworks/mechanoid/net/ServiceRequest;",
            ">(TREQUEST;",
            "Ljava/net/HttpURLConnection;",
            ")V"
        }
    .end annotation

    .prologue
    .line 325
    .local p1, "request":Lcom/robotoworks/mechanoid/net/ServiceRequest;, "TREQUEST;"
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/net/ServiceClient;->getHeaders()Ljava/util/LinkedHashMap;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 326
    .local v1, "key":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/net/ServiceClient;->getHeaders()Ljava/util/LinkedHashMap;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {p2, v1, v2}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 329
    .end local v1    # "key":Ljava/lang/String;
    :cond_0
    invoke-virtual {p1}, Lcom/robotoworks/mechanoid/net/ServiceRequest;->getHeaderKeys()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 330
    .restart local v1    # "key":Ljava/lang/String;
    invoke-virtual {p1, v1}, Lcom/robotoworks/mechanoid/net/ServiceRequest;->getHeaderValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2, v1, v2}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 332
    .end local v1    # "key":Ljava/lang/String;
    :cond_1
    return-void
.end method

.method protected applyRequestTimeouts(Lcom/robotoworks/mechanoid/net/ServiceRequest;Ljava/net/HttpURLConnection;)V
    .locals 2
    .param p2, "conn"    # Ljava/net/HttpURLConnection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<REQUEST:",
            "Lcom/robotoworks/mechanoid/net/ServiceRequest;",
            ">(TREQUEST;",
            "Ljava/net/HttpURLConnection;",
            ")V"
        }
    .end annotation

    .prologue
    .local p1, "request":Lcom/robotoworks/mechanoid/net/ServiceRequest;, "TREQUEST;"
    const/4 v1, -0x1

    .line 302
    invoke-virtual {p1}, Lcom/robotoworks/mechanoid/net/ServiceRequest;->getReadTimeout()I

    move-result v0

    if-le v0, v1, :cond_0

    .line 303
    invoke-virtual {p1}, Lcom/robotoworks/mechanoid/net/ServiceRequest;->getReadTimeout()I

    move-result v0

    invoke-virtual {p2, v0}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    .line 308
    :goto_0
    invoke-virtual {p1}, Lcom/robotoworks/mechanoid/net/ServiceRequest;->getConnectTimeout()I

    move-result v0

    if-le v0, v1, :cond_1

    .line 309
    invoke-virtual {p1}, Lcom/robotoworks/mechanoid/net/ServiceRequest;->getConnectTimeout()I

    move-result v0

    invoke-virtual {p2, v0}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 313
    :goto_1
    return-void

    .line 305
    :cond_0
    iget v0, p0, Lcom/robotoworks/mechanoid/net/ServiceClient;->mReadTimeout:I

    invoke-virtual {p2, v0}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    goto :goto_0

    .line 311
    :cond_1
    iget v0, p0, Lcom/robotoworks/mechanoid/net/ServiceClient;->mConnectTimeout:I

    invoke-virtual {p2, v0}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    goto :goto_1
.end method

.method protected createMockedResponse(Ljava/net/URL;Lcom/robotoworks/mechanoid/net/ServiceRequest;Lcom/robotoworks/mechanoid/net/Parser;)Lcom/robotoworks/mechanoid/net/Response;
    .locals 1
    .param p1, "url"    # Ljava/net/URL;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<REQUEST:",
            "Lcom/robotoworks/mechanoid/net/ServiceRequest;",
            "RESU",
            "LT:Lcom/robotoworks/mechanoid/net/ServiceResult;",
            ">(",
            "Ljava/net/URL;",
            "TREQUEST;",
            "Lcom/robotoworks/mechanoid/net/Parser",
            "<TRESU",
            "LT;",
            ">;)",
            "Lcom/robotoworks/mechanoid/net/Response",
            "<TRESU",
            "LT;",
            ">;"
        }
    .end annotation

    .prologue
    .line 348
    .local p2, "request":Lcom/robotoworks/mechanoid/net/ServiceRequest;, "TREQUEST;"
    .local p3, "resultParser":Lcom/robotoworks/mechanoid/net/Parser;, "Lcom/robotoworks/mechanoid/net/Parser<TRESULT;>;"
    const/4 v0, 0x0

    return-object v0
.end method

.method protected abstract createReaderProvider()Lcom/robotoworks/mechanoid/net/JsonEntityReaderProvider;
.end method

.method protected createUrl(Lcom/robotoworks/mechanoid/net/ServiceRequest;)Ljava/net/URL;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<REQUEST:",
            "Lcom/robotoworks/mechanoid/net/ServiceRequest;",
            ">(TREQUEST;)",
            "Ljava/net/URL;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/MalformedURLException;
        }
    .end annotation

    .prologue
    .line 343
    .local p1, "request":Lcom/robotoworks/mechanoid/net/ServiceRequest;, "TREQUEST;"
    new-instance v0, Ljava/net/URL;

    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/net/ServiceClient;->getBaseUrl()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Lcom/robotoworks/mechanoid/net/ServiceRequest;->createUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 344
    .local v0, "url":Ljava/net/URL;
    return-object v0
.end method

.method protected abstract createWriterProvider()Lcom/robotoworks/mechanoid/net/JsonEntityWriterProvider;
.end method

.method protected delete(Lcom/robotoworks/mechanoid/net/ServiceRequest;Lcom/robotoworks/mechanoid/net/Parser;)Lcom/robotoworks/mechanoid/net/Response;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<REQUEST:",
            "Lcom/robotoworks/mechanoid/net/ServiceRequest;",
            "RESU",
            "LT:Lcom/robotoworks/mechanoid/net/ServiceResult;",
            ">(TREQUEST;",
            "Lcom/robotoworks/mechanoid/net/Parser",
            "<TRESU",
            "LT;",
            ">;)",
            "Lcom/robotoworks/mechanoid/net/Response",
            "<TRESU",
            "LT;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/robotoworks/mechanoid/net/ServiceException;
        }
    .end annotation

    .prologue
    .line 168
    .local p1, "request":Lcom/robotoworks/mechanoid/net/ServiceRequest;, "TREQUEST;"
    .local p2, "resultParser":Lcom/robotoworks/mechanoid/net/Parser;, "Lcom/robotoworks/mechanoid/net/Parser<TRESULT;>;"
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/robotoworks/mechanoid/net/ServiceClient;->createUrl(Lcom/robotoworks/mechanoid/net/ServiceRequest;)Ljava/net/URL;

    move-result-object v4

    .line 170
    .local v4, "url":Ljava/net/URL;
    invoke-virtual {p0, v4, p1, p2}, Lcom/robotoworks/mechanoid/net/ServiceClient;->createMockedResponse(Ljava/net/URL;Lcom/robotoworks/mechanoid/net/ServiceRequest;Lcom/robotoworks/mechanoid/net/Parser;)Lcom/robotoworks/mechanoid/net/Response;

    move-result-object v2

    .line 171
    .local v2, "mockedResponse":Lcom/robotoworks/mechanoid/net/Response;, "Lcom/robotoworks/mechanoid/net/Response<TRESULT;>;"
    if-eqz v2, :cond_1

    .line 173
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/net/ServiceClient;->isDebug()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 174
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/net/ServiceClient;->getLogTag()Ljava/lang/String;

    move-result-object v5

    const-string v6, "DELETE Mocked Response"

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 207
    .end local v2    # "mockedResponse":Lcom/robotoworks/mechanoid/net/Response;, "Lcom/robotoworks/mechanoid/net/Response<TRESULT;>;"
    :cond_0
    :goto_0
    return-object v2

    .line 180
    .restart local v2    # "mockedResponse":Lcom/robotoworks/mechanoid/net/Response;, "Lcom/robotoworks/mechanoid/net/Response<TRESULT;>;"
    :cond_1
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/net/ServiceClient;->isDebug()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 181
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/net/ServiceClient;->getLogTag()Ljava/lang/String;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "DELETE "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v4}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 184
    :cond_2
    invoke-virtual {p0, v4}, Lcom/robotoworks/mechanoid/net/ServiceClient;->openConnection(Ljava/net/URL;)Ljava/net/HttpURLConnection;

    move-result-object v0

    .line 186
    .local v0, "conn":Ljava/net/HttpURLConnection;
    invoke-virtual {p0, p1, v0}, Lcom/robotoworks/mechanoid/net/ServiceClient;->applyRequestTimeouts(Lcom/robotoworks/mechanoid/net/ServiceRequest;Ljava/net/HttpURLConnection;)V

    .line 188
    const-string v5, "DELETE"

    invoke-virtual {v0, v5}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 190
    invoke-virtual {p0, p1, v0}, Lcom/robotoworks/mechanoid/net/ServiceClient;->applyRequestProperties(Lcom/robotoworks/mechanoid/net/ServiceRequest;Ljava/net/HttpURLConnection;)V

    .line 192
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/net/ServiceClient;->isDebug()Z

    move-result v5

    if-eqz v5, :cond_3

    .line 193
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/net/ServiceClient;->getLogTag()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getRequestProperties()Ljava/util/Map;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/robotoworks/mechanoid/net/NetLogHelper;->logProperties(Ljava/lang/String;Ljava/util/Map;)V

    .line 197
    :cond_3
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->connect()V

    .line 199
    new-instance v3, Lcom/robotoworks/mechanoid/net/HttpUrlConnectionResponse;

    invoke-direct {v3, v0, p2}, Lcom/robotoworks/mechanoid/net/HttpUrlConnectionResponse;-><init>(Ljava/net/HttpURLConnection;Lcom/robotoworks/mechanoid/net/Parser;)V

    .line 201
    .local v3, "response":Lcom/robotoworks/mechanoid/net/Response;, "Lcom/robotoworks/mechanoid/net/Response<TRESULT;>;"
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/net/ServiceClient;->isDebug()Z

    move-result v5

    if-eqz v5, :cond_4

    .line 202
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/net/ServiceClient;->getLogTag()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v3}, Lcom/robotoworks/mechanoid/net/Response;->getHeaders()Ljava/util/Map;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/robotoworks/mechanoid/net/NetLogHelper;->logProperties(Ljava/lang/String;Ljava/util/Map;)V

    .line 204
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/net/ServiceClient;->getLogTag()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v3}, Lcom/robotoworks/mechanoid/net/Response;->readAsText()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_4
    move-object v2, v3

    .line 207
    goto :goto_0

    .line 209
    .end local v0    # "conn":Ljava/net/HttpURLConnection;
    .end local v2    # "mockedResponse":Lcom/robotoworks/mechanoid/net/Response;, "Lcom/robotoworks/mechanoid/net/Response<TRESULT;>;"
    .end local v3    # "response":Lcom/robotoworks/mechanoid/net/Response;, "Lcom/robotoworks/mechanoid/net/Response<TRESULT;>;"
    .end local v4    # "url":Ljava/net/URL;
    :catch_0
    move-exception v1

    .line 210
    .local v1, "e":Ljava/lang/Exception;
    new-instance v5, Lcom/robotoworks/mechanoid/net/ServiceException;

    invoke-direct {v5, v1}, Lcom/robotoworks/mechanoid/net/ServiceException;-><init>(Ljava/lang/Throwable;)V

    throw v5
.end method

.method protected get(Lcom/robotoworks/mechanoid/net/ServiceRequest;Lcom/robotoworks/mechanoid/net/Parser;)Lcom/robotoworks/mechanoid/net/Response;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<REQUEST:",
            "Lcom/robotoworks/mechanoid/net/ServiceRequest;",
            "RESU",
            "LT:Lcom/robotoworks/mechanoid/net/ServiceResult;",
            ">(TREQUEST;",
            "Lcom/robotoworks/mechanoid/net/Parser",
            "<TRESU",
            "LT;",
            ">;)",
            "Lcom/robotoworks/mechanoid/net/Response",
            "<TRESU",
            "LT;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/robotoworks/mechanoid/net/ServiceException;
        }
    .end annotation

    .prologue
    .line 117
    .local p1, "request":Lcom/robotoworks/mechanoid/net/ServiceRequest;, "TREQUEST;"
    .local p2, "resultParser":Lcom/robotoworks/mechanoid/net/Parser;, "Lcom/robotoworks/mechanoid/net/Parser<TRESULT;>;"
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/robotoworks/mechanoid/net/ServiceClient;->createUrl(Lcom/robotoworks/mechanoid/net/ServiceRequest;)Ljava/net/URL;

    move-result-object v4

    .line 119
    .local v4, "url":Ljava/net/URL;
    invoke-virtual {p0, v4, p1, p2}, Lcom/robotoworks/mechanoid/net/ServiceClient;->createMockedResponse(Ljava/net/URL;Lcom/robotoworks/mechanoid/net/ServiceRequest;Lcom/robotoworks/mechanoid/net/Parser;)Lcom/robotoworks/mechanoid/net/Response;

    move-result-object v2

    .line 120
    .local v2, "mockedResponse":Lcom/robotoworks/mechanoid/net/Response;, "Lcom/robotoworks/mechanoid/net/Response<TRESULT;>;"
    if-eqz v2, :cond_1

    .line 122
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/net/ServiceClient;->isDebug()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 123
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/net/ServiceClient;->getLogTag()Ljava/lang/String;

    move-result-object v5

    const-string v6, "GET Mocked Response"

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 158
    .end local v2    # "mockedResponse":Lcom/robotoworks/mechanoid/net/Response;, "Lcom/robotoworks/mechanoid/net/Response<TRESULT;>;"
    :cond_0
    :goto_0
    return-object v2

    .line 129
    .restart local v2    # "mockedResponse":Lcom/robotoworks/mechanoid/net/Response;, "Lcom/robotoworks/mechanoid/net/Response<TRESULT;>;"
    :cond_1
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/net/ServiceClient;->isDebug()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 130
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/net/ServiceClient;->getLogTag()Ljava/lang/String;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "GET "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v4}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 133
    :cond_2
    invoke-virtual {p0, v4}, Lcom/robotoworks/mechanoid/net/ServiceClient;->openConnection(Ljava/net/URL;)Ljava/net/HttpURLConnection;

    move-result-object v0

    .line 135
    .local v0, "conn":Ljava/net/HttpURLConnection;
    invoke-virtual {p0, p1, v0}, Lcom/robotoworks/mechanoid/net/ServiceClient;->applyRequestTimeouts(Lcom/robotoworks/mechanoid/net/ServiceRequest;Ljava/net/HttpURLConnection;)V

    .line 137
    const-string v5, "GET"

    invoke-virtual {v0, v5}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 139
    const-string v5, "Accept"

    const-string v6, "application/json, text/json"

    invoke-virtual {v0, v5, v6}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 141
    invoke-virtual {p0, p1, v0}, Lcom/robotoworks/mechanoid/net/ServiceClient;->applyRequestProperties(Lcom/robotoworks/mechanoid/net/ServiceRequest;Ljava/net/HttpURLConnection;)V

    .line 143
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/net/ServiceClient;->isDebug()Z

    move-result v5

    if-eqz v5, :cond_3

    .line 144
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/net/ServiceClient;->getLogTag()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getRequestProperties()Ljava/util/Map;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/robotoworks/mechanoid/net/NetLogHelper;->logProperties(Ljava/lang/String;Ljava/util/Map;)V

    .line 148
    :cond_3
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->connect()V

    .line 150
    new-instance v3, Lcom/robotoworks/mechanoid/net/HttpUrlConnectionResponse;

    invoke-direct {v3, v0, p2}, Lcom/robotoworks/mechanoid/net/HttpUrlConnectionResponse;-><init>(Ljava/net/HttpURLConnection;Lcom/robotoworks/mechanoid/net/Parser;)V

    .line 152
    .local v3, "response":Lcom/robotoworks/mechanoid/net/Response;, "Lcom/robotoworks/mechanoid/net/Response<TRESULT;>;"
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/net/ServiceClient;->isDebug()Z

    move-result v5

    if-eqz v5, :cond_4

    .line 153
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/net/ServiceClient;->getLogTag()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v3}, Lcom/robotoworks/mechanoid/net/Response;->getHeaders()Ljava/util/Map;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/robotoworks/mechanoid/net/NetLogHelper;->logProperties(Ljava/lang/String;Ljava/util/Map;)V

    .line 155
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/net/ServiceClient;->getLogTag()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v3}, Lcom/robotoworks/mechanoid/net/Response;->readAsText()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_4
    move-object v2, v3

    .line 158
    goto :goto_0

    .line 159
    .end local v0    # "conn":Ljava/net/HttpURLConnection;
    .end local v2    # "mockedResponse":Lcom/robotoworks/mechanoid/net/Response;, "Lcom/robotoworks/mechanoid/net/Response<TRESULT;>;"
    .end local v3    # "response":Lcom/robotoworks/mechanoid/net/Response;, "Lcom/robotoworks/mechanoid/net/Response<TRESULT;>;"
    .end local v4    # "url":Ljava/net/URL;
    :catch_0
    move-exception v1

    .line 160
    .local v1, "e":Ljava/lang/Exception;
    new-instance v5, Lcom/robotoworks/mechanoid/net/ServiceException;

    invoke-direct {v5, v1}, Lcom/robotoworks/mechanoid/net/ServiceException;-><init>(Ljava/lang/Throwable;)V

    throw v5
.end method

.method protected getBaseUrl()Ljava/lang/String;
    .locals 1

    .prologue
    .line 49
    iget-object v0, p0, Lcom/robotoworks/mechanoid/net/ServiceClient;->mBaseUrl:Ljava/lang/String;

    return-object v0
.end method

.method protected getHeaders()Ljava/util/LinkedHashMap;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/LinkedHashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 57
    iget-object v0, p0, Lcom/robotoworks/mechanoid/net/ServiceClient;->mHeaders:Ljava/util/LinkedHashMap;

    return-object v0
.end method

.method protected getLogTag()Ljava/lang/String;
    .locals 1

    .prologue
    .line 61
    sget-object v0, Lcom/robotoworks/mechanoid/net/ServiceClient;->DEFAULT_LOG_TAG:Ljava/lang/String;

    return-object v0
.end method

.method public getReaderProvider()Lcom/robotoworks/mechanoid/net/JsonEntityReaderProvider;
    .locals 1

    .prologue
    .line 70
    iget-object v0, p0, Lcom/robotoworks/mechanoid/net/ServiceClient;->mReaderProvider:Lcom/robotoworks/mechanoid/net/JsonEntityReaderProvider;

    return-object v0
.end method

.method public getWriterProvider()Lcom/robotoworks/mechanoid/net/JsonEntityWriterProvider;
    .locals 1

    .prologue
    .line 79
    iget-object v0, p0, Lcom/robotoworks/mechanoid/net/ServiceClient;->mWriterProvider:Lcom/robotoworks/mechanoid/net/JsonEntityWriterProvider;

    return-object v0
.end method

.method protected isDebug()Z
    .locals 1

    .prologue
    .line 53
    iget-boolean v0, p0, Lcom/robotoworks/mechanoid/net/ServiceClient;->mDebug:Z

    return v0
.end method

.method protected openConnection(Ljava/net/URL;)Ljava/net/HttpURLConnection;
    .locals 1
    .param p1, "url"    # Ljava/net/URL;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 284
    invoke-virtual {p1}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    check-cast v0, Ljava/net/HttpURLConnection;

    return-object v0
.end method

.method protected post(Lcom/robotoworks/mechanoid/net/ServiceRequest;Lcom/robotoworks/mechanoid/net/Parser;)Lcom/robotoworks/mechanoid/net/Response;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<REQUEST:",
            "Lcom/robotoworks/mechanoid/net/ServiceRequest;",
            "RESU",
            "LT:Lcom/robotoworks/mechanoid/net/ServiceResult;",
            ">(TREQUEST;",
            "Lcom/robotoworks/mechanoid/net/Parser",
            "<TRESU",
            "LT;",
            ">;)",
            "Lcom/robotoworks/mechanoid/net/Response",
            "<TRESU",
            "LT;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/robotoworks/mechanoid/net/ServiceException;
        }
    .end annotation

    .prologue
    .line 290
    .local p1, "request":Lcom/robotoworks/mechanoid/net/ServiceRequest;, "TREQUEST;"
    .local p2, "resultParser":Lcom/robotoworks/mechanoid/net/Parser;, "Lcom/robotoworks/mechanoid/net/Parser<TRESULT;>;"
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/robotoworks/mechanoid/net/ServiceClient;->postUnlessPut(Lcom/robotoworks/mechanoid/net/ServiceRequest;Lcom/robotoworks/mechanoid/net/Parser;Z)Lcom/robotoworks/mechanoid/net/Response;

    move-result-object v0

    return-object v0
.end method

.method protected postUnlessPut(Lcom/robotoworks/mechanoid/net/ServiceRequest;Lcom/robotoworks/mechanoid/net/Parser;Z)Lcom/robotoworks/mechanoid/net/Response;
    .locals 13
    .param p3, "doPut"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<REQUEST:",
            "Lcom/robotoworks/mechanoid/net/ServiceRequest;",
            "RESU",
            "LT:Lcom/robotoworks/mechanoid/net/ServiceResult;",
            ">(TREQUEST;",
            "Lcom/robotoworks/mechanoid/net/Parser",
            "<TRESU",
            "LT;",
            ">;Z)",
            "Lcom/robotoworks/mechanoid/net/Response",
            "<TRESU",
            "LT;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/robotoworks/mechanoid/net/ServiceException;
        }
    .end annotation

    .prologue
    .line 218
    .local p1, "request":Lcom/robotoworks/mechanoid/net/ServiceRequest;, "TREQUEST;"
    .local p2, "resultParser":Lcom/robotoworks/mechanoid/net/Parser;, "Lcom/robotoworks/mechanoid/net/Parser<TRESULT;>;"
    if-eqz p3, :cond_1

    const-string v5, "PUT"

    .line 221
    .local v5, "method":Ljava/lang/String;
    :goto_0
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/robotoworks/mechanoid/net/ServiceClient;->createUrl(Lcom/robotoworks/mechanoid/net/ServiceRequest;)Ljava/net/URL;

    move-result-object v8

    .line 223
    .local v8, "url":Ljava/net/URL;
    invoke-virtual {p0, v8, p1, p2}, Lcom/robotoworks/mechanoid/net/ServiceClient;->createMockedResponse(Ljava/net/URL;Lcom/robotoworks/mechanoid/net/ServiceRequest;Lcom/robotoworks/mechanoid/net/Parser;)Lcom/robotoworks/mechanoid/net/Response;

    move-result-object v6

    .line 224
    .local v6, "mockedResponse":Lcom/robotoworks/mechanoid/net/Response;, "Lcom/robotoworks/mechanoid/net/Response<TRESULT;>;"
    if-eqz v6, :cond_2

    .line 226
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/net/ServiceClient;->isDebug()Z

    move-result v9

    if-eqz v9, :cond_0

    .line 227
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/net/ServiceClient;->getLogTag()Ljava/lang/String;

    move-result-object v9

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " Mocked Response"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 276
    .end local v6    # "mockedResponse":Lcom/robotoworks/mechanoid/net/Response;, "Lcom/robotoworks/mechanoid/net/Response<TRESULT;>;"
    :cond_0
    :goto_1
    return-object v6

    .line 218
    .end local v5    # "method":Ljava/lang/String;
    .end local v8    # "url":Ljava/net/URL;
    :cond_1
    const-string v5, "POST"

    goto :goto_0

    .line 233
    .restart local v5    # "method":Ljava/lang/String;
    .restart local v6    # "mockedResponse":Lcom/robotoworks/mechanoid/net/Response;, "Lcom/robotoworks/mechanoid/net/Response<TRESULT;>;"
    .restart local v8    # "url":Ljava/net/URL;
    :cond_2
    :try_start_1
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/net/ServiceClient;->isDebug()Z

    move-result v9

    if-eqz v9, :cond_3

    .line 234
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/net/ServiceClient;->getLogTag()Ljava/lang/String;

    move-result-object v9

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v8}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 237
    :cond_3
    invoke-virtual {p0, v8}, Lcom/robotoworks/mechanoid/net/ServiceClient;->openConnection(Ljava/net/URL;)Ljava/net/HttpURLConnection;

    move-result-object v1

    .line 239
    .local v1, "conn":Ljava/net/HttpURLConnection;
    invoke-virtual {p0, p1, v1}, Lcom/robotoworks/mechanoid/net/ServiceClient;->applyRequestTimeouts(Lcom/robotoworks/mechanoid/net/ServiceRequest;Ljava/net/HttpURLConnection;)V

    .line 241
    const/4 v9, 0x1

    invoke-virtual {v1, v9}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 242
    invoke-virtual {v1, v5}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 244
    const-string v9, "Content-Type"

    const-string v10, "application/json, text/json"

    invoke-virtual {v1, v9, v10}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 246
    invoke-virtual {p0, p1, v1}, Lcom/robotoworks/mechanoid/net/ServiceClient;->applyRequestProperties(Lcom/robotoworks/mechanoid/net/ServiceRequest;Ljava/net/HttpURLConnection;)V

    .line 248
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/net/ServiceClient;->isDebug()Z

    move-result v9

    if-eqz v9, :cond_4

    .line 249
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/net/ServiceClient;->getLogTag()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getRequestProperties()Ljava/util/Map;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/robotoworks/mechanoid/net/NetLogHelper;->logProperties(Ljava/lang/String;Ljava/util/Map;)V

    .line 253
    :cond_4
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->connect()V

    .line 255
    instance-of v9, p1, Lcom/robotoworks/mechanoid/net/EntityEnclosedServiceRequest;

    if-eqz v9, :cond_6

    .line 256
    move-object v0, p1

    check-cast v0, Lcom/robotoworks/mechanoid/net/EntityEnclosedServiceRequest;

    move-object v4, v0

    .line 258
    .local v4, "entityEnclosedRequest":Lcom/robotoworks/mechanoid/net/EntityEnclosedServiceRequest;
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/net/ServiceClient;->isDebug()Z

    move-result v9

    if-eqz v9, :cond_5

    .line 259
    new-instance v2, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v2}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 260
    .local v2, "debugOutStream":Ljava/io/ByteArrayOutputStream;
    iget-object v9, p0, Lcom/robotoworks/mechanoid/net/ServiceClient;->mWriterProvider:Lcom/robotoworks/mechanoid/net/JsonEntityWriterProvider;

    invoke-virtual {v4, v9, v2}, Lcom/robotoworks/mechanoid/net/EntityEnclosedServiceRequest;->writeBody(Lcom/robotoworks/mechanoid/net/JsonEntityWriterProvider;Ljava/io/OutputStream;)V

    .line 262
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/net/ServiceClient;->getLogTag()Ljava/lang/String;

    move-result-object v9

    new-instance v10, Ljava/lang/String;

    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v11

    const-string v12, "UTF-8"

    invoke-direct {v10, v11, v12}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    invoke-static {v9, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 265
    .end local v2    # "debugOutStream":Ljava/io/ByteArrayOutputStream;
    :cond_5
    iget-object v9, p0, Lcom/robotoworks/mechanoid/net/ServiceClient;->mWriterProvider:Lcom/robotoworks/mechanoid/net/JsonEntityWriterProvider;

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v10

    invoke-virtual {v4, v9, v10}, Lcom/robotoworks/mechanoid/net/EntityEnclosedServiceRequest;->writeBody(Lcom/robotoworks/mechanoid/net/JsonEntityWriterProvider;Ljava/io/OutputStream;)V

    .line 268
    .end local v4    # "entityEnclosedRequest":Lcom/robotoworks/mechanoid/net/EntityEnclosedServiceRequest;
    :cond_6
    new-instance v7, Lcom/robotoworks/mechanoid/net/HttpUrlConnectionResponse;

    invoke-direct {v7, v1, p2}, Lcom/robotoworks/mechanoid/net/HttpUrlConnectionResponse;-><init>(Ljava/net/HttpURLConnection;Lcom/robotoworks/mechanoid/net/Parser;)V

    .line 270
    .local v7, "response":Lcom/robotoworks/mechanoid/net/Response;, "Lcom/robotoworks/mechanoid/net/Response<TRESULT;>;"
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/net/ServiceClient;->isDebug()Z

    move-result v9

    if-eqz v9, :cond_7

    .line 271
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/net/ServiceClient;->getLogTag()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v7}, Lcom/robotoworks/mechanoid/net/Response;->getHeaders()Ljava/util/Map;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/robotoworks/mechanoid/net/NetLogHelper;->logProperties(Ljava/lang/String;Ljava/util/Map;)V

    .line 273
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/net/ServiceClient;->getLogTag()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v7}, Lcom/robotoworks/mechanoid/net/Response;->readAsText()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    :cond_7
    move-object v6, v7

    .line 276
    goto/16 :goto_1

    .line 278
    .end local v1    # "conn":Ljava/net/HttpURLConnection;
    .end local v6    # "mockedResponse":Lcom/robotoworks/mechanoid/net/Response;, "Lcom/robotoworks/mechanoid/net/Response<TRESULT;>;"
    .end local v7    # "response":Lcom/robotoworks/mechanoid/net/Response;, "Lcom/robotoworks/mechanoid/net/Response<TRESULT;>;"
    .end local v8    # "url":Ljava/net/URL;
    :catch_0
    move-exception v3

    .line 279
    .local v3, "e":Ljava/lang/Exception;
    new-instance v9, Lcom/robotoworks/mechanoid/net/ServiceException;

    invoke-direct {v9, v3}, Lcom/robotoworks/mechanoid/net/ServiceException;-><init>(Ljava/lang/Throwable;)V

    throw v9
.end method

.method protected put(Lcom/robotoworks/mechanoid/net/ServiceRequest;Lcom/robotoworks/mechanoid/net/Parser;)Lcom/robotoworks/mechanoid/net/Response;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<REQUEST:",
            "Lcom/robotoworks/mechanoid/net/ServiceRequest;",
            "RESU",
            "LT:Lcom/robotoworks/mechanoid/net/ServiceResult;",
            ">(TREQUEST;",
            "Lcom/robotoworks/mechanoid/net/Parser",
            "<TRESU",
            "LT;",
            ">;)",
            "Lcom/robotoworks/mechanoid/net/Response",
            "<TRESU",
            "LT;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/robotoworks/mechanoid/net/ServiceException;
        }
    .end annotation

    .prologue
    .line 296
    .local p1, "request":Lcom/robotoworks/mechanoid/net/ServiceRequest;, "TREQUEST;"
    .local p2, "resultParser":Lcom/robotoworks/mechanoid/net/Parser;, "Lcom/robotoworks/mechanoid/net/Parser<TRESULT;>;"
    const/4 v0, 0x1

    invoke-virtual {p0, p1, p2, v0}, Lcom/robotoworks/mechanoid/net/ServiceClient;->postUnlessPut(Lcom/robotoworks/mechanoid/net/ServiceRequest;Lcom/robotoworks/mechanoid/net/Parser;Z)Lcom/robotoworks/mechanoid/net/Response;

    move-result-object v0

    return-object v0
.end method

.method public setHeader(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "field"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 89
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/net/ServiceClient;->getHeaders()Ljava/util/LinkedHashMap;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 90
    return-void
.end method
