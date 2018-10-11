.class public Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment$MyMultiChoiceModeListener;
.super Ljava/lang/Object;
.source "ActionModeListFragment.java"

# interfaces
.implements Landroid/widget/AbsListView$MultiChoiceModeListener;


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0xb
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "MyMultiChoiceModeListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment;


# direct methods
.method protected constructor <init>(Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment;

    .prologue
    .line 64
    .local p0, "this":Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment$MyMultiChoiceModeListener;, "Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment<TT;>.MyMultiChoiceModeListener;"
    iput-object p1, p0, Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment$MyMultiChoiceModeListener;->this$0:Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private refreshIconsAndTitle(Landroid/view/ActionMode;)V
    .locals 2
    .param p1, "mode"    # Landroid/view/ActionMode;

    .prologue
    .line 109
    .local p0, "this":Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment$MyMultiChoiceModeListener;, "Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment<TT;>.MyMultiChoiceModeListener;"
    iget-object v1, p0, Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment$MyMultiChoiceModeListener;->this$0:Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment;

    invoke-virtual {v1}, Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment;->getListView()Landroid/widget/ListView;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/ListView;->getCheckedItemCount()I

    move-result v0

    .line 110
    .local v0, "checkedItemCount":I
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/view/ActionMode;->setTitle(Ljava/lang/CharSequence;)V

    .line 111
    iget-object v1, p0, Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment$MyMultiChoiceModeListener;->this$0:Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment;

    invoke-virtual {v1, p1, v0}, Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment;->onActionModeItemsCheckedCountChanged(Landroid/view/ActionMode;I)V

    .line 112
    return-void
.end method


# virtual methods
.method public onActionItemClicked(Landroid/view/ActionMode;Landroid/view/MenuItem;)Z
    .locals 10
    .param p1, "mode"    # Landroid/view/ActionMode;
    .param p2, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 81
    .local p0, "this":Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment$MyMultiChoiceModeListener;, "Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment<TT;>.MyMultiChoiceModeListener;"
    const/4 v9, 0x0

    .line 82
    .local v9, "ret":Z
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment$MyMultiChoiceModeListener;->this$0:Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment;

    invoke-virtual {v0}, Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment;->getListView()Landroid/widget/ListView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/ListView;->getCheckedItemPositions()Landroid/util/SparseBooleanArray;

    move-result-object v6

    .line 83
    .local v6, "checkedItemsArray":Landroid/util/SparseBooleanArray;
    if-eqz v6, :cond_2

    .line 84
    invoke-virtual {v6}, Landroid/util/SparseBooleanArray;->size()I

    move-result v4

    .line 85
    .local v4, "checkedItemsCount":I
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_0
    if-ge v8, v4, :cond_2

    .line 87
    :try_start_0
    invoke-virtual {v6, v8}, Landroid/util/SparseBooleanArray;->valueAt(I)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment$MyMultiChoiceModeListener;->this$0:Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment;

    .line 88
    invoke-interface {p2}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    iget-object v2, p0, Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment$MyMultiChoiceModeListener;->this$0:Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment;

    invoke-static {v2}, Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment;->access$100(Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment;)Landroid/widget/ListAdapter;

    move-result-object v2

    invoke-virtual {v6, v8}, Landroid/util/SparseBooleanArray;->keyAt(I)I

    move-result v3

    invoke-interface {v2, v3}, Landroid/widget/ListAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v6, v8}, Landroid/util/SparseBooleanArray;->keyAt(I)I

    move-result v3

    add-int/lit8 v5, v4, -0x1

    if-ne v8, v5, :cond_1

    const/4 v5, 0x1

    :goto_1
    invoke-virtual/range {v0 .. v5}, Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment;->onActionModeOrContextMenuItemClicked(ILjava/lang/Object;IIZ)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    if-eqz v0, :cond_0

    .line 89
    const/4 v9, 0x1

    .line 85
    :cond_0
    :goto_2
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    .line 88
    :cond_1
    const/4 v5, 0x0

    goto :goto_1

    .line 91
    :catch_0
    move-exception v7

    .line 92
    .local v7, "e":Ljava/lang/Exception;
    invoke-virtual {v7}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_2

    .line 96
    .end local v4    # "checkedItemsCount":I
    .end local v7    # "e":Ljava/lang/Exception;
    .end local v8    # "i":I
    :cond_2
    if-eqz v9, :cond_3

    .line 97
    invoke-virtual {p1}, Landroid/view/ActionMode;->finish()V

    .line 98
    :cond_3
    return v9
