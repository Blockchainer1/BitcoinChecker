.class public Lcom/mobnetic/coinguardian/model/market/Bithumb;
.super Lcom/mobnetic/coinguardian/model/Market;
.source "Bithumb.java"


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

.field private static final NAME:Ljava/lang/String; = "Bithumb"

.field private static final TTS_NAME:Ljava/lang/String; = "Bithumb"

.field private static final URL_ORDERS:Ljava/lang/String; = "https://api.bithumb.com/public/orderbook/%1$s?count=1"

.field private static final URL_TICKER:Ljava/lang/String; = "https://api.bithumb.com/public/ticker/%1$s"


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 21
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    sput-object v0, Lcom/mobnetic/coinguardian/model/market/Bithumb;->CURRENCY_PAIRS:Ljava/util/HashMap;

    .line 24
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Bithumb;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "BTC"

    new-array v2, v5, [Ljava/lang/String;

    const-string v3, "KRW"

    aput-object v3, v2, v4

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Bithumb;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "ETH"

    new-array v2, v5, [Ljava/lang/String;

    const-string v3, "KRW"

    aput-object v3, v2, v4

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 30
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Bithumb;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "ETC"

    new-array v2, v5, [Ljava/lang/String;

    const-string v3, "KRW"

    aput-object v3, v2, v4

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Bithumb;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "DASH"

    new-array v2, v5, [Ljava/lang/String;

    const-string v3, "KRW"

    aput-object v3, v2, v4

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 36
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Bithumb;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "LTC"

    new-array v2, v5, [Ljava/lang/String;

    const-string v3, "KRW"

    aput-object v3, v2, v4

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 39
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Bithumb;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "XRP"

    new-array v2, v5, [Ljava/lang/String;

    const-string v3, "KRW"

    aput-object v3, v2, v4

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 42
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Bithumb;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "BCH"

    new-array v2, v5, [Ljava/lang/String;

    const-string v3, "KRW"

    aput-object v3, v2, v4

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 45
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Bithumb;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "XMR"

    new-array v2, v5, [Ljava/lang/String;

    const-string v3, "KRW"

    aput-object v3, v2, v4

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 48
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Bithumb;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "ZEC"

    new-array v2, v5, [Ljava/lang/String;

    const-string v3, "KRW"

    aput-object v3, v2, v4

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 51
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Bithumb;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "QTUM"

    new-array v2, v5, [Ljava/lang/String;

    const-string v3, "KRW"

    aput-object v3, v2, v4

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 54
    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .prologue
    .line 57
    const-string v0, "Bithumb"

    const-string v1, "Bithumb"

    sget-object v2, Lcom/mobnetic/coinguardian/model/market/Bithumb;->CURRENCY_PAIRS:Ljava/util/HashMap;

    invoke-direct {p0, v0, v1, v2}, Lcom/mobnetic/coinguardian/model/Market;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;)V

    .line 58
    return-void
.end method

.method private getFirstPriceFromOrder(Lorg/json/JSONObject;Ljava/lang/String;)D
    .locals 4
    .param p1, "jsonObject"    # Lorg/json/JSONObject;
    .param p2, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 98
    invoke-virtual {p1, p2}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    .line 100
    .local v0, "array":Lorg/json/JSONArray;
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-nez v2, :cond_0

    .line 101
    const-wide/high16 v2, -0x4010000000000000L    # -1.0

    .line 105
    :goto_0
    return-wide v2

    .line 104
    :cond_0
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v1

    .line 105
    .local v1, "first":Lorg/json/JSONObject;
    const-string v2, "price"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v2

    goto :goto_0
.end method


# virtual methods
.method public getNumOfRequests(Lcom/mobnetic/coinguardian/model/CheckerInfo;)I
    .locals 1
    .param p1, "checkerRecord"    # Lcom/mobnetic/coinguardian/model/CheckerInfo;

    .prologue
    .line 62
    const/4 v0, 0x2

    return v0
.end method

.method public getUrl(ILcom/mobnetic/coinguardian/model/CheckerInfo;)Ljava/lang/String;
    .locals 4
    .param p1, "requestId"    # I
    .param p2, "checkerInfo"    # Lcom/mobnetic/coinguardian/model/CheckerInfo;

    .prologue
    const/4 v1, 0x1

    const/4 v3, 0x0

    .line 67
    if-nez p1, :cond_0

    .line 68
    const-string v0, "https://api.bithumb.com/public/ticker/%1$s"

    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {p2}, Lcom/mobnetic/coinguardian/model/CheckerInfo;->getCurrencyBaseLowerCase()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 70
    :goto_0
    return-object v0

    :cond_0
    const-string v0, "https://api.bithumb.com/public/orderbook/%1$s?count=1"

    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {p2}, Lcom/mobnetic/coinguardian/model/CheckerInfo;->getCurrencyBaseLowerCase()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
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
    .line 94
    const-string v0, "message"

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
    if-nez p1, :cond_0

    .line 80
    const-string v1, "volume_1day"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v2

    iput-wide v2, p3, Lcom/mobnetic/coinguardian/model/Ticker;->vol:D

    .line 81
    const-string v1, "max_price"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v2

    iput-wide v2, p3, Lcom/mobnetic/coinguardian/model/Ticker;->high:D

    .line 82
    const-string v1, "min_price"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v2

    iput-wide v2, p3, Lcom/mobnetic/coinguardian/model/Ticker;->low:D

    .line 83
    const-string v1, "closing_price"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v2

    iput-wide v2, p3, Lcom/mobnetic/coinguardian/model/Ticker;->last:D

    .line 84
    const-string v1, "date"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v2

    iput-wide v2, p3, Lcom/mobnetic/coinguardian/model/Ticker;->timestamp:J

    .line 89
    :goto_0
    return-void

    .line 86
    :cond_0
    const-string v1, "bids"

    invoke-direct {p0, v0, v1}, Lcom/mobnetic/coinguardian/model/market/Bithumb;->getFirstPriceFromOrder(Lorg/json/JSONObject;Ljava/lang/String;)D

    move-result-wide v2

    iput-wide v2, p3, Lcom/mobnetic/coinguardian/model/Ticker;->bid:D

    .line 87
    const-string v1, "asks"

    invoke-direct {p0, v0, v1}, Lcom/mobnetic/coinguardian/model/market/Bithumb;->getFirstPriceFromOrder(Lorg/json/JSONObject;Ljava/lang/String;)D

    move-result-wide v2

    iput-wide v2, p3, Lcom/mobnetic/coinguardian/model/Ticker;->ask:D

    goto :goto_0
.end method
