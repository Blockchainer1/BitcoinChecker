.class public abstract Lcom/robotoworks/mechanoid/db/BulkInsertHelper;
.super Ljava/lang/Object;
.source "BulkInsertHelper.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 25
    .local p0, "this":Lcom/robotoworks/mechanoid/db/BulkInsertHelper;, "Lcom/robotoworks/mechanoid/db/BulkInsertHelper<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method protected abstract createValues(Ljava/lang/Object;)Landroid/content/ContentValues;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Landroid/content/ContentValues;"
        }
    .end annotation
.end method

.method public insert(Landroid/net/Uri;Ljava/util/List;)I
    .locals 5
    .param p1, "contentUri"    # Landroid/net/Uri;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/net/Uri;",
            "Ljava/util/List",
            "<TT;>;)I"
        }
    .end annotation

    .prologue
    .line 30
    .local p0, "this":Lcom/robotoworks/mechanoid/db/BulkInsertHelper;, "Lcom/robotoworks/mechanoid/db/BulkInsertHelper<TT;>;"
    .local p2, "items":Ljava/util/List;, "Ljava/util/List<TT;>;"
    invoke-static {}, Lcom/robotoworks/mechanoid/Mechanoid;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    .line 31
    .local v2, "resolver":Landroid/content/ContentResolver;
    if-eqz p2, :cond_0

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v4

    if-nez v4, :cond_1

    .line 32
    :cond_0
    const/4 v4, 0x0

    .line 43
    :goto_0
    return v4

    .line 35
    :cond_1
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v4

    new-array v3, v4, [Landroid/content/ContentValues;

    .line 37
    .local v3, "values":[Landroid/content/ContentValues;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v4, v3

    if-ge v0, v4, :cond_2

    .line 38
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 40
    .local v1, "item":Ljava/lang/Object;, "TT;"
    invoke-virtual {p0, v1}, Lcom/robotoworks/mechanoid/db/BulkInsertHelper;->createValues(Ljava/lang/Object;)Landroid/content/ContentValues;

    move-result-object v4

    aput-object v4, v3, v0

    .line 37
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 43
    .end local v1    # "item":Ljava/lang/Object;, "TT;"
    :cond_2
    invoke-virtual {v2, p1, v3}, Landroid/content/ContentResolver;->bulkInsert(Landroid/net/Uri;[Landroid/content/ContentValues;)I

    move-result v4

    goto :goto_0
.end method
