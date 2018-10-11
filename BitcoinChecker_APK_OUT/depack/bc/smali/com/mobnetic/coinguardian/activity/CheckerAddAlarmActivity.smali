.class public Lcom/mobnetic/coinguardian/activity/CheckerAddAlarmActivity;
.super Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentSubActivity;
.source "CheckerAddAlarmActivity.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentSubActivity",
        "<",
        "Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;",
        ">;"
    }
.end annotation


# static fields
.field public static final EXTRA_ALARM_RECORD:Ljava/lang/String; = "alarm_record"

.field public static final EXTRA_ALARM_RECORD_INDEX:Ljava/lang/String; = "alarm_record_index"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 12
    invoke-direct {p0}, Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentSubActivity;-><init>()V

    return-void
.end method

.method public static startCheckerAddAlarmActivity(Landroid/support/v4/app/Fragment;ILcom/mobnetic/coinguardian/db/content/CheckerRecord;Lcom/mobnetic/coinguardian/db/content/AlarmRecord;I)V
    .locals 3
    .param p0, "fragment"    # Landroid/support/v4/app/Fragment;
    .param p1, "requestCode"    # I
    .param p2, "checkerRecord"    # Lcom/mobnetic/coinguardian/db/content/CheckerRecord;
    .param p3, "alarmRecord"    # Lcom/mobnetic/coinguardian/db/content/AlarmRecord;
    .param p4, "alarmRecordIndex"    # I

    .prologue
    .line 48
    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p0}, Landroid/support/v4/app/Fragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    const-class v2, Lcom/mobnetic/coinguardian/activity/CheckerAddAlarmActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 49
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "checker_record"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 50
    const-string v1, "alarm_record"

    invoke-virtual {v0, v1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 51
    const-string v1, "alarm_record_index"

    invoke-virtual {v0, v1, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 52
    invoke-virtual {p0, v0, p1}, Landroid/support/v4/app/Fragment;->startActivityForResult(Landroid/content/Intent;I)V

    .line 53
    return-void
.end method


# virtual methods
.method protected bridge synthetic createChildFragment()Landroid/support/v4/app/Fragment;
    .locals 1

    .prologue
    .line 12
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/activity/CheckerAddAlarmActivity;->createChildFragment()Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;

    move-result-object v0

    return-object v0
.end method

.method protected createChildFragment()Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;
    .locals 4

    .prologue
    .line 24
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/activity/CheckerAddAlarmActivity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    const-string v3, "checker_record"

    invoke-virtual {v2, v3}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    .line 25
    .local v1, "checkerRecord":Lcom/mobnetic/coinguardian/db/content/CheckerRecord;
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/activity/CheckerAddAlarmActivity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    const-string v3, "alarm_record"

    invoke-virtual {v2, v3}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;

    .line 26
    .local v0, "alarmRecord":Lcom/mobnetic/coinguardian/db/content/AlarmRecord;
    invoke-static {v1, v0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->newInstance(Lcom/mobnetic/coinguardian/db/content/CheckerRecord;Lcom/mobnetic/coinguardian/db/content/AlarmRecord;)Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;

    move-result-object v2

    return-object v2
.end method

.method public finish()V
    .locals 7

    .prologue
    const/4 v3, -0x1

    .line 31
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 32
    .local v0, "data":Landroid/content/Intent;
    const/4 v2, 0x0

    .line 33
    .local v2, "unsavedChanges":Z
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/activity/CheckerAddAlarmActivity;->getChildFragment()Landroid/support/v4/app/Fragment;

    move-result-object v1

    check-cast v1, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;

    .line 34
    .local v1, "fragment":Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;
    if-eqz v1, :cond_0

    .line 35
    invoke-virtual {v1}, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->getUnsavedChanges()Z

    move-result v2

    .line 36
    const-string v4, "alarm_record"

    invoke-virtual {v1}, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->getAlarmRecord()Lcom/mobnetic/coinguardian/db/content/AlarmRecord;

    move-result-object v5

    invoke-virtual {v0, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 38
    :cond_0
    const-string v4, "alarm_record_index"

    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/activity/CheckerAddAlarmActivity;->getIntent()Landroid/content/Intent;

    move-result-object v5

    const-string v6, "alarm_record_index"

    invoke-virtual {v5, v6, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v5

    invoke-virtual {v0, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 39
    if-eqz v2, :cond_1

    :goto_0
    invoke-virtual {p0, v3, v0}, Lcom/mobnetic/coinguardian/activity/CheckerAddAlarmActivity;->setResult(ILandroid/content/Intent;)V

    .line 41
    invoke-super {p0}, Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentSubActivity;->finish()V

    .line 42
    return-void

    .line 39
    :cond_1
    const/4 v3, 0x0

    goto :goto_0
.end method

.method protected getContentViewResId()I
    .locals 1

    .prologue
    .line 19
    const v0, 0x7f03001a

    return v0
.end method
