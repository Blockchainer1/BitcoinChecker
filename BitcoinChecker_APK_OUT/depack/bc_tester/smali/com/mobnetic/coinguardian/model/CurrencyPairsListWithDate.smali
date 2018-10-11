.class public Lcom/mobnetic/coinguardian/model/CurrencyPairsListWithDate;
.super Ljava/lang/Object;
.source "CurrencyPairsListWithDate.java"


# instance fields
.field public date:J

.field public pairs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/mobnetic/coinguardian/model/CurrencyPairInfo;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
