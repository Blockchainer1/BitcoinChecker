.class public Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment;
.super Landroid/support/v4/app/ListFragment;
.source "ActionModeListFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment$MyMultiChoiceModeListener;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Landroid/support/v4/app/ListFragment;"
    }
.end annotation


# instance fields
.field private adapter:Landroid/widget/ListAdapter;

.field private contextMenuSelectenItemPosition:I

.field private currentActionMode:Landroid/view/ActionMode;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 15
    .local p0, "this":Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment;, "Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment<TT;>;"
    invoke-direct {p0}, Landroid/support/v4/app/ListFragment;-><init>()V

    .line 20
    const/4 v0, -0x1

    iput v0, p0, Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment;->contextMenuSelectenItemPosition:I

    return-void
.end method

.method static synthetic access$002(Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment;Landroid/view/ActionMode;)Landroid/view/ActionMode;
    .locals 0
    .param p0, "x0"    # Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment;
    .param p1, "x1"    # Landroid/view/ActionMode;

    .prologue
    .line 15
    iput-object p1, p0, Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment;->currentActionMode:Landroid/view/ActionMode;

    return-object p1
.end method

.method static synthetic access$100(Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment;)Landroid/widget/ListAdapter;
    .locals 1
    .param p0, "x0"    # Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment;

    .prologue
    .line 15
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment;->adapter:Landroid/widget/ListAdapter;

    return-object v0
.end method


# virtual methods
.method public cancelActionModeOrContextMenu()V
    .locals 2
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .prologue
    .line 42
    .local p0, "this":Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment;, "Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment<TT;>;"
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-lt v0, v1, :cond_1

    .line 43
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment;->currentActionMode:Landroid/view/ActionMode;

    if-eqz v0, :cond_0

    .line 44
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment;->currentActionMode:Landroid/view/ActionMode;

    invoke-virtual {v0}, Landroid/view/ActionMode;->finish()V

    .line 48
    :cond_0
    :goto_0
    return-void

    .line 46
    :cond_1
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentActivity;->closeContextMenu()V

    goto :goto_0
.end method

.method protected enableActionModeOrContextMenu()V
    .locals 2
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .prologue
    .line 55
    .local p0, "this":Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment;, "Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment<TT;>;"
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-lt v0, v1, :cond_0

    .line 56
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment;->getListView()Landroid/widget/ListView;

    move-result-object v0

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setChoiceMode(I)V

    .line 57
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment;->getListView()Landroid/widget/ListView;

    move-result-object v0

    new-instance v1, Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment$MyMultiChoiceModeListener;

    invoke-direct {v1, p0}, Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment$MyMultiChoiceModeListener;-><init>(Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setMultiChoiceModeListener(Landroid/widget/AbsListView$MultiChoiceModeListener;)V

    .line 61
    :goto_0
    return-void

    .line 59
    :cond_0
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment;->getListView()Landroid/widget/ListView;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment;->registerForContextMenu(Landroid/view/View;)V

    goto :goto_0
.end method

.method protected getActionModeOrContextMenuResId()I
    .locals 1

    .prologue
    .line 156
    .local p0, "this":Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment;, "Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment<TT;>;"
    const/4 v0, 0x0

    return v0
.end method

.method protected onActionModeActive(Z)V
    .locals 0
    .param p1, "active"    # Z

    .prologue
    .line 122
    .local p0, "this":Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment;, "Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment<TT;>;"
    return-void
.end method

.method protected onActionModeItemsCheckedCountChanged(Landroid/view/ActionMode;I)V
    .locals 0
    .param p1, "mode"    # Landroid/view/ActionMode;
    .param p2, "checkedItemCount"    # I
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .prologue
    .line 161
    .local p0, "this":Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment;, "Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment<TT;>;"
    return-void
.end method

.method protected onActionModeOrContextMenuItemClicked(ILjava/lang/Object;IIZ)Z
    .locals 1
    .param p1, "menuItemId"    # I
    .param p3, "listItemPosition"    # I
    .param p4, "checkedItemsCount"    # I
    .param p5, "isForLastItem"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITT;IIZ)Z"
        }
    .end annotation

    .prologue
    .line 163
    .local p0, "this":Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment;, "Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment<TT;>;"
    .local p2, "checkedItem":Ljava/lang/Object;, "TT;"
    const/4 v0, 0x0

    return v0
.end method

