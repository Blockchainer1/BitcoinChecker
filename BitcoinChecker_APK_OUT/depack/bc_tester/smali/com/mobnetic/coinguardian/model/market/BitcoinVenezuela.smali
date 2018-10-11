.class public Lcom/mobnetic/coinguardian/model/market/BitcoinVenezuela;
.super Lcom/mobnetic/coinguardian/model/Market;
.source "BitcoinVenezuela.java"


# static fields
.field private static final NAME:Ljava/lang/String; = "BitcoinVenezuela"

.field private static final TTS_NAME:Ljava/lang/String; = "Bitcoin Venezuela"

.field private static final URL:Ljava/lang/String; = "http://api.bitcoinvenezuela.com/?html=no&currency=%1$s&amount=1&to=%2$s"

.field private static final URL_CURRENCY_PAIRS:Ljava/lang/String; = "http://api.bitcoinvenezuela.com/"


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    .line 22
    const-string v0, "BitcoinVenezuela"

    const-string v1, "Bitcoin Venezuela"

    const/4 v2, 0x0

    invoke-direct {p0, v0, v1, v2}, Lcom/mobnetic/coinguardian/model/Market;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;)V

    .line 23
    return-void
.end method

.method private parseCurrencyPairsFromCurrencyBase(Ljava/lang/String;Lorg/json/JSONObject;Ljava/util/List;)V
    .locals 6
    .param p1, "currencyBase"    # Ljava/lang/String;
    .param p2, "jsonObject"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
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
    .line 51
    .local p3, "pairs":Ljava/util/List;, "Ljava/util/List<Lcom/mobnetic/coinguardian/model/CurrencyPairInfo;>;"
    invoke-virtual {p2, p1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 62
    :cond_0
    return-void

    .line 54
    :cond_1
    invoke-virtual {p2, p1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    .line 55
    .local v1, "currencyBaseJsonObject":Lorg/json/JSONObject;
    invoke-virtual {v1}, Lorg/json/JSONObject;->names()Lorg/json/JSONArray;

    move-result-object v0

    .line 56
    .local v0, "counterCurrencyNames":Lorg/json/JSONArray;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-ge v2, v3, :cond_0

    .line 57
    new-instance v3, Lcom/mobnetic/coinguardian/model/CurrencyPairInfo;

    .line 59
    invoke-virtual {v0, v2}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    invoke-direct {v3, p1, v4, v5}, Lcom/mobnetic/coinguardian/model/CurrencyPairInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 57
    invoke-interface {p3, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 56
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method


# virtual methods
.method public getCurrencyPairsUrl(I)Ljava/lang/String;
    .locals 1
    .param p1, "requestId"    # I

    .prologue
    .line 40
    const-string v0, "http://api.bitcoinvenezuela.com/"

    return-object v0
.end method

.method public getUrl(ILcom/mobnetic/coinguardian/model/CheckerInfo;)Ljava/lang/String;
    .locals 4
    .param p1, "requestId"    # I
    .param p2, "checkerInfo"    # Lcom/mobnetic/coinguardian/model/CheckerInfo;

    .prologue
    .line 27
    const-string v0, "http://api.bitcoinvenezuela.com/?html=no&currency=%1$s&amount=1&to=%2$s"

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

.method protected parseCurrencyPairsFromJsonObject(ILorg/json/JSONObject;Ljava/util/List;)V
    .locals 1
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
    .line 45
    .local p3, "pairs":Ljava/util/List;, "Ljava/util/List<Lcom/mobnetic/coinguardian/model/CurrencyPairInfo;>;"
    const-string v0, "BTC"

    invoke-direct {p0, v0, p2, p3}, Lcom/mobnetic/coinguardian/model/market/BitcoinVenezuela;->parseCurrencyPairsFromCurrencyBase(Ljava/lang/String;Lorg/json/JSONObject;Ljava/util/List;)V

    .line 46
    const-string v0, "LTC"

    invoke-direct {p0, v0, p2, p3}, Lcom/mobnetic/coinguardian/model/market/BitcoinVenezuela;->parseCurrencyPairsFromCurrencyBase(Ljava/lang/String;Lorg/json/JSONObject;Ljava/util/List;)V

    .line 47
    const-string v0, "MSC"

    invoke-direct {p0, v0, p2, p3}, Lcom/mobnetic/coinguardian/model/market/BitcoinVenezuela;->parseCurrencyPairsFromCurrencyBase(Ljava/lang/String;Lorg/json/JSONObject;Ljava/util/List;)V

    .line 48
    return-void
.end method

.method protected parseTicker(ILjava/lang/String;Lcom/mobnetic/coinguardian/model/Ticker;Lcom/mobnetic/coinguardian/model/CheckerInfo;)V
    .locals 2
    .param p1, "requestId"    # I
    .param p2, "responseString"    # Ljava/lang/String;
    .param p3, "ticker"    # Lcom/mobnetic/coinguardian/model/Ticker;
    .param p4, "checkerInfo"    # Lcom/mobnetic/coinguardian/model/CheckerInfo;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 32
    invoke-virtual {p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v0

    iput-wide v0, p3, Lcom/mobnetic/coinguardian/model/Ticker;->last:D

    .line 33
    return-void
.end method
