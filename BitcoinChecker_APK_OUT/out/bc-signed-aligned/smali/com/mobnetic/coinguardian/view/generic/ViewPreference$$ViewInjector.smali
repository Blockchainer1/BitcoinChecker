.class public Lcom/mobnetic/coinguardian/view/generic/ViewPreference$$ViewInjector;
.super Ljava/lang/Object;
.source "ViewPreference$$ViewInjector.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static inject(Lbutterknife/ButterKnife$Finder;Lcom/mobnetic/coinguardian/view/generic/ViewPreference;Ljava/lang/Object;)V
    .locals 2
    .param p0, "finder"    # Lbutterknife/ButterKnife$Finder;
    .param p1, "target"    # Lcom/mobnetic/coinguardian/view/generic/ViewPreference;
    .param p2, "source"    # Ljava/lang/Object;

    .prologue
    .line 10
    const v1, 0x7f0e0096

    invoke-virtual {p0, p2, v1}, Lbutterknife/ButterKnife$Finder;->findById(Ljava/lang/Object;I)Landroid/view/View;

    move-result-object v0

    .line 11
    .local v0, "view":Landroid/view/View;
    check-cast v0, Landroid/view/ViewGroup;

    .end local v0    # "view":Landroid/view/View;
    iput-object v0, p1, Lcom/mobnetic/coinguardian/view/generic/ViewPreference;->titleAndSummaryContainer:Landroid/view/ViewGroup;

    .line 12
    const v1, 0x7f0e000c

    invoke-virtual {p0, p2, v1}, Lbutterknife/ButterKnife$Finder;->findById(Ljava/lang/Object;I)Landroid/view/View;

    move-result-object v0

    .line 13
    .restart local v0    # "view":Landroid/view/View;
    check-cast v0, Landroid/widget/TextView;

    .end local v0    # "view":Landroid/view/View;
    iput-object v0, p1, Lcom/mobnetic/coinguardian/view/generic/ViewPreference;->titleView:Landroid/widget/TextView;

    .line 14
    const v1, 0x7f0e000b

    invoke-virtual {p0, p2, v1}, Lbutterknife/ButterKnife$Finder;->findById(Ljava/lang/Object;I)Landroid/view/View;

    move-result-object v0

    .line 15
    .restart local v0    # "view":Landroid/view/View;
    check-cast v0, Landroid/widget/TextView;

    .end local v0    # "view":Landroid/view/View;
    iput-object v0, p1, Lcom/mobnetic/coinguardian/view/generic/ViewPreference;->summaryView:Landroid/widget/TextView;

    .line 16
    const v1, 0x7f0e0097

    invoke-virtual {p0, p2, v1}, Lbutterknife/ButterKnife$Finder;->findById(Ljava/lang/Object;I)Landroid/view/View;

    move-result-object v0

    .line 17
    .restart local v0    # "view":Landroid/view/View;
    check-cast v0, Landroid/view/ViewGroup;

    .end local v0    # "view":Landroid/view/View;
    iput-object v0, p1, Lcom/mobnetic/coinguardian/view/generic/ViewPreference;->widgetFrame:Landroid/view/ViewGroup;

    .line 18
    return-void
.end method

.method public static reset(Lcom/mobnetic/coinguardian/view/generic/ViewPreference;)V
    .locals 1
    .param p0, "target"    # Lcom/mobnetic/coinguardian/view/generic/ViewPreference;

    .prologue
    const/4 v0, 0x0

    .line 21
    iput-object v0, p0, Lcom/mobnetic/coinguardian/view/generic/ViewPreference;->titleAndSummaryContainer:Landroid/view/ViewGroup;

    .line 22
    iput-object v0, p0, Lcom/mobnetic/coinguardian/view/generic/ViewPreference;->titleView:Landroid/widget/TextView;

    .line 23
    iput-object v0, p0, Lcom/mobnetic/coinguardian/view/generic/ViewPreference;->summaryView:Landroid/widget/TextView;

    .line 24
    iput-object v0, p0, Lcom/mobnetic/coinguardian/view/generic/ViewPreference;->widgetFrame:Landroid/view/ViewGroup;

    .line 25
    return-void
.end method
