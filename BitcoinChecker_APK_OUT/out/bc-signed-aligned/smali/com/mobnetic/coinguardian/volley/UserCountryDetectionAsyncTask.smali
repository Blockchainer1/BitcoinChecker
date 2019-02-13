.class public Lcom/mobnetic/coinguardian/volley/UserCountryDetectionAsyncTask;
.super Landroid/os/AsyncTask;
.source "UserCountryDetectionAsyncTask.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field private final appContext:Landroid/content/Context;

.field private final requestQueue:Lcom/android/volley/RequestQueue;


# direct methods
.method private constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 25
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 26
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/mobnetic/coinguardian/volley/UserCountryDetectionAsyncTask;->appContext:Landroid/content/Context;

    .line 27
    invoke-static {p1}, Lcom/mobnetic/coinguardian/util/HttpsHelper;->newRequestQueue(Landroid/content/Context;)Lcom/android/volley/RequestQueue;

    move-result-object v0

    iput-object v0, p0, Lcom/mobnetic/coinguardian/volley/UserCountryDetectionAsyncTask;->requestQueue:Lcom/android/volley/RequestQueue;

    .line 28
    return-void
.end method

.method private getCountryCodeFromInternet()Ljava/lang/String;
    .locals 9

    .prologue
    .line 67
    :try_start_0
    invoke-static {}, Lcom/android/volley/toolbox/RequestFuture;->newFuture()Lcom/android/volley/toolbox/RequestFuture;

    move-result-object v1

    .line 68
    .local v1, "future":Lcom/android/volley/toolbox/RequestFuture;, "Lcom/android/volley/toolbox/RequestFuture<Ljava/lang/String;>;"
    new-instance v2, Lcom/mobnetic/coinguardian/volley/generic/GzipVolleyStringRequest;

    const-string v5, "http://ip-api.com/json"

    invoke-direct {v2, v5, v1, v1}, Lcom/mobnetic/coinguardian/volley/generic/GzipVolleyStringRequest;-><init>(Ljava/lang/String;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;)V

    .line 69
    .local v2, "request":Lcom/mobnetic/coinguardian/volley/generic/GzipVolleyStringRequest;
    new-instance v5, Lcom/android/volley/DefaultRetryPolicy;

    const/16 v6, 0x1f40

    const/4 v7, 0x1

    const/high16 v8, 0x3f800000    # 1.0f

    invoke-direct {v5, v6, v7, v8}, Lcom/android/volley/DefaultRetryPolicy;-><init>(IIF)V

    invoke-virtual {v2, v5}, Lcom/mobnetic/coinguardian/volley/generic/GzipVolleyStringRequest;->setRetryPolicy(Lcom/android/volley/RetryPolicy;)Lcom/android/volley/Request;

    .line 70
    iget-object v5, p0, Lcom/mobnetic/coinguardian/volley/UserCountryDetectionAsyncTask;->requestQueue:Lcom/android/volley/RequestQueue;

    invoke-virtual {v5, v2}, Lcom/android/volley/RequestQueue;->add(Lcom/android/volley/Request;)Lcom/android/volley/Request;

    .line 71
    invoke-virtual {v1}, Lcom/android/volley/toolbox/RequestFuture;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 72
    .local v4, "responseString":Ljava/lang/String;
    if-eqz v4, :cond_0

    .line 73
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3, v4}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 74
    .local v3, "responseJsonObject":Lorg/json/JSONObject;
    const-string v5, "countryCode"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v5

    .line 79
    .end local v1    # "future":Lcom/android/volley/toolbox/RequestFuture;, "Lcom/android/volley/toolbox/RequestFuture<Ljava/lang/String;>;"
    .end local v2    # "request":Lcom/mobnetic/coinguardian/volley/generic/GzipVolleyStringRequest;
    .end local v3    # "responseJsonObject":Lorg/json/JSONObject;
    .end local v4    # "responseString":Ljava/lang/String;
    :goto_0
    return-object v5

    .line 76
    :catch_0
    move-exception v0

    .line 77
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 79
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_0
    const/4 v5, 0x0

    goto :goto_0
.end method

