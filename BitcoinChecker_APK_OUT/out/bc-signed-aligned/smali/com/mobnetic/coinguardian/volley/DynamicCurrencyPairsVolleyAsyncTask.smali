.class public Lcom/mobnetic/coinguardian/volley/DynamicCurrencyPairsVolleyAsyncTask;
.super Lcom/mobnetic/coinguardian/volley/generic/GenericVolleyAsyncTask;
.source "DynamicCurrencyPairsVolleyAsyncTask.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/mobnetic/coinguardian/volley/generic/GenericVolleyAsyncTask",
        "<",
        "Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;",
        ">;"
    }
.end annotation


# instance fields
.field private final context:Landroid/content/Context;

.field private final market:Lcom/mobnetic/coinguardian/model/Market;


# direct methods
.method public constructor <init>(Lcom/android/volley/RequestQueue;Landroid/content/Context;Lcom/mobnetic/coinguardian/model/Market;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;)V
    .locals 0
    .param p1, "requestQueue"    # Lcom/android/volley/RequestQueue;
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "market"    # Lcom/mobnetic/coinguardian/model/Market;
    .param p5, "errorListener"    # Lcom/android/volley/Response$ErrorListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/volley/RequestQueue;",
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
    .line 30
    .local p4, "listener":Lcom/android/volley/Response$Listener;, "Lcom/android/volley/Response$Listener<Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;>;"
    invoke-direct {p0, p1, p4, p5}, Lcom/mobnetic/coinguardian/volley/generic/GenericVolleyAsyncTask;-><init>(Lcom/android/volley/RequestQueue;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;)V

    .line 31
    iput-object p2, p0, Lcom/mobnetic/coinguardian/volley/DynamicCurrencyPairsVolleyAsyncTask;->context:Landroid/content/Context;

    .line 32
    iput-object p3, p0, Lcom/mobnetic/coinguardian/volley/DynamicCurrencyPairsVolleyAsyncTask;->market:Lcom/mobnetic/coinguardian/model/Market;

    .line 33
    return-void
.end method


