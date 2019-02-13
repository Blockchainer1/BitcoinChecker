.class public Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;
.super Ljava/lang/Object;
.source "CurrencyPairsMapHelper.java"


# instance fields
.field private final currencyPairs:Ljava/util/HashMap;
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

.field private final currencyPairsIds:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private date:J

.field private pairsCount:I


# direct methods
.method public constructor <init>(Lcom/mobnetic/coinguardian/model/CurrencyPairsListWithDate;)V
    .locals 10
    .param p1, "currencyPairsListWithDate"    # Lcom/mobnetic/coinguardian/model/CurrencyPairsListWithDate;

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    const/4 v6, 0x0

    iput v6, p0, Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;->pairsCount:I

    .line 18
    new-instance v6, Ljava/util/LinkedHashMap;

    invoke-direct {v6}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v6, p0, Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;->currencyPairs:Ljava/util/HashMap;

    .line 19
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    iput-object v6, p0, Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;->currencyPairsIds:Ljava/util/HashMap;

    .line 21
    if-nez p1, :cond_1

    .line 57
    :cond_0
    return-void

    .line 24
    :cond_1
    iget-wide v6, p1, Lcom/mobnetic/coinguardian/model/CurrencyPairsListWithDate;->date:J

    iput-wide v6, p0, Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;->date:J

    .line 25
    iget-object v5, p1, Lcom/mobnetic/coinguardian/model/CurrencyPairsListWithDate;->pairs:Ljava/util/List;

    .line 26
    .local v5, "sortedPairs":Ljava/util/List;, "Ljava/util/List<Lcom/mobnetic/coinguardian/model/CurrencyPairInfo;>;"
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v6

    iput v6, p0, Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;->pairsCount:I

    .line 28
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 29
    .local v1, "currencyGroupSizes":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Integer;>;"
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_3

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/mobnetic/coinguardian/model/CurrencyPairInfo;

    .line 30
    .local v2, "currencyPairInfo":Lcom/mobnetic/coinguardian/model/CurrencyPairInfo;
    invoke-virtual {v2}, Lcom/mobnetic/coinguardian/model/CurrencyPairInfo;->getCurrencyBase()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    .line 31
    .local v3, "currentCurrencyGroupSize":Ljava/lang/Integer;
    if-nez v3, :cond_2

    .line 32
    const/4 v7, 0x1

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    .line 36
    :goto_1
    invoke-virtual {v2}, Lcom/mobnetic/coinguardian/model/CurrencyPairInfo;->getCurrencyBase()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1, v7, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 34
    :cond_2
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v7

    add-int/lit8 v7, v7, 0x1

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    goto :goto_1

    .line 39
    .end local v2    # "currencyPairInfo":Lcom/mobnetic/coinguardian/model/CurrencyPairInfo;
    .end local v3    # "currentCurrencyGroupSize":Ljava/lang/Integer;
    :cond_3
    const/4 v4, 0x0

    .line 40
    .local v4, "currentGroupPositionToInsert":I
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_4
    :goto_2
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/mobnetic/coinguardian/model/CurrencyPairInfo;

    .line 41
    .restart local v2    # "currencyPairInfo":Lcom/mobnetic/coinguardian/model/CurrencyPairInfo;
    iget-object v6, p0, Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;->currencyPairs:Ljava/util/HashMap;

    invoke-virtual {v2}, Lcom/mobnetic/coinguardian/model/CurrencyPairInfo;->getCurrencyBase()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/CharSequence;

    .line 42
    .local v0, "currencyGroup":[Ljava/lang/CharSequence;
    if-nez v0, :cond_5

    .line 43
    invoke-virtual {v2}, Lcom/mobnetic/coinguardian/model/CurrencyPairInfo;->getCurrencyBase()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    new-array v0, v6, [Ljava/lang/CharSequence;

    .line 44
    iget-object v6, p0, Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;->currencyPairs:Ljava/util/HashMap;

    invoke-virtual {v2}, Lcom/mobnetic/coinguardian/model/CurrencyPairInfo;->getCurrencyBase()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 45
    const/4 v4, 0x0

    .line 49
    :goto_3
    invoke-virtual {v2}, Lcom/mobnetic/coinguardian/model/CurrencyPairInfo;->getCurrencyCounter()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v0, v4

    .line 51
    invoke-virtual {v2}, Lcom/mobnetic/coinguardian/model/CurrencyPairInfo;->getCurrencyPairId()Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_4

    .line 52
    iget-object v6, p0, Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;->currencyPairsIds:Ljava/util/HashMap;

    .line 53
    invoke-virtual {v2}, Lcom/mobnetic/coinguardian/model/CurrencyPairInfo;->getCurrencyBase()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v2}, Lcom/mobnetic/coinguardian/model/CurrencyPairInfo;->getCurrencyCounter()Ljava/lang/String;

    move-result-object v9

    invoke-direct {p0, v8, v9}, Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;->createCurrencyPairKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 54
    invoke-virtual {v2}, Lcom/mobnetic/coinguardian/model/CurrencyPairInfo;->getCurrencyPairId()Ljava/lang/String;

    move-result-object v9

    .line 52
    invoke-virtual {v6, v8, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    .line 47
    :cond_5
    add-int/lit8 v4, v4, 0x1

    goto :goto_3
.end method

.method private createCurrencyPairKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "currencyBase"    # Ljava/lang/String;
    .param p2, "currencyCounter"    # Ljava/lang/String;

    .prologue
    .line 76
    const-string v0, "%1$s_%2$s"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const/4 v2, 0x1

    aput-object p2, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public getCurrencyPairId(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "currencyBase"    # Ljava/lang/String;
    .param p2, "currencyCounter"    # Ljava/lang/String;

    .prologue
    .line 68
    iget-object v0, p0, Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;->currencyPairsIds:Ljava/util/HashMap;

    invoke-direct {p0, p1, p2}, Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;->createCurrencyPairKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public getCurrencyPairs()Ljava/util/HashMap;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/CharSequence;",
            ">;"
        }
    .end annotation

    .prologue
    .line 64
    iget-object v0, p0, Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;->currencyPairs:Ljava/util/HashMap;

    return-object v0
.end method

.method public getDate()J
    .locals 2

    .prologue
    .line 60
    iget-wide v0, p0, Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;->date:J

    return-wide v0
.end method

.method public getPairsCount()I
    .locals 1

    .prologue
    .line 72
    iget v0, p0, Lcom/mobnetic/coinguardian/util/CurrencyPairsMapHelper;->pairsCount:I

    return v0
.end method
