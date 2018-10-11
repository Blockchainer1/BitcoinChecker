.class public Lcom/mobnetic/coinguardian/model/market/Justcoin;
.super Lcom/mobnetic/coinguardian/model/Market;
.source "Justcoin.java"


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

.field private static final NAME:Ljava/lang/String; = "Justcoin"

.field private static final TTS_NAME:Ljava/lang/String; = "Just coin"

.field private static final URL:Ljava/lang/String; = "https://justcoin.com/api/2/%1$s%2$s/money/ticker"


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 19
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    sput-object v0, Lcom/mobnetic/coinguardian/model/market/Justcoin;->CURRENCY_PAIRS:Ljava/util/HashMap;

    .line 21
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Justcoin;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "BTC"

    const/16 v2, 0xa

    new-array v2, v2, [Ljava/lang/String;

    const-string v3, "USD"

    aput-object v3, v2, v5

    const-string v3, "EUR"

    aput-object v3, v2, v6

    const/4 v3, 0x2

    const-string v4, "GBP"

    aput-object v4, v2, v3

    const/4 v3, 0x3

    const-string v4, "HKD"

    aput-object v4, v2, v3

    const/4 v3, 0x4

    const-string v4, "CHF"

    aput-object v4, v2, v3

    const/4 v3, 0x5

    const-string v4, "AUD"

    aput-object v4, v2, v3

    const/4 v3, 0x6

    const-string v4, "CAD"

    aput-object v4, v2, v3

    const/4 v3, 0x7

    const-string v4, "NZD"

    aput-object v4, v2, v3

    const/16 v3, 0x8

    const-string v4, "SGD"

    aput-object v4, v2, v3

    const/16 v3, 0x9

    const-string v4, "JPY"

    aput-object v4, v2, v3

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Justcoin;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "LTC"

    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "BTC"

    aput-object v3, v2, v5

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 36
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Justcoin;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "DOGE"

    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "BTC"

    aput-object v3, v2, v5

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 39
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Justcoin;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "STR"

    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "BTC"

    aput-object v3, v2, v5

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 42
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Justcoin;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "XRP"

    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "BTC"

    aput-object v3, v2, v5

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 45
    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .prologue
    .line 48
    const-string v0, "Justcoin"

    const-string v1, "Just coin"

    sget-object v2, Lcom/mobnetic/coinguardian/model/market/Justcoin;->CURRENCY_PAIRS:Ljava/util/HashMap;

    invoke-direct {p0, v0, v1, v2}, Lcom/mobnetic/coinguardian/model/Market;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;)V

    .line 49
    return-void
.end method

.method private getPriceValueFromObject(Lorg/json/JSONObject;Ljava/lang/String;)D
    .locals 4
    .param p1, "jsonObject"    # Lorg/json/JSONObject;
    .param p2, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 69
    invoke-virtual {p1, p2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 70
    .local v0, "innerObject":Lorg/json/JSONObject;
    const-string v1, "value"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v2

    return-wide v2
.end method


# virtual methods
.method public getUrl(ILcom/mobnetic/coinguardian/model/CheckerInfo;)Ljava/lang/String;
    .locals 4
    .param p1, "requestId"    # I
    .param p2, "checkerInfo"    # Lcom/mobnetic/coinguardian/model/CheckerInfo;

    .prologue
    .line 53
    const-string v0, "https://justcoin.com/api/2/%1$s%2$s/money/ticker"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-virtual {p2}, Lcom/mobnetic/coinguardian/model/CheckerInfo;->getCurrencyBase()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    invoke-virtual {p2}, Lcom/mobnetic/coinguardian/model/CheckerInfo;->getCurrencyCounter()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

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
    .line 58
    const-string v1, "data"

    invoke-virtual {p2, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 60
    .local v0, "dataObject":Lorg/json/JSONObject;
    const-string v1, "buy"

    invoke-direct {p0, v0, v1}, Lcom/mobnetic/coinguardian/model/market/Justcoin;->getPriceValueFromObject(Lorg/json/JSONObject;Ljava/lang/String;)D

    move-result-wide v2

    iput-wide v2, p3, Lcom/mobnetic/coinguardian/model/Ticker;->bid:D

    .line 61
    const-string v1, "sell"

    invoke-direct {p0, v0, v1}, Lcom/mobnetic/coinguardian/model/market/Justcoin;->getPriceValueFromObject(Lorg/json/JSONObject;Ljava/lang/String;)D

    move-result-wide v2

    iput-wide v2, p3, Lcom/mobnetic/coinguardian/model/Ticker;->ask:D

    .line 62
    const-string v1, "vol"

    invoke-direct {p0, v0, v1}, Lcom/mobnetic/coinguardian/model/market/Justcoin;->getPriceValueFromObject(Lorg/json/JSONObject;Ljava/lang/String;)D

    move-result-wide v2

    iput-wide v2, p3, Lcom/mobnetic/coinguardian/model/Ticker;->vol:D

    .line 63
    const-string v1, "high"

    invoke-direct {p0, v0, v1}, Lcom/mobnetic/coinguardian/model/market/Justcoin;->getPriceValueFromObject(Lorg/json/JSONObject;Ljava/lang/String;)D

    move-result-wide v2

    iput-wide v2, p3, Lcom/mobnetic/coinguardian/model/Ticker;->high:D

    .line 64
    const-string v1, "low"

    invoke-direct {p0, v0, v1}, Lcom/mobnetic/coinguardian/model/market/Justcoin;->getPriceValueFromObject(Lorg/json/JSONObject;Ljava/lang/String;)D

    move-result-wide v2

    iput-wide v2, p3, Lcom/mobnetic/coinguardian/model/Ticker;->low:D

    .line 65
    const-string v1, "last"

    invoke-direct {p0, v0, v1}, Lcom/mobnetic/coinguardian/model/market/Justcoin;->getPriceValueFromObject(Lorg/json/JSONObject;Ljava/lang/String;)D

    move-result-wide v2

    iput-wide v2, p3, Lcom/mobnetic/coinguardian/model/Ticker;->last:D

    .line 66
    return-void
.end method
