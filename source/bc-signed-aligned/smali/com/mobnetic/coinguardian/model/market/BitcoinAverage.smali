.class public Lcom/mobnetic/coinguardian/model/market/BitcoinAverage;
.super Lcom/mobnetic/coinguardian/model/Market;
.source "BitcoinAverage.java"


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

.field private static final NAME:Ljava/lang/String; = "BitcoinAverage"

.field private static final TTS_NAME:Ljava/lang/String; = "Bitcoin Average"

.field private static final URL:Ljava/lang/String; = "https://apiv2.bitcoinaverage.com/indices/global/ticker/%1$s"

.field private static final URL_CURRENCY_PAIRS:Ljava/lang/String; = "https://apiv2.bitcoinaverage.com/constants/symbols"


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    .line 24
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    sput-object v0, Lcom/mobnetic/coinguardian/model/market/BitcoinAverage;->CURRENCY_PAIRS:Ljava/util/HashMap;

    .line 26
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/BitcoinAverage;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "BTC"

    const/16 v2, 0x12

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "AUD"

    aput-object v4, v2, v3

    const/4 v3, 0x1

    const-string v4, "BRL"

    aput-object v4, v2, v3

    const/4 v3, 0x2

    const-string v4, "CAD"

    aput-object v4, v2, v3

    const/4 v3, 0x3

    const-string v4, "CHF"

    aput-object v4, v2, v3

    const/4 v3, 0x4

    const-string v4, "CNY"

    aput-object v4, v2, v3

    const/4 v3, 0x5

    const-string v4, "CZK"

    aput-object v4, v2, v3

    const/4 v3, 0x6

    const-string v4, "EUR"

    aput-object v4, v2, v3

    const/4 v3, 0x7

    const-string v4, "GBP"

    aput-object v4, v2, v3

    const/16 v3, 0x8

    const-string v4, "ILS"

    aput-object v4, v2, v3

    const/16 v3, 0x9

    const-string v4, "JPY"

    aput-object v4, v2, v3

    const/16 v3, 0xa

    const-string v4, "NOK"

    aput-object v4, v2, v3

    const/16 v3, 0xb

    const-string v4, "NZD"

    aput-object v4, v2, v3

    const/16 v3, 0xc

    const-string v4, "PLN"

    aput-object v4, v2, v3

    const/16 v3, 0xd

    const-string v4, "RUB"

    aput-object v4, v2, v3

    const/16 v3, 0xe

    const-string v4, "SEK"

    aput-object v4, v2, v3

    const/16 v3, 0xf

    const-string v4, "SGD"

    aput-object v4, v2, v3

    const/16 v3, 0x10

    const-string v4, "USD"

    aput-object v4, v2, v3

    const/16 v3, 0x11

    const-string v4, "ZAR"

    aput-object v4, v2, v3

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 46
    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .prologue
    .line 49
    const-string v0, "BitcoinAverage"

    const-string v1, "Bitcoin Average"

    sget-object v2, Lcom/mobnetic/coinguardian/model/market/BitcoinAverage;->CURRENCY_PAIRS:Ljava/util/HashMap;

    invoke-direct {p0, v0, v1, v2}, Lcom/mobnetic/coinguardian/model/Market;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;)V

    .line 50
    return-void
.end method


# virtual methods
.method public getCurrencyPairsUrl(I)Ljava/lang/String;
    .locals 1
    .param p1, "requestId"    # I

    .prologue
    .line 79
    const-string v0, "https://apiv2.bitcoinaverage.com/constants/symbols"

    return-object v0
.end method

.method public getUrl(ILcom/mobnetic/coinguardian/model/CheckerInfo;)Ljava/lang/String;
    .locals 4
    .param p1, "requestId"    # I
    .param p2, "checkerInfo"    # Lcom/mobnetic/coinguardian/model/CheckerInfo;

    .prologue
    .line 55
    invoke-virtual {p2}, Lcom/mobnetic/coinguardian/model/CheckerInfo;->getCurrencyPairId()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_0

    .line 56
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2}, Lcom/mobnetic/coinguardian/model/CheckerInfo;->getCurrencyBase()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p2}, Lcom/mobnetic/coinguardian/model/CheckerInfo;->getCurrencyCounter()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 60
    .local v0, "pairId":Ljava/lang/String;
    :goto_0
    const-string v1, "https://apiv2.bitcoinaverage.com/indices/global/ticker/%1$s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 58
    .end local v0    # "pairId":Ljava/lang/String;
    :cond_0
    invoke-virtual {p2}, Lcom/mobnetic/coinguardian/model/CheckerInfo;->getCurrencyPairId()Ljava/lang/String;

    move-result-object v0

    .restart local v0    # "pairId":Ljava/lang/String;
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
    .local p3, "pairs":Ljava/util/List;, "Ljava/util/List<Lcom/mobnetic/coinguardian/model/CurrencyPairInfo;>;"
    const/4 v7, 0x3

    .line 84
    const-string v5, "global"

    invoke-virtual {p2, v5}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v5

    const-string v6, "symbols"

    invoke-virtual {v5, v6}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v4

    .line 85
    .local v4, "pairsJsonArray":Lorg/json/JSONArray;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v5

    if-ge v2, v5, :cond_0

    .line 86
    invoke-virtual {v4, v2}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 87
    .local v3, "pairId":Ljava/lang/String;
    const/4 v5, 0x0

    invoke-virtual {v3, v5, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 88
    .local v0, "currencyBase":Ljava/lang/String;
    invoke-virtual {v3, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    .line 89
    .local v1, "currencyCounter":Ljava/lang/String;
    new-instance v5, Lcom/mobnetic/coinguardian/model/CurrencyPairInfo;

    invoke-direct {v5, v0, v1, v3}, Lcom/mobnetic/coinguardian/model/CurrencyPairInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {p3, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 85
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 91
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
    .line 65
    const-string v0, "bid"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v0

    iput-wide v0, p3, Lcom/mobnetic/coinguardian/model/Ticker;->bid:D

    .line 66
    const-string v0, "ask"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v0

    iput-wide v0, p3, Lcom/mobnetic/coinguardian/model/Ticker;->ask:D

    .line 67
    const-string v0, "volume"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v0

    iput-wide v0, p3, Lcom/mobnetic/coinguardian/model/Ticker;->vol:D

    .line 68
    const-string v0, "high"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v0

    iput-wide v0, p3, Lcom/mobnetic/coinguardian/model/Ticker;->high:D

    .line 69
    const-string v0, "low"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v0

    iput-wide v0, p3, Lcom/mobnetic/coinguardian/model/Ticker;->low:D

    .line 70
    const-string v0, "last"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v0

    iput-wide v0, p3, Lcom/mobnetic/coinguardian/model/Ticker;->last:D

    .line 71
    const-string v0, "timestamp"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v0

    const-wide/16 v2, 0x3e8

    mul-long/2addr v0, v2

    iput-wide v0, p3, Lcom/mobnetic/coinguardian/model/Ticker;->timestamp:J

    .line 72
    return-void
.end method
