.class public Lcom/robotoworks/mechanoid/db/DefaultContentProviderActions;
.super Lcom/robotoworks/mechanoid/db/ContentProviderActions;
.source "DefaultContentProviderActions.java"


# instance fields
.field private mForUrisWithId:Z

.field private mRecordFactory:Lcom/robotoworks/mechanoid/db/ActiveRecordFactory;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/robotoworks/mechanoid/db/ActiveRecordFactory",
            "<*>;"
        }
    .end annotation
.end field

.field private mSource:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Z)V
    .locals 1
    .param p1, "source"    # Ljava/lang/String;
    .param p2, "forUrisWithId"    # Z

    .prologue
    .line 59
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/robotoworks/mechanoid/db/DefaultContentProviderActions;-><init>(Ljava/lang/String;ZLcom/robotoworks/mechanoid/db/ActiveRecordFactory;)V

    .line 60
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ZLcom/robotoworks/mechanoid/db/ActiveRecordFactory;)V
    .locals 0
    .param p1, "source"    # Ljava/lang/String;
    .param p2, "forUrisWithId"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/robotoworks/mechanoid/db/ActiveRecord;",
            ">(",
            "Ljava/lang/String;",
            "Z",
            "Lcom/robotoworks/mechanoid/db/ActiveRecordFactory",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 70
    .local p3, "recordFactory":Lcom/robotoworks/mechanoid/db/ActiveRecordFactory;, "Lcom/robotoworks/mechanoid/db/ActiveRecordFactory<TT;>;"
    invoke-direct {p0}, Lcom/robotoworks/mechanoid/db/ContentProviderActions;-><init>()V

    .line 71
    iput-object p1, p0, Lcom/robotoworks/mechanoid/db/DefaultContentProviderActions;->mSource:Ljava/lang/String;

    .line 72
    iput-boolean p2, p0, Lcom/robotoworks/mechanoid/db/DefaultContentProviderActions;->mForUrisWithId:Z

    .line 73
    iput-object p3, p0, Lcom/robotoworks/mechanoid/db/DefaultContentProviderActions;->mRecordFactory:Lcom/robotoworks/mechanoid/db/ActiveRecordFactory;

    .line 74
    return-void
.end method


