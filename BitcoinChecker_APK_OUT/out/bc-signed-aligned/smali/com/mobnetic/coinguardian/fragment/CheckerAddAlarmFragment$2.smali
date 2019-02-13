.class Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment$2;
.super Ljava/lang/Object;
.source "CheckerAddAlarmFragment.java"

# interfaces
.implements Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference$OnItemSelectedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->refreshUI()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;


# direct methods
.method constructor <init>(Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;

    .prologue
    .line 116
    iput-object p1, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment$2;->this$0:Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemSelected(Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference;I)Z
    .locals 5
    .param p1, "viewSpinnerPreference"    # Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference;
    .param p2, "position"    # I

    .prologue
    const/4 v4, 0x1

    .line 118
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment$2;->this$0:Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;

    invoke-static {v0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->access$000(Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;)Lcom/mobnetic/coinguardian/db/content/AlarmRecord;

    move-result-object v0

    iget-object v1, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment$2;->this$0:Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;

    invoke-virtual {v1}, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-static {v1, p2}, Lcom/mobnetic/coinguardian/util/AlarmRecordHelper;->getAlarmTypeForPosition(Landroid/content/Context;I)I

    move-result v1

    int-to-long v2, v1

    invoke-virtual {v0, v2, v3}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->setType(J)V

    .line 119
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment$2;->this$0:Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;

    invoke-static {v0, v4}, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->access$102(Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;Z)Z

    .line 120
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment$2;->this$0:Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;

    invoke-static {v0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->access$300(Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;)V

    .line 121
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment$2;->this$0:Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;

    invoke-static {v0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;->access$400(Lcom/mobnetic/coinguardian/fragment/CheckerAddAlarmFragment;)V

    .line 122
    return v4
.end method
