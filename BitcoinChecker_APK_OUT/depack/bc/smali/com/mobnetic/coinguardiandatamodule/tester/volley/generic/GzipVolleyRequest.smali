.class public abstract Lcom/mobnetic/coinguardiandatamodule/tester/volley/generic/GzipVolleyRequest;
.super Lcom/android/volley/Request;
.source "GzipVolleyRequest.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/android/volley/Request",
        "<TT;>;"
    }
.end annotation


# static fields
.field private static final MAX_REDIRECTION_COUNT:I = 0x3


# instance fields
.field private final errorListener:Lcom/android/volley/Response$ErrorListener;

.field private final headers:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final listener:Lcom/android/volley/Response$Listener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/volley/Response$Listener",
            "<TT;>;"
        }
    .end annotation
.end field

.field private networkResponse:Lcom/android/volley/NetworkResponse;

.field private redirectionCount:I

.field private redirectionUrl:Ljava/lang/String;

.field private requestHeaders:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private requestQueue:Lcom/android/volley/RequestQueue;

.field private responseString:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;)V
    .locals 3
    .param p1, "url"    # Ljava/lang/String;
    .param p3, "errorListener"    # Lcom/android/volley/Response$ErrorListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/android/volley/Response$Listener",
            "<TT;>;",
            "Lcom/android/volley/Response$ErrorListener;",
            ")V"
        }
    .end annotation

    .prologue
    .line 42
    .local p0, "this":Lcom/mobnetic/coinguardiandatamodule/tester/volley/generic/GzipVolleyRequest;, "Lcom/mobnetic/coinguardiandatamodule/tester/volley/generic/GzipVolleyRequest<TT;>;"
    .local p2, "listener":Lcom/android/volley/Response$Listener;, "Lcom/android/volley/Response$Listener<TT;>;"
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1, p3}, Lcom/android/volley/Request;-><init>(ILjava/lang/String;Lcom/android/volley/Response$ErrorListener;)V

    .line 32
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mobnetic/coinguardiandatamodule/tester/volley/generic/GzipVolleyRequest;->redirectionUrl:Ljava/lang/String;

    .line 44
    iput-object p2, p0, Lcom/mobnetic/coinguardiandatamodule/tester/volley/generic/GzipVolleyRequest;->listener:Lcom/android/volley/Response$Listener;

    .line 45
    iput-object p3, p0, Lcom/mobnetic/coinguardiandatamodule/tester/volley/generic/GzipVolleyRequest;->errorListener:Lcom/android/volley/Response$ErrorListener;

    .line 47
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/mobnetic/coinguardiandatamodule/tester/volley/generic/GzipVolleyRequest;->headers:Ljava/util/Map;

    .line 48
    iget-object v0, p0, Lcom/mobnetic/coinguardiandatamodule/tester/volley/generic/GzipVolleyRequest;->headers:Ljava/util/Map;

    const-string v1, "Accept-Encoding"

    const-string v2, "gzip"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    iget-object v0, p0, Lcom/mobnetic/coinguardiandatamodule/tester/volley/generic/GzipVolleyRequest;->headers:Ljava/util/Map;

    const-string v1, "User-Agent"

    const-string v2, "Bitcoin Checker (gzip)"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    return-void
.end method

