.class Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$14;
.super Ljava/lang/Object;
.source "CheckerAddFragment.java"

# interfaces
.implements Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference$OnCheckChangedListener;


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
    .line 380
    iput-object p1, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$14;->this$0:Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckChanged(Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;Z)Z
    .locals 2
    .param p1, "viewCheckBoxPreference"    # Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;
    .param p2, "checked"    # Z

    .prologue
    const/4 v1, 0x1

    .line 382
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$14;->this$0:Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

    invoke-static {v0}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->access$500(Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;)Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    move-result-object v0

    invoke-virtual {v0, p2}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->setTtsEnabled(Z)V

    .line 383
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$14;->this$0:Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

    invoke-static {v0, v1}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->access$202(Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;Z)Z

    .line 384
    return v1
.end method
