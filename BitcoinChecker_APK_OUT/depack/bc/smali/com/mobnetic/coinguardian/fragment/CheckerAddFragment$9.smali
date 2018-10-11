.class Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$9;
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
    .line 307
    iput-object p1, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$9;->this$0:Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemSelected(Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference;I)Z
    .locals 7
    .param p1, "viewSpinnerPreference"    # Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference;
    .param p2, "position"    # I

    .prologue
    const/4 v6, 0x1

    .line 309
    iget-object v2, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$9;->this$0:Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

    invoke-static {v2}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->access$600(Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;)Lcom/mobnetic/coinguardian/model/Market;

    move-result-object v1

    .line 310
    .local v1, "market":Lcom/mobnetic/coinguardian/model/Market;
    instance-of v2, v1, Lcom/mobnetic/coinguardian/model/FuturesMarket;

    if-eqz v2, :cond_0

    move-object v0, v1

    .line 311
    check-cast v0, Lcom/mobnetic/coinguardian/model/FuturesMarket;

    .line 312
    .local v0, "futuresMarket":Lcom/mobnetic/coinguardian/model/FuturesMarket;
    if-ltz p2, :cond_0

    iget-object v2, v0, Lcom/mobnetic/coinguardian/model/FuturesMarket;->contractTypes:[I

    array-length v2, v2

    if-ge p2, v2, :cond_0

    .line 313
    iget-object v2, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$9;->this$0:Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

    invoke-static {v2}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->access$500(Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;)Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    move-result-object v2

    iget-object v3, v0, Lcom/mobnetic/coinguardian/model/FuturesMarket;->contractTypes:[I

    aget v3, v3, p2

    int-to-long v4, v3

    invoke-virtual {v2, v4, v5}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->setContractType(J)V

    .line 314
    iget-object v2, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$9;->this$0:Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

    invoke-static {v2, v6}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->access$202(Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;Z)Z

    .line 315
    iget-object v2, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$9;->this$0:Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

    invoke-static {v2}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->access$1000(Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;)V

    .line 316
    iget-object v2, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$9;->this$0:Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

    invoke-static {v2}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->access$1100(Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;)V

    .line 319
    .end local v0    # "futuresMarket":Lcom/mobnetic/coinguardian/model/FuturesMarket;
    :cond_0
    return v6
.end method
