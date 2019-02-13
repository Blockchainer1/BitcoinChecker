.class Lcom/mobnetic/coinguardian/adapter/CheckersListAdapter$1;
.super Ljava/lang/Object;
.source "CheckersListAdapter.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mobnetic/coinguardian/adapter/CheckersListAdapter;->bindView(Landroid/view/View;Landroid/content/Context;Landroid/database/Cursor;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mobnetic/coinguardian/adapter/CheckersListAdapter;

.field final synthetic val$context:Landroid/content/Context;

.field final synthetic val$item:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;


# direct methods
.method constructor <init>(Lcom/mobnetic/coinguardian/adapter/CheckersListAdapter;Lcom/mobnetic/coinguardian/db/content/CheckerRecord;Landroid/content/Context;)V
    .locals 0
    .param p1, "this$0"    # Lcom/mobnetic/coinguardian/adapter/CheckersListAdapter;

    .prologue
    .line 130
    iput-object p1, p0, Lcom/mobnetic/coinguardian/adapter/CheckersListAdapter$1;->this$0:Lcom/mobnetic/coinguardian/adapter/CheckersListAdapter;

    iput-object p2, p0, Lcom/mobnetic/coinguardian/adapter/CheckersListAdapter$1;->val$item:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    iput-object p3, p0, Lcom/mobnetic/coinguardian/adapter/CheckersListAdapter$1;->val$context:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 5
    .param p1, "buttonView"    # Landroid/widget/CompoundButton;
    .param p2, "isChecked"    # Z

    .prologue
    const/4 v4, 0x1

    .line 132
    invoke-static {}, Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker;->newBuilder()Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker$Builder;

    move-result-object v0

    invoke-virtual {v0, p2}, Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker$Builder;->setEnabled(Z)Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker$Builder;

    move-result-object v0

    iget-object v1, p0, Lcom/mobnetic/coinguardian/adapter/CheckersListAdapter$1;->val$item:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    invoke-virtual {v1}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getId()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3, v4}, Lcom/mobnetic/coinguardian/db/content/MaindbContract$Checker$Builder;->update(JZ)I

    .line 133
    iget-object v0, p0, Lcom/mobnetic/coinguardian/adapter/CheckersListAdapter$1;->val$item:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    invoke-virtual {v0, p2}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->setEnabled(Z)V

    .line 134
    iget-object v0, p0, Lcom/mobnetic/coinguardian/adapter/CheckersListAdapter$1;->val$context:Landroid/content/Context;

    iget-object v1, p0, Lcom/mobnetic/coinguardian/adapter/CheckersListAdapter$1;->val$item:Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    invoke-static {v0, v1, v4}, Lcom/mobnetic/coinguardian/util/CheckerRecordHelper;->doAfterEdit(Landroid/content/Context;Lcom/mobnetic/coinguardian/db/content/CheckerRecord;Z)V

    .line 135
    return-void
.end method
