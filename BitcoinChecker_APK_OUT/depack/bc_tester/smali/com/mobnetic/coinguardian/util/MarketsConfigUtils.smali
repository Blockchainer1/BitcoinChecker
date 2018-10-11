.class public Lcom/mobnetic/coinguardian/util/MarketsConfigUtils;
.super Ljava/lang/Object;
.source "MarketsConfigUtils.java"


# static fields
.field private static final UNKNOWN:Lcom/mobnetic/coinguardian/model/Market;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 11
    new-instance v0, Lcom/mobnetic/coinguardian/model/market/Unknown;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/model/market/Unknown;-><init>()V

    sput-object v0, Lcom/mobnetic/coinguardian/util/MarketsConfigUtils;->UNKNOWN:Lcom/mobnetic/coinguardian/model/Market;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getMarketById(I)Lcom/mobnetic/coinguardian/model/Market;
    .locals 3
    .param p0, "id"    # I

    .prologue
    .line 14
    sget-object v1, Lcom/mobnetic/coinguardian/config/MarketsConfig;->MARKETS:Ljava/util/LinkedHashMap;

    monitor-enter v1

    .line 15
    if-ltz p0, :cond_0

    :try_start_0
    sget-object v0, Lcom/mobnetic/coinguardian/config/MarketsConfig;->MARKETS:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->size()I

    move-result v0

    if-ge p0, v0, :cond_0

    .line 16
    new-instance v0, Ljava/util/ArrayList;

    sget-object v2, Lcom/mobnetic/coinguardian/config/MarketsConfig;->MARKETS:Ljava/util/LinkedHashMap;

    invoke-virtual {v2}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mobnetic/coinguardian/model/Market;

    monitor-exit v1

    .line 19
    :goto_0
    return-object v0

    .line 18
    :cond_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    sget-object v0, Lcom/mobnetic/coinguardian/util/MarketsConfigUtils;->UNKNOWN:Lcom/mobnetic/coinguardian/model/Market;

    goto :goto_0

    .line 18
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public static getMarketByKey(Ljava/lang/String;)Lcom/mobnetic/coinguardian/model/Market;
    .locals 2
    .param p0, "key"    # Ljava/lang/String;

    .prologue
    .line 23
    sget-object v1, Lcom/mobnetic/coinguardian/config/MarketsConfig;->MARKETS:Ljava/util/LinkedHashMap;

    monitor-enter v1

    .line 24
    :try_start_0
    sget-object v0, Lcom/mobnetic/coinguardian/config/MarketsConfig;->MARKETS:Ljava/util/LinkedHashMap;

    invoke-virtual {v0, p0}, Ljava/util/LinkedHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 25
    sget-object v0, Lcom/mobnetic/coinguardian/config/MarketsConfig;->MARKETS:Ljava/util/LinkedHashMap;

    invoke-virtual {v0, p0}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mobnetic/coinguardian/model/Market;

    monitor-exit v1

    .line 27
    :goto_0
    return-object v0

    .line 26
    :cond_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 27
    sget-object v0, Lcom/mobnetic/coinguardian/util/MarketsConfigUtils;->UNKNOWN:Lcom/mobnetic/coinguardian/model/Market;

    goto :goto_0

    .line 26
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public static getMarketIdByKey(Ljava/lang/String;)I
    .locals 4
    .param p0, "key"    # Ljava/lang/String;

    .prologue
    .line 31
    const/4 v0, 0x0

    .line 32
    .local v0, "i":I
    sget-object v2, Lcom/mobnetic/coinguardian/config/MarketsConfig;->MARKETS:Ljava/util/LinkedHashMap;

    invoke-virtual {v2}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mobnetic/coinguardian/model/Market;

    .line 33
    .local v1, "market":Lcom/mobnetic/coinguardian/model/Market;
    iget-object v3, v1, Lcom/mobnetic/coinguardian/model/Market;->key:Ljava/lang/String;

    invoke-virtual {v3, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 38
    .end local v0    # "i":I
    .end local v1    # "market":Lcom/mobnetic/coinguardian/model/Market;
    :goto_1
    return v0

    .line 35
    .restart local v0    # "i":I
    .restart local v1    # "market":Lcom/mobnetic/coinguardian/model/Market;
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 36
    goto :goto_0

    .line 38
    .end local v1    # "market":Lcom/mobnetic/coinguardian/model/Market;
    :cond_1
    const/4 v0, 0x0

    goto :goto_1
.end method
