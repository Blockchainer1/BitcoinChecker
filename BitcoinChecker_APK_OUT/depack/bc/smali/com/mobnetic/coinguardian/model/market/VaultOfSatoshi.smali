.class public Lcom/mobnetic/coinguardian/model/market/VaultOfSatoshi;
.super Lcom/mobnetic/coinguardian/model/Market;
.source "VaultOfSatoshi.java"


# static fields
.field private static final NAME:Ljava/lang/String; = "VaultOfSatoshi"

.field private static final TTS_NAME:Ljava/lang/String; = "Vault Of Satoshi"

.field private static final URL:Ljava/lang/String; = "https://api.vaultofsatoshi.com/public/ticker?order_currency=%1$s&payment_currency=%2$s"

.field private static final URL_CURRENCY_PAIRS:Ljava/lang/String; = "https://api.vaultofsatoshi.com/public/currency"


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    .line 22
    const-string v0, "VaultOfSatoshi"

    const-string v1, "Vault Of Satoshi"

    const/4 v2, 0x0

    invoke-direct {p0, v0, v1, v2}, Lcom/mobnetic/coinguardian/model/Market;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;)V

    .line 23
    return-void
.end method

.method private getDoubleFromMtgoxFormatObject(Lorg/json/JSONObject;Ljava/lang/String;)D
    .locals 4
    .param p1, "jsonObject"    # Lorg/json/JSONObject;
    .param p2, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 42
    invoke-virtual {p1, p2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 43
    .local v0, "innerObject":Lorg/json/JSONObject;
    const-string v1, "value"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v2

    return-wide v2
.end method


# virtual methods
.method public getCurrencyPairsUrl(I)Ljava/lang/String;
    .locals 1
    .param p1, "requestId"    # I

    .prologue
    .line 51
    const-string v0, "https://api.vaultofsatoshi.com/public/currency"

    return-object v0
.end method

.method public getUrl(ILcom/mobnetic/coinguardian/model/CheckerInfo;)Ljava/lang/String;
    .locals 4
    .param p1, "requestId"    # I
    .param p2, "checkerInfo"    # Lcom/mobnetic/coinguardian/model/CheckerInfo;

    .prologue
    .line 27
    const-string v0, "https://api.vaultofsatoshi.com/public/ticker?order_currency=%1$s&payment_currency=%2$s"

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

.method protected parseCurrencyPairsFromJsonObject(ILorg/json/JSONObject;Ljava/util/List;)V
    .locals 12
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
    const/4 v11, 0x0

    .line 56
    const-string v8, "data"

    invoke-virtual {p2, v8}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v3

    .line 57
    .local v3, "dataJsonArray":Lorg/json/JSONArray;
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 58
    .local v6, "virtualCurrencies":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 59
    .local v0, "currencies":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v8

    if-ge v4, v8, :cond_1

    .line 60
    invoke-virtual {v3, v4}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    .line 61
    .local v2, "currencyJsonObject":Lorg/json/JSONObject;
    const-string v8, "virtual"

    invoke-virtual {v2, v8}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v8

    if-eqz v8, :cond_0

    .line 62
    const-string v8, "code"

    invoke-virtual {v2, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 59
    :goto_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 64
    :cond_0
    const-string v8, "code"

    invoke-virtual {v2, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 67
    .end local v2    # "currencyJsonObject":Lorg/json/JSONObject;
    :cond_1
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v7

    .line 68
    .local v7, "virtualCurrenciesCount":I
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    .line 69
    .local v1, "currenciesCount":I
    const/4 v4, 0x0

    :goto_2
    if-ge v4, v7, :cond_5

    .line 70
    const/4 v5, 0x0

    .local v5, "j":I
    :goto_3
    if-ge v5, v1, :cond_2

    .line 71
    new-instance v10, Lcom/mobnetic/coinguardian/model/CurrencyPairInfo;

    invoke-virtual {v6, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    invoke-direct {v10, v8, v9, v11}, Lcom/mobnetic/coinguardian/model/CurrencyPairInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {p3, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 70
    add-int/lit8 v5, v5, 0x1

    goto :goto_3

    .line 73
    :cond_2
    const/4 v5, 0x0

    :goto_4
    if-ge v5, v7, :cond_4

    .line 74
    if-eq v4, v5, :cond_3

    .line 75
    new-instance v10, Lcom/mobnetic/coinguardian/model/CurrencyPairInfo;

    invoke-virtual {v6, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v6, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    invoke-direct {v10, v8, v9, v11}, Lcom/mobnetic/coinguardian/model/CurrencyPairInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {p3, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 73
    :cond_3
    add-int/lit8 v5, v5, 0x1

    goto :goto_4

    .line 69
    :cond_4
    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    .line 78
    .end local v5    # "j":I
    :cond_5
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
    .line 32
    const-string v1, "data"

    invoke-virtual {p2, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 34
    .local v0, "dataObject":Lorg/json/JSONObject;
    const-string v1, "volume_1day"

    invoke-direct {p0, v0, v1}, Lcom/mobnetic/coinguardian/model/market/VaultOfSatoshi;->getDoubleFromMtgoxFormatObject(Lorg/json/JSONObject;Ljava/lang/String;)D

    move-result-wide v2

    iput-wide v2, p3, Lcom/mobnetic/coinguardian/model/Ticker;->vol:D

    .line 35
    const-string v1, "max_price"

    invoke-direct {p0, v0, v1}, Lcom/mobnetic/coinguardian/model/market/VaultOfSatoshi;->getDoubleFromMtgoxFormatObject(Lorg/json/JSONObject;Ljava/lang/String;)D

    move-result-wide v2

    iput-wide v2, p3, Lcom/mobnetic/coinguardian/model/Ticker;->high:D

    .line 36
    const-string v1, "min_price"

    invoke-direct {p0, v0, v1}, Lcom/mobnetic/coinguardian/model/market/VaultOfSatoshi;->getDoubleFromMtgoxFormatObject(Lorg/json/JSONObject;Ljava/lang/String;)D

    move-result-wide v2

    iput-wide v2, p3, Lcom/mobnetic/coinguardian/model/Ticker;->low:D

    .line 37
    const-string v1, "closing_price"

    invoke-direct {p0, v0, v1}, Lcom/mobnetic/coinguardian/model/market/VaultOfSatoshi;->getDoubleFromMtgoxFormatObject(Lorg/json/JSONObject;Ljava/lang/String;)D

    move-result-wide v2

    iput-wide v2, p3, Lcom/mobnetic/coinguardian/model/Ticker;->last:D

    .line 38
    const-string v1, "date"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v2

    iput-wide v2, p3, Lcom/mobnetic/coinguardian/model/Ticker;->timestamp:J

    .line 39
    return-void
.end method
