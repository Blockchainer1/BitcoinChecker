.class public Lcom/mobnetic/coinguardian/adapter/CheckersListAdapter$ViewHolder$$ViewInjector;
.super Ljava/lang/Object;
.source "CheckersListAdapter$ViewHolder$$ViewInjector.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static inject(Lbutterknife/ButterKnife$Finder;Lcom/mobnetic/coinguardian/adapter/CheckersListAdapter$ViewHolder;Ljava/lang/Object;)V
    .locals 3
    .param p0, "finder"    # Lbutterknife/ButterKnife$Finder;
    .param p1, "target"    # Lcom/mobnetic/coinguardian/adapter/CheckersListAdapter$ViewHolder;
    .param p2, "source"    # Ljava/lang/Object;

    .prologue
    .line 10
    const v1, 0x7f0e007a

    invoke-virtual {p0, p2, v1}, Lbutterknife/ButterKnife$Finder;->findById(Ljava/lang/Object;I)Landroid/view/View;

    move-result-object v0

    .line 11
    .local v0, "view":Landroid/view/View;
    if-nez v0, :cond_0

    .line 12
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Required view with id \'2131624058\' for field \'marketView\' was not found. If this view is optional add \'@Optional\' annotation."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 14
    :cond_0
    check-cast v0, Landroid/widget/TextView;

    .end local v0    # "view":Landroid/view/View;
    iput-object v0, p1, Lcom/mobnetic/coinguardian/adapter/CheckersListAdapter$ViewHolder;->marketView:Landroid/widget/TextView;

    .line 15
    const v1, 0x7f0e0078

    invoke-virtual {p0, p2, v1}, Lbutterknife/ButterKnife$Finder;->findById(Ljava/lang/Object;I)Landroid/view/View;

    move-result-object v0

    .line 16
    .restart local v0    # "view":Landroid/view/View;
    if-nez v0, :cond_1

    .line 17
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Required view with id \'2131624056\' for field \'currencyView\' was not found. If this view is optional add \'@Optional\' annotation."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 19
    :cond_1
    check-cast v0, Landroid/widget/TextView;

    .end local v0    # "view":Landroid/view/View;
    iput-object v0, p1, Lcom/mobnetic/coinguardian/adapter/CheckersListAdapter$ViewHolder;->currencyView:Landroid/widget/TextView;

    .line 20
    const v1, 0x7f0e0058

    invoke-virtual {p0, p2, v1}, Lbutterknife/ButterKnife$Finder;->findById(Ljava/lang/Object;I)Landroid/view/View;

    move-result-object v0

    .line 21
    .restart local v0    # "view":Landroid/view/View;
    if-nez v0, :cond_2

    .line 22
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Required view with id \'2131624024\' for field \'alarmView\' was not found. If this view is optional add \'@Optional\' annotation."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 24
    :cond_2
    check-cast v0, Landroid/widget/TextView;

    .end local v0    # "view":Landroid/view/View;
    iput-object v0, p1, Lcom/mobnetic/coinguardian/adapter/CheckersListAdapter$ViewHolder;->alarmView:Landroid/widget/TextView;

    .line 25
    const v1, 0x7f0e007c

    invoke-virtual {p0, p2, v1}, Lbutterknife/ButterKnife$Finder;->findById(Ljava/lang/Object;I)Landroid/view/View;

    move-result-object v0

    .line 26
    .restart local v0    # "view":Landroid/view/View;
    if-nez v0, :cond_3

    .line 27
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Required view with id \'2131624060\' for field \'separator\' was not found. If this view is optional add \'@Optional\' annotation."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 29
    :cond_3
    iput-object v0, p1, Lcom/mobnetic/coinguardian/adapter/CheckersListAdapter$ViewHolder;->separator:Landroid/view/View;

    .line 30
    const v1, 0x7f0e007d

    invoke-virtual {p0, p2, v1}, Lbutterknife/ButterKnife$Finder;->findById(Ljava/lang/Object;I)Landroid/view/View;

    move-result-object v0

    .line 31
    if-nez v0, :cond_4

    .line 32
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Required view with id \'2131624061\' for field \'lastCheckView\' was not found. If this view is optional add \'@Optional\' annotation."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 34
    :cond_4
    check-cast v0, Landroid/widget/TextView;

    .end local v0    # "view":Landroid/view/View;
    iput-object v0, p1, Lcom/mobnetic/coinguardian/adapter/CheckersListAdapter$ViewHolder;->lastCheckView:Landroid/widget/TextView;

    .line 35
    const v1, 0x7f0e007e

    invoke-virtual {p0, p2, v1}, Lbutterknife/ButterKnife$Finder;->findById(Ljava/lang/Object;I)Landroid/view/View;

    move-result-object v0

    .line 36
    .restart local v0    # "view":Landroid/view/View;
    if-nez v0, :cond_5

    .line 37
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Required view with id \'2131624062\' for field \'lastCheckValueView\' was not found. If this view is optional add \'@Optional\' annotation."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 39
    :cond_5
    check-cast v0, Landroid/widget/TextView;

    .end local v0    # "view":Landroid/view/View;
    iput-object v0, p1, Lcom/mobnetic/coinguardian/adapter/CheckersListAdapter$ViewHolder;->lastCheckValueView:Landroid/widget/TextView;

    .line 40
    const v1, 0x7f0e007f

    invoke-virtual {p0, p2, v1}, Lbutterknife/ButterKnife$Finder;->findById(Ljava/lang/Object;I)Landroid/view/View;

    move-result-object v0

    .line 41
    .restart local v0    # "view":Landroid/view/View;
    if-nez v0, :cond_6

    .line 42
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Required view with id \'2131624063\' for field \'lastCheckTimeView\' was not found. If this view is optional add \'@Optional\' annotation."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 44
    :cond_6
    check-cast v0, Landroid/widget/TextView;

    .end local v0    # "view":Landroid/view/View;
    iput-object v0, p1, Lcom/mobnetic/coinguardian/adapter/CheckersListAdapter$ViewHolder;->lastCheckTimeView:Landroid/widget/TextView;

    .line 45
    const v1, 0x7f0e0077

    invoke-virtual {p0, p2, v1}, Lbutterknife/ButterKnife$Finder;->findById(Ljava/lang/Object;I)Landroid/view/View;

    move-result-object v0

    .line 46
    .restart local v0    # "view":Landroid/view/View;
    if-nez v0, :cond_7

    .line 47
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Required view with id \'2131624055\' for field \'dragHandle\' was not found. If this view is optional add \'@Optional\' annotation."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 49
    :cond_7
    iput-object v0, p1, Lcom/mobnetic/coinguardian/adapter/CheckersListAdapter$ViewHolder;->dragHandle:Landroid/view/View;

    .line 50
    const v1, 0x7f0e0080

    invoke-virtual {p0, p2, v1}, Lbutterknife/ButterKnife$Finder;->findById(Ljava/lang/Object;I)Landroid/view/View;

    move-result-object v0

    .line 51
    if-nez v0, :cond_8

    .line 52
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Required view with id \'2131624064\' for field \'switchView\' was not found. If this view is optional add \'@Optional\' annotation."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 54
    :cond_8
    check-cast v0, Landroid/widget/CompoundButton;

    .end local v0    # "view":Landroid/view/View;
    iput-object v0, p1, Lcom/mobnetic/coinguardian/adapter/CheckersListAdapter$ViewHolder;->switchView:Landroid/widget/CompoundButton;

    .line 55
    return-void
