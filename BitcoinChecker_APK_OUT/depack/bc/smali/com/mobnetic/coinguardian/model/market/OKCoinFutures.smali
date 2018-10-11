.class public Lcom/mobnetic/coinguardian/model/market/OKCoinFutures;
.super Lcom/mobnetic/coinguardian/model/FuturesMarket;
.source "OKCoinFutures.java"


# static fields
.field private static final CONTRACT_TYPES:[I

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

.field private static final NAME:Ljava/lang/String; = "OKCoin Futures"

.field private static final TTS_NAME:Ljava/lang/String; = "OK Coin Futures"

.field private static final URL:Ljava/lang/String; = "https://www.okex.com/api/v1/future_ticker.do?symbol=%1$s_%2$s&contract_type=%3$s"


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 20
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    sput-object v0, Lcom/mobnetic/coinguardian/model/market/OKCoinFutures;->CURRENCY_PAIRS:Ljava/util/HashMap;

    .line 22
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/OKCoinFutures;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "BTC"

    new-array v2, v5, [Ljava/lang/String;

    const-string v3, "USD"

    aput-object v3, v2, v4

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/OKCoinFutures;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "LTC"

    new-array v2, v5, [Ljava/lang/String;

    const-string v3, "USD"

    aput-object v3, v2, v4

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 31
    const/4 v0, 0x3

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/mobnetic/coinguardian/model/market/OKCoinFutures;->CONTRACT_TYPES:[I

    return-void

    :array_0
    .array-data 4
        0x0
        0x1
        0x4
    .end array-data
.end method

.method public constructor <init>()V
    .locals 4

    .prologue
    .line 38
    const-string v0, "OKCoin Futures"

    const-string v1, "OK Coin Futures"

    sget-object v2, Lcom/mobnetic/coinguardian/model/market/OKCoinFutures;->CURRENCY_PAIRS:Ljava/util/HashMap;

    sget-object v3, Lcom/mobnetic/coinguardian/model/market/OKCoinFutures;->CONTRACT_TYPES:[I

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/mobnetic/coinguardian/model/FuturesMarket;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;[I)V

    .line 39
    return-void
.end method

.method private getContractTypeString(I)Ljava/lang/String;
    .locals 1
    .param p1, "contractType"    # I

    .prologue
    .line 47
    packed-switch p1, :pswitch_data_0

    .line 49
    :pswitch_0
    const-string v0, "this_week"

    .line 51
    :goto_0
    return-object v0

    .line 50
    :pswitch_1
    const-string v0, "next_week"

    goto :goto_0

    .line 51
    :pswitch_2
    const-string v0, "quarter"

    goto :goto_0

    .line 47
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method


# virtual methods
.method public getUrl(ILcom/mobnetic/coinguardian/model/CheckerInfo;I)Ljava/lang/String;
    .locals 4
    .param p1, "requestId"    # I
    .param p2, "checkerInfo"    # Lcom/mobnetic/coinguardian/model/CheckerInfo;
    .param p3, "contractType"    # I

    .prologue
    .line 43
    const-string v0, "https://www.okex.com/api/v1/future_ticker.do?symbol=%1$s_%2$s&contract_type=%3$s"

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-virtual {p2}, Lcom/mobnetic/coinguardian/model/CheckerInfo;->getCurrencyBaseLowerCase()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    invoke-virtual {p2}, Lcom/mobnetic/coinguardian/model/CheckerInfo;->getCurrencyCounterLowerCase()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x2

    invoke-direct {p0, p3}, Lcom/mobnetic/coinguardian/model/market/OKCoinFutures;->getContractTypeString(I)Ljava/lang/String;

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
    .line 57
    const-string v1, "ticker"

    invoke-virtual {p2, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 59
    .local v0, "tickerJsonObject":Lorg/json/JSONObject;
    const-string v1, "buy"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v2

    iput-wide v2, p3, Lcom/mobnetic/coinguardian/model/Ticker;->bid:D

    .line 60
    const-string v1, "sell"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v2

    iput-wide v2, p3, Lcom/mobnetic/coinguardian/model/Ticker;->ask:D

    .line 61
    const-string v1, "vol"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v2

    iput-wide v2, p3, Lcom/mobnetic/coinguardian/model/Ticker;->vol:D

    .line 62
    const-string v1, "high"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v2

    iput-wide v2, p3, Lcom/mobnetic/coinguardian/model/Ticker;->high:D

    .line 63
    const-string v1, "low"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v2

    iput-wide v2, p3, Lcom/mobnetic/coinguardian/model/Ticker;->low:D

    .line 64
    const-string v1, "last"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v2

    iput-wide v2, p3, Lcom/mobnetic/coinguardian/model/Ticker;->last:D

    .line 65
    return-void
.end method
