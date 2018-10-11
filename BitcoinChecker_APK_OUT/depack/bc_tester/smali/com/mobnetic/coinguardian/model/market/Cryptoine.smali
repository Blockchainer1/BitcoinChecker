.class public Lcom/mobnetic/coinguardian/model/market/Cryptoine;
.super Lcom/mobnetic/coinguardian/model/Market;
.source "Cryptoine.java"


# static fields
.field private static final NAME:Ljava/lang/String; = "Cryptoine"

.field private static final TTS_NAME:Ljava/lang/String; = "Cryptoine"

.field private static final URL:Ljava/lang/String; = "https://cryptoine.com/api/1/ticker/%1$s"

.field private static final URL_CURRENCY_PAIRS:Ljava/lang/String; = "https://cryptoine.com/api/1/markets"


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    .line 22
    const-string v0, "Cryptoine"

    const-string v1, "Cryptoine"

    const/4 v2, 0x0

    invoke-direct {p0, v0, v1, v2}, Lcom/mobnetic/coinguardian/model/Market;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;)V

    .line 23
    return-void
.end method

.method private getDoubleOrZero(Lorg/json/JSONObject;Ljava/lang/String;)D
    .locals 2
    .param p1, "jsonObject"    # Lorg/json/JSONObject;
    .param p2, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 41
    invoke-virtual {p1, p2}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 42
    const-wide/16 v0, 0x0

    .line 43
    :goto_0
    return-wide v0

    :cond_0
    invoke-virtual {p1, p2}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v0

    goto :goto_0
.end method


# virtual methods
.method public getCurrencyPairsUrl(I)Ljava/lang/String;
    .locals 1
    .param p1, "requestId"    # I

    .prologue
    .line 51
    const-string v0, "https://cryptoine.com/api/1/markets"

    return-object v0
.end method

.method public getUrl(ILcom/mobnetic/coinguardian/model/CheckerInfo;)Ljava/lang/String;
    .locals 4
    .param p1, "requestId"    # I
    .param p2, "checkerInfo"    # Lcom/mobnetic/coinguardian/model/CheckerInfo;

    .prologue
    .line 27
    const-string v0, "https://cryptoine.com/api/1/ticker/%1$s"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-virtual {p2}, Lcom/mobnetic/coinguardian/model/CheckerInfo;->getCurrencyPairId()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected parseCurrencyPairsFromJsonObject(ILorg/json/JSONObject;Ljava/util/List;)V
    .locals 9
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
    .line 56
    .local p3, "pairs":Ljava/util/List;, "Ljava/util/List<Lcom/mobnetic/coinguardian/model/CurrencyPairInfo;>;"
    const-string v7, "data"

    invoke-virtual {p2, v7}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    .line 57
    .local v3, "dataJsonObject":Lorg/json/JSONObject;
    invoke-virtual {v3}, Lorg/json/JSONObject;->names()Lorg/json/JSONArray;

    move-result-object v6

    .line 59
    .local v6, "pairNames":Lorg/json/JSONArray;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    invoke-virtual {v6}, Lorg/json/JSONArray;->length()I

    move-result v7

    if-ge v4, v7, :cond_2

    .line 60
    invoke-virtual {v6, v4}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v5

    .line 61
    .local v5, "pairId":Ljava/lang/String;
    if-nez v5, :cond_1

    .line 59
    :cond_0
    :goto_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 63
    :cond_1
    const-string v7, "_"

    invoke-virtual {v5, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 64
    .local v0, "currencies":[Ljava/lang/String;
    array-length v7, v0

    const/4 v8, 0x2

    if-ne v7, v8, :cond_0

    .line 67
    const/4 v7, 0x0

    aget-object v7, v0, v7

    sget-object v8, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v7, v8}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    .line 68
    .local v1, "currencyBase":Ljava/lang/String;
    const/4 v7, 0x1

    aget-object v7, v0, v7

    sget-object v8, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v7, v8}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v2

    .line 69
    .local v2, "currencyCounter":Ljava/lang/String;
    new-instance v7, Lcom/mobnetic/coinguardian/model/CurrencyPairInfo;

    invoke-direct {v7, v1, v2, v5}, Lcom/mobnetic/coinguardian/model/CurrencyPairInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {p3, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 71
    .end local v0    # "currencies":[Ljava/lang/String;
    .end local v1    # "currencyBase":Ljava/lang/String;
    .end local v2    # "currencyCounter":Ljava/lang/String;
    .end local v5    # "pairId":Ljava/lang/String;
    :cond_2
    return-void
.end method

.method protected parseTickerFromJsonObject(ILorg/json/JSONObject;Lcom/mobnetic/coinguardian/model/Ticker;Lcom/mobnetic/coinguardian/model/CheckerInfo;)V
    .locals 2
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
    .line 32
    const-string v0, "buy"

    invoke-direct {p0, p2, v0}, Lcom/mobnetic/coinguardian/model/market/Cryptoine;->getDoubleOrZero(Lorg/json/JSONObject;Ljava/lang/String;)D

    move-result-wide v0

    iput-wide v0, p3, Lcom/mobnetic/coinguardian/model/Ticker;->bid:D

    .line 33
    const-string v0, "sell"

    invoke-direct {p0, p2, v0}, Lcom/mobnetic/coinguardian/model/market/Cryptoine;->getDoubleOrZero(Lorg/json/JSONObject;Ljava/lang/String;)D

    move-result-wide v0

    iput-wide v0, p3, Lcom/mobnetic/coinguardian/model/Ticker;->ask:D

    .line 34
    const-string v0, "vol_exchange"

    invoke-direct {p0, p2, v0}, Lcom/mobnetic/coinguardian/model/market/Cryptoine;->getDoubleOrZero(Lorg/json/JSONObject;Ljava/lang/String;)D

    move-result-wide v0

    iput-wide v0, p3, Lcom/mobnetic/coinguardian/model/Ticker;->vol:D

    .line 35
    const-string v0, "high"

    invoke-direct {p0, p2, v0}, Lcom/mobnetic/coinguardian/model/market/Cryptoine;->getDoubleOrZero(Lorg/json/JSONObject;Ljava/lang/String;)D

    move-result-wide v0

    iput-wide v0, p3, Lcom/mobnetic/coinguardian/model/Ticker;->high:D

    .line 36
    const-string v0, "low"

    invoke-direct {p0, p2, v0}, Lcom/mobnetic/coinguardian/model/market/Cryptoine;->getDoubleOrZero(Lorg/json/JSONObject;Ljava/lang/String;)D

    move-result-wide v0

    iput-wide v0, p3, Lcom/mobnetic/coinguardian/model/Ticker;->low:D

    .line 37
    const-string v0, "last"

    invoke-direct {p0, p2, v0}, Lcom/mobnetic/coinguardian/model/market/Cryptoine;->getDoubleOrZero(Lorg/json/JSONObject;Ljava/lang/String;)D

    move-result-wide v0

    iput-wide v0, p3, Lcom/mobnetic/coinguardian/model/Ticker;->last:D

    .line 38
    return-void
.end method