.end method

.method public static reset(Lcom/mobnetic/coinguardian/adapter/CheckersListAdapter$ViewHolder;)V
    .locals 1
    .param p0, "target"    # Lcom/mobnetic/coinguardian/adapter/CheckersListAdapter$ViewHolder;

    .prologue
    const/4 v0, 0x0

    .line 58
    iput-object v0, p0, Lcom/mobnetic/coinguardian/adapter/CheckersListAdapter$ViewHolder;->marketView:Landroid/widget/TextView;

    .line 59
    iput-object v0, p0, Lcom/mobnetic/coinguardian/adapter/CheckersListAdapter$ViewHolder;->currencyView:Landroid/widget/TextView;

    .line 60
    iput-object v0, p0, Lcom/mobnetic/coinguardian/adapter/CheckersListAdapter$ViewHolder;->alarmView:Landroid/widget/TextView;

    .line 61
    iput-object v0, p0, Lcom/mobnetic/coinguardian/adapter/CheckersListAdapter$ViewHolder;->separator:Landroid/view/View;

    .line 62
    iput-object v0, p0, Lcom/mobnetic/coinguardian/adapter/CheckersListAdapter$ViewHolder;->lastCheckView:Landroid/widget/TextView;

    .line 63
    iput-object v0, p0, Lcom/mobnetic/coinguardian/adapter/CheckersListAdapter$ViewHolder;->lastCheckValueView:Landroid/widget/TextView;

    .line 64
    iput-object v0, p0, Lcom/mobnetic/coinguardian/adapter/CheckersListAdapter$ViewHolder;->lastCheckTimeView:Landroid/widget/TextView;

    .line 65
    iput-object v0, p0, Lcom/mobnetic/coinguardian/adapter/CheckersListAdapter$ViewHolder;->dragHandle:Landroid/view/View;

    .line 66
    iput-object v0, p0, Lcom/mobnetic/coinguardian/adapter/CheckersListAdapter$ViewHolder;->switchView:Landroid/widget/CompoundButton;

    .line 67
    return-void
.end method
