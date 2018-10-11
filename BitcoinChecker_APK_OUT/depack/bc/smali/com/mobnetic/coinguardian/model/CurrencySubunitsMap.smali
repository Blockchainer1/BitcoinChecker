.class public Lcom/mobnetic/coinguardian/model/CurrencySubunitsMap;
.super Ljava/util/LinkedHashMap;
.source "CurrencySubunitsMap.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/LinkedHashMap",
        "<",
        "Ljava/lang/Long;",
        "Lcom/mobnetic/coinguardian/model/CurrencySubunit;",
        ">;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x642f14b40258ee63L


# direct methods
.method public varargs constructor <init>([Lcom/mobnetic/coinguardian/model/CurrencySubunit;)V
    .locals 6
    .param p1, "currencySubunits"    # [Lcom/mobnetic/coinguardian/model/CurrencySubunit;

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 10
    array-length v2, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v2, :cond_0

    aget-object v0, p1, v1

    .line 11
    .local v0, "currencySubunit":Lcom/mobnetic/coinguardian/model/CurrencySubunit;
    iget-wide v4, v0, Lcom/mobnetic/coinguardian/model/CurrencySubunit;->subunitToUnit:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {p0, v3, v0}, Lcom/mobnetic/coinguardian/model/CurrencySubunitsMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 12
    .end local v0    # "currencySubunit":Lcom/mobnetic/coinguardian/model/CurrencySubunit;
    :cond_0
    return-void
.end method
