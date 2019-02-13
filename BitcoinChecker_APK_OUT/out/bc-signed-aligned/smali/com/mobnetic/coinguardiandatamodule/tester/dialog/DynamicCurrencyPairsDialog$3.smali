.class Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog$3;
.super Lcom/mobnetic/coinguardiandatamodule/tester/volley/generic/ResponseErrorListener;
.source "DynamicCurrencyPairsDialog.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog;->startRefreshing()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog;


# direct methods
.method constructor <init>(Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog;)V
    .locals 0
    .param p1, "this$0"    # Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog;

    .prologue
    .line 82
    iput-object p1, p0, Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog$3;->this$0:Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog;

    invoke-direct {p0}, Lcom/mobnetic/coinguardiandatamodule/tester/volley/generic/ResponseErrorListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onErrorResponse(Ljava/lang/String;Ljava/util/Map;Lcom/android/volley/NetworkResponse;Ljava/lang/String;Lcom/android/volley/VolleyError;)V
    .locals 7
    .param p1, "url"    # Ljava/lang/String;
    .param p3, "networkResponse"    # Lcom/android/volley/NetworkResponse;
    .param p4, "responseString"    # Ljava/lang/String;
    .param p5, "error"    # Lcom/android/volley/VolleyError;
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

    .prologue
    .line 85
    .local p2, "requestHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-virtual {p5}, Lcom/android/volley/VolleyError;->printStackTrace()V

    .line 86
    iget-object v0, p0, Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog$3;->this$0:Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog;

    iget-object v1, p0, Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog$3;->this$0:Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog;

    invoke-virtual {v1}, Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1, p5}, Lcom/mobnetic/coinguardiandatamodule/tester/util/CheckErrorsUtils;->parseVolleyErrorMsg(Landroid/content/Context;Lcom/android/volley/VolleyError;)Ljava/lang/String;

    move-result-object v5

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v6, p5

    invoke-static/range {v0 .. v6}, Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog;->access$200(Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog;Ljava/lang/String;Ljava/util/Map;Lcom/android/volley/NetworkResponse;Ljava/lang/String;Ljava/lang/String;Lcom/android/volley/VolleyError;)V

    .line 87
    iget-object v0, p0, Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog$3;->this$0:Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog;

    invoke-virtual {v0}, Lcom/mobnetic/coinguardiandatamodule/tester/dialog/DynamicCurrencyPairsDialog;->stopRefreshingAnim()V

    .line 88
    return-void
.end method
