.class Lcom/linearlistview/LinearListView$1;
.super Landroid/database/DataSetObserver;
.source "LinearListView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/linearlistview/LinearListView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/linearlistview/LinearListView;


# direct methods
.method constructor <init>(Lcom/linearlistview/LinearListView;)V
    .locals 0
    .param p1, "this$0"    # Lcom/linearlistview/LinearListView;

    .prologue
    .line 36
    iput-object p1, p0, Lcom/linearlistview/LinearListView$1;->this$0:Lcom/linearlistview/LinearListView;

    invoke-direct {p0}, Landroid/database/DataSetObserver;-><init>()V

    return-void
.end method


# virtual methods
.method public onChanged()V
    .locals 1

    .prologue
    .line 40
    iget-object v0, p0, Lcom/linearlistview/LinearListView$1;->this$0:Lcom/linearlistview/LinearListView;

    invoke-static {v0}, Lcom/linearlistview/LinearListView;->access$000(Lcom/linearlistview/LinearListView;)V

    .line 41
    return-void
.end method

.method public onInvalidated()V
    .locals 1

    .prologue
    .line 45
    iget-object v0, p0, Lcom/linearlistview/LinearListView$1;->this$0:Lcom/linearlistview/LinearListView;

    invoke-static {v0}, Lcom/linearlistview/LinearListView;->access$000(Lcom/linearlistview/LinearListView;)V

    .line 46
    return-void
.end method
