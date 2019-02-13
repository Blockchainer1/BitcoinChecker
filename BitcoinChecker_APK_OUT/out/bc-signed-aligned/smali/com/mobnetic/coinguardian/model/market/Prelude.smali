.class public Lcom/mobnetic/coinguardian/model/market/Prelude;
.super Lcom/mobnetic/coinguardian/model/Market;
.source "Prelude.java"


# static fields
.field private static final NAME:Ljava/lang/String; = "Prelude"

.field private static final TTS_NAME:Ljava/lang/String; = "Prelude"

.field private static final URL_1:Ljava/lang/String; = "https://api.prelude.io/pairings/%1$s"

.field private static final URL_2_BTC:Ljava/lang/String; = "https://api.prelude.io/statistics/%1$s"

.field private static final URL_2_USD:Ljava/lang/String; = "https://api.prelude.io/statistics-usd/%1$s"

.field private static final URL_CURRENCY_PAIRS_BTC:Ljava/lang/String; = "https://api.prelude.io/pairings/btc"

.field private static final URL_CURRENCY_PAIRS_USD:Ljava/lang/String; = "https://api.prelude.io/pairings/usd"


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    .line 27
    const-string v0, "Prelude"

    const-string v1, "Prelude"

    const/4 v2, 0x0

    invoke-direct {p0, v0, v1, v2}, Lcom/mobnetic/coinguardian/model/Market;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;)V

    .line 28
    return-void
.end method


# virtual methods
.method public getCurrencyPairsNumOfRequests()I
    .locals 1

    .prologue
    .line 75
    const/4 v0, 0x2

    return v0
.end method

.method public getCurrencyPairsUrl(I)Ljava/lang/String;
    .locals 1
    .param p1, "requestId"    # I

    .prologue
    .line 80
    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    .line 81
    const-string v0, "https://api.prelude.io/pairings/usd"

    .line 82
    :goto_0
    return-object v0

    :cond_0
    const-string v0, "https://api.prelude.io/pairings/btc"

    goto :goto_0
.end method

.method public getNumOfRequests(Lcom/mobnetic/coinguardian/model/CheckerInfo;)I
    .locals 1
    .param p1, "checkerInfo"    # Lcom/mobnetic/coinguardian/model/CheckerInfo;

    .prologue
    .line 45
    const/4 v0, 0x2

    return v0
.end method

