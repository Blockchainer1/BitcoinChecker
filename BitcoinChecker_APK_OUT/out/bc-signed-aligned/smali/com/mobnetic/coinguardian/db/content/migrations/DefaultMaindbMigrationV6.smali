.class public Lcom/mobnetic/coinguardian/db/content/migrations/DefaultMaindbMigrationV6;
.super Lcom/robotoworks/mechanoid/db/SQLiteMigration;
.source "DefaultMaindbMigrationV6.java"


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
    .line 24
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
    const-string v0, "alter table checker add column currencySubunitSrc integer "

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 18
    const-string v0, "alter table checker add column currencySubunitDst integer "

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 21
    return-void
.end method
