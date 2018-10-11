.class Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$8;
.super Ljava/lang/Object;
.source "CheckerAddFragment.java"

# interfaces
.implements Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference$OnItemSelectedListener;


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
    .line 288
    iput-object p1, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$8;->this$0:Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemSelected(Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference;I)Z
    .locals 5
    .param p1, "viewSpinnerPreference"    # Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference;
    .param p2, "position"    # I

    .prologue
    const/4 v4, 0x1

    .line 290
    invoke-virtual {p1}, Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference;->getEntries()[Ljava/lang/CharSequence;

    move-result-object v1

    if-eqz v1, :cond_2

    invoke-virtual {p1}, Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference;->getEntries()[Ljava/lang/CharSequence;

    move-result-object v1

    aget-object v1, v1, p2

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 291
    .local v0, "newCurrency":Ljava/lang/String;
    :goto_0
    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$8;->this$0:Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

    invoke-static {v1}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->access$500(Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;)Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getCurrencyDst()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 292
    :cond_0
    iget-object v1, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$8;->this$0:Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

    invoke-static {v1}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->access$500(Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;)Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->setCurrencyDst(Ljava/lang/String;)V

    .line 293
    iget-object v1, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$8;->this$0:Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

    invoke-static {v1}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->access$500(Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;)Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    move-result-object v1

    const-wide/16 v2, 0x1

    invoke-virtual {v1, v2, v3}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->setCurrencySubunitDst(J)V

    .line 294
    iget-object v1, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$8;->this$0:Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

    invoke-static {v1, v4}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->access$202(Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;Z)Z

    .line 295
    iget-object v1, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$8;->this$0:Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

    invoke-static {v1}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->access$1000(Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;)V

    .line 296
    iget-object v1, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$8;->this$0:Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

    invoke-static {v1}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->access$1100(Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;)V

    .line 297
    iget-object v1, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$8;->this$0:Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

    invoke-static {v1}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->access$1400(Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;)V

    .line 298
    iget-object v1, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$8;->this$0:Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

    invoke-static {v1}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->access$300(Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;)V

    .line 300
    :cond_1
    return v4

    .line 290
    .end local v0    # "newCurrency":Ljava/lang/String;
    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method
