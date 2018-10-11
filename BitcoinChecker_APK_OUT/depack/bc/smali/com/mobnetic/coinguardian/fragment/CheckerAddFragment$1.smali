.class Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$1;
.super Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter;
.source "CheckerAddFragment.java"


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
.method constructor <init>(Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;Landroid/content/Context;Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;Lcom/mobnetic/coinguardian/db/content/CheckerRecord;Ljava/util/List;)V
    .locals 0
    .param p1, "this$0"    # Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "checkerAddFragment"    # Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;
    .param p4, "checkerRecord"    # Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    .prologue
    .line 179
    .local p5, "items":Ljava/util/List;, "Ljava/util/List<Lcom/mobnetic/coinguardian/db/content/AlarmRecord;>;"
    iput-object p1, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$1;->this$0:Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

    invoke-direct {p0, p2, p3, p4, p5}, Lcom/mobnetic/coinguardian/adapter/CheckerAlarmsListAdapter;-><init>(Landroid/content/Context;Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;Lcom/mobnetic/coinguardian/db/content/CheckerRecord;Ljava/util/List;)V

    return-void
.end method


# virtual methods
.method public onItemLongClick(Lcom/mobnetic/coinguardian/db/content/AlarmRecord;I)V
    .locals 3
    .param p1, "alarmRecord"    # Lcom/mobnetic/coinguardian/db/content/AlarmRecord;
    .param p2, "position"    # I

    .prologue
    .line 182
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$1;->this$0:Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

    invoke-virtual {v1}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const/high16 v1, 0x7f0c0000

    new-instance v2, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$1$1;

    invoke-direct {v2, p0, p2}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$1$1;-><init>(Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$1;I)V

    .line 183
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setItems(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 193
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 194
    return-void
.end method