.method private decodeGZip([B)Ljava/lang/String;
    .locals 13
    .param p1, "data"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 131
    .local p0, "this":Lcom/mobnetic/coinguardiandatamodule/tester/volley/generic/GzipVolleyRequest;, "Lcom/mobnetic/coinguardiandatamodule/tester/volley/generic/GzipVolleyRequest<TT;>;"
    const-string v10, ""

    .line 133
    .local v10, "responseString":Ljava/lang/String;
    const/4 v0, 0x0

    .line 134
    .local v0, "bais":Ljava/io/ByteArrayInputStream;
    const/4 v3, 0x0

    .line 135
    .local v3, "gzis":Ljava/util/zip/GZIPInputStream;
    const/4 v8, 0x0

    .line 136
    .local v8, "reader":Ljava/io/InputStreamReader;
    const/4 v5, 0x0

    .line 139
    .local v5, "in":Ljava/io/BufferedReader;
    :try_start_0
    new-instance v1, Ljava/io/ByteArrayInputStream;

    invoke-direct {v1, p1}, Ljava/io/ByteArrayInputStream;-><init>([B)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 140
    .end local v0    # "bais":Ljava/io/ByteArrayInputStream;
    .local v1, "bais":Ljava/io/ByteArrayInputStream;
    :try_start_1
    new-instance v4, Ljava/util/zip/GZIPInputStream;

    invoke-direct {v4, v1}, Ljava/util/zip/GZIPInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 141
    .end local v3    # "gzis":Ljava/util/zip/GZIPInputStream;
    .local v4, "gzis":Ljava/util/zip/GZIPInputStream;
    :try_start_2
    new-instance v9, Ljava/io/InputStreamReader;

    invoke-direct {v9, v4}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_3
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 142
    .end local v8    # "reader":Ljava/io/InputStreamReader;
    .local v9, "reader":Ljava/io/InputStreamReader;
    :try_start_3
    new-instance v6, Ljava/io/BufferedReader;

    invoke-direct {v6, v9}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_4
    .catchall {:try_start_3 .. :try_end_3} :catchall_3

    .line 145
    .end local v5    # "in":Ljava/io/BufferedReader;
    .local v6, "in":Ljava/io/BufferedReader;
    :goto_0
    :try_start_4
    invoke-virtual {v6}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v7

    .local v7, "readed":Ljava/lang/String;
    if-eqz v7, :cond_0

    .line 146
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v11, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "\n"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_5
    .catchall {:try_start_4 .. :try_end_4} :catchall_4

    move-result-object v10

    goto :goto_0

    .line 152
    :cond_0
    if-eqz v1, :cond_1

    .line 153
    :try_start_5
    invoke-virtual {v1}, Ljava/io/ByteArrayInputStream;->close()V

    .line 154
    :cond_1
    if-eqz v4, :cond_2

    .line 155
    invoke-virtual {v4}, Ljava/util/zip/GZIPInputStream;->close()V

    .line 156
    :cond_2
    if-eqz v9, :cond_3

    .line 157
    invoke-virtual {v9}, Ljava/io/InputStreamReader;->close()V

    .line 158
    :cond_3
    if-eqz v6, :cond_4

    .line 159
    invoke-virtual {v6}, Ljava/io/BufferedReader;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_6

    .line 163
    :cond_4
    :goto_1
    return-object v10

    .line 148
    .end local v1    # "bais":Ljava/io/ByteArrayInputStream;
    .end local v4    # "gzis":Ljava/util/zip/GZIPInputStream;
    .end local v6    # "in":Ljava/io/BufferedReader;
    .end local v7    # "readed":Ljava/lang/String;
    .end local v9    # "reader":Ljava/io/InputStreamReader;
    .restart local v0    # "bais":Ljava/io/ByteArrayInputStream;
    .restart local v3    # "gzis":Ljava/util/zip/GZIPInputStream;
    .restart local v5    # "in":Ljava/io/BufferedReader;
    .restart local v8    # "reader":Ljava/io/InputStreamReader;
    :catch_0
    move-exception v2

    .line 149
    .local v2, "e":Ljava/lang/Exception;
    :goto_2
    :try_start_6
    throw v2
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 151
    .end local v2    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v11

    .line 152
    :goto_3
    if-eqz v0, :cond_5

    .line 153
    :try_start_7
    invoke-virtual {v0}, Ljava/io/ByteArrayInputStream;->close()V

    .line 154
    :cond_5
    if-eqz v3, :cond_6

    .line 155
    invoke-virtual {v3}, Ljava/util/zip/GZIPInputStream;->close()V

    .line 156
    :cond_6
    if-eqz v8, :cond_7

    .line 157
    invoke-virtual {v8}, Ljava/io/InputStreamReader;->close()V

    .line 158
    :cond_7
    if-eqz v5, :cond_8

    .line 159
    invoke-virtual {v5}, Ljava/io/BufferedReader;->close()V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_1

    .line 160
    :cond_8
    :goto_4
    throw v11

    :catch_1
    move-exception v12

    goto :goto_4

    .line 151
    .end local v0    # "bais":Ljava/io/ByteArrayInputStream;
    .restart local v1    # "bais":Ljava/io/ByteArrayInputStream;
    :catchall_1
    move-exception v11

    move-object v0, v1

    .end local v1    # "bais":Ljava/io/ByteArrayInputStream;
    .restart local v0    # "bais":Ljava/io/ByteArrayInputStream;
    goto :goto_3

    .end local v0    # "bais":Ljava/io/ByteArrayInputStream;
    .end local v3    # "gzis":Ljava/util/zip/GZIPInputStream;
    .restart local v1    # "bais":Ljava/io/ByteArrayInputStream;
    .restart local v4    # "gzis":Ljava/util/zip/GZIPInputStream;
    :catchall_2
    move-exception v11

    move-object v3, v4

    .end local v4    # "gzis":Ljava/util/zip/GZIPInputStream;
    .restart local v3    # "gzis":Ljava/util/zip/GZIPInputStream;
    move-object v0, v1

    .end local v1    # "bais":Ljava/io/ByteArrayInputStream;
    .restart local v0    # "bais":Ljava/io/ByteArrayInputStream;
    goto :goto_3

    .end local v0    # "bais":Ljava/io/ByteArrayInputStream;
    .end local v3    # "gzis":Ljava/util/zip/GZIPInputStream;
    .end local v8    # "reader":Ljava/io/InputStreamReader;
    .restart local v1    # "bais":Ljava/io/ByteArrayInputStream;
    .restart local v4    # "gzis":Ljava/util/zip/GZIPInputStream;
    .restart local v9    # "reader":Ljava/io/InputStreamReader;
    :catchall_3
    move-exception v11

    move-object v8, v9

    .end local v9    # "reader":Ljava/io/InputStreamReader;
    .restart local v8    # "reader":Ljava/io/InputStreamReader;
    move-object v3, v4

    .end local v4    # "gzis":Ljava/util/zip/GZIPInputStream;
    .restart local v3    # "gzis":Ljava/util/zip/GZIPInputStream;
    move-object v0, v1

    .end local v1    # "bais":Ljava/io/ByteArrayInputStream;
    .restart local v0    # "bais":Ljava/io/ByteArrayInputStream;
    goto :goto_3

    .end local v0    # "bais":Ljava/io/ByteArrayInputStream;
    .end local v3    # "gzis":Ljava/util/zip/GZIPInputStream;
    .end local v5    # "in":Ljava/io/BufferedReader;
    .end local v8    # "reader":Ljava/io/InputStreamReader;
    .restart local v1    # "bais":Ljava/io/ByteArrayInputStream;
    .restart local v4    # "gzis":Ljava/util/zip/GZIPInputStream;
    .restart local v6    # "in":Ljava/io/BufferedReader;
    .restart local v9    # "reader":Ljava/io/InputStreamReader;
    :catchall_4
    move-exception v11

    move-object v5, v6

    .end local v6    # "in":Ljava/io/BufferedReader;
    .restart local v5    # "in":Ljava/io/BufferedReader;
    move-object v8, v9

    .end local v9    # "reader":Ljava/io/InputStreamReader;
    .restart local v8    # "reader":Ljava/io/InputStreamReader;
    move-object v3, v4

    .end local v4    # "gzis":Ljava/util/zip/GZIPInputStream;
    .restart local v3    # "gzis":Ljava/util/zip/GZIPInputStream;
    move-object v0, v1

    .end local v1    # "bais":Ljava/io/ByteArrayInputStream;
    .restart local v0    # "bais":Ljava/io/ByteArrayInputStream;
    goto :goto_3

    .line 148
    .end local v0    # "bais":Ljava/io/ByteArrayInputStream;
    .restart local v1    # "bais":Ljava/io/ByteArrayInputStream;
    :catch_2
    move-exception v2

    move-object v0, v1

    .end local v1    # "bais":Ljava/io/ByteArrayInputStream;
    .restart local v0    # "bais":Ljava/io/ByteArrayInputStream;
    goto :goto_2

    .end local v0    # "bais":Ljava/io/ByteArrayInputStream;
    .end local v3    # "gzis":Ljava/util/zip/GZIPInputStream;
    .restart local v1    # "bais":Ljava/io/ByteArrayInputStream;
    .restart local v4    # "gzis":Ljava/util/zip/GZIPInputStream;
    :catch_3
    move-exception v2

    move-object v3, v4

    .end local v4    # "gzis":Ljava/util/zip/GZIPInputStream;
    .restart local v3    # "gzis":Ljava/util/zip/GZIPInputStream;
    move-object v0, v1

    .end local v1    # "bais":Ljava/io/ByteArrayInputStream;
    .restart local v0    # "bais":Ljava/io/ByteArrayInputStream;
    goto :goto_2

    .end local v0    # "bais":Ljava/io/ByteArrayInputStream;
    .end local v3    # "gzis":Ljava/util/zip/GZIPInputStream;
    .end local v8    # "reader":Ljava/io/InputStreamReader;
    .restart local v1    # "bais":Ljava/io/ByteArrayInputStream;
    .restart local v4    # "gzis":Ljava/util/zip/GZIPInputStream;
    .restart local v9    # "reader":Ljava/io/InputStreamReader;
    :catch_4
    move-exception v2

    move-object v8, v9

    .end local v9    # "reader":Ljava/io/InputStreamReader;
    .restart local v8    # "reader":Ljava/io/InputStreamReader;
    move-object v3, v4

    .end local v4    # "gzis":Ljava/util/zip/GZIPInputStream;
    .restart local v3    # "gzis":Ljava/util/zip/GZIPInputStream;
    move-object v0, v1

    .end local v1    # "bais":Ljava/io/ByteArrayInputStream;
    .restart local v0    # "bais":Ljava/io/ByteArrayInputStream;
    goto :goto_2

    .end local v0    # "bais":Ljava/io/ByteArrayInputStream;
    .end local v3    # "gzis":Ljava/util/zip/GZIPInputStream;
    .end local v5    # "in":Ljava/io/BufferedReader;
    .end local v8    # "reader":Ljava/io/InputStreamReader;
    .restart local v1    # "bais":Ljava/io/ByteArrayInputStream;
    .restart local v4    # "gzis":Ljava/util/zip/GZIPInputStream;
    .restart local v6    # "in":Ljava/io/BufferedReader;
    .restart local v9    # "reader":Ljava/io/InputStreamReader;
    :catch_5
    move-exception v2

    move-object v5, v6

    .end local v6    # "in":Ljava/io/BufferedReader;
    .restart local v5    # "in":Ljava/io/BufferedReader;
    move-object v8, v9

    .end local v9    # "reader":Ljava/io/InputStreamReader;
    .restart local v8    # "reader":Ljava/io/InputStreamReader;
    move-object v3, v4

    .end local v4    # "gzis":Ljava/util/zip/GZIPInputStream;
    .restart local v3    # "gzis":Ljava/util/zip/GZIPInputStream;
    move-object v0, v1

    .end local v1    # "bais":Ljava/io/ByteArrayInputStream;
    .restart local v0    # "bais":Ljava/io/ByteArrayInputStream;
    goto :goto_2

    .line 160
    .end local v0    # "bais":Ljava/io/ByteArrayInputStream;
    .end local v3    # "gzis":Ljava/util/zip/GZIPInputStream;
    .end local v5    # "in":Ljava/io/BufferedReader;
    .end local v8    # "reader":Ljava/io/InputStreamReader;
    .restart local v1    # "bais":Ljava/io/ByteArrayInputStream;
    .restart local v4    # "gzis":Ljava/util/zip/GZIPInputStream;
    .restart local v6    # "in":Ljava/io/BufferedReader;
    .restart local v7    # "readed":Ljava/lang/String;
    .restart local v9    # "reader":Ljava/io/InputStreamReader;
    :catch_6
    move-exception v11

    goto :goto_1
.end method


# virtual methods
.method public deliverError(Lcom/android/volley/VolleyError;)V
    .locals 8
    .param p1, "error"    # Lcom/android/volley/VolleyError;

    .prologue
    .line 77
    .local p0, "this":Lcom/mobnetic/coinguardiandatamodule/tester/volley/generic/GzipVolleyRequest;, "Lcom/mobnetic/coinguardiandatamodule/tester/volley/generic/GzipVolleyRequest<TT;>;"
    if-eqz p1, :cond_1

    iget-object v0, p1, Lcom/android/volley/VolleyError;->networkResponse:Lcom/android/volley/NetworkResponse;

    if-eqz v0, :cond_1

    .line 78
    iget-object v0, p1, Lcom/android/volley/VolleyError;->networkResponse:Lcom/android/volley/NetworkResponse;

    iget v7, v0, Lcom/android/volley/NetworkResponse;->statusCode:I

    .line 79
    .local v7, "statusCode":I
    const/16 v0, 0x12d

    if-eq v7, v0, :cond_0

    const/16 v0, 0x12e

    if-ne v7, v0, :cond_1

    .line 80
    :cond_0
    iget-object v0, p1, Lcom/android/volley/VolleyError;->networkResponse:Lcom/android/volley/NetworkResponse;

    iget-object v0, v0, Lcom/android/volley/NetworkResponse;->headers:Ljava/util/Map;

    const-string v1, "Location"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 81
    .local v6, "location":Ljava/lang/String;
    if-eqz v6, :cond_1

    iget v0, p0, Lcom/mobnetic/coinguardiandatamodule/tester/volley/generic/GzipVolleyRequest;->redirectionCount:I

    const/4 v1, 0x3

    if-ge v0, v1, :cond_1

    .line 82
    iget v0, p0, Lcom/mobnetic/coinguardiandatamodule/tester/volley/generic/GzipVolleyRequest;->redirectionCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/mobnetic/coinguardiandatamodule/tester/volley/generic/GzipVolleyRequest;->redirectionCount:I

    .line 83
    iput-object v6, p0, Lcom/mobnetic/coinguardiandatamodule/tester/volley/generic/GzipVolleyRequest;->redirectionUrl:Ljava/lang/String;

    .line 84
    iget-object v0, p0, Lcom/mobnetic/coinguardiandatamodule/tester/volley/generic/GzipVolleyRequest;->requestQueue:Lcom/android/volley/RequestQueue;

    invoke-virtual {v0, p0}, Lcom/android/volley/RequestQueue;->add(Lcom/android/volley/Request;)Lcom/android/volley/Request;

    .line 93
    .end local v6    # "location":Ljava/lang/String;
    .end local v7    # "statusCode":I
    :goto_0
    return-void

    .line 89
    :cond_1
    iget-object v0, p0, Lcom/mobnetic/coinguardiandatamodule/tester/volley/generic/GzipVolleyRequest;->errorListener:Lcom/android/volley/Response$ErrorListener;

    instance-of v0, v0, Lcom/mobnetic/coinguardiandatamodule/tester/volley/generic/ResponseErrorListener;

    if-eqz v0, :cond_2

    .line 90
    iget-object v0, p0, Lcom/mobnetic/coinguardiandatamodule/tester/volley/generic/GzipVolleyRequest;->errorListener:Lcom/android/volley/Response$ErrorListener;

    check-cast v0, Lcom/mobnetic/coinguardiandatamodule/tester/volley/generic/ResponseErrorListener;

    invoke-virtual {p0}, Lcom/mobnetic/coinguardiandatamodule/tester/volley/generic/GzipVolleyRequest;->getUrl()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/mobnetic/coinguardiandatamodule/tester/volley/generic/GzipVolleyRequest;->requestHeaders:Ljava/util/Map;

    iget-object v3, p0, Lcom/mobnetic/coinguardiandatamodule/tester/volley/generic/GzipVolleyRequest;->networkResponse:Lcom/android/volley/NetworkResponse;

    iget-object v4, p0, Lcom/mobnetic/coinguardiandatamodule/tester/volley/generic/GzipVolleyRequest;->responseString:Ljava/lang/String;

    move-object v5, p1

    invoke-virtual/range {v0 .. v5}, Lcom/mobnetic/coinguardiandatamodule/tester/volley/generic/ResponseErrorListener;->onErrorResponse(Ljava/lang/String;Ljava/util/Map;Lcom/android/volley/NetworkResponse;Ljava/lang/String;Lcom/android/volley/VolleyError;)V

    goto :goto_0

    .line 92
    :cond_2
    invoke-super {p0, p1}, Lcom/android/volley/Request;->deliverError(Lcom/android/volley/VolleyError;)V

    goto :goto_0
.end method

.method protected deliverResponse(Ljava/lang/Object;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 97
    .local p0, "this":Lcom/mobnetic/coinguardiandatamodule/tester/volley/generic/GzipVolleyRequest;, "Lcom/mobnetic/coinguardiandatamodule/tester/volley/generic/GzipVolleyRequest<TT;>;"
    .local p1, "response":Ljava/lang/Object;, "TT;"
    iget-object v0, p0, Lcom/mobnetic/coinguardiandatamodule/tester/volley/generic/GzipVolleyRequest;->listener:Lcom/android/volley/Response$Listener;

    instance-of v0, v0, Lcom/mobnetic/coinguardiandatamodule/tester/volley/generic/ResponseListener;

    if-eqz v0, :cond_0

    .line 98
    iget-object v0, p0, Lcom/mobnetic/coinguardiandatamodule/tester/volley/generic/GzipVolleyRequest;->listener:Lcom/android/volley/Response$Listener;

    check-cast v0, Lcom/mobnetic/coinguardiandatamodule/tester/volley/generic/ResponseListener;

    invoke-virtual {p0}, Lcom/mobnetic/coinguardiandatamodule/tester/volley/generic/GzipVolleyRequest;->getUrl()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/mobnetic/coinguardiandatamodule/tester/volley/generic/GzipVolleyRequest;->requestHeaders:Ljava/util/Map;

    iget-object v3, p0, Lcom/mobnetic/coinguardiandatamodule/tester/volley/generic/GzipVolleyRequest;->networkResponse:Lcom/android/volley/NetworkResponse;

    iget-object v4, p0, Lcom/mobnetic/coinguardiandatamodule/tester/volley/generic/GzipVolleyRequest;->responseString:Ljava/lang/String;

    move-object v5, p1

    invoke-virtual/range {v0 .. v5}, Lcom/mobnetic/coinguardiandatamodule/tester/volley/generic/ResponseListener;->onResponse(Ljava/lang/String;Ljava/util/Map;Lcom/android/volley/NetworkResponse;Ljava/lang/String;Ljava/lang/Object;)V

    .line 101
    :goto_0
    return-void

    .line 100
    :cond_0
    iget-object v0, p0, Lcom/mobnetic/coinguardiandatamodule/tester/volley/generic/GzipVolleyRequest;->listener:Lcom/android/volley/Response$Listener;

    invoke-interface {v0, p1}, Lcom/android/volley/Response$Listener;->onResponse(Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public getHeaders()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/volley/AuthFailureError;
        }
    .end annotation

    .prologue
    .line 65
    .local p0, "this":Lcom/mobnetic/coinguardiandatamodule/tester/volley/generic/GzipVolleyRequest;, "Lcom/mobnetic/coinguardiandatamodule/tester/volley/generic/GzipVolleyRequest<TT;>;"
    iget-object v0, p0, Lcom/mobnetic/coinguardiandatamodule/tester/volley/generic/GzipVolleyRequest;->headers:Ljava/util/Map;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mobnetic/coinguardiandatamodule/tester/volley/generic/GzipVolleyRequest;->headers:Ljava/util/Map;

    :goto_0
    iput-object v0, p0, Lcom/mobnetic/coinguardiandatamodule/tester/volley/generic/GzipVolleyRequest;->requestHeaders:Ljava/util/Map;

    .line 66
    iget-object v0, p0, Lcom/mobnetic/coinguardiandatamodule/tester/volley/generic/GzipVolleyRequest;->requestHeaders:Ljava/util/Map;

    return-object v0

    .line 65
    :cond_0
    invoke-super {p0}, Lcom/android/volley/Request;->getHeaders()Ljava/util/Map;

    move-result-object v0

    goto :goto_0
.end method

.method public getRequestQueue()Lcom/android/volley/RequestQueue;
    .locals 1

    .prologue
    .line 53
    .local p0, "this":Lcom/mobnetic/coinguardiandatamodule/tester/volley/generic/GzipVolleyRequest;, "Lcom/mobnetic/coinguardiandatamodule/tester/volley/generic/GzipVolleyRequest<TT;>;"
    iget-object v0, p0, Lcom/mobnetic/coinguardiandatamodule/tester/volley/generic/GzipVolleyRequest;->requestQueue:Lcom/android/volley/RequestQueue;

    return-object v0
.end method

.method public getUrl()Ljava/lang/String;
    .locals 1

    .prologue
    .line 58
    .local p0, "this":Lcom/mobnetic/coinguardiandatamodule/tester/volley/generic/GzipVolleyRequest;, "Lcom/mobnetic/coinguardiandatamodule/tester/volley/generic/GzipVolleyRequest<TT;>;"
    iget-object v0, p0, Lcom/mobnetic/coinguardiandatamodule/tester/volley/generic/GzipVolleyRequest;->redirectionUrl:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 59
    iget-object v0, p0, Lcom/mobnetic/coinguardiandatamodule/tester/volley/generic/GzipVolleyRequest;->redirectionUrl:Ljava/lang/String;

    .line 60
    :goto_0
    return-object v0

    :cond_0
    invoke-super {p0}, Lcom/android/volley/Request;->getUrl()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method protected parseNetworkResponse(Lcom/android/volley/NetworkResponse;)Lcom/android/volley/Response;
    .locals 8
    .param p1, "response"    # Lcom/android/volley/NetworkResponse;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/volley/NetworkResponse;",
            ")",
            "Lcom/android/volley/Response",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 108
    .local p0, "this":Lcom/mobnetic/coinguardiandatamodule/tester/volley/generic/GzipVolleyRequest;, "Lcom/mobnetic/coinguardiandatamodule/tester/volley/generic/GzipVolleyRequest<TT;>;"
    :try_start_0
    iput-object p1, p0, Lcom/mobnetic/coinguardiandatamodule/tester/volley/generic/GzipVolleyRequest;->networkResponse:Lcom/android/volley/NetworkResponse;

    .line 109
    const-string v5, ""

    .line 110
    .local v5, "responseString":Ljava/lang/String;
    iget-object v6, p1, Lcom/android/volley/NetworkResponse;->headers:Ljava/util/Map;

    const-string v7, "Content-Encoding"

    invoke-interface {v6, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 111
    .local v3, "encoding":Ljava/lang/String;
    if-eqz v3, :cond_0

    const-string v6, "gzip"

    invoke-virtual {v3, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 112
    iget-object v6, p1, Lcom/android/volley/NetworkResponse;->data:[B

    invoke-direct {p0, v6}, Lcom/mobnetic/coinguardiandatamodule/tester/volley/generic/GzipVolleyRequest;->decodeGZip([B)Ljava/lang/String;

    move-result-object v5

    .line 116
    :goto_0
    iput-object v5, p0, Lcom/mobnetic/coinguardiandatamodule/tester/volley/generic/GzipVolleyRequest;->responseString:Ljava/lang/String;

    .line 117
    iget-object v4, p1, Lcom/android/volley/NetworkResponse;->headers:Ljava/util/Map;

    .line 118
    .local v4, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-static {p1}, Lcom/android/volley/toolbox/HttpHeaderParser;->parseCacheHeaders(Lcom/android/volley/NetworkResponse;)Lcom/android/volley/Cache$Entry;

    move-result-object v0

    .line 119
    .local v0, "cacheHeaders":Lcom/android/volley/Cache$Entry;
    const/4 p1, 0x0

    .line 120
    invoke-virtual {p0, v4, v5}, Lcom/mobnetic/coinguardiandatamodule/tester/volley/generic/GzipVolleyRequest;->parseNetworkResponse(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    invoke-static {v6, v0}, Lcom/android/volley/Response;->success(Ljava/lang/Object;Lcom/android/volley/Cache$Entry;)Lcom/android/volley/Response;

    move-result-object v6

    .line 126
    .end local v0    # "cacheHeaders":Lcom/android/volley/Cache$Entry;
    .end local v3    # "encoding":Ljava/lang/String;
    .end local v4    # "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v5    # "responseString":Ljava/lang/String;
    :goto_1
    return-object v6

    .line 114
    .restart local v3    # "encoding":Ljava/lang/String;
    .restart local v5    # "responseString":Ljava/lang/String;
    :cond_0
    new-instance v5, Ljava/lang/String;

    .end local v5    # "responseString":Ljava/lang/String;
    iget-object v6, p1, Lcom/android/volley/NetworkResponse;->data:[B

    iget-object v7, p1, Lcom/android/volley/NetworkResponse;->headers:Ljava/util/Map;

    invoke-static {v7}, Lcom/android/volley/toolbox/HttpHeaderParser;->parseCharset(Ljava/util/Map;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v5, v6, v7}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_0
    .catch Lcom/mobnetic/coinguardiandatamodule/tester/volley/CheckerErrorParsedError; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_2

    .restart local v5    # "responseString":Ljava/lang/String;
    goto :goto_0

    .line 121
    .end local v3    # "encoding":Ljava/lang/String;
    .end local v5    # "responseString":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 122
    .local v1, "checkerErrorParsedError":Lcom/mobnetic/coinguardiandatamodule/tester/volley/CheckerErrorParsedError;
    invoke-static {v1}, Lcom/android/volley/Response;->error(Lcom/android/volley/VolleyError;)Lcom/android/volley/Response;

    move-result-object v6

    goto :goto_1

    .line 123
    .end local v1    # "checkerErrorParsedError":Lcom/mobnetic/coinguardiandatamodule/tester/volley/CheckerErrorParsedError;
    :catch_1
    move-exception v2

    .line 124
    .local v2, "e":Ljava/lang/Exception;
    new-instance v6, Lcom/android/volley/ParseError;

    invoke-direct {v6, v2}, Lcom/android/volley/ParseError;-><init>(Ljava/lang/Throwable;)V

    invoke-static {v6}, Lcom/android/volley/Response;->error(Lcom/android/volley/VolleyError;)Lcom/android/volley/Response;

    move-result-object v6

    goto :goto_1

    .line 125
    .end local v2    # "e":Ljava/lang/Exception;
    :catch_2
    move-exception v2

    .line 126
    .local v2, "e":Ljava/lang/Throwable;
    new-instance v6, Lcom/mobnetic/coinguardiandatamodule/tester/volley/UnknownVolleyError;

    invoke-direct {v6, v2}, Lcom/mobnetic/coinguardiandatamodule/tester/volley/UnknownVolleyError;-><init>(Ljava/lang/Throwable;)V

    invoke-static {v6}, Lcom/android/volley/Response;->error(Lcom/android/volley/VolleyError;)Lcom/android/volley/Response;

    move-result-object v6

    goto :goto_1
.end method

.method protected abstract parseNetworkResponse(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method

.method public setRequestQueue(Lcom/android/volley/RequestQueue;)Lcom/android/volley/Request;
    .locals 1
    .param p1, "requestQueue"    # Lcom/android/volley/RequestQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/volley/RequestQueue;",
            ")",
            "Lcom/android/volley/Request",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 71
    .local p0, "this":Lcom/mobnetic/coinguardiandatamodule/tester/volley/generic/GzipVolleyRequest;, "Lcom/mobnetic/coinguardiandatamodule/tester/volley/generic/GzipVolleyRequest<TT;>;"
    iput-object p1, p0, Lcom/mobnetic/coinguardiandatamodule/tester/volley/generic/GzipVolleyRequest;->requestQueue:Lcom/android/volley/RequestQueue;

    .line 72
    invoke-super {p0, p1}, Lcom/android/volley/Request;->setRequestQueue(Lcom/android/volley/RequestQueue;)Lcom/android/volley/Request;

    move-result-object v0

    return-object v0
.end method
