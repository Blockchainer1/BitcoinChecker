.class public abstract Lcom/mobnetic/coinguardian/volley/generic/GenericVolleyAsyncTask;
.super Landroid/os/AsyncTask;
.source "GenericVolleyAsyncTask.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# instance fields
.field private final errorListener:Lcom/android/volley/Response$ErrorListener;

.field private final listener:Lcom/android/volley/Response$Listener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/volley/Response$Listener",
            "<TT;>;"
        }
    .end annotation
.end field

.field protected final requestQueue:Lcom/android/volley/RequestQueue;


# direct methods
.method public constructor <init>(Lcom/android/volley/RequestQueue;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;)V
    .locals 0
    .param p1, "requestQueue"    # Lcom/android/volley/RequestQueue;
    .param p3, "errorListener"    # Lcom/android/volley/Response$ErrorListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/volley/RequestQueue;",
            "Lcom/android/volley/Response$Listener",
            "<TT;>;",
            "Lcom/android/volley/Response$ErrorListener;",
            ")V"
        }
    .end annotation

    .prologue
    .line 19
    .local p0, "this":Lcom/mobnetic/coinguardian/volley/generic/GenericVolleyAsyncTask;, "Lcom/mobnetic/coinguardian/volley/generic/GenericVolleyAsyncTask<TT;>;"
    .local p2, "listener":Lcom/android/volley/Response$Listener;, "Lcom/android/volley/Response$Listener<TT;>;"
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 20
    iput-object p1, p0, Lcom/mobnetic/coinguardian/volley/generic/GenericVolleyAsyncTask;->requestQueue:Lcom/android/volley/RequestQueue;

    .line 21
    iput-object p2, p0, Lcom/mobnetic/coinguardian/volley/generic/GenericVolleyAsyncTask;->listener:Lcom/android/volley/Response$Listener;

    .line 22
    iput-object p3, p0, Lcom/mobnetic/coinguardian/volley/generic/GenericVolleyAsyncTask;->errorListener:Lcom/android/volley/Response$ErrorListener;

    .line 23
    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 13
    .local p0, "this":Lcom/mobnetic/coinguardian/volley/generic/GenericVolleyAsyncTask;, "Lcom/mobnetic/coinguardian/volley/generic/GenericVolleyAsyncTask<TT;>;"
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/mobnetic/coinguardian/volley/generic/GenericVolleyAsyncTask;->doInBackground([Ljava/lang/Void;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method protected final varargs doInBackground([Ljava/lang/Void;)Ljava/lang/Object;
    .locals 2
    .param p1, "params"    # [Ljava/lang/Void;

    .prologue
    .line 30
    .local p0, "this":Lcom/mobnetic/coinguardian/volley/generic/GenericVolleyAsyncTask;, "Lcom/mobnetic/coinguardian/volley/generic/GenericVolleyAsyncTask<TT;>;"
    :try_start_0
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/volley/generic/GenericVolleyAsyncTask;->doNetworkInBackground()Ljava/lang/Object;
    :try_end_0
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v0

    .line 34
    :cond_0
    :goto_0
    return-object v0

    .line 31
    :catch_0
    move-exception v0

    .line 32
    .local v0, "e":Ljava/util/concurrent/ExecutionException;
    invoke-virtual {v0}, Ljava/util/concurrent/ExecutionException;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Ljava/util/concurrent/ExecutionException;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    goto :goto_0

    .line 33
    .end local v0    # "e":Ljava/util/concurrent/ExecutionException;
    :catch_1
    move-exception v0

    .line 34
    .local v0, "e":Ljava/lang/Throwable;
    goto :goto_0
.end method

.method protected abstract doNetworkInBackground()Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method

.method protected onPostExecute(Ljava/lang/Object;)V
    .locals 3
    .param p1, "result"    # Ljava/lang/Object;

    .prologue
    .line 41
    .local p0, "this":Lcom/mobnetic/coinguardian/volley/generic/GenericVolleyAsyncTask;, "Lcom/mobnetic/coinguardian/volley/generic/GenericVolleyAsyncTask<TT;>;"
    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onPostExecute(Ljava/lang/Object;)V

    .line 42
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/volley/generic/GenericVolleyAsyncTask;->isCancelled()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 60
    .end local p1    # "result":Ljava/lang/Object;
    :cond_0
    :goto_0
    return-void

    .line 45
    .restart local p1    # "result":Ljava/lang/Object;
    :cond_1
    if-eqz p1, :cond_0

    .line 46
    instance-of v1, p1, Ljava/lang/Throwable;

    if-eqz v1, :cond_3

    .line 47
    instance-of v1, p1, Lcom/android/volley/VolleyError;

    if-eqz v1, :cond_2

    .line 48
    iget-object v1, p0, Lcom/mobnetic/coinguardian/volley/generic/GenericVolleyAsyncTask;->errorListener:Lcom/android/volley/Response$ErrorListener;

    check-cast p1, Lcom/android/volley/VolleyError;

    .end local p1    # "result":Ljava/lang/Object;
    invoke-interface {v1, p1}, Lcom/android/volley/Response$ErrorListener;->onErrorResponse(Lcom/android/volley/VolleyError;)V

    goto :goto_0

    .line 50
    .restart local p1    # "result":Ljava/lang/Object;
    :cond_2
    iget-object v1, p0, Lcom/mobnetic/coinguardian/volley/generic/GenericVolleyAsyncTask;->errorListener:Lcom/android/volley/Response$ErrorListener;

    new-instance v2, Lcom/mobnetic/coinguardian/volley/UnknownVolleyError;

    check-cast p1, Ljava/lang/Throwable;

    .end local p1    # "result":Ljava/lang/Object;
    invoke-direct {v2, p1}, Lcom/mobnetic/coinguardian/volley/UnknownVolleyError;-><init>(Ljava/lang/Throwable;)V

    invoke-interface {v1, v2}, Lcom/android/volley/Response$ErrorListener;->onErrorResponse(Lcom/android/volley/VolleyError;)V

    goto :goto_0

    .line 54
    .restart local p1    # "result":Ljava/lang/Object;
    :cond_3
    :try_start_0
    iget-object v1, p0, Lcom/mobnetic/coinguardian/volley/generic/GenericVolleyAsyncTask;->listener:Lcom/android/volley/Response$Listener;

    invoke-interface {v1, p1}, Lcom/android/volley/Response$Listener;->onResponse(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 55
    :catch_0
    move-exception v0

    .line 56
    .local v0, "e":Ljava/lang/Throwable;
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_0
.end method
