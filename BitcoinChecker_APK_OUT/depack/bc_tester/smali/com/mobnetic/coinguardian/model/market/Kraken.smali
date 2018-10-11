.class public Lcom/mobnetic/coinguardian/model/market/Kraken;
.super Lcom/mobnetic/coinguardian/model/Market;
.source "Kraken.java"


# static fields
.field private static final NAME:Ljava/lang/String; = "Kraken"

.field private static final TTS_NAME:Ljava/lang/String; = "Kraken"

.field private static final URL:Ljava/lang/String; = "https://api.kraken.com/0/public/Ticker?pair=%1$s"

.field private static final URL_CURRENCY_PAIRS:Ljava/lang/String; = "https://api.kraken.com/0/public/AssetPairs"


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    .line 22
    const-string v0, "Kraken"

    const-string v1, "Kraken"

    const/4 v2, 0x0

    invoke-direct {p0, v0, v1, v2}, Lcom/mobnetic/coinguardian/model/Market;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;)V

    .line 23
    return-void
.end method

.method private fixCurrency(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "currency"    # Ljava/lang/String;

    .prologue
    .line 37
    const-string v0, "BTC"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string p1, "XBT"

    .line 40
    .end local p1    # "currency":Ljava/lang/String;
    :cond_0
    :goto_0
    return-object p1

    .line 38
    .restart local p1    # "currency":Ljava/lang/String;
    :cond_1
    const-string v0, "VEN"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    const-string p1, "XVN"

    goto :goto_0

    .line 39
    :cond_2
    const-string v0, "DOGE"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string p1, "XDG"

    goto :goto_0
.end method

.method private getDoubleFromJsonArrayObject(Lorg/json/JSONObject;Ljava/lang/String;)D
    .locals 4
    .param p1, "jsonObject"    # Lorg/json/JSONObject;
    .param p2, "arrayKey"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 57
    invoke-virtual {p1, p2}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    .line 58
    .local v0, "jsonArray":Lorg/json/JSONArray;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-lez v1, :cond_0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getDouble(I)D

    move-result-wide v2

    :goto_0
    return-wide v2

    :cond_0
    const-wide/16 v2, 0x0

    goto :goto_0
.end method

.method private parseCurrency(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "currency"    # Ljava/lang/String;

    .prologue
    .line 88
    if-eqz p1, :cond_1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    const/4 v2, 0x2

    if-lt v1, v2, :cond_1

    .line 89
    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 90
    .local v0, "firstChar":C
    const/16 v1, 0x5a

    if-eq v0, v1, :cond_0

    const/16 v1, 0x58

    if-ne v0, v1, :cond_1

    .line 91
    :cond_0
    const/4 v1, 0x1

    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    .line 94
    .end local v0    # "firstChar":C
    :cond_1
    const-string v1, "XBT"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    const-string p1, "BTC"

    .line 97
    .end local p1    # "currency":Ljava/lang/String;
    :cond_2
    :goto_0
    return-object p1

    .line 95
    .restart local p1    # "currency":Ljava/lang/String;
    :cond_3
    const-string v1, "XVN"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    const-string p1, "VEN"

    goto :goto_0

    .line 96
    :cond_4
    const-string v1, "XDG"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    const-string p1, "DOGE"

    goto :goto_0
.end method


# virtual methods
.method public getCurrencyPairsUrl(I)Ljava/lang/String;
    .locals 1
    .param p1, "requestId"    # I

    .prologue
    .line 66
    const-string v0, "https://api.kraken.com/0/public/AssetPairs"

    return-object v0
.end method

.method public getUrl(ILcom/mobnetic/coinguardian/model/CheckerInfo;)Ljava/lang/String;
    .locals 6
    .param p1, "requestId"    # I
    .param p2, "checkerInfo"    # Lcom/mobnetic/coinguardian/model/CheckerInfo;

    .prologue
    const/4 v3, 0x1

    const/4 v5, 0x0

    .line 27
    invoke-virtual {p2}, Lcom/mobnetic/coinguardian/model/CheckerInfo;->getCurrencyPairId()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 28
    const-string v2, "https://api.kraken.com/0/public/Ticker?pair=%1$s"

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {p2}, Lcom/mobnetic/coinguardian/model/CheckerInfo;->getCurrencyPairId()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 32
    :goto_0
    return-object v2

    .line 30
    :cond_0
    invoke-virtual {p2}, Lcom/mobnetic/coinguardian/model/CheckerInfo;->getCurrencyBase()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/mobnetic/coinguardian/model/market/Kraken;->fixCurrency(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 31
    .local v0, "currencyBase":Ljava/lang/String;
    invoke-virtual {p2}, Lcom/mobnetic/coinguardian/model/CheckerInfo;->getCurrencyCounter()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/mobnetic/coinguardian/model/market/Kraken;->fixCurrency(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 32
    .local v1, "currencyCounter":Ljava/lang/String;
    const-string v2, "https://api.kraken.com/0/public/Ticker?pair=%1$s"

    new-array v3, v3, [Ljava/lang/Object;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

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
    .line 71
    .local p3, "pairs":Ljava/util/List;, "Ljava/util/List<Lcom/mobnetic/coinguardian/model/CurrencyPairInfo;>;"
    const-string v5, "result"

    invoke-virtual {p2, v5}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    .line 72
    .local v4, "result":Lorg/json/JSONObject;
    invoke-virtual {v4}, Lorg/json/JSONObject;->names()Lorg/json/JSONArray;

    move-result-object v3

    .line 74
    .local v3, "pairNames":Lorg/json/JSONArray;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v5

    if-ge v0, v5, :cond_1

    .line 75
    invoke-virtual {v3, v0}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 76
    .local v1, "pairId":Ljava/lang/String;
    if-eqz v1, :cond_0

    const/16 v5, 0x2e

    invoke-virtual {v1, v5}, Ljava/lang/String;->indexOf(I)I

    move-result v5

    const/4 v6, -0x1

    if-ne v5, v6, :cond_0

    .line 77
    invoke-virtual {v4, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    .line 79
    .local v2, "pairJsonObject":Lorg/json/JSONObject;
    new-instance v5, Lcom/mobnetic/coinguardian/model/CurrencyPairInfo;

    const-string v6, "base"

    .line 80
    invoke-virtual {v2, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {p0, v6}, Lcom/mobnetic/coinguardian/model/market/Kraken;->parseCurrency(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v7, "quote"

    .line 81
    invoke-virtual {v2, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {p0, v7}, Lcom/mobnetic/coinguardian/model/market/Kraken;->parseCurrency(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v5, v6, v7, v1}, Lcom/mobnetic/coinguardian/model/CurrencyPairInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 79
    invoke-interface {p3, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 74
    .end local v2    # "pairJsonObject":Lorg/json/JSONObject;
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 85
    .end local v1    # "pairId":Ljava/lang/String;
    :cond_1
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
    .line 45
    const-string v2, "result"

    invoke-virtual {p2, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    .line 46
    .local v1, "resultObject":Lorg/json/JSONObject;
    invoke-virtual {v1}, Lorg/json/JSONObject;->names()Lorg/json/JSONArray;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 48
    .local v0, "pairObject":Lorg/json/JSONObject;
    const-string v2, "b"

    invoke-direct {p0, v0, v2}, Lcom/mobnetic/coinguardian/model/market/Kraken;->getDoubleFromJsonArrayObject(Lorg/json/JSONObject;Ljava/lang/String;)D

    move-result-wide v2

    iput-wide v2, p3, Lcom/mobnetic/coinguardian/model/Ticker;->bid:D

    .line 49
    const-string v2, "a"

    invoke-direct {p0, v0, v2}, Lcom/mobnetic/coinguardian/model/market/Kraken;->getDoubleFromJsonArrayObject(Lorg/json/JSONObject;Ljava/lang/String;)D

    move-result-wide v2

    iput-wide v2, p3, Lcom/mobnetic/coinguardian/model/Ticker;->ask:D

    .line 50
    const-string v2, "v"

    invoke-direct {p0, v0, v2}, Lcom/mobnetic/coinguardian/model/market/Kraken;->getDoubleFromJsonArrayObject(Lorg/json/JSONObject;Ljava/lang/String;)D

    move-result-wide v2

    iput-wide v2, p3, Lcom/mobnetic/coinguardian/model/Ticker;->vol:D

    .line 51
    const-string v2, "h"

    invoke-direct {p0, v0, v2}, Lcom/mobnetic/coinguardian/model/market/Kraken;->getDoubleFromJsonArrayObject(Lorg/json/JSONObject;Ljava/lang/String;)D

    move-result-wide v2

    iput-wide v2, p3, Lcom/mobnetic/coinguardian/model/Ticker;->high:D

    .line 52
    const-string v2, "l"

    invoke-direct {p0, v0, v2}, Lcom/mobnetic/coinguardian/model/market/Kraken;->getDoubleFromJsonArrayObject(Lorg/json/JSONObject;Ljava/lang/String;)D

    move-result-wide v2

    iput-wide v2, p3, Lcom/mobnetic/coinguardian/model/Ticker;->low:D

    .line 53
    const-string v2, "c"

    invoke-direct {p0, v0, v2}, Lcom/mobnetic/coinguardian/model/market/Kraken;->getDoubleFromJsonArrayObject(Lorg/json/JSONObject;Ljava/lang/String;)D

    move-result-wide v2

    iput-wide v2, p3, Lcom/mobnetic/coinguardian/model/Ticker;->last:D

    .line 54
    return-void
.end method
