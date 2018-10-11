.class final Lcom/mobnetic/coinguardian/receiver/MarketChecker$1;
.super Landroid/os/AsyncTask;
.source "MarketChecker.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mobnetic/coinguardian/receiver/MarketChecker;->checkIfAlarmsAreSet(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic val$appContext:Landroid/content/Context;


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .locals 0

    .prologue
    .line 126
    iput-object p1, p0, Lcom/mobnetic/coinguardian/receiver/MarketChecker$1;->val$appContext:Landroid/content/Context;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 126
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/mobnetic/coinguardian/receiver/MarketChecker$1;->doInBackground([Ljava/lang/Void;)Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/lang/Void;
    .locals 5
    .param p1, "unused"    # [Ljava/lang/Void;

    .prologue
    const/4 v4, 0x1

    .line 128
    invoke-static {}, Lcom/robotoworks/mechanoid/db/SQuery;->newQuery()Lcom/robotoworks/mechanoid/db/SQuery;

    move-result-object v1

    sget-object v2, Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker;->CONTENT_URI:Landroid/net/Uri;

    sget-object v3, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->PROJECTION:[Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Lcom/robotoworks/mechanoid/db/SQuery;->select(Landroid/net/Uri;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 129
    .local v0, "cursor":Landroid/database/Cursor;
    if-eqz v0, :cond_2

    .line 130
    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 132
    :cond_0
    invoke-interface {v0, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    if-eqz v1, :cond_3

    iget-object v1, p0, Lcom/mobnetic/coinguardian/receiver/MarketChecker$1;->val$appContext:Landroid/content/Context;

    const/4 v2, 0x0

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    int-to-long v2, v2

    invoke-static {v1, v2, v3}, Lcom/mobnetic/coinguardian/receiver/MarketChecker;->isAlarmScheduledForChecker(Landroid/content/Context;J)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 137
    :goto_0
    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v1

    if-nez v1, :cond_0

    .line 139
    :cond_1
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 141
    :cond_2
    const/4 v1, 0x0

    return-object v1

    .line 135
    :cond_3
    iget-object v1, p0, Lcom/mobnetic/coinguardian/receiver/MarketChecker$1;->val$appContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->fromCursor(Landroid/database/Cursor;)Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    move-result-object v2

    invoke-static {v1, v2, v4}, Lcom/mobnetic/coinguardian/receiver/MarketChecker;->resetAlarmManagerForChecker(Landroid/content/Context;Lcom/mobnetic/coinguardian/db/content/CheckerRecord;Z)V

    goto :goto_0
.end method
