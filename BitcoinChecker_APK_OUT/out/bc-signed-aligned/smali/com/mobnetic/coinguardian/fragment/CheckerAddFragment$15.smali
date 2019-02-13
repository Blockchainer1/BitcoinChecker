.class Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$15;
.super Ljava/lang/Object;
.source "CheckerAddFragment.java"

# interfaces
.implements Ljava/lang/Runnable;


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
    .line 399
    iput-object p1, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$15;->this$0:Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 401
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$15;->this$0:Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

    iget-object v0, v0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->scrollView:Landroid/widget/ScrollView;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$15;->this$0:Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

    iget-object v2, v2, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->alarmSectionHeader:Landroid/widget/TextView;

    invoke-virtual {v2}, Landroid/widget/TextView;->getBottom()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/widget/ScrollView;->scrollTo(II)V

    .line 402
    return-void
.end method
