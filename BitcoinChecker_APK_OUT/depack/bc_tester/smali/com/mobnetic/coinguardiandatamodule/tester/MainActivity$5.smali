.class Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity$5;
.super Lcom/mobnetic/coinguardiandatamodule/tester/volley/generic/ResponseListener;
.source "MainActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->getNewResult()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/mobnetic/coinguardiandatamodule/tester/volley/generic/ResponseListener",
        "<",
        "Lcom/mobnetic/coinguardiandatamodule/tester/volley/CheckerVolleyMainRequest$TickerWrapper;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;

.field final synthetic val$checkerInfo:Lcom/mobnetic/coinguardian/model/CheckerInfo;


# direct methods
.method constructor <init>(Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;Lcom/mobnetic/coinguardian/model/CheckerInfo;)V
    .locals 0
    .param p1, "this$0"    # Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;

    .prologue
    .line 247
    iput-object p1, p0, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity$5;->this$0:Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;

    iput-object p2, p0, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity$5;->val$checkerInfo:Lcom/mobnetic/coinguardian/model/CheckerInfo;

    invoke-direct {p0}, Lcom/mobnetic/coinguardiandatamodule/tester/volley/generic/ResponseListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onResponse(Ljava/lang/String;Ljava/util/Map;Lcom/android/volley/NetworkResponse;Ljava/lang/String;Lcom/mobnetic/coinguardiandatamodule/tester/volley/CheckerVolleyMainRequest$TickerWrapper;)V
    .locals 9
    .param p1, "url"    # Ljava/lang/String;
    .param p3, "networkResponse"    # Lcom/android/volley/NetworkResponse;
    .param p4, "responseString"    # Ljava/lang/String;
    .param p5, "tickerWrapper"    # Lcom/mobnetic/coinguardiandatamodule/tester/volley/CheckerVolleyMainRequest$TickerWrapper;
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
            "Lcom/mobnetic/coinguardiandatamodule/tester/volley/CheckerVolleyMainRequest$TickerWrapper;",
            ")V"
        }
    .end annotation

    .prologue
    .local p2, "requestHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const/4 v7, 0x0

    .line 250
    iget-object v0, p0, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity$5;->this$0:Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;

    iget-object v1, p0, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity$5;->val$checkerInfo:Lcom/mobnetic/coinguardian/model/CheckerInfo;

    iget-object v2, p5, Lcom/mobnetic/coinguardiandatamodule/tester/volley/CheckerVolleyMainRequest$TickerWrapper;->ticker:Lcom/mobnetic/coinguardian/model/Ticker;

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    move-object v6, p4

    move-object v8, v7

    invoke-static/range {v0 .. v8}, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->access$600(Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;Lcom/mobnetic/coinguardian/model/CheckerInfo;Lcom/mobnetic/coinguardian/model/Ticker;Ljava/lang/String;Ljava/util/Map;Lcom/android/volley/NetworkResponse;Ljava/lang/String;Ljava/lang/String;Lcom/android/volley/VolleyError;)V

    .line 251
    return-void
.end method

.method public bridge synthetic onResponse(Ljava/lang/String;Ljava/util/Map;Lcom/android/volley/NetworkResponse;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 6

    .prologue
    .line 247
    move-object v5, p5

    check-cast v5, Lcom/mobnetic/coinguardiandatamodule/tester/volley/CheckerVolleyMainRequest$TickerWrapper;

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    invoke-virtual/range {v0 .. v5}, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity$5;->onResponse(Ljava/lang/String;Ljava/util/Map;Lcom/android/volley/NetworkResponse;Ljava/lang/String;Lcom/mobnetic/coinguardiandatamodule/tester/volley/CheckerVolleyMainRequest$TickerWrapper;)V

    return-void
.end method
