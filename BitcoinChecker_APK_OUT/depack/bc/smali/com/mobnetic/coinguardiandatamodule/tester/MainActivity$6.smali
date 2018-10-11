.class Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity$6;
.super Lcom/mobnetic/coinguardiandatamodule/tester/volley/generic/ResponseErrorListener;
.source "MainActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->getNewResult()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;

.field final synthetic val$checkerInfo:Lcom/mobnetic/coinguardian/model/CheckerInfo;


# direct methods
.method constructor <init>(Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;Lcom/mobnetic/coinguardian/model/CheckerInfo;)V
    .locals 0
    .param p1, "this$0"    # Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;

    .prologue
    .line 252
    iput-object p1, p0, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity$6;->this$0:Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;

    iput-object p2, p0, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity$6;->val$checkerInfo:Lcom/mobnetic/coinguardian/model/CheckerInfo;

    invoke-direct {p0}, Lcom/mobnetic/coinguardiandatamodule/tester/volley/generic/ResponseErrorListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onErrorResponse(Ljava/lang/String;Ljava/util/Map;Lcom/android/volley/NetworkResponse;Ljava/lang/String;Lcom/android/volley/VolleyError;)V
    .locals 9
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
    .line 255
    .local p2, "requestHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-virtual {p5}, Lcom/android/volley/VolleyError;->printStackTrace()V

    .line 257
    const/4 v7, 0x0

    .line 258
    .local v7, "errorMsg":Ljava/lang/String;
    instance-of v0, p5, Lcom/mobnetic/coinguardiandatamodule/tester/volley/CheckerErrorParsedError;

    if-eqz v0, :cond_0

    move-object v0, p5

    .line 259
    check-cast v0, Lcom/mobnetic/coinguardiandatamodule/tester/volley/CheckerErrorParsedError;

    invoke-virtual {v0}, Lcom/mobnetic/coinguardiandatamodule/tester/volley/CheckerErrorParsedError;->getErrorMsg()Ljava/lang/String;

    move-result-object v7

    .line 262
    :cond_0
    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 263
    iget-object v0, p0, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity$6;->this$0:Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;

    invoke-static {v0, p5}, Lcom/mobnetic/coinguardiandatamodule/tester/util/CheckErrorsUtils;->parseVolleyErrorMsg(Landroid/content/Context;Lcom/android/volley/VolleyError;)Ljava/lang/String;

    move-result-object v7

    .line 265
    :cond_1
    iget-object v0, p0, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity$6;->this$0:Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;

    iget-object v1, p0, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity$6;->val$checkerInfo:Lcom/mobnetic/coinguardian/model/CheckerInfo;

    const/4 v2, 0x0

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    move-object v6, p4

    move-object v8, p5

    invoke-static/range {v0 .. v8}, Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;->access$600(Lcom/mobnetic/coinguardiandatamodule/tester/MainActivity;Lcom/mobnetic/coinguardian/model/CheckerInfo;Lcom/mobnetic/coinguardian/model/Ticker;Ljava/lang/String;Ljava/util/Map;Lcom/android/volley/NetworkResponse;Ljava/lang/String;Ljava/lang/String;Lcom/android/volley/VolleyError;)V

    .line 266
    return-void
.end method
