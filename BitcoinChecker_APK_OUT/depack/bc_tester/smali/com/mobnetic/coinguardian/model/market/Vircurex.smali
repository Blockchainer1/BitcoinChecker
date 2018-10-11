.class public Lcom/mobnetic/coinguardian/model/market/Vircurex;
.super Lcom/mobnetic/coinguardian/model/Market;
.source "Vircurex.java"


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

.field private static final NAME:Ljava/lang/String; = "Vircurex"

.field private static final TTS_NAME:Ljava/lang/String; = "Vircurex"

.field private static final URL:Ljava/lang/String; = "https://api.vircurex.com/api/get_info_for_1_currency.json?base=%1$s&alt=%2$s"


# direct methods
.method static constructor <clinit>()V
    .locals 10

    .prologue
    const/4 v9, 0x4

    const/4 v8, 0x3

    const/4 v7, 0x2

    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 19
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    sput-object v0, Lcom/mobnetic/coinguardian/model/market/Vircurex;->CURRENCY_PAIRS:Ljava/util/HashMap;

    .line 21
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Vircurex;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "BTC"

    const/16 v2, 0x14

    new-array v2, v2, [Ljava/lang/String;

    const-string v3, "USD"

    aput-object v3, v2, v5

    const-string v3, "EUR"

    aput-object v3, v2, v6

    const-string v3, "ANC"

    aput-object v3, v2, v7

    const-string v3, "DGC"

    aput-object v3, v2, v8

    const-string v3, "DOGE"

    aput-object v3, v2, v9

    const/4 v3, 0x5

    const-string v4, "DVC"

    aput-object v4, v2, v3

    const/4 v3, 0x6

    const-string v4, "FRC"

    aput-object v4, v2, v3

    const/4 v3, 0x7

    const-string v4, "FTC"

    aput-object v4, v2, v3

    const/16 v3, 0x8

    const-string v4, "I0C"

    aput-object v4, v2, v3

    const/16 v3, 0x9

    const-string v4, "IXC"

    aput-object v4, v2, v3

    const/16 v3, 0xa

    const-string v4, "LTC"

    aput-object v4, v2, v3

    const/16 v3, 0xb

    const-string v4, "NMC"

    aput-object v4, v2, v3

    const/16 v3, 0xc

    const-string v4, "NVC"

    aput-object v4, v2, v3

    const/16 v3, 0xd

    const-string v4, "NXT"

    aput-object v4, v2, v3

    const/16 v3, 0xe

    const-string v4, "PPC"

    aput-object v4, v2, v3

    const/16 v3, 0xf

    const-string v4, "QRK"

    aput-object v4, v2, v3

    const/16 v3, 0x10

    const-string v4, "TRC"

    aput-object v4, v2, v3

    const/16 v3, 0x11

    const-string v4, "VTC"

    aput-object v4, v2, v3

    const/16 v3, 0x12

    const-string v4, "WDC"

    aput-object v4, v2, v3

    const/16 v3, 0x13

    const-string v4, "XPM"

    aput-object v4, v2, v3

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 43
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Vircurex;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "ANC"

    const/16 v2, 0x14

    new-array v2, v2, [Ljava/lang/String;

    const-string v3, "USD"

    aput-object v3, v2, v5

    const-string v3, "EUR"

    aput-object v3, v2, v6

    const-string v3, "BTC"

    aput-object v3, v2, v7

    const-string v3, "DGC"

    aput-object v3, v2, v8

    const-string v3, "DOGE"

    aput-object v3, v2, v9

    const/4 v3, 0x5

    const-string v4, "DVC"

    aput-object v4, v2, v3

    const/4 v3, 0x6

    const-string v4, "FRC"

    aput-object v4, v2, v3

    const/4 v3, 0x7

    const-string v4, "FTC"

    aput-object v4, v2, v3

    const/16 v3, 0x8

    const-string v4, "I0C"

    aput-object v4, v2, v3

    const/16 v3, 0x9

    const-string v4, "IXC"

    aput-object v4, v2, v3

    const/16 v3, 0xa

    const-string v4, "LTC"

    aput-object v4, v2, v3

    const/16 v3, 0xb

    const-string v4, "NMC"

    aput-object v4, v2, v3

    const/16 v3, 0xc

    const-string v4, "NVC"

    aput-object v4, v2, v3

    const/16 v3, 0xd

    const-string v4, "NXT"

    aput-object v4, v2, v3

    const/16 v3, 0xe

    const-string v4, "PPC"

    aput-object v4, v2, v3

    const/16 v3, 0xf

    const-string v4, "QRK"

    aput-object v4, v2, v3

    const/16 v3, 0x10

    const-string v4, "TRC"

    aput-object v4, v2, v3

    const/16 v3, 0x11

    const-string v4, "VTC"

    aput-object v4, v2, v3

    const/16 v3, 0x12

    const-string v4, "WDC"

    aput-object v4, v2, v3

    const/16 v3, 0x13

    const-string v4, "XPM"

    aput-object v4, v2, v3

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 65
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Vircurex;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "DGC"

    const/16 v2, 0x14

    new-array v2, v2, [Ljava/lang/String;

    const-string v3, "USD"

    aput-object v3, v2, v5

    const-string v3, "EUR"

    aput-object v3, v2, v6

    const-string v3, "BTC"

    aput-object v3, v2, v7

    const-string v3, "ANC"

    aput-object v3, v2, v8

    const-string v3, "DOGE"

    aput-object v3, v2, v9

    const/4 v3, 0x5

    const-string v4, "DVC"

    aput-object v4, v2, v3

    const/4 v3, 0x6

    const-string v4, "FRC"

    aput-object v4, v2, v3

    const/4 v3, 0x7

    const-string v4, "FTC"

    aput-object v4, v2, v3

    const/16 v3, 0x8

    const-string v4, "I0C"

    aput-object v4, v2, v3

    const/16 v3, 0x9

    const-string v4, "IXC"

    aput-object v4, v2, v3

    const/16 v3, 0xa

    const-string v4, "LTC"

    aput-object v4, v2, v3

    const/16 v3, 0xb

    const-string v4, "NMC"

    aput-object v4, v2, v3

    const/16 v3, 0xc

    const-string v4, "NVC"

    aput-object v4, v2, v3

    const/16 v3, 0xd

    const-string v4, "NXT"

    aput-object v4, v2, v3

    const/16 v3, 0xe

    const-string v4, "PPC"

    aput-object v4, v2, v3

    const/16 v3, 0xf

    const-string v4, "QRK"

    aput-object v4, v2, v3

    const/16 v3, 0x10

    const-string v4, "TRC"

    aput-object v4, v2, v3

    const/16 v3, 0x11

    const-string v4, "VTC"

    aput-object v4, v2, v3

    const/16 v3, 0x12

    const-string v4, "WDC"

    aput-object v4, v2, v3

    const/16 v3, 0x13

    const-string v4, "XPM"

    aput-object v4, v2, v3

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 87
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Vircurex;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "DOGE"

    const/16 v2, 0x14

    new-array v2, v2, [Ljava/lang/String;

    const-string v3, "USD"

    aput-object v3, v2, v5

    const-string v3, "EUR"

    aput-object v3, v2, v6

    const-string v3, "BTC"

    aput-object v3, v2, v7

    const-string v3, "ANC"

    aput-object v3, v2, v8

    const-string v3, "DGC"

    aput-object v3, v2, v9

    const/4 v3, 0x5

    const-string v4, "DVC"

    aput-object v4, v2, v3

    const/4 v3, 0x6

    const-string v4, "FRC"

    aput-object v4, v2, v3

    const/4 v3, 0x7

    const-string v4, "FTC"

    aput-object v4, v2, v3

    const/16 v3, 0x8

    const-string v4, "I0C"

    aput-object v4, v2, v3

    const/16 v3, 0x9

    const-string v4, "IXC"

    aput-object v4, v2, v3

    const/16 v3, 0xa

    const-string v4, "LTC"

    aput-object v4, v2, v3

    const/16 v3, 0xb

    const-string v4, "NMC"

    aput-object v4, v2, v3

    const/16 v3, 0xc

    const-string v4, "NVC"

    aput-object v4, v2, v3

    const/16 v3, 0xd

    const-string v4, "NXT"

    aput-object v4, v2, v3

    const/16 v3, 0xe

    const-string v4, "PPC"

    aput-object v4, v2, v3

    const/16 v3, 0xf

    const-string v4, "QRK"

    aput-object v4, v2, v3

    const/16 v3, 0x10

    const-string v4, "TRC"

    aput-object v4, v2, v3

    const/16 v3, 0x11

    const-string v4, "VTC"

    aput-object v4, v2, v3

    const/16 v3, 0x12

    const-string v4, "WDC"

    aput-object v4, v2, v3

    const/16 v3, 0x13

    const-string v4, "XPM"

    aput-object v4, v2, v3

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 109
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Vircurex;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "DVC"

    const/16 v2, 0x14

    new-array v2, v2, [Ljava/lang/String;

    const-string v3, "USD"

    aput-object v3, v2, v5

    const-string v3, "EUR"

    aput-object v3, v2, v6

    const-string v3, "BTC"

    aput-object v3, v2, v7

    const-string v3, "ANC"

    aput-object v3, v2, v8

    const-string v3, "DGC"

    aput-object v3, v2, v9

    const/4 v3, 0x5

    const-string v4, "DOGE"

    aput-object v4, v2, v3

    const/4 v3, 0x6

    const-string v4, "FRC"

    aput-object v4, v2, v3

    const/4 v3, 0x7

    const-string v4, "FTC"

    aput-object v4, v2, v3

    const/16 v3, 0x8

    const-string v4, "I0C"

    aput-object v4, v2, v3

    const/16 v3, 0x9

    const-string v4, "IXC"

    aput-object v4, v2, v3

    const/16 v3, 0xa

    const-string v4, "LTC"

    aput-object v4, v2, v3

    const/16 v3, 0xb

    const-string v4, "NMC"

    aput-object v4, v2, v3

    const/16 v3, 0xc

    const-string v4, "NVC"

    aput-object v4, v2, v3

    const/16 v3, 0xd

    const-string v4, "NXT"

    aput-object v4, v2, v3

    const/16 v3, 0xe

    const-string v4, "PPC"

    aput-object v4, v2, v3

    const/16 v3, 0xf

    const-string v4, "QRK"

    aput-object v4, v2, v3

    const/16 v3, 0x10

    const-string v4, "TRC"

    aput-object v4, v2, v3

    const/16 v3, 0x11

    const-string v4, "VTC"

    aput-object v4, v2, v3

    const/16 v3, 0x12

    const-string v4, "WDC"

    aput-object v4, v2, v3

    const/16 v3, 0x13

    const-string v4, "XPM"

    aput-object v4, v2, v3

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 131
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Vircurex;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "FRC"

    const/16 v2, 0x14

    new-array v2, v2, [Ljava/lang/String;

    const-string v3, "USD"

    aput-object v3, v2, v5

    const-string v3, "EUR"

    aput-object v3, v2, v6

    const-string v3, "BTC"

    aput-object v3, v2, v7

    const-string v3, "ANC"

    aput-object v3, v2, v8

    const-string v3, "DGC"

    aput-object v3, v2, v9

    const/4 v3, 0x5

    const-string v4, "DOGE"

    aput-object v4, v2, v3

    const/4 v3, 0x6

    const-string v4, "DVC"

    aput-object v4, v2, v3

    const/4 v3, 0x7

    const-string v4, "FTC"

    aput-object v4, v2, v3

    const/16 v3, 0x8

    const-string v4, "I0C"

    aput-object v4, v2, v3

    const/16 v3, 0x9

    const-string v4, "IXC"

    aput-object v4, v2, v3

    const/16 v3, 0xa

    const-string v4, "LTC"

    aput-object v4, v2, v3

    const/16 v3, 0xb

    const-string v4, "NMC"

    aput-object v4, v2, v3

    const/16 v3, 0xc

    const-string v4, "NVC"

    aput-object v4, v2, v3

    const/16 v3, 0xd

    const-string v4, "NXT"

    aput-object v4, v2, v3

    const/16 v3, 0xe

    const-string v4, "PPC"

    aput-object v4, v2, v3

    const/16 v3, 0xf

    const-string v4, "QRK"

    aput-object v4, v2, v3

    const/16 v3, 0x10

    const-string v4, "TRC"

    aput-object v4, v2, v3

    const/16 v3, 0x11

    const-string v4, "VTC"

    aput-object v4, v2, v3

    const/16 v3, 0x12

    const-string v4, "WDC"

    aput-object v4, v2, v3

    const/16 v3, 0x13

    const-string v4, "XPM"

    aput-object v4, v2, v3

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 153
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Vircurex;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "FTC"

    const/16 v2, 0x14

    new-array v2, v2, [Ljava/lang/String;

    const-string v3, "USD"

    aput-object v3, v2, v5

    const-string v3, "EUR"

    aput-object v3, v2, v6

    const-string v3, "BTC"

    aput-object v3, v2, v7

    const-string v3, "ANC"

    aput-object v3, v2, v8

    const-string v3, "DGC"

    aput-object v3, v2, v9

    const/4 v3, 0x5

    const-string v4, "DOGE"

    aput-object v4, v2, v3

    const/4 v3, 0x6

    const-string v4, "DVC"

    aput-object v4, v2, v3

    const/4 v3, 0x7

    const-string v4, "FRC"

    aput-object v4, v2, v3

    const/16 v3, 0x8

    const-string v4, "I0C"

    aput-object v4, v2, v3

    const/16 v3, 0x9

    const-string v4, "IXC"

    aput-object v4, v2, v3

    const/16 v3, 0xa

    const-string v4, "LTC"

    aput-object v4, v2, v3

    const/16 v3, 0xb

    const-string v4, "NMC"

    aput-object v4, v2, v3

    const/16 v3, 0xc

    const-string v4, "NVC"

    aput-object v4, v2, v3

    const/16 v3, 0xd

    const-string v4, "NXT"

    aput-object v4, v2, v3

    const/16 v3, 0xe

    const-string v4, "PPC"

    aput-object v4, v2, v3

    const/16 v3, 0xf

    const-string v4, "QRK"

    aput-object v4, v2, v3

    const/16 v3, 0x10

    const-string v4, "TRC"

    aput-object v4, v2, v3

    const/16 v3, 0x11

    const-string v4, "VTC"

    aput-object v4, v2, v3

    const/16 v3, 0x12

    const-string v4, "WDC"

    aput-object v4, v2, v3

    const/16 v3, 0x13

    const-string v4, "XPM"

    aput-object v4, v2, v3

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 175
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Vircurex;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "I0C"

    const/16 v2, 0x14

    new-array v2, v2, [Ljava/lang/String;

    const-string v3, "USD"

    aput-object v3, v2, v5

    const-string v3, "EUR"

    aput-object v3, v2, v6

    const-string v3, "BTC"

    aput-object v3, v2, v7

    const-string v3, "ANC"

    aput-object v3, v2, v8

    const-string v3, "DGC"

    aput-object v3, v2, v9

    const/4 v3, 0x5

    const-string v4, "DOGE"

    aput-object v4, v2, v3

    const/4 v3, 0x6

    const-string v4, "DVC"

    aput-object v4, v2, v3

    const/4 v3, 0x7

    const-string v4, "FRC"

    aput-object v4, v2, v3

    const/16 v3, 0x8

    const-string v4, "FTC"

    aput-object v4, v2, v3

    const/16 v3, 0x9

    const-string v4, "IXC"

    aput-object v4, v2, v3

    const/16 v3, 0xa

    const-string v4, "LTC"

    aput-object v4, v2, v3

    const/16 v3, 0xb

    const-string v4, "NMC"

    aput-object v4, v2, v3

    const/16 v3, 0xc

    const-string v4, "NVC"

    aput-object v4, v2, v3

    const/16 v3, 0xd

    const-string v4, "NXT"

    aput-object v4, v2, v3

    const/16 v3, 0xe

    const-string v4, "PPC"

    aput-object v4, v2, v3

    const/16 v3, 0xf

    const-string v4, "QRK"

    aput-object v4, v2, v3

    const/16 v3, 0x10

    const-string v4, "TRC"

    aput-object v4, v2, v3

    const/16 v3, 0x11

    const-string v4, "VTC"

    aput-object v4, v2, v3

    const/16 v3, 0x12

    const-string v4, "WDC"

    aput-object v4, v2, v3

    const/16 v3, 0x13

    const-string v4, "XPM"

    aput-object v4, v2, v3

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 197
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Vircurex;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "IXC"

    const/16 v2, 0x14

    new-array v2, v2, [Ljava/lang/String;

    const-string v3, "USD"

    aput-object v3, v2, v5

    const-string v3, "EUR"

    aput-object v3, v2, v6

    const-string v3, "BTC"

    aput-object v3, v2, v7

    const-string v3, "ANC"

    aput-object v3, v2, v8

    const-string v3, "DGC"

    aput-object v3, v2, v9

    const/4 v3, 0x5

    const-string v4, "DOGE"

    aput-object v4, v2, v3

    const/4 v3, 0x6

    const-string v4, "DVC"

    aput-object v4, v2, v3

    const/4 v3, 0x7

    const-string v4, "FRC"

    aput-object v4, v2, v3

    const/16 v3, 0x8

    const-string v4, "FTC"

    aput-object v4, v2, v3

    const/16 v3, 0x9

    const-string v4, "I0C"

    aput-object v4, v2, v3

    const/16 v3, 0xa

    const-string v4, "LTC"

    aput-object v4, v2, v3

    const/16 v3, 0xb

    const-string v4, "NMC"

    aput-object v4, v2, v3

    const/16 v3, 0xc

    const-string v4, "NVC"

    aput-object v4, v2, v3

    const/16 v3, 0xd

    const-string v4, "NXT"

    aput-object v4, v2, v3

    const/16 v3, 0xe

    const-string v4, "PPC"

    aput-object v4, v2, v3

    const/16 v3, 0xf

    const-string v4, "QRK"

    aput-object v4, v2, v3

    const/16 v3, 0x10

    const-string v4, "TRC"

    aput-object v4, v2, v3

    const/16 v3, 0x11

    const-string v4, "VTC"

    aput-object v4, v2, v3

    const/16 v3, 0x12

    const-string v4, "WDC"

    aput-object v4, v2, v3

    const/16 v3, 0x13

    const-string v4, "XPM"

    aput-object v4, v2, v3

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 219
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Vircurex;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "LTC"

    const/16 v2, 0x14

    new-array v2, v2, [Ljava/lang/String;

    const-string v3, "USD"

    aput-object v3, v2, v5

    const-string v3, "EUR"

    aput-object v3, v2, v6

    const-string v3, "BTC"

    aput-object v3, v2, v7

    const-string v3, "ANC"

    aput-object v3, v2, v8

    const-string v3, "DGC"

    aput-object v3, v2, v9

    const/4 v3, 0x5

    const-string v4, "DOGE"

    aput-object v4, v2, v3

    const/4 v3, 0x6

    const-string v4, "DVC"

    aput-object v4, v2, v3

    const/4 v3, 0x7

    const-string v4, "FRC"

    aput-object v4, v2, v3

    const/16 v3, 0x8

    const-string v4, "FTC"

    aput-object v4, v2, v3

    const/16 v3, 0x9

    const-string v4, "I0C"

    aput-object v4, v2, v3

    const/16 v3, 0xa

    const-string v4, "IXC"

    aput-object v4, v2, v3

    const/16 v3, 0xb

    const-string v4, "NMC"

    aput-object v4, v2, v3

    const/16 v3, 0xc

    const-string v4, "NVC"

    aput-object v4, v2, v3

    const/16 v3, 0xd

    const-string v4, "NXT"

    aput-object v4, v2, v3

    const/16 v3, 0xe

    const-string v4, "PPC"

    aput-object v4, v2, v3

    const/16 v3, 0xf

    const-string v4, "QRK"

    aput-object v4, v2, v3

    const/16 v3, 0x10

    const-string v4, "TRC"

    aput-object v4, v2, v3

    const/16 v3, 0x11

    const-string v4, "VTC"

    aput-object v4, v2, v3

    const/16 v3, 0x12

    const-string v4, "WDC"

    aput-object v4, v2, v3

    const/16 v3, 0x13

    const-string v4, "XPM"

    aput-object v4, v2, v3

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 241
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Vircurex;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "NMC"

    const/16 v2, 0x14

    new-array v2, v2, [Ljava/lang/String;

    const-string v3, "USD"

    aput-object v3, v2, v5

    const-string v3, "EUR"

    aput-object v3, v2, v6

    const-string v3, "BTC"

    aput-object v3, v2, v7

    const-string v3, "ANC"

    aput-object v3, v2, v8

    const-string v3, "DGC"

    aput-object v3, v2, v9

    const/4 v3, 0x5

    const-string v4, "DOGE"

    aput-object v4, v2, v3

    const/4 v3, 0x6

    const-string v4, "DVC"

    aput-object v4, v2, v3

    const/4 v3, 0x7

    const-string v4, "FRC"

    aput-object v4, v2, v3

    const/16 v3, 0x8

    const-string v4, "FTC"

    aput-object v4, v2, v3

    const/16 v3, 0x9

    const-string v4, "I0C"

    aput-object v4, v2, v3

    const/16 v3, 0xa

    const-string v4, "IXC"

    aput-object v4, v2, v3

    const/16 v3, 0xb

    const-string v4, "LTC"

    aput-object v4, v2, v3

    const/16 v3, 0xc

    const-string v4, "NVC"

    aput-object v4, v2, v3

    const/16 v3, 0xd

    const-string v4, "NXT"

    aput-object v4, v2, v3

    const/16 v3, 0xe

    const-string v4, "PPC"

    aput-object v4, v2, v3

    const/16 v3, 0xf

    const-string v4, "QRK"

    aput-object v4, v2, v3

    const/16 v3, 0x10

    const-string v4, "TRC"

    aput-object v4, v2, v3

    const/16 v3, 0x11

    const-string v4, "VTC"

    aput-object v4, v2, v3

    const/16 v3, 0x12

    const-string v4, "WDC"

    aput-object v4, v2, v3

    const/16 v3, 0x13

    const-string v4, "XPM"

    aput-object v4, v2, v3

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 263
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Vircurex;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "NVC"

    const/16 v2, 0x14

    new-array v2, v2, [Ljava/lang/String;

    const-string v3, "USD"

    aput-object v3, v2, v5

    const-string v3, "EUR"

    aput-object v3, v2, v6

    const-string v3, "BTC"

    aput-object v3, v2, v7

    const-string v3, "ANC"

    aput-object v3, v2, v8

    const-string v3, "DGC"

    aput-object v3, v2, v9

    const/4 v3, 0x5

    const-string v4, "DOGE"

    aput-object v4, v2, v3

    const/4 v3, 0x6

    const-string v4, "DVC"

    aput-object v4, v2, v3

    const/4 v3, 0x7

    const-string v4, "FRC"

    aput-object v4, v2, v3

    const/16 v3, 0x8

    const-string v4, "FTC"

    aput-object v4, v2, v3

    const/16 v3, 0x9

    const-string v4, "I0C"

    aput-object v4, v2, v3

    const/16 v3, 0xa

    const-string v4, "IXC"

    aput-object v4, v2, v3

    const/16 v3, 0xb

    const-string v4, "LTC"

    aput-object v4, v2, v3

    const/16 v3, 0xc

    const-string v4, "NMC"

    aput-object v4, v2, v3

    const/16 v3, 0xd

    const-string v4, "NXT"

    aput-object v4, v2, v3

    const/16 v3, 0xe

    const-string v4, "PPC"

    aput-object v4, v2, v3

    const/16 v3, 0xf

    const-string v4, "QRK"

    aput-object v4, v2, v3

    const/16 v3, 0x10

    const-string v4, "TRC"

    aput-object v4, v2, v3

    const/16 v3, 0x11

    const-string v4, "VTC"

    aput-object v4, v2, v3

    const/16 v3, 0x12

    const-string v4, "WDC"

    aput-object v4, v2, v3

    const/16 v3, 0x13

    const-string v4, "XPM"

    aput-object v4, v2, v3

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 285
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Vircurex;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "NXT"

    const/16 v2, 0x14

    new-array v2, v2, [Ljava/lang/String;

    const-string v3, "USD"

    aput-object v3, v2, v5

    const-string v3, "EUR"

    aput-object v3, v2, v6

    const-string v3, "BTC"

    aput-object v3, v2, v7

    const-string v3, "ANC"

    aput-object v3, v2, v8

    const-string v3, "DGC"

    aput-object v3, v2, v9

    const/4 v3, 0x5

    const-string v4, "DOGE"

    aput-object v4, v2, v3

    const/4 v3, 0x6

    const-string v4, "DVC"

    aput-object v4, v2, v3

    const/4 v3, 0x7

    const-string v4, "FRC"

    aput-object v4, v2, v3

    const/16 v3, 0x8

    const-string v4, "FTC"

    aput-object v4, v2, v3

    const/16 v3, 0x9

    const-string v4, "I0C"

    aput-object v4, v2, v3

    const/16 v3, 0xa

    const-string v4, "IXC"

    aput-object v4, v2, v3

    const/16 v3, 0xb

    const-string v4, "LTC"

    aput-object v4, v2, v3

    const/16 v3, 0xc

    const-string v4, "NMC"

    aput-object v4, v2, v3

    const/16 v3, 0xd

    const-string v4, "NVC"

    aput-object v4, v2, v3

    const/16 v3, 0xe

    const-string v4, "PPC"

    aput-object v4, v2, v3

    const/16 v3, 0xf

    const-string v4, "QRK"

    aput-object v4, v2, v3

    const/16 v3, 0x10

    const-string v4, "TRC"

    aput-object v4, v2, v3

    const/16 v3, 0x11

    const-string v4, "VTC"

    aput-object v4, v2, v3

    const/16 v3, 0x12

    const-string v4, "WDC"

    aput-object v4, v2, v3

    const/16 v3, 0x13

    const-string v4, "XPM"

    aput-object v4, v2, v3

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 307
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Vircurex;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "PPC"

    const/16 v2, 0x14

    new-array v2, v2, [Ljava/lang/String;

    const-string v3, "USD"

    aput-object v3, v2, v5

    const-string v3, "EUR"

    aput-object v3, v2, v6

    const-string v3, "BTC"

    aput-object v3, v2, v7

    const-string v3, "ANC"

    aput-object v3, v2, v8

    const-string v3, "DGC"

    aput-object v3, v2, v9

    const/4 v3, 0x5

    const-string v4, "DOGE"

    aput-object v4, v2, v3

    const/4 v3, 0x6

    const-string v4, "DVC"

    aput-object v4, v2, v3

    const/4 v3, 0x7

    const-string v4, "FRC"

    aput-object v4, v2, v3

    const/16 v3, 0x8

    const-string v4, "FTC"

    aput-object v4, v2, v3

    const/16 v3, 0x9

    const-string v4, "I0C"

    aput-object v4, v2, v3

    const/16 v3, 0xa

    const-string v4, "IXC"

    aput-object v4, v2, v3

    const/16 v3, 0xb

    const-string v4, "LTC"

    aput-object v4, v2, v3

    const/16 v3, 0xc

    const-string v4, "NMC"

    aput-object v4, v2, v3

    const/16 v3, 0xd

    const-string v4, "NVC"

    aput-object v4, v2, v3

    const/16 v3, 0xe

    const-string v4, "NXT"

    aput-object v4, v2, v3

    const/16 v3, 0xf

    const-string v4, "QRK"

    aput-object v4, v2, v3

    const/16 v3, 0x10

    const-string v4, "TRC"

    aput-object v4, v2, v3

    const/16 v3, 0x11

    const-string v4, "VTC"

    aput-object v4, v2, v3

    const/16 v3, 0x12

    const-string v4, "WDC"

    aput-object v4, v2, v3

    const/16 v3, 0x13

    const-string v4, "XPM"

    aput-object v4, v2, v3

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 329
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Vircurex;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "QRK"

    const/16 v2, 0x14

    new-array v2, v2, [Ljava/lang/String;

    const-string v3, "USD"

    aput-object v3, v2, v5

    const-string v3, "EUR"

    aput-object v3, v2, v6

    const-string v3, "BTC"

    aput-object v3, v2, v7

    const-string v3, "ANC"

    aput-object v3, v2, v8

    const-string v3, "DGC"

    aput-object v3, v2, v9

    const/4 v3, 0x5

    const-string v4, "DOGE"

    aput-object v4, v2, v3

    const/4 v3, 0x6

    const-string v4, "DVC"

    aput-object v4, v2, v3

    const/4 v3, 0x7

    const-string v4, "FRC"

    aput-object v4, v2, v3

    const/16 v3, 0x8

    const-string v4, "FTC"

    aput-object v4, v2, v3

    const/16 v3, 0x9

    const-string v4, "I0C"

    aput-object v4, v2, v3

    const/16 v3, 0xa

    const-string v4, "IXC"

    aput-object v4, v2, v3

    const/16 v3, 0xb

    const-string v4, "LTC"

    aput-object v4, v2, v3

    const/16 v3, 0xc

    const-string v4, "NMC"

    aput-object v4, v2, v3

    const/16 v3, 0xd

    const-string v4, "NVC"

    aput-object v4, v2, v3

    const/16 v3, 0xe

    const-string v4, "NXT"

    aput-object v4, v2, v3

    const/16 v3, 0xf

    const-string v4, "PPC"

    aput-object v4, v2, v3

    const/16 v3, 0x10

    const-string v4, "TRC"

    aput-object v4, v2, v3

    const/16 v3, 0x11

    const-string v4, "VTC"

    aput-object v4, v2, v3

    const/16 v3, 0x12

    const-string v4, "WDC"

    aput-object v4, v2, v3

    const/16 v3, 0x13

    const-string v4, "XPM"

    aput-object v4, v2, v3

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 351
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Vircurex;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "TRC"

    const/16 v2, 0x14

    new-array v2, v2, [Ljava/lang/String;

    const-string v3, "USD"

    aput-object v3, v2, v5

    const-string v3, "EUR"

    aput-object v3, v2, v6

    const-string v3, "BTC"

    aput-object v3, v2, v7

    const-string v3, "ANC"

    aput-object v3, v2, v8

    const-string v3, "DGC"

    aput-object v3, v2, v9

    const/4 v3, 0x5

    const-string v4, "DOGE"

    aput-object v4, v2, v3

    const/4 v3, 0x6

    const-string v4, "DVC"

    aput-object v4, v2, v3

    const/4 v3, 0x7

    const-string v4, "FRC"

    aput-object v4, v2, v3

    const/16 v3, 0x8

    const-string v4, "FTC"

    aput-object v4, v2, v3

    const/16 v3, 0x9

    const-string v4, "I0C"

    aput-object v4, v2, v3

    const/16 v3, 0xa

    const-string v4, "IXC"

    aput-object v4, v2, v3

    const/16 v3, 0xb

    const-string v4, "LTC"

    aput-object v4, v2, v3

    const/16 v3, 0xc

    const-string v4, "NMC"

    aput-object v4, v2, v3

    const/16 v3, 0xd

    const-string v4, "NVC"

    aput-object v4, v2, v3

    const/16 v3, 0xe

    const-string v4, "NXT"

    aput-object v4, v2, v3

    const/16 v3, 0xf

    const-string v4, "PPC"

    aput-object v4, v2, v3

    const/16 v3, 0x10

    const-string v4, "QRK"

    aput-object v4, v2, v3

    const/16 v3, 0x11

    const-string v4, "VTC"

    aput-object v4, v2, v3

    const/16 v3, 0x12

    const-string v4, "WDC"

    aput-object v4, v2, v3

    const/16 v3, 0x13

    const-string v4, "XPM"

    aput-object v4, v2, v3

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 373
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Vircurex;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "VTC"

    const/16 v2, 0x14

    new-array v2, v2, [Ljava/lang/String;

    const-string v3, "USD"

    aput-object v3, v2, v5

    const-string v3, "EUR"

    aput-object v3, v2, v6

    const-string v3, "BTC"

    aput-object v3, v2, v7

    const-string v3, "ANC"

    aput-object v3, v2, v8

    const-string v3, "DGC"

    aput-object v3, v2, v9

    const/4 v3, 0x5

    const-string v4, "DOGE"

    aput-object v4, v2, v3

    const/4 v3, 0x6

    const-string v4, "DVC"

    aput-object v4, v2, v3

    const/4 v3, 0x7

    const-string v4, "FRC"

    aput-object v4, v2, v3

    const/16 v3, 0x8

    const-string v4, "FTC"

    aput-object v4, v2, v3

    const/16 v3, 0x9

    const-string v4, "I0C"

    aput-object v4, v2, v3

    const/16 v3, 0xa

    const-string v4, "IXC"

    aput-object v4, v2, v3

    const/16 v3, 0xb

    const-string v4, "LTC"

    aput-object v4, v2, v3

    const/16 v3, 0xc

    const-string v4, "NMC"

    aput-object v4, v2, v3

    const/16 v3, 0xd

    const-string v4, "NVC"

    aput-object v4, v2, v3

    const/16 v3, 0xe

    const-string v4, "NXT"

    aput-object v4, v2, v3

    const/16 v3, 0xf

    const-string v4, "PPC"

    aput-object v4, v2, v3

    const/16 v3, 0x10

    const-string v4, "QRK"

    aput-object v4, v2, v3

    const/16 v3, 0x11

    const-string v4, "TRC"

    aput-object v4, v2, v3

    const/16 v3, 0x12

    const-string v4, "WDC"

    aput-object v4, v2, v3

    const/16 v3, 0x13

    const-string v4, "XPM"

    aput-object v4, v2, v3

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 395
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Vircurex;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "WDC"

    const/16 v2, 0x14

    new-array v2, v2, [Ljava/lang/String;

    const-string v3, "USD"

    aput-object v3, v2, v5

    const-string v3, "EUR"

    aput-object v3, v2, v6

    const-string v3, "BTC"

    aput-object v3, v2, v7

    const-string v3, "ANC"

    aput-object v3, v2, v8

    const-string v3, "DGC"

    aput-object v3, v2, v9

    const/4 v3, 0x5

    const-string v4, "DOGE"

    aput-object v4, v2, v3

    const/4 v3, 0x6

    const-string v4, "DVC"

    aput-object v4, v2, v3

    const/4 v3, 0x7

    const-string v4, "FRC"

    aput-object v4, v2, v3

    const/16 v3, 0x8

    const-string v4, "FTC"

    aput-object v4, v2, v3

    const/16 v3, 0x9

    const-string v4, "I0C"

    aput-object v4, v2, v3

    const/16 v3, 0xa

    const-string v4, "IXC"

    aput-object v4, v2, v3

    const/16 v3, 0xb

    const-string v4, "LTC"

    aput-object v4, v2, v3

    const/16 v3, 0xc

    const-string v4, "NMC"

    aput-object v4, v2, v3

    const/16 v3, 0xd

    const-string v4, "NVC"

    aput-object v4, v2, v3

    const/16 v3, 0xe

    const-string v4, "NXT"

    aput-object v4, v2, v3

    const/16 v3, 0xf

    const-string v4, "PPC"

    aput-object v4, v2, v3

    const/16 v3, 0x10

    const-string v4, "QRK"

    aput-object v4, v2, v3

    const/16 v3, 0x11

    const-string v4, "TRC"

    aput-object v4, v2, v3

    const/16 v3, 0x12

    const-string v4, "VTC"

    aput-object v4, v2, v3

    const/16 v3, 0x13

    const-string v4, "XPM"

    aput-object v4, v2, v3

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 417
    sget-object v0, Lcom/mobnetic/coinguardian/model/market/Vircurex;->CURRENCY_PAIRS:Ljava/util/HashMap;

    const-string v1, "XPM"

    const/16 v2, 0x14

    new-array v2, v2, [Ljava/lang/String;

    const-string v3, "USD"

    aput-object v3, v2, v5

    const-string v3, "EUR"

    aput-object v3, v2, v6

    const-string v3, "BTC"

    aput-object v3, v2, v7

    const-string v3, "ANC"

    aput-object v3, v2, v8

    const-string v3, "DGC"

    aput-object v3, v2, v9

    const/4 v3, 0x5

    const-string v4, "DOGE"

    aput-object v4, v2, v3

    const/4 v3, 0x6

    const-string v4, "DVC"

    aput-object v4, v2, v3

    const/4 v3, 0x7

    const-string v4, "FRC"

    aput-object v4, v2, v3

    const/16 v3, 0x8

    const-string v4, "FTC"

    aput-object v4, v2, v3

    const/16 v3, 0x9

    const-string v4, "I0C"

    aput-object v4, v2, v3

    const/16 v3, 0xa

    const-string v4, "IXC"

    aput-object v4, v2, v3

    const/16 v3, 0xb

    const-string v4, "LTC"

    aput-object v4, v2, v3

    const/16 v3, 0xc

    const-string v4, "NMC"

    aput-object v4, v2, v3

    const/16 v3, 0xd

    const-string v4, "NVC"

    aput-object v4, v2, v3

    const/16 v3, 0xe

    const-string v4, "NXT"

    aput-object v4, v2, v3

    const/16 v3, 0xf

    const-string v4, "PPC"

    aput-object v4, v2, v3

    const/16 v3, 0x10

    const-string v4, "QRK"

    aput-object v4, v2, v3

    const/16 v3, 0x11

    const-string v4, "TRC"

    aput-object v4, v2, v3

    const/16 v3, 0x12

    const-string v4, "VTC"

    aput-object v4, v2, v3

    const/16 v3, 0x13

    const-string v4, "WDC"

    aput-object v4, v2, v3

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 439
    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .prologue
    .line 442
    const-string v0, "Vircurex"

    const-string v1, "Vircurex"

    sget-object v2, Lcom/mobnetic/coinguardian/model/market/Vircurex;->CURRENCY_PAIRS:Ljava/util/HashMap;

    invoke-direct {p0, v0, v1, v2}, Lcom/mobnetic/coinguardian/model/Market;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;)V

    .line 443
    return-void
.end method


# virtual methods
.method public getUrl(ILcom/mobnetic/coinguardian/model/CheckerInfo;)Ljava/lang/String;
    .locals 4
    .param p1, "requestId"    # I
    .param p2, "checkerInfo"    # Lcom/mobnetic/coinguardian/model/CheckerInfo;

    .prologue
    .line 447
    const-string v0, "https://api.vircurex.com/api/get_info_for_1_currency.json?base=%1$s&alt=%2$s"

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
    .line 452
    const-string v0, "highest_bid"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v0

    iput-wide v0, p3, Lcom/mobnetic/coinguardian/model/Ticker;->bid:D

    .line 453
    const-string v0, "lowest_ask"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v0

    iput-wide v0, p3, Lcom/mobnetic/coinguardian/model/Ticker;->ask:D

    .line 454
    const-string v0, "volume"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v0

    iput-wide v0, p3, Lcom/mobnetic/coinguardian/model/Ticker;->vol:D

    .line 457
    const-string v0, "last_trade"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v0

    iput-wide v0, p3, Lcom/mobnetic/coinguardian/model/Ticker;->last:D

    .line 458
    return-void
.end method
