.class Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog$3;
.super Ljava/lang/Object;
.source "DynamicCurrencyPairsDialog.java"

# interfaces
.implements Lcom/android/volley/Response$ErrorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;->startRefreshing()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;


# direct methods
.method constructor <init>(Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;)V
    .locals 0
    .param p1, "this$0"    # Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;

    .prologue
    .line 89
    iput-object p1, p0, Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog$3;->this$0:Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onErrorResponse(Lcom/android/volley/VolleyError;)V
    .locals 2
    .param p1, "error"    # Lcom/android/volley/VolleyError;

    .prologue
    .line 92
    iget-object v0, p0, Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog$3;->this$0:Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;->access$102(Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;Lcom/mobnetic/coinguardian/volley/DynamicCurrencyPairsVolleyAsyncTask;)Lcom/mobnetic/coinguardian/volley/DynamicCurrencyPairsVolleyAsyncTask;

    .line 93
    invoke-virtual {p1}, Lcom/android/volley/VolleyError;->printStackTrace()V

    .line 94
    iget-object v0, p0, Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog$3;->this$0:Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;

    iget-object v1, p0, Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog$3;->this$0:Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;

    invoke-virtual {v1}, Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1, p1}, Lcom/mobnetic/coinguardian/util/CheckErrorsUtils;->parseErrorMsg(Landroid/content/Context;Lcom/android/volley/VolleyError;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;->access$300(Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;Ljava/lang/String;)V

    .line 95
    iget-object v0, p0, Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog$3;->this$0:Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;

    invoke-virtual {v0}, Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;->stopRefreshingAnim()V

    .line 96
    return-void
.end method
