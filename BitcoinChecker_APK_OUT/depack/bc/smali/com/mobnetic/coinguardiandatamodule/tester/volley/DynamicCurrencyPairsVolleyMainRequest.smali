.class public Lcom/mobnetic/coinguardiandatamodule/tester/volley/DynamicCurrencyPairsVolleyMainRequest;
.super Lcom/mobnetic/coinguardiandatamodule/tester/volley/generic/GzipVolleyRequest;
.source "DynamicCurrencyPairsVolleyMainRequest.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/mobnetic/coinguardiandatamodule/tester/volley/generic/GzipVolleyRequest",
        "<",
        "Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;",
        ">;"
    }
.end annotation


# instance fields
.field private final context:Landroid/content/Context;

.field private final market:Lcom/mobnetic/coinguardian/model/Market;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/mobnetic/coinguardian/model/Market;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "market"    # Lcom/mobnetic/coinguardian/model/Market;
    .param p4, "errorListener"    # Lcom/android/volley/Response$ErrorListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/mobnetic/coinguardian/model/Market;",
            "Lcom/android/volley/Response$Listener",
            "<",
            "Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;",
            ">;",
            "Lcom/android/volley/Response$ErrorListener;",
            ")V"
        }
    .end annotation

    .prologue
    .line 27
    .local p3, "listener":Lcom/android/volley/Response$Listener;, "Lcom/android/volley/Response$Listener<Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;>;"
    const/4 v0, 0x0

    invoke-virtual {p2, v0}, Lcom/mobnetic/coinguardian/model/Market;->getCurrencyPairsUrl(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, p3, p4}, Lcom/mobnetic/coinguardiandatamodule/tester/volley/generic/GzipVolleyRequest;-><init>(Ljava/lang/String;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;)V

    .line 30
    iput-object p1, p0, Lcom/mobnetic/coinguardiandatamodule/tester/volley/DynamicCurrencyPairsVolleyMainRequest;->context:Landroid/content/Context;

    .line 31
    iput-object p2, p0, Lcom/mobnetic/coinguardiandatamodule/tester/volley/DynamicCurrencyPairsVolleyMainRequest;->market:Lcom/mobnetic/coinguardian/model/Market;

    .line 32
    return-void
.end method


