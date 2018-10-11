.class public abstract Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;
.super Lcom/mobnetic/coinguardian/view/generic/ViewPreference;
.source "ViewTwoStatePreference.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference$OnCheckChangedListener;
    }
.end annotation


# instance fields
.field compoundButton:Landroid/widget/CompoundButton;

.field private isChecked:Z

.field private onCheckChangedListener:Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference$OnCheckChangedListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 21
    invoke-direct {p0, p1}, Lcom/mobnetic/coinguardian/view/generic/ViewPreference;-><init>(Landroid/content/Context;)V

    .line 22
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 25
    invoke-direct {p0, p1, p2}, Lcom/mobnetic/coinguardian/view/generic/ViewPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 26
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
    .line 30
    invoke-direct {p0, p1, p2, p3}, Lcom/mobnetic/coinguardian/view/generic/ViewPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 31
    return-void
.end method


# virtual methods
.method protected abstract createCompoundButton()Landroid/widget/CompoundButton;
.end method

.method protected init(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 55
    invoke-super {p0, p1, p2}, Lcom/mobnetic/coinguardian/view/generic/ViewPreference;->init(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 57
    if-eqz p2, :cond_0

    .line 58
    sget-object v1, Lcom/mobnetic/coinguardian/R$styleable;->ViewPreference:[I

    invoke-virtual {p1, p2, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 59
    .local v0, "a":Landroid/content/res/TypedArray;
    const/4 v1, 0x2

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v1

    iput-boolean v1, p0, Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;->isChecked:Z

    .line 60
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 62
    .end local v0    # "a":Landroid/content/res/TypedArray;
    :cond_0
    return-void
.end method

.method public isChecked()Z
    .locals 1

    .prologue
    .line 75
    iget-boolean v0, p0, Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;->isChecked:Z

    return v0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 0
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 84
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;->toggle()V

    .line 85
    return-void
.end method

.method protected onFinishInflate()V
    .locals 2

    .prologue
    .line 37
    invoke-super {p0}, Lcom/mobnetic/coinguardian/view/generic/ViewPreference;->onFinishInflate()V

    .line 39
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;->createCompoundButton()Landroid/widget/CompoundButton;

    move-result-object v0

    iput-object v0, p0, Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;->compoundButton:Landroid/widget/CompoundButton;

    .line 40
    iget-object v0, p0, Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;->compoundButton:Landroid/widget/CompoundButton;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/CompoundButton;->setFocusable(Z)V

    .line 41
    iget-object v0, p0, Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;->compoundButton:Landroid/widget/CompoundButton;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/CompoundButton;->setDuplicateParentStateEnabled(Z)V

    .line 42
    iget-object v0, p0, Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;->compoundButton:Landroid/widget/CompoundButton;

    new-instance v1, Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference$1;

    invoke-direct {v1, p0}, Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference$1;-><init>(Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;)V

    invoke-virtual {v0, v1}, Landroid/widget/CompoundButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 48
    iget-object v0, p0, Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;->compoundButton:Landroid/widget/CompoundButton;

    invoke-virtual {p0, v0}, Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;->setWidget(Landroid/view/View;)V

    .line 50
    iget-boolean v0, p0, Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;->isChecked:Z

    invoke-virtual {p0, v0}, Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;->setChecked(Z)V

    .line 51
    return-void
.end method

.method public setChecked(Z)V
    .locals 1
    .param p1, "checked"    # Z

    .prologue
    .line 65
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;->isChecked()Z

    move-result v0

    if-ne v0, p1, :cond_1

    .line 72
    :cond_0
    :goto_0
    return-void

    .line 68
    :cond_1
    iget-object v0, p0, Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;->onCheckChangedListener:Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference$OnCheckChangedListener;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;->onCheckChangedListener:Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference$OnCheckChangedListener;

    invoke-interface {v0, p0, p1}, Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference$OnCheckChangedListener;->onCheckChanged(Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 69
    :cond_2
    iput-boolean p1, p0, Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;->isChecked:Z

    .line 70
    iget-object v0, p0, Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;->compoundButton:Landroid/widget/CompoundButton;

    invoke-virtual {v0, p1}, Landroid/widget/CompoundButton;->setChecked(Z)V

    goto :goto_0
.end method

.method public setOnCheckChangedListener(Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference$OnCheckChangedListener;)V
    .locals 0
    .param p1, "onCheckChangedListener"    # Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference$OnCheckChangedListener;

    .prologue
    .line 95
    iput-object p1, p0, Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;->onCheckChangedListener:Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference$OnCheckChangedListener;

    .line 96
    return-void
.end method

.method public toggle()V
    .locals 1

    .prologue
    .line 79
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;->isChecked()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {p0, v0}, Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;->setChecked(Z)V

    .line 80
    return-void

    .line 79
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
