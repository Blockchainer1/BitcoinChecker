.class public Lcom/mobnetic/coinguardiandatamodule/tester/volley/UnknownVolleyError;
.super Lcom/android/volley/VolleyError;
.source "UnknownVolleyError.java"


# static fields
.field private static final serialVersionUID:J = -0x76882fd468103fffL


# direct methods
.method public constructor <init>(Ljava/lang/Throwable;)V
    .locals 0
    .param p1, "cause"    # Ljava/lang/Throwable;

    .prologue
    .line 10
    invoke-direct {p0, p1}, Lcom/android/volley/VolleyError;-><init>(Ljava/lang/Throwable;)V

    .line 11
    return-void
.end method
