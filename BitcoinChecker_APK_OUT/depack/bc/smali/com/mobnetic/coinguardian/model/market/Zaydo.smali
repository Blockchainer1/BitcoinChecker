.class public Lcom/mobnetic/coinguardian/model/market/Zaydo;
.super Lcom/mobnetic/coinguardian/model/Market;
.source "Zaydo.java"


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

.field private static final NAME:Ljava/lang/String; = "Zaydo"

.field private static final TTS_NAME:Ljava/lang/String; = "Zaydo"

.field private static final URL:Ljava/lang/String; = "http://chart.zyado.com/ticker.json"


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    .line 20
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    sput-object v0, Lcom/mobnetic/coinguardian/model/market/Zaydo;->CURRENCY_PAIRS:Ljava/util/HashMap;

    .line 22
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Zaydo;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "BTC"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "EUR"

    aput-object v4, v2, v3

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .prologue
    .line 28
    const-string v0, "Zaydo"

    const-string v1, "Zaydo"

    sget-object v2, Lcom/mobnetic/coinguardian/model/market/Zaydo;->CURRENCY_PAIRS:Ljava/util/HashMap;

    invoke-direct {p0, v0, v1, v2}, Lcom/mobnetic/coinguardian/model/Market;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;)V

    .line 29
    return-void
.end method


# virtual methods
.method public getUrl(ILcom/mobnetic/coinguardian/model/CheckerInfo;)Ljava/lang/String;
    .locals 1
    .param p1, "requestId"    # I
    .param p2, "checkerInfo"    # Lcom/mobnetic/coinguardian/model/CheckerInfo;

    .prologue
    .line 33
    const-string v0, "http://chart.zyado.com/ticker.json"

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
    const-string v0, "bid"

    invoke-static {p2, v0}, Lcom/mobnetic/coinguardian/util/ParseUtils;->getDoubleFromString(Lorg/json/JSONObject;Ljava/lang/String;)D

    move-result-wide v0

    iput-wide v0, p3, Lcom/mobnetic/coinguardian/model/Ticker;->bid:D

    .line 39
    const-string v0, "ask"

    invoke-static {p2, v0}, Lcom/mobnetic/coinguardian/util/ParseUtils;->getDoubleFromString(Lorg/json/JSONObject;Ljava/lang/String;)D

    move-result-wide v0

    iput-wide v0, p3, Lcom/mobnetic/coinguardian/model/Ticker;->ask:D

    .line 40
    const-string v0, "volume"

    invoke-static {p2, v0}, Lcom/mobnetic/coinguardian/util/ParseUtils;->getDoubleFromString(Lorg/json/JSONObject;Ljava/lang/String;)D

    move-result-wide v0

    iput-wide v0, p3, Lcom/mobnetic/coinguardian/model/Ticker;->vol:D

    .line 41
    const-string v0, "high"

    invoke-static {p2, v0}, Lcom/mobnetic/coinguardian/util/ParseUtils;->getDoubleFromString(Lorg/json/JSONObject;Ljava/lang/String;)D

    move-result-wide v0

    iput-wide v0, p3, Lcom/mobnetic/coinguardian/model/Ticker;->high:D

    .line 42
    const-string v0, "low"

    invoke-static {p2, v0}, Lcom/mobnetic/coinguardian/util/ParseUtils;->getDoubleFromString(Lorg/json/JSONObject;Ljava/lang/String;)D

    move-result-wide v0

    iput-wide v0, p3, Lcom/mobnetic/coinguardian/model/Ticker;->low:D

    .line 43
    const-string v0, "last"

    invoke-static {p2, v0}, Lcom/mobnetic/coinguardian/util/ParseUtils;->getDoubleFromString(Lorg/json/JSONObject;Ljava/lang/String;)D

    move-result-wide v0

    iput-wide v0, p3, Lcom/mobnetic/coinguardian/model/Ticker;->last:D

    .line 44
    return-void
.end method
