.class public Lcom/mobnetic/coinguardian/model/market/Binance;
.super Lcom/mobnetic/coinguardian/model/Market;
.source "Binance.java"


# static fields
.field private static final COUNTER_CURRENCIES:[Ljava/lang/String;

.field private static final NAME:Ljava/lang/String; = "Binance"

.field private static final TTS_NAME:Ljava/lang/String; = "Binance"

.field private static final URL:Ljava/lang/String; = "https://api.binance.com/api/v1/ticker/24hr?symbol=%1$s"

.field private static final URL_CURRENCY_PAIRS:Ljava/lang/String; = "https://api.binance.com/api/v1/ticker/allPrices"


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 21
    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "BNB"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "BTC"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "ETH"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "USDT"

    aput-object v2, v0, v1

    sput-object v0, Lcom/mobnetic/coinguardian/model/market/Binance;->COUNTER_CURRENCIES:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .prologue
    .line 29
    const-string v0, "Binance"

    const-string v1, "Binance"

    const/4 v2, 0x0

    invoke-direct {p0, v0, v1, v2}, Lcom/mobnetic/coinguardian/model/Market;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;)V

    .line 30
    return-void
.end method


# virtual methods
.method public getCurrencyPairsUrl(I)Ljava/lang/String;
    .locals 1
    .param p1, "requestId"    # I

    .prologue
    .line 52
    const-string v0, "https://api.binance.com/api/v1/ticker/allPrices"

    return-object v0
.end method

.method public getUrl(ILcom/mobnetic/coinguardian/model/CheckerInfo;)Ljava/lang/String;
    .locals 4
    .param p1, "requestId"    # I
    .param p2, "checkerInfo"    # Lcom/mobnetic/coinguardian/model/CheckerInfo;

    .prologue
    .line 34
    const-string v0, "https://api.binance.com/api/v1/ticker/24hr?symbol=%1$s"

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

.method protected parseCurrencyPairs(ILjava/lang/String;Ljava/util/List;)V
    .locals 11
    .param p1, "requestId"    # I
    .param p2, "responseString"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/String;",
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
    const/4 v6, 0x0

    .line 57
    new-instance v3, Lorg/json/JSONArray;

    invoke-direct {v3, p2}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 59
    .local v3, "resultJsonArray":Lorg/json/JSONArray;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v5

    if-ge v1, v5, :cond_2

    .line 60
    invoke-virtual {v3, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    .line 61
    .local v2, "marketJsonObject":Lorg/json/JSONObject;
    const-string v5, "symbol"

    invoke-virtual {v2, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 63
    .local v4, "symbol":Ljava/lang/String;
    sget-object v7, Lcom/mobnetic/coinguardian/model/market/Binance;->COUNTER_CURRENCIES:[Ljava/lang/String;

    array-length v8, v7

    move v5, v6

    :goto_1
    if-ge v5, v8, :cond_1

    aget-object v0, v7, v5

    .line 64
    .local v0, "counter":Ljava/lang/String;
    invoke-virtual {v4, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_0

    .line 65
    new-instance v9, Lcom/mobnetic/coinguardian/model/CurrencyPairInfo;

    .line 66
    invoke-virtual {v4, v0}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v10

    invoke-virtual {v4, v6, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10, v0, v4}, Lcom/mobnetic/coinguardian/model/CurrencyPairInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    invoke-interface {p3, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 63
    :cond_0
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 59
    .end local v0    # "counter":Ljava/lang/String;
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 72
    .end local v2    # "marketJsonObject":Lorg/json/JSONObject;
    .end local v4    # "symbol":Ljava/lang/String;
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
    .line 39
    const-string v0, "bidPrice"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v0

    iput-wide v0, p3, Lcom/mobnetic/coinguardian/model/Ticker;->bid:D

    .line 40
    const-string v0, "askPrice"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v0

    iput-wide v0, p3, Lcom/mobnetic/coinguardian/model/Ticker;->ask:D

    .line 41
    const-string v0, "volume"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v0

    iput-wide v0, p3, Lcom/mobnetic/coinguardian/model/Ticker;->vol:D

    .line 42
    const-string v0, "highPrice"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v0

    iput-wide v0, p3, Lcom/mobnetic/coinguardian/model/Ticker;->high:D

    .line 43
    const-string v0, "lowPrice"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v0

    iput-wide v0, p3, Lcom/mobnetic/coinguardian/model/Ticker;->low:D

    .line 44
    const-string v0, "lastPrice"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v0

    iput-wide v0, p3, Lcom/mobnetic/coinguardian/model/Ticker;->last:D

    .line 45
    return-void
.end method
