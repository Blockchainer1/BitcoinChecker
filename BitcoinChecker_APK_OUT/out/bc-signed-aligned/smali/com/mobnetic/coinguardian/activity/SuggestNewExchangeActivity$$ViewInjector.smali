.class public Lcom/mobnetic/coinguardian/activity/SuggestNewExchangeActivity$$ViewInjector;
.super Ljava/lang/Object;
.source "SuggestNewExchangeActivity$$ViewInjector.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static inject(Lbutterknife/ButterKnife$Finder;Lcom/mobnetic/coinguardian/activity/SuggestNewExchangeActivity;Ljava/lang/Object;)V
    .locals 3
    .param p0, "finder"    # Lbutterknife/ButterKnife$Finder;
    .param p1, "target"    # Lcom/mobnetic/coinguardian/activity/SuggestNewExchangeActivity;
    .param p2, "source"    # Ljava/lang/Object;

    .prologue
    .line 10
    const v1, 0x7f0e004f

    invoke-virtual {p0, p2, v1}, Lbutterknife/ButterKnife$Finder;->findById(Ljava/lang/Object;I)Landroid/view/View;

    move-result-object v0

    .line 11
    .local v0, "view":Landroid/view/View;
    if-nez v0, :cond_0

    .line 12
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Required view with id \'2131624015\' for field \'textView\' was not found. If this view is optional add \'@Optional\' annotation."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 14
    :cond_0
    check-cast v0, Landroid/widget/TextView;

    .end local v0    # "view":Landroid/view/View;
    iput-object v0, p1, Lcom/mobnetic/coinguardian/activity/SuggestNewExchangeActivity;->textView:Landroid/widget/TextView;

    .line 15
    const v1, 0x7f0e0094

    invoke-virtual {p0, p2, v1}, Lbutterknife/ButterKnife$Finder;->findById(Ljava/lang/Object;I)Landroid/view/View;

    move-result-object v0

    .line 16
    .restart local v0    # "view":Landroid/view/View;
    if-nez v0, :cond_1

    .line 17
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Required view with id \'2131624084\' for field \'suggestButton\' and method \'onSuggestButtonClicked\' was not found. If this view is optional add \'@Optional\' annotation."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 19
    :cond_1
    iput-object v0, p1, Lcom/mobnetic/coinguardian/activity/SuggestNewExchangeActivity;->suggestButton:Landroid/view/View;

    .line 20
    new-instance v1, Lcom/mobnetic/coinguardian/activity/SuggestNewExchangeActivity$$ViewInjector$1;

    invoke-direct {v1, p1}, Lcom/mobnetic/coinguardian/activity/SuggestNewExchangeActivity$$ViewInjector$1;-><init>(Lcom/mobnetic/coinguardian/activity/SuggestNewExchangeActivity;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 28
    const v1, 0x7f0e0095

    invoke-virtual {p0, p2, v1}, Lbutterknife/ButterKnife$Finder;->findById(Ljava/lang/Object;I)Landroid/view/View;

    move-result-object v0

    .line 29
    if-nez v0, :cond_2

    .line 30
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Required view with id \'2131624085\' for method \'onDonateButtonClicked\' was not found. If this view is optional add \'@Optional\' annotation."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 32
    :cond_2
    new-instance v1, Lcom/mobnetic/coinguardian/activity/SuggestNewExchangeActivity$$ViewInjector$2;

    invoke-direct {v1, p1}, Lcom/mobnetic/coinguardian/activity/SuggestNewExchangeActivity$$ViewInjector$2;-><init>(Lcom/mobnetic/coinguardian/activity/SuggestNewExchangeActivity;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 40
    return-void
.end method

.method public static reset(Lcom/mobnetic/coinguardian/activity/SuggestNewExchangeActivity;)V
    .locals 1
    .param p0, "target"    # Lcom/mobnetic/coinguardian/activity/SuggestNewExchangeActivity;

    .prologue
    const/4 v0, 0x0

    .line 43
    iput-object v0, p0, Lcom/mobnetic/coinguardian/activity/SuggestNewExchangeActivity;->textView:Landroid/widget/TextView;

    .line 44
    iput-object v0, p0, Lcom/mobnetic/coinguardian/activity/SuggestNewExchangeActivity;->suggestButton:Landroid/view/View;

    .line 45
    return-void
.end method
