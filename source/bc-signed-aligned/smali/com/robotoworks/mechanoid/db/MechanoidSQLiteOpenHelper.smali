.class public abstract Lcom/robotoworks/mechanoid/db/MechanoidSQLiteOpenHelper;
.super Landroid/database/sqlite/SQLiteOpenHelper;
.source "MechanoidSQLiteOpenHelper.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "factory"    # Landroid/database/sqlite/SQLiteDatabase$CursorFactory;
    .param p4, "version"    # I

    .prologue
    .line 30
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/database/sqlite/SQLiteOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V

    .line 31
    return-void
.end method


# virtual methods
.method protected applyMigrations(Landroid/database/sqlite/SQLiteDatabase;II)V
    .locals 2
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p2, "from"    # I
    .param p3, "to"    # I

    .prologue
    .line 51
    move v0, p2

    .local v0, "i":I
    :goto_0
    if-ge v0, p3, :cond_0

    .line 52
    invoke-virtual {p0, v0}, Lcom/robotoworks/mechanoid/db/MechanoidSQLiteOpenHelper;->createMigration(I)Lcom/robotoworks/mechanoid/db/SQLiteMigration;

    move-result-object v1

    .line 53
    .local v1, "migration":Lcom/robotoworks/mechanoid/db/SQLiteMigration;
    invoke-virtual {v1, p1}, Lcom/robotoworks/mechanoid/db/SQLiteMigration;->onBeforeUp(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 54
    invoke-virtual {v1, p1}, Lcom/robotoworks/mechanoid/db/SQLiteMigration;->up(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 55
    invoke-virtual {v1, p1}, Lcom/robotoworks/mechanoid/db/SQLiteMigration;->onAfterUp(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 51
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 57
    .end local v1    # "migration":Lcom/robotoworks/mechanoid/db/SQLiteMigration;
    :cond_0
    return-void
.end method

.method protected abstract createMigration(I)Lcom/robotoworks/mechanoid/db/SQLiteMigration;
.end method

.method public onConfigure(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 2
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .prologue
    .line 36
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->isReadOnly()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/robotoworks/mechanoid/db/MechanoidSQLiteOpenHelper;->shouldEnableForeignKeyConstraints()Z

    move-result v0

    if-nez v0, :cond_1

    .line 43
    :cond_0
    :goto_0
    return-void

    .line 39
    :cond_1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_2

    .line 40
    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->setForeignKeyConstraintsEnabled(Z)V

    goto :goto_0

    .line 41
    :cond_2
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x8

    if-lt v0, v1, :cond_0

    .line 42
    const-string v0, "PRAGMA foreign_keys=ON;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public onUpgrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .locals 0
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p2, "oldVersion"    # I
    .param p3, "newVersion"    # I

    .prologue
    .line 47
    invoke-virtual {p0, p1, p2, p3}, Lcom/robotoworks/mechanoid/db/MechanoidSQLiteOpenHelper;->applyMigrations(Landroid/database/sqlite/SQLiteDatabase;II)V

    .line 48
    return-void
.end method

.method protected shouldEnableForeignKeyConstraints()Z
    .locals 1

    .prologue
    .line 67
    const/4 v0, 0x0

    return v0
.end method
