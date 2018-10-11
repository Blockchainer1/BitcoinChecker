.class public Lcom/mobnetic/coinguardian/model/market/GateCoin;
.super Lcom/mobnetic/coinguardian/model/Market;
.source "GateCoin.java"


# static fields
.field private static final NAME:Ljava/lang/String; = "GateCoin"

.field private static final TTS_NAME:Ljava/lang/String; = "Gate Coin"

.field private static final URL:Ljava/lang/String; = "https://api.gatecoin.com/Public/LiveTickers"


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    .line 20
    const-string v0, "GateCoin"

    const-string v1, "Gate Coin"

    const/4 v2, 0x0

    invoke-direct {p0, v0, v1, v2}, Lcom/mobnetic/coinguardian/model/Market;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;)V

    .line 21
    return-void
.end method


# virtual methods
.method public getCurrencyPairsUrl(I)Ljava/lang/String;
    .locals 1
    .param p1, "requestId"    # I

    .prologue
    .line 54
    const-string v0, "https://api.gatecoin.com/Public/LiveTickers"

    return-object v0
.end method

.method public getUrl(ILcom/mobnetic/coinguardian/model/CheckerInfo;)Ljava/lang/String;
    .locals 1
    .param p1, "requestId"    # I
    .param p2, "checkerInfo"    # Lcom/mobnetic/coinguardian/model/CheckerInfo;

    .prologue
    .line 25
    const-string v0, "https://api.gatecoin.com/Public/LiveTickers"

    return-object v0
.end method

.method protected parseCurrencyPairsFromJsonObject(ILorg/json/JSONObject;Ljava/util/List;)V
    .locals 11
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
    .local p3, "pairs":Ljava/util/List;, "Ljava/util/List<Lcom/mobnetic/coinguardian/model/CurrencyPairInfo;>;"
    const/4 v10, 0x3

    const/4 v9, 0x2

    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 59
    const-string v4, "tickers"

    invoke-virtual {p2, v4}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v3

    .line 60
    .local v3, "pairNames":Lorg/json/JSONArray;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-ge v1, v4, :cond_2

    .line 62
    invoke-virtual {v3, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    const-string v5, "currencyPair"

    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 63
    .local v2, "pairId":Ljava/lang/String;
    if-nez v2, :cond_1

    .line 60
    :cond_0
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 65
    :cond_1
    new-array v0, v9, [Ljava/lang/String;

    .line 67
    .local v0, "currencies":[Ljava/lang/String;
    invoke-virtual {v2, v7, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v0, v7

    .line 68
    const/4 v4, 0x6

    invoke-virtual {v2, v10, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v0, v8

    .line 69
    array-length v4, v0

    if-ne v4, v9, :cond_0

    .line 71
    new-instance v4, Lcom/mobnetic/coinguardian/model/CurrencyPairInfo;

    aget-object v5, v0, v7

    aget-object v6, v0, v8

    invoke-direct {v4, v5, v6, v2}, Lcom/mobnetic/coinguardian/model/CurrencyPairInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {p3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 73
    .end local v0    # "currencies":[Ljava/lang/String;
    .end local v2    # "pairId":Ljava/lang/String;
    :cond_2
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
    .line 30
    const-string v5, "tickers"

    invoke-virtual {p2, v5}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v2

    .line 31
    .local v2, "pairNames":Lorg/json/JSONArray;
    invoke-virtual {p4}, Lcom/mobnetic/coinguardian/model/CheckerInfo;->getCurrencyBase()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p4}, Lcom/mobnetic/coinguardian/model/CheckerInfo;->getCurrencyCounter()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 33
    .local v4, "userCurrencyPairChoice":Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v5

    if-ge v1, v5, :cond_0

    .line 34
    invoke-virtual {v2, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    .line 35
    .local v3, "tickerDetails":Lorg/json/JSONObject;
    const-string v5, "currencyPair"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 36
    .local v0, "currentPairId":Ljava/lang/String;
    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 37
    const-string v5, "bid"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v6

    iput-wide v6, p3, Lcom/mobnetic/coinguardian/model/Ticker;->bid:D

    .line 38
    const-string v5, "ask"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v6

    iput-wide v6, p3, Lcom/mobnetic/coinguardian/model/Ticker;->ask:D

    .line 39
    const-string v5, "volume"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v6

    iput-wide v6, p3, Lcom/mobnetic/coinguardian/model/Ticker;->vol:D

    .line 40
    const-string v5, "high"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v6

    iput-wide v6, p3, Lcom/mobnetic/coinguardian/model/Ticker;->high:D

    .line 41
    const-string v5, "low"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v6

    iput-wide v6, p3, Lcom/mobnetic/coinguardian/model/Ticker;->low:D

    .line 42
    const-string v5, "last"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v6

    iput-wide v6, p3, Lcom/mobnetic/coinguardian/model/Ticker;->last:D

    .line 43
    const-string v5, "createDateTime"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v6

    iput-wide v6, p3, Lcom/mobnetic/coinguardian/model/Ticker;->timestamp:J

    .line 47
    .end local v0    # "currentPairId":Ljava/lang/String;
    .end local v3    # "tickerDetails":Lorg/json/JSONObject;
    :cond_0
    return-void

    .line 33
    .restart local v0    # "currentPairId":Ljava/lang/String;
    .restart local v3    # "tickerDetails":Lorg/json/JSONObject;
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method
