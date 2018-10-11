.class public Lcom/robotoworks/mechanoid/db/ContentProviderActions;
.super Ljava/lang/Object;
.source "ContentProviderActions.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bulkInsert(Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;Landroid/net/Uri;[Landroid/content/ContentValues;)I
    .locals 3
    .param p1, "provider"    # Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;
    .param p2, "uri"    # Landroid/net/Uri;
    .param p3, "values"    # [Landroid/content/ContentValues;

    .prologue
    .line 43
    array-length v1, p3

    .line 44
    .local v1, "numValues":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, v1, :cond_0

    .line 45
    aget-object v2, p3, v0

    invoke-virtual {p0, p1, p2, v2}, Lcom/robotoworks/mechanoid/db/ContentProviderActions;->insert(Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    .line 44
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 47
    :cond_0
    return v1
.end method

.method public delete(Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 1
    .param p1, "provider"    # Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;
    .param p2, "uri"    # Landroid/net/Uri;
    .param p3, "selection"    # Ljava/lang/String;
    .param p4, "selectionArgs"    # [Ljava/lang/String;

    .prologue
    .line 27
    const/4 v0, -0x1

    return v0
.end method

.method public insert(Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;
    .locals 1
    .param p1, "provider"    # Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;
    .param p2, "uri"    # Landroid/net/Uri;
    .param p3, "values"    # Landroid/content/ContentValues;

    .prologue
    .line 31
    const/4 v0, 0x0

    return-object v0
.end method

.method public query(Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    .locals 1
    .param p1, "provider"    # Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;
    .param p2, "uri"    # Landroid/net/Uri;
    .param p3, "projection"    # [Ljava/lang/String;
    .param p4, "selection"    # Ljava/lang/String;
    .param p5, "selectionArgs"    # [Ljava/lang/String;
    .param p6, "sortOrder"    # Ljava/lang/String;

    .prologue
    .line 35
    const/4 v0, 0x0

    return-object v0
.end method

.method public selectRecordMap(Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;Landroid/net/Uri;Lcom/robotoworks/mechanoid/db/SQuery;Ljava/lang/String;)Ljava/util/Map;
    .locals 1
    .param p1, "provider"    # Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;
    .param p2, "uri"    # Landroid/net/Uri;
    .param p3, "sQuery"    # Lcom/robotoworks/mechanoid/db/SQuery;
    .param p4, "keyColumnName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/robotoworks/mechanoid/db/ActiveRecord;",
            ">(",
            "Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;",
            "Landroid/net/Uri;",
            "Lcom/robotoworks/mechanoid/db/SQuery;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "TT;>;"
        }
    .end annotation

    .prologue
    .line 55
    const/4 v0, 0x0

    return-object v0
.end method

.method public selectRecords(Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;Landroid/net/Uri;Lcom/robotoworks/mechanoid/db/SQuery;Ljava/lang/String;)Ljava/util/List;
    .locals 1
    .param p1, "provider"    # Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;
    .param p2, "uri"    # Landroid/net/Uri;
    .param p3, "sQuery"    # Lcom/robotoworks/mechanoid/db/SQuery;
    .param p4, "sortOrder"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/robotoworks/mechanoid/db/ActiveRecord;",
            ">(",
            "Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;",
            "Landroid/net/Uri;",
            "Lcom/robotoworks/mechanoid/db/SQuery;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 51
    const/4 v0, 0x0

    return-object v0
.end method

.method public update(Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 1
    .param p1, "provider"    # Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;
    .param p2, "uri"    # Landroid/net/Uri;
    .param p3, "values"    # Landroid/content/ContentValues;
    .param p4, "selection"    # Ljava/lang/String;
    .param p5, "selectionArgs"    # [Ljava/lang/String;

    .prologue
    .line 39
    const/4 v0, -0x1

    return v0
.end method
