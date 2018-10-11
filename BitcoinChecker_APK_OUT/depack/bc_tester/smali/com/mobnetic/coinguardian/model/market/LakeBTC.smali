.class public Lcom/mobnetic/coinguardian/model/market/LakeBTC;
.super Lcom/mobnetic/coinguardian/model/Market;
.source "LakeBTC.java"


# static fields
.field private static final NAME:Ljava/lang/String; = "LakeBTC"

.field private static final TTS_NAME:Ljava/lang/String; = "Lake BTC"

.field private static final URL:Ljava/lang/String; = "https://api.lakebtc.com/api_v2/ticker"

.field private static final URL_CURRENCY_PAIRS:Ljava/lang/String; = "https://api.lakebtc.com/api_v2/ticker"


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    .line 23
    const-string v0, "LakeBTC"

    const-string v1, "Lake BTC"

    const/4 v2, 0x0

    invoke-direct {p0, v0, v1, v2}, Lcom/mobnetic/coinguardian/model/Market;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;)V

    .line 24
    return-void
.end method


# virtual methods
.method public getCurrencyPairsUrl(I)Ljava/lang/String;
    .locals 1
    .param p1, "requestId"    # I

    .prologue
    .line 54
    const-string v0, "https://api.lakebtc.com/api_v2/ticker"

    return-object v0
.end method

.method public getUrl(ILcom/mobnetic/coinguardian/model/CheckerInfo;)Ljava/lang/String;
    .locals 1
    .param p1, "requestId"    # I
    .param p2, "checkerInfo"    # Lcom/mobnetic/coinguardian/model/CheckerInfo;

    .prologue
    .line 28
    const-string v0, "https://api.lakebtc.com/api_v2/ticker"

    return-object v0
.end method

.method protected parseCurrencyPairsFromJsonObject(ILorg/json/JSONObject;Ljava/util/List;)V
    .locals 8
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
    const/4 v7, 0x3

    .line 59
    invoke-virtual {p2}, Lorg/json/JSONObject;->names()Lorg/json/JSONArray;

    move-result-object v4

    .line 60
    .local v4, "pairsJsonArray":Lorg/json/JSONArray;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v5

    if-ge v2, v5, :cond_0

    .line 61
    invoke-virtual {v4, v2}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 62
    .local v3, "pairId":Ljava/lang/String;
    const/4 v5, 0x0

    invoke-virtual {v3, v5, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    sget-object v6, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v5, v6}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    .line 63
    .local v0, "currencyBase":Ljava/lang/String;
    invoke-virtual {v3, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    sget-object v6, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v5, v6}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    .line 64
    .local v1, "currencyCounter":Ljava/lang/String;
    new-instance v5, Lcom/mobnetic/coinguardian/model/CurrencyPairInfo;

    invoke-direct {v5, v0, v1, v3}, Lcom/mobnetic/coinguardian/model/CurrencyPairInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {p3, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 60
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 66
    .end local v0    # "currencyBase":Ljava/lang/String;
    .end local v1    # "currencyCounter":Ljava/lang/String;
    .end local v3    # "pairId":Ljava/lang/String;
    :cond_0
    return-void
.end method

.method protected parseTickerFromJsonObject(ILorg/json/JSONObject;Lcom/mobnetic/coinguardian/model/Ticker;Lcom/mobnetic/coinguardian/model/CheckerInfo;)V
    .locals 4
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
    .line 34
    invoke-virtual {p4}, Lcom/mobnetic/coinguardian/model/CheckerInfo;->getCurrencyPairId()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_0

    .line 35
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p4}, Lcom/mobnetic/coinguardian/model/CheckerInfo;->getCurrencyBaseLowerCase()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p4}, Lcom/mobnetic/coinguardian/model/CheckerInfo;->getCurrencyCounterLowerCase()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 39
    .local v0, "pairId":Ljava/lang/String;
    :goto_0
    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    .line 41
    .local v1, "pairJsonObject":Lorg/json/JSONObject;
    const-string v2, "bid"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v2

    iput-wide v2, p3, Lcom/mobnetic/coinguardian/model/Ticker;->bid:D

    .line 42
    const-string v2, "ask"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v2

    iput-wide v2, p3, Lcom/mobnetic/coinguardian/model/Ticker;->ask:D

    .line 43
    const-string v2, "volume"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v2

    iput-wide v2, p3, Lcom/mobnetic/coinguardian/model/Ticker;->vol:D

    .line 44
    const-string v2, "high"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v2

    iput-wide v2, p3, Lcom/mobnetic/coinguardian/model/Ticker;->high:D

    .line 45
    const-string v2, "low"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v2

    iput-wide v2, p3, Lcom/mobnetic/coinguardian/model/Ticker;->low:D

    .line 46
    const-string v2, "last"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v2

    iput-wide v2, p3, Lcom/mobnetic/coinguardian/model/Ticker;->last:D

    .line 47
    return-void

    .line 37
    .end local v0    # "pairId":Ljava/lang/String;
    .end local v1    # "pairJsonObject":Lorg/json/JSONObject;
    :cond_0
    invoke-virtual {p4}, Lcom/mobnetic/coinguardian/model/CheckerInfo;->getCurrencyPairId()Ljava/lang/String;

    move-result-object v0

    .restart local v0    # "pairId":Ljava/lang/String;
    goto :goto_0
.end method
