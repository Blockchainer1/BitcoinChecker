.class public Lcom/mobnetic/coinguardian/model/market/Gemini;
.super Lcom/mobnetic/coinguardian/model/Market;
.source "Gemini.java"


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

.field private static final NAME:Ljava/lang/String; = "Gemini"

.field private static final TTS_NAME:Ljava/lang/String; = "Gemini"

.field private static final URL:Ljava/lang/String; = "https://api.gemini.com/v1/book/%1$s%2$s?limit_asks=1&limit_bids=1"


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 21
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    sput-object v0, Lcom/mobnetic/coinguardian/model/market/Gemini;->CURRENCY_PAIRS:Ljava/util/HashMap;

    .line 27
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Gemini;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "BTC"

    new-array v2, v5, [Ljava/lang/String;

    const-string v3, "USD"

    aput-object v3, v2, v4

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 30
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Gemini;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "ETH"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/String;

    const-string v3, "BTC"

    aput-object v3, v2, v4

    const-string v3, "USD"

    aput-object v3, v2, v5

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .prologue
    .line 37
    const-string v0, "Gemini"

    const-string v1, "Gemini"

    sget-object v2, Lcom/mobnetic/coinguardian/model/market/Gemini;->CURRENCY_PAIRS:Ljava/util/HashMap;

    invoke-direct {p0, v0, v1, v2}, Lcom/mobnetic/coinguardian/model/Market;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;)V

    .line 38
    return-void
.end method


# virtual methods
.method public getUrl(ILcom/mobnetic/coinguardian/model/CheckerInfo;)Ljava/lang/String;
    .locals 4
    .param p1, "requestId"    # I
    .param p2, "checkerInfo"    # Lcom/mobnetic/coinguardian/model/CheckerInfo;

    .prologue
    .line 42
    const-string v0, "https://api.gemini.com/v1/book/%1$s%2$s?limit_asks=1&limit_bids=1"

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
    .locals 7
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
    const/4 v6, 0x0

    const-wide/high16 v4, -0x4010000000000000L    # -1.0

    .line 51
    const-string v2, "bids"

    invoke-virtual {p2, v2}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    .line 52
    .local v1, "bidsArray":Lorg/json/JSONArray;
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-lez v2, :cond_0

    .line 53
    invoke-virtual {v1, v6}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "price"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v2

    iput-wide v2, p3, Lcom/mobnetic/coinguardian/model/Ticker;->bid:D

    .line 56
    :cond_0
    const-string v2, "asks"

    invoke-virtual {p2, v2}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    .line 57
    .local v0, "asksArray":Lorg/json/JSONArray;
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-lez v2, :cond_1

    .line 58
    invoke-virtual {v0, v6}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "price"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v2

    iput-wide v2, p3, Lcom/mobnetic/coinguardian/model/Ticker;->ask:D

    .line 61
    :cond_1
    iget-wide v2, p3, Lcom/mobnetic/coinguardian/model/Ticker;->bid:D

    cmpl-double v2, v2, v4

    if-eqz v2, :cond_2

    iget-wide v2, p3, Lcom/mobnetic/coinguardian/model/Ticker;->ask:D

    cmpl-double v2, v2, v4

    if-eqz v2, :cond_2

    .line 62
    iget-wide v2, p3, Lcom/mobnetic/coinguardian/model/Ticker;->bid:D

    iget-wide v4, p3, Lcom/mobnetic/coinguardian/model/Ticker;->ask:D

    add-double/2addr v2, v4

    const-wide/high16 v4, 0x4000000000000000L    # 2.0

    div-double/2addr v2, v4

    iput-wide v2, p3, Lcom/mobnetic/coinguardian/model/Ticker;->last:D

    .line 70
    :goto_0
    return-void

    .line 63
    :cond_2
    iget-wide v2, p3, Lcom/mobnetic/coinguardian/model/Ticker;->bid:D

    cmpl-double v2, v2, v4

    if-eqz v2, :cond_3

    .line 64
    iget-wide v2, p3, Lcom/mobnetic/coinguardian/model/Ticker;->bid:D

    iput-wide v2, p3, Lcom/mobnetic/coinguardian/model/Ticker;->last:D

    goto :goto_0

    .line 65
    :cond_3
    iget-wide v2, p3, Lcom/mobnetic/coinguardian/model/Ticker;->ask:D

    cmpl-double v2, v2, v4

    if-eqz v2, :cond_4

    .line 66
    iget-wide v2, p3, Lcom/mobnetic/coinguardian/model/Ticker;->ask:D

    iput-wide v2, p3, Lcom/mobnetic/coinguardian/model/Ticker;->last:D

    goto :goto_0

    .line 68
    :cond_4
    const-wide/16 v2, 0x0

    iput-wide v2, p3, Lcom/mobnetic/coinguardian/model/Ticker;->last:D

    goto :goto_0
.end method
