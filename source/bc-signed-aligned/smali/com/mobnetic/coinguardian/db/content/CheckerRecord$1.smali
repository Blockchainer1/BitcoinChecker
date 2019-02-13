.class final Lcom/mobnetic/coinguardian/db/content/CheckerRecord$1;
.super Lcom/robotoworks/mechanoid/db/ActiveRecordFactory;
.source "CheckerRecord.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mobnetic/coinguardian/db/content/CheckerRecord;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/robotoworks/mechanoid/db/ActiveRecordFactory",
        "<",
        "Lcom/mobnetic/coinguardian/db/content/CheckerRecord;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 22
    invoke-direct {p0}, Lcom/robotoworks/mechanoid/db/ActiveRecordFactory;-><init>()V

    return-void
.end method


# virtual methods
.method public create(Landroid/database/Cursor;)Lcom/mobnetic/coinguardian/db/content/CheckerRecord;
    .locals 1
    .param p1, "c"    # Landroid/database/Cursor;

    .prologue
    .line 25
    invoke-static {p1}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->fromCursor(Landroid/database/Cursor;)Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic create(Landroid/database/Cursor;)Lcom/robotoworks/mechanoid/db/ActiveRecord;
    .locals 1

    .prologue
    .line 22
    invoke-virtual {p0, p1}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord$1;->create(Landroid/database/Cursor;)Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    move-result-object v0

    return-object v0
.end method

.method public getProjection()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 30
    sget-object v0, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->PROJECTION:[Ljava/lang/String;

    return-object v0
.end method
