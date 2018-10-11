.class public Lcom/mobnetic/coinguardian/view/generic/ViewPreference;
.super Landroid/widget/FrameLayout;
.source "ViewPreference.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private summary:Ljava/lang/CharSequence;

.field summaryView:Landroid/widget/TextView;
    .annotation build Lbutterknife/InjectView;
        value = 0x7f0e000b
    .end annotation

    .annotation build Lbutterknife/Optional;
    .end annotation
.end field

.field private title:Ljava/lang/CharSequence;

.field titleAndSummaryContainer:Landroid/view/ViewGroup;
    .annotation build Lbutterknife/InjectView;
        value = 0x7f0e0096
    .end annotation

    .annotation build Lbutterknife/Optional;
    .end annotation
.end field

.field titleView:Landroid/widget/TextView;
    .annotation build Lbutterknife/InjectView;
        value = 0x7f0e000c
    .end annotation

    .annotation build Lbutterknife/Optional;
    .end annotation
.end field

.field widgetFrame:Landroid/view/ViewGroup;
    .annotation build Lbutterknife/InjectView;
        value = 0x7f0e0097
    .end annotation

    .annotation build Lbutterknife/Optional;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 34
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 35
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/mobnetic/coinguardian/view/generic/ViewPreference;->init(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 36
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 39
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 40
    invoke-virtual {p0, p1, p2}, Lcom/mobnetic/coinguardian/view/generic/ViewPreference;->init(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 41
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .prologue
    .line 45
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 46
    invoke-virtual {p0, p1, p2}, Lcom/mobnetic/coinguardian/view/generic/ViewPreference;->init(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 47
    return-void
.end method


# virtual methods
.method public getSummary()Ljava/lang/CharSequence;
    .locals 1

    .prologue
    .line 109
    iget-object v0, p0, Lcom/mobnetic/coinguardian/view/generic/ViewPreference;->summary:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public getTitle()Ljava/lang/CharSequence;
    .locals 1

    .prologue
    .line 98
    iget-object v0, p0, Lcom/mobnetic/coinguardian/view/generic/ViewPreference;->title:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public getTitleAndSummaryContainer()Landroid/view/ViewGroup;
    .locals 1

    .prologue
    .line 78
    iget-object v0, p0, Lcom/mobnetic/coinguardian/view/generic/ViewPreference;->titleAndSummaryContainer:Landroid/view/ViewGroup;

    return-object v0
.end method

.method public getWidgetFrame()Landroid/view/ViewGroup;
    .locals 1

    .prologue
    .line 81
    iget-object v0, p0, Lcom/mobnetic/coinguardian/view/generic/ViewPreference;->widgetFrame:Landroid/view/ViewGroup;

    return-object v0
.end method

.method protected init(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v4, 0x1

    .line 63
    new-instance v1, Landroid/util/TypedValue;

    invoke-direct {v1}, Landroid/util/TypedValue;-><init>()V

    .local v1, "typedValue":Landroid/util/TypedValue;
    move-object v2, p1

    .line 64
    check-cast v2, Landroid/app/Activity;

    invoke-virtual {v2}, Landroid/app/Activity;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v2

    const v3, 0x7f010037

    invoke-virtual {v2, v3, v1, v4}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 65
    iget v2, v1, Landroid/util/TypedValue;->resourceId:I

    invoke-virtual {p0, v2}, Lcom/mobnetic/coinguardian/view/generic/ViewPreference;->setBackgroundResource(I)V

    .line 66
    invoke-virtual {p0, p0}, Lcom/mobnetic/coinguardian/view/generic/ViewPreference;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 67
    invoke-virtual {p0, v4}, Lcom/mobnetic/coinguardian/view/generic/ViewPreference;->setFocusable(Z)V

    .line 69
    if-eqz p2, :cond_0

    .line 70
    sget-object v2, Lcom/mobnetic/coinguardian/R$styleable;->ViewPreference:[I

    invoke-virtual {p1, p2, v2}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 71
    .local v0, "a":Landroid/content/res/TypedArray;
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/mobnetic/coinguardian/view/generic/ViewPreference;->title:Ljava/lang/CharSequence;

    .line 72
    invoke-virtual {v0, v4}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/mobnetic/coinguardian/view/generic/ViewPreference;->summary:Ljava/lang/CharSequence;

    .line 73
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 75
    .end local v0    # "a":Landroid/content/res/TypedArray;
    :cond_0
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 0
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 114
    return-void
.end method

.method protected onFinishInflate()V
    .locals 2

    .prologue
    .line 51
    invoke-super {p0}, Landroid/widget/FrameLayout;->onFinishInflate()V

    .line 53
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/view/generic/ViewPreference;->getChildCount()I

    move-result v0

    if-nez v0, :cond_0

    .line 54
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/view/generic/ViewPreference;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f03002e

    invoke-virtual {v0, v1, p0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 56
    :cond_0
    invoke-static {p0}, Lbutterknife/ButterKnife;->inject(Landroid/view/View;)V

    .line 58
    iget-object v0, p0, Lcom/mobnetic/coinguardian/view/generic/ViewPreference;->title:Ljava/lang/CharSequence;

    invoke-virtual {p0, v0}, Lcom/mobnetic/coinguardian/view/generic/ViewPreference;->setTitle(Ljava/lang/CharSequence;)V

    .line 59
    iget-object v0, p0, Lcom/mobnetic/coinguardian/view/generic/ViewPreference;->summary:Ljava/lang/CharSequence;

    invoke-virtual {p0, v0}, Lcom/mobnetic/coinguardian/view/generic/ViewPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 60
    return-void
.end method

.method public setSummary(Ljava/lang/CharSequence;)V
    .locals 2
    .param p1, "summary"    # Ljava/lang/CharSequence;

    .prologue
    .line 102
    iput-object p1, p0, Lcom/mobnetic/coinguardian/view/generic/ViewPreference;->summary:Ljava/lang/CharSequence;

    .line 103
    iget-object v0, p0, Lcom/mobnetic/coinguardian/view/generic/ViewPreference;->summaryView:Landroid/widget/TextView;

    if-eqz v0, :cond_0

    .line 104
    iget-object v0, p0, Lcom/mobnetic/coinguardian/view/generic/ViewPreference;->summaryView:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 105
    iget-object v1, p0, Lcom/mobnetic/coinguardian/view/generic/ViewPreference;->summaryView:Landroid/widget/TextView;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/16 v0, 0x8

    :goto_0
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 107
    :cond_0
    return-void

    .line 105
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setTitle(Ljava/lang/CharSequence;)V
    .locals 1
    .param p1, "title"    # Ljava/lang/CharSequence;

    .prologue
    .line 93
    iput-object p1, p0, Lcom/mobnetic/coinguardian/view/generic/ViewPreference;->title:Ljava/lang/CharSequence;

    .line 94
    iget-object v0, p0, Lcom/mobnetic/coinguardian/view/generic/ViewPreference;->titleView:Landroid/widget/TextView;

    if-eqz v0, :cond_0

    .line 95
    iget-object v0, p0, Lcom/mobnetic/coinguardian/view/generic/ViewPreference;->titleView:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 96
    :cond_0
    return-void
.end method

.method protected setWidget(Landroid/view/View;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 85
    iget-object v0, p0, Lcom/mobnetic/coinguardian/view/generic/ViewPreference;->widgetFrame:Landroid/view/ViewGroup;

    if-nez v0, :cond_0

    .line 90
    :goto_0
    return-void

    .line 88
    :cond_0
    iget-object v0, p0, Lcom/mobnetic/coinguardian/view/generic/ViewPreference;->widgetFrame:Landroid/view/ViewGroup;

    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 89
    iget-object v0, p0, Lcom/mobnetic/coinguardian/view/generic/ViewPreference;->widgetFrame:Landroid/view/ViewGroup;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setVisibility(I)V

    goto :goto_0
.end method
