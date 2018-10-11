.class Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter$3;
.super Ljava/lang/Object;
.source "CheckerAlarmsListAdapter.java"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


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

.field final synthetic val$position:I


# direct methods
.method constructor <init>(Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter;Lcom/mobnetic/coinguardian/db/content/AlarmRecord;I)V
    .locals 0
    .param p1, "this$0"    # Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter;

    .prologue
    .line 128
    iput-object p1, p0, Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter$3;->this$0:Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter;

    iput-object p2, p0, Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter$3;->val$alarmRecord:Lcom/mobnetic/coinguardian/db/content/AlarmRecord;

    iput p3, p0, Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter$3;->val$position:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLongClick(Landroid/view/View;)Z
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 130
    iget-object v0, p0, Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter$3;->this$0:Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter;

    iget-object v1, p0, Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter$3;->val$alarmRecord:Lcom/mobnetic/coinguardian/db/content/AlarmRecord;

    iget v2, p0, Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter$3;->val$position:I

    invoke-virtual {v0, v1, v2}, Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter;->onItemLongClick(Lcom/mobnetic/coinguardian/db/content/AlarmRecord;I)V

    .line 131
    const/4 v0, 0x1

    return v0
.end method
