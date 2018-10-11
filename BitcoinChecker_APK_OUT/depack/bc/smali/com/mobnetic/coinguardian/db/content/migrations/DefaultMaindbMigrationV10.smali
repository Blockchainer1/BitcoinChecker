.class public Lcom/mobnetic/coinguardian/db/content/migrations/DefaultMaindbMigrationV10;
.super Lcom/robotoworks/mechanoid/db/SQLiteMigration;
.source "DefaultMaindbMigrationV10.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 10
    invoke-direct {p0}, Lcom/robotoworks/mechanoid/db/SQLiteMigration;-><init>()V

    return-void
.end method


# virtual methods
.method public onAfterUp(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 0
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .prologue
    .line 22
    return-void
.end method

.method public onBeforeUp(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 0
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .prologue
    .line 12
    return-void
.end method

.method public up(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .prologue
    .line 16
    const-string v0, "update checker set currencySrc = \'DSH\' WHERE marketKey = \'Bitfinex\' and currencySrc = \'DASH\'"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 19
    return-void
.end method
