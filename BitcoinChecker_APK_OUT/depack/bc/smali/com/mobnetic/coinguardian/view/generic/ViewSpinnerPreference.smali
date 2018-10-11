.class public Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference;
.super Lcom/mobnetic/coinguardian/view/generic/ViewDialogPreference;
.source "ViewSpinnerPreference.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference$OnItemSelectedListener;
    }
.end annotation


# instance fields
.field private adapter:Landroid/widget/BaseAdapter;

.field private entries:[Ljava/lang/CharSequence;

.field private onItemSelectedListener:Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference$OnItemSelectedListener;

.field private selection:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 19
    invoke-direct {p0, p1}, Lcom/mobnetic/coinguardian/view/generic/ViewDialogPreference;-><init>(Landroid/content/Context;)V

    .line 13
    const/4 v0, -0x1

    iput v0, p0, Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference;->selection:I

    .line 20
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 23
    invoke-direct {p0, p1, p2}, Lcom/mobnetic/coinguardian/view/generic/ViewDialogPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 13
    const/4 v0, -0x1

    iput v0, p0, Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference;->selection:I

    .line 24
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .prologue
    .line 28
    invoke-direct {p0, p1, p2, p3}, Lcom/mobnetic/coinguardian/view/generic/ViewDialogPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 13
    const/4 v0, -0x1

    iput v0, p0, Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference;->selection:I

    .line 29
    return-void
.end method


# virtual methods
.method public getEntries()[Ljava/lang/CharSequence;
    .locals 1

    .prologue
    .line 46
    iget-object v0, p0, Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference;->entries:[Ljava/lang/CharSequence;

    return-object v0
.end method

.method public getEntry()Ljava/lang/CharSequence;
    .locals 2

    .prologue
    .line 49
    iget-object v0, p0, Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference;->entries:[Ljava/lang/CharSequence;

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference;->selection:I

    if-ltz v0, :cond_0

    iget v0, p0, Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference;->selection:I

    iget-object v1, p0, Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference;->entries:[Ljava/lang/CharSequence;

    array-length v1, v1

    if-ge v0, v1, :cond_0

    .line 50
    iget-object v0, p0, Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference;->entries:[Ljava/lang/CharSequence;

    iget v1, p0, Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference;->selection:I

    aget-object v0, v0, v1

    .line 52
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getSelection()I
    .locals 1

    .prologue
    .line 68
    iget v0, p0, Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference;->selection:I

    return v0
.end method

.method protected onPrepareDialog(Landroid/app/AlertDialog$Builder;)V
    .locals 3
    .param p1, "builder"    # Landroid/app/AlertDialog$Builder;

    .prologue
    .line 73
    new-instance v0, Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference$1;

    invoke-direct {v0, p0}, Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference$1;-><init>(Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference;)V

    .line 80
    .local v0, "onClickListener":Landroid/content/DialogInterface$OnClickListener;
    iget-object v1, p0, Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference;->adapter:Landroid/widget/BaseAdapter;

    if-nez v1, :cond_0

    .line 81
    iget-object v1, p0, Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference;->entries:[Ljava/lang/CharSequence;

    iget v2, p0, Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference;->selection:I

    invoke-virtual {p1, v1, v2, v0}, Landroid/app/AlertDialog$Builder;->setSingleChoiceItems([Ljava/lang/CharSequence;ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 84
    :goto_0
    return-void

    .line 83
    :cond_0
    iget-object v1, p0, Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference;->adapter:Landroid/widget/BaseAdapter;

    iget v2, p0, Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference;->selection:I

    invoke-virtual {p1, v1, v2, v0}, Landroid/app/AlertDialog$Builder;->setSingleChoiceItems(Landroid/widget/ListAdapter;ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    goto :goto_0
.end method

.method public setEntries([Ljava/lang/CharSequence;)V
    .locals 1
    .param p1, "entries"    # [Ljava/lang/CharSequence;

    .prologue
    .line 32
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference;->setEntriesAndSelection([Ljava/lang/CharSequence;I)V

    .line 33
    return-void
.end method

.method public setEntriesAndSelection(Landroid/widget/BaseAdapter;[Ljava/lang/CharSequence;I)V
    .locals 0
    .param p1, "adapter"    # Landroid/widget/BaseAdapter;
    .param p2, "entries"    # [Ljava/lang/CharSequence;
    .param p3, "selection"    # I

    .prologue
    .line 41
    iput-object p1, p0, Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference;->adapter:Landroid/widget/BaseAdapter;

    .line 42
    invoke-virtual {p0, p2, p3}, Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference;->setEntriesAndSelection([Ljava/lang/CharSequence;I)V

    .line 43
    return-void
.end method

.method public setEntriesAndSelection([Ljava/lang/CharSequence;I)V
    .locals 0
    .param p1, "entries"    # [Ljava/lang/CharSequence;
    .param p2, "selection"    # I

    .prologue
    .line 36
    iput-object p1, p0, Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference;->entries:[Ljava/lang/CharSequence;

    .line 37
    invoke-virtual {p0, p2}, Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference;->setSelection(I)V

    .line 38
    return-void
.end method

.method public setOnItemSelectedListener(Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference$OnItemSelectedListener;)V
    .locals 0
    .param p1, "onItemSelectedListener"    # Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference$OnItemSelectedListener;

    .prologue
    .line 94
    iput-object p1, p0, Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference;->onItemSelectedListener:Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference$OnItemSelectedListener;

    .line 95
    return-void
.end method

.method public setSelection(I)V
    .locals 1
    .param p1, "selection"    # I

    .prologue
    .line 56
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference;->setSelection(IZ)V

    .line 57
    return-void
.end method

.method public setSelection(IZ)V
    .locals 1
    .param p1, "selection"    # I
    .param p2, "notifyChange"    # Z

    .prologue
    .line 60
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference;->getSelection()I

    move-result v0

    if-eq v0, p1, :cond_1

    .line 61
    if-eqz p2, :cond_0

    iget-object v0, p0, Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference;->onItemSelectedListener:Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference$OnItemSelectedListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference;->onItemSelectedListener:Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference$OnItemSelectedListener;

    invoke-interface {v0, p0, p1}, Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference$OnItemSelectedListener;->onItemSelected(Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference;I)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 62
    :cond_0
    iput p1, p0, Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference;->selection:I

    .line 65
    :cond_1
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference;->getEntry()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mobnetic/coinguardian/view/generic/ViewSpinnerPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 66
    return-void
.end method
