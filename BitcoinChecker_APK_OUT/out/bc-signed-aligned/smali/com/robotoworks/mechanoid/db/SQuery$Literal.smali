.class public final Lcom/robotoworks/mechanoid/db/SQuery$Literal;
.super Ljava/lang/Object;
.source "SQuery.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/robotoworks/mechanoid/db/SQuery;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Literal"
.end annotation


# instance fields
.field protected final value:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 68
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 69
    iput-object p1, p0, Lcom/robotoworks/mechanoid/db/SQuery$Literal;->value:Ljava/lang/String;

    .line 70
    return-void
.end method
