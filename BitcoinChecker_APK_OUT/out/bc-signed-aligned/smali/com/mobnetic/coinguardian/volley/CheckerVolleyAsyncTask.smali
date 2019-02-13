.class public Lcom/mobnetic/coinguardian/volley/CheckerVolleyAsyncTask;
.super Lcom/mobnetic/coinguardian/volley/generic/GenericVolleyAsyncTask;
.source "CheckerVolleyAsyncTask.java"

# interfaces
.implements Lcom/mobnetic/coinguardian/volley/CheckerRecordRequestIfc;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/mobnetic/coinguardian/volley/generic/GenericVolleyAsyncTask",
        "<",
        "Lcom/mobnetic/coinguardian/model/Ticker;",
        ">;",
        "Lcom/mobnetic/coinguardian/volley/CheckerRecordRequestIfc;"
    }
.end annotation


# static fields
.field private static final CHECKERS_TASKS:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/mobnetic/coinguardian/volley/CheckerVolleyAsyncTask;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field protected final checkerInfo:Lcom/mobnetic/coinguardian/model/CheckerInfo;

.field private final checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 27
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/mobnetic/coinguardian/volley/CheckerVolleyAsyncTask;->CHECKERS_TASKS:Ljava/util/ArrayList;

    return-void
.end method

.method public constructor <init>(Lcom/android/volley/RequestQueue;Lcom/mobnetic/coinguardian/db/content/CheckerRecord;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;)V
    .locals 1
    .param p1, "requestQueue"    # Lcom/android/volley/RequestQueue;
    .param p2, "checkerRecord"    # Lcom/mobnetic/coinguardian/db/content/CheckerRecord;
    .param p4, "errorListener"    # Lcom/android/volley/Response$ErrorListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/volley/RequestQueue;",
            "Lcom/mobnetic/coinguardian/db/content/CheckerRecord;",
            "Lcom/android/volley/Response$Listener",
            "<",
            "Lcom/mobnetic/coinguardian/model/Ticker;",
            ">;",
            "Lcom/android/volley/Response$ErrorListener;",
            ")V"
        }
    .end annotation

    .prologue
    .line 30
    .local p3, "listener":Lcom/android/volley/Response$Listener;, "Lcom/android/volley/Response$Listener<Lcom/mobnetic/coinguardian/model/Ticker;>;"
    invoke-direct {p0, p1, p3, p4}, Lcom/mobnetic/coinguardian/volley/generic/GenericVolleyAsyncTask;-><init>(Lcom/android/volley/RequestQueue;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;)V

    .line 31
    iput-object p2, p0, Lcom/mobnetic/coinguardian/volley/CheckerVolleyAsyncTask;->checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    .line 32
    invoke-static {p2}, Lcom/mobnetic/coinguardian/util/CheckerRecordHelper;->createCheckerInfo(Lcom/mobnetic/coinguardian/db/content/CheckerRecord;)Lcom/mobnetic/coinguardian/model/CheckerInfo;

    move-result-object v0

    iput-object v0, p0, Lcom/mobnetic/coinguardian/volley/CheckerVolleyAsyncTask;->checkerInfo:Lcom/mobnetic/coinguardian/model/CheckerInfo;

    .line 33
    return-void
.end method

.method public static cancelCheckingForCheckerRecord(J)V
    .locals 4
    .param p0, "checkerRecordId"    # J

    .prologue
    .line 111
    sget-object v1, Lcom/mobnetic/coinguardian/volley/CheckerVolleyAsyncTask;->CHECKERS_TASKS:Ljava/util/ArrayList;

    if-eqz v1, :cond_1

    const-wide/16 v2, 0x0

    cmp-long v1, p0, v2

    if-lez v1, :cond_1

    .line 112
    sget-object v1, Lcom/mobnetic/coinguardian/volley/CheckerVolleyAsyncTask;->CHECKERS_TASKS:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mobnetic/coinguardian/volley/CheckerVolleyAsyncTask;

    .line 113
    .local v0, "checkerVolleyAsyncTask":Lcom/mobnetic/coinguardian/volley/CheckerVolleyAsyncTask;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/mobnetic/coinguardian/volley/CheckerVolleyAsyncTask;->getCheckerRecordId()J

    move-result-wide v2

    cmp-long v2, v2, p0

    if-nez v2, :cond_0

    .line 114
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Lcom/mobnetic/coinguardian/volley/CheckerVolleyAsyncTask;->cancel(Z)Z

    goto :goto_0

    .line 118
    .end local v0    # "checkerVolleyAsyncTask":Lcom/mobnetic/coinguardian/volley/CheckerVolleyAsyncTask;
    :cond_1
    return-void
