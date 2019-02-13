.class public Lcom/mobnetic/coinguardian/model/market/Coinse;
.super Lcom/mobnetic/coinguardian/model/Market;
.source "Coinse.java"


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

.field private static final NAME:Ljava/lang/String; = "Coins-E"

.field private static final TTS_NAME:Ljava/lang/String; = "Coins-E"

.field private static final URL:Ljava/lang/String; = "https://www.coins-e.com/api/v2/markets/data/"


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 19
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    sput-object v0, Lcom/mobnetic/coinguardian/model/market/Coinse;->CURRENCY_PAIRS:Ljava/util/HashMap;

    .line 21
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Coinse;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "ALP"

    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "BTC"

    aput-object v3, v2, v4

    const-string v3, "LTC"

    aput-object v3, v2, v5

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Coinse;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "AMC"

    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "BTC"

    aput-object v3, v2, v4

    const-string v3, "LTC"

    aput-object v3, v2, v5

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 23
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Coinse;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "ANC"

    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "BTC"

    aput-object v3, v2, v4

    const-string v3, "LTC"

    aput-object v3, v2, v5

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Coinse;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "ARG"

    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "BTC"

    aput-object v3, v2, v4

    const-string v3, "LTC"

    aput-object v3, v2, v5

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Coinse;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "BET"

    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "BTC"

    aput-object v3, v2, v4

    const-string v3, "LTC"

    aput-object v3, v2, v5

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Coinse;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "BQC"

    new-array v2, v5, [Ljava/lang/String;

    const-string v3, "BTC"

    aput-object v3, v2, v4

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Coinse;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "BTG"

    new-array v2, v5, [Ljava/lang/String;

    const-string v3, "BTC"

    aput-object v3, v2, v4

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 28
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Coinse;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "CGB"

    new-array v2, v5, [Ljava/lang/String;

    const-string v3, "BTC"

    aput-object v3, v2, v4

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Coinse;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "CIN"

    new-array v2, v5, [Ljava/lang/String;

    const-string v3, "BTC"

    aput-object v3, v2, v4

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 30
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Coinse;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "CMC"

    new-array v2, v5, [Ljava/lang/String;

    const-string v3, "BTC"

    aput-object v3, v2, v4

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 31
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Coinse;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "COL"

    new-array v2, v5, [Ljava/lang/String;

    const-string v3, "LTC"

    aput-object v3, v2, v4

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Coinse;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "CRC"

    new-array v2, v5, [Ljava/lang/String;

    const-string v3, "BTC"

    aput-object v3, v2, v4

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Coinse;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "CSC"

    new-array v2, v5, [Ljava/lang/String;

    const-string v3, "BTC"

    aput-object v3, v2, v4

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Coinse;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "DEM"

    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "BTC"

    aput-object v3, v2, v4

    const-string v3, "LTC"

    aput-object v3, v2, v5

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Coinse;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "DGC"

    new-array v2, v5, [Ljava/lang/String;

    const-string v3, "BTC"

    aput-object v3, v2, v4

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 36
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Coinse;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "DMD"

    new-array v2, v5, [Ljava/lang/String;

    const-string v3, "BTC"

    aput-object v3, v2, v4

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Coinse;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "DOGE"

    new-array v2, v5, [Ljava/lang/String;

    const-string v3, "BTC"

    aput-object v3, v2, v4

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Coinse;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "DTC"

    new-array v2, v5, [Ljava/lang/String;

    const-string v3, "BTC"

    aput-object v3, v2, v4

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 39
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Coinse;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "ELC"

    new-array v2, v5, [Ljava/lang/String;

    const-string v3, "BTC"

    aput-object v3, v2, v4

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Coinse;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "ELP"

    new-array v2, v5, [Ljava/lang/String;

    const-string v3, "BTC"

    aput-object v3, v2, v4

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Coinse;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "EMD"

    new-array v2, v5, [Ljava/lang/String;

    const-string v3, "BTC"

    aput-object v3, v2, v4

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 42
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Coinse;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "EZC"

    new-array v2, v5, [Ljava/lang/String;

    const-string v3, "BTC"

    aput-object v3, v2, v4

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 43
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Coinse;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "FLO"

    new-array v2, v5, [Ljava/lang/String;

    const-string v3, "BTC"

    aput-object v3, v2, v4

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Coinse;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "FRK"

    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "BTC"

    aput-object v3, v2, v4

    const-string v3, "LTC"

    aput-object v3, v2, v5

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 45
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Coinse;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "FTC"

    new-array v2, v5, [Ljava/lang/String;

    const-string v3, "BTC"

    aput-object v3, v2, v4

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 46
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Coinse;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "GDC"

    new-array v2, v5, [Ljava/lang/String;

    const-string v3, "BTC"

    aput-object v3, v2, v4

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Coinse;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "GLC"

    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "BTC"

    aput-object v3, v2, v4

    const-string v3, "LTC"

    aput-object v3, v2, v5

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 48
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Coinse;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "GLX"

    new-array v2, v5, [Ljava/lang/String;

    const-string v3, "BTC"

    aput-object v3, v2, v4

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Coinse;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "HYC"

    new-array v2, v5, [Ljava/lang/String;

    const-string v3, "BTC"

    aput-object v3, v2, v4

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Coinse;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "IFC"

    new-array v2, v7, [Ljava/lang/String;

    const-string v3, "BTC"

    aput-object v3, v2, v4

    const-string v3, "LTC"

    aput-object v3, v2, v5

    const-string v3, "XPM"

    aput-object v3, v2, v6

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 51
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Coinse;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "KGC"

    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "BTC"

    aput-object v3, v2, v4

    const-string v3, "LTC"

    aput-object v3, v2, v5

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 52
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Coinse;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "LBW"

    new-array v2, v5, [Ljava/lang/String;

    const-string v3, "BTC"

    aput-object v3, v2, v4

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 53
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Coinse;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "LTC"

    new-array v2, v5, [Ljava/lang/String;

    const-string v3, "BTC"

    aput-object v3, v2, v4

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 54
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Coinse;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "MEC"

    new-array v2, v5, [Ljava/lang/String;

    const-string v3, "BTC"

    aput-object v3, v2, v4

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Coinse;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "NAN"

    new-array v2, v5, [Ljava/lang/String;

    const-string v3, "BTC"

    aput-object v3, v2, v4

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 56
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Coinse;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "NET"

    new-array v2, v5, [Ljava/lang/String;

    const-string v3, "BTC"

    aput-object v3, v2, v4

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 57
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Coinse;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "NIB"

    new-array v2, v5, [Ljava/lang/String;

    const-string v3, "BTC"

    aput-object v3, v2, v4

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 58
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Coinse;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "NRB"

    new-array v2, v5, [Ljava/lang/String;

    const-string v3, "BTC"

    aput-object v3, v2, v4

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Coinse;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "NUC"

    new-array v2, v5, [Ljava/lang/String;

    const-string v3, "BTC"

    aput-object v3, v2, v4

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 60
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Coinse;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "NVC"

    new-array v2, v5, [Ljava/lang/String;

    const-string v3, "BTC"

    aput-object v3, v2, v4

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Coinse;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "ORB"

    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "BTC"

    aput-object v3, v2, v4

    const-string v3, "LTC"

    aput-object v3, v2, v5

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 62
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Coinse;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "PPC"

    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "BTC"

    aput-object v3, v2, v4

    const-string v3, "XPM"

    aput-object v3, v2, v5

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 63
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Coinse;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "PTS"

    new-array v2, v5, [Ljava/lang/String;

    const-string v3, "BTC"

    aput-object v3, v2, v4

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Coinse;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "PWC"

    new-array v2, v5, [Ljava/lang/String;

    const-string v3, "BTC"

    aput-object v3, v2, v4

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 65
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Coinse;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "PXC"

    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "BTC"

    aput-object v3, v2, v4

    const-string v3, "LTC"

    aput-object v3, v2, v5

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 66
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Coinse;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "QRK"

    new-array v2, v7, [Ljava/lang/String;

    const-string v3, "BTC"

    aput-object v3, v2, v4

    const-string v3, "LTC"

    aput-object v3, v2, v5

    const-string v3, "XPM"

    aput-object v3, v2, v6

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 67
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Coinse;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "RCH"

    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "BTC"

    aput-object v3, v2, v4

    const-string v3, "LTC"

    aput-object v3, v2, v5

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 68
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Coinse;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "REC"

    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "BTC"

    aput-object v3, v2, v4

    const-string v3, "LTC"

    aput-object v3, v2, v5

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 69
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Coinse;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "RED"

    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "BTC"

    aput-object v3, v2, v4

    const-string v3, "LTC"

    aput-object v3, v2, v5

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 70
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Coinse;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "SBC"

    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "BTC"

    aput-object v3, v2, v4

    const-string v3, "LTC"

    aput-object v3, v2, v5

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 71
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Coinse;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "SPT"

    new-array v2, v5, [Ljava/lang/String;

    const-string v3, "BTC"

    aput-object v3, v2, v4

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 72
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Coinse;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "TAG"

    new-array v2, v5, [Ljava/lang/String;

    const-string v3, "BTC"

    aput-object v3, v2, v4

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 73
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Coinse;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "TRC"

    new-array v2, v5, [Ljava/lang/String;

    const-string v3, "BTC"

    aput-object v3, v2, v4

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 74
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Coinse;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "UNO"

    new-array v2, v5, [Ljava/lang/String;

    const-string v3, "BTC"

    aput-object v3, v2, v4

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 75
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Coinse;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "VLC"

    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "BTC"

    aput-object v3, v2, v4

    const-string v3, "LTC"

    aput-object v3, v2, v5

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Coinse;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "WDC"

    new-array v2, v5, [Ljava/lang/String;

    const-string v3, "BTC"

    aput-object v3, v2, v4

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 77
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Coinse;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "XNC"

    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "BTC"

    aput-object v3, v2, v4

    const-string v3, "LTC"

    aput-object v3, v2, v5

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 78
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Coinse;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "XPM"

    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "BTC"

    aput-object v3, v2, v4

    const-string v3, "LTC"

    aput-object v3, v2, v5

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 79
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Coinse;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "ZET"

    new-array v2, v5, [Ljava/lang/String;

    const-string v3, "BTC"

    aput-object v3, v2, v4

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 80
    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .prologue
    .line 83
    const-string v0, "Coins-E"

    const-string v1, "Coins-E"

    sget-object v2, Lcom/mobnetic/coinguardian/model/market/Coinse;->CURRENCY_PAIRS:Ljava/util/HashMap;

    invoke-direct {p0, v0, v1, v2}, Lcom/mobnetic/coinguardian/model/Market;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;)V

    .line 84
    return-void
.end method


# virtual methods
.method public getCautionResId()I
    .locals 1

    .prologue
    .line 88
    sget v0, Lcom/mobnetic/coinguardiandatamodule/R$string;->market_caution_much_data:I

    return v0
.end method

.method public getUrl(ILcom/mobnetic/coinguardian/model/CheckerInfo;)Ljava/lang/String;
    .locals 1
    .param p1, "requestId"    # I
    .param p2, "checkerInfo"    # Lcom/mobnetic/coinguardian/model/CheckerInfo;

    .prologue
    .line 93
    const-string v0, "https://www.coins-e.com/api/v2/markets/data/"

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
    .line 98
    const-string v4, "markets"

    invoke-virtual {p2, v4}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    .line 99
    .local v2, "marketsObject":Lorg/json/JSONObject;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p4}, Lcom/mobnetic/coinguardian/model/CheckerInfo;->getCurrencyBase()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "_"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p4}, Lcom/mobnetic/coinguardian/model/CheckerInfo;->getCurrencyCounter()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    .line 101
    .local v3, "pairObject":Lorg/json/JSONObject;
    const-string v4, "marketstat"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    .line 102
    .local v1, "marketStatObject":Lorg/json/JSONObject;
    const-string v4, "24h"

    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 104
    .local v0, "inner24hObject":Lorg/json/JSONObject;
    const-string v4, "bid"

    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v4

    iput-wide v4, p3, Lcom/mobnetic/coinguardian/model/Ticker;->bid:D

    .line 105
    const-string v4, "ask"

    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v4

    iput-wide v4, p3, Lcom/mobnetic/coinguardian/model/Ticker;->ask:D

    .line 106
    const-string v4, "volume"

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v4

    iput-wide v4, p3, Lcom/mobnetic/coinguardian/model/Ticker;->vol:D

    .line 107
    const-string v4, "h"

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v4

    iput-wide v4, p3, Lcom/mobnetic/coinguardian/model/Ticker;->high:D

    .line 108
    const-string v4, "l"

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v4

    iput-wide v4, p3, Lcom/mobnetic/coinguardian/model/Ticker;->low:D

    .line 109
    const-string v4, "ltp"

    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v4

    iput-wide v4, p3, Lcom/mobnetic/coinguardian/model/Ticker;->last:D

    .line 110
    return-void
.end method
