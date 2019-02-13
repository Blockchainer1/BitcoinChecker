.class public abstract Lcom/robotoworks/mechanoid/db/SQLiteMigration;
.super Ljava/lang/Object;
.source "SQLiteMigration.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract onAfterUp(Landroid/database/sqlite/SQLiteDatabase;)V
.end method

.method public abstract onBeforeUp(Landroid/database/sqlite/SQLiteDatabase;)V
.end method

.method public abstract up(Landroid/database/sqlite/SQLiteDatabase;)V
.end method
