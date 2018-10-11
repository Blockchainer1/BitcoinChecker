.class public Lcom/mobnetic/coinguardian/model/market/Unknown;
.super Lcom/mobnetic/coinguardian/model/Market;
.source "Unknown.java"


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

.field private static final NAME:Ljava/lang/String; = "UNKNOWN"

.field private static final TTS_NAME:Ljava/lang/String; = "UNKNOWN"

.field private static final URL:Ljava/lang/String; = ""


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    .line 16
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    sput-object v0, Lcom/mobnetic/coinguardian/model/market/Unknown;->CURRENCY_PAIRS:Ljava/util/HashMap;

    .line 18
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Unknown;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "BTC"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "BTC"

    aput-object v4, v2, v3

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 19
    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .prologue
    .line 22
    const-string v0, "UNKNOWN"

    const-string v1, "UNKNOWN"

    sget-object v2, Lcom/mobnetic/coinguardian/model/market/Unknown;->CURRENCY_PAIRS:Ljava/util/HashMap;

    invoke-direct {p0, v0, v1, v2}, Lcom/mobnetic/coinguardian/model/Market;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;)V

    .line 23
    return-void
.end method


# virtual methods
.method public getCautionResId()I
    .locals 1

    .prologue
    .line 27
    sget v0, Lcom/mobnetic/coinguardiandatamodule/R$string;->market_caution_unknown:I

    return v0
.end method

.method public getUrl(ILcom/mobnetic/coinguardian/model/CheckerInfo;)Ljava/lang/String;
    .locals 1
    .param p1, "requestId"    # I
    .param p2, "checkerInfo"    # Lcom/mobnetic/coinguardian/model/CheckerInfo;

    .prologue
    .line 32
    const-string v0, ""

    return-object v0
.end method
