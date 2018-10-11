.class public Lcom/mobnetic/coinguardiandatamodule/tester/util/MarketCurrencyPairsStore;
.super Ljava/lang/Object;
.source "MarketCurrencyPairsStore.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final getPairsForMarket(Landroid/content/Context;Ljava/lang/String;)Lcom/mobnetic/coinguardian/model/CurrencyPairsListWithDate;
    .locals 4
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "marketKey"    # Ljava/lang/String;

    .prologue
    .line 28
    :try_start_0
    new-instance v1, Lcom/google/gson/Gson;

    invoke-direct {v1}, Lcom/google/gson/Gson;-><init>()V

    invoke-static {p0, p1}, Lcom/mobnetic/coinguardiandatamodule/tester/util/MarketCurrencyPairsStore;->getPairsStringForMarket(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-class v3, Lcom/mobnetic/coinguardian/model/CurrencyPairsListWithDate;

    invoke-virtual {v1, v2, v3}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mobnetic/coinguardian/model/CurrencyPairsListWithDate;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 31
    :goto_0
    return-object v1

    .line 29
    :catch_0
    move-exception v0

    .line 30
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 31
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private static final getPairsStringForMarket(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "marketKey"    # Ljava/lang/String;

    .prologue
    .line 35
    invoke-static {p0}, Lcom/mobnetic/coinguardiandatamodule/tester/util/MarketCurrencyPairsStore;->getSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const/4 v1, 0x0

    invoke-interface {v0, p1, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static getSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 12
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "MARKET_CURRENCIY_PAIRS"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    return-object v0
.end method

.method public static final savePairsForMarket(Landroid/content/Context;Ljava/lang/String;Lcom/mobnetic/coinguardian/model/CurrencyPairsListWithDate;)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "marketKey"    # Ljava/lang/String;
    .param p2, "currencyPairsListWithDate"    # Lcom/mobnetic/coinguardian/model/CurrencyPairsListWithDate;

    .prologue
    .line 17
    :try_start_0
    new-instance v1, Lcom/google/gson/Gson;

    invoke-direct {v1}, Lcom/google/gson/Gson;-><init>()V

    invoke-virtual {v1, p2}, Lcom/google/gson/Gson;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, p1, v1}, Lcom/mobnetic/coinguardiandatamodule/tester/util/MarketCurrencyPairsStore;->savePairsStringForMarket(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 21
    :goto_0
    return-void

    .line 18
    :catch_0
    move-exception v0

    .line 19
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method private static final savePairsStringForMarket(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "marketKey"    # Ljava/lang/String;
    .param p2, "jsonString"    # Ljava/lang/String;

    .prologue
    .line 23
    invoke-static {p0}, Lcom/mobnetic/coinguardiandatamodule/tester/util/MarketCurrencyPairsStore;->getSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 24
    return-void
.end method
