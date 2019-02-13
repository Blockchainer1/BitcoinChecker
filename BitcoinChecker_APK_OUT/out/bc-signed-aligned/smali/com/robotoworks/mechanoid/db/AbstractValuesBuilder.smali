.class public abstract Lcom/robotoworks/mechanoid/db/AbstractValuesBuilder;
.super Ljava/lang/Object;
.source "AbstractValuesBuilder.java"


# instance fields
.field private mContentResolver:Landroid/content/ContentResolver;

.field private mContentUri:Landroid/net/Uri;

.field protected mValues:Landroid/content/ContentValues;


# direct methods
.method protected constructor <init>(Landroid/content/Context;Landroid/net/Uri;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "contentUri"    # Landroid/net/Uri;

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    iput-object v0, p0, Lcom/robotoworks/mechanoid/db/AbstractValuesBuilder;->mValues:Landroid/content/ContentValues;

    .line 37
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iput-object v0, p0, Lcom/robotoworks/mechanoid/db/AbstractValuesBuilder;->mContentResolver:Landroid/content/ContentResolver;

    .line 38
    iput-object p2, p0, Lcom/robotoworks/mechanoid/db/AbstractValuesBuilder;->mContentUri:Landroid/net/Uri;

    .line 40
    return-void
.end method


# virtual methods
.method public getValues()Landroid/content/ContentValues;
    .locals 1

    .prologue
    .line 106
    iget-object v0, p0, Lcom/robotoworks/mechanoid/db/AbstractValuesBuilder;->mValues:Landroid/content/ContentValues;

    return-object v0
.end method

.method public insert()Landroid/net/Uri;
    .locals 3

    .prologue
    .line 46
    iget-object v0, p0, Lcom/robotoworks/mechanoid/db/AbstractValuesBuilder;->mContentResolver:Landroid/content/ContentResolver;

    iget-object v1, p0, Lcom/robotoworks/mechanoid/db/AbstractValuesBuilder;->mContentUri:Landroid/net/Uri;

    iget-object v2, p0, Lcom/robotoworks/mechanoid/db/AbstractValuesBuilder;->mValues:Landroid/content/ContentValues;

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object v0

    return-object v0
.end method

.method public insert(Z)Landroid/net/Uri;
    .locals 4
    .param p1, "notifyChange"    # Z

    .prologue
    .line 54
    iget-object v1, p0, Lcom/robotoworks/mechanoid/db/AbstractValuesBuilder;->mContentUri:Landroid/net/Uri;

    invoke-virtual {v1}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v1

    const-string v2, "mechdb_notify"

    invoke-static {p1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v0

    .line 59
    .local v0, "uri":Landroid/net/Uri;
    iget-object v1, p0, Lcom/robotoworks/mechanoid/db/AbstractValuesBuilder;->mContentResolver:Landroid/content/ContentResolver;

    iget-object v2, p0, Lcom/robotoworks/mechanoid/db/AbstractValuesBuilder;->mValues:Landroid/content/ContentValues;

    invoke-virtual {v1, v0, v2}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object v1

    return-object v1
.end method

.method public toAssertQueryOperationBuilder()Landroid/content/ContentProviderOperation$Builder;
    .locals 2

    .prologue
    .line 151
    iget-object v0, p0, Lcom/robotoworks/mechanoid/db/AbstractValuesBuilder;->mContentUri:Landroid/net/Uri;

    invoke-static {v0}, Landroid/content/ContentProviderOperation;->newAssertQuery(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v0

    iget-object v1, p0, Lcom/robotoworks/mechanoid/db/AbstractValuesBuilder;->mValues:Landroid/content/ContentValues;

    invoke-virtual {v0, v1}, Landroid/content/ContentProviderOperation$Builder;->withValues(Landroid/content/ContentValues;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v0

    return-object v0
.end method

.method public toDeleteOperationBuilder()Landroid/content/ContentProviderOperation$Builder;
    .locals 1

    .prologue
    .line 140
    iget-object v0, p0, Lcom/robotoworks/mechanoid/db/AbstractValuesBuilder;->mContentUri:Landroid/net/Uri;

    invoke-static {v0}, Landroid/content/ContentProviderOperation;->newDelete(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v0

    return-object v0
.end method

.method public toInsertOperationBuilder()Landroid/content/ContentProviderOperation$Builder;
    .locals 2

    .prologue
    .line 116
    iget-object v0, p0, Lcom/robotoworks/mechanoid/db/AbstractValuesBuilder;->mContentUri:Landroid/net/Uri;

    invoke-static {v0}, Landroid/content/ContentProviderOperation;->newInsert(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v0

    iget-object v1, p0, Lcom/robotoworks/mechanoid/db/AbstractValuesBuilder;->mValues:Landroid/content/ContentValues;

    invoke-virtual {v0, v1}, Landroid/content/ContentProviderOperation$Builder;->withValues(Landroid/content/ContentValues;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v0

    return-object v0
.end method

.method public toUpdateOperationBuilder()Landroid/content/ContentProviderOperation$Builder;
    .locals 2

    .prologue
    .line 128
    iget-object v0, p0, Lcom/robotoworks/mechanoid/db/AbstractValuesBuilder;->mContentUri:Landroid/net/Uri;

    invoke-static {v0}, Landroid/content/ContentProviderOperation;->newUpdate(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v0

    iget-object v1, p0, Lcom/robotoworks/mechanoid/db/AbstractValuesBuilder;->mValues:Landroid/content/ContentValues;

    invoke-virtual {v0, v1}, Landroid/content/ContentProviderOperation$Builder;->withValues(Landroid/content/ContentValues;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v0

    return-object v0
.end method

.method public update(J)I
    .locals 5
    .param p1, "id"    # J

    .prologue
    const/4 v3, 0x0

    .line 86
    iget-object v0, p0, Lcom/robotoworks/mechanoid/db/AbstractValuesBuilder;->mContentResolver:Landroid/content/ContentResolver;

    iget-object v1, p0, Lcom/robotoworks/mechanoid/db/AbstractValuesBuilder;->mContentUri:Landroid/net/Uri;

    invoke-virtual {v1}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v1

    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v1

    iget-object v2, p0, Lcom/robotoworks/mechanoid/db/AbstractValuesBuilder;->mValues:Landroid/content/ContentValues;

    invoke-virtual {v0, v1, v2, v3, v3}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public update(JZ)I
    .locals 5
    .param p1, "id"    # J
    .param p3, "notifyChange"    # Z

    .prologue
    const/4 v4, 0x0

    .line 93
    iget-object v1, p0, Lcom/robotoworks/mechanoid/db/AbstractValuesBuilder;->mContentUri:Landroid/net/Uri;

    invoke-virtual {v1}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v1

    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    const-string v2, "mechdb_notify"

    invoke-static {p3}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v0

    .line 99
    .local v0, "uri":Landroid/net/Uri;
    iget-object v1, p0, Lcom/robotoworks/mechanoid/db/AbstractValuesBuilder;->mContentResolver:Landroid/content/ContentResolver;

    iget-object v2, p0, Lcom/robotoworks/mechanoid/db/AbstractValuesBuilder;->mValues:Landroid/content/ContentValues;

    invoke-virtual {v1, v0, v2, v4, v4}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    return v1
.end method

.method public update(Lcom/robotoworks/mechanoid/db/SQuery;)I
    .locals 5
    .param p1, "query"    # Lcom/robotoworks/mechanoid/db/SQuery;

    .prologue
    .line 66
    iget-object v0, p0, Lcom/robotoworks/mechanoid/db/AbstractValuesBuilder;->mContentResolver:Landroid/content/ContentResolver;

    iget-object v1, p0, Lcom/robotoworks/mechanoid/db/AbstractValuesBuilder;->mContentUri:Landroid/net/Uri;

    iget-object v2, p0, Lcom/robotoworks/mechanoid/db/AbstractValuesBuilder;->mValues:Landroid/content/ContentValues;

    invoke-virtual {p1}, Lcom/robotoworks/mechanoid/db/SQuery;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1}, Lcom/robotoworks/mechanoid/db/SQuery;->getArgsArray()[Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public update(Lcom/robotoworks/mechanoid/db/SQuery;Z)I
    .locals 5
    .param p1, "query"    # Lcom/robotoworks/mechanoid/db/SQuery;
    .param p2, "notifyChange"    # Z

    .prologue
    .line 74
    iget-object v1, p0, Lcom/robotoworks/mechanoid/db/AbstractValuesBuilder;->mContentUri:Landroid/net/Uri;

    invoke-virtual {v1}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v1

    const-string v2, "mechdb_notify"

    invoke-static {p2}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v0

    .line 79
    .local v0, "uri":Landroid/net/Uri;
    iget-object v1, p0, Lcom/robotoworks/mechanoid/db/AbstractValuesBuilder;->mContentResolver:Landroid/content/ContentResolver;

    iget-object v2, p0, Lcom/robotoworks/mechanoid/db/AbstractValuesBuilder;->mValues:Landroid/content/ContentValues;

    invoke-virtual {p1}, Lcom/robotoworks/mechanoid/db/SQuery;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1}, Lcom/robotoworks/mechanoid/db/SQuery;->getArgsArray()[Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v0, v2, v3, v4}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    return v1
.end method
