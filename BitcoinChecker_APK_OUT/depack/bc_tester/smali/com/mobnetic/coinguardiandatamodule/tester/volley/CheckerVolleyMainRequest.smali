.class public Lcom/mobnetic/coinguardiandatamodule/tester/volley/CheckerVolleyMainRequest;
.super Lcom/mobnetic/coinguardiandatamodule/tester/volley/generic/GenericCheckerVolleyRequest;
.source "CheckerVolleyMainRequest.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mobnetic/coinguardiandatamodule/tester/volley/CheckerVolleyMainRequest$TickerWrapper;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/mobnetic/coinguardiandatamodule/tester/volley/generic/GenericCheckerVolleyRequest",
        "<",
        "Lcom/mobnetic/coinguardiandatamodule/tester/volley/CheckerVolleyMainRequest$TickerWrapper;",
        ">;"
    }
.end annotation


# instance fields
.field private final market:Lcom/mobnetic/coinguardian/model/Market;


# direct methods
.method public constructor <init>(Lcom/mobnetic/coinguardian/model/Market;Lcom/mobnetic/coinguardian/model/CheckerInfo;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;)V
    .locals 4
    .param p1, "market"    # Lcom/mobnetic/coinguardian/model/Market;
    .param p2, "checkerInfo"    # Lcom/mobnetic/coinguardian/model/CheckerInfo;
    .param p4, "errorListener"    # Lcom/android/volley/Response$ErrorListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/mobnetic/coinguardian/model/Market;",
            "Lcom/mobnetic/coinguardian/model/CheckerInfo;",
            "Lcom/android/volley/Response$Listener",
            "<",
            "Lcom/mobnetic/coinguardiandatamodule/tester/volley/CheckerVolleyMainRequest$TickerWrapper;",
            ">;",
            "Lcom/android/volley/Response$ErrorListener;",
            ")V"
        }
    .end annotation

    .prologue
    .line 22
    .local p3, "listener":Lcom/android/volley/Response$Listener;, "Lcom/android/volley/Response$Listener<Lcom/mobnetic/coinguardiandatamodule/tester/volley/CheckerVolleyMainRequest$TickerWrapper;>;"
    const/4 v0, 0x0

    invoke-virtual {p1, v0, p2}, Lcom/mobnetic/coinguardian/model/Market;->getUrl(ILcom/mobnetic/coinguardian/model/CheckerInfo;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, p2, p3, p4}, Lcom/mobnetic/coinguardiandatamodule/tester/volley/generic/GenericCheckerVolleyRequest;-><init>(Ljava/lang/String;Lcom/mobnetic/coinguardian/model/CheckerInfo;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;)V

    .line 23
    new-instance v0, Lcom/android/volley/DefaultRetryPolicy;

    const/16 v1, 0x1388

    const/4 v2, 0x3

    const/high16 v3, 0x3fc00000    # 1.5f

    invoke-direct {v0, v1, v2, v3}, Lcom/android/volley/DefaultRetryPolicy;-><init>(IIF)V

    invoke-virtual {p0, v0}, Lcom/mobnetic/coinguardiandatamodule/tester/volley/CheckerVolleyMainRequest;->setRetryPolicy(Lcom/android/volley/RetryPolicy;)Lcom/android/volley/Request;

    .line 24
    iput-object p1, p0, Lcom/mobnetic/coinguardiandatamodule/tester/volley/CheckerVolleyMainRequest;->market:Lcom/mobnetic/coinguardian/model/Market;

    .line 25
    return-void
.end method


