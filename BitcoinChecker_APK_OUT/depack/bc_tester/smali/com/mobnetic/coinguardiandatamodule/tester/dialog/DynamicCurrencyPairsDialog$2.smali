.class Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog$2;
.super Lcom/mobnetic/coinguardiandatamodule/tester/volley/generic/ResponseListener;
.source "DynamicCurrencyPairsDialog.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog;->startRefreshing()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/mobnetic/coinguardiandatamodule/tester/volley/generic/ResponseListener",
        "<",
        "Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog;


# direct methods
.method constructor <init>(Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog;)V
    .locals 0
    .param p1, "this$0"    # Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog;

    .prologue
    .line 73
    iput-object p1, p0, Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog$2;->this$0:Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog;

    invoke-direct {p0}, Lcom/mobnetic/coinguardiandatamodule/tester/volley/generic/ResponseListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onResponse(Ljava/lang/String;Ljava/util/Map;Lcom/android/volley/NetworkResponse;Ljava/lang/String;Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;)V
    .locals 7
    .param p1, "url"    # Ljava/lang/String;
    .param p3, "networkResponse"    # Lcom/android/volley/NetworkResponse;
    .param p4, "responseString"    # Ljava/lang/String;
    .param p5, "currencyPairsMapHelper"    # Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;
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
            "Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;",
            ")V"
        }
    .end annotation

    .prologue
    .local p2, "requestHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const/4 v5, 0x0

    .line 76
    iget-object v0, p0, Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog$2;->this$0:Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog;

    invoke-static {v0, p5}, Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog;->access$102(Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog;Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;)Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;

    .line 77
    iget-object v0, p0, Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog$2;->this$0:Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog;

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v6, v5

    invoke-static/range {v0 .. v6}, Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog;->access$200(Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog;Ljava/lang/String;Ljava/util/Map;Lcom/android/volley/NetworkResponse;Ljava/lang/String;Ljava/lang/String;Lcom/android/volley/VolleyError;)V

    .line 78
    iget-object v0, p0, Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog$2;->this$0:Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog;

    invoke-virtual {v0}, Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog;->stopRefreshingAnim()V

    .line 79
    iget-object v0, p0, Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog$2;->this$0:Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog;

    iget-object v1, p0, Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog$2;->this$0:Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog;

    invoke-static {v1}, Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog;->access$300(Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog;)Lcom/mobnetic/coinguardian/model/Market;

    move-result-object v1

    invoke-virtual {v0, v1, p5}, Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog;->onPairsUpdated(Lcom/mobnetic/coinguardian/model/Market;Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;)V

    .line 81
    return-void
.end method

.method public bridge synthetic onResponse(Ljava/lang/String;Ljava/util/Map;Lcom/android/volley/NetworkResponse;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 6

    .prologue
    .line 73
    move-object v5, p5

    check-cast v5, Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    invoke-virtual/range {v0 .. v5}, Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog$2;->onResponse(Ljava/lang/String;Ljava/util/Map;Lcom/android/volley/NetworkResponse;Ljava/lang/String;Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;)V

    return-void
.end method
