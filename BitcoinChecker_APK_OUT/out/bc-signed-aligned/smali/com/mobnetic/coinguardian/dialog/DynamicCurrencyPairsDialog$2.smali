.class Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog$2;
.super Ljava/lang/Object;
.source "DynamicCurrencyPairsDialog.java"

# interfaces
.implements Lcom/android/volley/Response$Listener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;->startRefreshing()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/android/volley/Response$Listener",
        "<",
        "Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;


# direct methods
.method constructor <init>(Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;)V
    .locals 0
    .param p1, "this$0"    # Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;

    .prologue
    .line 80
    iput-object p1, p0, Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog$2;->this$0:Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onResponse(Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;)V
    .locals 2
    .param p1, "currencyPairsMapHelper"    # Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;

    .prologue
    const/4 v1, 0x0

    .line 83
    iget-object v0, p0, Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog$2;->this$0:Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;

    invoke-static {v0, v1}, Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;->access$102(Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;Lcom/mobnetic/coinguardian/volley/DynamicCurrencyPairsVolleyAsyncTask;)Lcom/mobnetic/coinguardian/volley/DynamicCurrencyPairsVolleyAsyncTask;

    .line 84
    iget-object v0, p0, Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog$2;->this$0:Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;

    invoke-static {v0, p1}, Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;->access$202(Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;)Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;

    .line 85
    iget-object v0, p0, Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog$2;->this$0:Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;

    invoke-static {v0, v1}, Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;->access$300(Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;Ljava/lang/String;)V

    .line 86
    iget-object v0, p0, Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog$2;->this$0:Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;

    invoke-virtual {v0}, Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;->stopRefreshingAnim()V

    .line 87
    iget-object v0, p0, Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog$2;->this$0:Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;

    iget-object v1, p0, Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog$2;->this$0:Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;

    invoke-static {v1}, Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;->access$400(Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;)Lcom/mobnetic/coinguardian/model/Market;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;->onPairsUpdated(Lcom/mobnetic/coinguardian/model/Market;Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;)V

    .line 88
    return-void
.end method

.method public bridge synthetic onResponse(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 80
    check-cast p1, Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;

    invoke-virtual {p0, p1}, Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog$2;->onResponse(Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;)V

    return-void
.end method