.end method


# virtual methods
.method protected doNetworkInBackground()Ljava/lang/Object;
    .locals 20
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 48
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mobnetic/coinguardian/volley/CheckerVolleyAsyncTask;->checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    invoke-virtual {v15}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getMarketKey()Ljava/lang/String;

    move-result-object v15

    invoke-static {v15}, Lcom/mobnetic/coinguardian/util/MarketsConfigUtils;->getMarketByKey(Ljava/lang/String;)Lcom/mobnetic/coinguardian/model/Market;

    move-result-object v5

    .line 50
    .local v5, "market":Lcom/mobnetic/coinguardian/model/Market;
    const/4 v12, 0x0

    .line 51
    .local v12, "responseString":Ljava/lang/String;
    const/4 v13, 0x0

    .line 53
    .local v13, "ticker":Lcom/mobnetic/coinguardian/model/Ticker;
    invoke-static {}, Lcom/android/volley/toolbox/RequestFuture;->newFuture()Lcom/android/volley/toolbox/RequestFuture;

    move-result-object v4

    .line 54
    .local v4, "future":Lcom/android/volley/toolbox/RequestFuture;, "Lcom/android/volley/toolbox/RequestFuture<Ljava/lang/String;>;"
    const/4 v15, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mobnetic/coinguardian/volley/CheckerVolleyAsyncTask;->checkerInfo:Lcom/mobnetic/coinguardian/model/CheckerInfo;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-virtual {v5, v15, v0}, Lcom/mobnetic/coinguardian/model/Market;->getUrl(ILcom/mobnetic/coinguardian/model/CheckerInfo;)Ljava/lang/String;

    move-result-object v14

    .line 55
    .local v14, "url":Ljava/lang/String;
    invoke-virtual/range {p0 .. p0}, Lcom/mobnetic/coinguardian/volley/CheckerVolleyAsyncTask;->isCancelled()Z

    move-result v15

    if-nez v15, :cond_0

    invoke-static {v14}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v15

    if-nez v15, :cond_0

    .line 56
    new-instance v10, Lcom/mobnetic/coinguardian/volley/generic/GzipVolleyStringRequest;

    invoke-direct {v10, v14, v4, v4}, Lcom/mobnetic/coinguardian/volley/generic/GzipVolleyStringRequest;-><init>(Ljava/lang/String;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;)V

    .line 57
    .local v10, "request":Lcom/mobnetic/coinguardian/volley/generic/GzipVolleyStringRequest;
    new-instance v15, Lcom/android/volley/DefaultRetryPolicy;

    const/16 v16, 0x1f40

    const/16 v17, 0x1

    const/high16 v18, 0x3f800000    # 1.0f

    invoke-direct/range {v15 .. v18}, Lcom/android/volley/DefaultRetryPolicy;-><init>(IIF)V

    invoke-virtual {v10, v15}, Lcom/mobnetic/coinguardian/volley/generic/GzipVolleyStringRequest;->setRetryPolicy(Lcom/android/volley/RetryPolicy;)Lcom/android/volley/Request;

    .line 58
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mobnetic/coinguardian/volley/CheckerVolleyAsyncTask;->requestQueue:Lcom/android/volley/RequestQueue;

    invoke-virtual {v15, v10}, Lcom/android/volley/RequestQueue;->add(Lcom/android/volley/Request;)Lcom/android/volley/Request;

    .line 59
    invoke-virtual {v4}, Lcom/android/volley/toolbox/RequestFuture;->get()Ljava/lang/Object;

    move-result-object v12

    .end local v12    # "responseString":Ljava/lang/String;
    check-cast v12, Ljava/lang/String;

    .line 63
    .end local v10    # "request":Lcom/mobnetic/coinguardian/volley/generic/GzipVolleyStringRequest;
    .restart local v12    # "responseString":Ljava/lang/String;
    :cond_0
    const/4 v15, 0x0

    :try_start_0
    new-instance v16, Lcom/mobnetic/coinguardian/model/Ticker;

    invoke-direct/range {v16 .. v16}, Lcom/mobnetic/coinguardian/model/Ticker;-><init>()V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mobnetic/coinguardian/volley/CheckerVolleyAsyncTask;->checkerInfo:Lcom/mobnetic/coinguardian/model/CheckerInfo;

    move-object/from16 v17, v0

    move-object/from16 v0, v16

    move-object/from16 v1, v17

    invoke-virtual {v5, v15, v12, v0, v1}, Lcom/mobnetic/coinguardian/model/Market;->parseTickerMain(ILjava/lang/String;Lcom/mobnetic/coinguardian/model/Ticker;Lcom/mobnetic/coinguardian/model/CheckerInfo;)Lcom/mobnetic/coinguardian/model/Ticker;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_2

    move-result-object v13

    .line 66
    :goto_0
    if-eqz v13, :cond_1

    iget-wide v0, v13, Lcom/mobnetic/coinguardian/model/Ticker;->last:D

    move-wide/from16 v16, v0

    const-wide/high16 v18, -0x4010000000000000L    # -1.0

    cmpg-double v15, v16, v18

    if-gtz v15, :cond_3

    .line 67
    :cond_1
    const/4 v3, 0x0

    .line 69
    .local v3, "errorMsg":Ljava/lang/String;
    const/4 v15, 0x0

    :try_start_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mobnetic/coinguardian/volley/CheckerVolleyAsyncTask;->checkerInfo:Lcom/mobnetic/coinguardian/model/CheckerInfo;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-virtual {v5, v15, v12, v0}, Lcom/mobnetic/coinguardian/model/Market;->parseErrorMain(ILjava/lang/String;Lcom/mobnetic/coinguardian/model/CheckerInfo;)Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v3

    .line 73
    new-instance v13, Lcom/mobnetic/coinguardian/volley/CheckerErrorParsedError;

    .end local v13    # "ticker":Lcom/mobnetic/coinguardian/model/Ticker;
    invoke-direct {v13, v3}, Lcom/mobnetic/coinguardian/volley/CheckerErrorParsedError;-><init>(Ljava/lang/String;)V

    .line 93
    .end local v3    # "errorMsg":Ljava/lang/String;
    :cond_2
    :goto_1
    return-object v13

    .line 70
    .restart local v3    # "errorMsg":Ljava/lang/String;
    .restart local v13    # "ticker":Lcom/mobnetic/coinguardian/model/Ticker;
    :catch_0
    move-exception v2

    .line 71
    .local v2, "e":Ljava/lang/Exception;
    new-instance v13, Lcom/android/volley/ParseError;

    .end local v13    # "ticker":Lcom/mobnetic/coinguardian/model/Ticker;
    invoke-direct {v13, v2}, Lcom/android/volley/ParseError;-><init>(Ljava/lang/Throwable;)V

    goto :goto_1

    .line 76
    .end local v2    # "e":Ljava/lang/Exception;
    .end local v3    # "errorMsg":Ljava/lang/String;
    .restart local v13    # "ticker":Lcom/mobnetic/coinguardian/model/Ticker;
    :cond_3
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mobnetic/coinguardian/volley/CheckerVolleyAsyncTask;->checkerInfo:Lcom/mobnetic/coinguardian/model/CheckerInfo;

    invoke-virtual {v5, v15}, Lcom/mobnetic/coinguardian/model/Market;->getNumOfRequests(Lcom/mobnetic/coinguardian/model/CheckerInfo;)I

    move-result v9

    .line 77
    .local v9, "numOfRequests":I
    invoke-virtual/range {p0 .. p0}, Lcom/mobnetic/coinguardian/volley/CheckerVolleyAsyncTask;->isCancelled()Z

    move-result v15

    if-nez v15, :cond_2

    const/4 v15, 0x1

    if-le v9, v15, :cond_2

    .line 78
    const/4 v11, 0x1

    .local v11, "requestId":I
    :goto_2
    if-ge v11, v9, :cond_2

    .line 80
    :try_start_2
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mobnetic/coinguardian/volley/CheckerVolleyAsyncTask;->checkerInfo:Lcom/mobnetic/coinguardian/model/CheckerInfo;

    invoke-virtual {v5, v11, v15}, Lcom/mobnetic/coinguardian/model/Market;->getUrl(ILcom/mobnetic/coinguardian/model/CheckerInfo;)Ljava/lang/String;

    move-result-object v8

    .line 81
    .local v8, "nextUrl":Ljava/lang/String;
    invoke-virtual/range {p0 .. p0}, Lcom/mobnetic/coinguardian/volley/CheckerVolleyAsyncTask;->isCancelled()Z

    move-result v15

    if-nez v15, :cond_4

    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v15

    if-nez v15, :cond_4

    .line 82
    invoke-static {}, Lcom/android/volley/toolbox/RequestFuture;->newFuture()Lcom/android/volley/toolbox/RequestFuture;

    move-result-object v6

    .line 83
    .local v6, "nextFuture":Lcom/android/volley/toolbox/RequestFuture;, "Lcom/android/volley/toolbox/RequestFuture<Ljava/lang/String;>;"
    new-instance v10, Lcom/mobnetic/coinguardian/volley/generic/GzipVolleyStringRequest;

    invoke-direct {v10, v8, v6, v6}, Lcom/mobnetic/coinguardian/volley/generic/GzipVolleyStringRequest;-><init>(Ljava/lang/String;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;)V

    .line 84
    .restart local v10    # "request":Lcom/mobnetic/coinguardian/volley/generic/GzipVolleyStringRequest;
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mobnetic/coinguardian/volley/CheckerVolleyAsyncTask;->requestQueue:Lcom/android/volley/RequestQueue;

    invoke-virtual {v15, v10}, Lcom/android/volley/RequestQueue;->add(Lcom/android/volley/Request;)Lcom/android/volley/Request;

    .line 85
    invoke-virtual {v6}, Lcom/android/volley/toolbox/RequestFuture;->get()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    .line 86
    .local v7, "nextResponse":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mobnetic/coinguardian/volley/CheckerVolleyAsyncTask;->checkerInfo:Lcom/mobnetic/coinguardian/model/CheckerInfo;

    invoke-virtual {v5, v11, v7, v13, v15}, Lcom/mobnetic/coinguardian/model/Market;->parseTickerMain(ILjava/lang/String;Lcom/mobnetic/coinguardian/model/Ticker;Lcom/mobnetic/coinguardian/model/CheckerInfo;)Lcom/mobnetic/coinguardian/model/Ticker;
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_1

    .line 78
    .end local v6    # "nextFuture":Lcom/android/volley/toolbox/RequestFuture;, "Lcom/android/volley/toolbox/RequestFuture<Ljava/lang/String;>;"
    .end local v7    # "nextResponse":Ljava/lang/String;
    .end local v8    # "nextUrl":Ljava/lang/String;
    .end local v10    # "request":Lcom/mobnetic/coinguardian/volley/generic/GzipVolleyStringRequest;
    :cond_4
    :goto_3
    add-int/lit8 v11, v11, 0x1

    goto :goto_2

    .line 88
    :catch_1
    move-exception v2

    .line 89
    .local v2, "e":Ljava/lang/Throwable;
    invoke-virtual {v2}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_3

    .line 64
    .end local v2    # "e":Ljava/lang/Throwable;
    .end local v9    # "numOfRequests":I
    .end local v11    # "requestId":I
    :catch_2
    move-exception v15

    goto :goto_0
