.class public abstract Lcom/robotoworks/mechanoid/db/CursorWalker;
.super Ljava/lang/Object;
.source "CursorWalker.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method protected abstract createCursor()Landroid/database/Cursor;
.end method

.method protected abstract step(Landroid/database/Cursor;)V
.end method

.method public walk()I
    .locals 3

    .prologue
    .line 60
    const/4 v0, 0x0

    .line 63
    .local v0, "cursor":Landroid/database/Cursor;
    :try_start_0
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/db/CursorWalker;->createCursor()Landroid/database/Cursor;

    move-result-object v0

    .line 65
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-interface {v0}, Landroid/database/Cursor;->getCount()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 66
    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z

    .line 67
    invoke-virtual {p0, v0}, Lcom/robotoworks/mechanoid/db/CursorWalker;->step(Landroid/database/Cursor;)V

    .line 65
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 70
    :cond_0
    invoke-interface {v0}, Landroid/database/Cursor;->getCount()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v2

    .line 73
    invoke-static {v0}, Lcom/robotoworks/mechanoid/util/Closeables;->closeSilently(Landroid/database/Cursor;)V

    return v2

    .end local v1    # "i":I
    :catchall_0
    move-exception v2

    invoke-static {v0}, Lcom/robotoworks/mechanoid/util/Closeables;->closeSilently(Landroid/database/Cursor;)V

    throw v2
.end method
