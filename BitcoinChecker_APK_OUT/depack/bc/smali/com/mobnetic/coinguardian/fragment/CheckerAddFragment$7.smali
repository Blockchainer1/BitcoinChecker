.class Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$7;
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
    .line 273
    iput-object p1, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$7;->this$0:Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

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

    .line 275
    invoke-virtual {p1}, Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference;->getEntries()[Ljava/lang/CharSequence;

    move-result-object v1

    if-eqz v1, :cond_2

    invoke-virtual {p1}, Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference;->getEntries()[Ljava/lang/CharSequence;

    move-result-object v1

    aget-object v1, v1, p2

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 276
    .local v0, "newCurrency":Ljava/lang/String;
    :goto_0
    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$7;->this$0:Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

    invoke-static {v1}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->access$500(Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;)Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getCurrencySrc()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 277
    :cond_0
    iget-object v1, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$7;->this$0:Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

    invoke-static {v1}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->access$500(Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;)Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->setCurrencySrc(Ljava/lang/String;)V

    .line 278
    iget-object v1, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$7;->this$0:Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

    invoke-static {v1}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->access$500(Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;)Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    move-result-object v1

    const-wide/16 v2, 0x1

    invoke-virtual {v1, v2, v3}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->setCurrencySubunitSrc(J)V

    .line 279
    iget-object v1, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$7;->this$0:Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

    invoke-static {v1, v4}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->access$202(Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;Z)Z

    .line 280
    iget-object v1, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$7;->this$0:Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

    invoke-static {v1}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->access$1000(Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;)V

    .line 281
    iget-object v1, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$7;->this$0:Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

    invoke-static {v1}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->access$1100(Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;)V

    .line 282
    iget-object v1, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$7;->this$0:Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

    invoke-static {v1}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->access$1200(Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;)V

    .line 283
    iget-object v1, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$7;->this$0:Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

    iget-object v2, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$7;->this$0:Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

    invoke-static {v2}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->access$600(Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;)Lcom/mobnetic/coinguardian/model/Market;

    move-result-object v2

    invoke-static {v1, v2, v4}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->access$1300(Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;Lcom/mobnetic/coinguardian/model/Market;Z)V

    .line 285
    :cond_1
    return v4

    .line 275
    .end local v0    # "newCurrency":Ljava/lang/String;
    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method
