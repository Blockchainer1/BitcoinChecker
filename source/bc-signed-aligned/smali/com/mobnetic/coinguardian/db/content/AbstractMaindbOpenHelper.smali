.class public abstract Lcom/mobnetic/coinguardian/db/content/AbstractMaindbOpenHelper;
.super Lcom/robotoworks/mechanoid/db/MechanoidSQLiteOpenHelper;
.source "AbstractMaindbOpenHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mobnetic/coinguardian/db/content/AbstractMaindbOpenHelper$Sources;
    }
.end annotation


# static fields
.field private static final DATABASE_NAME:Ljava/lang/String; = "maindb.db"

.field public static final VERSION:I = 0xa


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 33
    const-string v0, "maindb.db"

    const/4 v1, 0x0

    const/16 v2, 0xa

    invoke-direct {p0, p1, v0, v1, v2}, Lcom/robotoworks/mechanoid/db/MechanoidSQLiteOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V

    .line 34
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    .line 37
    const/4 v0, 0x0

    const/16 v1, 0xa

    invoke-direct {p0, p1, p2, v0, v1}, Lcom/robotoworks/mechanoid/db/MechanoidSQLiteOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V

    .line 38
    return-void
.end method


# virtual methods
.method protected createMaindbMigrationV1()Lcom/robotoworks/mechanoid/db/SQLiteMigration;
    .locals 1

    .prologue
    .line 75
    new-instance v0, Lcom/mobnetic/coinguardian/db/content/migrations/DefaultMaindbMigrationV1;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/db/content/migrations/DefaultMaindbMigrationV1;-><init>()V

    return-object v0
.end method

.method protected createMaindbMigrationV10()Lcom/robotoworks/mechanoid/db/SQLiteMigration;
    .locals 1

    .prologue
    .line 102
    new-instance v0, Lcom/mobnetic/coinguardian/db/content/migrations/DefaultMaindbMigrationV10;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/db/content/migrations/DefaultMaindbMigrationV10;-><init>()V

    return-object v0
.end method

.method protected createMaindbMigrationV2()Lcom/robotoworks/mechanoid/db/SQLiteMigration;
    .locals 1

    .prologue
    .line 78
    new-instance v0, Lcom/mobnetic/coinguardian/db/content/migrations/DefaultMaindbMigrationV2;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/db/content/migrations/DefaultMaindbMigrationV2;-><init>()V

    return-object v0
.end method

.method protected createMaindbMigrationV3()Lcom/robotoworks/mechanoid/db/SQLiteMigration;
    .locals 1

    .prologue
    .line 81
    new-instance v0, Lcom/mobnetic/coinguardian/db/content/migrations/DefaultMaindbMigrationV3;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/db/content/migrations/DefaultMaindbMigrationV3;-><init>()V

    return-object v0
.end method

.method protected createMaindbMigrationV4()Lcom/robotoworks/mechanoid/db/SQLiteMigration;
    .locals 1

    .prologue
    .line 84
    new-instance v0, Lcom/mobnetic/coinguardian/db/content/migrations/DefaultMaindbMigrationV4;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/db/content/migrations/DefaultMaindbMigrationV4;-><init>()V

    return-object v0
.end method

.method protected createMaindbMigrationV5()Lcom/robotoworks/mechanoid/db/SQLiteMigration;
    .locals 1

    .prologue
    .line 87
    new-instance v0, Lcom/mobnetic/coinguardian/db/content/migrations/DefaultMaindbMigrationV5;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/db/content/migrations/DefaultMaindbMigrationV5;-><init>()V

    return-object v0
.end method

.method protected createMaindbMigrationV6()Lcom/robotoworks/mechanoid/db/SQLiteMigration;
    .locals 1

    .prologue
    .line 90
    new-instance v0, Lcom/mobnetic/coinguardian/db/content/migrations/DefaultMaindbMigrationV6;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/db/content/migrations/DefaultMaindbMigrationV6;-><init>()V

    return-object v0
.end method

