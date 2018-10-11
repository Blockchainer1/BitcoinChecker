.class public Lcom/mobnetic/coinguardian/db/content/migrations/DefaultMaindbMigrationV1;
.super Lcom/robotoworks/mechanoid/db/SQLiteMigration;
.source "DefaultMaindbMigrationV1.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 9
    invoke-direct {p0}, Lcom/robotoworks/mechanoid/db/SQLiteMigration;-><init>()V

    return-void
.end method


# virtual methods
.method public onAfterUp(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 0
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .prologue
    .line 47
    return-void
.end method

.method public onBeforeUp(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 0
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .prologue
    .line 11
    return-void
.end method

.method public up(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .prologue
    .line 15
    const-string v0, "create table checker ( _id integer primary key autoincrement, enabled boolean, marketKey text, currencySrc text, currencyDst text, frequency integer, notificationPriority integer, ttsEnabled boolean,  lastCheckTicker text, lastCheckPointTicker text ) "

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 30
    const-string v0, "create table alarm ( _id integer primary key autoincrement, checkerId integer, enabled boolean, type integer, value real, sound boolean, soundUri text, vibrate boolean, led boolean, ttsEnabled boolean ) "

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 44
    return-void
.end method