# virtual methods
.method protected doNetworkInBackground()Ljava/lang/Object;
    .locals 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 37
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 39
    .local v6, "pairs":Ljava/util/List;, "Ljava/util/List<Lcom/mobnetic/coinguardian/model/CurrencyPairInfo;>;"
    iget-object v10, p0, Lcom/mobnetic/coinguardian/volley/DynamicCurrencyPairsVolleyAsyncTask;->market:Lcom/mobnetic/coinguardian/model/Market;

    invoke-virtual {v10}, Lcom/mobnetic/coinguardian/model/Market;->getCurrencyPairsNumOfRequests()I

    move-result v5

    .line 40
    .local v5, "numOfRequests":I
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/volley/DynamicCurrencyPairsVolleyAsyncTask;->isCancelled()Z

    move-result v10

    if-nez v10, :cond_3

    .line 41
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 42
    .local v3, "nextPairs":Ljava/util/List;, "Ljava/util/List<Lcom/mobnetic/coinguardian/model/CurrencyPairInfo;>;"
    const/4 v8, 0x0

    .local v8, "requestId":I
    :goto_0
    if-ge v8, v5, :cond_3

    .line 44
    :try_start_0
    iget-object v10, p0, Lcom/mobnetic/coinguardian/volley/DynamicCurrencyPairsVolleyAsyncTask;->market:Lcom/mobnetic/coinguardian/model/Market;

    invoke-virtual {v10, v8}, Lcom/mobnetic/coinguardian/model/Market;->getCurrencyPairsUrl(I)Ljava/lang/String;

    move-result-object v4

    .line 45
    .local v4, "nextUrl":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/volley/DynamicCurrencyPairsVolleyAsyncTask;->isCancelled()Z

    move-result v10

    if-nez v10, :cond_2

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v10

    if-nez v10, :cond_2

    .line 46
    invoke-static {}, Lcom/android/volley/toolbox/RequestFuture;->newFuture()Lcom/android/volley/toolbox/RequestFuture;

    move-result-object v2

    .line 47
    .local v2, "future":Lcom/android/volley/toolbox/RequestFuture;, "Lcom/android/volley/toolbox/RequestFuture<Ljava/lang/String;>;"
    new-instance v7, Lcom/mobnetic/coinguardian/volley/generic/GzipVolleyStringRequest;

    invoke-direct {v7, v4, v2, v2}, Lcom/mobnetic/coinguardian/volley/generic/GzipVolleyStringRequest;-><init>(Ljava/lang/String;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;)V

    .line 48
    .local v7, "request":Lcom/mobnetic/coinguardian/volley/generic/GzipVolleyStringRequest;
    if-nez v8, :cond_0

    .line 49
    new-instance v10, Lcom/android/volley/DefaultRetryPolicy;

    const/16 v11, 0x1f40

    const/4 v12, 0x1

    const/high16 v13, 0x3f800000    # 1.0f

    invoke-direct {v10, v11, v12, v13}, Lcom/android/volley/DefaultRetryPolicy;-><init>(IIF)V

    invoke-virtual {v7, v10}, Lcom/mobnetic/coinguardian/volley/generic/GzipVolleyStringRequest;->setRetryPolicy(Lcom/android/volley/RetryPolicy;)Lcom/android/volley/Request;

    .line 51
    :cond_0
    iget-object v10, p0, Lcom/mobnetic/coinguardian/volley/DynamicCurrencyPairsVolleyAsyncTask;->requestQueue:Lcom/android/volley/RequestQueue;

    invoke-virtual {v10, v7}, Lcom/android/volley/RequestQueue;->add(Lcom/android/volley/Request;)Lcom/android/volley/Request;

    .line 52
    invoke-virtual {v2}, Lcom/android/volley/toolbox/RequestFuture;->get()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    .line 54
    .local v9, "responseString":Ljava/lang/String;
    invoke-interface {v3}, Ljava/util/List;->clear()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 56
    :try_start_1
    iget-object v10, p0, Lcom/mobnetic/coinguardian/volley/DynamicCurrencyPairsVolleyAsyncTask;->market:Lcom/mobnetic/coinguardian/model/Market;

    invoke-virtual {v10, v8, v9, v3}, Lcom/mobnetic/coinguardian/model/Market;->parseCurrencyPairsMain(ILjava/lang/String;Ljava/util/List;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 61
    :cond_1
    :try_start_2
    invoke-interface {v6, v3}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 42
    .end local v2    # "future":Lcom/android/volley/toolbox/RequestFuture;, "Lcom/android/volley/toolbox/RequestFuture<Ljava/lang/String;>;"
    .end local v4    # "nextUrl":Ljava/lang/String;
    .end local v7    # "request":Lcom/mobnetic/coinguardian/volley/generic/GzipVolleyStringRequest;
    .end local v9    # "responseString":Ljava/lang/String;
    :cond_2
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    .line 57
    .restart local v2    # "future":Lcom/android/volley/toolbox/RequestFuture;, "Lcom/android/volley/toolbox/RequestFuture<Ljava/lang/String;>;"
    .restart local v4    # "nextUrl":Ljava/lang/String;
    .restart local v7    # "request":Lcom/mobnetic/coinguardian/volley/generic/GzipVolleyStringRequest;
    .restart local v9    # "responseString":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 58
    .local v1, "e":Ljava/lang/Exception;
    if-nez v8, :cond_1

    .line 59
    new-instance v10, Lcom/android/volley/ParseError;

    invoke-direct {v10, v1}, Lcom/android/volley/ParseError;-><init>(Ljava/lang/Throwable;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 78
    .end local v1    # "e":Ljava/lang/Exception;
    .end local v2    # "future":Lcom/android/volley/toolbox/RequestFuture;, "Lcom/android/volley/toolbox/RequestFuture<Ljava/lang/String;>;"
    .end local v3    # "nextPairs":Ljava/util/List;, "Ljava/util/List<Lcom/mobnetic/coinguardian/model/CurrencyPairInfo;>;"
    .end local v4    # "nextUrl":Ljava/lang/String;
    .end local v7    # "request":Lcom/mobnetic/coinguardian/volley/generic/GzipVolleyStringRequest;
    .end local v8    # "requestId":I
    .end local v9    # "responseString":Ljava/lang/String;
    :goto_1
    return-object v10

    .line 63
    .restart local v3    # "nextPairs":Ljava/util/List;, "Ljava/util/List<Lcom/mobnetic/coinguardian/model/CurrencyPairInfo;>;"
    .restart local v8    # "requestId":I
    :catch_1
    move-exception v1

    .line 64
    .restart local v1    # "e":Ljava/lang/Exception;
    if-nez v8, :cond_2

    .line 65
    throw v1

    .line 70
    .end local v1    # "e":Ljava/lang/Exception;
    .end local v3    # "nextPairs":Ljava/util/List;, "Ljava/util/List<Lcom/mobnetic/coinguardian/model/CurrencyPairInfo;>;"
    .end local v8    # "requestId":I
    :cond_3
    invoke-static {v6}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 71
    new-instance v0, Lcom/mobnetic/coinguardian/model/CurrencyPairsListWithDate;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/CurrencyPairsListWithDate;-><init>()V

    .line 72
    .local v0, "currencyPairsListWithDate":Lcom/mobnetic/coinguardian/model/CurrencyPairsListWithDate;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v10

    iput-wide v10, v0, Lcom/mobnetic/coinguardian/model/CurrencyPairsListWithDate;->date:J

    .line 73
    iput-object v6, v0, Lcom/mobnetic/coinguardian/model/CurrencyPairsListWithDate;->pairs:Ljava/util/List;

    .line 75
    if-eqz v6, :cond_4

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v10

    if-lez v10, :cond_4

    .line 76
    iget-object v10, p0, Lcom/mobnetic/coinguardian/volley/DynamicCurrencyPairsVolleyAsyncTask;->context:Landroid/content/Context;

    iget-object v11, p0, Lcom/mobnetic/coinguardian/volley/DynamicCurrencyPairsVolleyAsyncTask;->market:Lcom/mobnetic/coinguardian/model/Market;

    iget-object v11, v11, Lcom/mobnetic/coinguardian/model/Market;->key:Ljava/lang/String;

    invoke-static {v10, v11, v0}, Lcom/mobnetic/coinguardian/util/MarketCurrencyPairsStore;->savePairsForMarket(Landroid/content/Context;Ljava/lang/String;Lcom/mobnetic/coinguardian/model/CurrencyPairsListWithDate;)V

    .line 78
    :cond_4
    new-instance v10, Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;

    invoke-direct {v10, v0}, Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;-><init>(Lcom/mobnetic/coinguardian/model/CurrencyPairsListWithDate;)V

    goto :goto_1
.end method