.end method

.method public onCreateActionMode(Landroid/view/ActionMode;Landroid/view/Menu;)Z
    .locals 3
    .param p1, "mode"    # Landroid/view/ActionMode;
    .param p2, "menu"    # Landroid/view/Menu;

    .prologue
    .local p0, "this":Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment$MyMultiChoiceModeListener;, "Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment<TT;>.MyMultiChoiceModeListener;"
    const/4 v1, 0x1

    .line 66
    iget-object v2, p0, Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment$MyMultiChoiceModeListener;->this$0:Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment;

    invoke-virtual {v2, v1}, Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment;->onActionModeActive(Z)V

    .line 67
    iget-object v2, p0, Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment$MyMultiChoiceModeListener;->this$0:Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment;

    invoke-static {v2, p1}, Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment;->access$002(Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment;Landroid/view/ActionMode;)Landroid/view/ActionMode;

    .line 68
    iget-object v2, p0, Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment$MyMultiChoiceModeListener;->this$0:Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment;

    invoke-virtual {v2}, Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment;->getActionModeOrContextMenuResId()I

    move-result v0

    .line 69
    .local v0, "menuResId":I
    if-lez v0, :cond_0

    .line 70
    invoke-virtual {p1}, Landroid/view/ActionMode;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v2

    invoke-virtual {v2, v0, p2}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 71
    invoke-direct {p0, p1}, Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment$MyMultiChoiceModeListener;->refreshIconsAndTitle(Landroid/view/ActionMode;)V

    .line 74
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public onDestroyActionMode(Landroid/view/ActionMode;)V
    .locals 2
    .param p1, "mode"    # Landroid/view/ActionMode;

    .prologue
    .line 115
    .local p0, "this":Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment$MyMultiChoiceModeListener;, "Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment<TT;>.MyMultiChoiceModeListener;"
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment$MyMultiChoiceModeListener;->this$0:Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment;->onActionModeActive(Z)V

    .line 116
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment$MyMultiChoiceModeListener;->this$0:Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment;->access$002(Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment;Landroid/view/ActionMode;)Landroid/view/ActionMode;

    .line 117
    return-void
.end method

.method public onItemCheckedStateChanged(Landroid/view/ActionMode;IJZ)V
    .locals 0
    .param p1, "mode"    # Landroid/view/ActionMode;
    .param p2, "position"    # I
    .param p3, "id"    # J
    .param p5, "checked"    # Z

    .prologue
    .line 105
    .local p0, "this":Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment$MyMultiChoiceModeListener;, "Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment<TT;>.MyMultiChoiceModeListener;"
    invoke-direct {p0, p1}, Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment$MyMultiChoiceModeListener;->refreshIconsAndTitle(Landroid/view/ActionMode;)V

    .line 106
    return-void
.end method

.method public onPrepareActionMode(Landroid/view/ActionMode;Landroid/view/Menu;)Z
    .locals 1
    .param p1, "mode"    # Landroid/view/ActionMode;
    .param p2, "menu"    # Landroid/view/Menu;

    .prologue
    .line 102
    .local p0, "this":Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment$MyMultiChoiceModeListener;, "Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment<TT;>.MyMultiChoiceModeListener;"
    const/4 v0, 0x0

    return v0
.end method
