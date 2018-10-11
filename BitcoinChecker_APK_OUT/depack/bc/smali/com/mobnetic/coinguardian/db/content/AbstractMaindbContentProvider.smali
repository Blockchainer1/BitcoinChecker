.class public abstract Lcom/mobnetic/coinguardian/db/content/AbstractMaindbContentProvider;
.super Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;
.source "AbstractMaindbContentProvider.java"


# static fields
.field protected static final ALARM:I = 0x2

.field protected static final ALARM_ID:I = 0x3

.field protected static final CHECKER:I = 0x0

.field protected static final CHECKER_ID:I = 0x1

.field public static final NUM_URI_MATCHERS:I = 0x4


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 18
    invoke-direct {p0}, Lcom/robotoworks/mechanoid/db/MechanoidContentProvider;-><init>()V

    return-void
.end method


# virtual methods
.method protected createActions(I)Lcom/robotoworks/mechanoid/db/ContentProviderActions;
    .locals 3
    .param p1, "id"    # I

    .prologue
    .line 68
    packed-switch p1, :pswitch_data_0

    .line 78
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown id: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 70
    :pswitch_0
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/db/content/AbstractMaindbContentProvider;->createCheckerActions()Lcom/robotoworks/mechanoid/db/ContentProviderActions;

    move-result-object v0

    .line 76
    :goto_0
    return-object v0

    .line 72
    :pswitch_1
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/db/content/AbstractMaindbContentProvider;->createCheckerByIdActions()Lcom/robotoworks/mechanoid/db/ContentProviderActions;

    move-result-object v0

    goto :goto_0

    .line 74
    :pswitch_2
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/db/content/AbstractMaindbContentProvider;->createAlarmActions()Lcom/robotoworks/mechanoid/db/ContentProviderActions;

    move-result-object v0

    goto :goto_0

    .line 76
    :pswitch_3
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/db/content/AbstractMaindbContentProvider;->createAlarmByIdActions()Lcom/robotoworks/mechanoid/db/ContentProviderActions;

    move-result-object v0

    goto :goto_0

    .line 68
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method protected createAlarmActions()Lcom/robotoworks/mechanoid/db/ContentProviderActions;
    .locals 4

    .prologue
    .line 95
    new-instance v0, Lcom/robotoworks/mechanoid/db/DefaultContentProviderActions;

    const-string v1, "alarm"

    const/4 v2, 0x0

    invoke-static {}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->getFactory()Lcom/robotoworks/mechanoid/db/ActiveRecordFactory;

    move-result-object v3

    invoke-direct {v0, v1, v2, v3}, Lcom/robotoworks/mechanoid/db/DefaultContentProviderActions;-><init>(Ljava/lang/String;ZLcom/robotoworks/mechanoid/db/ActiveRecordFactory;)V

    return-object v0
.end method

.method protected createAlarmByIdActions()Lcom/robotoworks/mechanoid/db/ContentProviderActions;
    .locals 4

    .prologue
    .line 91
    new-instance v0, Lcom/robotoworks/mechanoid/db/DefaultContentProviderActions;

    const-string v1, "alarm"

    const/4 v2, 0x1

    invoke-static {}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->getFactory()Lcom/robotoworks/mechanoid/db/ActiveRecordFactory;

    move-result-object v3

    invoke-direct {v0, v1, v2, v3}, Lcom/robotoworks/mechanoid/db/DefaultContentProviderActions;-><init>(Ljava/lang/String;ZLcom/robotoworks/mechanoid/db/ActiveRecordFactory;)V

    return-object v0
.end method

.method protected createCheckerActions()Lcom/robotoworks/mechanoid/db/ContentProviderActions;
    .locals 4

    .prologue
    .line 87
    new-instance v0, Lcom/robotoworks/mechanoid/db/DefaultContentProviderActions;

    const-string v1, "checker"

    const/4 v2, 0x0

    invoke-static {}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getFactory()Lcom/robotoworks/mechanoid/db/ActiveRecordFactory;

    move-result-object v3

    invoke-direct {v0, v1, v2, v3}, Lcom/robotoworks/mechanoid/db/DefaultContentProviderActions;-><init>(Ljava/lang/String;ZLcom/robotoworks/mechanoid/db/ActiveRecordFactory;)V

    return-object v0