# virtual methods
.method protected parseNetworkResponse(Ljava/util/Map;Ljava/lang/String;)Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;
    .locals 12
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
            "Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 36
    .local p1, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 37
    .local v7, "pairs":Ljava/util/List;, "Ljava/util/List<Lcom/mobnetic/coinguardian/model/CurrencyPairInfo;>;"
    iget-object v10, p0, Lcom/mobnetic/coinguardiandatamodule/tester/volley/DynamicCurrencyPairsVolleyMainRequest;->market:Lcom/mobnetic/coinguardian/model/Market;

    const/4 v11, 0x0

    invoke-virtual {v10, v11, p2, v7}, Lcom/mobnetic/coinguardian/model/Market;->parseCurrencyPairsMain(ILjava/lang/String;Ljava/util/List;)V

    .line 39
    iget-object v10, p0, Lcom/mobnetic/coinguardiandatamodule/tester/volley/DynamicCurrencyPairsVolleyMainRequest;->market:Lcom/mobnetic/coinguardian/model/Market;

    invoke-virtual {v10}, Lcom/mobnetic/coinguardian/model/Market;->getCurrencyPairsNumOfRequests()I

    move-result v6

    .line 40
    .local v6, "numOfRequests":I
    const/4 v10, 0x1

    if-le v6, v10, :cond_1

    .line 41
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 42
    .local v3, "nextPairs":Ljava/util/List;, "Ljava/util/List<Lcom/mobnetic/coinguardian/model/CurrencyPairInfo;>;"
    const/4 v9, 0x1

    .local v9, "requestId":I
    :goto_0
    if-ge v9, v6, :cond_1

    .line 44
    :try_start_0
    invoke-static {}, Lcom/android/volley/toolbox/RequestFuture;->newFuture()Lcom/android/volley/toolbox/RequestFuture;

    move-result-object v2

    .line 45
    .local v2, "future":Lcom/android/volley/toolbox/RequestFuture;, "Lcom/android/volley/toolbox/RequestFuture<Ljava/lang/String;>;"
    iget-object v10, p0, Lcom/mobnetic/coinguardiandatamodule/tester/volley/DynamicCurrencyPairsVolleyMainRequest;->market:Lcom/mobnetic/coinguardian/model/Market;

    invoke-virtual {v10, v9}, Lcom/mobnetic/coinguardian/model/Market;->getCurrencyPairsUrl(I)Ljava/lang/String;

    move-result-object v5

    .line 46
    .local v5, "nextUrl":Ljava/lang/String;
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v10

    if-nez v10, :cond_0

    .line 47
    new-instance v8, Lcom/mobnetic/coinguardiandatamodule/tester/volley/DynamicCurrencyPairsVolleyNextRequest;

    invoke-direct {v8, v5, v2}, Lcom/mobnetic/coinguardiandatamodule/tester/volley/DynamicCurrencyPairsVolleyNextRequest;-><init>(Ljava/lang/String;Lcom/android/volley/toolbox/RequestFuture;)V

    .line 48
    .local v8, "request":Lcom/mobnetic/coinguardiandatamodule/tester/volley/DynamicCurrencyPairsVolleyNextRequest;
    invoke-virtual {p0}, Lcom/mobnetic/coinguardiandatamodule/tester/volley/DynamicCurrencyPairsVolleyMainRequest;->getRequestQueue()Lcom/android/volley/RequestQueue;

    move-result-object v10

    invoke-virtual {v10, v8}, Lcom/android/volley/RequestQueue;->add(Lcom/android/volley/Request;)Lcom/android/volley/Request;

    .line 49
    invoke-virtual {v2}, Lcom/android/volley/toolbox/RequestFuture;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 50
    .local v4, "nextResponse":Ljava/lang/String;
    invoke-interface {v3}, Ljava/util/List;->clear()V

    .line 51
    iget-object v10, p0, Lcom/mobnetic/coinguardiandatamodule/tester/volley/DynamicCurrencyPairsVolleyMainRequest;->market:Lcom/mobnetic/coinguardian/model/Market;

    invoke-virtual {v10, v9, v4, v3}, Lcom/mobnetic/coinguardian/model/Market;->parseCurrencyPairsMain(ILjava/lang/String;Ljava/util/List;)V

    .line 52
    invoke-interface {v7, v3}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 42
    .end local v2    # "future":Lcom/android/volley/toolbox/RequestFuture;, "Lcom/android/volley/toolbox/RequestFuture<Ljava/lang/String;>;"
    .end local v4    # "nextResponse":Ljava/lang/String;
    .end local v5    # "nextUrl":Ljava/lang/String;
    .end local v8    # "request":Lcom/mobnetic/coinguardiandatamodule/tester/volley/DynamicCurrencyPairsVolleyNextRequest;
    :cond_0
    :goto_1
    add-int/lit8 v9, v9, 0x1

    goto :goto_0

    .line 54
    :catch_0
    move-exception v1

    .line 55
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1

    .line 60
    .end local v1    # "e":Ljava/lang/Exception;
    .end local v3    # "nextPairs":Ljava/util/List;, "Ljava/util/List<Lcom/mobnetic/coinguardian/model/CurrencyPairInfo;>;"
    .end local v9    # "requestId":I
    :cond_1
    invoke-static {v7}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 61
    new-instance v0, Lcom/mobnetic/coinguardian/model/CurrencyPairsListWithDate;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/CurrencyPairsListWithDate;-><init>()V

    .line 62
    .local v0, "currencyPairsListWithDate":Lcom/mobnetic/coinguardian/model/CurrencyPairsListWithDate;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v10

    iput-wide v10, v0, Lcom/mobnetic/coinguardian/model/CurrencyPairsListWithDate;->date:J

    .line 63
    iput-object v7, v0, Lcom/mobnetic/coinguardian/model/CurrencyPairsListWithDate;->pairs:Ljava/util/List;

    .line 65
    if-eqz v7, :cond_2

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v10

    if-lez v10, :cond_2

    .line 66
    iget-object v10, p0, Lcom/mobnetic/coinguardiandatamodule/tester/volley/DynamicCurrencyPairsVolleyMainRequest;->context:Landroid/content/Context;

    iget-object v11, p0, Lcom/mobnetic/coinguardiandatamodule/tester/volley/DynamicCurrencyPairsVolleyMainRequest;->market:Lcom/mobnetic/coinguardian/model/Market;

    iget-object v11, v11, Lcom/mobnetic/coinguardian/model/Market;->key:Ljava/lang/String;

    invoke-static {v10, v11, v0}, Lcom/mobnetic/coinguardiandatamodule/tester/util/MarketCurrencyPairsStore;->savePairsForMarket(Landroid/content/Context;Ljava/lang/String;Lcom/mobnetic/coinguardian/model/CurrencyPairsListWithDate;)V

    .line 68
    :cond_2
    new-instance v10, Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;

    invoke-direct {v10, v0}, Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;-><init>(Lcom/mobnetic/coinguardian/model/CurrencyPairsListWithDate;)V

    return-object v10
.end method

.method protected bridge synthetic parseNetworkResponse(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 21
    invoke-virtual {p0, p1, p2}, Lcom/mobnetic/coinguardiandatamodule/tester/volley/DynamicCurrencyPairsVolleyMainRequest;->parseNetworkResponse(Ljava/util/Map;Ljava/lang/String;)Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;

    move-result-object v0

    return-object v0
.end method
