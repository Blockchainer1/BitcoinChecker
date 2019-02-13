.class public Lcom/robotoworks/mechanoid/db/SQuery;
.super Ljava/lang/Object;
.source "SQuery.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/robotoworks/mechanoid/db/SQuery$Op;,
        Lcom/robotoworks/mechanoid/db/SQuery$Literal;
    }
.end annotation


# static fields
.field private static final AND:Ljava/lang/String; = " AND "

.field public static final CURRENT_DATE:Lcom/robotoworks/mechanoid/db/SQuery$Literal;

.field public static final CURRENT_TIME:Lcom/robotoworks/mechanoid/db/SQuery$Literal;

.field public static final CURRENT_TIMESTAMP:Lcom/robotoworks/mechanoid/db/SQuery$Literal;

.field public static final NULL:Lcom/robotoworks/mechanoid/db/SQuery$Literal;

.field private static final OR:Ljava/lang/String; = " OR "


# instance fields
.field private mArgs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mBuilder:Ljava/lang/StringBuilder;

.field private mNextOp:Ljava/lang/String;

.field private mProvider:Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 76
    new-instance v0, Lcom/robotoworks/mechanoid/db/SQuery$Literal;

    const-string v1, "NULL"

    invoke-direct {v0, v1}, Lcom/robotoworks/mechanoid/db/SQuery$Literal;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/robotoworks/mechanoid/db/SQuery;->NULL:Lcom/robotoworks/mechanoid/db/SQuery$Literal;

    .line 81
    new-instance v0, Lcom/robotoworks/mechanoid/db/SQuery$Literal;

    const-string v1, "CURRENT_TIME"

    invoke-direct {v0, v1}, Lcom/robotoworks/mechanoid/db/SQuery$Literal;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/robotoworks/mechanoid/db/SQuery;->CURRENT_TIME:Lcom/robotoworks/mechanoid/db/SQuery$Literal;

    .line 86
    new-instance v0, Lcom/robotoworks/mechanoid/db/SQuery$Literal;

    const-string v1, "CURRENT_DATE"

    invoke-direct {v0, v1}, Lcom/robotoworks/mechanoid/db/SQuery$Literal;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/robotoworks/mechanoid/db/SQuery;->CURRENT_DATE:Lcom/robotoworks/mechanoid/db/SQuery$Literal;

    .line 91
    new-instance v0, Lcom/robotoworks/mechanoid/db/SQuery$Literal;

    const-string v1, "CURRENT_TIMESTAMP"

    invoke-direct {v0, v1}, Lcom/robotoworks/mechanoid/db/SQuery$Literal;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/robotoworks/mechanoid/db/SQuery;->CURRENT_TIMESTAMP:Lcom/robotoworks/mechanoid/db/SQuery$Literal;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .prologue
    .line 184
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 165
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/robotoworks/mechanoid/db/SQuery;->mArgs:Ljava/util/List;

    .line 166
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/robotoworks/mechanoid/db/SQuery;->mNextOp:Ljava/lang/String;

    .line 185
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iput-object v0, p0, Lcom/robotoworks/mechanoid/db/SQuery;->mBuilder:Ljava/lang/StringBuilder;

    .line 186
    return-void
.end method

.method public constructor <init>(Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;)V
    .locals 0
    .param p1, "provider"    # Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;

    .prologue
    .line 189
    invoke-direct {p0}, Lcom/robotoworks/mechanoid/db/SQuery;-><init>()V

    .line 190
    iput-object p1, p0, Lcom/robotoworks/mechanoid/db/SQuery;->mProvider:Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;

    .line 191
    return-void
.end method

