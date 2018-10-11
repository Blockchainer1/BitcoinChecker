.class public Lcom/mobnetic/coinguardian/model/CurrencyPairInfo;
.super Ljava/lang/Object;
.source "CurrencyPairInfo.java"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable",
        "<",
        "Lcom/mobnetic/coinguardian/model/CurrencyPairInfo;",
        ">;"
    }
.end annotation


# instance fields
.field protected final currencyBase:Ljava/lang/String;

.field protected final currencyCounter:Ljava/lang/String;

.field protected final currencyPairId:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "currencyBase"    # Ljava/lang/String;
    .param p2, "currencyCounter"    # Ljava/lang/String;
    .param p3, "currencyPairId"    # Ljava/lang/String;

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    iput-object p1, p0, Lcom/mobnetic/coinguardian/model/CurrencyPairInfo;->currencyBase:Ljava/lang/String;

    .line 12
    iput-object p2, p0, Lcom/mobnetic/coinguardian/model/CurrencyPairInfo;->currencyCounter:Ljava/lang/String;

    .line 13
    iput-object p3, p0, Lcom/mobnetic/coinguardian/model/CurrencyPairInfo;->currencyPairId:Ljava/lang/String;

    .line 14
    return-void
.end method


# virtual methods
.method public compareTo(Lcom/mobnetic/coinguardian/model/CurrencyPairInfo;)I
    .locals 3
    .param p1, "another"    # Lcom/mobnetic/coinguardian/model/CurrencyPairInfo;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NullPointerException;
        }
    .end annotation

    .prologue
    .line 30
    iget-object v1, p0, Lcom/mobnetic/coinguardian/model/CurrencyPairInfo;->currencyBase:Ljava/lang/String;

    if-eqz v1, :cond_0

    iget-object v1, p1, Lcom/mobnetic/coinguardian/model/CurrencyPairInfo;->currencyBase:Ljava/lang/String;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/mobnetic/coinguardian/model/CurrencyPairInfo;->currencyCounter:Ljava/lang/String;

    if-eqz v1, :cond_0

    iget-object v1, p1, Lcom/mobnetic/coinguardian/model/CurrencyPairInfo;->currencyCounter:Ljava/lang/String;

    if-nez v1, :cond_1

    .line 31
    :cond_0
    new-instance v1, Ljava/lang/NullPointerException;

    invoke-direct {v1}, Ljava/lang/NullPointerException;-><init>()V

    throw v1

    .line 33
    :cond_1
    iget-object v1, p0, Lcom/mobnetic/coinguardian/model/CurrencyPairInfo;->currencyBase:Ljava/lang/String;

    iget-object v2, p1, Lcom/mobnetic/coinguardian/model/CurrencyPairInfo;->currencyBase:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v0

    .line 34
    .local v0, "compBase":I
    if-eqz v0, :cond_2

    .end local v0    # "compBase":I
    :goto_0
    return v0

    .restart local v0    # "compBase":I
    :cond_2
    iget-object v1, p0, Lcom/mobnetic/coinguardian/model/CurrencyPairInfo;->currencyCounter:Ljava/lang/String;

    iget-object v2, p1, Lcom/mobnetic/coinguardian/model/CurrencyPairInfo;->currencyCounter:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v0

    goto :goto_0
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 1

    .prologue
    .line 4
    check-cast p1, Lcom/mobnetic/coinguardian/model/CurrencyPairInfo;

    invoke-virtual {p0, p1}, Lcom/mobnetic/coinguardian/model/CurrencyPairInfo;->compareTo(Lcom/mobnetic/coinguardian/model/CurrencyPairInfo;)I

    move-result v0

    return v0
.end method

.method public getCurrencyBase()Ljava/lang/String;
    .locals 1

    .prologue
    .line 17
    iget-object v0, p0, Lcom/mobnetic/coinguardian/model/CurrencyPairInfo;->currencyBase:Ljava/lang/String;

    return-object v0
.end method

.method public getCurrencyCounter()Ljava/lang/String;
    .locals 1

    .prologue
    .line 21
    iget-object v0, p0, Lcom/mobnetic/coinguardian/model/CurrencyPairInfo;->currencyCounter:Ljava/lang/String;

    return-object v0
.end method

.method public getCurrencyPairId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 25
    iget-object v0, p0, Lcom/mobnetic/coinguardian/model/CurrencyPairInfo;->currencyPairId:Ljava/lang/String;

    return-object v0
.end method
