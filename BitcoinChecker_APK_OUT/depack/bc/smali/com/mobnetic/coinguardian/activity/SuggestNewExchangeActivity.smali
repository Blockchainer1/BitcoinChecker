.class public Lcom/mobnetic/coinguardian/activity/SuggestNewExchangeActivity;
.super Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity;
.source "SuggestNewExchangeActivity.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity",
        "<",
        "Landroid/support/v4/app/Fragment;",
        ">;"
    }
.end annotation


# instance fields
.field suggestButton:Landroid/view/View;
    .annotation build Lbutterknife/InjectView;
        value = 0x7f0e0094
    .end annotation
.end field

.field textView:Landroid/widget/TextView;
    .annotation build Lbutterknife/InjectView;
        value = 0x7f0e004f
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 18
    invoke-direct {p0}, Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity;-><init>()V

    return-void
.end method

.method public static startSettingsMainActivity(Landroid/content/Context;)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 65
    const-class v0, Lcom/mobnetic/coinguardian/activity/SuggestNewExchangeActivity;

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Lcom/mobnetic/coinguardian/activity/SuggestNewExchangeActivity;->startSimpleDonateFragmentActivity(Landroid/content/Context;Ljava/lang/Class;Z)V

    .line 66
    return-void
.end method


# virtual methods
.method protected createChildFragment()Landroid/support/v4/app/Fragment;
    .locals 1

    .prologue
    .line 34
    const/4 v0, 0x0

    return-object v0
.end method

.method protected getContentViewResId()I
    .locals 1

    .prologue
    .line 39
    const v0, 0x7f03002c

    return v0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 26
    invoke-super {p0, p1}, Lcom/mobnetic/coinguardian/activity/generic/SimpleDonateFragmentSubActivity;->onCreate(Landroid/os/Bundle;)V

    .line 27
    invoke-static {p0}, Lbutterknife/ButterKnife;->inject(Landroid/app/Activity;)V

    .line 29
    iget-object v0, p0, Lcom/mobnetic/coinguardian/activity/SuggestNewExchangeActivity;->textView:Landroid/widget/TextView;

    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 30
    return-void
.end method

.method public onDonateButtonClicked()V
    .locals 0
    .annotation build Lbutterknife/OnClick;
        value = {
            0x7f0e0095
        }
    .end annotation

    .prologue
    .line 53
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/activity/SuggestNewExchangeActivity;->showDonateDialog()V

    .line 54
    return-void
.end method

.method public onSuggestButtonClicked()V
    .locals 0
    .annotation build Lbutterknife/OnClick;
        value = {
            0x7f0e0094
        }
    .end annotation

    .prologue
    .line 58
    invoke-static {p0}, Lcom/mobnetic/coinguardian/util/Utils;->goToGitHubIssues(Landroid/content/Context;)Z

    .line 59
    return-void
.end method
