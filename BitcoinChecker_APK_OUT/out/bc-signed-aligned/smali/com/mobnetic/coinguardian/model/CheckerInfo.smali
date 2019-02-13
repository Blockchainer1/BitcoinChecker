.class public Lcom/mobnetic/coinguardian/model/CheckerInfo;
.super Lcom/mobnetic/coinguardian/model/CurrencyPairInfo;
.source "CheckerInfo.java"


# instance fields
.field protected final contractType:I


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V
    .locals 0
    .param p1, "currencyBase"    # Ljava/lang/String;
    .param p2, "currencyCounter"    # Ljava/lang/String;
    .param p3, "currencyPairId"    # Ljava/lang/String;
    .param p4, "contractType"    # I

    .prologue
    .line 10
    invoke-direct {p0, p1, p2, p3}, Lcom/mobnetic/coinguardian/model/CurrencyPairInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    iput p4, p0, Lcom/mobnetic/coinguardian/model/CheckerInfo;->contractType:I

    .line 12
    return-void
.end method


# virtual methods
.method public getContractType()I
    .locals 1

    .prologue
    .line 23
    iget v0, p0, Lcom/mobnetic/coinguardian/model/CheckerInfo;->contractType:I

    return v0
.end method

.method public getCurrencyBaseLowerCase()Ljava/lang/String;
    .locals 2

    .prologue
    .line 15
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/model/CheckerInfo;->getCurrencyBase()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getCurrencyCounterLowerCase()Ljava/lang/String;
    .locals 2

    .prologue
    .line 19
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/model/CheckerInfo;->getCurrencyCounter()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
