.class public abstract Lcom/robotoworks/mechanoid/db/ListInsertHelper;
.super Ljava/lang/Object;
.source "ListInsertHelper.java"


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
    .local p0, "this":Lcom/robotoworks/mechanoid/db/ListInsertHelper;, "Lcom/robotoworks/mechanoid/db/ListInsertHelper<TT;>;"
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

.method public insert(Landroid/net/Uri;Ljava/util/List;)V
    .locals 6
    .param p1, "contentUri"    # Landroid/net/Uri;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/net/Uri;",
            "Ljava/util/List",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 31
    .local p0, "this":Lcom/robotoworks/mechanoid/db/ListInsertHelper;, "Lcom/robotoworks/mechanoid/db/ListInsertHelper<TT;>;"
    .local p2, "items":Ljava/util/List;, "Ljava/util/List<TT;>;"
    invoke-static {}, Lcom/robotoworks/mechanoid/Mechanoid;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    .line 33
    .local v2, "resolver":Landroid/content/ContentResolver;
    if-eqz p2, :cond_0

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v5

    if-nez v5, :cond_1

    .line 47
    :cond_0
    return-void

    .line 37
    :cond_1
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v5

    if-ge v0, v5, :cond_0

    .line 38
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 40
    .local v1, "item":Ljava/lang/Object;, "TT;"
    invoke-virtual {p0, v1}, Lcom/robotoworks/mechanoid/db/ListInsertHelper;->createValues(Ljava/lang/Object;)Landroid/content/ContentValues;

    move-result-object v4

    .line 42
    .local v4, "values":Landroid/content/ContentValues;
    invoke-virtual {p0, v2, v1}, Lcom/robotoworks/mechanoid/db/ListInsertHelper;->onBeforeInsert(Landroid/content/ContentResolver;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 43
    invoke-virtual {v2, p1, v4}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object v3

    .line 44
    .local v3, "uri":Landroid/net/Uri;
    invoke-virtual {p0, v3, v1}, Lcom/robotoworks/mechanoid/db/ListInsertHelper;->onAfterInsert(Landroid/net/Uri;Ljava/lang/Object;)V

    .line 37
    .end local v3    # "uri":Landroid/net/Uri;
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method protected onAfterInsert(Landroid/net/Uri;Ljava/lang/Object;)V
    .locals 0
    .param p1, "uri"    # Landroid/net/Uri;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/net/Uri;",
            "TT;)V"
        }
    .end annotation

    .prologue
    .line 29
    .local p0, "this":Lcom/robotoworks/mechanoid/db/ListInsertHelper;, "Lcom/robotoworks/mechanoid/db/ListInsertHelper<TT;>;"
    .local p2, "item":Ljava/lang/Object;, "TT;"
    return-void
.end method

.method protected onBeforeInsert(Landroid/content/ContentResolver;Ljava/lang/Object;)Z
    .locals 1
    .param p1, "resolver"    # Landroid/content/ContentResolver;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/ContentResolver;",
            "TT;)Z"
        }
    .end annotation

    .prologue
    .line 28
    .local p0, "this":Lcom/robotoworks/mechanoid/db/ListInsertHelper;, "Lcom/robotoworks/mechanoid/db/ListInsertHelper<TT;>;"
    .local p2, "item":Ljava/lang/Object;, "TT;"
    const/4 v0, 0x1

    return v0
.end method
