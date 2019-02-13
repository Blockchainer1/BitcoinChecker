.class public Lcom/robotoworks/mechanoid/MechanoidNotInitializedException;
.super Ljava/lang/RuntimeException;
.source "MechanoidNotInitializedException.java"


# static fields
.field private static final serialVersionUID:J = 0x1L


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 26
    const-string v0, "Mechanoid.init(Context) must be called before mechanoid can be used"

    invoke-direct {p0, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 27
    return-void
.end method
