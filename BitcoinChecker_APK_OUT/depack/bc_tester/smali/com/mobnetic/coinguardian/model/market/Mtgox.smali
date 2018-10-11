.class public Lcom/mobnetic/coinguardian/model/market/Mtgox;
.super Lcom/mobnetic/coinguardian/model/Market;
.source "Mtgox.java"


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

.field private static final NAME:Ljava/lang/String; = "Mtgox"

.field private static final TTS_NAME:Ljava/lang/String; = "MT gox"

.field private static final URL:Ljava/lang/String; = "https://data.mtgox.com/api/2/%1$s%2$s/money/ticker"


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    .line 20
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    sput-object v0, Lcom/mobnetic/coinguardian/model/market/Mtgox;->CURRENCY_PAIRS:Ljava/util/HashMap;

    .line 22
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Mtgox;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "BTC"

    const/16 v2, 0x10

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "USD"

    aput-object v4, v2, v3

    const/4 v3, 0x1

    const-string v4, "EUR"

    aput-object v4, v2, v3

    const/4 v3, 0x2

    const-string v4, "CAD"

    aput-object v4, v2, v3

    const/4 v3, 0x3

    const-string v4, "GBP"

    aput-object v4, v2, v3

    const/4 v3, 0x4

    const-string v4, "CHF"

    aput-object v4, v2, v3

    const/4 v3, 0x5

    const-string v4, "RUB"

    aput-object v4, v2, v3

    const/4 v3, 0x6

    const-string v4, "AUD"

    aput-object v4, v2, v3

    const/4 v3, 0x7

    const-string v4, "SEK"

    aput-object v4, v2, v3

    const/16 v3, 0x8

    const-string v4, "DKK"

    aput-object v4, v2, v3

    const/16 v3, 0x9

    const-string v4, "HKD"

    aput-object v4, v2, v3

    const/16 v3, 0xa

    const-string v4, "PLN"

    aput-object v4, v2, v3

    const/16 v3, 0xb

    const-string v4, "CNY"

    aput-object v4, v2, v3

    const/16 v3, 0xc

    const-string v4, "SGD"

    aput-object v4, v2, v3

    const/16 v3, 0xd

    const-string v4, "THB"

    aput-object v4, v2, v3

    const/16 v3, 0xe

    const-string v4, "NZD"

    aput-object v4, v2, v3

    const/16 v3, 0xf

    const-string v4, "JPY"

    aput-object v4, v2, v3

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .prologue
    .line 43
    const-string v0, "Mtgox"

    const-string v1, "MT gox"

    sget-object v2, Lcom/mobnetic/coinguardian/model/market/Mtgox;->CURRENCY_PAIRS:Ljava/util/HashMap;

    invoke-direct {p0, v0, v1, v2}, Lcom/mobnetic/coinguardian/model/Market;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;)V

    .line 44
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
    .line 65
    invoke-virtual {p1, p2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 66
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
    .line 48
    const-string v0, "https://data.mtgox.com/api/2/%1$s%2$s/money/ticker"

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
    .line 53
    const-string v1, "data"

    invoke-virtual {p2, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 55
    .local v0, "dataObject":Lorg/json/JSONObject;
    const-string v1, "buy"

    invoke-direct {p0, v0, v1}, Lcom/mobnetic/coinguardian/model/market/Mtgox;->getPriceValueFromObject(Lorg/json/JSONObject;Ljava/lang/String;)D

    move-result-wide v2

    iput-wide v2, p3, Lcom/mobnetic/coinguardian/model/Ticker;->bid:D

    .line 56
    const-string v1, "sell"

    invoke-direct {p0, v0, v1}, Lcom/mobnetic/coinguardian/model/market/Mtgox;->getPriceValueFromObject(Lorg/json/JSONObject;Ljava/lang/String;)D

    move-result-wide v2

    iput-wide v2, p3, Lcom/mobnetic/coinguardian/model/Ticker;->ask:D

    .line 57
    const-string v1, "vol"

    invoke-direct {p0, v0, v1}, Lcom/mobnetic/coinguardian/model/market/Mtgox;->getPriceValueFromObject(Lorg/json/JSONObject;Ljava/lang/String;)D

    move-result-wide v2

    iput-wide v2, p3, Lcom/mobnetic/coinguardian/model/Ticker;->vol:D

    .line 58
    const-string v1, "high"

    invoke-direct {p0, v0, v1}, Lcom/mobnetic/coinguardian/model/market/Mtgox;->getPriceValueFromObject(Lorg/json/JSONObject;Ljava/lang/String;)D

    move-result-wide v2

    iput-wide v2, p3, Lcom/mobnetic/coinguardian/model/Ticker;->high:D

    .line 59
    const-string v1, "low"

    invoke-direct {p0, v0, v1}, Lcom/mobnetic/coinguardian/model/market/Mtgox;->getPriceValueFromObject(Lorg/json/JSONObject;Ljava/lang/String;)D

    move-result-wide v2

    iput-wide v2, p3, Lcom/mobnetic/coinguardian/model/Ticker;->low:D

    .line 60
    const-string v1, "last_local"

    invoke-direct {p0, v0, v1}, Lcom/mobnetic/coinguardian/model/market/Mtgox;->getPriceValueFromObject(Lorg/json/JSONObject;Ljava/lang/String;)D

    move-result-wide v2

    iput-wide v2, p3, Lcom/mobnetic/coinguardian/model/Ticker;->last:D

    .line 61
    const-string v1, "now"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v2

    const-wide/16 v4, 0x3e8

    div-long/2addr v2, v4

    iput-wide v2, p3, Lcom/mobnetic/coinguardian/model/Ticker;->timestamp:J

    .line 62
    return-void
.end method