.method private getCountryCodeFromTelephonyNetwork()Ljava/lang/String;
    .locals 6

    .prologue
    const/4 v3, 0x0

    .line 54
    :try_start_0
    iget-object v4, p0, Lcom/mobnetic/coinguardian/volley/UserCountryDetectionAsyncTask;->appContext:Landroid/content/Context;

    const-string v5, "phone"

    invoke-virtual {v4, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/telephony/TelephonyManager;

    .line 55
    .local v2, "telephonyManager":Landroid/telephony/TelephonyManager;
    if-eqz v2, :cond_0

    .line 56
    invoke-virtual {v2}, Landroid/telephony/TelephonyManager;->getNetworkCountryIso()Ljava/lang/String;

    move-result-object v0

    .line 57
    .local v0, "countryIso":Ljava/lang/String;
    if-eqz v0, :cond_0

    sget-object v4, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v0, v4}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 62
    .end local v0    # "countryIso":Ljava/lang/String;
    .end local v2    # "telephonyManager":Landroid/telephony/TelephonyManager;
    :cond_0
    :goto_0
    return-object v3

    .line 59
    :catch_0
    move-exception v1

    .line 60
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method private getCountryCodeSystemLocale()Ljava/lang/String;
    .locals 5

    .prologue
    const/4 v3, 0x0

    .line 84
    :try_start_0
    iget-object v4, p0, Lcom/mobnetic/coinguardian/volley/UserCountryDetectionAsyncTask;->appContext:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v4

    iget-object v2, v4, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    .line 85
    .local v2, "locale":Ljava/util/Locale;
    if-eqz v2, :cond_2

    invoke-virtual {v2}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object v0

    .line 86
    .local v0, "country":Ljava/lang/String;
    :goto_0
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 87
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object v0

    .line 89
    :cond_0
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v4

    if-eqz v4, :cond_1

    move-object v0, v3

    .line 92
    .end local v0    # "country":Ljava/lang/String;
    .end local v2    # "locale":Ljava/util/Locale;
    :cond_1
    :goto_1
    return-object v0

    .restart local v2    # "locale":Ljava/util/Locale;
    :cond_2
    move-object v0, v3

    .line 85
    goto :goto_0

    .line 90
    .end local v2    # "locale":Ljava/util/Locale;
    :catch_0
    move-exception v1

    .line 91
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    move-object v0, v3

    .line 92
    goto :goto_1
.end method

.method public static setupUserCountry(Landroid/content/Context;)V
    .locals 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 97
    invoke-static {p0}, Lcom/mobnetic/coinguardian/util/PreferencesUtils;->getUserCountry(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 98
    .local v0, "userCountry":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 103
    :goto_0
    return-void

    .line 102
    :cond_0
    new-instance v1, Lcom/mobnetic/coinguardian/volley/UserCountryDetectionAsyncTask;

    invoke-direct {v1, p0}, Lcom/mobnetic/coinguardian/volley/UserCountryDetectionAsyncTask;-><init>(Landroid/content/Context;)V

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Void;

    invoke-static {v1, v2}, Lcom/mobnetic/coinguardian/util/AsyncTaskCompat;->execute(Landroid/os/AsyncTask;[Ljava/lang/Object;)V

    goto :goto_0
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 20
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/mobnetic/coinguardian/volley/UserCountryDetectionAsyncTask;->doInBackground([Ljava/lang/Void;)Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/lang/Void;
    .locals 1
    .param p1, "params"    # [Ljava/lang/Void;

    .prologue
    .line 32
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/volley/UserCountryDetectionAsyncTask;->updateUserRegion()Z

    .line 33
    const/4 v0, 0x0

    return-object v0
.end method

.method public updateUserRegion()Z
    .locals 2

    .prologue
    .line 37
    invoke-direct {p0}, Lcom/mobnetic/coinguardian/volley/UserCountryDetectionAsyncTask;->getCountryCodeFromTelephonyNetwork()Ljava/lang/String;

    move-result-object v0

    .line 39
    .local v0, "userCountry":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 40
    invoke-direct {p0}, Lcom/mobnetic/coinguardian/volley/UserCountryDetectionAsyncTask;->getCountryCodeFromInternet()Ljava/lang/String;

    move-result-object v0

    .line 42
    :cond_0
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 43
    invoke-direct {p0}, Lcom/mobnetic/coinguardian/volley/UserCountryDetectionAsyncTask;->getCountryCodeSystemLocale()Ljava/lang/String;

    move-result-object v0

    .line 45
    :cond_1
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 46
    iget-object v1, p0, Lcom/mobnetic/coinguardian/volley/UserCountryDetectionAsyncTask;->appContext:Landroid/content/Context;

    invoke-static {v1, v0}, Lcom/mobnetic/coinguardian/util/PreferencesUtils;->setUserCountry(Landroid/content/Context;Ljava/lang/String;)V

    .line 47
    const/4 v1, 0x1

    .line 49
    :goto_0
    return v1

    :cond_2
    const/4 v1, 0x0

    goto :goto_0
.end method
