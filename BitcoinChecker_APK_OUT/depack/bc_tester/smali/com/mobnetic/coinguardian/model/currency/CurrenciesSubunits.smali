.class public Lcom/mobnetic/coinguardian/model/currency/CurrenciesSubunits;
.super Ljava/lang/Object;
.source "CurrenciesSubunits.java"


# static fields
.field public static final CURRENCIES_SUBUNITS:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/mobnetic/coinguardian/model/CurrencySubunitsMap;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 10

    .prologue
    .line 10
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/mobnetic/coinguardian/model/currency/CurrenciesSubunits;->CURRENCIES_SUBUNITS:Ljava/util/HashMap;

    .line 12
    sget-object v0, Lcom/mobnetic/coinguardian/model/currency/CurrenciesSubunits;->CURRENCIES_SUBUNITS:Ljava/util/HashMap;

    const-string v1, "BTC"

    new-instance v2, Lcom/mobnetic/coinguardian/model/CurrencySubunitsMap;

    const/4 v3, 0x4

    new-array v3, v3, [Lcom/mobnetic/coinguardian/model/CurrencySubunit;

    const/4 v4, 0x0

    new-instance v5, Lcom/mobnetic/coinguardian/model/CurrencySubunit;

    const-string v6, "BTC"

    const-wide/16 v8, 0x1

    invoke-direct {v5, v6, v8, v9}, Lcom/mobnetic/coinguardian/model/CurrencySubunit;-><init>(Ljava/lang/String;J)V

    aput-object v5, v3, v4

    const/4 v4, 0x1

    new-instance v5, Lcom/mobnetic/coinguardian/model/CurrencySubunit;

    const-string v6, "mBTC"

    const-wide/16 v8, 0x3e8

    invoke-direct {v5, v6, v8, v9}, Lcom/mobnetic/coinguardian/model/CurrencySubunit;-><init>(Ljava/lang/String;J)V

    aput-object v5, v3, v4

    const/4 v4, 0x2

    new-instance v5, Lcom/mobnetic/coinguardian/model/CurrencySubunit;

    const-string v6, "\u00b5BTC"

    const-wide/32 v8, 0xf4240

    invoke-direct {v5, v6, v8, v9}, Lcom/mobnetic/coinguardian/model/CurrencySubunit;-><init>(Ljava/lang/String;J)V

    aput-object v5, v3, v4

    const/4 v4, 0x3

    new-instance v5, Lcom/mobnetic/coinguardian/model/CurrencySubunit;

    const-string v6, "Satoshi"

    const-wide/32 v8, 0x5f5e100

    const/4 v7, 0x0

    invoke-direct {v5, v6, v8, v9, v7}, Lcom/mobnetic/coinguardian/model/CurrencySubunit;-><init>(Ljava/lang/String;JZ)V

    aput-object v5, v3, v4

    invoke-direct {v2, v3}, Lcom/mobnetic/coinguardian/model/CurrencySubunitsMap;-><init>([Lcom/mobnetic/coinguardian/model/CurrencySubunit;)V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 19
    sget-object v0, Lcom/mobnetic/coinguardian/model/currency/CurrenciesSubunits;->CURRENCIES_SUBUNITS:Ljava/util/HashMap;

    const-string v1, "LTC"

    new-instance v2, Lcom/mobnetic/coinguardian/model/CurrencySubunitsMap;

    const/4 v3, 0x2

    new-array v3, v3, [Lcom/mobnetic/coinguardian/model/CurrencySubunit;

    const/4 v4, 0x0

    new-instance v5, Lcom/mobnetic/coinguardian/model/CurrencySubunit;

    const-string v6, "LTC"

    const-wide/16 v8, 0x1

    invoke-direct {v5, v6, v8, v9}, Lcom/mobnetic/coinguardian/model/CurrencySubunit;-><init>(Ljava/lang/String;J)V

    aput-object v5, v3, v4

    const/4 v4, 0x1

    new-instance v5, Lcom/mobnetic/coinguardian/model/CurrencySubunit;

    const-string v6, "mLTC"

    const-wide/16 v8, 0x3e8

    invoke-direct {v5, v6, v8, v9}, Lcom/mobnetic/coinguardian/model/CurrencySubunit;-><init>(Ljava/lang/String;J)V

    aput-object v5, v3, v4

    invoke-direct {v2, v3}, Lcom/mobnetic/coinguardian/model/CurrencySubunitsMap;-><init>([Lcom/mobnetic/coinguardian/model/CurrencySubunit;)V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
