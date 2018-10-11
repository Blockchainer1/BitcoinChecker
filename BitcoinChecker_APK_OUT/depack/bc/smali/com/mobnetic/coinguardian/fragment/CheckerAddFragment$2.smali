.class Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$2;
.super Ljava/lang/Object;
.source "CheckerAddFragment.java"

# interfaces
.implements Lcom/linearlistview/LinearListView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;


# direct methods
.method constructor <init>(Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

    .prologue
    .line 197
    iput-object p1, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$2;->this$0:Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Lcom/linearlistview/LinearListView;Landroid/view/View;IJ)V
    .locals 5
    .param p1, "parent"    # Lcom/linearlistview/LinearListView;
    .param p2, "view"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "id"    # J

    .prologue
    const/16 v4, 0xc8

    const/4 v2, 0x1

    .line 199
    iget-object v1, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$2;->this$0:Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

    invoke-static {v1}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->access$400(Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;)Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter;->getCount()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    if-lt p3, v1, :cond_0

    .line 200
    invoke-static {v2}, Lcom/mobnetic/coinguardian/util/AlarmRecordHelper;->generateDefaultAlarmRecord(Z)Lcom/mobnetic/coinguardian/db/content/AlarmRecord;

    move-result-object v0

    .line 201
    .local v0, "newAlarmRecord":Lcom/mobnetic/coinguardian/db/content/AlarmRecord;
    iget-object v1, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$2;->this$0:Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

    invoke-static {v1}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->access$000(Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 202
    iget-object v1, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$2;->this$0:Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

    invoke-static {v1, v2}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->access$202(Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;Z)Z

    .line 203
    iget-object v1, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$2;->this$0:Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

    invoke-static {v1}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->access$300(Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;)V

    .line 204
    iget-object v1, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$2;->this$0:Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

    iget-object v2, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$2;->this$0:Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

    invoke-static {v2}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->access$500(Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;)Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    move-result-object v2

    iget-object v3, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$2;->this$0:Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

    invoke-static {v3}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->access$000(Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v3

    invoke-static {v1, v4, v2, v0, v3}, Lcom/mobnetic/coinguardian/activity/CheckerAddAlarmActivity;->startCheckerAddAlarmActivity(Landroid/support/v4/app/Fragment;ILcom/mobnetic/coinguardian/db/content/CheckerRecord;Lcom/mobnetic/coinguardian/db/content/AlarmRecord;I)V

    .line 208
    .end local v0    # "newAlarmRecord":Lcom/mobnetic/coinguardian/db/content/AlarmRecord;
    :goto_0
    return-void

    .line 206
    :cond_0
    iget-object v2, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$2;->this$0:Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

    iget-object v1, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$2;->this$0:Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

    invoke-static {v1}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->access$500(Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;)Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    move-result-object v3

    iget-object v1, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$2;->this$0:Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

    invoke-static {v1}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->access$000(Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;

    invoke-static {v2, v4, v3, v1, p3}, Lcom/mobnetic/coinguardian/activity/CheckerAddAlarmActivity;->startCheckerAddAlarmActivity(Landroid/support/v4/app/Fragment;ILcom/mobnetic/coinguardian/db/content/CheckerRecord;Lcom/mobnetic/coinguardian/db/content/AlarmRecord;I)V

    goto :goto_0
.end method
