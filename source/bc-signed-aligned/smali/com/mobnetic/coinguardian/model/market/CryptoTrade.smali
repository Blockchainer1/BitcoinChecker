.class public Lcom/mobnetic/coinguardian/model/market/CryptoTrade;
.super Lcom/mobnetic/coinguardian/model/Market;
.source "CryptoTrade.java"


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

.field private static final NAME:Ljava/lang/String; = "Crypto-Trade"

.field private static final TTS_NAME:Ljava/lang/String; = "Crypto Trade"

.field private static final URL:Ljava/lang/String; = "https://crypto-trade.com/api/1/ticker/%1$s_%2$s"


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 18
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    sput-object v0, Lcom/mobnetic/coinguardian/model/market/CryptoTrade;->CURRENCY_PAIRS:Ljava/util/HashMap;

    .line 20
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/CryptoTrade;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "BTC"

    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "USD"

    aput-object v3, v2, v4

    const-string v3, "EUR"

    aput-object v3, v2, v5

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/CryptoTrade;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "LTC"

    new-array v2, v7, [Ljava/lang/String;

    const-string v3, "USD"

    aput-object v3, v2, v4

    const-string v3, "EUR"

    aput-object v3, v2, v5

    const-string v3, "BTC"

    aput-object v3, v2, v6

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/CryptoTrade;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "NMC"

    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "USD"

    aput-object v3, v2, v4

    const-string v3, "BTC"

    aput-object v3, v2, v5

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/CryptoTrade;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "XPM"

    new-array v2, v7, [Ljava/lang/String;

    const-string v3, "USD"

    aput-object v3, v2, v4

    const-string v3, "BTC"

    aput-object v3, v2, v5

    const-string v3, "PPC"

    aput-object v3, v2, v6

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/CryptoTrade;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "PPC"

    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "USD"

    aput-object v3, v2, v4

    const-string v3, "BTC"

    aput-object v3, v2, v5

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 42
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/CryptoTrade;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "TRC"

    new-array v2, v5, [Ljava/lang/String;

    const-string v3, "BTC"

    aput-object v3, v2, v4

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 45
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/CryptoTrade;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "FTC"

    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "USD"

    aput-object v3, v2, v4

    const-string v3, "BTC"

    aput-object v3, v2, v5

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/CryptoTrade;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "DVC"

    new-array v2, v5, [Ljava/lang/String;

    const-string v3, "BTC"

    aput-object v3, v2, v4

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 52
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/CryptoTrade;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "WDC"

    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "USD"

    aput-object v3, v2, v4

    const-string v3, "BTC"

    aput-object v3, v2, v5

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 56
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/CryptoTrade;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "DGC"

    new-array v2, v5, [Ljava/lang/String;

    const-string v3, "BTC"

    aput-object v3, v2, v4

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/CryptoTrade;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "UTC"

    new-array v2, v7, [Ljava/lang/String;

    const-string v3, "USD"

    aput-object v3, v2, v4

    const-string v3, "EUR"

    aput-object v3, v2, v5

    const-string v3, "BTC"

    aput-object v3, v2, v6

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .prologue
    .line 67
    const-string v0, "Crypto-Trade"

    const-string v1, "Crypto Trade"

    sget-object v2, Lcom/mobnetic/coinguardian/model/market/CryptoTrade;->CURRENCY_PAIRS:Ljava/util/HashMap;

    invoke-direct {p0, v0, v1, v2}, Lcom/mobnetic/coinguardian/model/Market;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;)V

    .line 68
    return-void
.end method


# virtual methods
.method public getUrl(ILcom/mobnetic/coinguardian/model/CheckerInfo;)Ljava/lang/String;
    .locals 4
    .param p1, "requestId"    # I
    .param p2, "checkerInfo"    # Lcom/mobnetic/coinguardian/model/CheckerInfo;

    .prologue
    .line 72
    const-string v0, "https://crypto-trade.com/api/1/ticker/%1$s_%2$s"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-virtual {p2}, Lcom/mobnetic/coinguardian/model/CheckerInfo;->getCurrencyBaseLowerCase()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    invoke-virtual {p2}, Lcom/mobnetic/coinguardian/model/CheckerInfo;->getCurrencyCounterLowerCase()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected parseErrorFromJsonObject(ILorg/json/JSONObject;Lcom/mobnetic/coinguardian/model/CheckerInfo;)Ljava/lang/String;
    .locals 1
    .param p1, "requestId"    # I
    .param p2, "jsonObject"    # Lorg/json/JSONObject;
    .param p3, "checkerInfo"    # Lcom/mobnetic/coinguardian/model/CheckerInfo;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 89
    const-string v0, "error"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
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
    .line 77
    const-string v1, "data"

    invoke-virtual {p2, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 79
    .local v0, "dataObject":Lorg/json/JSONObject;
    const-string v1, "max_bid"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v2

    iput-wide v2, p3, Lcom/mobnetic/coinguardian/model/Ticker;->bid:D

    .line 80
    const-string v1, "min_ask"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v2

    iput-wide v2, p3, Lcom/mobnetic/coinguardian/model/Ticker;->ask:D

    .line 81
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "vol_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p4}, Lcom/mobnetic/coinguardian/model/CheckerInfo;->getCurrencyBaseLowerCase()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v2

    iput-wide v2, p3, Lcom/mobnetic/coinguardian/model/Ticker;->vol:D

    .line 82
    const-string v1, "high"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v2

    iput-wide v2, p3, Lcom/mobnetic/coinguardian/model/Ticker;->high:D

    .line 83
    const-string v1, "low"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v2

    iput-wide v2, p3, Lcom/mobnetic/coinguardian/model/Ticker;->low:D

    .line 84
    const-string v1, "last"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v2

    iput-wide v2, p3, Lcom/mobnetic/coinguardian/model/Ticker;->last:D

    .line 85
    return-void
.end method
