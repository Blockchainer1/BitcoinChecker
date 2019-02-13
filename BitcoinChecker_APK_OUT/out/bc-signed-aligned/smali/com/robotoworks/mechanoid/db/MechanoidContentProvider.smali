.class public abstract Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;
.super Landroid/content/ContentProvider;
.source "MechanoidContentProvider.java"


# static fields
.field public static final PARAM_GROUP_BY:Ljava/lang/String; = "mechdb_group_by"

.field public static final PARAM_NOTIFY:Ljava/lang/String; = "mechdb_notify"


# instance fields
.field private mContentTypes:[Ljava/lang/String;

.field private mOpenHelper:Lcom/robotoworks/mechanoid/db/MechanoidSQLiteOpenHelper;

.field private mUriMatcher:Landroid/content/UriMatcher;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 39
    invoke-direct {p0}, Landroid/content/ContentProvider;-><init>()V

    return-void
.end method


# virtual methods
.method public applyBatch(Ljava/util/ArrayList;)[Landroid/content/ContentProviderResult;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/content/ContentProviderOperation;",
            ">;)[",
            "Landroid/content/ContentProviderResult;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/OperationApplicationException;
        }
    .end annotation

    .prologue
    .line 257
    .local p1, "operations":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/content/ContentProviderOperation;>;"
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;->getOpenHelper()Lcom/robotoworks/mechanoid/db/MechanoidSQLiteOpenHelper;

    move-result-object v4

    invoke-virtual {v4}, Lcom/robotoworks/mechanoid/db/MechanoidSQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 258
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 260
    :try_start_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v2

    .line 261
    .local v2, "numOperations":I
    new-array v3, v2, [Landroid/content/ContentProviderResult;

    .line 262
    .local v3, "results":[Landroid/content/ContentProviderResult;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v2, :cond_0

    .line 263
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/content/ContentProviderOperation;

    invoke-virtual {v4, p0, v3, v1}, Landroid/content/ContentProviderOperation;->apply(Landroid/content/ContentProvider;[Landroid/content/ContentProviderResult;I)Landroid/content/ContentProviderResult;

    move-result-object v4

    aput-object v4, v3, v1

    .line 262
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 265
    :cond_0
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 268
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    return-object v3

    .end local v1    # "i":I
    .end local v2    # "numOperations":I
    .end local v3    # "results":[Landroid/content/ContentProviderResult;
    :catchall_0
    move-exception v4

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v4
.end method

.method public bulkInsert(Landroid/net/Uri;[Landroid/content/ContentValues;)I
    .locals 5
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "values"    # [Landroid/content/ContentValues;

    .prologue
    .line 187
    invoke-virtual {p0, p1}, Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;->matchUri(Landroid/net/Uri;)I

    move-result v1

    .line 189
    .local v1, "match":I
    const/4 v2, -0x1

    if-ne v1, v2, :cond_0

    .line 190
    new-instance v2, Ljava/lang/UnsupportedOperationException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unknown uri: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 193
    :cond_0
    invoke-virtual {p0, v1}, Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;->createActions(I)Lcom/robotoworks/mechanoid/db/ContentProviderActions;

    move-result-object v2

    invoke-virtual {v2, p0, p1, p2}, Lcom/robotoworks/mechanoid/db/ContentProviderActions;->bulkInsert(Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;Landroid/net/Uri;[Landroid/content/ContentValues;)I

    move-result v0

    .line 195
    .local v0, "affected":I
    if-lez v0, :cond_1

    .line 196
    invoke-virtual {p0, p1}, Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;->tryNotifyChange(Landroid/net/Uri;)V

    .line 199
    :cond_1
    return v0
.end method

.method protected abstract createActions(I)Lcom/robotoworks/mechanoid/db/ContentProviderActions;
.end method

.method protected abstract createContentTypes()[Ljava/lang/String;
.end method

.method protected abstract createOpenHelper(Landroid/content/Context;)Lcom/robotoworks/mechanoid/db/MechanoidSQLiteOpenHelper;
.end method

.method protected abstract createUriMatcher()Landroid/content/UriMatcher;
.end method

.method public delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 5
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "selection"    # Ljava/lang/String;
    .param p3, "selectionArgs"    # [Ljava/lang/String;

    .prologue
    .line 151
    invoke-virtual {p0, p1}, Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;->matchUri(Landroid/net/Uri;)I

    move-result v1

    .line 153
    .local v1, "match":I
    const/4 v2, -0x1

    if-ne v1, v2, :cond_0

    .line 154
    new-instance v2, Ljava/lang/UnsupportedOperationException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unknown uri: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 157
    :cond_0
    invoke-virtual {p0, v1}, Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;->createActions(I)Lcom/robotoworks/mechanoid/db/ContentProviderActions;

    move-result-object v2

    invoke-virtual {v2, p0, p1, p2, p3}, Lcom/robotoworks/mechanoid/db/ContentProviderActions;->delete(Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v0

    .line 159
    .local v0, "affected":I
    if-lez v0, :cond_1

    .line 160
    invoke-virtual {p0, p1}, Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;->tryNotifyChange(Landroid/net/Uri;)V

    .line 163
    :cond_1
    return v0
.end method

.method public getOpenHelper()Lcom/robotoworks/mechanoid/db/MechanoidSQLiteOpenHelper;
    .locals 1

    .prologue
    .line 51
    iget-object v0, p0, Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;->mOpenHelper:Lcom/robotoworks/mechanoid/db/MechanoidSQLiteOpenHelper;

    return-object v0
.end method

.method protected abstract getRelatedUris(Landroid/net/Uri;)Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/net/Uri;",
            ")",
            "Ljava/util/Set",
            "<",
            "Landroid/net/Uri;",
            ">;"
        }
    .end annotation
.end method

.method public getType(Landroid/net/Uri;)Ljava/lang/String;
    .locals 4
    .param p1, "uri"    # Landroid/net/Uri;

    .prologue
    .line 140
    invoke-virtual {p0, p1}, Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;->matchUri(Landroid/net/Uri;)I

    move-result v0

    .line 142
    .local v0, "match":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 143
    new-instance v1, Ljava/lang/UnsupportedOperationException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unknown uri: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 146
    :cond_0
    iget-object v1, p0, Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;->mContentTypes:[Ljava/lang/String;

    aget-object v1, v1, v0

    return-object v1
.end method

.method public insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;
    .locals 5
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "values"    # Landroid/content/ContentValues;

    .prologue
    .line 169
    invoke-virtual {p0, p1}, Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;->matchUri(Landroid/net/Uri;)I

    move-result v0

    .line 171
    .local v0, "match":I
    const/4 v2, -0x1

    if-ne v0, v2, :cond_0

    .line 172
    new-instance v2, Ljava/lang/UnsupportedOperationException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unknown uri: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 175
    :cond_0
    invoke-virtual {p0, v0}, Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;->createActions(I)Lcom/robotoworks/mechanoid/db/ContentProviderActions;

    move-result-object v2

    invoke-virtual {v2, p0, p1, p2}, Lcom/robotoworks/mechanoid/db/ContentProviderActions;->insert(Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object v1

    .line 177
    .local v1, "newUri":Landroid/net/Uri;
    if-eqz v1, :cond_1

    .line 178
    invoke-virtual {p0, p1}, Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;->tryNotifyChange(Landroid/net/Uri;)V

    .line 181
    :cond_1
    return-object v1
.end method

.method protected matchUri(Landroid/net/Uri;)I
    .locals 1
    .param p1, "uri"    # Landroid/net/Uri;

    .prologue
    .line 55
    iget-object v0, p0, Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;->mUriMatcher:Landroid/content/UriMatcher;

    invoke-virtual {v0, p1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v0

    return v0
.end method

.method public onCreate()Z
    .locals 2

    .prologue
    .line 60
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 61
    .local v0, "context":Landroid/content/Context;
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;->createUriMatcher()Landroid/content/UriMatcher;

    move-result-object v1

    iput-object v1, p0, Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;->mUriMatcher:Landroid/content/UriMatcher;

    .line 62
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;->createContentTypes()[Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;->mContentTypes:[Ljava/lang/String;

    .line 63
    invoke-virtual {p0, v0}, Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;->createOpenHelper(Landroid/content/Context;)Lcom/robotoworks/mechanoid/db/MechanoidSQLiteOpenHelper;

    move-result-object v1

    iput-object v1, p0, Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;->mOpenHelper:Lcom/robotoworks/mechanoid/db/MechanoidSQLiteOpenHelper;

    .line 64
    const/4 v1, 0x1

    return v1
.end method

.method public query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    .locals 9
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "projection"    # [Ljava/lang/String;
    .param p3, "selection"    # Ljava/lang/String;
    .param p4, "selectionArgs"    # [Ljava/lang/String;
    .param p5, "sortOrder"    # Ljava/lang/String;

    .prologue
    .line 204
    invoke-virtual {p0, p1}, Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;->matchUri(Landroid/net/Uri;)I

    move-result v8

    .line 206
    .local v8, "match":I
    const/4 v0, -0x1

    if-ne v8, v0, :cond_0

    .line 207
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown uri: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 210
    :cond_0
    invoke-virtual {p0, v8}, Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;->createActions(I)Lcom/robotoworks/mechanoid/db/ContentProviderActions;

    move-result-object v0

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    invoke-virtual/range {v0 .. v6}, Lcom/robotoworks/mechanoid/db/ContentProviderActions;->query(Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 212
    .local v7, "cursor":Landroid/database/Cursor;
    invoke-virtual {p0, v7, p1}, Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;->trySetNotificationUri(Landroid/database/Cursor;Landroid/net/Uri;)V

    .line 214
    return-object v7
.end method

.method public selectRecordMap(Landroid/net/Uri;Lcom/robotoworks/mechanoid/db/SQuery;Ljava/lang/String;)Ljava/util/Map;
    .locals 4
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "sQuery"    # Lcom/robotoworks/mechanoid/db/SQuery;
    .param p3, "keyColumnName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/robotoworks/mechanoid/db/ActiveRecord;",
            ">(",
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
    .line 245
    invoke-virtual {p0, p1}, Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;->matchUri(Landroid/net/Uri;)I

    move-result v0

    .line 247
    .local v0, "match":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 248
    new-instance v1, Ljava/lang/UnsupportedOperationException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unknown uri: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 251
    :cond_0
    invoke-virtual {p0, v0}, Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;->createActions(I)Lcom/robotoworks/mechanoid/db/ContentProviderActions;

    move-result-object v1

    invoke-virtual {v1, p0, p1, p2, p3}, Lcom/robotoworks/mechanoid/db/ContentProviderActions;->selectRecordMap(Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;Landroid/net/Uri;Lcom/robotoworks/mechanoid/db/SQuery;Ljava/lang/String;)Ljava/util/Map;

    move-result-object v1

    return-object v1
.end method

.method public selectRecords(Landroid/net/Uri;Lcom/robotoworks/mechanoid/db/SQuery;Ljava/lang/String;)Ljava/util/List;
    .locals 4
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "sQuery"    # Lcom/robotoworks/mechanoid/db/SQuery;
    .param p3, "sortOrder"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/robotoworks/mechanoid/db/ActiveRecord;",
            ">(",
            "Landroid/net/Uri;",
            "Lcom/robotoworks/mechanoid/db/SQuery;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 235
    invoke-virtual {p0, p1}, Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;->matchUri(Landroid/net/Uri;)I

    move-result v0

    .line 237
    .local v0, "match":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 238
    new-instance v1, Ljava/lang/UnsupportedOperationException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unknown uri: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 241
    :cond_0
    invoke-virtual {p0, v0}, Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;->createActions(I)Lcom/robotoworks/mechanoid/db/ContentProviderActions;

    move-result-object v1

    invoke-virtual {v1, p0, p1, p2, p3}, Lcom/robotoworks/mechanoid/db/ContentProviderActions;->selectRecords(Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;Landroid/net/Uri;Lcom/robotoworks/mechanoid/db/SQuery;Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    return-object v1
.end method

.method protected tryNotifyChange(Landroid/net/Uri;)V
    .locals 10
    .param p1, "uri"    # Landroid/net/Uri;

    .prologue
    const/4 v9, 0x0

    .line 84
    const/4 v2, 0x1

    .line 86
    .local v2, "notify":Z
    const-string v6, "mechdb_notify"

    invoke-virtual {p1, v6}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 88
    .local v3, "paramNotify":Ljava/lang/String;
    if-eqz v3, :cond_0

    .line 89
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    .line 92
    :cond_0
    if-eqz v2, :cond_1

    .line 93
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v6

    invoke-virtual {v6, p1, v9}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    .line 95
    invoke-virtual {p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    if-lez v6, :cond_1

    .line 96
    new-instance v6, Landroid/net/Uri$Builder;

    invoke-direct {v6}, Landroid/net/Uri$Builder;-><init>()V

    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v6

    invoke-virtual {p1}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/net/Uri$Builder;->authority(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v7

    invoke-virtual {p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v6

    const/4 v8, 0x0

    invoke-interface {v6, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v7, v6}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v6

    invoke-virtual {v6}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v1

    .line 102
    .local v1, "key":Landroid/net/Uri;
    invoke-virtual {p0, v1}, Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;->getRelatedUris(Landroid/net/Uri;)Ljava/util/Set;

    move-result-object v5

    .line 104
    .local v5, "relatedUris":Ljava/util/Set;, "Ljava/util/Set<Landroid/net/Uri;>;"
    if-eqz v5, :cond_1

    .line 105
    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/net/Uri;

    .line 106
    .local v4, "relatedUri":Landroid/net/Uri;
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v6

    invoke-virtual {v6, v4, v9}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    goto :goto_0

    .line 111
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "key":Landroid/net/Uri;
    .end local v4    # "relatedUri":Landroid/net/Uri;
    .end local v5    # "relatedUris":Ljava/util/Set;, "Ljava/util/Set<Landroid/net/Uri;>;"
    :cond_1
    return-void
.end method

.method protected trySetNotificationUri(Landroid/database/Cursor;Landroid/net/Uri;)V
    .locals 3
    .param p1, "cursor"    # Landroid/database/Cursor;
    .param p2, "uri"    # Landroid/net/Uri;

    .prologue
    .line 121
    if-nez p1, :cond_1

    .line 136
    :cond_0
    :goto_0
    return-void

    .line 125
    :cond_1
    const/4 v0, 0x1

    .line 127
    .local v0, "notify":Z
    const-string v2, "mechdb_notify"

    invoke-virtual {p2, v2}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 129
    .local v1, "paramNotify":Ljava/lang/String;
    if-eqz v1, :cond_2

    .line 130
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    .line 133
    :cond_2
    if-eqz v0, :cond_0

    .line 134
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    invoke-interface {p1, v2, p2}, Landroid/database/Cursor;->setNotificationUri(Landroid/content/ContentResolver;Landroid/net/Uri;)V

    goto :goto_0
.end method

.method public update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 8
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "values"    # Landroid/content/ContentValues;
    .param p3, "selection"    # Ljava/lang/String;
    .param p4, "selectionArgs"    # [Ljava/lang/String;

    .prologue
    .line 219
    invoke-virtual {p0, p1}, Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;->matchUri(Landroid/net/Uri;)I

    move-result v7

    .line 221
    .local v7, "match":I
    const/4 v0, -0x1

    if-ne v7, v0, :cond_0

    .line 222
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown uri: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 225
    :cond_0
    invoke-virtual {p0, v7}, Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;->createActions(I)Lcom/robotoworks/mechanoid/db/ContentProviderActions;

    move-result-object v0

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-virtual/range {v0 .. v5}, Lcom/robotoworks/mechanoid/db/ContentProviderActions;->update(Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v6

    .line 227
    .local v6, "affected":I
    if-lez v6, :cond_1

    .line 228
    invoke-virtual {p0, p1}, Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;->tryNotifyChange(Landroid/net/Uri;)V

    .line 231
    :cond_1
    return v6
.end method
