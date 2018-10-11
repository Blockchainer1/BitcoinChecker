.class public Lcom/mobnetic/coinguardiandatamodule/tester/util/HttpsHelper;
.super Ljava/lang/Object;
.source "HttpsHelper.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getMySSLSocketFactory()Ljavax/net/ssl/SSLSocketFactory;
    .locals 7

    .prologue
    const/4 v3, 0x0

    .line 23
    :try_start_0
    const-string v4, "TLS"

    invoke-static {v4}, Ljavax/net/ssl/SSLContext;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/SSLContext;

    move-result-object v1

    .line 24
    .local v1, "sslContext":Ljavax/net/ssl/SSLContext;
    new-instance v2, Lcom/mobnetic/coinguardiandatamodule/tester/util/HttpsHelper$1;

    invoke-direct {v2}, Lcom/mobnetic/coinguardiandatamodule/tester/util/HttpsHelper$1;-><init>()V

    .line 44
    .local v2, "tm":Ljavax/net/ssl/TrustManager;
    const/4 v4, 0x0

    const/4 v5, 0x1

    new-array v5, v5, [Ljavax/net/ssl/TrustManager;

    const/4 v6, 0x0

    aput-object v2, v5, v6

    const/4 v6, 0x0

    invoke-virtual {v1, v4, v5, v6}, Ljavax/net/ssl/SSLContext;->init([Ljavax/net/ssl/KeyManager;[Ljavax/net/ssl/TrustManager;Ljava/security/SecureRandom;)V

    .line 45
    invoke-virtual {v1}, Ljavax/net/ssl/SSLContext;->getSocketFactory()Ljavax/net/ssl/SSLSocketFactory;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 48
    .end local v2    # "tm":Ljavax/net/ssl/TrustManager;
    :goto_0
    return-object v3

    .line 46
    :catch_0
    move-exception v0

    .line 47
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public static final newRequestQueue(Landroid/content/Context;)Lcom/android/volley/RequestQueue;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 18
    new-instance v0, Lcom/android/volley/toolbox/HurlStack;

    const/4 v1, 0x0

    invoke-static {}, Lcom/mobnetic/coinguardiandatamodule/tester/util/HttpsHelper;->getMySSLSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/android/volley/toolbox/HurlStack;-><init>(Lcom/android/volley/toolbox/HurlStack$UrlRewriter;Ljavax/net/ssl/SSLSocketFactory;)V

    invoke-static {p0, v0}, Lcom/android/volley/toolbox/Volley;->newRequestQueue(Landroid/content/Context;Lcom/android/volley/toolbox/HttpStack;)Lcom/android/volley/RequestQueue;

    move-result-object v0

    return-object v0
.end method
