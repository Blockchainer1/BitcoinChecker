.class public Lcom/mobnetic/coinguardian/view/generic/ViewCheckBoxPreference;
.super Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;
.source "ViewCheckBoxPreference.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 13
    invoke-direct {p0, p1}, Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;-><init>(Landroid/content/Context;)V

    .line 14
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 17
    invoke-direct {p0, p1, p2}, Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 18
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
    .line 22
    invoke-direct {p0, p1, p2, p3}, Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 23
    return-void
.end method


# virtual methods
.method protected createCompoundButton()Landroid/widget/CompoundButton;
    .locals 2

    .prologue
    .line 27
    new-instance v0, Landroid/widget/CheckBox;

    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/view/generic/ViewCheckBoxPreference;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    .line 28
    .local v0, "checkBox":Landroid/widget/CheckBox;
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setClickable(Z)V

    .line 29
    return-object v0
.end method
