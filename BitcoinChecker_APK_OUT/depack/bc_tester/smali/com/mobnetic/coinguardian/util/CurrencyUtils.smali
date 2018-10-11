.class public Lcom/mobnetic/coinguardian/util/CurrencyUtils;
.super Ljava/lang/Object;
.source "CurrencyUtils.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getCurrencySubunit(Ljava/lang/String;J)Lcom/mobnetic/coinguardian/model/CurrencySubunit;
    .locals 5
    .param p0, "currency"    # Ljava/lang/String;
    .param p1, "subunitToUnit"    # J

    .prologue
    .line 15
    sget-object v1, Lcom/mobnetic/coinguardian/model/currency/CurrenciesSubunits;->CURRENCIES_SUBUNITS:Ljava/util/HashMap;

    invoke-virtual {v1, p0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 16
    sget-object v1, Lcom/mobnetic/coinguardian/model/currency/CurrenciesSubunits;->CURRENCIES_SUBUNITS:Ljava/util/HashMap;

    invoke-virtual {v1, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mobnetic/coinguardian/model/CurrencySubunitsMap;

    .line 17
    .local v0, "subunits":Lcom/mobnetic/coinguardian/model/CurrencySubunitsMap;
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/mobnetic/coinguardian/model/CurrencySubunitsMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 18
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/mobnetic/coinguardian/model/CurrencySubunitsMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mobnetic/coinguardian/model/CurrencySubunit;

    .line 21
    .end local v0    # "subunits":Lcom/mobnetic/coinguardian/model/CurrencySubunitsMap;
    :goto_0
    return-object v1

    :cond_0
    new-instance v1, Lcom/mobnetic/coinguardian/model/CurrencySubunit;

    const-wide/16 v2, 0x1

    invoke-direct {v1, p0, v2, v3}, Lcom/mobnetic/coinguardian/model/CurrencySubunit;-><init>(Ljava/lang/String;J)V

    goto :goto_0
.end method

.method public static getCurrencySymbol(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "currency"    # Ljava/lang/String;

    .prologue
    .line 11
    sget-object v0, Lcom/mobnetic/coinguardian/model/currency/CurrencySymbols;->CURRENCY_SYMBOLS:Ljava/util/HashMap;

    invoke-virtual {v0, p0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/mobnetic/coinguardian/model/currency/CurrencySymbols;->CURRENCY_SYMBOLS:Ljava/util/HashMap;

    invoke-virtual {v0, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    :goto_0
    return-object v0

    :cond_0
    move-object v0, p0

    goto :goto_0
.end method
