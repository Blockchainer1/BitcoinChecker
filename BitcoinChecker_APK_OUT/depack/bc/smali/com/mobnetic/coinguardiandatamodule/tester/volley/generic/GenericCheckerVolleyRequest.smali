.class public abstract Lcom/mobnetic/coinguardiandatamodule/tester/volley/generic/GenericCheckerVolleyRequest;
.super Lcom/mobnetic/coinguardiandatamodule/tester/volley/generic/GzipVolleyRequest;
.source "GenericCheckerVolleyRequest.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/mobnetic/coinguardiandatamodule/tester/volley/generic/GzipVolleyRequest",
        "<TT;>;"
    }
.end annotation


# instance fields
.field protected final checkerInfo:Lcom/mobnetic/coinguardian/model/CheckerInfo;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/mobnetic/coinguardian/model/CheckerInfo;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;)V
    .locals 0
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "checkerInfo"    # Lcom/mobnetic/coinguardian/model/CheckerInfo;
    .param p4, "errorListener"    # Lcom/android/volley/Response$ErrorListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/mobnetic/coinguardian/model/CheckerInfo;",
            "Lcom/android/volley/Response$Listener",
            "<TT;>;",
            "Lcom/android/volley/Response$ErrorListener;",
            ")V"
        }
    .end annotation

    .prologue
    .line 12
    .local p0, "this":Lcom/mobnetic/coinguardiandatamodule/tester/volley/generic/GenericCheckerVolleyRequest;, "Lcom/mobnetic/coinguardiandatamodule/tester/volley/generic/GenericCheckerVolleyRequest<TT;>;"
    .local p3, "listener":Lcom/android/volley/Response$Listener;, "Lcom/android/volley/Response$Listener<TT;>;"
    invoke-direct {p0, p1, p3, p4}, Lcom/mobnetic/coinguardiandatamodule/tester/volley/generic/GzipVolleyRequest;-><init>(Ljava/lang/String;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;)V

    .line 14
    iput-object p2, p0, Lcom/mobnetic/coinguardiandatamodule/tester/volley/generic/GenericCheckerVolleyRequest;->checkerInfo:Lcom/mobnetic/coinguardian/model/CheckerInfo;

    .line 15
    return-void
.end method
