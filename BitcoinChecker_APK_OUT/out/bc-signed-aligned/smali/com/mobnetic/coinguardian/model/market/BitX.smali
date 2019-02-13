.class public Lcom/mobnetic/coinguardian/model/market/BitX;
.super Lcom/mobnetic/coinguardian/model/Market;
.source "BitX.java"


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

.field private static final NAME:Ljava/lang/String; = "Luno"

.field private static final TTS_NAME:Ljava/lang/String; = "Luno"

.field private static final URL:Ljava/lang/String; = "https://api.mybitx.com/api/1/ticker?pair=%1$s"

.field private static final URL_CURRENCY_PAIRS:Ljava/lang/String; = "https://api.mybitx.com/api/1/tickers"


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    .line 23
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    sput-object v0, Lcom/mobnetic/coinguardian/model/market/BitX;->CURRENCY_PAIRS:Ljava/util/HashMap;

    .line 25
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/BitX;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "BTC"

    const/4 v2, 0x5

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "IDR"

    aput-object v4, v2, v3

    const/4 v3, 0x1

    const-string v4, "SGD"

    aput-object v4, v2, v3

    const/4 v3, 0x2

    const-string v4, "MYR"

    aput-object v4, v2, v3

    const/4 v3, 0x3

    const-string v4, "NGN"

    aput-object v4, v2, v3

    const/4 v3, 0x4

    const-string v4, "ZAR"

    aput-object v4, v2, v3

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .prologue
    .line 35
    const-string v0, "Luno"

    const-string v1, "Luno"

    sget-object v2, Lcom/mobnetic/coinguardian/model/market/BitX;->CURRENCY_PAIRS:Ljava/util/HashMap;

    invoke-direct {p0, v0, v1, v2}, Lcom/mobnetic/coinguardian/model/Market;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;)V

    .line 36
    return-void
.end method

.method private fixCurrency(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "currency"    # Ljava/lang/String;

    .prologue
    .line 50
    const-string v0, "BTC"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 51
    const-string p1, "XBT"

    .line 56
    .end local p1    # "currency":Ljava/lang/String;
    :cond_0
    :goto_0
    return-object p1

    .line 52
    .restart local p1    # "currency":Ljava/lang/String;
    :cond_1
    const-string v0, "XBT"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 53
    const-string p1, "BTC"

    goto :goto_0
.end method


# virtual methods
.method public getCurrencyPairsUrl(I)Ljava/lang/String;
    .locals 1
    .param p1, "requestId"    # I

    .prologue
    .line 73
    const-string v0, "https://api.mybitx.com/api/1/tickers"

    return-object v0
.end method

.method public getUrl(ILcom/mobnetic/coinguardian/model/CheckerInfo;)Ljava/lang/String;
    .locals 6
    .param p1, "requestId"    # I
    .param p2, "checkerInfo"    # Lcom/mobnetic/coinguardian/model/CheckerInfo;

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 41
    invoke-virtual {p2}, Lcom/mobnetic/coinguardian/model/CheckerInfo;->getCurrencyPairId()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_0

    .line 42
    const-string v1, "%1$s%2$s"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {p2}, Lcom/mobnetic/coinguardian/model/CheckerInfo;->getCurrencyBase()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/mobnetic/coinguardian/model/market/BitX;->fixCurrency(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v4

    invoke-virtual {p2}, Lcom/mobnetic/coinguardian/model/CheckerInfo;->getCurrencyCounter()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/mobnetic/coinguardian/model/market/BitX;->fixCurrency(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v5

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 46
    .local v0, "pairString":Ljava/lang/String;
    :goto_0
    const-string v1, "https://api.mybitx.com/api/1/ticker?pair=%1$s"

    new-array v2, v5, [Ljava/lang/Object;

    aput-object v0, v2, v4

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 44
    .end local v0    # "pairString":Ljava/lang/String;
    :cond_0
    invoke-virtual {p2}, Lcom/mobnetic/coinguardian/model/CheckerInfo;->getCurrencyPairId()Ljava/lang/String;

    move-result-object v0

    .restart local v0    # "pairString":Ljava/lang/String;
    goto :goto_0
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
    .line 78
    .local p3, "pairs":Ljava/util/List;, "Ljava/util/List<Lcom/mobnetic/coinguardian/model/CurrencyPairInfo;>;"
    const-string v6, "tickers"

    invoke-virtual {p2, v6}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v3

    .line 79
    .local v3, "dataJsonArray":Lorg/json/JSONArray;
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_0
    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v6

    if-ge v5, v6, :cond_1

    .line 80
    invoke-virtual {v3, v5}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v6

    const-string v7, "pair"

    invoke-virtual {v6, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 81
    .local v2, "currencyPair":Ljava/lang/String;
    if-nez v2, :cond_0

    .line 79
    :goto_1
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 87
    :cond_0
    const/4 v6, 0x0

    const/4 v7, 0x3

    :try_start_0
    invoke-virtual {v2, v6, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-direct {p0, v6}, Lcom/mobnetic/coinguardian/model/market/BitX;->fixCurrency(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 88
    .local v0, "currencyBase":Ljava/lang/String;
    const/4 v6, 0x3

    invoke-virtual {v2, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    invoke-direct {p0, v6}, Lcom/mobnetic/coinguardian/model/market/BitX;->fixCurrency(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 92
    .local v1, "currencyCounter":Ljava/lang/String;
    new-instance v6, Lcom/mobnetic/coinguardian/model/CurrencyPairInfo;

    invoke-direct {v6, v0, v1, v2}, Lcom/mobnetic/coinguardian/model/CurrencyPairInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {p3, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 89
    .end local v0    # "currencyBase":Ljava/lang/String;
    .end local v1    # "currencyCounter":Ljava/lang/String;
    :catch_0
    move-exception v4

    .line 90
    .local v4, "e":Ljava/lang/Exception;
    goto :goto_1

    .line 98
    .end local v2    # "currencyPair":Ljava/lang/String;
    .end local v4    # "e":Ljava/lang/Exception;
    :cond_1
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
    .line 61
    const-string v0, "bid"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v0

    iput-wide v0, p3, Lcom/mobnetic/coinguardian/model/Ticker;->bid:D

    .line 62
    const-string v0, "ask"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v0

    iput-wide v0, p3, Lcom/mobnetic/coinguardian/model/Ticker;->ask:D

    .line 63
    const-string v0, "rolling_24_hour_volume"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v0

    iput-wide v0, p3, Lcom/mobnetic/coinguardian/model/Ticker;->vol:D

    .line 64
    const-string v0, "last_trade"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v0

    iput-wide v0, p3, Lcom/mobnetic/coinguardian/model/Ticker;->last:D

    .line 65
    const-string v0, "timestamp"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v0

    iput-wide v0, p3, Lcom/mobnetic/coinguardian/model/Ticker;->timestamp:J

    .line 66
    return-void
.end method
