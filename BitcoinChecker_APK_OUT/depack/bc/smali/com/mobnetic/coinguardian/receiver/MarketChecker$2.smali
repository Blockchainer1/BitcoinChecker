.class final Lcom/mobnetic/coinguardian/receiver/MarketChecker$2;
.super Ljava/lang/Object;
.source "MarketChecker.java"

# interfaces
.implements Lcom/android/volley/Response$Listener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mobnetic/coinguardian/receiver/MarketChecker;->checkMarketAsyncForCheckerRecord(Landroid/content/Context;Lcom/mobnetic/coinguardian/db/content/CheckerRecord;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/android/volley/Response$Listener",
        "<",
        "Lcom/mobnetic/coinguardian/model/Ticker;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic val$appContext:Landroid/content/Context;

.field final synthetic val$checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;


# direct methods
.method constructor <init>(Landroid/content/Context;Lcom/mobnetic/coinguardian/db/content/CheckerRecord;)V
    .locals 0

    .prologue
    .line 177
    iput-object p1, p0, Lcom/mobnetic/coinguardian/receiver/MarketChecker$2;->val$appContext:Landroid/content/Context;

    iput-object p2, p0, Lcom/mobnetic/coinguardian/receiver/MarketChecker$2;->val$checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onResponse(Lcom/mobnetic/coinguardian/model/Ticker;)V
    .locals 3
    .param p1, "ticker"    # Lcom/mobnetic/coinguardian/model/Ticker;

    .prologue
    .line 180
    iget-object v0, p0, Lcom/mobnetic/coinguardian/receiver/MarketChecker$2;->val$appContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/mobnetic/coinguardian/receiver/MarketChecker$2;->val$checkerRecord:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    const/4 v2, 0x0

    invoke-static {v0, v1, p1, v2}, Lcom/mobnetic/coinguardian/receiver/MarketChecker;->access$000(Landroid/content/Context;Lcom/mobnetic/coinguardian/db/content/CheckerRecord;Lcom/mobnetic/coinguardian/model/Ticker;Ljava/lang/String;)V

    .line 181
    return-void
.end method

.method public bridge synthetic onResponse(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 177
    check-cast p1, Lcom/mobnetic/coinguardian/model/Ticker;

    invoke-virtual {p0, p1}, Lcom/mobnetic/coinguardian/receiver/MarketChecker$2;->onResponse(Lcom/mobnetic/coinguardian/model/Ticker;)V

    return-void
.end method
