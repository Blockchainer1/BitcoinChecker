.class final Lcom/mobnetic/coinguardian/receiver/MarketChecker$3;
.super Ljava/lang/Object;
.source "MarketChecker.java"

# interfaces
.implements Lcom/android/volley/Response$ErrorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mobnetic/coinguardian/receiver/MarketChecker;->checkMarketAsyncForCheckerRecord(Landroid/content/Context;Lcom/mobnetic/coinguardian/db/content/CheckerRecord;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$appContext:Landroid/content/Context;

.field final synthetic val$checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;


# direct methods
.method constructor <init>(Landroid/content/Context;Lcom/mobnetic/coinguardian/db/content/CheckerRecord;)V
    .locals 0

    .prologue
    .line 182
    iput-object p1, p0, Lcom/mobnetic/coinguardian/receiver/MarketChecker$3;->val$appContext:Landroid/content/Context;

    iput-object p2, p0, Lcom/mobnetic/coinguardian/receiver/MarketChecker$3;->val$checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onErrorResponse(Lcom/android/volley/VolleyError;)V
    .locals 4
    .param p1, "error"    # Lcom/android/volley/VolleyError;

    .prologue
    .line 185
    invoke-virtual {p1}, Lcom/android/volley/VolleyError;->printStackTrace()V

    .line 186
    instance-of v1, p1, Lcom/android/volley/NetworkError;

    if-eqz v1, :cond_0

    .line 191
    :goto_0
    return-void

    .line 189
    :cond_0
    iget-object v1, p0, Lcom/mobnetic/coinguardian/receiver/MarketChecker$3;->val$appContext:Landroid/content/Context;

    invoke-static {v1, p1}, Lcom/mobnetic/coinguardian/util/CheckErrorsUtils;->parseErrorMsg(Landroid/content/Context;Lcom/android/volley/VolleyError;)Ljava/lang/String;

    move-result-object v0

    .line 190
    .local v0, "errorMsg":Ljava/lang/String;
    iget-object v1, p0, Lcom/mobnetic/coinguardian/receiver/MarketChecker$3;->val$appContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/mobnetic/coinguardian/receiver/MarketChecker$3;->val$checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    const/4 v3, 0x0

    invoke-static {v1, v2, v3, v0}, Lcom/mobnetic/coinguardian/receiver/MarketChecker;->access$000(Landroid/content/Context;Lcom/mobnetic/coinguardian/db/content/CheckerRecord;Lcom/mobnetic/coinguardian/model/Ticker;Ljava/lang/String;)V

    goto :goto_0
.end method
