.class public abstract Lcom/mobnetic/coinguardian/model/FuturesMarket;
.super Lcom/mobnetic/coinguardian/model/Market;
.source "FuturesMarket.java"


# instance fields
.field public final contractTypes:[I


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;[I)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "ttsName"    # Ljava/lang/String;
    .param p4, "contractTypes"    # [I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/CharSequence;",
            ">;[I)V"
        }
    .end annotation

    .prologue
    .line 10
    .local p3, "currencyPairs":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;[Ljava/lang/CharSequence;>;"
    invoke-direct {p0, p1, p2, p3}, Lcom/mobnetic/coinguardian/model/Market;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;)V

    .line 11
    iput-object p4, p0, Lcom/mobnetic/coinguardian/model/FuturesMarket;->contractTypes:[I

    .line 12
    return-void
.end method


# virtual methods
.method public final getUrl(ILcom/mobnetic/coinguardian/model/CheckerInfo;)Ljava/lang/String;
    .locals 1
    .param p1, "requestId"    # I
    .param p2, "checkerInfo"    # Lcom/mobnetic/coinguardian/model/CheckerInfo;

    .prologue
    .line 16
    invoke-virtual {p2}, Lcom/mobnetic/coinguardian/model/CheckerInfo;->getContractType()I

    move-result v0

    invoke-virtual {p0, p1, p2, v0}, Lcom/mobnetic/coinguardian/model/FuturesMarket;->getUrl(ILcom/mobnetic/coinguardian/model/CheckerInfo;I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected abstract getUrl(ILcom/mobnetic/coinguardian/model/CheckerInfo;I)Ljava/lang/String;
.end method
