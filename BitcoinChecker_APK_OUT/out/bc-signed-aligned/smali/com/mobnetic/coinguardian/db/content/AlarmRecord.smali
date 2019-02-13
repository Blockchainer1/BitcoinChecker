.class public Lcom/mobnetic/coinguardian/db/content/AlarmRecord;
.super Lcom/robotoworks/mechanoid/db/ActiveRecord;
.source "AlarmRecord.java"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mobnetic/coinguardian/db/content/AlarmRecord$Indices;
    }
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/mobnetic/coinguardian/db/content/AlarmRecord;",
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
            "Lcom/mobnetic/coinguardian/db/content/AlarmRecord;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mCheckerId:J

.field private mCheckerIdDirty:Z

.field private mEnabled:Z

.field private mEnabledDirty:Z

.field private mLastCheckPointTicker:Ljava/lang/String;

.field private mLastCheckPointTickerDirty:Z

.field private mLed:Z

.field private mLedDirty:Z

.field private mSound:Z

.field private mSoundDirty:Z

.field private mSoundUri:Ljava/lang/String;

.field private mSoundUriDirty:Z

.field private mTtsEnabled:Z

.field private mTtsEnabledDirty:Z

.field private mType:J

.field private mTypeDirty:Z

.field private mValue:D

.field private mValueDirty:Z

.field private mVibrate:Z

.field private mVibrateDirty:Z


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 22
    new-instance v0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord$1;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord$1;-><init>()V

    sput-object v0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->sFactory:Lcom/robotoworks/mechanoid/db/ActiveRecordFactory;

    .line 38
    new-instance v0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord$2;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord$2;-><init>()V

    sput-object v0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 49
    const/16 v0, 0xb

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "_id"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "checkerId"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "enabled"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "type"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "value"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "sound"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "soundUri"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "vibrate"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string v2, "led"

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-string v2, "ttsEnabled"

    aput-object v2, v0, v1

    const/16 v1, 0xa

    const-string v2, "lastCheckPointTicker"

    aput-object v2, v0, v1

    sput-object v0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->PROJECTION:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 195
    sget-object v0, Lcom/mobnetic/coinguardian/db/content/MaindbContract$Alarm;->CONTENT_URI:Landroid/net/Uri;

    invoke-direct {p0, v0}, Lcom/robotoworks/mechanoid/db/ActiveRecord;-><init>(Landroid/net/Uri;)V

    .line 196
    return-void
.end method

