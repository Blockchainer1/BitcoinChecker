.class public Lcom/mobnetic/coinguardian/db/content/CheckerRecord;
.super Lcom/robotoworks/mechanoid/db/ActiveRecord;
.source "CheckerRecord.java"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mobnetic/coinguardian/db/content/CheckerRecord$Indices;
    }
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/mobnetic/coinguardian/db/content/CheckerRecord;",
            ">;"
        }
    .end annotation
.end field

.field public static PROJECTION:[Ljava/lang/String;

.field private static sFactory:Lcom/robotoworks/mechanoid/db/ActiveRecordFactory;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/robotoworks/mechanoid/db/ActiveRecordFactory",
            "<",
            "Lcom/mobnetic/coinguardian/db/content/CheckerRecord;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mContractType:J

.field private mContractTypeDirty:Z

.field private mCurrencyDst:Ljava/lang/String;

.field private mCurrencyDstDirty:Z

.field private mCurrencyPairId:Ljava/lang/String;

.field private mCurrencyPairIdDirty:Z

.field private mCurrencySrc:Ljava/lang/String;

.field private mCurrencySrcDirty:Z

.field private mCurrencySubunitDst:J

.field private mCurrencySubunitDstDirty:Z

.field private mCurrencySubunitSrc:J

.field private mCurrencySubunitSrcDirty:Z

.field private mEnabled:Z

.field private mEnabledDirty:Z

.field private mErrorMsg:Ljava/lang/String;

.field private mErrorMsgDirty:Z

.field private mFrequency:J

.field private mFrequencyDirty:Z

.field private mLastCheckDate:J

.field private mLastCheckDateDirty:Z

.field private mLastCheckPointTicker:Ljava/lang/String;

.field private mLastCheckPointTickerDirty:Z

.field private mLastCheckTicker:Ljava/lang/String;

.field private mLastCheckTickerDirty:Z

.field private mMarketKey:Ljava/lang/String;

.field private mMarketKeyDirty:Z

.field private mNotificationPriority:J

.field private mNotificationPriorityDirty:Z

.field private mPreviousCheckTicker:Ljava/lang/String;

.field private mPreviousCheckTickerDirty:Z

.field private mSortOrder:J

.field private mSortOrderDirty:Z

.field private mTtsEnabled:Z

.field private mTtsEnabledDirty:Z


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 22
    new-instance v0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord$1;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord$1;-><init>()V

    sput-object v0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->sFactory:Lcom/robotoworks/mechanoid/db/ActiveRecordFactory;

    .line 38
    new-instance v0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord$2;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord$2;-><init>()V

    sput-object v0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 49
    const/16 v0, 0x12

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "_id"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "enabled"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "marketKey"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "currencySrc"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "currencyDst"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "frequency"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "notificationPriority"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "ttsEnabled"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string v2, "lastCheckTicker"

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-string v2, "lastCheckPointTicker"

    aput-object v2, v0, v1

    const/16 v1, 0xa

    const-string v2, "previousCheckTicker"

    aput-object v2, v0, v1

    const/16 v1, 0xb

    const-string v2, "lastCheckDate"

    aput-object v2, v0, v1

    const/16 v1, 0xc

    const-string v2, "sortOrder"

    aput-object v2, v0, v1

    const/16 v1, 0xd

    const-string v2, "currencySubunitSrc"

    aput-object v2, v0, v1

    const/16 v1, 0xe

    const-string v2, "currencySubunitDst"

    aput-object v2, v0, v1

    const/16 v1, 0xf

    const-string v2, "errorMsg"

    aput-object v2, v0, v1

    const/16 v1, 0x10

    const-string v2, "currencyPairId"

    aput-object v2, v0, v1

    const/16 v1, 0x11

    const-string v2, "contractType"

    aput-object v2, v0, v1

    sput-object v0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->PROJECTION:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 286
    sget-object v0, Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker;->CONTENT_URI:Landroid/net/Uri;

    invoke-direct {p0, v0}, Lcom/robotoworks/mechanoid/db/ActiveRecord;-><init>(Landroid/net/Uri;)V

    .line 287
    return-void
.end method

.method private constructor <init>(Landroid/os/Parcel;)V
    .locals 6
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 290
    sget-object v1, Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker;->CONTENT_URI:Landroid/net/Uri;

    invoke-direct {p0, v1}, Lcom/robotoworks/mechanoid/db/ActiveRecord;-><init>(Landroid/net/Uri;)V

    .line 292
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v4

    invoke-virtual {p0, v4, v5}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->setId(J)V

    .line 294
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    if-lez v1, :cond_0

    move v1, v2

    :goto_0
    iput-boolean v1, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mEnabled:Z

    .line 295
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mMarketKey:Ljava/lang/String;

    .line 296
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mCurrencySrc:Ljava/lang/String;

    .line 297
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mCurrencyDst:Ljava/lang/String;

    .line 298
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v4

    iput-wide v4, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mFrequency:J

    .line 299
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v4

    iput-wide v4, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mNotificationPriority:J

    .line 300
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    if-lez v1, :cond_1

    move v1, v2

    :goto_1
    iput-boolean v1, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mTtsEnabled:Z

    .line 301
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mLastCheckTicker:Ljava/lang/String;

    .line 302
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mLastCheckPointTicker:Ljava/lang/String;

    .line 303
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mPreviousCheckTicker:Ljava/lang/String;

    .line 304
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v4

    iput-wide v4, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mLastCheckDate:J

    .line 305
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v4

    iput-wide v4, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mSortOrder:J

    .line 306
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v4

    iput-wide v4, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mCurrencySubunitSrc:J

    .line 307
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v4

    iput-wide v4, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mCurrencySubunitDst:J

    .line 308
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mErrorMsg:Ljava/lang/String;

    .line 309
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mCurrencyPairId:Ljava/lang/String;

    .line 310
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v4

    iput-wide v4, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mContractType:J

    .line 312
    const/16 v1, 0x11

    new-array v0, v1, [Z

    .line 313
    .local v0, "dirtyFlags":[Z
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readBooleanArray([Z)V

    .line 314
    aget-boolean v1, v0, v3

    iput-boolean v1, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mEnabledDirty:Z

    .line 315
    aget-boolean v1, v0, v2

    iput-boolean v1, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mMarketKeyDirty:Z

    .line 316
    const/4 v1, 0x2

    aget-boolean v1, v0, v1

    iput-boolean v1, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mCurrencySrcDirty:Z

    .line 317
    const/4 v1, 0x3

    aget-boolean v1, v0, v1

    iput-boolean v1, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mCurrencyDstDirty:Z

    .line 318
    const/4 v1, 0x4

    aget-boolean v1, v0, v1

    iput-boolean v1, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mFrequencyDirty:Z

    .line 319
    const/4 v1, 0x5

    aget-boolean v1, v0, v1

    iput-boolean v1, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mNotificationPriorityDirty:Z

    .line 320
    const/4 v1, 0x6

    aget-boolean v1, v0, v1

    iput-boolean v1, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mTtsEnabledDirty:Z

    .line 321
    const/4 v1, 0x7

    aget-boolean v1, v0, v1

    iput-boolean v1, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mLastCheckTickerDirty:Z

    .line 322
    const/16 v1, 0x8

    aget-boolean v1, v0, v1

    iput-boolean v1, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mLastCheckPointTickerDirty:Z

    .line 323
    const/16 v1, 0x9

    aget-boolean v1, v0, v1

    iput-boolean v1, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mPreviousCheckTickerDirty:Z

    .line 324
    const/16 v1, 0xa

    aget-boolean v1, v0, v1

    iput-boolean v1, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mLastCheckDateDirty:Z

    .line 325
    const/16 v1, 0xb

    aget-boolean v1, v0, v1

    iput-boolean v1, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mSortOrderDirty:Z

    .line 326
    const/16 v1, 0xc

    aget-boolean v1, v0, v1

    iput-boolean v1, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mCurrencySubunitSrcDirty:Z

    .line 327
    const/16 v1, 0xd

    aget-boolean v1, v0, v1

    iput-boolean v1, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mCurrencySubunitDstDirty:Z

    .line 328
    const/16 v1, 0xe

    aget-boolean v1, v0, v1

    iput-boolean v1, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mErrorMsgDirty:Z

    .line 329
    const/16 v1, 0xf

    aget-boolean v1, v0, v1

    iput-boolean v1, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mCurrencyPairIdDirty:Z

    .line 330
    const/16 v1, 0x10

    aget-boolean v1, v0, v1

    iput-boolean v1, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mContractTypeDirty:Z

    .line 331
    return-void

    .end local v0    # "dirtyFlags":[Z
    :cond_0
    move v1, v3

    .line 294
    goto/16 :goto_0

    :cond_1
    move v1, v3

    .line 300
    goto/16 :goto_1
.end method

.method synthetic constructor <init>(Landroid/os/Parcel;Lcom/mobnetic/coinguardian/db/content/CheckerRecord$1;)V
    .locals 0
    .param p1, "x0"    # Landroid/os/Parcel;
    .param p2, "x1"    # Lcom/mobnetic/coinguardian/db/content/CheckerRecord$1;

    .prologue
    .line 20
    invoke-direct {p0, p1}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;-><init>(Landroid/os/Parcel;)V

    return-void
.end method

.method public static fromBundle(Landroid/os/Bundle;Ljava/lang/String;)Lcom/mobnetic/coinguardian/db/content/CheckerRecord;
    .locals 1
    .param p0, "bundle"    # Landroid/os/Bundle;
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 492
    const-class v0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/os/Bundle;->setClassLoader(Ljava/lang/ClassLoader;)V

    .line 493
    invoke-virtual {p0, p1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    return-object v0
.end method

.method public static fromCursor(Landroid/database/Cursor;)Lcom/mobnetic/coinguardian/db/content/CheckerRecord;
    .locals 2
    .param p0, "c"    # Landroid/database/Cursor;

    .prologue
    .line 482
    new-instance v0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;-><init>()V

    .line 484
    .local v0, "item":Lcom/mobnetic/coinguardian/db/content/CheckerRecord;
    invoke-virtual {v0, p0}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->setPropertiesFromCursor(Landroid/database/Cursor;)V

    .line 486
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->makeDirty(Z)V

    .line 488
    return-object v0
.end method

.method public static get(J)Lcom/mobnetic/coinguardian/db/content/CheckerRecord;
    .locals 8
    .param p0, "id"    # J

    .prologue
    const/4 v7, 0x0

    .line 497
    const/4 v6, 0x0

    .line 499
    .local v6, "c":Landroid/database/Cursor;
    invoke-static {}, Lcom/robotoworks/mechanoid/Mechanoid;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 502
    .local v0, "resolver":Landroid/content/ContentResolver;
    :try_start_0
    sget-object v1, Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v1}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v1

    .line 503
    invoke-static {p0, p1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v1

    sget-object v2, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->PROJECTION:[Ljava/lang/String;

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    .line 502
    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 505
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v1

    if-nez v1, :cond_0

    .line 511
    invoke-static {v6}, Lcom/robotoworks/mechanoid/util/Closeables;->closeSilently(Landroid/database/Cursor;)V

    move-object v1, v7

    .line 509
    :goto_0
    return-object v1

    :cond_0
    :try_start_1
    invoke-static {v6}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->fromCursor(Landroid/database/Cursor;)Lcom/mobnetic/coinguardian/db/content/CheckerRecord;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v1

    .line 511
    invoke-static {v6}, Lcom/robotoworks/mechanoid/util/Closeables;->closeSilently(Landroid/database/Cursor;)V

    goto :goto_0

    :catchall_0
    move-exception v1

    invoke-static {v6}, Lcom/robotoworks/mechanoid/util/Closeables;->closeSilently(Landroid/database/Cursor;)V

    throw v1
.end method

.method public static getFactory()Lcom/robotoworks/mechanoid/db/ActiveRecordFactory;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/robotoworks/mechanoid/db/ActiveRecordFactory",
            "<",
            "Lcom/mobnetic/coinguardian/db/content/CheckerRecord;",
            ">;"
        }
    .end annotation

    .prologue
    .line 35
    sget-object v0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->sFactory:Lcom/robotoworks/mechanoid/db/ActiveRecordFactory;

    return-object v0
.end method


# virtual methods
.method protected _getProjection()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 128
    sget-object v0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->PROJECTION:[Ljava/lang/String;

    return-object v0
.end method

.method protected createBuilder()Lcom/robotoworks/mechanoid/db/AbstractValuesBuilder;
    .locals 4

    .prologue
    .line 381
    invoke-static {}, Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker;->newBuilder()Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker$Builder;

    move-result-object v0

    .line 383
    .local v0, "builder":Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker$Builder;
    iget-boolean v1, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mEnabledDirty:Z

    if-eqz v1, :cond_0

    .line 384
    iget-boolean v1, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mEnabled:Z

    invoke-virtual {v0, v1}, Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker$Builder;->setEnabled(Z)Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker$Builder;

    .line 386
    :cond_0
    iget-boolean v1, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mMarketKeyDirty:Z

    if-eqz v1, :cond_1

    .line 387
    iget-object v1, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mMarketKey:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker$Builder;->setMarketKey(Ljava/lang/String;)Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker$Builder;

    .line 389
    :cond_1
    iget-boolean v1, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mCurrencySrcDirty:Z

    if-eqz v1, :cond_2

    .line 390
    iget-object v1, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mCurrencySrc:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker$Builder;->setCurrencySrc(Ljava/lang/String;)Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker$Builder;

    .line 392
    :cond_2
    iget-boolean v1, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mCurrencyDstDirty:Z

    if-eqz v1, :cond_3

    .line 393
    iget-object v1, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mCurrencyDst:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker$Builder;->setCurrencyDst(Ljava/lang/String;)Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker$Builder;

    .line 395
    :cond_3
    iget-boolean v1, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mFrequencyDirty:Z

    if-eqz v1, :cond_4

    .line 396
    iget-wide v2, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mFrequency:J

    invoke-virtual {v0, v2, v3}, Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker$Builder;->setFrequency(J)Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker$Builder;

    .line 398
    :cond_4
    iget-boolean v1, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mNotificationPriorityDirty:Z

    if-eqz v1, :cond_5

    .line 399
    iget-wide v2, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mNotificationPriority:J

    invoke-virtual {v0, v2, v3}, Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker$Builder;->setNotificationPriority(J)Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker$Builder;

    .line 401
    :cond_5
    iget-boolean v1, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mTtsEnabledDirty:Z

    if-eqz v1, :cond_6

    .line 402
    iget-boolean v1, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mTtsEnabled:Z

    invoke-virtual {v0, v1}, Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker$Builder;->setTtsEnabled(Z)Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker$Builder;

    .line 404
    :cond_6
    iget-boolean v1, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mLastCheckTickerDirty:Z

    if-eqz v1, :cond_7

    .line 405
    iget-object v1, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mLastCheckTicker:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker$Builder;->setLastCheckTicker(Ljava/lang/String;)Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker$Builder;

    .line 407
    :cond_7
    iget-boolean v1, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mLastCheckPointTickerDirty:Z

    if-eqz v1, :cond_8

    .line 408
    iget-object v1, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mLastCheckPointTicker:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker$Builder;->setLastCheckPointTicker(Ljava/lang/String;)Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker$Builder;

    .line 410
    :cond_8
    iget-boolean v1, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mPreviousCheckTickerDirty:Z

    if-eqz v1, :cond_9

    .line 411
    iget-object v1, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mPreviousCheckTicker:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker$Builder;->setPreviousCheckTicker(Ljava/lang/String;)Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker$Builder;

    .line 413
    :cond_9
    iget-boolean v1, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mLastCheckDateDirty:Z

    if-eqz v1, :cond_a

    .line 414
    iget-wide v2, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mLastCheckDate:J

    invoke-virtual {v0, v2, v3}, Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker$Builder;->setLastCheckDate(J)Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker$Builder;

    .line 416
    :cond_a
    iget-boolean v1, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mSortOrderDirty:Z

    if-eqz v1, :cond_b

    .line 417
    iget-wide v2, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mSortOrder:J

    invoke-virtual {v0, v2, v3}, Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker$Builder;->setSortOrder(J)Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker$Builder;

    .line 419
    :cond_b
    iget-boolean v1, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mCurrencySubunitSrcDirty:Z

    if-eqz v1, :cond_c

    .line 420
    iget-wide v2, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mCurrencySubunitSrc:J

    invoke-virtual {v0, v2, v3}, Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker$Builder;->setCurrencySubunitSrc(J)Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker$Builder;

    .line 422
    :cond_c
    iget-boolean v1, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mCurrencySubunitDstDirty:Z

    if-eqz v1, :cond_d

    .line 423
    iget-wide v2, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mCurrencySubunitDst:J

    invoke-virtual {v0, v2, v3}, Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker$Builder;->setCurrencySubunitDst(J)Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker$Builder;

    .line 425
    :cond_d
    iget-boolean v1, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mErrorMsgDirty:Z

    if-eqz v1, :cond_e

    .line 426
    iget-object v1, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mErrorMsg:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker$Builder;->setErrorMsg(Ljava/lang/String;)Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker$Builder;

    .line 428
    :cond_e
    iget-boolean v1, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mCurrencyPairIdDirty:Z

    if-eqz v1, :cond_f

    .line 429
    iget-object v1, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mCurrencyPairId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker$Builder;->setCurrencyPairId(Ljava/lang/String;)Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker$Builder;

    .line 431
    :cond_f
    iget-boolean v1, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mContractTypeDirty:Z

    if-eqz v1, :cond_10

    .line 432
    iget-wide v2, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mContractType:J

    invoke-virtual {v0, v2, v3}, Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker$Builder;->setContractType(J)Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker$Builder;

    .line 435
    :cond_10
    return-object v0
.end method

.method public describeContents()I
    .locals 1

    .prologue
    .line 335
    const/4 v0, 0x0

    return v0
.end method

.method public getContractType()J
    .locals 2

    .prologue
    .line 281
    iget-wide v0, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mContractType:J

    return-wide v0
.end method

.method public getCurrencyDst()Ljava/lang/String;
    .locals 1

    .prologue
    .line 164
    iget-object v0, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mCurrencyDst:Ljava/lang/String;

    return-object v0
.end method

.method public getCurrencyPairId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 272
    iget-object v0, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mCurrencyPairId:Ljava/lang/String;

    return-object v0
.end method

.method public getCurrencySrc()Ljava/lang/String;
    .locals 1

    .prologue
    .line 155
    iget-object v0, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mCurrencySrc:Ljava/lang/String;

    return-object v0
.end method

.method public getCurrencySubunitDst()J
    .locals 2

    .prologue
    .line 254
    iget-wide v0, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mCurrencySubunitDst:J

    return-wide v0
.end method

.method public getCurrencySubunitSrc()J
    .locals 2

    .prologue
    .line 245
    iget-wide v0, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mCurrencySubunitSrc:J

    return-wide v0
.end method

.method public getEnabled()Z
    .locals 1

    .prologue
    .line 137
    iget-boolean v0, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mEnabled:Z

    return v0
.end method

.method public getErrorMsg()Ljava/lang/String;
    .locals 1

    .prologue
    .line 263
    iget-object v0, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mErrorMsg:Ljava/lang/String;

    return-object v0
.end method

.method public getFrequency()J
    .locals 2

    .prologue
    .line 173
    iget-wide v0, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mFrequency:J

    return-wide v0
.end method

.method public getLastCheckDate()J
    .locals 2

    .prologue
    .line 227
    iget-wide v0, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mLastCheckDate:J

    return-wide v0
.end method

.method public getLastCheckPointTicker()Ljava/lang/String;
    .locals 1

    .prologue
    .line 209
    iget-object v0, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mLastCheckPointTicker:Ljava/lang/String;

    return-object v0
.end method

.method public getLastCheckTicker()Ljava/lang/String;
    .locals 1

    .prologue
    .line 200
    iget-object v0, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mLastCheckTicker:Ljava/lang/String;

    return-object v0
.end method

.method public getMarketKey()Ljava/lang/String;
    .locals 1

    .prologue
    .line 146
    iget-object v0, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mMarketKey:Ljava/lang/String;

    return-object v0
.end method

.method public getNotificationPriority()J
    .locals 2

    .prologue
    .line 182
    iget-wide v0, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mNotificationPriority:J

    return-wide v0
.end method

.method public getPreviousCheckTicker()Ljava/lang/String;
    .locals 1

    .prologue
    .line 218
    iget-object v0, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mPreviousCheckTicker:Ljava/lang/String;

    return-object v0
.end method

.method public getSortOrder()J
    .locals 2

    .prologue
    .line 236
    iget-wide v0, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mSortOrder:J

    return-wide v0
.end method

.method public getTtsEnabled()Z
    .locals 1

    .prologue
    .line 191
    iget-boolean v0, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mTtsEnabled:Z

    return v0
.end method

.method public makeDirty(Z)V
    .locals 0
    .param p1, "dirty"    # Z

    .prologue
    .line 440
    iput-boolean p1, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mEnabledDirty:Z

    .line 441
    iput-boolean p1, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mMarketKeyDirty:Z

    .line 442
    iput-boolean p1, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mCurrencySrcDirty:Z

    .line 443
    iput-boolean p1, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mCurrencyDstDirty:Z

    .line 444
    iput-boolean p1, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mFrequencyDirty:Z

    .line 445
    iput-boolean p1, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mNotificationPriorityDirty:Z

    .line 446
    iput-boolean p1, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mTtsEnabledDirty:Z

    .line 447
    iput-boolean p1, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mLastCheckTickerDirty:Z

    .line 448
    iput-boolean p1, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mLastCheckPointTickerDirty:Z

    .line 449
    iput-boolean p1, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mPreviousCheckTickerDirty:Z

    .line 450
    iput-boolean p1, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mLastCheckDateDirty:Z

    .line 451
    iput-boolean p1, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mSortOrderDirty:Z

    .line 452
    iput-boolean p1, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mCurrencySubunitSrcDirty:Z

    .line 453
    iput-boolean p1, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mCurrencySubunitDstDirty:Z

    .line 454
    iput-boolean p1, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mErrorMsgDirty:Z

    .line 455
    iput-boolean p1, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mCurrencyPairIdDirty:Z

    .line 456
    iput-boolean p1, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mContractTypeDirty:Z

    .line 457
    return-void
.end method

.method public setContractType(J)V
    .locals 1
    .param p1, "contractType"    # J

    .prologue
    .line 276
    iput-wide p1, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mContractType:J

    .line 277
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mContractTypeDirty:Z

    .line 278
    return-void
.end method

.method public setCurrencyDst(Ljava/lang/String;)V
    .locals 1
    .param p1, "currencyDst"    # Ljava/lang/String;

    .prologue
    .line 159
    iput-object p1, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mCurrencyDst:Ljava/lang/String;

    .line 160
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mCurrencyDstDirty:Z

    .line 161
    return-void
.end method

.method public setCurrencyPairId(Ljava/lang/String;)V
    .locals 1
    .param p1, "currencyPairId"    # Ljava/lang/String;

    .prologue
    .line 267
    iput-object p1, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mCurrencyPairId:Ljava/lang/String;

    .line 268
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mCurrencyPairIdDirty:Z

    .line 269
    return-void
.end method

.method public setCurrencySrc(Ljava/lang/String;)V
    .locals 1
    .param p1, "currencySrc"    # Ljava/lang/String;

    .prologue
    .line 150
    iput-object p1, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mCurrencySrc:Ljava/lang/String;

    .line 151
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mCurrencySrcDirty:Z

    .line 152
    return-void
.end method

.method public setCurrencySubunitDst(J)V
    .locals 1
    .param p1, "currencySubunitDst"    # J

    .prologue
    .line 249
    iput-wide p1, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mCurrencySubunitDst:J

    .line 250
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mCurrencySubunitDstDirty:Z

    .line 251
    return-void
.end method

.method public setCurrencySubunitSrc(J)V
    .locals 1
    .param p1, "currencySubunitSrc"    # J

    .prologue
    .line 240
    iput-wide p1, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mCurrencySubunitSrc:J

    .line 241
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mCurrencySubunitSrcDirty:Z

    .line 242
    return-void
.end method

.method public setEnabled(Z)V
    .locals 1
    .param p1, "enabled"    # Z

    .prologue
    .line 132
    iput-boolean p1, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mEnabled:Z

    .line 133
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mEnabledDirty:Z

    .line 134
    return-void
.end method

.method public setErrorMsg(Ljava/lang/String;)V
    .locals 1
    .param p1, "errorMsg"    # Ljava/lang/String;

    .prologue
    .line 258
    iput-object p1, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mErrorMsg:Ljava/lang/String;

    .line 259
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mErrorMsgDirty:Z

    .line 260
    return-void
.end method

.method public setFrequency(J)V
    .locals 1
    .param p1, "frequency"    # J

    .prologue
    .line 168
    iput-wide p1, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mFrequency:J

    .line 169
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mFrequencyDirty:Z

    .line 170
    return-void
.end method

.method public setLastCheckDate(J)V
    .locals 1
    .param p1, "lastCheckDate"    # J

    .prologue
    .line 222
    iput-wide p1, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mLastCheckDate:J

    .line 223
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mLastCheckDateDirty:Z

    .line 224
    return-void
.end method

.method public setLastCheckPointTicker(Ljava/lang/String;)V
    .locals 1
    .param p1, "lastCheckPointTicker"    # Ljava/lang/String;

    .prologue
    .line 204
    iput-object p1, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mLastCheckPointTicker:Ljava/lang/String;

    .line 205
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mLastCheckPointTickerDirty:Z

    .line 206
    return-void
.end method

.method public setLastCheckTicker(Ljava/lang/String;)V
    .locals 1
    .param p1, "lastCheckTicker"    # Ljava/lang/String;

    .prologue
    .line 195
    iput-object p1, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mLastCheckTicker:Ljava/lang/String;

    .line 196
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mLastCheckTickerDirty:Z

    .line 197
    return-void
.end method

.method public setMarketKey(Ljava/lang/String;)V
    .locals 1
    .param p1, "marketKey"    # Ljava/lang/String;

    .prologue
    .line 141
    iput-object p1, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mMarketKey:Ljava/lang/String;

    .line 142
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mMarketKeyDirty:Z

    .line 143
    return-void
.end method

.method public setNotificationPriority(J)V
    .locals 1
    .param p1, "notificationPriority"    # J

    .prologue
    .line 177
    iput-wide p1, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mNotificationPriority:J

    .line 178
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mNotificationPriorityDirty:Z

    .line 179
    return-void
.end method

.method public setPreviousCheckTicker(Ljava/lang/String;)V
    .locals 1
    .param p1, "previousCheckTicker"    # Ljava/lang/String;

    .prologue
    .line 213
    iput-object p1, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mPreviousCheckTicker:Ljava/lang/String;

    .line 214
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mPreviousCheckTickerDirty:Z

    .line 215
    return-void
.end method

.method protected setPropertiesFromCursor(Landroid/database/Cursor;)V
    .locals 6
    .param p1, "c"    # Landroid/database/Cursor;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 461
    invoke-interface {p1, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    invoke-virtual {p0, v4, v5}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->setId(J)V

    .line 462
    invoke-interface {p1, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    if-lez v0, :cond_0

    move v0, v1

    :goto_0
    invoke-virtual {p0, v0}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->setEnabled(Z)V

    .line 463
    const/4 v0, 0x2

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->setMarketKey(Ljava/lang/String;)V

    .line 464
    const/4 v0, 0x3

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->setCurrencySrc(Ljava/lang/String;)V

    .line 465
    const/4 v0, 0x4

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->setCurrencyDst(Ljava/lang/String;)V

    .line 466
    const/4 v0, 0x5

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    invoke-virtual {p0, v4, v5}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->setFrequency(J)V

    .line 467
    const/4 v0, 0x6

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    invoke-virtual {p0, v4, v5}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->setNotificationPriority(J)V

    .line 468
    const/4 v0, 0x7

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    if-lez v0, :cond_1

    :goto_1
    invoke-virtual {p0, v1}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->setTtsEnabled(Z)V

    .line 469
    const/16 v0, 0x8

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->setLastCheckTicker(Ljava/lang/String;)V

    .line 470
    const/16 v0, 0x9

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->setLastCheckPointTicker(Ljava/lang/String;)V

    .line 471
    const/16 v0, 0xa

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->setPreviousCheckTicker(Ljava/lang/String;)V

    .line 472
    const/16 v0, 0xb

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->setLastCheckDate(J)V

    .line 473
    const/16 v0, 0xc

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->setSortOrder(J)V

    .line 474
    const/16 v0, 0xd

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->setCurrencySubunitSrc(J)V

    .line 475
    const/16 v0, 0xe

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->setCurrencySubunitDst(J)V

    .line 476
    const/16 v0, 0xf

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->setErrorMsg(Ljava/lang/String;)V

    .line 477
    const/16 v0, 0x10

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->setCurrencyPairId(Ljava/lang/String;)V

    .line 478
    const/16 v0, 0x11

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->setContractType(J)V

    .line 479
    return-void

    :cond_0
    move v0, v2

    .line 462
    goto/16 :goto_0

    :cond_1
    move v1, v2

    .line 468
    goto :goto_1
.end method

.method public setSortOrder(J)V
    .locals 1
    .param p1, "sortOrder"    # J

    .prologue
    .line 231
    iput-wide p1, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mSortOrder:J

    .line 232
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mSortOrderDirty:Z

    .line 233
    return-void
.end method

.method public setTtsEnabled(Z)V
    .locals 1
    .param p1, "ttsEnabled"    # Z

    .prologue
    .line 186
    iput-boolean p1, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mTtsEnabled:Z

    .line 187
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mTtsEnabledDirty:Z

    .line 188
    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 6
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 340
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getId()J

    move-result-wide v4

    invoke-virtual {p1, v4, v5}, Landroid/os/Parcel;->writeLong(J)V

    .line 341
    iget-boolean v0, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mEnabled:Z

    if-eqz v0, :cond_0

    move v0, v1

    :goto_0
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 342
    iget-object v0, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mMarketKey:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 343
    iget-object v0, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mCurrencySrc:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 344
    iget-object v0, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mCurrencyDst:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 345
    iget-wide v4, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mFrequency:J

    invoke-virtual {p1, v4, v5}, Landroid/os/Parcel;->writeLong(J)V

    .line 346
    iget-wide v4, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mNotificationPriority:J

    invoke-virtual {p1, v4, v5}, Landroid/os/Parcel;->writeLong(J)V

    .line 347
    iget-boolean v0, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mTtsEnabled:Z

    if-eqz v0, :cond_1

    move v0, v1

    :goto_1
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 348
    iget-object v0, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mLastCheckTicker:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 349
    iget-object v0, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mLastCheckPointTicker:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 350
    iget-object v0, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mPreviousCheckTicker:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 351
    iget-wide v4, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mLastCheckDate:J

    invoke-virtual {p1, v4, v5}, Landroid/os/Parcel;->writeLong(J)V

    .line 352
    iget-wide v4, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mSortOrder:J

    invoke-virtual {p1, v4, v5}, Landroid/os/Parcel;->writeLong(J)V

    .line 353
    iget-wide v4, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mCurrencySubunitSrc:J

    invoke-virtual {p1, v4, v5}, Landroid/os/Parcel;->writeLong(J)V

    .line 354
    iget-wide v4, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mCurrencySubunitDst:J

    invoke-virtual {p1, v4, v5}, Landroid/os/Parcel;->writeLong(J)V

    .line 355
    iget-object v0, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mErrorMsg:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 356
    iget-object v0, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mCurrencyPairId:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 357
    iget-wide v4, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mContractType:J

    invoke-virtual {p1, v4, v5}, Landroid/os/Parcel;->writeLong(J)V

    .line 358
    const/16 v0, 0x11

    new-array v0, v0, [Z

    iget-boolean v3, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mEnabledDirty:Z

    aput-boolean v3, v0, v2

    iget-boolean v2, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mMarketKeyDirty:Z

    aput-boolean v2, v0, v1

    const/4 v1, 0x2

    iget-boolean v2, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mCurrencySrcDirty:Z

    aput-boolean v2, v0, v1

    const/4 v1, 0x3

    iget-boolean v2, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mCurrencyDstDirty:Z

    aput-boolean v2, v0, v1

    const/4 v1, 0x4

    iget-boolean v2, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mFrequencyDirty:Z

    aput-boolean v2, v0, v1

    const/4 v1, 0x5

    iget-boolean v2, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mNotificationPriorityDirty:Z

    aput-boolean v2, v0, v1

    const/4 v1, 0x6

    iget-boolean v2, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mTtsEnabledDirty:Z

    aput-boolean v2, v0, v1

    const/4 v1, 0x7

    iget-boolean v2, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mLastCheckTickerDirty:Z

    aput-boolean v2, v0, v1

    const/16 v1, 0x8

    iget-boolean v2, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mLastCheckPointTickerDirty:Z

    aput-boolean v2, v0, v1

    const/16 v1, 0x9

    iget-boolean v2, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mPreviousCheckTickerDirty:Z

    aput-boolean v2, v0, v1

    const/16 v1, 0xa

    iget-boolean v2, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mLastCheckDateDirty:Z

    aput-boolean v2, v0, v1

    const/16 v1, 0xb

    iget-boolean v2, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mSortOrderDirty:Z

    aput-boolean v2, v0, v1

    const/16 v1, 0xc

    iget-boolean v2, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mCurrencySubunitSrcDirty:Z

    aput-boolean v2, v0, v1

    const/16 v1, 0xd

    iget-boolean v2, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mCurrencySubunitDstDirty:Z

    aput-boolean v2, v0, v1

    const/16 v1, 0xe

    iget-boolean v2, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mErrorMsgDirty:Z

    aput-boolean v2, v0, v1

    const/16 v1, 0xf

    iget-boolean v2, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mCurrencyPairIdDirty:Z

    aput-boolean v2, v0, v1

    const/16 v1, 0x10

    iget-boolean v2, p0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->mContractTypeDirty:Z

    aput-boolean v2, v0, v1

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeBooleanArray([Z)V

    .line 377
    return-void

    :cond_0
    move v0, v2

    .line 341
    goto/16 :goto_0

    :cond_1
    move v0, v2

    .line 347
    goto/16 :goto_1
.end method
