.class public abstract Lcom/robotoworks/mechanoid/db/ActiveRecordFactory;
.super Ljava/lang/Object;
.source "ActiveRecordFactory.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lcom/robotoworks/mechanoid/db/ActiveRecord;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 20
    .local p0, "this":Lcom/robotoworks/mechanoid/db/ActiveRecordFactory;, "Lcom/robotoworks/mechanoid/db/ActiveRecordFactory<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract create(Landroid/database/Cursor;)Lcom/robotoworks/mechanoid/db/ActiveRecord;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/database/Cursor;",
            ")TT;"
        }
    .end annotation
.end method

.method public abstract getProjection()[Ljava/lang/String;
.end method
