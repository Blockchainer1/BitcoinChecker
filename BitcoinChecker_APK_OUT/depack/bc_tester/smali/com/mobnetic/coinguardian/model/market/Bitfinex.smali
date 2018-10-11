.class public Lcom/mobnetic/coinguardian/model/market/Bitfinex;
.super Lcom/mobnetic/coinguardian/model/Market;
.source "Bitfinex.java"


# static fields
.field private static final CURRENCY_PAIRS:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/CharSequence;",
            ">;"
        }
    .end annotation
.end field

.field private static final NAME:Ljava/lang/String; = "Bitfinex"

.field private static final TTS_NAME:Ljava/lang/String; = "Bitfinex"

.field private static final URL:Ljava/lang/String; = "https://api.bitfinex.com/v1/pubticker/%1$s"

.field private static final URL_CURRENCY_PAIRS:Ljava/lang/String; = "https://api.bitfinex.com/v1/symbols"


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 26
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    sput-object v0, Lcom/mobnetic/coinguardian/model/market/Bitfinex;->CURRENCY_PAIRS:Ljava/util/HashMap;

    .line 28
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Bitfinex;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "BCC"

    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "BTC"

    aput-object v3, v2, v4

    const-string v3, "USD"

    aput-object v3, v2, v5

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Bitfinex;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "BCH"

    new-array v2, v7, [Ljava/lang/String;

    const-string v3, "BTC"

    aput-object v3, v2, v4

    const-string v3, "ETH"

    aput-object v3, v2, v5

    const-string v3, "USD"

    aput-object v3, v2, v6

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Bitfinex;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "BCU"

    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "BTC"

    aput-object v3, v2, v4

    const-string v3, "USD"

    aput-object v3, v2, v5

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Bitfinex;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "BTC"

    new-array v2, v5, [Ljava/lang/String;

    const-string v3, "USD"

    aput-object v3, v2, v4

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Bitfinex;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "DSH"

    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "BTC"

    aput-object v3, v2, v4

    const-string v3, "USD"

    aput-object v3, v2, v5

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 48
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Bitfinex;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "EOS"

    new-array v2, v7, [Ljava/lang/String;

    const-string v3, "BTC"

    aput-object v3, v2, v4

    const-string v3, "ETH"

    aput-object v3, v2, v5

    const-string v3, "USD"

    aput-object v3, v2, v6

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 53
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Bitfinex;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "ETC"

    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "BTC"

    aput-object v3, v2, v4

    const-string v3, "USD"

    aput-object v3, v2, v5

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 57
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Bitfinex;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "ETH"

    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "BTC"

    aput-object v3, v2, v4

    const-string v3, "USD"

    aput-object v3, v2, v5

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Bitfinex;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "IOT"

    new-array v2, v7, [Ljava/lang/String;

    const-string v3, "BTC"

    aput-object v3, v2, v4

    const-string v3, "ETH"

    aput-object v3, v2, v5

    const-string v3, "USD"

    aput-object v3, v2, v6

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 66
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Bitfinex;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "LTC"

    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "BTC"

    aput-object v3, v2, v4

    const-string v3, "USD"

    aput-object v3, v2, v5

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 70
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Bitfinex;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "OMG"

    new-array v2, v7, [Ljava/lang/String;

    const-string v3, "BTC"

    aput-object v3, v2, v4

    const-string v3, "ETH"

    aput-object v3, v2, v5

    const-string v3, "USD"

    aput-object v3, v2, v6

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 75
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Bitfinex;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "RRT"

    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "BTC"

    aput-object v3, v2, v4

    const-string v3, "USD"

    aput-object v3, v2, v5

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 79
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Bitfinex;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "SAN"

    new-array v2, v7, [Ljava/lang/String;

    const-string v3, "BTC"

    aput-object v3, v2, v4

    const-string v3, "ETH"

    aput-object v3, v2, v5

    const-string v3, "USD"

    aput-object v3, v2, v6

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 84
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Bitfinex;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "XMR"

    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "BTC"

    aput-object v3, v2, v4

    const-string v3, "USD"

    aput-object v3, v2, v5

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 88
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Bitfinex;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "XRP"

    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "BTC"

    aput-object v3, v2, v4

    const-string v3, "USD"

    aput-object v3, v2, v5

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 92
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Bitfinex;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "ZEC"

    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "BTC"

    aput-object v3, v2, v4

    const-string v3, "USD"

    aput-object v3, v2, v5

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 96
    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .prologue
    .line 99
    const-string v0, "Bitfinex"

    const-string v1, "Bitfinex"

    sget-object v2, Lcom/mobnetic/coinguardian/model/market/Bitfinex;->CURRENCY_PAIRS:Ljava/util/HashMap;

    invoke-direct {p0, v0, v1, v2}, Lcom/mobnetic/coinguardian/model/Market;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;)V

    .line 100
    return-void
.end method


# virtual methods
.method public getCurrencyPairsUrl(I)Ljava/lang/String;
    .locals 1
    .param p1, "requestId"    # I

    .prologue
    .line 129
    const-string v0, "https://api.bitfinex.com/v1/symbols"

    return-object v0
.end method

.method public getUrl(ILcom/mobnetic/coinguardian/model/CheckerInfo;)Ljava/lang/String;
    .locals 6
    .param p1, "requestId"    # I
    .param p2, "checkerInfo"    # Lcom/mobnetic/coinguardian/model/CheckerInfo;

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 104
    invoke-virtual {p2}, Lcom/mobnetic/coinguardian/model/CheckerInfo;->getCurrencyPairId()Ljava/lang/String;

    move-result-object v0

    .line 105
    .local v0, "pairId":Ljava/lang/String;
    if-nez v0, :cond_0

    .line 106
    const-string v1, "%1$s%2$s"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    .line 107
    invoke-virtual {p2}, Lcom/mobnetic/coinguardian/model/CheckerInfo;->getCurrencyBaseLowerCase()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v4

    .line 108
    invoke-virtual {p2}, Lcom/mobnetic/coinguardian/model/CheckerInfo;->getCurrencyCounterLowerCase()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v5

    .line 106
    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 110
    :cond_0
    const-string v1, "https://api.bitfinex.com/v1/pubticker/%1$s"

    new-array v2, v5, [Ljava/lang/Object;

    aput-object v0, v2, v4

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method protected parseCurrencyPairs(ILjava/lang/String;Ljava/util/List;)V
    .locals 8
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
    const/4 v7, 0x3

    .line 134
    new-instance v2, Lorg/json/JSONArray;

    invoke-direct {v2, p2}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 135
    .local v2, "pairsArray":Lorg/json/JSONArray;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-ge v0, v3, :cond_1

    .line 136
    invoke-virtual {v2, v0}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 137
    .local v1, "pairId":Ljava/lang/String;
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    const/4 v4, 0x6

    if-ne v3, v4, :cond_0

    .line 138
    new-instance v3, Lcom/mobnetic/coinguardian/model/CurrencyPairInfo;

    const/4 v4, 0x0

    .line 139
    invoke-virtual {v1, v4, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v4, v5}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v4

    .line 140
    invoke-virtual {v1, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    sget-object v6, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v5, v6}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v4, v5, v1}, Lcom/mobnetic/coinguardian/model/CurrencyPairInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 138
    invoke-interface {p3, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 135
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 144
    .end local v1    # "pairId":Ljava/lang/String;
    :cond_1
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
    .line 115
    const-string v0, "bid"

    invoke-static {p2, v0}, Lcom/mobnetic/coinguardian/util/ParseUtils;->getDoubleFromString(Lorg/json/JSONObject;Ljava/lang/String;)D

    move-result-wide v0

    iput-wide v0, p3, Lcom/mobnetic/coinguardian/model/Ticker;->bid:D

    .line 116
    const-string v0, "ask"

    invoke-static {p2, v0}, Lcom/mobnetic/coinguardian/util/ParseUtils;->getDoubleFromString(Lorg/json/JSONObject;Ljava/lang/String;)D

    move-result-wide v0

    iput-wide v0, p3, Lcom/mobnetic/coinguardian/model/Ticker;->ask:D

    .line 117
    const-string v0, "volume"

    invoke-static {p2, v0}, Lcom/mobnetic/coinguardian/util/ParseUtils;->getDoubleFromString(Lorg/json/JSONObject;Ljava/lang/String;)D

    move-result-wide v0

    iput-wide v0, p3, Lcom/mobnetic/coinguardian/model/Ticker;->vol:D

    .line 118
    const-string v0, "high"

    invoke-static {p2, v0}, Lcom/mobnetic/coinguardian/util/ParseUtils;->getDoubleFromString(Lorg/json/JSONObject;Ljava/lang/String;)D

    move-result-wide v0

    iput-wide v0, p3, Lcom/mobnetic/coinguardian/model/Ticker;->high:D

    .line 119
    const-string v0, "low"

    invoke-static {p2, v0}, Lcom/mobnetic/coinguardian/util/ParseUtils;->getDoubleFromString(Lorg/json/JSONObject;Ljava/lang/String;)D

    move-result-wide v0

    iput-wide v0, p3, Lcom/mobnetic/coinguardian/model/Ticker;->low:D

    .line 120
    const-string v0, "last_price"

    invoke-static {p2, v0}, Lcom/mobnetic/coinguardian/util/ParseUtils;->getDoubleFromString(Lorg/json/JSONObject;Ljava/lang/String;)D

    move-result-wide v0

    iput-wide v0, p3, Lcom/mobnetic/coinguardian/model/Ticker;->last:D

    .line 121
    const-string v0, "timestamp"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v0

    const-wide v2, 0x408f400000000000L    # 1000.0

    mul-double/2addr v0, v2

    double-to-long v0, v0

    iput-wide v0, p3, Lcom/mobnetic/coinguardian/model/Ticker;->timestamp:J

    .line 122
    return-void
.end method