# virtual methods
.method protected parseNetworkResponse(Ljava/util/Map;Ljava/lang/String;)Lcom/mobnetic/coinguardiandatamodule/tester/volley/CheckerVolleyMainRequest$TickerWrapper;
    .locals 16
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
            "Lcom/mobnetic/coinguardiandatamodule/tester/volley/CheckerVolleyMainRequest$TickerWrapper;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 29
    .local p1, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v10, Lcom/mobnetic/coinguardiandatamodule/tester/volley/CheckerVolleyMainRequest$TickerWrapper;

    move-object/from16 v0, p0

    invoke-direct {v10, v0}, Lcom/mobnetic/coinguardiandatamodule/tester/volley/CheckerVolleyMainRequest$TickerWrapper;-><init>(Lcom/mobnetic/coinguardiandatamodule/tester/volley/CheckerVolleyMainRequest;)V

    .line 31
    .local v10, "tickerWrapper":Lcom/mobnetic/coinguardiandatamodule/tester/volley/CheckerVolleyMainRequest$TickerWrapper;
    :try_start_0
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/mobnetic/coinguardiandatamodule/tester/volley/CheckerVolleyMainRequest;->market:Lcom/mobnetic/coinguardian/model/Market;

    const/4 v12, 0x0

    new-instance v13, Lcom/mobnetic/coinguardian/model/Ticker;

    invoke-direct {v13}, Lcom/mobnetic/coinguardian/model/Ticker;-><init>()V

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/mobnetic/coinguardiandatamodule/tester/volley/CheckerVolleyMainRequest;->checkerInfo:Lcom/mobnetic/coinguardian/model/CheckerInfo;

    move-object/from16 v0, p2

    invoke-virtual {v11, v12, v0, v13, v14}, Lcom/mobnetic/coinguardian/model/Market;->parseTickerMain(ILjava/lang/String;Lcom/mobnetic/coinguardian/model/Ticker;Lcom/mobnetic/coinguardian/model/CheckerInfo;)Lcom/mobnetic/coinguardian/model/Ticker;

    move-result-object v11

    iput-object v11, v10, Lcom/mobnetic/coinguardiandatamodule/tester/volley/CheckerVolleyMainRequest$TickerWrapper;->ticker:Lcom/mobnetic/coinguardian/model/Ticker;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 37
    :goto_0
    iget-object v11, v10, Lcom/mobnetic/coinguardiandatamodule/tester/volley/CheckerVolleyMainRequest$TickerWrapper;->ticker:Lcom/mobnetic/coinguardian/model/Ticker;

    if-eqz v11, :cond_0

    iget-object v11, v10, Lcom/mobnetic/coinguardiandatamodule/tester/volley/CheckerVolleyMainRequest$TickerWrapper;->ticker:Lcom/mobnetic/coinguardian/model/Ticker;

    iget-wide v12, v11, Lcom/mobnetic/coinguardian/model/Ticker;->last:D

    const-wide/high16 v14, -0x4010000000000000L    # -1.0

    cmpg-double v11, v12, v14

    if-gtz v11, :cond_1

    .line 40
    :cond_0
    :try_start_1
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/mobnetic/coinguardiandatamodule/tester/volley/CheckerVolleyMainRequest;->market:Lcom/mobnetic/coinguardian/model/Market;

    const/4 v12, 0x0

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/mobnetic/coinguardiandatamodule/tester/volley/CheckerVolleyMainRequest;->checkerInfo:Lcom/mobnetic/coinguardian/model/CheckerInfo;

    move-object/from16 v0, p2

    invoke-virtual {v11, v12, v0, v13}, Lcom/mobnetic/coinguardian/model/Market;->parseErrorMain(ILjava/lang/String;Lcom/mobnetic/coinguardian/model/CheckerInfo;)Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v3

    .line 44
    .local v3, "errorMsg":Ljava/lang/String;
    :goto_1
    new-instance v11, Lcom/mobnetic/coinguardiandatamodule/tester/volley/CheckerErrorParsedError;

    invoke-direct {v11, v3}, Lcom/mobnetic/coinguardiandatamodule/tester/volley/CheckerErrorParsedError;-><init>(Ljava/lang/String;)V

    throw v11

    .line 32
    .end local v3    # "errorMsg":Ljava/lang/String;
    :catch_0
    move-exception v2

    .line 33
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    .line 34
    const/4 v11, 0x0

    iput-object v11, v10, Lcom/mobnetic/coinguardiandatamodule/tester/volley/CheckerVolleyMainRequest$TickerWrapper;->ticker:Lcom/mobnetic/coinguardian/model/Ticker;

    goto :goto_0

    .line 41
    .end local v2    # "e":Ljava/lang/Exception;
    :catch_1
    move-exception v2

    .line 42
    .restart local v2    # "e":Ljava/lang/Exception;
    const/4 v3, 0x0

    .restart local v3    # "errorMsg":Ljava/lang/String;
    goto :goto_1

    .line 47
    .end local v2    # "e":Ljava/lang/Exception;
    .end local v3    # "errorMsg":Ljava/lang/String;
    :cond_1
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/mobnetic/coinguardiandatamodule/tester/volley/CheckerVolleyMainRequest;->market:Lcom/mobnetic/coinguardian/model/Market;

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/mobnetic/coinguardiandatamodule/tester/volley/CheckerVolleyMainRequest;->checkerInfo:Lcom/mobnetic/coinguardian/model/CheckerInfo;

    invoke-virtual {v11, v12}, Lcom/mobnetic/coinguardian/model/Market;->getNumOfRequests(Lcom/mobnetic/coinguardian/model/CheckerInfo;)I

    move-result v7

    .line 48
    .local v7, "numOfRequests":I
    const/4 v11, 0x1

    if-le v7, v11, :cond_3

    .line 49
    const/4 v9, 0x1

    .local v9, "requestId":I
    :goto_2
    if-ge v9, v7, :cond_3

    .line 51
    :try_start_2
    invoke-static {}, Lcom/android/volley/toolbox/RequestFuture;->newFuture()Lcom/android/volley/toolbox/RequestFuture;

    move-result-object v4

    .line 52
    .local v4, "future":Lcom/android/volley/toolbox/RequestFuture;, "Lcom/android/volley/toolbox/RequestFuture<Ljava/lang/String;>;"
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/mobnetic/coinguardiandatamodule/tester/volley/CheckerVolleyMainRequest;->market:Lcom/mobnetic/coinguardian/model/Market;

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/mobnetic/coinguardiandatamodule/tester/volley/CheckerVolleyMainRequest;->checkerInfo:Lcom/mobnetic/coinguardian/model/CheckerInfo;

    invoke-virtual {v11, v9, v12}, Lcom/mobnetic/coinguardian/model/Market;->getUrl(ILcom/mobnetic/coinguardian/model/CheckerInfo;)Ljava/lang/String;

    move-result-object v6

    .line 53
    .local v6, "nextUrl":Ljava/lang/String;
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v11

    if-nez v11, :cond_2

    .line 54
    new-instance v8, Lcom/mobnetic/coinguardiandatamodule/tester/volley/CheckerVolleyNextRequest;

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/mobnetic/coinguardiandatamodule/tester/volley/CheckerVolleyMainRequest;->checkerInfo:Lcom/mobnetic/coinguardian/model/CheckerInfo;

    invoke-direct {v8, v6, v11, v4}, Lcom/mobnetic/coinguardiandatamodule/tester/volley/CheckerVolleyNextRequest;-><init>(Ljava/lang/String;Lcom/mobnetic/coinguardian/model/CheckerInfo;Lcom/android/volley/toolbox/RequestFuture;)V

    .line 55
    .local v8, "request":Lcom/mobnetic/coinguardiandatamodule/tester/volley/CheckerVolleyNextRequest;
    invoke-virtual/range {p0 .. p0}, Lcom/mobnetic/coinguardiandatamodule/tester/volley/CheckerVolleyMainRequest;->getRequestQueue()Lcom/android/volley/RequestQueue;

    move-result-object v11

    invoke-virtual {v11, v8}, Lcom/android/volley/RequestQueue;->add(Lcom/android/volley/Request;)Lcom/android/volley/Request;

    .line 56
    invoke-virtual {v4}, Lcom/android/volley/toolbox/RequestFuture;->get()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 57
    .local v5, "nextResponse":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/mobnetic/coinguardiandatamodule/tester/volley/CheckerVolleyMainRequest;->market:Lcom/mobnetic/coinguardian/model/Market;

    iget-object v12, v10, Lcom/mobnetic/coinguardiandatamodule/tester/volley/CheckerVolleyMainRequest$TickerWrapper;->ticker:Lcom/mobnetic/coinguardian/model/Ticker;

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/mobnetic/coinguardiandatamodule/tester/volley/CheckerVolleyMainRequest;->checkerInfo:Lcom/mobnetic/coinguardian/model/CheckerInfo;

    invoke-virtual {v11, v9, v5, v12, v13}, Lcom/mobnetic/coinguardian/model/Market;->parseTickerMain(ILjava/lang/String;Lcom/mobnetic/coinguardian/model/Ticker;Lcom/mobnetic/coinguardian/model/CheckerInfo;)Lcom/mobnetic/coinguardian/model/Ticker;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 49
    .end local v4    # "future":Lcom/android/volley/toolbox/RequestFuture;, "Lcom/android/volley/toolbox/RequestFuture<Ljava/lang/String;>;"
    .end local v5    # "nextResponse":Ljava/lang/String;
    .end local v6    # "nextUrl":Ljava/lang/String;
    .end local v8    # "request":Lcom/mobnetic/coinguardiandatamodule/tester/volley/CheckerVolleyNextRequest;
    :cond_2
    :goto_3
    add-int/lit8 v9, v9, 0x1

    goto :goto_2

    .line 59
    :catch_2
    move-exception v2

    .line 60
    .restart local v2    # "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_3

    .line 64
    .end local v2    # "e":Ljava/lang/Exception;
    .end local v9    # "requestId":I
    :cond_3
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
    .line 17
    invoke-virtual {p0, p1, p2}, Lcom/mobnetic/coinguardiandatamodule/tester/volley/CheckerVolleyMainRequest;->parseNetworkResponse(Ljava/util/Map;Ljava/lang/String;)Lcom/mobnetic/coinguardiandatamodule/tester/volley/CheckerVolleyMainRequest$TickerWrapper;

    move-result-object v0

    return-object v0
.end method