.end method

.method protected createCheckerByIdActions()Lcom/robotoworks/mechanoid/db/ContentProviderActions;
    .locals 4

    .prologue
    .line 83
    new-instance v0, Lcom/robotoworks/mechanoid/db/DefaultContentProviderActions;

    const-string v1, "checker"

    const/4 v2, 0x1

    invoke-static {}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getFactory()Lcom/robotoworks/mechanoid/db/ActiveRecordFactory;

    move-result-object v3

    invoke-direct {v0, v1, v2, v3}, Lcom/robotoworks/mechanoid/db/DefaultContentProviderActions;-><init>(Ljava/lang/String;ZLcom/robotoworks/mechanoid/db/ActiveRecordFactory;)V

    return-object v0
.end method

.method protected createContentTypes()[Ljava/lang/String;
    .locals 3

    .prologue
    .line 46
    const/4 v1, 0x4

    new-array v0, v1, [Ljava/lang/String;

    .line 48
    .local v0, "contentTypes":[Ljava/lang/String;
    const/4 v1, 0x0

    const-string v2, "vnd.android.cursor.dir/vnd.maindb.checker"

    aput-object v2, v0, v1

    .line 49
    const/4 v1, 0x1

    const-string v2, "vnd.android.cursor.item/vnd.maindb.checker"

    aput-object v2, v0, v1

    .line 50
    const/4 v1, 0x2

    const-string v2, "vnd.android.cursor.dir/vnd.maindb.alarm"

    aput-object v2, v0, v1

    .line 51
    const/4 v1, 0x3

    const-string v2, "vnd.android.cursor.item/vnd.maindb.alarm"

    aput-object v2, v0, v1

    .line 53
    return-object v0
.end method

.method protected createOpenHelper(Landroid/content/Context;)Lcom/robotoworks/mechanoid/db/MechanoidSQLiteOpenHelper;
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 58
    new-instance v0, Lcom/mobnetic/coinguardian/db/content/MaindbOpenHelper;

    invoke-direct {v0, p1}, Lcom/mobnetic/coinguardian/db/content/MaindbOpenHelper;-><init>(Landroid/content/Context;)V

    return-object v0
.end method

.method protected createUriMatcher()Landroid/content/UriMatcher;
    .locals 4

    .prologue
    .line 32
    new-instance v1, Landroid/content/UriMatcher;

    const/4 v2, -0x1

    invoke-direct {v1, v2}, Landroid/content/UriMatcher;-><init>(I)V

    .line 33
    .local v1, "matcher":Landroid/content/UriMatcher;
    sget-object v0, Lcom/mobnetic/coinguardian/db/content/MaindbContract;->CONTENT_AUTHORITY:Ljava/lang/String;

    .line 35
    .local v0, "authority":Ljava/lang/String;
    const-string v2, "checker"

    const/4 v3, 0x0

    invoke-virtual {v1, v0, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 36
    const-string v2, "checker/#"

    const/4 v3, 0x1

    invoke-virtual {v1, v0, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 37
    const-string v2, "alarm"

    const/4 v3, 0x2

    invoke-virtual {v1, v0, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 38
    const-string v2, "alarm/#"

    const/4 v3, 0x3

    invoke-virtual {v1, v0, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 41
    return-object v1
.end method

.method protected getRelatedUris(Landroid/net/Uri;)Ljava/util/Set;
    .locals 1
    .param p1, "uri"    # Landroid/net/Uri;
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

    .prologue
    .line 63
    sget-object v0, Lcom/mobnetic/coinguardian/db/content/MaindbContract;->REFERENCING_VIEWS:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Set;

    return-object v0
.end method