.method protected createMaindbMigrationV7()Lcom/robotoworks/mechanoid/db/SQLiteMigration;
    .locals 1

    .prologue
    .line 93
    new-instance v0, Lcom/mobnetic/coinguardian/db/content/migrations/DefaultMaindbMigrationV7;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/db/content/migrations/DefaultMaindbMigrationV7;-><init>()V

    return-object v0
.end method

.method protected createMaindbMigrationV8()Lcom/robotoworks/mechanoid/db/SQLiteMigration;
    .locals 1

    .prologue
    .line 96
    new-instance v0, Lcom/mobnetic/coinguardian/db/content/migrations/DefaultMaindbMigrationV8;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/db/content/migrations/DefaultMaindbMigrationV8;-><init>()V

    return-object v0
.end method

.method protected createMaindbMigrationV9()Lcom/robotoworks/mechanoid/db/SQLiteMigration;
    .locals 1

    .prologue
    .line 99
    new-instance v0, Lcom/mobnetic/coinguardian/db/content/migrations/DefaultMaindbMigrationV9;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/db/content/migrations/DefaultMaindbMigrationV9;-><init>()V

    return-object v0
.end method

.method protected createMigration(I)Lcom/robotoworks/mechanoid/db/SQLiteMigration;
    .locals 3
    .param p1, "version"    # I

    .prologue
    .line 48
    packed-switch p1, :pswitch_data_0

    .line 70
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "No migration for version "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 50
    :pswitch_0
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/db/content/AbstractMaindbOpenHelper;->createMaindbMigrationV1()Lcom/robotoworks/mechanoid/db/SQLiteMigration;

    move-result-object v0

    .line 68
    :goto_0
    return-object v0

    .line 52
    :pswitch_1
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/db/content/AbstractMaindbOpenHelper;->createMaindbMigrationV2()Lcom/robotoworks/mechanoid/db/SQLiteMigration;

    move-result-object v0

    goto :goto_0

    .line 54
    :pswitch_2
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/db/content/AbstractMaindbOpenHelper;->createMaindbMigrationV3()Lcom/robotoworks/mechanoid/db/SQLiteMigration;

    move-result-object v0

    goto :goto_0

    .line 56
    :pswitch_3
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/db/content/AbstractMaindbOpenHelper;->createMaindbMigrationV4()Lcom/robotoworks/mechanoid/db/SQLiteMigration;

    move-result-object v0

    goto :goto_0

    .line 58
    :pswitch_4
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/db/content/AbstractMaindbOpenHelper;->createMaindbMigrationV5()Lcom/robotoworks/mechanoid/db/SQLiteMigration;

    move-result-object v0

    goto :goto_0

    .line 60
    :pswitch_5
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/db/content/AbstractMaindbOpenHelper;->createMaindbMigrationV6()Lcom/robotoworks/mechanoid/db/SQLiteMigration;

    move-result-object v0

    goto :goto_0

    .line 62
    :pswitch_6
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/db/content/AbstractMaindbOpenHelper;->createMaindbMigrationV7()Lcom/robotoworks/mechanoid/db/SQLiteMigration;

    move-result-object v0

    goto :goto_0

    .line 64
    :pswitch_7
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/db/content/AbstractMaindbOpenHelper;->createMaindbMigrationV8()Lcom/robotoworks/mechanoid/db/SQLiteMigration;

    move-result-object v0

    goto :goto_0

    .line 66
    :pswitch_8
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/db/content/AbstractMaindbOpenHelper;->createMaindbMigrationV9()Lcom/robotoworks/mechanoid/db/SQLiteMigration;

    move-result-object v0

    goto :goto_0

    .line 68
    :pswitch_9
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/db/content/AbstractMaindbOpenHelper;->createMaindbMigrationV10()Lcom/robotoworks/mechanoid/db/SQLiteMigration;

    move-result-object v0

    goto :goto_0

    .line 48
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_9
    .end packed-switch
.end method

.method public onCreate(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 2
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .prologue
    .line 42
    const/4 v0, 0x0

    const/16 v1, 0xa

    invoke-virtual {p0, p1, v0, v1}, Lcom/mobnetic/coinguardian/db/content/AbstractMaindbOpenHelper;->applyMigrations(Landroid/database/sqlite/SQLiteDatabase;II)V

    .line 43
    return-void
.end method
