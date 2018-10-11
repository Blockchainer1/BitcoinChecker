.class public Lcom/mobnetic/coinguardian/util/CheckErrorsUtils;
.super Ljava/lang/Object;
.source "CheckErrorsUtils.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final formatError(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "errorMsg"    # Ljava/lang/String;

    .prologue
    .line 38
    const v0, 0x7f070010

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    if-eqz p1, :cond_0

    .end local p1    # "errorMsg":Ljava/lang/String;
    :goto_0
    aput-object p1, v1, v2

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .restart local p1    # "errorMsg":Ljava/lang/String;
    :cond_0
    const-string p1, "UNKNOWN"

    goto :goto_0
.end method

.method public static final parseErrorMsg(Landroid/content/Context;Lcom/android/volley/VolleyError;)Ljava/lang/String;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "error"    # Lcom/android/volley/VolleyError;

    .prologue
    .line 17
    instance-of v0, p1, Lcom/mobnetic/coinguardian/volley/CheckerErrorParsedError;

    if-eqz v0, :cond_0

    move-object v0, p1

    check-cast v0, Lcom/mobnetic/coinguardian/volley/CheckerErrorParsedError;

    invoke-virtual {v0}, Lcom/mobnetic/coinguardian/volley/CheckerErrorParsedError;->getErrorMsg()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 18
    check-cast p1, Lcom/mobnetic/coinguardian/volley/CheckerErrorParsedError;

    .end local p1    # "error":Lcom/android/volley/VolleyError;
    invoke-virtual {p1}, Lcom/mobnetic/coinguardian/volley/CheckerErrorParsedError;->getErrorMsg()Ljava/lang/String;

    move-result-object v0

    .line 20
    :goto_0
    return-object v0

    .restart local p1    # "error":Lcom/android/volley/VolleyError;
    :cond_0
    invoke-static {p0, p1}, Lcom/mobnetic/coinguardian/util/CheckErrorsUtils;->parseVolleyErrorMsg(Landroid/content/Context;Lcom/android/volley/VolleyError;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static final parseVolleyErrorMsg(Landroid/content/Context;Lcom/android/volley/VolleyError;)Ljava/lang/String;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "error"    # Lcom/android/volley/VolleyError;

    .prologue
    .line 25
    instance-of v0, p1, Lcom/android/volley/NetworkError;

    if-eqz v0, :cond_0

    .line 26
    const v0, 0x7f070011

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 34
    :goto_0
    return-object v0

    .line 27
    :cond_0
    instance-of v0, p1, Lcom/android/volley/TimeoutError;

    if-eqz v0, :cond_1

    .line 28
    const v0, 0x7f070014

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 29
    :cond_1
    instance-of v0, p1, Lcom/android/volley/ServerError;

    if-eqz v0, :cond_2

    .line 30
    const v0, 0x7f070013

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 31
    :cond_2
    instance-of v0, p1, Lcom/android/volley/ParseError;

    if-eqz v0, :cond_3

    .line 32
    const v0, 0x7f070012

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 34
    :cond_3
    const v0, 0x7f070015

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method
