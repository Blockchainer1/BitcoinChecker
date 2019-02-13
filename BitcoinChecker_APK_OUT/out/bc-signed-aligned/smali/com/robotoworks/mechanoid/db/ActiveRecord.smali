.class public abstract Lcom/robotoworks/mechanoid/db/ActiveRecord;
.super Ljava/lang/Object;
.source "ActiveRecord.java"


# instance fields
.field protected final mContentUri:Landroid/net/Uri;

.field private mId:J


# direct methods
.method protected constructor <init>(Landroid/net/Uri;)V
    .locals 0
    .param p1, "contentUri"    # Landroid/net/Uri;

    .prologue
    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    iput-object p1, p0, Lcom/robotoworks/mechanoid/db/ActiveRecord;->mContentUri:Landroid/net/Uri;

    .line 49
    return-void
.end method


# virtual methods
.method protected abstract _getProjection()[Ljava/lang/String;
.end method

.method protected abstract createBuilder()Lcom/robotoworks/mechanoid/db/AbstractValuesBuilder;
.end method

.method public delete()Z
    .locals 1

    .prologue
    .line 91
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/robotoworks/mechanoid/db/ActiveRecord;->delete(Z)Z

    move-result v0

    return v0
.end method

.method public delete(Z)Z
    .locals 9
    .param p1, "notifyChange"    # Z

    .prologue
    const/4 v8, 0x0

    const/4 v3, 0x0

    .line 95
    invoke-static {}, Lcom/robotoworks/mechanoid/Mechanoid;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 97
    .local v0, "resolver":Landroid/content/ContentResolver;
    iget-object v4, p0, Lcom/robotoworks/mechanoid/db/ActiveRecord;->mContentUri:Landroid/net/Uri;

    invoke-virtual {v4}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v4

    iget-wide v6, p0, Lcom/robotoworks/mechanoid/db/ActiveRecord;->mId:J

    invoke-static {v6, v7}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v4

    const-string v5, "mechdb_notify"

    invoke-static {p1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v4

    invoke-virtual {v4}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v2

    .line 103
    .local v2, "uri":Landroid/net/Uri;
    invoke-virtual {v0, v2, v8, v8}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v4

    if-lez v4, :cond_0

    const/4 v1, 0x1

    .line 105
    .local v1, "result":Z
    :goto_0
    invoke-virtual {p0, v3}, Lcom/robotoworks/mechanoid/db/ActiveRecord;->makeDirty(Z)V

    .line 107
    return v1

    .end local v1    # "result":Z
    :cond_0
    move v1, v3

    .line 103
    goto :goto_0
.end method

.method public getId()J
    .locals 2

    .prologue
    .line 37
    iget-wide v0, p0, Lcom/robotoworks/mechanoid/db/ActiveRecord;->mId:J

    return-wide v0
.end method

.method public insert()J
    .locals 2

    .prologue
    .line 116
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/robotoworks/mechanoid/db/ActiveRecord;->insert(Z)J

    move-result-wide v0

    return-wide v0
.end method

.method public insert(Z)J
    .locals 4
    .param p1, "notifyChange"    # Z

    .prologue
    .line 126
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/db/ActiveRecord;->createBuilder()Lcom/robotoworks/mechanoid/db/AbstractValuesBuilder;

    move-result-object v0

    .line 128
    .local v0, "builder":Lcom/robotoworks/mechanoid/db/AbstractValuesBuilder;
    invoke-virtual {v0, p1}, Lcom/robotoworks/mechanoid/db/AbstractValuesBuilder;->insert(Z)Landroid/net/Uri;

    move-result-object v1

    .line 129
    .local v1, "uri":Landroid/net/Uri;
    invoke-static {v1}, Landroid/content/ContentUris;->parseId(Landroid/net/Uri;)J

    move-result-wide v2

    iput-wide v2, p0, Lcom/robotoworks/mechanoid/db/ActiveRecord;->mId:J

    .line 131
    const/4 v2, 0x0

    invoke-virtual {p0, v2}, Lcom/robotoworks/mechanoid/db/ActiveRecord;->makeDirty(Z)V

    .line 133
    iget-wide v2, p0, Lcom/robotoworks/mechanoid/db/ActiveRecord;->mId:J

    return-wide v2
.end method

.method public abstract makeDirty(Z)V
.end method

.method public reload()V
    .locals 7

    .prologue
    .line 162
    iget-wide v2, p0, Lcom/robotoworks/mechanoid/db/ActiveRecord;->mId:J

    const-wide/16 v4, 0x0

    cmp-long v1, v2, v4

    if-nez v1, :cond_0

    .line 181
    :goto_0
    return-void

    .line 166
    :cond_0
    const/4 v6, 0x0

    .line 168
    .local v6, "c":Landroid/database/Cursor;
    invoke-static {}, Lcom/robotoworks/mechanoid/Mechanoid;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 171
    .local v0, "resolver":Landroid/content/ContentResolver;
    :try_start_0
    iget-object v1, p0, Lcom/robotoworks/mechanoid/db/ActiveRecord;->mContentUri:Landroid/net/Uri;

    invoke-virtual {v1}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v1

    iget-wide v2, p0, Lcom/robotoworks/mechanoid/db/ActiveRecord;->mId:J

    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/db/ActiveRecord;->_getProjection()[Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 174
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 175
    invoke-virtual {p0, v6}, Lcom/robotoworks/mechanoid/db/ActiveRecord;->setPropertiesFromCursor(Landroid/database/Cursor;)V

    .line 176
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lcom/robotoworks/mechanoid/db/ActiveRecord;->makeDirty(Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 179
    :cond_1
    invoke-static {v6}, Lcom/robotoworks/mechanoid/util/Closeables;->closeSilently(Landroid/database/Cursor;)V

    goto :goto_0

    :catchall_0
    move-exception v1

    invoke-static {v6}, Lcom/robotoworks/mechanoid/util/Closeables;->closeSilently(Landroid/database/Cursor;)V

    throw v1
.end method

.method public save()J
    .locals 2

    .prologue
    .line 74
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/robotoworks/mechanoid/db/ActiveRecord;->save(Z)J

    move-result-wide v0

    return-wide v0
.end method

.method public save(Z)J
    .locals 4
    .param p1, "notifyChange"    # Z

    .prologue
    .line 85
    iget-wide v0, p0, Lcom/robotoworks/mechanoid/db/ActiveRecord;->mId:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    invoke-virtual {p0, p1}, Lcom/robotoworks/mechanoid/db/ActiveRecord;->update(Z)J

    move-result-wide v0

    :goto_0
    iput-wide v0, p0, Lcom/robotoworks/mechanoid/db/ActiveRecord;->mId:J

    .line 87
    iget-wide v0, p0, Lcom/robotoworks/mechanoid/db/ActiveRecord;->mId:J

    return-wide v0

    .line 85
    :cond_0
    invoke-virtual {p0, p1}, Lcom/robotoworks/mechanoid/db/ActiveRecord;->insert(Z)J

    move-result-wide v0

    goto :goto_0
.end method

.method public setId(J)V
    .locals 3
    .param p1, "id"    # J

    .prologue
    .line 41
    iget-wide v0, p0, Lcom/robotoworks/mechanoid/db/ActiveRecord;->mId:J

    cmp-long v0, v0, p1

    if-eqz v0, :cond_0

    .line 42
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/robotoworks/mechanoid/db/ActiveRecord;->makeDirty(Z)V

    .line 44
    :cond_0
    iput-wide p1, p0, Lcom/robotoworks/mechanoid/db/ActiveRecord;->mId:J

    .line 45
    return-void
.end method

.method protected abstract setPropertiesFromCursor(Landroid/database/Cursor;)V
.end method

.method public update()J
    .locals 2

    .prologue
    .line 142
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/robotoworks/mechanoid/db/ActiveRecord;->update(Z)J

    move-result-wide v0

    return-wide v0
.end method

.method public update(Z)J
    .locals 4
    .param p1, "notifyChange"    # Z

    .prologue
    .line 152
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/db/ActiveRecord;->createBuilder()Lcom/robotoworks/mechanoid/db/AbstractValuesBuilder;

    move-result-object v0

    .line 154
    .local v0, "builder":Lcom/robotoworks/mechanoid/db/AbstractValuesBuilder;
    iget-wide v2, p0, Lcom/robotoworks/mechanoid/db/ActiveRecord;->mId:J

    invoke-virtual {v0, v2, v3, p1}, Lcom/robotoworks/mechanoid/db/AbstractValuesBuilder;->update(JZ)I

    .line 156
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lcom/robotoworks/mechanoid/db/ActiveRecord;->makeDirty(Z)V

    .line 158
    iget-wide v2, p0, Lcom/robotoworks/mechanoid/db/ActiveRecord;->mId:J

    return-wide v2
.end method
