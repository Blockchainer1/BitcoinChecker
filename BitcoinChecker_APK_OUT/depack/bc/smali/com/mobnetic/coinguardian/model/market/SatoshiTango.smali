.class public Lcom/mobnetic/coinguardian/model/market/SatoshiTango;
.super Lcom/mobnetic/coinguardian/model/Market;
.source "SatoshiTango.java"


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

.field private static final NAME:Ljava/lang/String; = "SatoshiTango"

.field private static final TTS_NAME:Ljava/lang/String; = "Satoshi Tango"

.field private static final URL:Ljava/lang/String; = "https://api.satoshitango.com/v2/ticker"


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    .line 20
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    sput-object v0, Lcom/mobnetic/coinguardian/model/market/SatoshiTango;->CURRENCY_PAIRS:Ljava/util/HashMap;

    .line 23
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/SatoshiTango;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "BTC"

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "USD"

    aput-object v4, v2, v3

    const/4 v3, 0x1

    const-string v4, "ARS"

    aput-object v4, v2, v3

    const/4 v3, 0x2

    const-string v4, "EUR"

    aput-object v4, v2, v3

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 28
    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .prologue
    .line 31
    const-string v0, "SatoshiTango"

    const-string v1, "Satoshi Tango"

    sget-object v2, Lcom/mobnetic/coinguardian/model/market/SatoshiTango;->CURRENCY_PAIRS:Ljava/util/HashMap;

    invoke-direct {p0, v0, v1, v2}, Lcom/mobnetic/coinguardian/model/Market;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;)V

    .line 32
    return-void
.end method


# virtual methods
.method public getUrl(ILcom/mobnetic/coinguardian/model/CheckerInfo;)Ljava/lang/String;
    .locals 1
    .param p1, "requestId"    # I
    .param p2, "checkerInfo"    # Lcom/mobnetic/coinguardian/model/CheckerInfo;

    .prologue
    .line 36
    const-string v0, "https://api.satoshitango.com/v2/ticker"

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
    .line 41
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p4}, Lcom/mobnetic/coinguardian/model/CheckerInfo;->getCurrencyCounterLowerCase()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p4}, Lcom/mobnetic/coinguardian/model/CheckerInfo;->getCurrencyBaseLowerCase()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 43
    .local v1, "currencyCode":Ljava/lang/String;
    const-string v4, "data"

    invoke-virtual {p2, v4}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    .line 44
    .local v3, "tickerJsonObject":Lorg/json/JSONObject;
    const-string v4, "compra"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 45
    .local v0, "buyObject":Lorg/json/JSONObject;
    const-string v4, "venta"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    .line 47
    .local v2, "sellObject":Lorg/json/JSONObject;
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v4

    iput-wide v4, p3, Lcom/mobnetic/coinguardian/model/Ticker;->ask:D

    .line 48
    invoke-virtual {v2, v1}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v4

    iput-wide v4, p3, Lcom/mobnetic/coinguardian/model/Ticker;->bid:D

    .line 49
    iget-wide v4, p3, Lcom/mobnetic/coinguardian/model/Ticker;->ask:D

    iput-wide v4, p3, Lcom/mobnetic/coinguardian/model/Ticker;->last:D

    .line 50
    return-void
.end method
