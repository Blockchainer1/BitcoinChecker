.class public Lcom/mobnetic/coinguardian/activity/MarketPickerListActivity;
.super Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentSubActivity;
.source "MarketPickerListActivity.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentSubActivity",
        "<",
        "Lcom/mobnetic/coinguardian/fragment/MarketPickerListFragment;",
        ">;"
    }
.end annotation


# static fields
.field public static final EXTRA_MARKET_KEY:Ljava/lang/String; = "market_key"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 9
    invoke-direct {p0}, Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentSubActivity;-><init>()V

    return-void
.end method

.method public static startActivityForResult(Landroid/support/v4/app/Fragment;ILjava/lang/String;)V
    .locals 3
    .param p0, "fragment"    # Landroid/support/v4/app/Fragment;
    .param p1, "requestCode"    # I
    .param p2, "marketKey"    # Ljava/lang/String;

    .prologue
    .line 32
    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p0}, Landroid/support/v4/app/Fragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    const-class v2, Lcom/mobnetic/coinguardian/activity/MarketPickerListActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 33
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "market_key"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 34
    invoke-virtual {p0, v0, p1}, Landroid/support/v4/app/Fragment;->startActivityForResult(Landroid/content/Intent;I)V

    .line 35
    return-void
.end method


# virtual methods
.method protected bridge synthetic createChildFragment()Landroid/support/v4/app/Fragment;
    .locals 1

    .prologue
    .line 9
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/activity/MarketPickerListActivity;->createChildFragment()Lcom/mobnetic/coinguardian/fragment/MarketPickerListFragment;

    move-result-object v0

    return-object v0
.end method

.method protected createChildFragment()Lcom/mobnetic/coinguardian/fragment/MarketPickerListFragment;
    .locals 1

    .prologue
    .line 15
    new-instance v0, Lcom/mobnetic/coinguardian/fragment/MarketPickerListFragment;

    invoke-direct {v0}, Lcom/mobnetic/coinguardian/fragment/MarketPickerListFragment;-><init>()V

    return-object v0
.end method

.method public onBackPressed()V
    .locals 1

    .prologue
    .line 23
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/activity/MarketPickerListActivity;->getChildFragment()Landroid/support/v4/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/mobnetic/coinguardian/fragment/MarketPickerListFragment;

    invoke-virtual {v0}, Lcom/mobnetic/coinguardian/fragment/MarketPickerListFragment;->onBackPressed()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 26
    :goto_0
    return-void

    .line 25
    :cond_0
    invoke-super {p0}, Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentSubActivity;->onBackPressed()V

    goto :goto_0
.end method