.method private constructor <init>(Landroid/os/Parcel;)V
    .locals 6
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 199
    sget-object v1, Lcom/mobnetic/coinguardian/db/content/MaindbContract$Alarm;->CONTENT_URI:Landroid/net/Uri;

    invoke-direct {p0, v1}, Lcom/robotoworks/mechanoid/db/ActiveRecord;-><init>(Landroid/net/Uri;)V

    .line 201
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v4

    invoke-virtual {p0, v4, v5}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->setId(J)V

    .line 203
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v4

    iput-wide v4, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mCheckerId:J

    .line 204
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    if-lez v1, :cond_0

    move v1, v2

    :goto_0
    iput-boolean v1, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mEnabled:Z

    .line 205
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v4

    iput-wide v4, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mType:J

    .line 206
    invoke-virtual {p1}, Landroid/os/Parcel;->readDouble()D

    move-result-wide v4

    iput-wide v4, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mValue:D

    .line 207
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    if-lez v1, :cond_1

    move v1, v2

    :goto_1
    iput-boolean v1, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mSound:Z

    .line 208
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mSoundUri:Ljava/lang/String;

    .line 209
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    if-lez v1, :cond_2

    move v1, v2

    :goto_2
    iput-boolean v1, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mVibrate:Z

    .line 210
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    if-lez v1, :cond_3

    move v1, v2

    :goto_3
    iput-boolean v1, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mLed:Z

    .line 211
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    if-lez v1, :cond_4

    move v1, v2

    :goto_4
    iput-boolean v1, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mTtsEnabled:Z

    .line 212
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mLastCheckPointTicker:Ljava/lang/String;

    .line 214
    const/16 v1, 0xa

    new-array v0, v1, [Z

    .line 215
    .local v0, "dirtyFlags":[Z
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readBooleanArray([Z)V

    .line 216
    aget-boolean v1, v0, v3

    iput-boolean v1, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mCheckerIdDirty:Z

    .line 217
    aget-boolean v1, v0, v2

    iput-boolean v1, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mEnabledDirty:Z

    .line 218
    const/4 v1, 0x2

    aget-boolean v1, v0, v1

    iput-boolean v1, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mTypeDirty:Z

    .line 219
    const/4 v1, 0x3

    aget-boolean v1, v0, v1

    iput-boolean v1, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mValueDirty:Z

    .line 220
    const/4 v1, 0x4

    aget-boolean v1, v0, v1

    iput-boolean v1, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mSoundDirty:Z

    .line 221
    const/4 v1, 0x5

    aget-boolean v1, v0, v1

    iput-boolean v1, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mSoundUriDirty:Z

    .line 222
    const/4 v1, 0x6

    aget-boolean v1, v0, v1

    iput-boolean v1, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mVibrateDirty:Z

    .line 223
    const/4 v1, 0x7

    aget-boolean v1, v0, v1

    iput-boolean v1, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mLedDirty:Z

    .line 224
    const/16 v1, 0x8

    aget-boolean v1, v0, v1

    iput-boolean v1, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mTtsEnabledDirty:Z

    .line 225
    const/16 v1, 0x9

    aget-boolean v1, v0, v1

    iput-boolean v1, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mLastCheckPointTickerDirty:Z

    .line 226
    return-void

    .end local v0    # "dirtyFlags":[Z
    :cond_0
    move v1, v3

    .line 204
    goto :goto_0

    :cond_1
    move v1, v3

    .line 207
    goto :goto_1

    :cond_2
    move v1, v3

    .line 209
    goto :goto_2

    :cond_3
    move v1, v3

    .line 210
    goto :goto_3

    :cond_4
    move v1, v3

    .line 211
    goto :goto_4
.end method

.method synthetic constructor <init>(Landroid/os/Parcel;Lcom/mobnetic/coinguardian/db/content/AlarmRecord$1;)V
    .locals 0
    .param p1, "x0"    # Landroid/os/Parcel;
    .param p2, "x1"    # Lcom/mobnetic/coinguardian/db/content/AlarmRecord$1;

    .prologue
    .line 20
    invoke-direct {p0, p1}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;-><init>(Landroid/os/Parcel;)V

    return-void
.end method

.method public static fromBundle(Landroid/os/Bundle;Ljava/lang/String;)Lcom/mobnetic/coinguardian/db/content/AlarmRecord;
    .locals 1
    .param p0, "bundle"    # Landroid/os/Bundle;
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 338
    const-class v0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/os/Bundle;->setClassLoader(Ljava/lang/ClassLoader;)V

    .line 339
    invoke-virtual {p0, p1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;

    return-object v0
.end method

.method public static fromCursor(Landroid/database/Cursor;)Lcom/mobnetic/coinguardian/db/content/AlarmRecord;
    .locals 2
    .param p0, "c"    # Landroid/database/Cursor;

    .prologue
    .line 328
    new-instance v0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;-><init>()V

    .line 330
    .local v0, "item":Lcom/mobnetic/coinguardian/db/content/AlarmRecord;
    invoke-virtual {v0, p0}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->setPropertiesFromCursor(Landroid/database/Cursor;)V

    .line 332
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->makeDirty(Z)V

    .line 334
    return-object v0
.end method

.method public static get(J)Lcom/mobnetic/coinguardian/db/content/AlarmRecord;
    .locals 8
    .param p0, "id"    # J

    .prologue
    const/4 v7, 0x0

    .line 343
    const/4 v6, 0x0

    .line 345
    .local v6, "c":Landroid/database/Cursor;
    invoke-static {}, Lcom/robotoworks/mechanoid/Mechanoid;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 348
    .local v0, "resolver":Landroid/content/ContentResolver;
    :try_start_0
    sget-object v1, Lcom/mobnetic/coinguardian/db/content/MaindbContract$Alarm;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v1}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v1

    .line 349
    invoke-static {p0, p1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v1

    sget-object v2, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->PROJECTION:[Ljava/lang/String;

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    .line 348
    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 351
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v1

    if-nez v1, :cond_0

    .line 357
    invoke-static {v6}, Lcom/robotoworks/mechanoid/util/Closeables;->closeSilently(Landroid/database/Cursor;)V

    move-object v1, v7

    .line 355
    :goto_0
    return-object v1

    :cond_0
    :try_start_1
    invoke-static {v6}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->fromCursor(Landroid/database/Cursor;)Lcom/mobnetic/coinguardian/db/content/AlarmRecord;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v1

    .line 357
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
            "Lcom/mobnetic/coinguardian/db/content/AlarmRecord;",
            ">;"
        }
    .end annotation

    .prologue
    .line 35
    sget-object v0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->sFactory:Lcom/robotoworks/mechanoid/db/ActiveRecordFactory;

    return-object v0
.end method


# virtual methods
.method protected _getProjection()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 100
    sget-object v0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->PROJECTION:[Ljava/lang/String;

    return-object v0
.end method

.method protected createBuilder()Lcom/robotoworks/mechanoid/db/AbstractValuesBuilder;
    .locals 4

    .prologue
    .line 262
    invoke-static {}, Lcom/mobnetic/coinguardian/db/content/MaindbContract$Alarm;->newBuilder()Lcom/mobnetic/coinguardian/db/content/MaindbContract$Alarm$Builder;

    move-result-object v0

    .line 264
    .local v0, "builder":Lcom/mobnetic/coinguardian/db/content/MaindbContract$Alarm$Builder;
    iget-boolean v1, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mCheckerIdDirty:Z

    if-eqz v1, :cond_0

    .line 265
    iget-wide v2, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mCheckerId:J

    invoke-virtual {v0, v2, v3}, Lcom/mobnetic/coinguardian/db/content/MaindbContract$Alarm$Builder;->setCheckerId(J)Lcom/mobnetic/coinguardian/db/content/MaindbContract$Alarm$Builder;

    .line 267
    :cond_0
    iget-boolean v1, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mEnabledDirty:Z

    if-eqz v1, :cond_1

    .line 268
    iget-boolean v1, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mEnabled:Z

    invoke-virtual {v0, v1}, Lcom/mobnetic/coinguardian/db/content/MaindbContract$Alarm$Builder;->setEnabled(Z)Lcom/mobnetic/coinguardian/db/content/MaindbContract$Alarm$Builder;

    .line 270
    :cond_1
    iget-boolean v1, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mTypeDirty:Z

    if-eqz v1, :cond_2

    .line 271
    iget-wide v2, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mType:J

    invoke-virtual {v0, v2, v3}, Lcom/mobnetic/coinguardian/db/content/MaindbContract$Alarm$Builder;->setType(J)Lcom/mobnetic/coinguardian/db/content/MaindbContract$Alarm$Builder;

    .line 273
    :cond_2
    iget-boolean v1, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mValueDirty:Z

    if-eqz v1, :cond_3

    .line 274
    iget-wide v2, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mValue:D

    invoke-virtual {v0, v2, v3}, Lcom/mobnetic/coinguardian/db/content/MaindbContract$Alarm$Builder;->setValue(D)Lcom/mobnetic/coinguardian/db/content/MaindbContract$Alarm$Builder;

    .line 276
    :cond_3
    iget-boolean v1, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mSoundDirty:Z

    if-eqz v1, :cond_4

    .line 277
    iget-boolean v1, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mSound:Z

    invoke-virtual {v0, v1}, Lcom/mobnetic/coinguardian/db/content/MaindbContract$Alarm$Builder;->setSound(Z)Lcom/mobnetic/coinguardian/db/content/MaindbContract$Alarm$Builder;

    .line 279
    :cond_4
    iget-boolean v1, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mSoundUriDirty:Z

    if-eqz v1, :cond_5

    .line 280
    iget-object v1, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mSoundUri:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/mobnetic/coinguardian/db/content/MaindbContract$Alarm$Builder;->setSoundUri(Ljava/lang/String;)Lcom/mobnetic/coinguardian/db/content/MaindbContract$Alarm$Builder;

    .line 282
    :cond_5
    iget-boolean v1, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mVibrateDirty:Z

    if-eqz v1, :cond_6

    .line 283
    iget-boolean v1, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mVibrate:Z

    invoke-virtual {v0, v1}, Lcom/mobnetic/coinguardian/db/content/MaindbContract$Alarm$Builder;->setVibrate(Z)Lcom/mobnetic/coinguardian/db/content/MaindbContract$Alarm$Builder;

    .line 285
    :cond_6
    iget-boolean v1, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mLedDirty:Z

    if-eqz v1, :cond_7

    .line 286
    iget-boolean v1, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mLed:Z

    invoke-virtual {v0, v1}, Lcom/mobnetic/coinguardian/db/content/MaindbContract$Alarm$Builder;->setLed(Z)Lcom/mobnetic/coinguardian/db/content/MaindbContract$Alarm$Builder;

    .line 288
    :cond_7
    iget-boolean v1, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mTtsEnabledDirty:Z

    if-eqz v1, :cond_8

    .line 289
    iget-boolean v1, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mTtsEnabled:Z

    invoke-virtual {v0, v1}, Lcom/mobnetic/coinguardian/db/content/MaindbContract$Alarm$Builder;->setTtsEnabled(Z)Lcom/mobnetic/coinguardian/db/content/MaindbContract$Alarm$Builder;

    .line 291
    :cond_8
    iget-boolean v1, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mLastCheckPointTickerDirty:Z

    if-eqz v1, :cond_9

    .line 292
    iget-object v1, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mLastCheckPointTicker:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/mobnetic/coinguardian/db/content/MaindbContract$Alarm$Builder;->setLastCheckPointTicker(Ljava/lang/String;)Lcom/mobnetic/coinguardian/db/content/MaindbContract$Alarm$Builder;

    .line 295
    :cond_9
    return-object v0
.end method

.method public describeContents()I
    .locals 1

    .prologue
    .line 230
    const/4 v0, 0x0

    return v0
.end method

.method public getCheckerId()J
    .locals 2

    .prologue
    .line 109
    iget-wide v0, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mCheckerId:J

    return-wide v0
.end method

.method public getEnabled()Z
    .locals 1

    .prologue
    .line 118
    iget-boolean v0, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mEnabled:Z

    return v0
.end method

.method public getLastCheckPointTicker()Ljava/lang/String;
    .locals 1

    .prologue
    .line 190
    iget-object v0, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mLastCheckPointTicker:Ljava/lang/String;

    return-object v0
.end method

.method public getLed()Z
    .locals 1

    .prologue
    .line 172
    iget-boolean v0, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mLed:Z

    return v0
.end method

.method public getSound()Z
    .locals 1

    .prologue
    .line 145
    iget-boolean v0, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mSound:Z

    return v0
.end method

.method public getSoundUri()Ljava/lang/String;
    .locals 1

    .prologue
    .line 154
    iget-object v0, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mSoundUri:Ljava/lang/String;

    return-object v0
.end method

.method public getTtsEnabled()Z
    .locals 1

    .prologue
    .line 181
    iget-boolean v0, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mTtsEnabled:Z

    return v0
.end method

.method public getType()J
    .locals 2

    .prologue
    .line 127
    iget-wide v0, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mType:J

    return-wide v0
.end method

.method public getValue()D
    .locals 2

    .prologue
    .line 136
    iget-wide v0, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mValue:D

    return-wide v0
.end method

.method public getVibrate()Z
    .locals 1

    .prologue
    .line 163
    iget-boolean v0, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mVibrate:Z

    return v0
.end method

.method public makeDirty(Z)V
    .locals 0
    .param p1, "dirty"    # Z

    .prologue
    .line 300
    iput-boolean p1, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mCheckerIdDirty:Z

    .line 301
    iput-boolean p1, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mEnabledDirty:Z

    .line 302
    iput-boolean p1, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mTypeDirty:Z

    .line 303
    iput-boolean p1, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mValueDirty:Z

    .line 304
    iput-boolean p1, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mSoundDirty:Z

    .line 305
    iput-boolean p1, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mSoundUriDirty:Z

    .line 306
    iput-boolean p1, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mVibrateDirty:Z

    .line 307
    iput-boolean p1, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mLedDirty:Z

    .line 308
    iput-boolean p1, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mTtsEnabledDirty:Z

    .line 309
    iput-boolean p1, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mLastCheckPointTickerDirty:Z

    .line 310
    return-void
.end method

.method public setCheckerId(J)V
    .locals 1
    .param p1, "checkerId"    # J

    .prologue
    .line 104
    iput-wide p1, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mCheckerId:J

    .line 105
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mCheckerIdDirty:Z

    .line 106
    return-void
.end method

.method public setEnabled(Z)V
    .locals 1
    .param p1, "enabled"    # Z

    .prologue
    .line 113
    iput-boolean p1, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mEnabled:Z

    .line 114
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mEnabledDirty:Z

    .line 115
    return-void
.end method

.method public setLastCheckPointTicker(Ljava/lang/String;)V
    .locals 1
    .param p1, "lastCheckPointTicker"    # Ljava/lang/String;

    .prologue
    .line 185
    iput-object p1, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mLastCheckPointTicker:Ljava/lang/String;

    .line 186
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mLastCheckPointTickerDirty:Z

    .line 187
    return-void
.end method

.method public setLed(Z)V
    .locals 1
    .param p1, "led"    # Z

    .prologue
    .line 167
    iput-boolean p1, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mLed:Z

    .line 168
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mLedDirty:Z

    .line 169
    return-void
.end method

.method protected setPropertiesFromCursor(Landroid/database/Cursor;)V
    .locals 6
    .param p1, "c"    # Landroid/database/Cursor;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 314
    invoke-interface {p1, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    invoke-virtual {p0, v4, v5}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->setId(J)V

    .line 315
    invoke-interface {p1, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    invoke-virtual {p0, v4, v5}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->setCheckerId(J)V

    .line 316
    const/4 v0, 0x2

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    if-lez v0, :cond_0

    move v0, v1

    :goto_0
    invoke-virtual {p0, v0}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->setEnabled(Z)V

    .line 317
    const/4 v0, 0x3

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    invoke-virtual {p0, v4, v5}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->setType(J)V

    .line 318
    const/4 v0, 0x4

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getDouble(I)D

    move-result-wide v4

    invoke-virtual {p0, v4, v5}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->setValue(D)V

    .line 319
    const/4 v0, 0x5

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    if-lez v0, :cond_1

    move v0, v1

    :goto_1
    invoke-virtual {p0, v0}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->setSound(Z)V

    .line 320
    const/4 v0, 0x6

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->setSoundUri(Ljava/lang/String;)V

    .line 321
    const/4 v0, 0x7

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    if-lez v0, :cond_2

    move v0, v1

    :goto_2
    invoke-virtual {p0, v0}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->setVibrate(Z)V

    .line 322
    const/16 v0, 0x8

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    if-lez v0, :cond_3

    move v0, v1

    :goto_3
    invoke-virtual {p0, v0}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->setLed(Z)V

    .line 323
    const/16 v0, 0x9

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    if-lez v0, :cond_4

    :goto_4
    invoke-virtual {p0, v1}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->setTtsEnabled(Z)V

    .line 324
    const/16 v0, 0xa

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->setLastCheckPointTicker(Ljava/lang/String;)V

    .line 325
    return-void

    :cond_0
    move v0, v2

    .line 316
    goto :goto_0

    :cond_1
    move v0, v2

    .line 319
    goto :goto_1

    :cond_2
    move v0, v2

    .line 321
    goto :goto_2

    :cond_3
    move v0, v2

    .line 322
    goto :goto_3

    :cond_4
    move v1, v2

    .line 323
    goto :goto_4
.end method

.method public setSound(Z)V
    .locals 1
    .param p1, "sound"    # Z

    .prologue
    .line 140
    iput-boolean p1, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mSound:Z

    .line 141
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mSoundDirty:Z

    .line 142
    return-void
.end method

.method public setSoundUri(Ljava/lang/String;)V
    .locals 1
    .param p1, "soundUri"    # Ljava/lang/String;

    .prologue
    .line 149
    iput-object p1, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mSoundUri:Ljava/lang/String;

    .line 150
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mSoundUriDirty:Z

    .line 151
    return-void
.end method

.method public setTtsEnabled(Z)V
    .locals 1
    .param p1, "ttsEnabled"    # Z

    .prologue
    .line 176
    iput-boolean p1, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mTtsEnabled:Z

    .line 177
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mTtsEnabledDirty:Z

    .line 178
    return-void
.end method

.method public setType(J)V
    .locals 1
    .param p1, "type"    # J

    .prologue
    .line 122
    iput-wide p1, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mType:J

    .line 123
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mTypeDirty:Z

    .line 124
    return-void
.end method

.method public setValue(D)V
    .locals 1
    .param p1, "value"    # D

    .prologue
    .line 131
    iput-wide p1, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mValue:D

    .line 132
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mValueDirty:Z

    .line 133
    return-void
.end method

.method public setVibrate(Z)V
    .locals 1
    .param p1, "vibrate"    # Z

    .prologue
    .line 158
    iput-boolean p1, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mVibrate:Z

    .line 159
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mVibrateDirty:Z

    .line 160
    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 6
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 235
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->getId()J

    move-result-wide v4

    invoke-virtual {p1, v4, v5}, Landroid/os/Parcel;->writeLong(J)V

    .line 236
    iget-wide v4, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mCheckerId:J

    invoke-virtual {p1, v4, v5}, Landroid/os/Parcel;->writeLong(J)V

    .line 237
    iget-boolean v0, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mEnabled:Z

    if-eqz v0, :cond_0

    move v0, v1

    :goto_0
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 238
    iget-wide v4, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mType:J

    invoke-virtual {p1, v4, v5}, Landroid/os/Parcel;->writeLong(J)V

    .line 239
    iget-wide v4, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mValue:D

    invoke-virtual {p1, v4, v5}, Landroid/os/Parcel;->writeDouble(D)V

    .line 240
    iget-boolean v0, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mSound:Z

    if-eqz v0, :cond_1

    move v0, v1

    :goto_1
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 241
    iget-object v0, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mSoundUri:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 242
    iget-boolean v0, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mVibrate:Z

    if-eqz v0, :cond_2

    move v0, v1

    :goto_2
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 243
    iget-boolean v0, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mLed:Z

    if-eqz v0, :cond_3

    move v0, v1

    :goto_3
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 244
    iget-boolean v0, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mTtsEnabled:Z

    if-eqz v0, :cond_4

    move v0, v1

    :goto_4
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 245
    iget-object v0, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mLastCheckPointTicker:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 246
    const/16 v0, 0xa

    new-array v0, v0, [Z

    iget-boolean v3, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mCheckerIdDirty:Z

    aput-boolean v3, v0, v2

    iget-boolean v2, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mEnabledDirty:Z

    aput-boolean v2, v0, v1

    const/4 v1, 0x2

    iget-boolean v2, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mTypeDirty:Z

    aput-boolean v2, v0, v1

    const/4 v1, 0x3

    iget-boolean v2, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mValueDirty:Z

    aput-boolean v2, v0, v1

    const/4 v1, 0x4

    iget-boolean v2, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mSoundDirty:Z

    aput-boolean v2, v0, v1

    const/4 v1, 0x5

    iget-boolean v2, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mSoundUriDirty:Z

    aput-boolean v2, v0, v1

    const/4 v1, 0x6

    iget-boolean v2, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mVibrateDirty:Z

    aput-boolean v2, v0, v1

    const/4 v1, 0x7

    iget-boolean v2, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mLedDirty:Z

    aput-boolean v2, v0, v1

    const/16 v1, 0x8

    iget-boolean v2, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mTtsEnabledDirty:Z

    aput-boolean v2, v0, v1

    const/16 v1, 0x9

    iget-boolean v2, p0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->mLastCheckPointTickerDirty:Z

    aput-boolean v2, v0, v1

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeBooleanArray([Z)V

    .line 258
    return-void

    :cond_0
    move v0, v2

    .line 237
    goto :goto_0

    :cond_1
    move v0, v2

    .line 240
    goto :goto_1

    :cond_2
    move v0, v2

    .line 242
    goto :goto_2

    :cond_3
    move v0, v2

    .line 243
    goto :goto_3

    :cond_4
    move v0, v2

    .line 244
    goto :goto_4
.end method
