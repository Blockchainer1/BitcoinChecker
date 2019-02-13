.class Lcom/linearlistview/LinearListView$InternalOnClickListener;
.super Ljava/lang/Object;
.source "LinearListView.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/linearlistview/LinearListView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "InternalOnClickListener"
.end annotation


# instance fields
.field mPosition:I

.field final synthetic this$0:Lcom/linearlistview/LinearListView;


# direct methods
.method public constructor <init>(Lcom/linearlistview/LinearListView;I)V
    .locals 0
    .param p2, "position"    # I

    .prologue
    .line 274
    iput-object p1, p0, Lcom/linearlistview/LinearListView$InternalOnClickListener;->this$0:Lcom/linearlistview/LinearListView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 275
    iput p2, p0, Lcom/linearlistview/LinearListView$InternalOnClickListener;->mPosition:I

    .line 276
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 6
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 280
    iget-object v0, p0, Lcom/linearlistview/LinearListView$InternalOnClickListener;->this$0:Lcom/linearlistview/LinearListView;

    invoke-static {v0}, Lcom/linearlistview/LinearListView;->access$100(Lcom/linearlistview/LinearListView;)Lcom/linearlistview/LinearListView$OnItemClickListener;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/linearlistview/LinearListView$InternalOnClickListener;->this$0:Lcom/linearlistview/LinearListView;

    invoke-static {v0}, Lcom/linearlistview/LinearListView;->access$200(Lcom/linearlistview/LinearListView;)Landroid/widget/ListAdapter;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 281
    iget-object v0, p0, Lcom/linearlistview/LinearListView$InternalOnClickListener;->this$0:Lcom/linearlistview/LinearListView;

    invoke-static {v0}, Lcom/linearlistview/LinearListView;->access$100(Lcom/linearlistview/LinearListView;)Lcom/linearlistview/LinearListView$OnItemClickListener;

    move-result-object v0

    iget-object v1, p0, Lcom/linearlistview/LinearListView$InternalOnClickListener;->this$0:Lcom/linearlistview/LinearListView;

    iget v3, p0, Lcom/linearlistview/LinearListView$InternalOnClickListener;->mPosition:I

    iget-object v2, p0, Lcom/linearlistview/LinearListView$InternalOnClickListener;->this$0:Lcom/linearlistview/LinearListView;

    .line 282
    invoke-static {v2}, Lcom/linearlistview/LinearListView;->access$200(Lcom/linearlistview/LinearListView;)Landroid/widget/ListAdapter;

    move-result-object v2

    iget v4, p0, Lcom/linearlistview/LinearListView$InternalOnClickListener;->mPosition:I

    invoke-interface {v2, v4}, Landroid/widget/ListAdapter;->getItemId(I)J

    move-result-wide v4

    move-object v2, p1

    .line 281
    invoke-interface/range {v0 .. v5}, Lcom/linearlistview/LinearListView$OnItemClickListener;->onItemClick(Lcom/linearlistview/LinearListView;Landroid/view/View;IJ)V

    .line 284
    :cond_0
    return-void
.end method
