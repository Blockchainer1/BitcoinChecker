.class public Lcom/mobnetic/coinguardian/model/market/BitBay;
.super Lcom/mobnetic/coinguardian/model/Market;
.source "BitBay.java"


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

.field private static final NAME:Ljava/lang/String; = "BitBay.net"

.field private static final TTS_NAME:Ljava/lang/String; = "Bit Bay"

.field private static final URL:Ljava/lang/String; = "https://bitbay.net/API/Public/%1$s%2$s/ticker.json"


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .prologue
    const/4 v8, 0x4

    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 19
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    sput-object v0, Lcom/mobnetic/coinguardian/model/market/BitBay;->CURRENCY_PAIRS:Ljava/util/HashMap;

    .line 21
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/BitBay;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "BCC"

    new-array v2, v8, [Ljava/lang/String;

    const-string v3, "BTC"

    aput-object v3, v2, v4

    const-string v3, "PLN"

    aput-object v3, v2, v5

    const-string v3, "USD"

    aput-object v3, v2, v6

    const-string v3, "EUR"

    aput-object v3, v2, v7

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/BitBay;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "BTC"

    new-array v2, v7, [Ljava/lang/String;

    const-string v3, "PLN"

    aput-object v3, v2, v4

    const-string v3, "USD"

    aput-object v3, v2, v5

    const-string v3, "EUR"

    aput-object v3, v2, v6

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/BitBay;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "DASH"

    new-array v2, v8, [Ljava/lang/String;

    const-string v3, "BTC"

    aput-object v3, v2, v4

    const-string v3, "PLN"

    aput-object v3, v2, v5

    const-string v3, "USD"

    aput-object v3, v2, v6

    const-string v3, "EUR"

    aput-object v3, v2, v7

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/BitBay;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "GAME"

    new-array v2, v8, [Ljava/lang/String;

    const-string v3, "BTC"

    aput-object v3, v2, v4

    const-string v3, "PLN"

    aput-object v3, v2, v5

    const-string v3, "USD"

    aput-object v3, v2, v6

    const-string v3, "EUR"

    aput-object v3, v2, v7

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/BitBay;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "LTC"

    new-array v2, v8, [Ljava/lang/String;

    const-string v3, "BTC"

    aput-object v3, v2, v4

    const-string v3, "PLN"

    aput-object v3, v2, v5

    const-string v3, "USD"

    aput-object v3, v2, v6

    const-string v3, "EUR"

    aput-object v3, v2, v7

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/BitBay;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "ETH"

    new-array v2, v8, [Ljava/lang/String;

    const-string v3, "BTC"

    aput-object v3, v2, v4

    const-string v3, "PLN"

    aput-object v3, v2, v5

    const-string v3, "USD"

    aput-object v3, v2, v6

    const-string v3, "EUR"

    aput-object v3, v2, v7

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 56
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/BitBay;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "LSK"

    new-array v2, v8, [Ljava/lang/String;

    const-string v3, "BTC"

    aput-object v3, v2, v4

    const-string v3, "PLN"

    aput-object v3, v2, v5

    const-string v3, "USD"

    aput-object v3, v2, v6

    const-string v3, "EUR"

    aput-object v3, v2, v7

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 62
    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .prologue
    .line 65
    const-string v0, "BitBay.net"

    const-string v1, "Bit Bay"

    sget-object v2, Lcom/mobnetic/coinguardian/model/market/BitBay;->CURRENCY_PAIRS:Ljava/util/HashMap;

    invoke-direct {p0, v0, v1, v2}, Lcom/mobnetic/coinguardian/model/Market;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;)V

    .line 66
    return-void
.end method


# virtual methods
.method public getUrl(ILcom/mobnetic/coinguardian/model/CheckerInfo;)Ljava/lang/String;
    .locals 4
    .param p1, "requestId"    # I
    .param p2, "checkerInfo"    # Lcom/mobnetic/coinguardian/model/CheckerInfo;

    .prologue
    .line 70
    const-string v0, "https://bitbay.net/API/Public/%1$s%2$s/ticker.json"

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
    .line 75
    const-string v0, "bid"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v0

    iput-wide v0, p3, Lcom/mobnetic/coinguardian/model/Ticker;->bid:D

    .line 76
    const-string v0, "ask"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v0

    iput-wide v0, p3, Lcom/mobnetic/coinguardian/model/Ticker;->ask:D

    .line 77
    const-string v0, "volume"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v0

    iput-wide v0, p3, Lcom/mobnetic/coinguardian/model/Ticker;->vol:D

    .line 78
    const-string v0, "max"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v0

    iput-wide v0, p3, Lcom/mobnetic/coinguardian/model/Ticker;->high:D

    .line 79
    const-string v0, "min"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v0

    iput-wide v0, p3, Lcom/mobnetic/coinguardian/model/Ticker;->low:D

    .line 80
    const-string v0, "last"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v0

    iput-wide v0, p3, Lcom/mobnetic/coinguardian/model/Ticker;->last:D

    .line 81
    return-void
.end method
