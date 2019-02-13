.class public abstract Lcom/mobnetic/coinguardian/view/generic/ViewDialogPreference;
.super Lcom/mobnetic/coinguardian/view/generic/ViewPreference;
.source "ViewDialogPreference.java"


# instance fields
.field private dialog:Landroid/app/AlertDialog;

.field private dialogTitle:Ljava/lang/CharSequence;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 20
    invoke-direct {p0, p1}, Lcom/mobnetic/coinguardian/view/generic/ViewPreference;-><init>(Landroid/content/Context;)V

    .line 21
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 24
    invoke-direct {p0, p1, p2}, Lcom/mobnetic/coinguardian/view/generic/ViewPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 25
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
    .line 29
    invoke-direct {p0, p1, p2, p3}, Lcom/mobnetic/coinguardian/view/generic/ViewPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 30
    return-void
.end method


# virtual methods
.method protected getDialog()Landroid/app/AlertDialog;
    .locals 1

    .prologue
    .line 68
    iget-object v0, p0, Lcom/mobnetic/coinguardian/view/generic/ViewDialogPreference;->dialog:Landroid/app/AlertDialog;

    return-object v0
.end method

.method public getDialogTitle()Ljava/lang/CharSequence;
    .locals 1

    .prologue
    .line 51
    iget-object v0, p0, Lcom/mobnetic/coinguardian/view/generic/ViewDialogPreference;->dialogTitle:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public abstract getEntry()Ljava/lang/CharSequence;
.end method

.method protected init(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 34
    invoke-super {p0, p1, p2}, Lcom/mobnetic/coinguardian/view/generic/ViewPreference;->init(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 36
    if-eqz p2, :cond_0

    .line 37
    sget-object v1, Lcom/mobnetic/coinguardian/R$styleable;->ViewDialogPreference:[I

    invoke-virtual {p1, p2, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 38
    .local v0, "a":Landroid/content/res/TypedArray;
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/mobnetic/coinguardian/view/generic/ViewDialogPreference;->setDialogTitle(Ljava/lang/CharSequence;)V

    .line 39
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 41
    .end local v0    # "a":Landroid/content/res/TypedArray;
    :cond_0
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 56
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/view/generic/ViewDialogPreference;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 57
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setInverseBackgroundForced(Z)Landroid/app/AlertDialog$Builder;

    .line 58
    iget-object v1, p0, Lcom/mobnetic/coinguardian/view/generic/ViewDialogPreference;->dialogTitle:Ljava/lang/CharSequence;

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 59
    const/high16 v1, 0x1040000

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 60
    invoke-virtual {p0, v0}, Lcom/mobnetic/coinguardian/view/generic/ViewDialogPreference;->onPrepareDialog(Landroid/app/AlertDialog$Builder;)V

    .line 62
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    iput-object v1, p0, Lcom/mobnetic/coinguardian/view/generic/ViewDialogPreference;->dialog:Landroid/app/AlertDialog;

    .line 63
    iget-object v1, p0, Lcom/mobnetic/coinguardian/view/generic/ViewDialogPreference;->dialog:Landroid/app/AlertDialog;

    invoke-virtual {p0, v1}, Lcom/mobnetic/coinguardian/view/generic/ViewDialogPreference;->onPreDialogShow(Landroid/app/AlertDialog;)V

    .line 64
    iget-object v1, p0, Lcom/mobnetic/coinguardian/view/generic/ViewDialogPreference;->dialog:Landroid/app/AlertDialog;

    invoke-virtual {v1}, Landroid/app/AlertDialog;->show()V

    .line 65
    return-void
.end method

.method protected onPreDialogShow(Landroid/app/AlertDialog;)V
    .locals 0
    .param p1, "dialog"    # Landroid/app/AlertDialog;

    .prologue
    .line 74
    return-void
.end method

.method protected abstract onPrepareDialog(Landroid/app/AlertDialog$Builder;)V
.end method

.method public setDialogTitle(Ljava/lang/CharSequence;)V
    .locals 1
    .param p1, "dialogTitle"    # Ljava/lang/CharSequence;

    .prologue
    .line 46
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 47
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/view/generic/ViewDialogPreference;->getTitle()Ljava/lang/CharSequence;

    move-result-object p1

    .line 48
    :cond_0
    iput-object p1, p0, Lcom/mobnetic/coinguardian/view/generic/ViewDialogPreference;->dialogTitle:Ljava/lang/CharSequence;

    .line 49
    return-void
.end method
