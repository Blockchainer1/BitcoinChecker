.class public Lcom/mobnetic/coinguardian/view/generic/ViewSwitchPreference;
.super Lcom/mobnetic/coinguardian/view/generic/ViewTwoStatePreference;
.source "ViewSwitchPreference.java"


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
    new-instance v0, Lde/ankri/views/Switch;

    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/view/generic/ViewSwitchPreference;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lde/ankri/views/Switch;-><init>(Landroid/content/Context;)V

    return-object v0
.end method