# virtual methods
.method public bulkInsert(Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;Landroid/net/Uri;[Landroid/content/ContentValues;)I
    .locals 6
    .param p1, "provider"    # Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;
    .param p2, "uri"    # Landroid/net/Uri;
    .param p3, "values"    # [Landroid/content/ContentValues;

    .prologue
    .line 151
    invoke-virtual {p1}, Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;->getOpenHelper()Lcom/robotoworks/mechanoid/db/MechanoidSQLiteOpenHelper;

    move-result-object v3

    invoke-virtual {v3}, Lcom/robotoworks/mechanoid/db/MechanoidSQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 153
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    array-length v2, p3

    .line 157
    .local v2, "numValues":I
    :try_start_0
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 159
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v2, :cond_0

    .line 160
    iget-object v3, p0, Lcom/robotoworks/mechanoid/db/DefaultContentProviderActions;->mSource:Ljava/lang/String;

    const/4 v4, 0x0

    aget-object v5, p3, v1

    invoke-virtual {v0, v3, v4, v5}, Landroid/database/sqlite/SQLiteDatabase;->insertOrThrow(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    .line 159
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 163
    :cond_0
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 167
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 170
    return v2

    .line 167
    .end local v1    # "i":I
    :catchall_0
    move-exception v3

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v3
.end method

.method public delete(Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 7
    .param p1, "provider"    # Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;
    .param p2, "uri"    # Landroid/net/Uri;
    .param p3, "selection"    # Ljava/lang/String;
    .param p4, "selectionArgs"    # [Ljava/lang/String;

    .prologue
    .line 78
    invoke-virtual {p1}, Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;->getOpenHelper()Lcom/robotoworks/mechanoid/db/MechanoidSQLiteOpenHelper;

    move-result-object v4

    invoke-virtual {v4}, Lcom/robotoworks/mechanoid/db/MechanoidSQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 80
    .local v1, "db":Landroid/database/sqlite/SQLiteDatabase;
    iget-boolean v4, p0, Lcom/robotoworks/mechanoid/db/DefaultContentProviderActions;->mForUrisWithId:Z

    if-eqz v4, :cond_0

    .line 81
    invoke-static {p2}, Landroid/content/ContentUris;->parseId(Landroid/net/Uri;)J

    move-result-wide v2

    .line 83
    .local v2, "id":J
    invoke-static {}, Lcom/robotoworks/mechanoid/db/SQuery;->newQuery()Lcom/robotoworks/mechanoid/db/SQuery;

    move-result-object v4

    const-string v5, "_id"

    const-string v6, " = "

    invoke-virtual {v4, v5, v6, v2, v3}, Lcom/robotoworks/mechanoid/db/SQuery;->expr(Ljava/lang/String;Ljava/lang/String;J)Lcom/robotoworks/mechanoid/db/SQuery;

    move-result-object v4

    invoke-virtual {v4, p3, p4}, Lcom/robotoworks/mechanoid/db/SQuery;->append(Ljava/lang/String;[Ljava/lang/String;)Lcom/robotoworks/mechanoid/db/SQuery;

    move-result-object v4

    iget-object v5, p0, Lcom/robotoworks/mechanoid/db/DefaultContentProviderActions;->mSource:Ljava/lang/String;

    invoke-virtual {v4, v1, v5}, Lcom/robotoworks/mechanoid/db/SQuery;->delete(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)I

    move-result v0

    .line 91
    .end local v2    # "id":J
    :goto_0
    return v0

    :cond_0
    iget-object v4, p0, Lcom/robotoworks/mechanoid/db/DefaultContentProviderActions;->mSource:Ljava/lang/String;

    invoke-virtual {v1, v4, p3, p4}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v0

    goto :goto_0
.end method

.method public insert(Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;
    .locals 6
    .param p1, "provider"    # Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;
    .param p2, "uri"    # Landroid/net/Uri;
    .param p3, "values"    # Landroid/content/ContentValues;

    .prologue
    const/4 v1, 0x0

    .line 97
    iget-boolean v4, p0, Lcom/robotoworks/mechanoid/db/DefaultContentProviderActions;->mForUrisWithId:Z

    if-eqz v4, :cond_1

    .line 109
    :cond_0
    :goto_0
    return-object v1

    .line 101
    :cond_1
    invoke-virtual {p1}, Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;->getOpenHelper()Lcom/robotoworks/mechanoid/db/MechanoidSQLiteOpenHelper;

    move-result-object v4

    invoke-virtual {v4}, Lcom/robotoworks/mechanoid/db/MechanoidSQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 103
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    iget-object v4, p0, Lcom/robotoworks/mechanoid/db/DefaultContentProviderActions;->mSource:Ljava/lang/String;

    invoke-virtual {v0, v4, v1, p3}, Landroid/database/sqlite/SQLiteDatabase;->insertOrThrow(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v2

    .line 105
    .local v2, "id":J
    const-wide/16 v4, -0x1

    cmp-long v4, v2, v4

    if-lez v4, :cond_0

    .line 106
    invoke-static {p2, v2, v3}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v1

    goto :goto_0
.end method

.method public query(Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    .locals 14
    .param p1, "provider"    # Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;
    .param p2, "uri"    # Landroid/net/Uri;
    .param p3, "projection"    # [Ljava/lang/String;
    .param p4, "selection"    # Ljava/lang/String;
    .param p5, "selectionArgs"    # [Ljava/lang/String;
    .param p6, "sortOrder"    # Ljava/lang/String;

    .prologue
    .line 133
    invoke-virtual {p1}, Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;->getOpenHelper()Lcom/robotoworks/mechanoid/db/MechanoidSQLiteOpenHelper;

    move-result-object v2

    invoke-virtual {v2}, Lcom/robotoworks/mechanoid/db/MechanoidSQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v3

    .line 134
    .local v3, "db":Landroid/database/sqlite/SQLiteDatabase;
    const-string v2, "mechdb_group_by"

    move-object/from16 v0, p2

    invoke-virtual {v0, v2}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 136
    .local v11, "groupBy":Ljava/lang/String;
    iget-boolean v2, p0, Lcom/robotoworks/mechanoid/db/DefaultContentProviderActions;->mForUrisWithId:Z

    if-eqz v2, :cond_1

    .line 137
    invoke-static/range {p2 .. p2}, Landroid/content/ContentUris;->parseId(Landroid/net/Uri;)J

    move-result-wide v12

    .line 139
    .local v12, "id":J
    invoke-static {}, Lcom/robotoworks/mechanoid/db/SQuery;->newQuery()Lcom/robotoworks/mechanoid/db/SQuery;

    move-result-object v2

    const-string v4, "_id"

    const-string v5, " = "

    invoke-virtual {v2, v4, v5, v12, v13}, Lcom/robotoworks/mechanoid/db/SQuery;->expr(Ljava/lang/String;Ljava/lang/String;J)Lcom/robotoworks/mechanoid/db/SQuery;

    move-result-object v2

    move-object/from16 v0, p4

    move-object/from16 v1, p5

    invoke-virtual {v2, v0, v1}, Lcom/robotoworks/mechanoid/db/SQuery;->append(Ljava/lang/String;[Ljava/lang/String;)Lcom/robotoworks/mechanoid/db/SQuery;

    move-result-object v2

    iget-object v4, p0, Lcom/robotoworks/mechanoid/db/DefaultContentProviderActions;->mSource:Ljava/lang/String;

    invoke-static {v11}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_0

    const/4 v7, 0x0

    :goto_0
    move-object/from16 v5, p3

    move-object/from16 v6, p6

    invoke-virtual/range {v2 .. v7}, Lcom/robotoworks/mechanoid/db/SQuery;->query(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2

    .line 144
    .end local v12    # "id":J
    :goto_1
    return-object v2

    .restart local v12    # "id":J
    :cond_0
    move-object v7, v11

    .line 139
    goto :goto_0

    .line 144
    .end local v12    # "id":J
    :cond_1
    iget-object v4, p0, Lcom/robotoworks/mechanoid/db/DefaultContentProviderActions;->mSource:Ljava/lang/String;

    invoke-static {v11}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_2

    const/4 v8, 0x0

    :goto_2
    const/4 v9, 0x0

    move-object/from16 v5, p3

    move-object/from16 v6, p4

    move-object/from16 v7, p5

    move-object/from16 v10, p6

    invoke-virtual/range {v3 .. v10}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2

    goto :goto_1

    :cond_2
    move-object v8, v11

    goto :goto_2
.end method

.method public selectRecordMap(Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;Landroid/net/Uri;Lcom/robotoworks/mechanoid/db/SQuery;Ljava/lang/String;)Ljava/util/Map;
    .locals 13
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
    .line 205
    iget-object v2, p0, Lcom/robotoworks/mechanoid/db/DefaultContentProviderActions;->mRecordFactory:Lcom/robotoworks/mechanoid/db/ActiveRecordFactory;

    if-nez v2, :cond_0

    .line 206
    const/4 v11, 0x0

    .line 226
    :goto_0
    return-object v11

    .line 208
    :cond_0
    const-string v2, "mechdb_group_by"

    invoke-virtual {p2, v2}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 209
    .local v10, "groupBy":Ljava/lang/String;
    invoke-virtual {p1}, Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;->getOpenHelper()Lcom/robotoworks/mechanoid/db/MechanoidSQLiteOpenHelper;

    move-result-object v2

    invoke-virtual {v2}, Lcom/robotoworks/mechanoid/db/MechanoidSQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 211
    .local v1, "db":Landroid/database/sqlite/SQLiteDatabase;
    const/4 v9, 0x0

    .line 213
    .local v9, "c":Landroid/database/Cursor;
    new-instance v11, Ljava/util/HashMap;

    invoke-direct {v11}, Ljava/util/HashMap;-><init>()V

    .line 216
    .local v11, "items":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;TT;>;"
    :try_start_0
    iget-object v2, p0, Lcom/robotoworks/mechanoid/db/DefaultContentProviderActions;->mSource:Ljava/lang/String;

    iget-object v3, p0, Lcom/robotoworks/mechanoid/db/DefaultContentProviderActions;->mRecordFactory:Lcom/robotoworks/mechanoid/db/ActiveRecordFactory;

    invoke-virtual {v3}, Lcom/robotoworks/mechanoid/db/ActiveRecordFactory;->getProjection()[Ljava/lang/String;

    move-result-object v3

    invoke-virtual/range {p3 .. p3}, Lcom/robotoworks/mechanoid/db/SQuery;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual/range {p3 .. p3}, Lcom/robotoworks/mechanoid/db/SQuery;->getArgsArray()[Ljava/lang/String;

    move-result-object v5

    invoke-static {v10}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_1

    const/4 v6, 0x0

    :goto_1
    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-virtual/range {v1 .. v8}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v9

    .line 217
    move-object/from16 v0, p4

    invoke-interface {v9, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v12

    .line 219
    .local v12, "keyColumnIndex":I
    :goto_2
    invoke-interface {v9}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 220
    invoke-interface {v9, v12}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/robotoworks/mechanoid/db/DefaultContentProviderActions;->mRecordFactory:Lcom/robotoworks/mechanoid/db/ActiveRecordFactory;

    invoke-virtual {v3, v9}, Lcom/robotoworks/mechanoid/db/ActiveRecordFactory;->create(Landroid/database/Cursor;)Lcom/robotoworks/mechanoid/db/ActiveRecord;

    move-result-object v3

    invoke-virtual {v11, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_2

    .line 223
    .end local v12    # "keyColumnIndex":I
    :catchall_0
    move-exception v2

    invoke-static {v9}, Lcom/robotoworks/mechanoid/util/Closeables;->closeSilently(Landroid/database/Cursor;)V

    throw v2

    :cond_1
    move-object v6, v10

    .line 216
    goto :goto_1

    .line 223
    .restart local v12    # "keyColumnIndex":I
    :cond_2
    invoke-static {v9}, Lcom/robotoworks/mechanoid/util/Closeables;->closeSilently(Landroid/database/Cursor;)V

    goto :goto_0
.end method

.method public selectRecords(Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;Landroid/net/Uri;Lcom/robotoworks/mechanoid/db/SQuery;Ljava/lang/String;)Ljava/util/List;
    .locals 11
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
    const/4 v5, 0x0

    .line 176
    iget-object v1, p0, Lcom/robotoworks/mechanoid/db/DefaultContentProviderActions;->mRecordFactory:Lcom/robotoworks/mechanoid/db/ActiveRecordFactory;

    if-nez v1, :cond_0

    move-object v10, v5

    .line 197
    :goto_0
    return-object v10

    .line 180
    :cond_0
    const-string v1, "mechdb_group_by"

    invoke-virtual {p2, v1}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 181
    .local v9, "groupBy":Ljava/lang/String;
    invoke-virtual {p1}, Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;->getOpenHelper()Lcom/robotoworks/mechanoid/db/MechanoidSQLiteOpenHelper;

    move-result-object v1

    invoke-virtual {v1}, Lcom/robotoworks/mechanoid/db/MechanoidSQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 183
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    const/4 v8, 0x0

    .line 185
    .local v8, "c":Landroid/database/Cursor;
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 188
    .local v10, "items":Ljava/util/ArrayList;, "Ljava/util/ArrayList<TT;>;"
    :try_start_0
    iget-object v1, p0, Lcom/robotoworks/mechanoid/db/DefaultContentProviderActions;->mSource:Ljava/lang/String;

    iget-object v2, p0, Lcom/robotoworks/mechanoid/db/DefaultContentProviderActions;->mRecordFactory:Lcom/robotoworks/mechanoid/db/ActiveRecordFactory;

    invoke-virtual {v2}, Lcom/robotoworks/mechanoid/db/ActiveRecordFactory;->getProjection()[Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p3}, Lcom/robotoworks/mechanoid/db/SQuery;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p3}, Lcom/robotoworks/mechanoid/db/SQuery;->getArgsArray()[Ljava/lang/String;

    move-result-object v4

    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_1

    :goto_1
    const/4 v6, 0x0

    move-object v7, p4

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 190
    :goto_2
    invoke-interface {v8}, Landroid/database/Cursor;->moveToNext()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 191
    iget-object v1, p0, Lcom/robotoworks/mechanoid/db/DefaultContentProviderActions;->mRecordFactory:Lcom/robotoworks/mechanoid/db/ActiveRecordFactory;

    invoke-virtual {v1, v8}, Lcom/robotoworks/mechanoid/db/ActiveRecordFactory;->create(Landroid/database/Cursor;)Lcom/robotoworks/mechanoid/db/ActiveRecord;

    move-result-object v1

    invoke-virtual {v10, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_2

    .line 194
    :catchall_0
    move-exception v1

    invoke-static {v8}, Lcom/robotoworks/mechanoid/util/Closeables;->closeSilently(Landroid/database/Cursor;)V

    throw v1

    :cond_1
    move-object v5, v9

    .line 188
    goto :goto_1

    .line 194
    :cond_2
    invoke-static {v8}, Lcom/robotoworks/mechanoid/util/Closeables;->closeSilently(Landroid/database/Cursor;)V

    goto :goto_0
.end method

.method public update(Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 7
    .param p1, "provider"    # Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;
    .param p2, "uri"    # Landroid/net/Uri;
    .param p3, "values"    # Landroid/content/ContentValues;
    .param p4, "selection"    # Ljava/lang/String;
    .param p5, "selectionArgs"    # [Ljava/lang/String;

    .prologue
    .line 114
    invoke-virtual {p1}, Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;->getOpenHelper()Lcom/robotoworks/mechanoid/db/MechanoidSQLiteOpenHelper;

    move-result-object v4

    invoke-virtual {v4}, Lcom/robotoworks/mechanoid/db/MechanoidSQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 116
    .local v1, "db":Landroid/database/sqlite/SQLiteDatabase;
    iget-boolean v4, p0, Lcom/robotoworks/mechanoid/db/DefaultContentProviderActions;->mForUrisWithId:Z

    if-eqz v4, :cond_0

    .line 117
    invoke-static {p2}, Landroid/content/ContentUris;->parseId(Landroid/net/Uri;)J

    move-result-wide v2

    .line 119
    .local v2, "id":J
    invoke-static {}, Lcom/robotoworks/mechanoid/db/SQuery;->newQuery()Lcom/robotoworks/mechanoid/db/SQuery;

    move-result-object v4

    const-string v5, "_id"

    const-string v6, " = "

    invoke-virtual {v4, v5, v6, v2, v3}, Lcom/robotoworks/mechanoid/db/SQuery;->expr(Ljava/lang/String;Ljava/lang/String;J)Lcom/robotoworks/mechanoid/db/SQuery;

    move-result-object v4

    invoke-virtual {v4, p4, p5}, Lcom/robotoworks/mechanoid/db/SQuery;->append(Ljava/lang/String;[Ljava/lang/String;)Lcom/robotoworks/mechanoid/db/SQuery;

    move-result-object v4

    iget-object v5, p0, Lcom/robotoworks/mechanoid/db/DefaultContentProviderActions;->mSource:Ljava/lang/String;

    invoke-virtual {v4, v1, v5, p3}, Lcom/robotoworks/mechanoid/db/SQuery;->update(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Landroid/content/ContentValues;)I

    move-result v0

    .line 127
    .end local v2    # "id":J
    :goto_0
    return v0

    :cond_0
    iget-object v4, p0, Lcom/robotoworks/mechanoid/db/DefaultContentProviderActions;->mSource:Ljava/lang/String;

    invoke-virtual {v1, v4, p3, p4, p5}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v0

    goto :goto_0
.end method
