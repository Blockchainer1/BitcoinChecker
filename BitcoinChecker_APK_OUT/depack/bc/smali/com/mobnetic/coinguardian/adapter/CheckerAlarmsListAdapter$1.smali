.class Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter$1;
.super Ljava/lang/Object;
.source "CheckerAlarmsListAdapter.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter;

.field final synthetic val$alarmRecord:Lcom/mobnetic/coinguardian/db/content/AlarmRecord;


# direct methods
.method constructor <init>(Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter;Lcom/mobnetic/coinguardian/db/content/AlarmRecord;)V
    .locals 0
    .param p1, "this$0"    # Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter;

    .prologue
    .line 116
    iput-object p1, p0, Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter$1;->this$0:Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter;

    iput-object p2, p0, Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter$1;->val$alarmRecord:Lcom/mobnetic/coinguardian/db/content/AlarmRecord;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 1
    .param p1, "buttonView"    # Landroid/widget/CompoundButton;
    .param p2, "isChecked"    # Z

    .prologue
    .line 118
    iget-object v0, p0, Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter$1;->val$alarmRecord:Lcom/mobnetic/coinguardian/db/content/AlarmRecord;

    invoke-virtual {v0, p2}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->setEnabled(Z)V

    .line 119
    iget-object v0, p0, Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter$1;->this$0:Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter;

    invoke-static {v0}, Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter;->access$000(Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter;)Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->makeUnsavedChanges()V

    .line 120
    return-void
.end method