.end method

.method public getCheckerRecordId()J
    .locals 2

    .prologue
    .line 36
    iget-object v0, p0, Lcom/mobnetic/coinguardian/volley/CheckerVolleyAsyncTask;->checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mobnetic/coinguardian/volley/CheckerVolleyAsyncTask;->checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    invoke-virtual {v0}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getId()J

    move-result-wide v0

    :goto_0
    return-wide v0

    :cond_0
    const-wide/16 v0, -0x1

    goto :goto_0
.end method

.method protected onCancelled()V
    .locals 1

    .prologue
    .line 105
    sget-object v0, Lcom/mobnetic/coinguardian/volley/CheckerVolleyAsyncTask;->CHECKERS_TASKS:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    .line 106
    sget-object v0, Lcom/mobnetic/coinguardian/volley/CheckerVolleyAsyncTask;->CHECKERS_TASKS:Ljava/util/ArrayList;

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 107
    :cond_0
    invoke-super {p0}, Lcom/mobnetic/coinguardian/volley/generic/GenericVolleyAsyncTask;->onCancelled()V

    .line 108
    return-void
.end method

.method protected onPostExecute(Ljava/lang/Object;)V
    .locals 1
    .param p1, "result"    # Ljava/lang/Object;

    .prologue
    .line 98
    sget-object v0, Lcom/mobnetic/coinguardian/volley/CheckerVolleyAsyncTask;->CHECKERS_TASKS:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    .line 99
    sget-object v0, Lcom/mobnetic/coinguardian/volley/CheckerVolleyAsyncTask;->CHECKERS_TASKS:Ljava/util/ArrayList;

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 100
    :cond_0
    invoke-super {p0, p1}, Lcom/mobnetic/coinguardian/volley/generic/GenericVolleyAsyncTask;->onPostExecute(Ljava/lang/Object;)V

    .line 101
    return-void
.end method

.method protected onPreExecute()V
    .locals 1

    .prologue
    .line 41
    invoke-super {p0}, Lcom/mobnetic/coinguardian/volley/generic/GenericVolleyAsyncTask;->onPreExecute()V

    .line 42
    sget-object v0, Lcom/mobnetic/coinguardian/volley/CheckerVolleyAsyncTask;->CHECKERS_TASKS:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    .line 43
    sget-object v0, Lcom/mobnetic/coinguardian/volley/CheckerVolleyAsyncTask;->CHECKERS_TASKS:Ljava/util/ArrayList;

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 44
    :cond_0
    return-void
.end method
