.class public Lcom/mobnetic/coinguardian/model/market/BitMarketPL;
.super Lcom/mobnetic/coinguardian/model/Market;
.source "BitMarketPL.java"


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

.field private static final NAME:Ljava/lang/String; = "BitMarket.pl"

.field private static final SYMBOL_SWAP:Ljava/lang/String; = "SWAP"

.field private static final TTS_NAME:Ljava/lang/String; = "Bit Market"

.field private static final URL:Ljava/lang/String; = "https://www.bitmarket.pl/json/%1$s%2$s/ticker.json"

.field private static final URL_SWAP:Ljava/lang/String; = "https://bitmarket.pl/json/swap%1$s/swap.json"


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 22
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    sput-object v0, Lcom/mobnetic/coinguardian/model/market/BitMarketPL;->CURRENCY_PAIRS:Ljava/util/HashMap;

    .line 24
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/BitMarketPL;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "BTC"

    new-array v2, v7, [Ljava/lang/String;

    const-string v3, "EUR"

    aput-object v3, v2, v4

    const-string v3, "PLN"

    aput-object v3, v2, v5

    const-string v3, "SWAP"

    aput-object v3, v2, v6

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/BitMarketPL;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "BCC"

    new-array v2, v5, [Ljava/lang/String;

    const-string v3, "PLN"

    aput-object v3, v2, v4

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/BitMarketPL;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "LTC"

    new-array v2, v7, [Ljava/lang/String;

    const-string v3, "BTC"

    aput-object v3, v2, v4

    const-string v3, "PLN"

    aput-object v3, v2, v5

    const-string v3, "SWAP"

    aput-object v3, v2, v6

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/BitMarketPL;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "ETH"

    new-array v2, v5, [Ljava/lang/String;

    const-string v3, "SWAP"

    aput-object v3, v2, v4

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .prologue
    .line 43
    const-string v0, "BitMarket.pl"

    const-string v1, "Bit Market"

    sget-object v2, Lcom/mobnetic/coinguardian/model/market/BitMarketPL;->CURRENCY_PAIRS:Ljava/util/HashMap;

    invoke-direct {p0, v0, v1, v2}, Lcom/mobnetic/coinguardian/model/Market;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;)V

    .line 44
    return-void
.end method

.method private isSwap(Lcom/mobnetic/coinguardian/model/CheckerInfo;)Z
    .locals 2
    .param p1, "checkerInfo"    # Lcom/mobnetic/coinguardian/model/CheckerInfo;

    .prologue
    .line 47
    const-string v0, "SWAP"

    invoke-virtual {p1}, Lcom/mobnetic/coinguardian/model/CheckerInfo;->getCurrencyCounter()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method


# virtual methods
.method public getUrl(ILcom/mobnetic/coinguardian/model/CheckerInfo;)Ljava/lang/String;
    .locals 5
    .param p1, "requestId"    # I
    .param p2, "checkerInfo"    # Lcom/mobnetic/coinguardian/model/CheckerInfo;

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 52
    invoke-direct {p0, p2}, Lcom/mobnetic/coinguardian/model/market/BitMarketPL;->isSwap(Lcom/mobnetic/coinguardian/model/CheckerInfo;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 53
    const-string v0, "https://bitmarket.pl/json/swap%1$s/swap.json"

    new-array v1, v4, [Ljava/lang/Object;

    invoke-virtual {p2}, Lcom/mobnetic/coinguardian/model/CheckerInfo;->getCurrencyBase()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 55
    :goto_0
    return-object v0

    :cond_0
    const-string v0, "https://www.bitmarket.pl/json/%1$s%2$s/ticker.json"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {p2}, Lcom/mobnetic/coinguardian/model/CheckerInfo;->getCurrencyBase()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v3

    invoke-virtual {p2}, Lcom/mobnetic/coinguardian/model/CheckerInfo;->getCurrencyCounter()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v4

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
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
    .line 60
    invoke-direct {p0, p4}, Lcom/mobnetic/coinguardian/model/market/BitMarketPL;->isSwap(Lcom/mobnetic/coinguardian/model/CheckerInfo;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 61
    const-string v0, "cutoff"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v0

    iput-wide v0, p3, Lcom/mobnetic/coinguardian/model/Ticker;->last:D

    .line 70
    :goto_0
    return-void

    .line 63
    :cond_0
    const-string v0, "bid"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v0

    iput-wide v0, p3, Lcom/mobnetic/coinguardian/model/Ticker;->bid:D

    .line 64
    const-string v0, "ask"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v0

    iput-wide v0, p3, Lcom/mobnetic/coinguardian/model/Ticker;->ask:D

    .line 65
    const-string v0, "volume"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v0

    iput-wide v0, p3, Lcom/mobnetic/coinguardian/model/Ticker;->vol:D

    .line 66
    const-string v0, "high"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v0

    iput-wide v0, p3, Lcom/mobnetic/coinguardian/model/Ticker;->high:D

    .line 67
    const-string v0, "low"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v0

    iput-wide v0, p3, Lcom/mobnetic/coinguardian/model/Ticker;->low:D

    .line 68
    const-string v0, "last"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v0

    iput-wide v0, p3, Lcom/mobnetic/coinguardian/model/Ticker;->last:D

    goto :goto_0
.end method
