.class public abstract Lcom/mobnetic/coinguardiandatamodule/tester/volley/generic/ResponseErrorListener;
.super Ljava/lang/Object;
.source "ResponseErrorListener.java"

# interfaces
.implements Lcom/android/volley/Response$ErrorListener;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onErrorResponse(Lcom/android/volley/VolleyError;)V
    .locals 6
    .param p1, "error"    # Lcom/android/volley/VolleyError;

    .prologue
    const/4 v1, 0x0

    .line 15
    move-object v0, p0

    move-object v2, v1

    move-object v3, v1

    move-object v4, v1

    move-object v5, p1

    invoke-virtual/range {v0 .. v5}, Lcom/mobnetic/coinguardiandatamodule/tester/volley/generic/ResponseErrorListener;->onErrorResponse(Ljava/lang/String;Ljava/util/Map;Lcom/android/volley/NetworkResponse;Ljava/lang/String;Lcom/android/volley/VolleyError;)V

    .line 16
    return-void
.end method

.method public abstract onErrorResponse(Ljava/lang/String;Ljava/util/Map;Lcom/android/volley/NetworkResponse;Ljava/lang/String;Lcom/android/volley/VolleyError;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lcom/android/volley/NetworkResponse;",
            "Ljava/lang/String;",
            "Lcom/android/volley/VolleyError;",
            ")V"
        }
    .end annotation
.end method
