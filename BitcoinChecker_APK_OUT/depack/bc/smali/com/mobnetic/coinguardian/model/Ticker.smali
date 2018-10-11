.class public Lcom/mobnetic/coinguardian/model/Ticker;
.super Ljava/lang/Object;
.source "Ticker.java"


# static fields
.field public static final NO_DATA:I = -0x1


# instance fields
.field public ask:D

.field public bid:D

.field public high:D

.field public last:D

.field public low:D

.field public timestamp:J

.field public vol:D


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const-wide/high16 v0, -0x4010000000000000L    # -1.0

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    iput-wide v0, p0, Lcom/mobnetic/coinguardian/model/Ticker;->bid:D

    .line 18
    iput-wide v0, p0, Lcom/mobnetic/coinguardian/model/Ticker;->ask:D

    .line 19
    iput-wide v0, p0, Lcom/mobnetic/coinguardian/model/Ticker;->vol:D

    .line 20
    iput-wide v0, p0, Lcom/mobnetic/coinguardian/model/Ticker;->high:D

    .line 21
    iput-wide v0, p0, Lcom/mobnetic/coinguardian/model/Ticker;->low:D

    .line 22
    iput-wide v0, p0, Lcom/mobnetic/coinguardian/model/Ticker;->last:D

    .line 23
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/mobnetic/coinguardian/model/Ticker;->timestamp:J

    .line 24
    return-void
.end method
