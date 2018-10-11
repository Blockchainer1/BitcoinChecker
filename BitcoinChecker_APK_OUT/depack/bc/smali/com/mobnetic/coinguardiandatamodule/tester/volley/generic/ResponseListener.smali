.class public abstract Lcom/mobnetic/coinguardiandatamodule/tester/volley/generic/ResponseListener;
.super Ljava/lang/Object;
.source "ResponseListener.java"

# interfaces
.implements Lcom/android/volley/Response$Listener;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/android/volley/Response$Listener",
        "<TT;>;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 8
    .local p0, "this":Lcom/mobnetic/coinguardiandatamodule/tester/volley/generic/ResponseListener;, "Lcom/mobnetic/coinguardiandatamodule/tester/volley/generic/ResponseListener<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onResponse(Ljava/lang/Object;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/mobnetic/coinguardiandatamodule/tester/volley/generic/ResponseListener;, "Lcom/mobnetic/coinguardiandatamodule/tester/volley/generic/ResponseListener<TT;>;"
    .local p1, "response":Ljava/lang/Object;, "TT;"
    const/4 v1, 0x0

    .line 14
    move-object v0, p0

    move-object v2, v1

    move-object v3, v1

    move-object v4, v1

    move-object v5, p1

    invoke-virtual/range {v0 .. v5}, Lcom/mobnetic/coinguardiandatamodule/tester/volley/generic/ResponseListener;->onResponse(Ljava/lang/String;Ljava/util/Map;Lcom/android/volley/NetworkResponse;Ljava/lang/String;Ljava/lang/Object;)V

    .line 15
    return-void
.end method

.method public abstract onResponse(Ljava/lang/String;Ljava/util/Map;Lcom/android/volley/NetworkResponse;Ljava/lang/String;Ljava/lang/Object;)V
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
            "TT;)V"
        }
    .end annotation
.end method