.method public getUrl(ILcom/mobnetic/coinguardian/model/CheckerInfo;)Ljava/lang/String;
    .locals 4
    .param p1, "requestId"    # I
    .param p2, "checkerInfo"    # Lcom/mobnetic/coinguardian/model/CheckerInfo;

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 32
    if-nez p1, :cond_0

    .line 33
    const-string v0, "https://api.prelude.io/pairings/%1$s"

    new-array v1, v2, [Ljava/lang/Object;

    invoke-virtual {p2}, Lcom/mobnetic/coinguardian/model/CheckerInfo;->getCurrencyCounterLowerCase()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 39
    :goto_0
    return-object v0

    .line 36
    :cond_0
    const-string v0, "USD"

    invoke-virtual {p2}, Lcom/mobnetic/coinguardian/model/CheckerInfo;->getCurrencyCounter()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 37
    const-string v0, "https://api.prelude.io/statistics-usd/%1$s"

    new-array v1, v2, [Ljava/lang/Object;

    invoke-virtual {p2}, Lcom/mobnetic/coinguardian/model/CheckerInfo;->getCurrencyBase()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 39
    :cond_1
    const-string v0, "https://api.prelude.io/statistics/%1$s"

    new-array v1, v2, [Ljava/lang/Object;

    invoke-virtual {p2}, Lcom/mobnetic/coinguardian/model/CheckerInfo;->getCurrencyBase()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method protected parseCurrencyPairsFromJsonObject(ILorg/json/JSONObject;Ljava/util/List;)V
    .locals 7
    .param p1, "requestId"    # I
    .param p2, "jsonObject"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lorg/json/JSONObject;",
            "Ljava/util/List",
            "<",
            "Lcom/mobnetic/coinguardian/model/CurrencyPairInfo;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 87
    .local p3, "pairs":Ljava/util/List;, "Ljava/util/List<Lcom/mobnetic/coinguardian/model/CurrencyPairInfo;>;"
    const-string v4, "pairings"

    invoke-virtual {p2, v4}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v3

    .line 88
    .local v3, "pairingsArray":Lorg/json/JSONArray;
    const-string v4, "from"

    invoke-virtual {p2, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 90
    .local v0, "currencyCounter":Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-ge v1, v4, :cond_0

    .line 91
    invoke-virtual {v3, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    .line 92
    .local v2, "pairObject":Lorg/json/JSONObject;
    new-instance v4, Lcom/mobnetic/coinguardian/model/CurrencyPairInfo;

    const-string v5, "pair"

    .line 93
    invoke-virtual {v2, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    invoke-direct {v4, v5, v0, v6}, Lcom/mobnetic/coinguardian/model/CurrencyPairInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 92
    invoke-interface {p3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 90
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 98
    .end local v2    # "pairObject":Lorg/json/JSONObject;
    :cond_0
    return-void
.end method

.method protected parseTickerFromJsonObject(ILorg/json/JSONObject;Lcom/mobnetic/coinguardian/model/Ticker;Lcom/mobnetic/coinguardian/model/CheckerInfo;)V
    .locals 8
    .param p1, "requestId"    # I
    .param p2, "jsonObject"    # Lorg/json/JSONObject;
    .param p3, "ticker"    # Lcom/mobnetic/coinguardian/model/Ticker;
    .param p4, "checkerInfo"    # Lcom/mobnetic/coinguardian/model/CheckerInfo;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 51
    sget-object v6, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-static {v6}, Ljava/text/NumberFormat;->getInstance(Ljava/util/Locale;)Ljava/text/NumberFormat;

    move-result-object v1

    .line 52
    .local v1, "numberFormat":Ljava/text/NumberFormat;
    if-nez p1, :cond_2

    .line 53
    const-string v6, "pairings"

    invoke-virtual {p2, v6}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v4

    .line 54
    .local v4, "pairings":Lorg/json/JSONArray;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v6

    if-ge v0, v6, :cond_0

    .line 55
    invoke-virtual {v4, v0}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    .line 56
    .local v3, "pairing":Lorg/json/JSONObject;
    const-string v6, "pair"

    invoke-virtual {v3, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 57
    .local v2, "pair":Ljava/lang/String;
    invoke-virtual {p4}, Lcom/mobnetic/coinguardian/model/CheckerInfo;->getCurrencyBase()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 58
    const-string v6, "last_trade"

    invoke-virtual {v3, v6}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v6

    const-string v7, "rate"

    invoke-virtual {v6, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v6}, Ljava/text/NumberFormat;->parse(Ljava/lang/String;)Ljava/lang/Number;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v6

    iput-wide v6, p3, Lcom/mobnetic/coinguardian/model/Ticker;->last:D

    .line 68
    .end local v0    # "i":I
    .end local v2    # "pair":Ljava/lang/String;
    .end local v3    # "pairing":Lorg/json/JSONObject;
    .end local v4    # "pairings":Lorg/json/JSONArray;
    :cond_0
    :goto_1
    return-void

    .line 54
    .restart local v0    # "i":I
    .restart local v2    # "pair":Ljava/lang/String;
    .restart local v3    # "pairing":Lorg/json/JSONObject;
    .restart local v4    # "pairings":Lorg/json/JSONArray;
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 63
    .end local v0    # "i":I
    .end local v2    # "pair":Ljava/lang/String;
    .end local v3    # "pairing":Lorg/json/JSONObject;
    .end local v4    # "pairings":Lorg/json/JSONArray;
    :cond_2
    const-string v6, "statistics"

    invoke-virtual {p2, v6}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v5

    .line 64
    .local v5, "statistics":Lorg/json/JSONObject;
    const-string v6, "volume"

    invoke-virtual {v5, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v6}, Ljava/text/NumberFormat;->parse(Ljava/lang/String;)Ljava/lang/Number;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v6

    iput-wide v6, p3, Lcom/mobnetic/coinguardian/model/Ticker;->vol:D

    .line 65
    const-string v6, "high"

    invoke-virtual {v5, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v6}, Ljava/text/NumberFormat;->parse(Ljava/lang/String;)Ljava/lang/Number;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v6

    iput-wide v6, p3, Lcom/mobnetic/coinguardian/model/Ticker;->high:D

    .line 66
    const-string v6, "low"

    invoke-virtual {v5, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v6}, Ljava/text/NumberFormat;->parse(Ljava/lang/String;)Ljava/lang/Number;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v6

    iput-wide v6, p3, Lcom/mobnetic/coinguardian/model/Ticker;->low:D

    goto :goto_1
.end method