.method private varargs appendGroupByToUri(Landroid/net/Uri;[Ljava/lang/String;)Landroid/net/Uri;
    .locals 5
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "groupBy"    # [Ljava/lang/String;

    .prologue
    .line 632
    if-eqz p2, :cond_0

    array-length v2, p2

    if-nez v2, :cond_1

    .line 645
    .end local p1    # "uri":Landroid/net/Uri;
    :cond_0
    :goto_0
    return-object p1

    .line 634
    .restart local p1    # "uri":Landroid/net/Uri;
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 636
    .local v0, "builder":Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    array-length v2, p2

    if-ge v1, v2, :cond_4

    .line 637
    aget-object v2, p2, v1

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 636
    :cond_2
    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 640
    :cond_3
    aget-object v2, p2, v1

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 641
    array-length v2, p2

    add-int/lit8 v2, v2, -0x1

    if-ge v1, v2, :cond_2

    .line 642
    const-string v2, ", "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 645
    :cond_4
    invoke-virtual {p1}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v2

    const-string v3, "mechdb_group_by"

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v2

    invoke-virtual {v2}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p1

    goto :goto_0
.end method

.method private ensureOp()V
    .locals 2

    .prologue
    .line 404
    iget-object v0, p0, Lcom/robotoworks/mechanoid/db/SQuery;->mBuilder:Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    if-nez v0, :cond_0

    .line 414
    :goto_0
    return-void

    .line 408
    :cond_0
    iget-object v0, p0, Lcom/robotoworks/mechanoid/db/SQuery;->mNextOp:Ljava/lang/String;

    if-nez v0, :cond_1

    .line 409
    iget-object v0, p0, Lcom/robotoworks/mechanoid/db/SQuery;->mBuilder:Ljava/lang/StringBuilder;

    const-string v1, " AND "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 411
    :cond_1
    iget-object v0, p0, Lcom/robotoworks/mechanoid/db/SQuery;->mBuilder:Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/robotoworks/mechanoid/db/SQuery;->mNextOp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 412
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/robotoworks/mechanoid/db/SQuery;->mNextOp:Ljava/lang/String;

    goto :goto_0
.end method

.method private getContentProvider(Landroid/net/Uri;)Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;
    .locals 4
    .param p1, "uri"    # Landroid/net/Uri;

    .prologue
    .line 700
    iget-object v3, p0, Lcom/robotoworks/mechanoid/db/SQuery;->mProvider:Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;

    if-eqz v3, :cond_0

    .line 701
    iget-object v1, p0, Lcom/robotoworks/mechanoid/db/SQuery;->mProvider:Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;

    .line 709
    :goto_0
    return-object v1

    .line 704
    :cond_0
    invoke-static {}, Lcom/robotoworks/mechanoid/Mechanoid;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    .line 706
    .local v2, "resolver":Landroid/content/ContentResolver;
    invoke-virtual {v2, p1}, Landroid/content/ContentResolver;->acquireContentProviderClient(Landroid/net/Uri;)Landroid/content/ContentProviderClient;

    move-result-object v0

    .line 708
    .local v0, "client":Landroid/content/ContentProviderClient;
    invoke-virtual {v0}, Landroid/content/ContentProviderClient;->getLocalContentProvider()Landroid/content/ContentProvider;

    move-result-object v1

    check-cast v1, Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;

    .line 709
    .local v1, "provider":Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;
    goto :goto_0
.end method

.method public static newQuery()Lcom/robotoworks/mechanoid/db/SQuery;
    .locals 1

    .prologue
    .line 194
    new-instance v0, Lcom/robotoworks/mechanoid/db/SQuery;

    invoke-direct {v0}, Lcom/robotoworks/mechanoid/db/SQuery;-><init>()V

    return-object v0
.end method

.method public static newQuery(Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;)Lcom/robotoworks/mechanoid/db/SQuery;
    .locals 1
    .param p0, "provider"    # Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;

    .prologue
    .line 205
    new-instance v0, Lcom/robotoworks/mechanoid/db/SQuery;

    invoke-direct {v0, p0}, Lcom/robotoworks/mechanoid/db/SQuery;-><init>(Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;)V

    return-object v0
.end method


# virtual methods
.method public and()Lcom/robotoworks/mechanoid/db/SQuery;
    .locals 1

    .prologue
    .line 392
    const-string v0, " AND "

    iput-object v0, p0, Lcom/robotoworks/mechanoid/db/SQuery;->mNextOp:Ljava/lang/String;

    .line 394
    return-object p0
.end method

.method public varargs append(Ljava/lang/String;[Ljava/lang/String;)Lcom/robotoworks/mechanoid/db/SQuery;
    .locals 5
    .param p1, "query"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/String;

    .prologue
    .line 374
    if-eqz p1, :cond_1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_1

    .line 375
    invoke-direct {p0}, Lcom/robotoworks/mechanoid/db/SQuery;->ensureOp()V

    .line 377
    iget-object v4, p0, Lcom/robotoworks/mechanoid/db/SQuery;->mBuilder:Ljava/lang/StringBuilder;

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 379
    if-eqz p2, :cond_0

    array-length v4, p2

    if-lez v4, :cond_0

    .line 380
    move-object v1, p2

    .local v1, "arr$":[Ljava/lang/String;
    array-length v3, v1

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_0
    if-ge v2, v3, :cond_0

    aget-object v0, v1, v2

    .line 381
    .local v0, "arg":Ljava/lang/String;
    iget-object v4, p0, Lcom/robotoworks/mechanoid/db/SQuery;->mArgs:Ljava/util/List;

    invoke-interface {v4, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 380
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 385
    .end local v0    # "arg":Ljava/lang/String;
    .end local v1    # "arr$":[Ljava/lang/String;
    .end local v2    # "i$":I
    .end local v3    # "len$":I
    :cond_0
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/robotoworks/mechanoid/db/SQuery;->mNextOp:Ljava/lang/String;

    .line 388
    :cond_1
    return-object p0
.end method

.method public count(Landroid/net/Uri;)I
    .locals 8
    .param p1, "uri"    # Landroid/net/Uri;

    .prologue
    .line 1439
    invoke-static {}, Lcom/robotoworks/mechanoid/Mechanoid;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 1441
    .local v0, "resolver":Landroid/content/ContentResolver;
    const/4 v6, 0x0

    .line 1443
    .local v6, "c":Landroid/database/Cursor;
    invoke-virtual {p1}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v1

    const-string v2, "mechdb_notify"

    const-string v3, "false"

    invoke-virtual {v1, v2, v3}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p1

    .line 1446
    const/4 v1, 0x1

    :try_start_0
    new-array v2, v1, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v3, "count(*)"

    aput-object v3, v2, v1

    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/db/SQuery;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/db/SQuery;->getArgsArray()[Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 1448
    const/4 v7, 0x0

    .line 1450
    .local v7, "count":I
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1451
    const/4 v1, 0x0

    invoke-interface {v6, v1}, Landroid/database/Cursor;->getInt(I)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v7

    .line 1457
    :cond_0
    invoke-static {v6}, Lcom/robotoworks/mechanoid/util/Closeables;->closeSilently(Landroid/database/Cursor;)V

    return v7

    .end local v7    # "count":I
    :catchall_0
    move-exception v1

    invoke-static {v6}, Lcom/robotoworks/mechanoid/util/Closeables;->closeSilently(Landroid/database/Cursor;)V

    throw v1
.end method

.method public createLoader(Landroid/net/Uri;[Ljava/lang/String;)Landroid/content/CursorLoader;
    .locals 7
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "projection"    # [Ljava/lang/String;
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 805
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-ge v0, v1, :cond_0

    .line 809
    :goto_0
    return-object v6

    :cond_0
    new-instance v0, Landroid/content/CursorLoader;

    invoke-static {}, Lcom/robotoworks/mechanoid/Mechanoid;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/db/SQuery;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/db/SQuery;->getArgsArray()[Ljava/lang/String;

    move-result-object v5

    move-object v2, p1

    move-object v3, p2

    invoke-direct/range {v0 .. v6}, Landroid/content/CursorLoader;-><init>(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    move-object v6, v0

    goto :goto_0
.end method

.method public createLoader(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;)Landroid/content/CursorLoader;
    .locals 7
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "projection"    # [Ljava/lang/String;
    .param p3, "sortOrder"    # Ljava/lang/String;
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .prologue
    .line 762
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-ge v0, v1, :cond_0

    .line 763
    const/4 v0, 0x0

    .line 766
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Landroid/content/CursorLoader;

    invoke-static {}, Lcom/robotoworks/mechanoid/Mechanoid;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/db/SQuery;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/db/SQuery;->getArgsArray()[Ljava/lang/String;

    move-result-object v5

    move-object v2, p1

    move-object v3, p2

    move-object v6, p3

    invoke-direct/range {v0 .. v6}, Landroid/content/CursorLoader;-><init>(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public createLoader(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;Z)Landroid/content/CursorLoader;
    .locals 7
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "projection"    # [Ljava/lang/String;
    .param p3, "sortOrder"    # Ljava/lang/String;
    .param p4, "enableNotifications"    # Z
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .prologue
    .line 782
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-ge v0, v1, :cond_0

    .line 783
    const/4 v0, 0x0

    .line 788
    :goto_0
    return-object v0

    .line 786
    :cond_0
    invoke-virtual {p1}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v1, "mechdb_notify"

    invoke-static {p4}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p1

    .line 788
    new-instance v0, Landroid/content/CursorLoader;

    invoke-static {}, Lcom/robotoworks/mechanoid/Mechanoid;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/db/SQuery;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/db/SQuery;->getArgsArray()[Ljava/lang/String;

    move-result-object v5

    move-object v2, p1

    move-object v3, p2

    move-object v6, p3

    invoke-direct/range {v0 .. v6}, Landroid/content/CursorLoader;-><init>(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public varargs createLoader(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;Z[Ljava/lang/String;)Landroid/content/CursorLoader;
    .locals 7
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "projection"    # [Ljava/lang/String;
    .param p3, "sortOrder"    # Ljava/lang/String;
    .param p4, "enableNotifications"    # Z
    .param p5, "groupBy"    # [Ljava/lang/String;
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .prologue
    .line 793
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-ge v0, v1, :cond_0

    .line 794
    const/4 v0, 0x0

    .line 800
    :goto_0
    return-object v0

    .line 797
    :cond_0
    invoke-virtual {p1}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v1, "mechdb_notify"

    invoke-static {p4}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p1

    .line 798
    invoke-direct {p0, p1, p5}, Lcom/robotoworks/mechanoid/db/SQuery;->appendGroupByToUri(Landroid/net/Uri;[Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    .line 800
    new-instance v0, Landroid/content/CursorLoader;

    invoke-static {}, Lcom/robotoworks/mechanoid/Mechanoid;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/db/SQuery;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/db/SQuery;->getArgsArray()[Ljava/lang/String;

    move-result-object v5

    move-object v2, p1

    move-object v3, p2

    move-object v6, p3

    invoke-direct/range {v0 .. v6}, Landroid/content/CursorLoader;-><init>(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public varargs createLoader(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Landroid/content/CursorLoader;
    .locals 7
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "projection"    # [Ljava/lang/String;
    .param p3, "sortOrder"    # Ljava/lang/String;
    .param p4, "groupBy"    # [Ljava/lang/String;
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .prologue
    .line 771
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-ge v0, v1, :cond_0

    .line 772
    const/4 v0, 0x0

    .line 777
    :goto_0
    return-object v0

    .line 775
    :cond_0
    invoke-direct {p0, p1, p4}, Lcom/robotoworks/mechanoid/db/SQuery;->appendGroupByToUri(Landroid/net/Uri;[Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    .line 777
    new-instance v0, Landroid/content/CursorLoader;

    invoke-static {}, Lcom/robotoworks/mechanoid/Mechanoid;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/db/SQuery;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/db/SQuery;->getArgsArray()[Ljava/lang/String;

    move-result-object v5

    move-object v2, p1

    move-object v3, p2

    move-object v6, p3

    invoke-direct/range {v0 .. v6}, Landroid/content/CursorLoader;-><init>(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public varargs createLoader(Landroid/net/Uri;[Ljava/lang/String;Z[Ljava/lang/String;)Landroid/content/CursorLoader;
    .locals 7
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "projection"    # [Ljava/lang/String;
    .param p3, "enableNotifications"    # Z
    .param p4, "groupBy"    # [Ljava/lang/String;
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 814
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-ge v0, v1, :cond_0

    .line 821
    :goto_0
    return-object v6

    .line 818
    :cond_0
    invoke-virtual {p1}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v1, "mechdb_notify"

    invoke-static {p3}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p1

    .line 819
    invoke-direct {p0, p1, p4}, Lcom/robotoworks/mechanoid/db/SQuery;->appendGroupByToUri(Landroid/net/Uri;[Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    .line 821
    new-instance v0, Landroid/content/CursorLoader;

    invoke-static {}, Lcom/robotoworks/mechanoid/Mechanoid;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/db/SQuery;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/db/SQuery;->getArgsArray()[Ljava/lang/String;

    move-result-object v5

    move-object v2, p1

    move-object v3, p2

    invoke-direct/range {v0 .. v6}, Landroid/content/CursorLoader;-><init>(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    move-object v6, v0

    goto :goto_0
.end method

.method public createSupportLoader(Landroid/net/Uri;[Ljava/lang/String;)Landroid/support/v4/content/CursorLoader;
    .locals 7
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "projection"    # [Ljava/lang/String;

    .prologue
    .line 848
    new-instance v0, Landroid/support/v4/content/CursorLoader;

    invoke-static {}, Lcom/robotoworks/mechanoid/Mechanoid;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/db/SQuery;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/db/SQuery;->getArgsArray()[Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    move-object v2, p1

    move-object v3, p2

    invoke-direct/range {v0 .. v6}, Landroid/support/v4/content/CursorLoader;-><init>(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public createSupportLoader(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;)Landroid/support/v4/content/CursorLoader;
    .locals 7
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "projection"    # [Ljava/lang/String;
    .param p3, "sortOrder"    # Ljava/lang/String;

    .prologue
    .line 825
    new-instance v0, Landroid/support/v4/content/CursorLoader;

    invoke-static {}, Lcom/robotoworks/mechanoid/Mechanoid;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/db/SQuery;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/db/SQuery;->getArgsArray()[Ljava/lang/String;

    move-result-object v5

    move-object v2, p1

    move-object v3, p2

    move-object v6, p3

    invoke-direct/range {v0 .. v6}, Landroid/support/v4/content/CursorLoader;-><init>(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public createSupportLoader(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;Z)Landroid/support/v4/content/CursorLoader;
    .locals 7
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "projection"    # [Ljava/lang/String;
    .param p3, "sortOrder"    # Ljava/lang/String;
    .param p4, "enableNotifications"    # Z

    .prologue
    .line 835
    invoke-virtual {p1}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v1, "mechdb_notify"

    invoke-static {p4}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p1

    .line 837
    new-instance v0, Landroid/support/v4/content/CursorLoader;

    invoke-static {}, Lcom/robotoworks/mechanoid/Mechanoid;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/db/SQuery;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/db/SQuery;->getArgsArray()[Ljava/lang/String;

    move-result-object v5

    move-object v2, p1

    move-object v3, p2

    move-object v6, p3

    invoke-direct/range {v0 .. v6}, Landroid/support/v4/content/CursorLoader;-><init>(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public varargs createSupportLoader(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;Z[Ljava/lang/String;)Landroid/support/v4/content/CursorLoader;
    .locals 7
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "projection"    # [Ljava/lang/String;
    .param p3, "sortOrder"    # Ljava/lang/String;
    .param p4, "enableNotifications"    # Z
    .param p5, "groupBy"    # [Ljava/lang/String;

    .prologue
    .line 842
    invoke-virtual {p1}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v1, "mechdb_notify"

    invoke-static {p4}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p1

    .line 843
    invoke-direct {p0, p1, p5}, Lcom/robotoworks/mechanoid/db/SQuery;->appendGroupByToUri(Landroid/net/Uri;[Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    .line 844
    new-instance v0, Landroid/support/v4/content/CursorLoader;

    invoke-static {}, Lcom/robotoworks/mechanoid/Mechanoid;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/db/SQuery;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/db/SQuery;->getArgsArray()[Ljava/lang/String;

    move-result-object v5

    move-object v2, p1

    move-object v3, p2

    move-object v6, p3

    invoke-direct/range {v0 .. v6}, Landroid/support/v4/content/CursorLoader;-><init>(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public varargs createSupportLoader(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Landroid/support/v4/content/CursorLoader;
    .locals 7
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "projection"    # [Ljava/lang/String;
    .param p3, "sortOrder"    # Ljava/lang/String;
    .param p4, "groupBy"    # [Ljava/lang/String;

    .prologue
    .line 829
    invoke-direct {p0, p1, p4}, Lcom/robotoworks/mechanoid/db/SQuery;->appendGroupByToUri(Landroid/net/Uri;[Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    .line 830
    new-instance v0, Landroid/support/v4/content/CursorLoader;

    invoke-static {}, Lcom/robotoworks/mechanoid/Mechanoid;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/db/SQuery;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/db/SQuery;->getArgsArray()[Ljava/lang/String;

    move-result-object v5

    move-object v2, p1

    move-object v3, p2

    move-object v6, p3

    invoke-direct/range {v0 .. v6}, Landroid/support/v4/content/CursorLoader;-><init>(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public createSupportLoader(Landroid/net/Uri;[Ljava/lang/String;Z)Landroid/support/v4/content/CursorLoader;
    .locals 7
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "projection"    # [Ljava/lang/String;
    .param p3, "enableNotifications"    # Z

    .prologue
    .line 853
    invoke-virtual {p1}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v1, "mechdb_notify"

    invoke-static {p3}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p1

    .line 855
    new-instance v0, Landroid/support/v4/content/CursorLoader;

    invoke-static {}, Lcom/robotoworks/mechanoid/Mechanoid;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/db/SQuery;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/db/SQuery;->getArgsArray()[Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    move-object v2, p1

    move-object v3, p2

    invoke-direct/range {v0 .. v6}, Landroid/support/v4/content/CursorLoader;-><init>(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public varargs createSupportLoader(Landroid/net/Uri;[Ljava/lang/String;Z[Ljava/lang/String;)Landroid/support/v4/content/CursorLoader;
    .locals 7
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "projection"    # [Ljava/lang/String;
    .param p3, "enableNotifications"    # Z
    .param p4, "groupBy"    # [Ljava/lang/String;

    .prologue
    .line 860
    invoke-virtual {p1}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v1, "mechdb_notify"

    invoke-static {p3}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p1

    .line 861
    invoke-direct {p0, p1, p4}, Lcom/robotoworks/mechanoid/db/SQuery;->appendGroupByToUri(Landroid/net/Uri;[Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    .line 863
    new-instance v0, Landroid/support/v4/content/CursorLoader;

    invoke-static {}, Lcom/robotoworks/mechanoid/Mechanoid;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/db/SQuery;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/db/SQuery;->getArgsArray()[Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    move-object v2, p1

    move-object v3, p2

    invoke-direct/range {v0 .. v6}, Landroid/support/v4/content/CursorLoader;-><init>(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public delete(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)I
    .locals 2
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p2, "table"    # Ljava/lang/String;

    .prologue
    .line 585
    iget-object v0, p0, Lcom/robotoworks/mechanoid/db/SQuery;->mBuilder:Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/db/SQuery;->getArgsArray()[Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, p2, v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public delete(Landroid/net/Uri;)I
    .locals 3
    .param p1, "uri"    # Landroid/net/Uri;

    .prologue
    .line 1426
    invoke-static {}, Lcom/robotoworks/mechanoid/Mechanoid;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 1427
    .local v0, "resolver":Landroid/content/ContentResolver;
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/db/SQuery;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/db/SQuery;->getArgsArray()[Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, p1, v1, v2}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    return v1
.end method

.method public delete(Landroid/net/Uri;Z)I
    .locals 4
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "notifyChange"    # Z

    .prologue
    .line 1432
    invoke-virtual {p1}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v1

    const-string v2, "mechdb_notify"

    invoke-static {p2}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p1

    .line 1434
    invoke-static {}, Lcom/robotoworks/mechanoid/Mechanoid;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 1435
    .local v0, "resolver":Landroid/content/ContentResolver;
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/db/SQuery;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/db/SQuery;->getArgsArray()[Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, p1, v1, v2}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    return v1
.end method

.method public exists(Landroid/net/Uri;)Z
    .locals 1
    .param p1, "uri"    # Landroid/net/Uri;

    .prologue
    .line 1462
    invoke-virtual {p0, p1}, Lcom/robotoworks/mechanoid/db/SQuery;->count(Landroid/net/Uri;)I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public expr(Lcom/robotoworks/mechanoid/db/SQuery;)Lcom/robotoworks/mechanoid/db/SQuery;
    .locals 3
    .param p1, "query"    # Lcom/robotoworks/mechanoid/db/SQuery;

    .prologue
    .line 280
    invoke-virtual {p1}, Lcom/robotoworks/mechanoid/db/SQuery;->getArgs()Ljava/util/List;

    move-result-object v0

    .line 282
    .local v0, "args":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-direct {p0}, Lcom/robotoworks/mechanoid/db/SQuery;->ensureOp()V

    .line 283
    iget-object v1, p0, Lcom/robotoworks/mechanoid/db/SQuery;->mBuilder:Ljava/lang/StringBuilder;

    const-string v2, "("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 285
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_0

    .line 286
    iget-object v1, p0, Lcom/robotoworks/mechanoid/db/SQuery;->mArgs:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 289
    :cond_0
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/robotoworks/mechanoid/db/SQuery;->mNextOp:Ljava/lang/String;

    .line 291
    return-object p0
.end method

.method public expr(Ljava/lang/String;Ljava/lang/String;D)Lcom/robotoworks/mechanoid/db/SQuery;
    .locals 1
    .param p1, "column"    # Ljava/lang/String;
    .param p2, "op"    # Ljava/lang/String;
    .param p3, "arg"    # D

    .prologue
    .line 326
    invoke-static {p3, p4}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, p2, v0}, Lcom/robotoworks/mechanoid/db/SQuery;->expr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/robotoworks/mechanoid/db/SQuery;

    move-result-object v0

    return-object v0
.end method

.method public expr(Ljava/lang/String;Ljava/lang/String;F)Lcom/robotoworks/mechanoid/db/SQuery;
    .locals 1
    .param p1, "column"    # Ljava/lang/String;
    .param p2, "op"    # Ljava/lang/String;
    .param p3, "arg"    # F

    .prologue
    .line 319
    invoke-static {p3}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, p2, v0}, Lcom/robotoworks/mechanoid/db/SQuery;->expr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/robotoworks/mechanoid/db/SQuery;

    move-result-object v0

    return-object v0
.end method

.method public expr(Ljava/lang/String;Ljava/lang/String;I)Lcom/robotoworks/mechanoid/db/SQuery;
    .locals 1
    .param p1, "column"    # Ljava/lang/String;
    .param p2, "op"    # Ljava/lang/String;
    .param p3, "arg"    # I

    .prologue
    .line 305
    invoke-static {p3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, p2, v0}, Lcom/robotoworks/mechanoid/db/SQuery;->expr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/robotoworks/mechanoid/db/SQuery;

    move-result-object v0

    return-object v0
.end method

.method public expr(Ljava/lang/String;Ljava/lang/String;J)Lcom/robotoworks/mechanoid/db/SQuery;
    .locals 1
    .param p1, "column"    # Ljava/lang/String;
    .param p2, "op"    # Ljava/lang/String;
    .param p3, "arg"    # J

    .prologue
    .line 312
    invoke-static {p3, p4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, p2, v0}, Lcom/robotoworks/mechanoid/db/SQuery;->expr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/robotoworks/mechanoid/db/SQuery;

    move-result-object v0

    return-object v0
.end method

.method public expr(Ljava/lang/String;Ljava/lang/String;Lcom/robotoworks/mechanoid/db/SQuery$Literal;)Lcom/robotoworks/mechanoid/db/SQuery;
    .locals 2
    .param p1, "column"    # Ljava/lang/String;
    .param p2, "op"    # Ljava/lang/String;
    .param p3, "arg"    # Lcom/robotoworks/mechanoid/db/SQuery$Literal;

    .prologue
    .line 238
    invoke-direct {p0}, Lcom/robotoworks/mechanoid/db/SQuery;->ensureOp()V

    .line 240
    iget-object v0, p0, Lcom/robotoworks/mechanoid/db/SQuery;->mBuilder:Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p3, Lcom/robotoworks/mechanoid/db/SQuery$Literal;->value:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 241
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/robotoworks/mechanoid/db/SQuery;->mNextOp:Ljava/lang/String;

    .line 243
    return-object p0
.end method

.method public expr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/robotoworks/mechanoid/db/SQuery;
    .locals 2
    .param p1, "column"    # Ljava/lang/String;
    .param p2, "op"    # Ljava/lang/String;
    .param p3, "arg"    # Ljava/lang/String;

    .prologue
    .line 219
    invoke-direct {p0}, Lcom/robotoworks/mechanoid/db/SQuery;->ensureOp()V

    .line 220
    iget-object v0, p0, Lcom/robotoworks/mechanoid/db/SQuery;->mBuilder:Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "?"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 221
    iget-object v0, p0, Lcom/robotoworks/mechanoid/db/SQuery;->mArgs:Ljava/util/List;

    invoke-interface {v0, p3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 222
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/robotoworks/mechanoid/db/SQuery;->mNextOp:Ljava/lang/String;

    .line 224
    return-object p0
.end method

.method public expr(Ljava/lang/String;Ljava/lang/String;Z)Lcom/robotoworks/mechanoid/db/SQuery;
    .locals 1
    .param p1, "column"    # Ljava/lang/String;
    .param p2, "op"    # Ljava/lang/String;
    .param p3, "arg"    # Z

    .prologue
    .line 298
    if-eqz p3, :cond_0

    const-string v0, "1"

    :goto_0
    invoke-virtual {p0, p1, p2, v0}, Lcom/robotoworks/mechanoid/db/SQuery;->expr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/robotoworks/mechanoid/db/SQuery;

    move-result-object v0

    return-object v0

    :cond_0
    const-string v0, "0"

    goto :goto_0
.end method

.method public exprIsNull(Ljava/lang/String;)Lcom/robotoworks/mechanoid/db/SQuery;
    .locals 2
    .param p1, "column"    # Ljava/lang/String;

    .prologue
    .line 252
    invoke-direct {p0}, Lcom/robotoworks/mechanoid/db/SQuery;->ensureOp()V

    .line 253
    iget-object v0, p0, Lcom/robotoworks/mechanoid/db/SQuery;->mBuilder:Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " ISNULL"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 254
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/robotoworks/mechanoid/db/SQuery;->mNextOp:Ljava/lang/String;

    .line 256
    return-object p0
.end method

.method public exprNotNull(Ljava/lang/String;)Lcom/robotoworks/mechanoid/db/SQuery;
    .locals 2
    .param p1, "column"    # Ljava/lang/String;

    .prologue
    .line 265
    invoke-direct {p0}, Lcom/robotoworks/mechanoid/db/SQuery;->ensureOp()V

    .line 266
    iget-object v0, p0, Lcom/robotoworks/mechanoid/db/SQuery;->mBuilder:Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " NOTNULL"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 267
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/robotoworks/mechanoid/db/SQuery;->mNextOp:Ljava/lang/String;

    .line 269
    return-object p0
.end method

.method public firstBlob(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;)[B
    .locals 1
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p2, "table"    # Ljava/lang/String;
    .param p3, "column"    # Ljava/lang/String;

    .prologue
    .line 531
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/robotoworks/mechanoid/db/SQuery;->firstBlob(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v0

    return-object v0
.end method

.method public firstBlob(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)[B
    .locals 8
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p2, "table"    # Ljava/lang/String;
    .param p3, "column"    # Ljava/lang/String;
    .param p4, "orderBy"    # Ljava/lang/String;

    .prologue
    .line 535
    const/4 v6, 0x0

    .line 536
    .local v6, "cursor":Landroid/database/Cursor;
    const/4 v7, 0x0

    .line 538
    .local v7, "value":[B
    const/4 v0, 0x1

    :try_start_0
    new-array v3, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    aput-object p3, v3, v0

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v4, p4

    invoke-virtual/range {v0 .. v5}, Lcom/robotoworks/mechanoid/db/SQuery;->query(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 540
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 541
    const/4 v0, 0x0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getBlob(I)[B
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v7

    .line 545
    :cond_0
    invoke-static {v6}, Lcom/robotoworks/mechanoid/util/Closeables;->closeSilently(Landroid/database/Cursor;)V

    .line 548
    return-object v7

    .line 545
    :catchall_0
    move-exception v0

    invoke-static {v6}, Lcom/robotoworks/mechanoid/util/Closeables;->closeSilently(Landroid/database/Cursor;)V

    throw v0
.end method

.method public firstBlob(Landroid/net/Uri;Ljava/lang/String;)[B
    .locals 1
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "column"    # Ljava/lang/String;

    .prologue
    .line 977
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/robotoworks/mechanoid/db/SQuery;->firstBlob(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v0

    return-object v0
.end method

.method public firstBlob(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)[B
    .locals 4
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "column"    # Ljava/lang/String;
    .param p3, "orderBy"    # Ljava/lang/String;

    .prologue
    .line 981
    const/4 v0, 0x0

    .line 982
    .local v0, "cursor":Landroid/database/Cursor;
    const/4 v1, 0x0

    .line 985
    .local v1, "value":[B
    const/4 v2, 0x1

    :try_start_0
    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    aput-object p2, v2, v3

    const/4 v3, 0x0

    invoke-virtual {p0, p1, v2, p3, v3}, Lcom/robotoworks/mechanoid/db/SQuery;->select(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;Z)Landroid/database/Cursor;

    move-result-object v0

    .line 987
    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 988
    const/4 v2, 0x0

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getBlob(I)[B
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    .line 992
    :cond_0
    invoke-static {v0}, Lcom/robotoworks/mechanoid/util/Closeables;->closeSilently(Landroid/database/Cursor;)V

    .line 995
    return-object v1

    .line 992
    :catchall_0
    move-exception v2

    invoke-static {v0}, Lcom/robotoworks/mechanoid/util/Closeables;->closeSilently(Landroid/database/Cursor;)V

    throw v2
.end method

.method public firstBoolean(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p2, "table"    # Ljava/lang/String;
    .param p3, "column"    # Ljava/lang/String;

    .prologue
    .line 552
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/robotoworks/mechanoid/db/SQuery;->firstBoolean(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public firstBoolean(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p2, "table"    # Ljava/lang/String;
    .param p3, "column"    # Ljava/lang/String;
    .param p4, "orderBy"    # Ljava/lang/String;

    .prologue
    .line 556
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/robotoworks/mechanoid/db/SQuery;->firstShort(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)S

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public firstBoolean(Landroid/net/Uri;Ljava/lang/String;)Z
    .locals 1
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "column"    # Ljava/lang/String;

    .prologue
    .line 999
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/robotoworks/mechanoid/db/SQuery;->firstBoolean(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public firstBoolean(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "column"    # Ljava/lang/String;
    .param p3, "orderBy"    # Ljava/lang/String;

    .prologue
    .line 1003
    invoke-virtual {p0, p1, p2, p3}, Lcom/robotoworks/mechanoid/db/SQuery;->firstShort(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)S

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public firstDouble(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;)D
    .locals 2
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p2, "table"    # Ljava/lang/String;
    .param p3, "column"    # Ljava/lang/String;

    .prologue
    .line 468
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/robotoworks/mechanoid/db/SQuery;->firstDouble(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)D

    move-result-wide v0

    return-wide v0
.end method

.method public firstDouble(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)D
    .locals 10
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p2, "table"    # Ljava/lang/String;
    .param p3, "column"    # Ljava/lang/String;
    .param p4, "orderBy"    # Ljava/lang/String;

    .prologue
    .line 472
    const/4 v6, 0x0

    .line 473
    .local v6, "cursor":Landroid/database/Cursor;
    const-wide/16 v8, 0x0

    .line 475
    .local v8, "value":D
    const/4 v0, 0x1

    :try_start_0
    new-array v3, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    aput-object p3, v3, v0

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v4, p4

    invoke-virtual/range {v0 .. v5}, Lcom/robotoworks/mechanoid/db/SQuery;->query(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 477
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 478
    const/4 v0, 0x0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getDouble(I)D
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-wide v8

    .line 482
    :cond_0
    invoke-static {v6}, Lcom/robotoworks/mechanoid/util/Closeables;->closeSilently(Landroid/database/Cursor;)V

    .line 485
    return-wide v8

    .line 482
    :catchall_0
    move-exception v0

    invoke-static {v6}, Lcom/robotoworks/mechanoid/util/Closeables;->closeSilently(Landroid/database/Cursor;)V

    throw v0
.end method

.method public firstDouble(Landroid/net/Uri;Ljava/lang/String;)D
    .locals 2
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "column"    # Ljava/lang/String;

    .prologue
    .line 911
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/robotoworks/mechanoid/db/SQuery;->firstDouble(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)D

    move-result-wide v0

    return-wide v0
.end method

.method public firstDouble(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)D
    .locals 5
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "column"    # Ljava/lang/String;
    .param p3, "orderBy"    # Ljava/lang/String;

    .prologue
    .line 915
    const/4 v0, 0x0

    .line 916
    .local v0, "cursor":Landroid/database/Cursor;
    const-wide/16 v2, 0x0

    .line 919
    .local v2, "value":D
    const/4 v1, 0x1

    :try_start_0
    new-array v1, v1, [Ljava/lang/String;

    const/4 v4, 0x0

    aput-object p2, v1, v4

    const/4 v4, 0x0

    invoke-virtual {p0, p1, v1, p3, v4}, Lcom/robotoworks/mechanoid/db/SQuery;->select(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;Z)Landroid/database/Cursor;

    move-result-object v0

    .line 921
    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 922
    const/4 v1, 0x0

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getDouble(I)D
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-wide v2

    .line 926
    :cond_0
    invoke-static {v0}, Lcom/robotoworks/mechanoid/util/Closeables;->closeSilently(Landroid/database/Cursor;)V

    .line 929
    return-wide v2

    .line 926
    :catchall_0
    move-exception v1

    invoke-static {v0}, Lcom/robotoworks/mechanoid/util/Closeables;->closeSilently(Landroid/database/Cursor;)V

    throw v1
.end method

.method public firstFloat(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;)F
    .locals 1
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p2, "table"    # Ljava/lang/String;
    .param p3, "column"    # Ljava/lang/String;

    .prologue
    .line 489
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/robotoworks/mechanoid/db/SQuery;->firstFloat(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)F

    move-result v0

    return v0
.end method

.method public firstFloat(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)F
    .locals 8
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p2, "table"    # Ljava/lang/String;
    .param p3, "column"    # Ljava/lang/String;
    .param p4, "orderBy"    # Ljava/lang/String;

    .prologue
    .line 493
    const/4 v6, 0x0

    .line 494
    .local v6, "cursor":Landroid/database/Cursor;
    const/4 v7, 0x0

    .line 496
    .local v7, "value":F
    const/4 v0, 0x1

    :try_start_0
    new-array v3, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    aput-object p3, v3, v0

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v4, p4

    invoke-virtual/range {v0 .. v5}, Lcom/robotoworks/mechanoid/db/SQuery;->query(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 498
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 499
    const/4 v0, 0x0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getFloat(I)F
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v7

    .line 503
    :cond_0
    invoke-static {v6}, Lcom/robotoworks/mechanoid/util/Closeables;->closeSilently(Landroid/database/Cursor;)V

    .line 506
    return v7

    .line 503
    :catchall_0
    move-exception v0

    invoke-static {v6}, Lcom/robotoworks/mechanoid/util/Closeables;->closeSilently(Landroid/database/Cursor;)V

    throw v0
.end method

.method public firstFloat(Landroid/net/Uri;Ljava/lang/String;)F
    .locals 1
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "column"    # Ljava/lang/String;

    .prologue
    .line 933
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/robotoworks/mechanoid/db/SQuery;->firstFloat(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)F

    move-result v0

    return v0
.end method

.method public firstFloat(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)F
    .locals 4
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "column"    # Ljava/lang/String;
    .param p3, "orderBy"    # Ljava/lang/String;

    .prologue
    .line 937
    const/4 v0, 0x0

    .line 938
    .local v0, "cursor":Landroid/database/Cursor;
    const/4 v1, 0x0

    .line 941
    .local v1, "value":F
    const/4 v2, 0x1

    :try_start_0
    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    aput-object p2, v2, v3

    const/4 v3, 0x0

    invoke-virtual {p0, p1, v2, p3, v3}, Lcom/robotoworks/mechanoid/db/SQuery;->select(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;Z)Landroid/database/Cursor;

    move-result-object v0

    .line 943
    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 944
    const/4 v2, 0x0

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getFloat(I)F
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v1

    .line 948
    :cond_0
    invoke-static {v0}, Lcom/robotoworks/mechanoid/util/Closeables;->closeSilently(Landroid/database/Cursor;)V

    .line 951
    return v1

    .line 948
    :catchall_0
    move-exception v2

    invoke-static {v0}, Lcom/robotoworks/mechanoid/util/Closeables;->closeSilently(Landroid/database/Cursor;)V

    throw v2
.end method

.method public firstInt(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;)I
    .locals 1
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p2, "table"    # Ljava/lang/String;
    .param p3, "column"    # Ljava/lang/String;

    .prologue
    .line 426
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/robotoworks/mechanoid/db/SQuery;->firstInt(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public firstInt(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    .locals 8
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p2, "table"    # Ljava/lang/String;
    .param p3, "column"    # Ljava/lang/String;
    .param p4, "orderBy"    # Ljava/lang/String;

    .prologue
    .line 430
    const/4 v6, 0x0

    .line 431
    .local v6, "cursor":Landroid/database/Cursor;
    const/4 v7, 0x0

    .line 433
    .local v7, "value":I
    const/4 v0, 0x1

    :try_start_0
    new-array v3, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    aput-object p3, v3, v0

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v4, p4

    invoke-virtual/range {v0 .. v5}, Lcom/robotoworks/mechanoid/db/SQuery;->query(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 435
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 436
    const/4 v0, 0x0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getInt(I)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v7

    .line 440
    :cond_0
    invoke-static {v6}, Lcom/robotoworks/mechanoid/util/Closeables;->closeSilently(Landroid/database/Cursor;)V

    .line 443
    return v7

    .line 440
    :catchall_0
    move-exception v0

    invoke-static {v6}, Lcom/robotoworks/mechanoid/util/Closeables;->closeSilently(Landroid/database/Cursor;)V

    throw v0
.end method

.method public firstInt(Landroid/net/Uri;Ljava/lang/String;)I
    .locals 1
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "column"    # Ljava/lang/String;

    .prologue
    .line 867
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/robotoworks/mechanoid/db/SQuery;->firstInt(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public firstInt(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)I
    .locals 4
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "column"    # Ljava/lang/String;
    .param p3, "orderBy"    # Ljava/lang/String;

    .prologue
    .line 871
    const/4 v0, 0x0

    .line 872
    .local v0, "cursor":Landroid/database/Cursor;
    const/4 v1, 0x0

    .line 875
    .local v1, "value":I
    const/4 v2, 0x1

    :try_start_0
    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    aput-object p2, v2, v3

    const/4 v3, 0x0

    invoke-virtual {p0, p1, v2, p3, v3}, Lcom/robotoworks/mechanoid/db/SQuery;->select(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;Z)Landroid/database/Cursor;

    move-result-object v0

    .line 877
    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 878
    const/4 v2, 0x0

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getInt(I)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v1

    .line 882
    :cond_0
    invoke-static {v0}, Lcom/robotoworks/mechanoid/util/Closeables;->closeSilently(Landroid/database/Cursor;)V

    .line 885
    return v1

    .line 882
    :catchall_0
    move-exception v2

    invoke-static {v0}, Lcom/robotoworks/mechanoid/util/Closeables;->closeSilently(Landroid/database/Cursor;)V

    throw v2
.end method

.method public firstLong(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;)J
    .locals 2
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p2, "table"    # Ljava/lang/String;
    .param p3, "column"    # Ljava/lang/String;

    .prologue
    .line 447
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/robotoworks/mechanoid/db/SQuery;->firstLong(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)J

    move-result-wide v0

    return-wide v0
.end method

.method public firstLong(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)J
    .locals 10
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p2, "table"    # Ljava/lang/String;
    .param p3, "column"    # Ljava/lang/String;
    .param p4, "orderBy"    # Ljava/lang/String;

    .prologue
    .line 451
    const/4 v6, 0x0

    .line 452
    .local v6, "cursor":Landroid/database/Cursor;
    const-wide/16 v8, 0x0

    .line 454
    .local v8, "value":J
    const/4 v0, 0x1

    :try_start_0
    new-array v3, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    aput-object p3, v3, v0

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v4, p4

    invoke-virtual/range {v0 .. v5}, Lcom/robotoworks/mechanoid/db/SQuery;->query(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 456
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 457
    const/4 v0, 0x0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getLong(I)J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-wide v8

    .line 461
    :cond_0
    invoke-static {v6}, Lcom/robotoworks/mechanoid/util/Closeables;->closeSilently(Landroid/database/Cursor;)V

    .line 464
    return-wide v8

    .line 461
    :catchall_0
    move-exception v0

    invoke-static {v6}, Lcom/robotoworks/mechanoid/util/Closeables;->closeSilently(Landroid/database/Cursor;)V

    throw v0
.end method

.method public firstLong(Landroid/net/Uri;Ljava/lang/String;)J
    .locals 2
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "column"    # Ljava/lang/String;

    .prologue
    .line 889
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/robotoworks/mechanoid/db/SQuery;->firstLong(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)J

    move-result-wide v0

    return-wide v0
.end method

.method public firstLong(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)J
    .locals 5
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "column"    # Ljava/lang/String;
    .param p3, "orderBy"    # Ljava/lang/String;

    .prologue
    .line 893
    const/4 v0, 0x0

    .line 894
    .local v0, "cursor":Landroid/database/Cursor;
    const-wide/16 v2, 0x0

    .line 897
    .local v2, "value":J
    const/4 v1, 0x1

    :try_start_0
    new-array v1, v1, [Ljava/lang/String;

    const/4 v4, 0x0

    aput-object p2, v1, v4

    const/4 v4, 0x0

    invoke-virtual {p0, p1, v1, p3, v4}, Lcom/robotoworks/mechanoid/db/SQuery;->select(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;Z)Landroid/database/Cursor;

    move-result-object v0

    .line 899
    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 900
    const/4 v1, 0x0

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getLong(I)J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-wide v2

    .line 904
    :cond_0
    invoke-static {v0}, Lcom/robotoworks/mechanoid/util/Closeables;->closeSilently(Landroid/database/Cursor;)V

    .line 907
    return-wide v2

    .line 904
    :catchall_0
    move-exception v1

    invoke-static {v0}, Lcom/robotoworks/mechanoid/util/Closeables;->closeSilently(Landroid/database/Cursor;)V

    throw v1
.end method

.method public firstShort(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;)S
    .locals 1
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p2, "table"    # Ljava/lang/String;
    .param p3, "column"    # Ljava/lang/String;

    .prologue
    .line 510
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/robotoworks/mechanoid/db/SQuery;->firstShort(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)S

    move-result v0

    return v0
.end method

.method public firstShort(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)S
    .locals 8
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p2, "table"    # Ljava/lang/String;
    .param p3, "column"    # Ljava/lang/String;
    .param p4, "orderBy"    # Ljava/lang/String;

    .prologue
    .line 514
    const/4 v6, 0x0

    .line 515
    .local v6, "cursor":Landroid/database/Cursor;
    const/4 v7, 0x0

    .line 517
    .local v7, "value":S
    const/4 v0, 0x1

    :try_start_0
    new-array v3, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    aput-object p3, v3, v0

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v4, p4

    invoke-virtual/range {v0 .. v5}, Lcom/robotoworks/mechanoid/db/SQuery;->query(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 519
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 520
    const/4 v0, 0x0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getShort(I)S
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v7

    .line 524
    :cond_0
    invoke-static {v6}, Lcom/robotoworks/mechanoid/util/Closeables;->closeSilently(Landroid/database/Cursor;)V

    .line 527
    return v7

    .line 524
    :catchall_0
    move-exception v0

    invoke-static {v6}, Lcom/robotoworks/mechanoid/util/Closeables;->closeSilently(Landroid/database/Cursor;)V

    throw v0
.end method

.method public firstShort(Landroid/net/Uri;Ljava/lang/String;)S
    .locals 1
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "column"    # Ljava/lang/String;

    .prologue
    .line 955
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/robotoworks/mechanoid/db/SQuery;->firstShort(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)S

    move-result v0

    return v0
.end method

.method public firstShort(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)S
    .locals 4
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "column"    # Ljava/lang/String;
    .param p3, "orderBy"    # Ljava/lang/String;

    .prologue
    .line 959
    const/4 v0, 0x0

    .line 960
    .local v0, "cursor":Landroid/database/Cursor;
    const/4 v1, 0x0

    .line 963
    .local v1, "value":S
    const/4 v2, 0x1

    :try_start_0
    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    aput-object p2, v2, v3

    const/4 v3, 0x0

    invoke-virtual {p0, p1, v2, p3, v3}, Lcom/robotoworks/mechanoid/db/SQuery;->select(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;Z)Landroid/database/Cursor;

    move-result-object v0

    .line 965
    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 966
    const/4 v2, 0x0

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getShort(I)S
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v1

    .line 970
    :cond_0
    invoke-static {v0}, Lcom/robotoworks/mechanoid/util/Closeables;->closeSilently(Landroid/database/Cursor;)V

    .line 973
    return v1

    .line 970
    :catchall_0
    move-exception v2

    invoke-static {v0}, Lcom/robotoworks/mechanoid/util/Closeables;->closeSilently(Landroid/database/Cursor;)V

    throw v2
.end method

.method public firstString(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p2, "table"    # Ljava/lang/String;
    .param p3, "column"    # Ljava/lang/String;

    .prologue
    .line 560
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/robotoworks/mechanoid/db/SQuery;->firstString(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public firstString(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 8
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p2, "table"    # Ljava/lang/String;
    .param p3, "column"    # Ljava/lang/String;
    .param p4, "orderBy"    # Ljava/lang/String;

    .prologue
    .line 564
    const/4 v6, 0x0

    .line 565
    .local v6, "cursor":Landroid/database/Cursor;
    const/4 v7, 0x0

    .line 567
    .local v7, "value":Ljava/lang/String;
    const/4 v0, 0x1

    :try_start_0
    new-array v3, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    aput-object p3, v3, v0

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v4, p4

    invoke-virtual/range {v0 .. v5}, Lcom/robotoworks/mechanoid/db/SQuery;->query(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 569
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 570
    const/4 v0, 0x0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v7

    .line 574
    :cond_0
    invoke-static {v6}, Lcom/robotoworks/mechanoid/util/Closeables;->closeSilently(Landroid/database/Cursor;)V

    .line 577
    return-object v7

    .line 574
    :catchall_0
    move-exception v0

    invoke-static {v6}, Lcom/robotoworks/mechanoid/util/Closeables;->closeSilently(Landroid/database/Cursor;)V

    throw v0
.end method

.method public firstString(Landroid/net/Uri;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "column"    # Ljava/lang/String;

    .prologue
    .line 1007
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/robotoworks/mechanoid/db/SQuery;->firstString(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public firstString(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "column"    # Ljava/lang/String;
    .param p3, "orderBy"    # Ljava/lang/String;

    .prologue
    .line 1011
    const/4 v0, 0x0

    .line 1012
    .local v0, "cursor":Landroid/database/Cursor;
    const/4 v1, 0x0

    .line 1015
    .local v1, "value":Ljava/lang/String;
    const/4 v2, 0x1

    :try_start_0
    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    aput-object p2, v2, v3

    const/4 v3, 0x0

    invoke-virtual {p0, p1, v2, p3, v3}, Lcom/robotoworks/mechanoid/db/SQuery;->select(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;Z)Landroid/database/Cursor;

    move-result-object v0

    .line 1017
    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1018
    const/4 v2, 0x0

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    .line 1022
    :cond_0
    invoke-static {v0}, Lcom/robotoworks/mechanoid/util/Closeables;->closeSilently(Landroid/database/Cursor;)V

    .line 1025
    return-object v1

    .line 1022
    :catchall_0
    move-exception v2

    invoke-static {v0}, Lcom/robotoworks/mechanoid/util/Closeables;->closeSilently(Landroid/database/Cursor;)V

    throw v2
.end method

.method public getArgs()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 174
    iget-object v0, p0, Lcom/robotoworks/mechanoid/db/SQuery;->mArgs:Ljava/util/List;

    return-object v0
.end method

.method public getArgsArray()[Ljava/lang/String;
    .locals 2

    .prologue
    .line 181
    iget-object v0, p0, Lcom/robotoworks/mechanoid/db/SQuery;->mArgs:Ljava/util/List;

    iget-object v1, p0, Lcom/robotoworks/mechanoid/db/SQuery;->mArgs:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    new-array v1, v1, [Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    return-object v0
.end method

.method public opt(Ljava/lang/String;Ljava/lang/String;D)Lcom/robotoworks/mechanoid/db/SQuery;
    .locals 3
    .param p1, "column"    # Ljava/lang/String;
    .param p2, "op"    # Ljava/lang/String;
    .param p3, "arg"    # D

    .prologue
    .line 366
    const-wide/16 v0, 0x0

    cmpl-double v0, p3, v0

    if-nez v0, :cond_0

    .line 369
    .end local p0    # "this":Lcom/robotoworks/mechanoid/db/SQuery;
    :goto_0
    return-object p0

    .restart local p0    # "this":Lcom/robotoworks/mechanoid/db/SQuery;
    :cond_0
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/robotoworks/mechanoid/db/SQuery;->expr(Ljava/lang/String;Ljava/lang/String;D)Lcom/robotoworks/mechanoid/db/SQuery;

    move-result-object p0

    goto :goto_0
.end method

.method public opt(Ljava/lang/String;Ljava/lang/String;F)Lcom/robotoworks/mechanoid/db/SQuery;
    .locals 1
    .param p1, "column"    # Ljava/lang/String;
    .param p2, "op"    # Ljava/lang/String;
    .param p3, "arg"    # F

    .prologue
    .line 359
    const/4 v0, 0x0

    cmpl-float v0, p3, v0

    if-nez v0, :cond_0

    .line 362
    .end local p0    # "this":Lcom/robotoworks/mechanoid/db/SQuery;
    :goto_0
    return-object p0

    .restart local p0    # "this":Lcom/robotoworks/mechanoid/db/SQuery;
    :cond_0
    invoke-virtual {p0, p1, p2, p3}, Lcom/robotoworks/mechanoid/db/SQuery;->expr(Ljava/lang/String;Ljava/lang/String;F)Lcom/robotoworks/mechanoid/db/SQuery;

    move-result-object p0

    goto :goto_0
.end method

.method public opt(Ljava/lang/String;Ljava/lang/String;I)Lcom/robotoworks/mechanoid/db/SQuery;
    .locals 1
    .param p1, "column"    # Ljava/lang/String;
    .param p2, "op"    # Ljava/lang/String;
    .param p3, "arg"    # I

    .prologue
    .line 338
    if-nez p3, :cond_0

    .line 341
    .end local p0    # "this":Lcom/robotoworks/mechanoid/db/SQuery;
    :goto_0
    return-object p0

    .restart local p0    # "this":Lcom/robotoworks/mechanoid/db/SQuery;
    :cond_0
    invoke-static {p3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, p2, v0}, Lcom/robotoworks/mechanoid/db/SQuery;->expr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/robotoworks/mechanoid/db/SQuery;

    move-result-object p0

    goto :goto_0
.end method

.method public opt(Ljava/lang/String;Ljava/lang/String;J)Lcom/robotoworks/mechanoid/db/SQuery;
    .locals 3
    .param p1, "column"    # Ljava/lang/String;
    .param p2, "op"    # Ljava/lang/String;
    .param p3, "arg"    # J

    .prologue
    .line 352
    const-wide/16 v0, 0x0

    cmp-long v0, p3, v0

    if-nez v0, :cond_0

    .line 355
    .end local p0    # "this":Lcom/robotoworks/mechanoid/db/SQuery;
    :goto_0
    return-object p0

    .restart local p0    # "this":Lcom/robotoworks/mechanoid/db/SQuery;
    :cond_0
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/robotoworks/mechanoid/db/SQuery;->expr(Ljava/lang/String;Ljava/lang/String;J)Lcom/robotoworks/mechanoid/db/SQuery;

    move-result-object p0

    goto :goto_0
.end method

.method public opt(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/robotoworks/mechanoid/db/SQuery;
    .locals 0
    .param p1, "column"    # Ljava/lang/String;
    .param p2, "op"    # Ljava/lang/String;
    .param p3, "arg"    # Ljava/lang/String;

    .prologue
    .line 330
    if-nez p3, :cond_0

    .line 334
    .end local p0    # "this":Lcom/robotoworks/mechanoid/db/SQuery;
    :goto_0
    return-object p0

    .restart local p0    # "this":Lcom/robotoworks/mechanoid/db/SQuery;
    :cond_0
    invoke-virtual {p0, p1, p2, p3}, Lcom/robotoworks/mechanoid/db/SQuery;->expr(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/robotoworks/mechanoid/db/SQuery;

    move-result-object p0

    goto :goto_0
.end method

.method public opt(Ljava/lang/String;Ljava/lang/String;Z)Lcom/robotoworks/mechanoid/db/SQuery;
    .locals 0
    .param p1, "column"    # Ljava/lang/String;
    .param p2, "op"    # Ljava/lang/String;
    .param p3, "arg"    # Z

    .prologue
    .line 345
    if-nez p3, :cond_0

    .line 348
    .end local p0    # "this":Lcom/robotoworks/mechanoid/db/SQuery;
    :goto_0
    return-object p0

    .restart local p0    # "this":Lcom/robotoworks/mechanoid/db/SQuery;
    :cond_0
    invoke-virtual {p0, p1, p2, p3}, Lcom/robotoworks/mechanoid/db/SQuery;->expr(Ljava/lang/String;Ljava/lang/String;Z)Lcom/robotoworks/mechanoid/db/SQuery;

    move-result-object p0

    goto :goto_0
.end method

.method public or()Lcom/robotoworks/mechanoid/db/SQuery;
    .locals 1

    .prologue
    .line 398
    const-string v0, " OR "

    iput-object v0, p0, Lcom/robotoworks/mechanoid/db/SQuery;->mNextOp:Ljava/lang/String;

    .line 400
    return-object p0
.end method

.method public query(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    .locals 8
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p2, "table"    # Ljava/lang/String;
    .param p3, "projection"    # [Ljava/lang/String;
    .param p4, "orderBy"    # Ljava/lang/String;
    .param p5, "groupBy"    # Ljava/lang/String;

    .prologue
    .line 422
    iget-object v0, p0, Lcom/robotoworks/mechanoid/db/SQuery;->mBuilder:Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/db/SQuery;->getArgsArray()[Ljava/lang/String;

    move-result-object v4

    const/4 v6, 0x0

    move-object v0, p1

    move-object v1, p2

    move-object v2, p3

    move-object v5, p5

    move-object v7, p4

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    return-object v0
.end method

.method public select(Landroid/net/Uri;[Ljava/lang/String;)Landroid/database/Cursor;
    .locals 1
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "projection"    # [Ljava/lang/String;

    .prologue
    .line 744
    const/4 v0, 0x0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {p0, p1, p2, v0}, Lcom/robotoworks/mechanoid/db/SQuery;->select(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    return-object v0
.end method

.method public select(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    .locals 6
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "projection"    # [Ljava/lang/String;
    .param p3, "sortOrder"    # Ljava/lang/String;

    .prologue
    .line 713
    invoke-static {}, Lcom/robotoworks/mechanoid/Mechanoid;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 715
    .local v0, "resolver":Landroid/content/ContentResolver;
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/db/SQuery;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/db/SQuery;->getArgsArray()[Ljava/lang/String;

    move-result-object v4

    move-object v1, p1

    move-object v2, p2

    move-object v5, p3

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    return-object v1
.end method

.method public select(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;Z)Landroid/database/Cursor;
    .locals 6
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "projection"    # [Ljava/lang/String;
    .param p3, "sortOrder"    # Ljava/lang/String;
    .param p4, "enableNotifications"    # Z

    .prologue
    .line 727
    invoke-static {}, Lcom/robotoworks/mechanoid/Mechanoid;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 729
    .local v0, "resolver":Landroid/content/ContentResolver;
    invoke-virtual {p1}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v1

    const-string v2, "mechdb_notify"

    invoke-static {p4}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p1

    .line 731
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/db/SQuery;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/db/SQuery;->getArgsArray()[Ljava/lang/String;

    move-result-object v4

    move-object v1, p1

    move-object v2, p2

    move-object v5, p3

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    return-object v1
.end method

.method public varargs select(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;Z[Ljava/lang/String;)Landroid/database/Cursor;
    .locals 6
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "projection"    # [Ljava/lang/String;
    .param p3, "sortOrder"    # Ljava/lang/String;
    .param p4, "enableNotifications"    # Z
    .param p5, "groupBy"    # [Ljava/lang/String;

    .prologue
    .line 735
    invoke-static {}, Lcom/robotoworks/mechanoid/Mechanoid;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 737
    .local v0, "resolver":Landroid/content/ContentResolver;
    invoke-virtual {p1}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v1

    const-string v2, "mechdb_notify"

    invoke-static {p4}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p1

    .line 738
    invoke-direct {p0, p1, p5}, Lcom/robotoworks/mechanoid/db/SQuery;->appendGroupByToUri(Landroid/net/Uri;[Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    .line 740
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/db/SQuery;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/db/SQuery;->getArgsArray()[Ljava/lang/String;

    move-result-object v4

    move-object v1, p1

    move-object v2, p2

    move-object v5, p3

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    return-object v1
.end method

.method public varargs select(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;
    .locals 6
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "projection"    # [Ljava/lang/String;
    .param p3, "sortOrder"    # Ljava/lang/String;
    .param p4, "groupBy"    # [Ljava/lang/String;

    .prologue
    .line 719
    invoke-static {}, Lcom/robotoworks/mechanoid/Mechanoid;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 721
    .local v0, "resolver":Landroid/content/ContentResolver;
    invoke-direct {p0, p1, p4}, Lcom/robotoworks/mechanoid/db/SQuery;->appendGroupByToUri(Landroid/net/Uri;[Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    .line 723
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/db/SQuery;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/db/SQuery;->getArgsArray()[Ljava/lang/String;

    move-result-object v4

    move-object v1, p1

    move-object v2, p2

    move-object v5, p3

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    return-object v1
.end method

.method public select(Landroid/net/Uri;[Ljava/lang/String;Z)Landroid/database/Cursor;
    .locals 1
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "projection"    # [Ljava/lang/String;
    .param p3, "enableNotifications"    # Z

    .prologue
    .line 753
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0, p3}, Lcom/robotoworks/mechanoid/db/SQuery;->select(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;Z)Landroid/database/Cursor;

    move-result-object v0

    return-object v0
.end method

.method public varargs select(Landroid/net/Uri;[Ljava/lang/String;Z[Ljava/lang/String;)Landroid/database/Cursor;
    .locals 6
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "projection"    # [Ljava/lang/String;
    .param p3, "enableNotifications"    # Z
    .param p4, "groupBy"    # [Ljava/lang/String;

    .prologue
    .line 757
    const/4 v3, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v4, p3

    move-object v5, p4

    invoke-virtual/range {v0 .. v5}, Lcom/robotoworks/mechanoid/db/SQuery;->select(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;Z[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    return-object v0
.end method

.method public varargs select(Landroid/net/Uri;[Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;
    .locals 1
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "projection"    # [Ljava/lang/String;
    .param p3, "groupBy"    # [Ljava/lang/String;

    .prologue
    .line 748
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0, p3}, Lcom/robotoworks/mechanoid/db/SQuery;->select(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    return-object v0
.end method

.method public select(Landroid/net/Uri;)Ljava/util/List;
    .locals 3
    .param p1, "uri"    # Landroid/net/Uri;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/robotoworks/mechanoid/db/ActiveRecord;",
            ">(",
            "Landroid/net/Uri;",
            ")",
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 595
    invoke-direct {p0, p1}, Lcom/robotoworks/mechanoid/db/SQuery;->getContentProvider(Landroid/net/Uri;)Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;

    move-result-object v0

    .line 597
    .local v0, "provider":Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;
    const/4 v2, 0x0

    invoke-virtual {v0, p1, p0, v2}, Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;->selectRecords(Landroid/net/Uri;Lcom/robotoworks/mechanoid/db/SQuery;Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    .line 599
    .local v1, "records":Ljava/util/List;, "Ljava/util/List<TT;>;"
    return-object v1
.end method

.method public select(Landroid/net/Uri;Ljava/lang/String;)Ljava/util/List;
    .locals 2
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "sortOrder"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/robotoworks/mechanoid/db/ActiveRecord;",
            ">(",
            "Landroid/net/Uri;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 609
    invoke-direct {p0, p1}, Lcom/robotoworks/mechanoid/db/SQuery;->getContentProvider(Landroid/net/Uri;)Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;

    move-result-object v0

    .line 611
    .local v0, "provider":Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;
    invoke-virtual {v0, p1, p0, p2}, Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;->selectRecords(Landroid/net/Uri;Lcom/robotoworks/mechanoid/db/SQuery;Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    .line 613
    .local v1, "records":Ljava/util/List;, "Ljava/util/List<TT;>;"
    return-object v1
.end method

.method public varargs select(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)Ljava/util/List;
    .locals 2
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "sortOrder"    # Ljava/lang/String;
    .param p3, "groupBy"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/robotoworks/mechanoid/db/ActiveRecord;",
            ">(",
            "Landroid/net/Uri;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 623
    invoke-direct {p0, p1, p3}, Lcom/robotoworks/mechanoid/db/SQuery;->appendGroupByToUri(Landroid/net/Uri;[Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    .line 624
    invoke-direct {p0, p1}, Lcom/robotoworks/mechanoid/db/SQuery;->getContentProvider(Landroid/net/Uri;)Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;

    move-result-object v0

    .line 626
    .local v0, "provider":Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;
    invoke-virtual {v0, p1, p0, p2}, Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;->selectRecords(Landroid/net/Uri;Lcom/robotoworks/mechanoid/db/SQuery;Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    .line 628
    .local v1, "records":Ljava/util/List;, "Ljava/util/List<TT;>;"
    return-object v1
.end method

.method public selectBlobArray(Landroid/net/Uri;Ljava/lang/String;)[[B
    .locals 1
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "column"    # Ljava/lang/String;

    .prologue
    .line 1149
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/robotoworks/mechanoid/db/SQuery;->selectBlobArray(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)[[B

    move-result-object v0

    return-object v0
.end method

.method public selectBlobArray(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)[[B
    .locals 5
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "column"    # Ljava/lang/String;
    .param p3, "orderBy"    # Ljava/lang/String;

    .prologue
    .line 1153
    const/4 v1, 0x0

    .line 1156
    .local v1, "cursor":Landroid/database/Cursor;
    const/4 v3, 0x1

    :try_start_0
    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    aput-object p2, v3, v4

    const/4 v4, 0x0

    invoke-virtual {p0, p1, v3, p3, v4}, Lcom/robotoworks/mechanoid/db/SQuery;->select(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;Z)Landroid/database/Cursor;

    move-result-object v1

    .line 1158
    invoke-interface {v1}, Landroid/database/Cursor;->getCount()I

    move-result v3

    new-array v0, v3, [[B

    .line 1160
    .local v0, "array":[[B
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-interface {v1}, Landroid/database/Cursor;->getCount()I

    move-result v3

    if-ge v2, v3, :cond_0

    .line 1161
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z

    .line 1162
    const/4 v3, 0x0

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v3

    aput-object v3, v0, v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1160
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1168
    :cond_0
    invoke-static {v1}, Lcom/robotoworks/mechanoid/util/Closeables;->closeSilently(Landroid/database/Cursor;)V

    return-object v0

    .end local v0    # "array":[[B
    .end local v2    # "i":I
    :catchall_0
    move-exception v3

    invoke-static {v1}, Lcom/robotoworks/mechanoid/util/Closeables;->closeSilently(Landroid/database/Cursor;)V

    throw v3
.end method

.method public selectBlobList(Landroid/net/Uri;Ljava/lang/String;)Ljava/util/List;
    .locals 1
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "column"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/net/Uri;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<[B>;"
        }
    .end annotation

    .prologue
    .line 1341
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/robotoworks/mechanoid/db/SQuery;->selectBlobList(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public selectBlobList(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;
    .locals 5
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "column"    # Ljava/lang/String;
    .param p3, "orderBy"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/net/Uri;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<[B>;"
        }
    .end annotation

    .prologue
    .line 1345
    const/4 v0, 0x0

    .line 1348
    .local v0, "cursor":Landroid/database/Cursor;
    const/4 v3, 0x1

    :try_start_0
    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    aput-object p2, v3, v4

    const/4 v4, 0x0

    invoke-virtual {p0, p1, v3, p3, v4}, Lcom/robotoworks/mechanoid/db/SQuery;->select(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;Z)Landroid/database/Cursor;

    move-result-object v0

    .line 1350
    new-instance v2, Ljava/util/ArrayList;

    invoke-interface {v0}, Landroid/database/Cursor;->getCount()I

    move-result v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 1352
    .local v2, "list":Ljava/util/List;, "Ljava/util/List<[B>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-interface {v0}, Landroid/database/Cursor;->getCount()I

    move-result v3

    if-ge v1, v3, :cond_0

    .line 1353
    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z

    .line 1354
    const/4 v3, 0x0

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1352
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1360
    :cond_0
    invoke-static {v0}, Lcom/robotoworks/mechanoid/util/Closeables;->closeSilently(Landroid/database/Cursor;)V

    return-object v2

    .end local v1    # "i":I
    .end local v2    # "list":Ljava/util/List;, "Ljava/util/List<[B>;"
    :catchall_0
    move-exception v3

    invoke-static {v0}, Lcom/robotoworks/mechanoid/util/Closeables;->closeSilently(Landroid/database/Cursor;)V

    throw v3
.end method

.method public selectBooleanArray(Landroid/net/Uri;Ljava/lang/String;)[Z
    .locals 1
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "column"    # Ljava/lang/String;

    .prologue
    .line 1173
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/robotoworks/mechanoid/db/SQuery;->selectBooleanArray(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)[Z

    move-result-object v0

    return-object v0
.end method

.method public selectBooleanArray(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)[Z
    .locals 10
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "column"    # Ljava/lang/String;
    .param p3, "orderBy"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 1177
    const/4 v1, 0x0

    .line 1180
    .local v1, "cursor":Landroid/database/Cursor;
    const/4 v3, 0x1

    :try_start_0
    new-array v3, v3, [Ljava/lang/String;

    const/4 v6, 0x0

    aput-object p2, v3, v6

    const/4 v6, 0x0

    invoke-virtual {p0, p1, v3, p3, v6}, Lcom/robotoworks/mechanoid/db/SQuery;->select(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;Z)Landroid/database/Cursor;

    move-result-object v1

    .line 1182
    invoke-interface {v1}, Landroid/database/Cursor;->getCount()I

    move-result v3

    new-array v0, v3, [Z

    .line 1184
    .local v0, "array":[Z
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-interface {v1}, Landroid/database/Cursor;->getCount()I

    move-result v3

    if-ge v2, v3, :cond_1

    .line 1185
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z

    .line 1186
    const/4 v3, 0x0

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v6

    const-wide/16 v8, 0x0

    cmp-long v3, v6, v8

    if-lez v3, :cond_0

    move v3, v4

    :goto_1
    aput-boolean v3, v0, v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1184
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    move v3, v5

    .line 1186
    goto :goto_1

    .line 1192
    :cond_1
    invoke-static {v1}, Lcom/robotoworks/mechanoid/util/Closeables;->closeSilently(Landroid/database/Cursor;)V

    return-object v0

    .end local v0    # "array":[Z
    .end local v2    # "i":I
    :catchall_0
    move-exception v3

    invoke-static {v1}, Lcom/robotoworks/mechanoid/util/Closeables;->closeSilently(Landroid/database/Cursor;)V

    throw v3
.end method

.method public selectBooleanList(Landroid/net/Uri;Ljava/lang/String;)Ljava/util/List;
    .locals 1
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "column"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/net/Uri;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1365
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/robotoworks/mechanoid/db/SQuery;->selectBooleanList(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public selectBooleanList(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;
    .locals 10
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "column"    # Ljava/lang/String;
    .param p3, "orderBy"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/net/Uri;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 1369
    const/4 v0, 0x0

    .line 1372
    .local v0, "cursor":Landroid/database/Cursor;
    const/4 v3, 0x1

    :try_start_0
    new-array v3, v3, [Ljava/lang/String;

    const/4 v6, 0x0

    aput-object p2, v3, v6

    const/4 v6, 0x0

    invoke-virtual {p0, p1, v3, p3, v6}, Lcom/robotoworks/mechanoid/db/SQuery;->select(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;Z)Landroid/database/Cursor;

    move-result-object v0

    .line 1374
    new-instance v2, Ljava/util/ArrayList;

    invoke-interface {v0}, Landroid/database/Cursor;->getCount()I

    move-result v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 1376
    .local v2, "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Boolean;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-interface {v0}, Landroid/database/Cursor;->getCount()I

    move-result v3

    if-ge v1, v3, :cond_1

    .line 1377
    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z

    .line 1378
    const/4 v3, 0x0

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v6

    const-wide/16 v8, 0x0

    cmp-long v3, v6, v8

    if-lez v3, :cond_0

    move v3, v4

    :goto_1
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1376
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    move v3, v5

    .line 1378
    goto :goto_1

    .line 1384
    :cond_1
    invoke-static {v0}, Lcom/robotoworks/mechanoid/util/Closeables;->closeSilently(Landroid/database/Cursor;)V

    return-object v2

    .end local v1    # "i":I
    .end local v2    # "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Boolean;>;"
    :catchall_0
    move-exception v3

    invoke-static {v0}, Lcom/robotoworks/mechanoid/util/Closeables;->closeSilently(Landroid/database/Cursor;)V

    throw v3
.end method

.method public selectDoubleArray(Landroid/net/Uri;Ljava/lang/String;)[D
    .locals 1
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "column"    # Ljava/lang/String;

    .prologue
    .line 1077
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/robotoworks/mechanoid/db/SQuery;->selectDoubleArray(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)[D

    move-result-object v0

    return-object v0
.end method

.method public selectDoubleArray(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)[D
    .locals 6
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "column"    # Ljava/lang/String;
    .param p3, "orderBy"    # Ljava/lang/String;

    .prologue
    .line 1081
    const/4 v1, 0x0

    .line 1084
    .local v1, "cursor":Landroid/database/Cursor;
    const/4 v3, 0x1

    :try_start_0
    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    aput-object p2, v3, v4

    const/4 v4, 0x0

    invoke-virtual {p0, p1, v3, p3, v4}, Lcom/robotoworks/mechanoid/db/SQuery;->select(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;Z)Landroid/database/Cursor;

    move-result-object v1

    .line 1086
    invoke-interface {v1}, Landroid/database/Cursor;->getCount()I

    move-result v3

    new-array v0, v3, [D

    .line 1088
    .local v0, "array":[D
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-interface {v1}, Landroid/database/Cursor;->getCount()I

    move-result v3

    if-ge v2, v3, :cond_0

    .line 1089
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z

    .line 1090
    const/4 v3, 0x0

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getDouble(I)D

    move-result-wide v4

    aput-wide v4, v0, v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1088
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1096
    :cond_0
    invoke-static {v1}, Lcom/robotoworks/mechanoid/util/Closeables;->closeSilently(Landroid/database/Cursor;)V

    return-object v0

    .end local v0    # "array":[D
    .end local v2    # "i":I
    :catchall_0
    move-exception v3

    invoke-static {v1}, Lcom/robotoworks/mechanoid/util/Closeables;->closeSilently(Landroid/database/Cursor;)V

    throw v3
.end method

.method public selectDoubleList(Landroid/net/Uri;Ljava/lang/String;)Ljava/util/List;
    .locals 1
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "column"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/net/Uri;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Double;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1269
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/robotoworks/mechanoid/db/SQuery;->selectDoubleList(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public selectDoubleList(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;
    .locals 6
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "column"    # Ljava/lang/String;
    .param p3, "orderBy"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/net/Uri;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Double;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1273
    const/4 v0, 0x0

    .line 1276
    .local v0, "cursor":Landroid/database/Cursor;
    const/4 v3, 0x1

    :try_start_0
    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    aput-object p2, v3, v4

    const/4 v4, 0x0

    invoke-virtual {p0, p1, v3, p3, v4}, Lcom/robotoworks/mechanoid/db/SQuery;->select(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;Z)Landroid/database/Cursor;

    move-result-object v0

    .line 1278
    new-instance v2, Ljava/util/ArrayList;

    invoke-interface {v0}, Landroid/database/Cursor;->getCount()I

    move-result v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 1280
    .local v2, "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Double;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-interface {v0}, Landroid/database/Cursor;->getCount()I

    move-result v3

    if-ge v1, v3, :cond_0

    .line 1281
    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z

    .line 1282
    const/4 v3, 0x0

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getDouble(I)D

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1280
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1288
    :cond_0
    invoke-static {v0}, Lcom/robotoworks/mechanoid/util/Closeables;->closeSilently(Landroid/database/Cursor;)V

    return-object v2

    .end local v1    # "i":I
    .end local v2    # "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Double;>;"
    :catchall_0
    move-exception v3

    invoke-static {v0}, Lcom/robotoworks/mechanoid/util/Closeables;->closeSilently(Landroid/database/Cursor;)V

    throw v3
.end method

.method public selectFirst(Landroid/net/Uri;)Lcom/robotoworks/mechanoid/db/ActiveRecord;
    .locals 4
    .param p1, "uri"    # Landroid/net/Uri;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/robotoworks/mechanoid/db/ActiveRecord;",
            ">(",
            "Landroid/net/Uri;",
            ")TT;"
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 687
    invoke-direct {p0, p1}, Lcom/robotoworks/mechanoid/db/SQuery;->getContentProvider(Landroid/net/Uri;)Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;

    move-result-object v0

    .line 689
    .local v0, "provider":Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;
    invoke-virtual {v0, p1, p0, v2}, Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;->selectRecords(Landroid/net/Uri;Lcom/robotoworks/mechanoid/db/SQuery;Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    .line 691
    .local v1, "records":Ljava/util/List;, "Ljava/util/List<TT;>;"
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v3

    if-lez v3, :cond_0

    .line 692
    const/4 v2, 0x0

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/robotoworks/mechanoid/db/ActiveRecord;

    .line 694
    :cond_0
    return-object v2
.end method

.method public selectFirst(Landroid/net/Uri;Ljava/lang/String;)Lcom/robotoworks/mechanoid/db/ActiveRecord;
    .locals 3
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "sortOrder"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/robotoworks/mechanoid/db/ActiveRecord;",
            ">(",
            "Landroid/net/Uri;",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 670
    invoke-direct {p0, p1}, Lcom/robotoworks/mechanoid/db/SQuery;->getContentProvider(Landroid/net/Uri;)Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;

    move-result-object v0

    .line 672
    .local v0, "provider":Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;
    invoke-virtual {v0, p1, p0, p2}, Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;->selectRecords(Landroid/net/Uri;Lcom/robotoworks/mechanoid/db/SQuery;Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    .line 674
    .local v1, "records":Ljava/util/List;, "Ljava/util/List<TT;>;"
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    if-lez v2, :cond_0

    .line 675
    const/4 v2, 0x0

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/robotoworks/mechanoid/db/ActiveRecord;

    .line 677
    :goto_0
    return-object v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public selectFloatArray(Landroid/net/Uri;Ljava/lang/String;)[F
    .locals 1
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "column"    # Ljava/lang/String;

    .prologue
    .line 1101
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/robotoworks/mechanoid/db/SQuery;->selectFloatArray(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)[F

    move-result-object v0

    return-object v0
.end method

.method public selectFloatArray(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)[F
    .locals 5
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "column"    # Ljava/lang/String;
    .param p3, "orderBy"    # Ljava/lang/String;

    .prologue
    .line 1105
    const/4 v1, 0x0

    .line 1108
    .local v1, "cursor":Landroid/database/Cursor;
    const/4 v3, 0x1

    :try_start_0
    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    aput-object p2, v3, v4

    const/4 v4, 0x0

    invoke-virtual {p0, p1, v3, p3, v4}, Lcom/robotoworks/mechanoid/db/SQuery;->select(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;Z)Landroid/database/Cursor;

    move-result-object v1

    .line 1110
    invoke-interface {v1}, Landroid/database/Cursor;->getCount()I

    move-result v3

    new-array v0, v3, [F

    .line 1112
    .local v0, "array":[F
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-interface {v1}, Landroid/database/Cursor;->getCount()I

    move-result v3

    if-ge v2, v3, :cond_0

    .line 1113
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z

    .line 1114
    const/4 v3, 0x0

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getFloat(I)F

    move-result v3

    aput v3, v0, v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1112
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1120
    :cond_0
    invoke-static {v1}, Lcom/robotoworks/mechanoid/util/Closeables;->closeSilently(Landroid/database/Cursor;)V

    return-object v0

    .end local v0    # "array":[F
    .end local v2    # "i":I
    :catchall_0
    move-exception v3

    invoke-static {v1}, Lcom/robotoworks/mechanoid/util/Closeables;->closeSilently(Landroid/database/Cursor;)V

    throw v3
.end method

.method public selectFloatList(Landroid/net/Uri;Ljava/lang/String;)Ljava/util/List;
    .locals 1
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "column"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/net/Uri;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1293
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/robotoworks/mechanoid/db/SQuery;->selectFloatList(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public selectFloatList(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;
    .locals 5
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "column"    # Ljava/lang/String;
    .param p3, "orderBy"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/net/Uri;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1297
    const/4 v0, 0x0

    .line 1300
    .local v0, "cursor":Landroid/database/Cursor;
    const/4 v3, 0x1

    :try_start_0
    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    aput-object p2, v3, v4

    const/4 v4, 0x0

    invoke-virtual {p0, p1, v3, p3, v4}, Lcom/robotoworks/mechanoid/db/SQuery;->select(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;Z)Landroid/database/Cursor;

    move-result-object v0

    .line 1302
    new-instance v2, Ljava/util/ArrayList;

    invoke-interface {v0}, Landroid/database/Cursor;->getCount()I

    move-result v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 1304
    .local v2, "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-interface {v0}, Landroid/database/Cursor;->getCount()I

    move-result v3

    if-ge v1, v3, :cond_0

    .line 1305
    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z

    .line 1306
    const/4 v3, 0x0

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getFloat(I)F

    move-result v3

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1304
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1312
    :cond_0
    invoke-static {v0}, Lcom/robotoworks/mechanoid/util/Closeables;->closeSilently(Landroid/database/Cursor;)V

    return-object v2

    .end local v1    # "i":I
    .end local v2    # "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    :catchall_0
    move-exception v3

    invoke-static {v0}, Lcom/robotoworks/mechanoid/util/Closeables;->closeSilently(Landroid/database/Cursor;)V

    throw v3
.end method

.method public selectIntArray(Landroid/net/Uri;Ljava/lang/String;)[I
    .locals 1
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "column"    # Ljava/lang/String;

    .prologue
    .line 1029
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/robotoworks/mechanoid/db/SQuery;->selectIntArray(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)[I

    move-result-object v0

    return-object v0
.end method

.method public selectIntArray(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)[I
    .locals 5
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "column"    # Ljava/lang/String;
    .param p3, "orderBy"    # Ljava/lang/String;

    .prologue
    .line 1033
    const/4 v1, 0x0

    .line 1036
    .local v1, "cursor":Landroid/database/Cursor;
    const/4 v3, 0x1

    :try_start_0
    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    aput-object p2, v3, v4

    const/4 v4, 0x0

    invoke-virtual {p0, p1, v3, p3, v4}, Lcom/robotoworks/mechanoid/db/SQuery;->select(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;Z)Landroid/database/Cursor;

    move-result-object v1

    .line 1038
    invoke-interface {v1}, Landroid/database/Cursor;->getCount()I

    move-result v3

    new-array v0, v3, [I

    .line 1040
    .local v0, "array":[I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-interface {v1}, Landroid/database/Cursor;->getCount()I

    move-result v3

    if-ge v2, v3, :cond_0

    .line 1041
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z

    .line 1042
    const/4 v3, 0x0

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    aput v3, v0, v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1040
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1048
    :cond_0
    invoke-static {v1}, Lcom/robotoworks/mechanoid/util/Closeables;->closeSilently(Landroid/database/Cursor;)V

    return-object v0

    .end local v0    # "array":[I
    .end local v2    # "i":I
    :catchall_0
    move-exception v3

    invoke-static {v1}, Lcom/robotoworks/mechanoid/util/Closeables;->closeSilently(Landroid/database/Cursor;)V

    throw v3
.end method

.method public selectIntegerList(Landroid/net/Uri;Ljava/lang/String;)Ljava/util/List;
    .locals 1
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "column"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/net/Uri;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1221
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/robotoworks/mechanoid/db/SQuery;->selectIntegerList(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public selectIntegerList(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;
    .locals 5
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "column"    # Ljava/lang/String;
    .param p3, "orderBy"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/net/Uri;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1225
    const/4 v0, 0x0

    .line 1228
    .local v0, "cursor":Landroid/database/Cursor;
    const/4 v3, 0x1

    :try_start_0
    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    aput-object p2, v3, v4

    const/4 v4, 0x0

    invoke-virtual {p0, p1, v3, p3, v4}, Lcom/robotoworks/mechanoid/db/SQuery;->select(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;Z)Landroid/database/Cursor;

    move-result-object v0

    .line 1230
    new-instance v2, Ljava/util/ArrayList;

    invoke-interface {v0}, Landroid/database/Cursor;->getCount()I

    move-result v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 1232
    .local v2, "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-interface {v0}, Landroid/database/Cursor;->getCount()I

    move-result v3

    if-ge v1, v3, :cond_0

    .line 1233
    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z

    .line 1234
    const/4 v3, 0x0

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1232
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1240
    :cond_0
    invoke-static {v0}, Lcom/robotoworks/mechanoid/util/Closeables;->closeSilently(Landroid/database/Cursor;)V

    return-object v2

    .end local v1    # "i":I
    .end local v2    # "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    :catchall_0
    move-exception v3

    invoke-static {v0}, Lcom/robotoworks/mechanoid/util/Closeables;->closeSilently(Landroid/database/Cursor;)V

    throw v3
.end method

.method public selectLongArray(Landroid/net/Uri;Ljava/lang/String;)[J
    .locals 1
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "column"    # Ljava/lang/String;

    .prologue
    .line 1053
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/robotoworks/mechanoid/db/SQuery;->selectLongArray(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)[J

    move-result-object v0

    return-object v0
.end method

.method public selectLongArray(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)[J
    .locals 6
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "column"    # Ljava/lang/String;
    .param p3, "orderBy"    # Ljava/lang/String;

    .prologue
    .line 1057
    const/4 v1, 0x0

    .line 1060
    .local v1, "cursor":Landroid/database/Cursor;
    const/4 v3, 0x1

    :try_start_0
    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    aput-object p2, v3, v4

    const/4 v4, 0x0

    invoke-virtual {p0, p1, v3, p3, v4}, Lcom/robotoworks/mechanoid/db/SQuery;->select(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;Z)Landroid/database/Cursor;

    move-result-object v1

    .line 1062
    invoke-interface {v1}, Landroid/database/Cursor;->getCount()I

    move-result v3

    new-array v0, v3, [J

    .line 1064
    .local v0, "array":[J
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-interface {v1}, Landroid/database/Cursor;->getCount()I

    move-result v3

    if-ge v2, v3, :cond_0

    .line 1065
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z

    .line 1066
    const/4 v3, 0x0

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    aput-wide v4, v0, v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1064
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1072
    :cond_0
    invoke-static {v1}, Lcom/robotoworks/mechanoid/util/Closeables;->closeSilently(Landroid/database/Cursor;)V

    return-object v0

    .end local v0    # "array":[J
    .end local v2    # "i":I
    :catchall_0
    move-exception v3

    invoke-static {v1}, Lcom/robotoworks/mechanoid/util/Closeables;->closeSilently(Landroid/database/Cursor;)V

    throw v3
.end method

.method public selectLongList(Landroid/net/Uri;Ljava/lang/String;)Ljava/util/List;
    .locals 1
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "column"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/net/Uri;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1245
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/robotoworks/mechanoid/db/SQuery;->selectLongList(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public selectLongList(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;
    .locals 6
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "column"    # Ljava/lang/String;
    .param p3, "orderBy"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/net/Uri;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1249
    const/4 v0, 0x0

    .line 1252
    .local v0, "cursor":Landroid/database/Cursor;
    const/4 v3, 0x1

    :try_start_0
    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    aput-object p2, v3, v4

    const/4 v4, 0x0

    invoke-virtual {p0, p1, v3, p3, v4}, Lcom/robotoworks/mechanoid/db/SQuery;->select(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;Z)Landroid/database/Cursor;

    move-result-object v0

    .line 1254
    new-instance v2, Ljava/util/ArrayList;

    invoke-interface {v0}, Landroid/database/Cursor;->getCount()I

    move-result v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 1256
    .local v2, "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Long;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-interface {v0}, Landroid/database/Cursor;->getCount()I

    move-result v3

    if-ge v1, v3, :cond_0

    .line 1257
    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z

    .line 1258
    const/4 v3, 0x0

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1256
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1264
    :cond_0
    invoke-static {v0}, Lcom/robotoworks/mechanoid/util/Closeables;->closeSilently(Landroid/database/Cursor;)V

    return-object v2

    .end local v1    # "i":I
    .end local v2    # "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Long;>;"
    :catchall_0
    move-exception v3

    invoke-static {v0}, Lcom/robotoworks/mechanoid/util/Closeables;->closeSilently(Landroid/database/Cursor;)V

    throw v3
.end method

.method public varargs selectMap(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)Ljava/util/Map;
    .locals 2
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "keyColumnName"    # Ljava/lang/String;
    .param p3, "groupBy"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/robotoworks/mechanoid/db/ActiveRecord;",
            ">(",
            "Landroid/net/Uri;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "TT;>;"
        }
    .end annotation

    .prologue
    .line 655
    invoke-direct {p0, p1, p3}, Lcom/robotoworks/mechanoid/db/SQuery;->appendGroupByToUri(Landroid/net/Uri;[Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    .line 656
    invoke-direct {p0, p1}, Lcom/robotoworks/mechanoid/db/SQuery;->getContentProvider(Landroid/net/Uri;)Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;

    move-result-object v0

    .line 658
    .local v0, "provider":Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;
    invoke-virtual {v0, p1, p0, p2}, Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;->selectRecordMap(Landroid/net/Uri;Lcom/robotoworks/mechanoid/db/SQuery;Ljava/lang/String;)Ljava/util/Map;

    move-result-object v1

    .line 660
    .local v1, "records":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;TT;>;"
    return-object v1
.end method

.method public selectShortArray(Landroid/net/Uri;Ljava/lang/String;)[S
    .locals 1
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "column"    # Ljava/lang/String;

    .prologue
    .line 1125
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/robotoworks/mechanoid/db/SQuery;->selectShortArray(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)[S

    move-result-object v0

    return-object v0
.end method

.method public selectShortArray(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)[S
    .locals 5
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "column"    # Ljava/lang/String;
    .param p3, "orderBy"    # Ljava/lang/String;

    .prologue
    .line 1129
    const/4 v1, 0x0

    .line 1132
    .local v1, "cursor":Landroid/database/Cursor;
    const/4 v3, 0x1

    :try_start_0
    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    aput-object p2, v3, v4

    const/4 v4, 0x0

    invoke-virtual {p0, p1, v3, p3, v4}, Lcom/robotoworks/mechanoid/db/SQuery;->select(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;Z)Landroid/database/Cursor;

    move-result-object v1

    .line 1134
    invoke-interface {v1}, Landroid/database/Cursor;->getCount()I

    move-result v3

    new-array v0, v3, [S

    .line 1136
    .local v0, "array":[S
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-interface {v1}, Landroid/database/Cursor;->getCount()I

    move-result v3

    if-ge v2, v3, :cond_0

    .line 1137
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z

    .line 1138
    const/4 v3, 0x0

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getShort(I)S

    move-result v3

    aput-short v3, v0, v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1136
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1144
    :cond_0
    invoke-static {v1}, Lcom/robotoworks/mechanoid/util/Closeables;->closeSilently(Landroid/database/Cursor;)V

    return-object v0

    .end local v0    # "array":[S
    .end local v2    # "i":I
    :catchall_0
    move-exception v3

    invoke-static {v1}, Lcom/robotoworks/mechanoid/util/Closeables;->closeSilently(Landroid/database/Cursor;)V

    throw v3
.end method

.method public selectShortList(Landroid/net/Uri;Ljava/lang/String;)Ljava/util/List;
    .locals 1
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "column"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/net/Uri;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Short;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1317
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/robotoworks/mechanoid/db/SQuery;->selectShortList(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public selectShortList(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;
    .locals 5
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "column"    # Ljava/lang/String;
    .param p3, "orderBy"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/net/Uri;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Short;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1321
    const/4 v0, 0x0

    .line 1324
    .local v0, "cursor":Landroid/database/Cursor;
    const/4 v3, 0x1

    :try_start_0
    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    aput-object p2, v3, v4

    const/4 v4, 0x0

    invoke-virtual {p0, p1, v3, p3, v4}, Lcom/robotoworks/mechanoid/db/SQuery;->select(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;Z)Landroid/database/Cursor;

    move-result-object v0

    .line 1326
    new-instance v2, Ljava/util/ArrayList;

    invoke-interface {v0}, Landroid/database/Cursor;->getCount()I

    move-result v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 1328
    .local v2, "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Short;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-interface {v0}, Landroid/database/Cursor;->getCount()I

    move-result v3

    if-ge v1, v3, :cond_0

    .line 1329
    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z

    .line 1330
    const/4 v3, 0x0

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getShort(I)S

    move-result v3

    invoke-static {v3}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1328
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1336
    :cond_0
    invoke-static {v0}, Lcom/robotoworks/mechanoid/util/Closeables;->closeSilently(Landroid/database/Cursor;)V

    return-object v2

    .end local v1    # "i":I
    .end local v2    # "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Short;>;"
    :catchall_0
    move-exception v3

    invoke-static {v0}, Lcom/robotoworks/mechanoid/util/Closeables;->closeSilently(Landroid/database/Cursor;)V

    throw v3
.end method

.method public selectStringArray(Landroid/net/Uri;Ljava/lang/String;)[Ljava/lang/String;
    .locals 1
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "column"    # Ljava/lang/String;

    .prologue
    .line 1197
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/robotoworks/mechanoid/db/SQuery;->selectStringArray(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public selectStringArray(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;
    .locals 5
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "column"    # Ljava/lang/String;
    .param p3, "orderBy"    # Ljava/lang/String;

    .prologue
    .line 1201
    const/4 v1, 0x0

    .line 1204
    .local v1, "cursor":Landroid/database/Cursor;
    const/4 v3, 0x1

    :try_start_0
    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    aput-object p2, v3, v4

    const/4 v4, 0x0

    invoke-virtual {p0, p1, v3, p3, v4}, Lcom/robotoworks/mechanoid/db/SQuery;->select(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;Z)Landroid/database/Cursor;

    move-result-object v1

    .line 1206
    invoke-interface {v1}, Landroid/database/Cursor;->getCount()I

    move-result v3

    new-array v0, v3, [Ljava/lang/String;

    .line 1208
    .local v0, "array":[Ljava/lang/String;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-interface {v1}, Landroid/database/Cursor;->getCount()I

    move-result v3

    if-ge v2, v3, :cond_0

    .line 1209
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z

    .line 1210
    const/4 v3, 0x0

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v0, v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1208
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1216
    :cond_0
    invoke-static {v1}, Lcom/robotoworks/mechanoid/util/Closeables;->closeSilently(Landroid/database/Cursor;)V

    return-object v0

    .end local v0    # "array":[Ljava/lang/String;
    .end local v2    # "i":I
    :catchall_0
    move-exception v3

    invoke-static {v1}, Lcom/robotoworks/mechanoid/util/Closeables;->closeSilently(Landroid/database/Cursor;)V

    throw v3
.end method

.method public selectStringList(Landroid/net/Uri;Ljava/lang/String;)Ljava/util/List;
    .locals 1
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "column"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/net/Uri;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1389
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/robotoworks/mechanoid/db/SQuery;->selectStringList(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public selectStringList(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;
    .locals 5
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "column"    # Ljava/lang/String;
    .param p3, "orderBy"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/net/Uri;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1393
    const/4 v0, 0x0

    .line 1396
    .local v0, "cursor":Landroid/database/Cursor;
    const/4 v3, 0x1

    :try_start_0
    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    aput-object p2, v3, v4

    const/4 v4, 0x0

    invoke-virtual {p0, p1, v3, p3, v4}, Lcom/robotoworks/mechanoid/db/SQuery;->select(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;Z)Landroid/database/Cursor;

    move-result-object v0

    .line 1398
    new-instance v2, Ljava/util/ArrayList;

    invoke-interface {v0}, Landroid/database/Cursor;->getCount()I

    move-result v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 1400
    .local v2, "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-interface {v0}, Landroid/database/Cursor;->getCount()I

    move-result v3

    if-ge v1, v3, :cond_0

    .line 1401
    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z

    .line 1402
    const/4 v3, 0x0

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1400
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1408
    :cond_0
    invoke-static {v0}, Lcom/robotoworks/mechanoid/util/Closeables;->closeSilently(Landroid/database/Cursor;)V

    return-object v2

    .end local v1    # "i":I
    .end local v2    # "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :catchall_0
    move-exception v3

    invoke-static {v0}, Lcom/robotoworks/mechanoid/util/Closeables;->closeSilently(Landroid/database/Cursor;)V

    throw v3
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 418
    iget-object v0, p0, Lcom/robotoworks/mechanoid/db/SQuery;->mBuilder:Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public update(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Landroid/content/ContentValues;)I
    .locals 2
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p2, "table"    # Ljava/lang/String;
    .param p3, "values"    # Landroid/content/ContentValues;

    .prologue
    .line 581
    iget-object v0, p0, Lcom/robotoworks/mechanoid/db/SQuery;->mBuilder:Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/db/SQuery;->getArgsArray()[Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, p2, p3, v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public update(Landroid/net/Uri;Landroid/content/ContentValues;)I
    .locals 3
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "values"    # Landroid/content/ContentValues;

    .prologue
    .line 1413
    invoke-static {}, Lcom/robotoworks/mechanoid/Mechanoid;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 1414
    .local v0, "resolver":Landroid/content/ContentResolver;
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/db/SQuery;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/db/SQuery;->getArgsArray()[Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, p1, p2, v1, v2}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    return v1
.end method

.method public update(Landroid/net/Uri;Landroid/content/ContentValues;Z)I
    .locals 4
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "values"    # Landroid/content/ContentValues;
    .param p3, "notifyChange"    # Z

    .prologue
    .line 1419
    invoke-virtual {p1}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v1

    const-string v2, "mechdb_notify"

    invoke-static {p3}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p1

    .line 1421
    invoke-static {}, Lcom/robotoworks/mechanoid/Mechanoid;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 1422
    .local v0, "resolver":Landroid/content/ContentResolver;
    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/db/SQuery;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/db/SQuery;->getArgsArray()[Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, p1, p2, v1, v2}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    return v1
.end method
