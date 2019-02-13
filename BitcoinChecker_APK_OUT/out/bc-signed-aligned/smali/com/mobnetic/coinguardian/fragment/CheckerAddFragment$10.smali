.class Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$10;
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
    .line 324
    iput-object p1, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$10;->this$0:Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemSelected(Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference;I)Z
    .locals 10
    .param p1, "viewSpinnerPreference"    # Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference;
    .param p2, "position"    # I

    .prologue
    const-wide/16 v8, 0x1

    const/4 v6, 0x1

    .line 327
    :try_start_0
    sget-object v2, Lcom/mobnetic/coinguardian/model/currency/CurrenciesSubunits;->CURRENCIES_SUBUNITS:Ljava/util/HashMap;

    iget-object v3, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$10;->this$0:Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

    invoke-static {v3}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->access$500(Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;)Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getCurrencySrc()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 328
    sget-object v2, Lcom/mobnetic/coinguardian/model/currency/CurrenciesSubunits;->CURRENCIES_SUBUNITS:Ljava/util/HashMap;

    iget-object v3, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$10;->this$0:Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

    invoke-static {v3}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->access$500(Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;)Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->getCurrencySrc()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/mobnetic/coinguardian/model/CurrencySubunitsMap;

    invoke-virtual {v2}, Lcom/mobnetic/coinguardian/model/CurrencySubunitsMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->toArray()[Ljava/lang/Object;

    move-result-object v2

    aget-object v1, v2, p2

    check-cast v1, Lcom/mobnetic/coinguardian/model/CurrencySubunit;

    .line 329
    .local v1, "subunit":Lcom/mobnetic/coinguardian/model/CurrencySubunit;
    iget-object v2, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$10;->this$0:Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

    invoke-static {v2}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->access$500(Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;)Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    move-result-object v2

    iget-wide v4, v1, Lcom/mobnetic/coinguardian/model/CurrencySubunit;->subunitToUnit:J

    invoke-virtual {v2, v4, v5}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->setCurrencySubunitSrc(J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 337
    .end local v1    # "subunit":Lcom/mobnetic/coinguardian/model/CurrencySubunit;
    :goto_0
    iget-object v2, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$10;->this$0:Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

    invoke-static {v2, v6}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->access$202(Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;Z)Z

    .line 338
    iget-object v2, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$10;->this$0:Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

    invoke-static {v2}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->access$300(Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;)V

    .line 339
    return v6

    .line 331
    :cond_0
    :try_start_1
    iget-object v2, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$10;->this$0:Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

    invoke-static {v2}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->access$500(Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;)Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    move-result-object v2

    const-wide/16 v4, 0x1

    invoke-virtual {v2, v4, v5}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->setCurrencySubunitSrc(J)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 333
    :catch_0
    move-exception v0

    .line 334
    .local v0, "e":Ljava/lang/Exception;
    iget-object v2, p0, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment$10;->this$0:Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;

    invoke-static {v2}, Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;->access$500(Lcom/mobnetic/coinguardian/fragment/CheckerAddFragment;)Lcom/mobnetic/coinguardian/db/content/CheckerRecord;

    move-result-object v2

    invoke-virtual {v2, v8, v9}, Lcom/mobnetic/coinguardian/db/content/CheckerRecord;->setCurrencySubunitSrc(J)V

    .line 335
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method
