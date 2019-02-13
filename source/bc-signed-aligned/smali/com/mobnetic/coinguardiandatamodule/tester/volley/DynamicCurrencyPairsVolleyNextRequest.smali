.class public Lcom/mobnetic/coinguardiandatamodule/tester/volley/DynamicCurrencyPairsVolleyNextRequest;
.super Lcom/mobnetic/coinguardiandatamodule/tester/volley/generic/GzipVolleyRequest;
.source "DynamicCurrencyPairsVolleyNextRequest.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/mobnetic/coinguardiandatamodule/tester/volley/generic/GzipVolleyRequest",
        "<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/android/volley/toolbox/RequestFuture;)V
    .locals 0
    .param p1, "url"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/android/volley/toolbox/RequestFuture",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 11
    .local p2, "future":Lcom/android/volley/toolbox/RequestFuture;, "Lcom/android/volley/toolbox/RequestFuture<Ljava/lang/String;>;"
    invoke-direct {p0, p1, p2, p2}, Lcom/mobnetic/coinguardiandatamodule/tester/volley/generic/GzipVolleyRequest;-><init>(Ljava/lang/String;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;)V

    .line 12
    return-void
.end method


# virtual methods
.method protected bridge synthetic parseNetworkResponse(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 8
    invoke-virtual {p0, p1, p2}, Lcom/mobnetic/coinguardiandatamodule/tester/volley/DynamicCurrencyPairsVolleyNextRequest;->parseNetworkResponse(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected parseNetworkResponse(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p2, "responseString"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 16
    .local p1, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    return-object p2
.end method
