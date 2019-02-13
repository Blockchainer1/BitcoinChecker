.class public Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog$$ViewInjector;
.super Ljava/lang/Object;
.source "DynamicCurrencyPairsDialog$$ViewInjector.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static inject(Lbutterknife/ButterKnife$Finder;Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;Ljava/lang/Object;)V
    .locals 3
    .param p0, "finder"    # Lbutterknife/ButterKnife$Finder;
    .param p1, "target"    # Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;
    .param p2, "source"    # Ljava/lang/Object;

    .prologue
    .line 10
    const v1, 0x7f0e0081

    invoke-virtual {p0, p2, v1}, Lbutterknife/ButterKnife$Finder;->findById(Ljava/lang/Object;I)Landroid/view/View;

    move-result-object v0

    .line 11
    .local v0, "view":Landroid/view/View;
    if-nez v0, :cond_0

    .line 12
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Required view with id \'2131624065\' for field \'refreshImageWrapper\' was not found. If this view is optional add \'@Optional\' annotation."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 14
    :cond_0
    iput-object v0, p1, Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;->refreshImageWrapper:Landroid/view/View;

    .line 15
    const v1, 0x7f0e0082

    invoke-virtual {p0, p2, v1}, Lbutterknife/ButterKnife$Finder;->findById(Ljava/lang/Object;I)Landroid/view/View;

    move-result-object v0

    .line 16
    if-nez v0, :cond_1

    .line 17
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Required view with id \'2131624066\' for field \'refreshImageView\' was not found. If this view is optional add \'@Optional\' annotation."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 19
    :cond_1
    iput-object v0, p1, Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;->refreshImageView:Landroid/view/View;

    .line 20
    const v1, 0x7f0e0083

    invoke-virtual {p0, p2, v1}, Lbutterknife/ButterKnife$Finder;->findById(Ljava/lang/Object;I)Landroid/view/View;

    move-result-object v0

    .line 21
    if-nez v0, :cond_2

    .line 22
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Required view with id \'2131624067\' for field \'statusView\' was not found. If this view is optional add \'@Optional\' annotation."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 24
    :cond_2
    check-cast v0, Landroid/widget/TextView;

    .end local v0    # "view":Landroid/view/View;
    iput-object v0, p1, Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;->statusView:Landroid/widget/TextView;

    .line 25
    return-void
.end method

.method public static reset(Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;)V
    .locals 1
    .param p0, "target"    # Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;

    .prologue
    const/4 v0, 0x0

    .line 28
    iput-object v0, p0, Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;->refreshImageWrapper:Landroid/view/View;

    .line 29
    iput-object v0, p0, Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;->refreshImageView:Landroid/view/View;

    .line 30
    iput-object v0, p0, Lcom/mobnetic/coinguardian/dialog/DynamicCurrencyPairsDialog;->statusView:Landroid/widget/TextView;

    .line 31
    return-void
.end method
