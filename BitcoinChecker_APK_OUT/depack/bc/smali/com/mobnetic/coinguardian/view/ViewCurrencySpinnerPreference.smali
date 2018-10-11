.class public Lcom/mobnetic/coinguardian/view/ViewCurrencySpinnerPreference;
.super Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference;
.source "ViewCurrencySpinnerPreference.java"


# instance fields
.field private onSyncClickedListener:Landroid/view/View$OnClickListener;

.field private showSyncButton:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 21
    invoke-direct {p0, p1}, Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference;-><init>(Landroid/content/Context;)V

    .line 22
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 25
    invoke-direct {p0, p1, p2}, Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

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
    invoke-direct {p0, p1, p2, p3}, Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 31
    return-void
.end method

.method static synthetic access$000(Lcom/mobnetic/coinguardian/view/ViewCurrencySpinnerPreference;)Landroid/view/View$OnClickListener;
    .locals 1
    .param p0, "x0"    # Lcom/mobnetic/coinguardian/view/ViewCurrencySpinnerPreference;

    .prologue
    .line 14
    iget-object v0, p0, Lcom/mobnetic/coinguardian/view/ViewCurrencySpinnerPreference;->onSyncClickedListener:Landroid/view/View$OnClickListener;

    return-object v0
.end method


# virtual methods
.method protected onPrepareDialog(Landroid/app/AlertDialog$Builder;)V
    .locals 2
    .param p1, "builder"    # Landroid/app/AlertDialog$Builder;

    .prologue
    .line 39
    invoke-super {p0, p1}, Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference;->onPrepareDialog(Landroid/app/AlertDialog$Builder;)V

    .line 40
    iget-boolean v0, p0, Lcom/mobnetic/coinguardian/view/ViewCurrencySpinnerPreference;->showSyncButton:Z

    if-eqz v0, :cond_0

    .line 41
    const v0, 0x7f070031

    new-instance v1, Lcom/mobnetic/coinguardian/view/ViewCurrencySpinnerPreference$1;

    invoke-direct {v1, p0}, Lcom/mobnetic/coinguardian/view/ViewCurrencySpinnerPreference$1;-><init>(Lcom/mobnetic/coinguardian/view/ViewCurrencySpinnerPreference;)V

    invoke-virtual {p1, v0, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 48
    :cond_0
    return-void
.end method

.method public setOnSyncClickedListener(Landroid/view/View$OnClickListener;)V
    .locals 0
    .param p1, "onSyncClickedListener"    # Landroid/view/View$OnClickListener;

    .prologue
    .line 51
    iput-object p1, p0, Lcom/mobnetic/coinguardian/view/ViewCurrencySpinnerPreference;->onSyncClickedListener:Landroid/view/View$OnClickListener;

    .line 52
    return-void
.end method

.method public setShowSyncButton(Z)V
    .locals 0
    .param p1, "showSyncButton"    # Z

    .prologue
    .line 34
    iput-boolean p1, p0, Lcom/mobnetic/coinguardian/view/ViewCurrencySpinnerPreference;->showSyncButton:Z

    .line 35
    return-void
.end method
