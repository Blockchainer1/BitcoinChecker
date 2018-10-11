.class public Lcom/mobnetic/coinguardian/activity/CheckerAddActivity;
.super Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentSubActivity;
.source "CheckerAddActivity.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentSubActivity",
        "<",
        "Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;",
        ">;"
    }
.end annotation


# static fields
.field public static final EXTRA_CHECKER_RECORD:Ljava/lang/String; = "checker_record"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 12
    invoke-direct {p0}, Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentSubActivity;-><init>()V

    return-void
.end method

.method public static startCheckerAddActivity(Landroid/content/Context;Lcom/mobnetic/coinguardian/db/content/CheckerRecord;)V
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "checkerRecord"    # Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    .prologue
    .line 42
    const-wide/16 v0, -0x1

    const/4 v2, 0x0

    invoke-static {p0, p1, v0, v1, v2}, Lcom/mobnetic/coinguardian/activity/CheckerAddActivity;->startCheckerAddActivity(Landroid/content/Context;Lcom/mobnetic/coinguardian/db/content/CheckerRecord;JZ)V

    .line 43
    return-void
.end method

.method public static startCheckerAddActivity(Landroid/content/Context;Lcom/mobnetic/coinguardian/db/content/CheckerRecord;JZ)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "checkerRecord"    # Lcom/mobnetic/coinguardian/db/content/CheckerRecord;
    .param p2, "alarmRecordId"    # J
    .param p4, "newTask"    # Z

    .prologue
    .line 45
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/mobnetic/coinguardian/activity/CheckerAddActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 46
    .local v0, "intent":Landroid/content/Intent;
    if-eqz p4, :cond_0

    .line 47
    const/high16 v1, 0x10000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 48
    :cond_0
    const-string v1, "checker_record"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 49
    const-string v1, "alarm_record_id"

    invoke-virtual {v0, v1, p2, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 50
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 51
    return-void
.end method


# virtual methods
.method protected bridge synthetic createChildFragment()Landroid/support/v4/app/Fragment;
    .locals 1

    .prologue
    .line 12
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/activity/CheckerAddActivity;->createChildFragment()Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

    move-result-object v0

    return-object v0
.end method

.method protected createChildFragment()Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;
    .locals 10

    .prologue
    const-wide/16 v8, 0x0

    .line 18
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/activity/CheckerAddActivity;->getIntent()Landroid/content/Intent;

    move-result-object v3

    const-string v6, "checker_record"

    invoke-virtual {v3, v6}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v2

    check-cast v2, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    .line 19
    .local v2, "checkerRecord":Lcom/mobnetic/coinguardian/db/content/CheckerRecord;
    if-nez v2, :cond_0

    .line 20
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/activity/CheckerAddActivity;->getIntent()Landroid/content/Intent;

    move-result-object v3

    const-string v6, "checker_record_id"

    invoke-virtual {v3, v6, v8, v9}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v4

    .line 21
    .local v4, "checkerRecordId":J
    cmp-long v3, v4, v8

    if-lez v3, :cond_0

    .line 22
    invoke-static {v4, v5}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->get(J)Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    move-result-object v2

    .line 24
    .end local v4    # "checkerRecordId":J
    :cond_0
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/activity/CheckerAddActivity;->getIntent()Landroid/content/Intent;

    move-result-object v3

    const-string v6, "alarm_record_id"

    invoke-virtual {v3, v6, v8, v9}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v0

    .line 26
    .local v0, "alarmRecordId":J
    invoke-static {v2, v0, v1}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->newInstance(Lcom/mobnetic/coinguardian/db/content/CheckerRecord;J)Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

    move-result-object v3

    return-object v3
.end method

.method public onBackPressed()V
    .locals 2

    .prologue
    .line 31
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/activity/CheckerAddActivity;->getChildFragment()Landroid/support/v4/app/Fragment;

    move-result-object v0

    .line 32
    .local v0, "childFragment":Landroid/support/v4/app/Fragment;
    instance-of v1, v0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

    if-eqz v1, :cond_0

    check-cast v0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

    .end local v0    # "childFragment":Landroid/support/v4/app/Fragment;
    invoke-virtual {v0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->onBackPressed()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 36
    :goto_0
    return-void

    .line 35
    :cond_0
    invoke-super {p0}, Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentSubActivity;->onBackPressed()V

    goto :goto_0
.end method
