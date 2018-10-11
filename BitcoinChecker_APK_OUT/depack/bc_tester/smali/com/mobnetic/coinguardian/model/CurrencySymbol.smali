.class public Lcom/mobnetic/coinguardian/model/CurrencySymbol;
.super Ljava/lang/Object;
.source "CurrencySymbol.java"


# instance fields
.field public final symbol:Ljava/lang/String;

.field public final symbolFirst:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "symbol"    # Ljava/lang/String;

    .prologue
    .line 9
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/mobnetic/coinguardian/model/CurrencySymbol;-><init>(Ljava/lang/String;Z)V

    .line 10
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Z)V
    .locals 0
    .param p1, "symbol"    # Ljava/lang/String;
    .param p2, "symbolFirst"    # Z

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    iput-object p1, p0, Lcom/mobnetic/coinguardian/model/CurrencySymbol;->symbol:Ljava/lang/String;

    .line 14
    iput-boolean p2, p0, Lcom/mobnetic/coinguardian/model/CurrencySymbol;->symbolFirst:Z

    .line 15
    return-void
.end method
