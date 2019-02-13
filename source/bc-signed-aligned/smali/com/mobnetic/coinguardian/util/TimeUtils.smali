.class public Lcom/mobnetic/coinguardian/util/TimeUtils;
.super Ljava/lang/Object;
.source "TimeUtils.java"


# static fields
.field public static final MILLIS_IN_DAY:J = 0x5265c00L

.field public static final MILLIS_IN_HOUR:J = 0x36ee80L

.field public static final MILLIS_IN_MINUTE:J = 0xea60L

.field public static final MILLIS_IN_SECOND:J = 0x3e8L

.field private static final MILLIS_IN_YEAR:J = 0x757b12c00L

.field public static final NANOS_IN_MILLIS:J = 0x3e8L


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static parseTimeToMillis(J)J
    .locals 4
    .param p0, "time"    # J

    .prologue
    const-wide/16 v2, 0x3e8

    .line 13
    const-wide v0, 0x757b12c00L

    cmp-long v0, p0, v0

    if-gez v0, :cond_1

    .line 14
    mul-long/2addr p0, v2

    .line 17
    .end local p0    # "time":J
    :cond_0
    :goto_0
    return-wide p0

    .line 15
    .restart local p0    # "time":J
    :cond_1
    const-wide v0, 0x8f68bc636000L

    cmp-long v0, p0, v0

    if-lez v0, :cond_0

    .line 16
    div-long/2addr p0, v2

    goto :goto_0
.end method
