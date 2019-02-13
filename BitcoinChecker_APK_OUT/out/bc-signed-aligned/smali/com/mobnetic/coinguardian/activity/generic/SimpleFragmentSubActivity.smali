.class public abstract Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentSubActivity;
.super Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentActivity;
.source "SimpleFragmentSubActivity.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Landroid/support/v4/app/Fragment;",
        ">",
        "Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentActivity",
        "<TT;>;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 7
    .local p0, "this":Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentSubActivity;, "Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentSubActivity<TT;>;"
    invoke-direct {p0}, Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentActivity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .local p0, "this":Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentSubActivity;, "Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentSubActivity<TT;>;"
    const/4 v1, 0x1

    .line 11
    invoke-super {p0, p1}, Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentActivity;->onCreate(Landroid/os/Bundle;)V

    .line 13
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentSubActivity;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/support/v7/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    .line 14
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentSubActivity;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/support/v7/app/ActionBar;->setDisplayShowHomeEnabled(Z)V

    .line 15
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 19
    .local p0, "this":Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentSubActivity;, "Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentSubActivity<TT;>;"
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x102002c

    if-ne v0, v1, :cond_0

    .line 20
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentSubActivity;->onBackPressed()V

    .line 21
    const/4 v0, 0x1

    .line 23
    :goto_0
    return v0

    :cond_0
    invoke-super {p0, p1}, Lcom/mobnetic/coinguardian/activity/generic/SimpleFragmentActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    goto :goto_0
.end method
