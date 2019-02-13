.class public Lcom/mobnetic/coinguardian/model/market/Dashcurex;
.super Lcom/mobnetic/coinguardian/model/Market;
.source "Dashcurex.java"


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

.field private static final NAME:Ljava/lang/String; = "Dashcurex"

.field private static final TTS_NAME:Ljava/lang/String; = "Dashcurex"

.field private static final URL:Ljava/lang/String; = "https://dashcurex.com/api/%1$s/ticker.json"


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    .line 19
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    sput-object v0, Lcom/mobnetic/coinguardian/model/market/Dashcurex;->CURRENCY_PAIRS:Ljava/util/HashMap;

    .line 21
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Dashcurex;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "DASH"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "PLN"

    aput-object v4, v2, v3

    const/4 v3, 0x1

    const-string v4, "USD"

    aput-object v4, v2, v3

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .prologue
    .line 28
    const-string v0, "Dashcurex"

    const-string v1, "Dashcurex"

    sget-object v2, Lcom/mobnetic/coinguardian/model/market/Dashcurex;->CURRENCY_PAIRS:Ljava/util/HashMap;

    invoke-direct {p0, v0, v1, v2}, Lcom/mobnetic/coinguardian/model/Market;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;)V

    .line 29
    return-void
.end method

.method private parseBTC(D)D
    .locals 3
    .param p1, "satoshi"    # D

    .prologue
    .line 51
    const-wide v0, 0x4197d78400000000L    # 1.0E8

    div-double v0, p1, v0

    return-wide v0
.end method

.method private parsePrice(D)D
    .locals 3
    .param p1, "price"    # D

    .prologue
    .line 47
    const-wide v0, 0x40c3880000000000L    # 10000.0

    div-double v0, p1, v0

    return-wide v0
.end method


# virtual methods
.method public getUrl(ILcom/mobnetic/coinguardian/model/CheckerInfo;)Ljava/lang/String;
    .locals 4
    .param p1, "requestId"    # I
    .param p2, "checkerInfo"    # Lcom/mobnetic/coinguardian/model/CheckerInfo;

    .prologue
    .line 33
    const-string v0, "https://dashcurex.com/api/%1$s/ticker.json"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-virtual {p2}, Lcom/mobnetic/coinguardian/model/CheckerInfo;->getCurrencyCounterLowerCase()Ljava/lang/String;

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
    .line 38
    const-string v0, "best_ask"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v0

    invoke-direct {p0, v0, v1}, Lcom/mobnetic/coinguardian/model/market/Dashcurex;->parsePrice(D)D

    move-result-wide v0

    iput-wide v0, p3, Lcom/mobnetic/coinguardian/model/Ticker;->bid:D

    .line 39
    const-string v0, "best_bid"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v0

    invoke-direct {p0, v0, v1}, Lcom/mobnetic/coinguardian/model/market/Dashcurex;->parsePrice(D)D

    move-result-wide v0

    iput-wide v0, p3, Lcom/mobnetic/coinguardian/model/Ticker;->ask:D

    .line 40
    const-string v0, "total_volume"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v0

    invoke-direct {p0, v0, v1}, Lcom/mobnetic/coinguardian/model/market/Dashcurex;->parseBTC(D)D

    move-result-wide v0

    iput-wide v0, p3, Lcom/mobnetic/coinguardian/model/Ticker;->vol:D

    .line 41
    const-string v0, "highest_tx_price"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v0

    invoke-direct {p0, v0, v1}, Lcom/mobnetic/coinguardian/model/market/Dashcurex;->parsePrice(D)D

    move-result-wide v0

    iput-wide v0, p3, Lcom/mobnetic/coinguardian/model/Ticker;->high:D

    .line 42
    const-string v0, "lowest_tx_price"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v0

    invoke-direct {p0, v0, v1}, Lcom/mobnetic/coinguardian/model/market/Dashcurex;->parsePrice(D)D

    move-result-wide v0

    iput-wide v0, p3, Lcom/mobnetic/coinguardian/model/Ticker;->low:D

    .line 43
    const-string v0, "last_tx_price"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v0

    invoke-direct {p0, v0, v1}, Lcom/mobnetic/coinguardian/model/market/Dashcurex;->parsePrice(D)D

    move-result-wide v0

    iput-wide v0, p3, Lcom/mobnetic/coinguardian/model/Ticker;->last:D

    .line 44
    return-void
.end method