.method public onContextItemSelected(Landroid/view/MenuItem;)Z
    .locals 8
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .local p0, "this":Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment;, "Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment<TT;>;"
    const/4 v7, -0x1

    .line 141
    iget v0, p0, Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment;->contextMenuSelectenItemPosition:I

    if-le v0, v7, :cond_0

    .line 143
    :try_start_0
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment;->adapter:Landroid/widget/ListAdapter;

    iget v2, p0, Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment;->contextMenuSelectenItemPosition:I

    invoke-interface {v0, v2}, Landroid/widget/ListAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v2

    iget v3, p0, Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment;->contextMenuSelectenItemPosition:I

    const/4 v4, 0x1

    const/4 v5, 0x1

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment;->onActionModeOrContextMenuItemClicked(ILjava/lang/Object;IIZ)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    .line 149
    :goto_0
    return v0

    .line 144
    :catch_0
    move-exception v6

    .line 145
    .local v6, "e":Ljava/lang/Exception;
    invoke-virtual {v6}, Ljava/lang/Exception;->printStackTrace()V

    .line 147
    iput v7, p0, Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment;->contextMenuSelectenItemPosition:I

    .line 149
    .end local v6    # "e":Ljava/lang/Exception;
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onCreateContextMenu(Landroid/view/ContextMenu;Landroid/view/View;Landroid/view/ContextMenu$ContextMenuInfo;)V
    .locals 3
    .param p1, "menu"    # Landroid/view/ContextMenu;
    .param p2, "v"    # Landroid/view/View;
    .param p3, "menuInfo"    # Landroid/view/ContextMenu$ContextMenuInfo;

    .prologue
    .line 126
    .local p0, "this":Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment;, "Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment<TT;>;"
    move-object v0, p3

    check-cast v0, Landroid/widget/AdapterView$AdapterContextMenuInfo;

    .line 128
    .local v0, "info":Landroid/widget/AdapterView$AdapterContextMenuInfo;
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment;->getActionModeOrContextMenuResId()I

    move-result v1

    .line 129
    .local v1, "menuResId":I
    if-lez v1, :cond_0

    .line 130
    iget v2, v0, Landroid/widget/AdapterView$AdapterContextMenuInfo;->position:I

    iput v2, p0, Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment;->contextMenuSelectenItemPosition:I

    .line 131
    invoke-virtual {p0}, Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/support/v4/app/FragmentActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v2

    invoke-virtual {v2, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 132
    invoke-super {p0, p1, p2, p3}, Landroid/support/v4/app/ListFragment;->onCreateContextMenu(Landroid/view/ContextMenu;Landroid/view/View;Landroid/view/ContextMenu$ContextMenuInfo;)V

    .line 136
    :goto_0
    return-void

    .line 134
    :cond_0
    const/4 v2, -0x1

    iput v2, p0, Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment;->contextMenuSelectenItemPosition:I

    goto :goto_0
.end method

.method public onListItemClick(Landroid/widget/ListView;Landroid/view/View;IJ)V
    .locals 1
    .param p1, "l"    # Landroid/widget/ListView;
    .param p2, "v"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "id"    # J

    .prologue
    .line 26
    .local p0, "this":Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment;, "Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment<TT;>;"
    :try_start_0
    iget-object v0, p0, Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment;->adapter:Landroid/widget/ListAdapter;

    invoke-interface {v0, p3}, Landroid/widget/ListAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment;->onListItemClick(Landroid/widget/ListView;Landroid/view/View;ILjava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 29
    :goto_0
    return-void

    .line 27
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public onListItemClick(Landroid/widget/ListView;Landroid/view/View;ILjava/lang/Object;)V
    .locals 0
    .param p1, "l"    # Landroid/widget/ListView;
    .param p2, "v"    # Landroid/view/View;
    .param p3, "position"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/ListView;",
            "Landroid/view/View;",
            "ITT;)V"
        }
    .end annotation

    .prologue
    .line 32
    .local p0, "this":Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment;, "Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment<TT;>;"
    .local p4, "item":Ljava/lang/Object;, "TT;"
    return-void
.end method

.method public setListAdapter(Landroid/widget/ListAdapter;)V
    .locals 0
    .param p1, "adapter"    # Landroid/widget/ListAdapter;

    .prologue
    .line 36
    .local p0, "this":Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment;, "Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment<TT;>;"
    iput-object p1, p0, Lcom/mobnetic/coinguardian/fragment/generic/ActionModeListFragment;->adapter:Landroid/widget/ListAdapter;

    .line 37
    invoke-super {p0, p1}, Landroid/support/v4/app/ListFragment;->setListAdapter(Landroid/widget/ListAdapter;)V

    .line 38
    return-void
.end method
