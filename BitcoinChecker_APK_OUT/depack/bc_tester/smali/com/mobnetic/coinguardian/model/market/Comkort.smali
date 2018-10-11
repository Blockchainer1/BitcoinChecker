.class public Lcom/mobnetic/coinguardian/model/market/Comkort;
.super Lcom/mobnetic/coinguardian/model/Market;
.source "Comkort.java"


# static fields
.field private static final NAME:Ljava/lang/String; = "Comkort"

.field private static final TTS_NAME:Ljava/lang/String; = "Comkort"

.field private static final URL:Ljava/lang/String; = "https://api.comkort.com/v1/public/market/summary?market_alias=%1$s"

.field private static final URL_CURRENCY_PAIRS:Ljava/lang/String; = "https://api.comkort.com/v1/public/market/list"


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    .line 21
    const-string v0, "Comkort"

    const-string v1, "Comkort"

    const/4 v2, 0x0

    invoke-direct {p0, v0, v1, v2}, Lcom/mobnetic/coinguardian/model/Market;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;)V

    .line 22
    return-void
.end method

.method private getFirstOrderFrom(Lorg/json/JSONObject;Ljava/lang/String;)D
    .locals 4
    .param p1, "marketJsonObject"    # Lorg/json/JSONObject;
    .param p2, "arrayName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 44
    invoke-virtual {p1, p2}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    .line 45
    .local v0, "ordersJsonArray":Lorg/json/JSONArray;
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-lez v1, :cond_0

    .line 46
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "price"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v2

    .line 48
    :goto_0
    return-wide v2

    :cond_0
    const-wide/high16 v2, -0x4010000000000000L    # -1.0

    goto :goto_0
.end method


# virtual methods
.method public getCurrencyPairsUrl(I)Ljava/lang/String;
    .locals 1
    .param p1, "requestId"    # I

    .prologue
    .line 56
    const-string v0, "https://api.comkort.com/v1/public/market/list"

    return-object v0
.end method

.method public getUrl(ILcom/mobnetic/coinguardian/model/CheckerInfo;)Ljava/lang/String;
    .locals 4
    .param p1, "requestId"    # I
    .param p2, "checkerInfo"    # Lcom/mobnetic/coinguardian/model/CheckerInfo;

    .prologue
    .line 26
    const-string v0, "https://api.comkort.com/v1/public/market/summary?market_alias=%1$s"

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
    .line 61
    .local p3, "pairs":Ljava/util/List;, "Ljava/util/List<Lcom/mobnetic/coinguardian/model/CurrencyPairInfo;>;"
    const-string v3, "markets"

    invoke-virtual {p2, v3}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v2

    .line 63
    .local v2, "marketsJsonArray":Lorg/json/JSONArray;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-ge v0, v3, :cond_0

    .line 64
    invoke-virtual {v2, v0}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v1

    .line 65
    .local v1, "marketJsonObject":Lorg/json/JSONObject;
    new-instance v3, Lcom/mobnetic/coinguardian/model/CurrencyPairInfo;

    const-string v4, "item"

    .line 66
    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "price_currency"

    .line 67
    invoke-virtual {v1, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v6, "alias"

    .line 68
    invoke-virtual {v1, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v3, v4, v5, v6}, Lcom/mobnetic/coinguardian/model/CurrencyPairInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    invoke-interface {p3, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 63
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 70
    .end local v1    # "marketJsonObject":Lorg/json/JSONObject;
    :cond_0
    return-void
.end method

.method protected parseTickerFromJsonObject(ILorg/json/JSONObject;Lcom/mobnetic/coinguardian/model/Ticker;Lcom/mobnetic/coinguardian/model/CheckerInfo;)V
    .locals 6
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
    .line 31
    const-string v3, "markets"

    invoke-virtual {p2, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    .line 32
    .local v2, "marketsJsonObject":Lorg/json/JSONObject;
    invoke-virtual {v2}, Lorg/json/JSONObject;->names()Lorg/json/JSONArray;

    move-result-object v1

    .line 33
    .local v1, "marketNames":Lorg/json/JSONArray;
    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 35
    .local v0, "marketJsonObject":Lorg/json/JSONObject;
    const-string v3, "buy_orders"

    invoke-direct {p0, v0, v3}, Lcom/mobnetic/coinguardian/model/market/Comkort;->getFirstOrderFrom(Lorg/json/JSONObject;Ljava/lang/String;)D

    move-result-wide v4

    iput-wide v4, p3, Lcom/mobnetic/coinguardian/model/Ticker;->bid:D

    .line 36
    const-string v3, "sell_orders"

    invoke-direct {p0, v0, v3}, Lcom/mobnetic/coinguardian/model/market/Comkort;->getFirstOrderFrom(Lorg/json/JSONObject;Ljava/lang/String;)D

    move-result-wide v4

    iput-wide v4, p3, Lcom/mobnetic/coinguardian/model/Ticker;->ask:D

    .line 37
    const-string v3, "volume"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v4

    iput-wide v4, p3, Lcom/mobnetic/coinguardian/model/Ticker;->vol:D

    .line 38
    const-string v3, "high"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v4

    iput-wide v4, p3, Lcom/mobnetic/coinguardian/model/Ticker;->high:D

    .line 39
    const-string v3, "low"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v4

    iput-wide v4, p3, Lcom/mobnetic/coinguardian/model/Ticker;->low:D

    .line 40
    const-string v3, "last_price"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v4

    iput-wide v4, p3, Lcom/mobnetic/coinguardian/model/Ticker;->last:D

    .line 41
    return-void
.end method
