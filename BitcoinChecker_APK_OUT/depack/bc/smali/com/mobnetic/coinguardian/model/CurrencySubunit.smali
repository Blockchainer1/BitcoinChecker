.class public Lcom/mobnetic/coinguardian/model/CurrencySubunit;
.super Ljava/lang/Object;
.source "CurrencySubunit.java"


# instance fields
.field public final allowDecimal:Z

.field public final name:Ljava/lang/String;

.field public final subunitToUnit:J


# direct methods
.method public constructor <init>(Ljava/lang/String;J)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "subunitToUnit"    # J

    .prologue
    .line 10
    const/4 v0, 0x1

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/mobnetic/coinguardian/model/CurrencySubunit;-><init>(Ljava/lang/String;JZ)V

    .line 11
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;JZ)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "subunitToUnit"    # J
    .param p4, "allowDecimal"    # Z

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    iput-object p1, p0, Lcom/mobnetic/coinguardian/model/CurrencySubunit;->name:Ljava/lang/String;

    .line 15
    iput-wide p2, p0, Lcom/mobnetic/coinguardian/model/CurrencySubunit;->subunitToUnit:J

    .line 16
    iput-boolean p4, p0, Lcom/mobnetic/coinguardian/model/CurrencySubunit;->allowDecimal:Z

    .line 17
    return-void
.end method
