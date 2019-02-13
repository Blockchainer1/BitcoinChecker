.class Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$1$1;
.super Ljava/lang/Object;
.source "CheckerAddFragment.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$1;->onItemLongClick(Lcom/mobnetic/coinguardian/db/content/AlarmRecord;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$1;

.field final synthetic val$position:I


# direct methods
.method constructor <init>(Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$1;I)V
    .locals 0
    .param p1, "this$1"    # Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$1;

    .prologue
    .line 183
    iput-object p1, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$1$1;->this$1:Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$1;

    iput p2, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$1$1;->val$position:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 6
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 185
    if-nez p2, :cond_1

    .line 186
    iget-object v1, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$1$1;->this$1:Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$1;

    iget-object v1, v1, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$1;->this$0:Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

    invoke-static {v1}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->access$000(Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;)Ljava/util/ArrayList;

    move-result-object v1

    iget v2, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$1$1;->val$position:I

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;

    .line 187
    .local v0, "removedAlarmRecord":Lcom/mobnetic/coinguardian/db/content/AlarmRecord;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->getId()J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v1, v2, v4

    if-lez v1, :cond_0

    .line 188
    iget-object v1, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$1$1;->this$1:Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$1;

    iget-object v1, v1, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$1;->this$0:Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

    invoke-static {v1}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->access$100(Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v0}, Lcom/mobnetic/coinguardian/db/content/AlarmRecord;->getId()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 189
    :cond_0
    iget-object v1, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$1$1;->this$1:Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$1;

    iget-object v1, v1, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$1;->this$0:Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

    const/4 v2, 0x1

    invoke-static {v1, v2}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->access$202(Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;Z)Z

    .line 190
    iget-object v1, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$1$1;->this$1:Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$1;

    iget-object v1, v1, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$1;->this$0:Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

    invoke-static {v1}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->access$300(Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;)V

    .line 192
    .end local v0    # "removedAlarmRecord":Lcom/mobnetic/coinguardian/db/content/AlarmRecord;
    :cond_1
    return-void
.end method
